@interface PGGraphContactNodeCollection
+ (Class)nodeClass;
+ (id)contactNodeForContactIdentifier:(id)a3 inGraph:(id)a4;
+ (id)contactNodesForContactIdentifiers:(id)a3 inGraph:(id)a4;
@end

@implementation PGGraphContactNodeCollection

+ (id)contactNodesForContactIdentifiers:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  v7 = +[PGGraphContactNode filterWithContactIdentifiers:a3];
  v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (id)contactNodeForContactIdentifier:(id)a3 inGraph:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:&v13 count:1];
  v10 = +[PGGraphContactNode filterWithContactIdentifiers:](PGGraphContactNode, "filterWithContactIdentifiers:", v9, v13, v14);

  v11 = [a1 nodesMatchingFilter:v10 inGraph:v7];

  return v11;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end