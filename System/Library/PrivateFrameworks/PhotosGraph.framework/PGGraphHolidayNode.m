@interface PGGraphHolidayNode
+ (MARelation)datesOfCelebration;
+ (id)filter;
+ (id)holidayNodeFilterWithCategory:(unint64_t)a3;
+ (id)holidayNodeFilterWithNames:(id)a3;
+ (id)localizedNameForName:(id)a3;
- (BOOL)hasProperties:(id)a3;
- (NSString)description;
- (NSString)featureIdentifier;
- (NSString)localizedName;
- (NSString)name;
- (PGGraphHolidayNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphHolidayNode)initWithName:(id)a3 category:(unint64_t)a4;
- (PGGraphHolidayNodeCollection)collection;
- (id)label;
- (id)propertyDictionary;
- (id)propertyForKey:(id)a3;
- (unint64_t)category;
- (unint64_t)featureType;
- (unint64_t)numberOfMomentNodes;
- (unsigned)domain;
- (void)enumerateCelebratingMomentNodesUsingBlock:(id)a3;
- (void)setCategory:(unint64_t)a3;
@end

@implementation PGGraphHolidayNode

- (void).cxx_destruct
{
}

- (void)setCategory:(unint64_t)a3
{
  *((unsigned char *)self + 32) = a3;
}

- (unint64_t)category
{
  return *((unsigned __int8 *)self + 32);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)featureIdentifier
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PGGraphHolidayNode *)self name];
  v7 = [v3 stringWithFormat:@"%@|%@|%lu", v5, v6, -[PGGraphHolidayNode category](self, "category")];

  return (NSString *)v7;
}

- (unint64_t)featureType
{
  return 15;
}

- (PGGraphHolidayNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphHolidayNodeCollection alloc] initWithNode:self];
  return v2;
}

- (NSString)localizedName
{
  v2 = [(PGGraphHolidayNode *)self name];
  v3 = [(id)objc_opt_class() localizedNameForName:v2];

  return (NSString *)v3;
}

- (void)enumerateCelebratingMomentNodesUsingBlock:(id)a3
{
}

- (unsigned)domain
{
  return 401;
}

- (id)label
{
  v2 = @"Holiday";
  return @"Holiday";
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"PGGraphHolidayNode (%@, %d)", self->_name, *((unsigned __int8 *)self + 32)];
}

- (id)propertyForKey:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"name"])
  {
    v5 = self->_name;
LABEL_5:
    v6 = v5;
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"holc"])
  {
    v5 = [NSNumber numberWithUnsignedInteger:*((unsigned __int8 *)self + 32)];
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unsupported property '%@' accessed on PGGraphHolidayNode.", (uint8_t *)&v8, 0xCu);
  }
  v6 = 0;
LABEL_9:

  return v6;
}

- (id)propertyDictionary
{
  v7[2] = *MEMORY[0x1E4F143B8];
  name = self->_name;
  v6[0] = @"name";
  v6[1] = @"holc";
  v7[0] = name;
  v3 = [NSNumber numberWithUnsignedInteger:*((unsigned __int8 *)self + 32)];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
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

      int v8 = [v5 objectForKeyedSubscript:@"holc"];
      v7 = v8;
      if (!v8 || [v8 unsignedIntegerValue] == *((unsigned __int8 *)self + 32)) {
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

- (PGGraphHolidayNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6 = a5;
  v7 = [v6 objectForKeyedSubscript:@"name"];
  int v8 = [v6 objectForKeyedSubscript:@"holc"];

  uint64_t v9 = [v8 unsignedIntegerValue];
  uint64_t v10 = [(PGGraphHolidayNode *)self initWithName:v7 category:v9];

  return v10;
}

- (PGGraphHolidayNode)initWithName:(id)a3 category:(unint64_t)a4
{
  char v4 = a4;
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphHolidayNode;
  int v8 = [(PGGraphNode *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    *((unsigned char *)v9 + 32) = v4;
  }

  return v9;
}

- (unint64_t)numberOfMomentNodes
{
  return [(MANode *)self countOfEdgesWithLabel:@"CELEBRATING" domain:401];
}

+ (id)holidayNodeFilterWithNames:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)MEMORY[0x1E4F71F00];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v9 = @"name";
  v10[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = (void *)[v5 initWithLabel:@"Holiday" domain:401 properties:v6];
  return v7;
}

+ (id)holidayNodeFilterWithCategory:(unint64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F71F00]);
  uint64_t v9 = @"holc";
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = (void *)[v4 initWithLabel:@"Holiday" domain:401 properties:v6];

  return v7;
}

+ (id)localizedNameForName:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = [MEMORY[0x1E4F76CA8] localizedNameForName:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (MARelation)datesOfCelebration
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  id v3 = +[PGGraphCelebratingEdge filter];
  id v4 = [v3 inRelation];
  v14[0] = v4;
  id v5 = +[PGGraphMomentNode filter];
  id v6 = [v5 relation];
  v14[1] = v6;
  id v7 = +[PGGraphDateEdge filter];
  int v8 = [v7 outRelation];
  v14[2] = v8;
  uint64_t v9 = +[PGGraphDateNode filter];
  uint64_t v10 = [v9 relation];
  v14[3] = v10;
  objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
  v12 = [v2 chain:v11];

  return (MARelation *)v12;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Holiday" domain:401];
  return v2;
}

@end