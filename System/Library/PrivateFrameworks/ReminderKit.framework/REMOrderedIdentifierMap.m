@interface REMOrderedIdentifierMap
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)orderedIdentifiers;
- (REMOrderedIdentifierMap)init;
- (REMOrderedIdentifierMap)initWithCoder:(id)a3;
- (REMOrderedIdentifierMap)initWithOrderedIdentifiers:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setOrderedIdentifiers:(id)a3;
@end

@implementation REMOrderedIdentifierMap

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMOrderedIdentifierMap)init
{
  v3 = [MEMORY[0x1E4F1C978] array];
  v4 = [(REMOrderedIdentifierMap *)self initWithOrderedIdentifiers:v3];

  return v4;
}

- (REMOrderedIdentifierMap)initWithOrderedIdentifiers:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REMOrderedIdentifierMap;
  v5 = [(REMOrderedIdentifierMap *)&v8 init];
  v6 = v5;
  if (v5) {
    [(REMOrderedIdentifierMap *)v5 setOrderedIdentifiers:v4];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMOrderedIdentifierMap *)self orderedIdentifiers];
  [v4 encodeObject:v5 forKey:@"orderedIdentifiers"];
}

- (REMOrderedIdentifierMap)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"orderedIdentifiers"];

  v6 = [(REMOrderedIdentifierMap *)self initWithOrderedIdentifiers:v5];
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [REMOrderedIdentifierMap alloc];
  v6 = [(REMOrderedIdentifierMap *)self orderedIdentifiers];
  v7 = (void *)[v6 copyWithZone:a3];
  objc_super v8 = [(REMOrderedIdentifierMap *)v5 initWithOrderedIdentifiers:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMOrderedIdentifierMap *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(REMOrderedIdentifierMap *)self orderedIdentifiers];
      v6 = [(REMOrderedIdentifierMap *)v4 orderedIdentifiers];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (NSArray)orderedIdentifiers
{
  return self->_orderedIdentifiers;
}

- (void)setOrderedIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end