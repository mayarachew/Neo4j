// Load Harry Potter Universe database

// This is an initialization script for the Harry Potter Universe graph.
// Run it only once.
// Have you run it twice? Use `MATCH (n) WHERE (n:Wizard OR n:Pet or n:House) DETACH DELETE n` to start over.

// Maybe you'll have to run the following line before the rest of the script
CREATE CONSTRAINT name FOR (wizard:Wizard) REQUIRE wizard.name IS UNIQUE

// Characters
CREATE (Harry:Wizard {name:"Harry Potter", born:2000})
CREATE (Hermione:Wizard {name:"Hermione Granger", born:2000}) 
CREATE (Ron:Wizard {name:"Ron Weasley", born:2000})
CREATE (Gina:Wizard {name:"Gina Weasley", born:2000})
CREATE (Snape:Wizard {name:"Severo Snape", born:2000})
CREATE (Dumbledor:Wizard {name:"Dumbledor", born:2000})
CREATE (Voldemort:Wizard {name:"Voldemort", born:2000})
CREATE (Lilian:Wizard {name:"Lílian Potter", born:2000})
CREATE (Tiago:Wizard {name:"Tiago Potter", born:2000})
CREATE (Luna:Wizard {name:"Luna Lovegood", born:2000})
CREATE (Cedric:Wizard {name:"Cedric Diggory", born:2000})

CREATE (Harry)-[:LOVES {type:"as a friend"}]->(Hermione),
       (Harry)-[:LOVES {type:"as a friend"}]->(Ron),
       (Harry)-[:LOVES {type:"more than a friend"}]->(Gina),
       (Hermione)-[:LOVES {type:"as a friend"}]->(Harry),
       (Hermione)-[:LOVES {type:"more than a friend"}]->(Ron),
       (Ron)-[:LOVES {type:"more than a friend"}]->(Hermione),  
       (Ron)-[:LOVES {type:"as a friend"}]->(Harry),         
       (Snape)-[:LOVES {type:"more than a friend"}]->(Lilian),
       (Lilian)-[:LOVES {type:"more than a friend"}]->(Tiago),
       (Tiago)-[:LOVES {type:"more than a friend"}]->(Lilian),    
       (Tiago)-[:LOVES {type:"as a father"}]->(Harry),    
       (Lilian)-[:LOVES {type:"as a mother"}]->(Harry)    

CREATE (Snape)-[:HATES]->(Tiago),
       (Tiago)-[:HATES]->(Snape),
       (Voldemort)-[:HATES]->(Harry)

CREATE (Dumbledor)-[:TEACHES]->(Harry),
       (Dumbledor)-[:TEACHES]->(Hermione),
       (Dumbledor)-[:TEACHES]->(Ron),
       (Dumbledor)-[:TEACHES]->(Gina)

// Houses
CREATE (Gryffindor:House {name:"Gryffindor", emblem:"Lion", qualities:["Courage", "Bravery", "Determination"]})
CREATE (Slytherin:House {name:"Slytherin", emblem:"Serpent", qualities:["Ambitious", "Shrewd", "Destined for greatness"]})
CREATE (Ravenclaw:House {name:"Ravenclaw", emblem:"Eagle", qualities:["Excellent wisdom", "Wit", "Skill for learning"]})
CREATE (Hufflepuff:House {name:"Hufflepuff", emblem:"Badger", qualities:["Strong moral compass", "Hard-working", "Loyalty"]})

CREATE (Harry)-[:BELONGS_TO]->(Gryffindor),
       (Hermione)-[:BELONGS_TO]->(Gryffindor),
       (Ron)-[:BELONGS_TO]->(Gryffindor),
       (Gina)-[:BELONGS_TO]->(Gryffindor),
       (Snape)-[:BELONGS_TO]->(Slytherin),
       (Dumbledor)-[:BELONGS_TO]->(Gryffindor),
       (Voldemort)-[:BELONGS_TO]->(Slytherin),
       (Lilian)-[:BELONGS_TO]->(Gryffindor),
       (Tiago)-[:BELONGS_TO]->(Gryffindor),
       (Luna)-[:BELONGS_TO]->(Ravenclaw),
       (Cedric)-[:BELONGS_TO]->(Hufflepuff)

// Pets
CREATE (Hedwig:Pet {name:"Hedwig"})
CREATE (Perebas:Pet {name:"Perebas"})

CREATE (Harry)-[:HAS_PET]->(Hedwig),
       (Ron)-[:HAS_PET]->(Perebas)

// Run the following line if you want to see the nodes and relations created
// RETURN *