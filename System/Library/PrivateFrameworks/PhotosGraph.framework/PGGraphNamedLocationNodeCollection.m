@interface PGGraphNamedLocationNodeCollection
+ (Class)nodeClass;
+ (id)locationNodeWithName:(id)a3 inGraph:(id)a4;
+ (id)locationNodesWithCIDINames:(id)a3 inGraph:(id)a4;
- (NSArray)names;
@end

@implementation PGGraphNamedLocationNodeCollection

+ (id)locationNodesWithCIDINames:(id)a3 inGraph:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = +[PGGraphNamedLocationNode filter];
  v14 = @"name";
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F71E28]) initWithComparator:8 value:v7];

  v15[0] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v11 = [v8 filterBySettingProperties:v10];

  v12 = [a1 nodesMatchingFilter:v11 inGraph:v6];

  return v12;
}

+ (id)locationNodeWithName:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  id v7 = +[PGGraphNamedLocationNode filterWithName:a3];
  v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

- (NSArray)names
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__PGGraphNamedLocationNodeCollection_names__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"name" withBlock:v6];

  return (NSArray *)v4;
}

uint64_t __43__PGGraphNamedLocationNodeCollection_names__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

@end