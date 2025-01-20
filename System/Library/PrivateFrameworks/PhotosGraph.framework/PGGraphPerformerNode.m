@interface PGGraphPerformerNode
+ (id)filter;
- (BOOL)hasProperties:(id)a3;
- (NSString)description;
- (NSString)featureIdentifier;
- (NSString)name;
- (NSString)uuid;
- (PGGraphPerformerNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphPerformerNode)initWithName:(id)a3 uuid:(id)a4;
- (PGGraphPerformerNodeCollection)collection;
- (PPNamedEntity)pg_namedEntity;
- (id)label;
- (id)propertyDictionary;
- (unint64_t)featureType;
- (unsigned)domain;
@end

@implementation PGGraphPerformerNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)featureIdentifier
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@|%@|%@", v5, self->_name, self->_uuid];

  return (NSString *)v6;
}

- (unint64_t)featureType
{
  return 26;
}

- (PGGraphPerformerNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphPerformerNodeCollection alloc] initWithNode:self];
  return v2;
}

- (unsigned)domain
{
  return 900;
}

- (id)label
{
  v2 = @"Performer";
  return @"Performer";
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"PGGraphPerformerNode (%@, %@)", self->_name, self->_uuid];
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

- (PGGraphPerformerNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6 = a5;
  v7 = [v6 objectForKeyedSubscript:@"name"];
  v8 = [v6 objectForKeyedSubscript:@"id"];

  BOOL v9 = [(PGGraphPerformerNode *)self initWithName:v7 uuid:v8];
  return v9;
}

- (PGGraphPerformerNode)initWithName:(id)a3 uuid:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGGraphPerformerNode;
  BOOL v9 = [(PGGraphNode *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_uuid, a4);
  }

  return v10;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Performer" domain:900];
  return v2;
}

- (PPNamedEntity)pg_namedEntity
{
  v3 = [(PGGraphPerformerNode *)self name];
  id v4 = v3;
  if (v3 && [v3 length])
  {
    if ([(PGGraphPerformerNode *)self domain] == 900)
    {
      v5 = [(PGGraphPerformerNode *)self label];
      int v6 = [v5 isEqualToString:@"Performer"];

      if (v6) {
        uint64_t v7 = 7;
      }
      else {
        uint64_t v7 = 2;
      }
    }
    else
    {
      uint64_t v7 = 2;
    }
    BOOL v9 = [MEMORY[0x1E4F1CA20] currentLocale];
    v10 = [v9 localeIdentifier];

    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F89E90]) initWithName:v4 category:v7 language:v10];
  }
  else
  {
    id v8 = 0;
  }

  return (PPNamedEntity *)v8;
}

@end