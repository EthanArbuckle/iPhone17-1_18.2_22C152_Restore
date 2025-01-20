@interface PGGraphNamedLocationNode
+ (id)filter;
+ (id)filterBySettingNameNotEmptyPropertyOnFilter:(id)a3;
+ (id)filterWithName:(id)a3;
+ (id)filterWithUUID:(id)a3;
+ (void)setName:(id)a3 onLocationNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5;
+ (void)setUUID:(id)a3 onLocationNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5;
- (BOOL)hasProperties:(id)a3;
- (MANodeFilter)uniquelyIdentifyingFilter;
- (NSString)UUID;
- (NSString)name;
- (PGGraphNamedLocationNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphNamedLocationNode)initWithName:(id)a3 uuid:(id)a4;
- (id)description;
- (id)featureIdentifier;
- (id)propertyDictionary;
- (unsigned)domain;
@end

@implementation PGGraphNamedLocationNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)UUID
{
  return self->_uuid;
}

- (NSString)name
{
  return self->_name;
}

- (id)featureIdentifier
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PGGraphNamedLocationNode *)self UUID];
  v7 = [(PGGraphNamedLocationNode *)self name];
  v8 = [v3 stringWithFormat:@"%@|%@|%@", v5, v6, v7];

  return v8;
}

- (MANodeFilter)uniquelyIdentifyingFilter
{
  v3 = objc_opt_class();
  uuid = self->_uuid;
  return (MANodeFilter *)[v3 filterWithUUID:uuid];
}

- (unsigned)domain
{
  return 200;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@ (%@)", v5, self->_name];

  return v6;
}

- (id)propertyDictionary
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  [v3 setObject:self->_name forKeyedSubscript:@"name"];
  [v3 setObject:self->_uuid forKeyedSubscript:@"id"];
  return v3;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"name"];
    v7 = v6;
    BOOL v9 = 0;
    if (!v6 || [v6 isEqual:self->_name])
    {

      v8 = [v5 objectForKeyedSubscript:@"id"];
      v7 = v8;
      if (!v8 || [v8 isEqual:self->_uuid]) {
        BOOL v9 = 1;
      }
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (PGGraphNamedLocationNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6 = a5;
  v7 = [v6 objectForKeyedSubscript:@"name"];
  v8 = [v6 objectForKeyedSubscript:@"id"];

  BOOL v9 = [(PGGraphNamedLocationNode *)self initWithName:v7 uuid:v8];
  return v9;
}

- (PGGraphNamedLocationNode)initWithName:(id)a3 uuid:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGGraphNamedLocationNode;
  BOOL v9 = [(PGGraphLocationNode *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_uuid, a4);
  }

  return v10;
}

+ (id)filterBySettingNameNotEmptyPropertyOnFilter:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  BOOL v9 = @"name";
  v3 = (objc_class *)MEMORY[0x1E4F71E28];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithComparator:2 value:&stru_1F283BC78];
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = [v4 filterBySettingProperties:v6];

  return v7;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:0 domain:200];
  return v2;
}

+ (id)filterWithUUID:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 filter];
  id v6 = objc_alloc(MEMORY[0x1E4F71F00]);
  id v7 = [v5 labels];
  v11 = @"id";
  v12[0] = v4;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  BOOL v9 = (void *)[v6 initWithLabels:v7 domain:200 properties:v8];
  return v9;
}

+ (id)filterWithName:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 filter];
  id v6 = objc_alloc(MEMORY[0x1E4F71F00]);
  id v7 = [v5 labels];
  v11 = @"name";
  v12[0] = v4;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  BOOL v9 = (void *)[v6 initWithLabels:v7 domain:200 properties:v8];
  return v9;
}

+ (void)setUUID:(id)a3 onLocationNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
}

+ (void)setName:(id)a3 onLocationNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
}

@end