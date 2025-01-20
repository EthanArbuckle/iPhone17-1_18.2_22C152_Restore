@interface REMTTHashtag
+ (BOOL)attributeValue:(id)a3 hasEqualHashtagObjectIdentifierIn:(id)a4;
+ (id)attributeFromHashtag:(id)a3;
+ (id)attributeName;
- (NSString)objectIdentifier;
- (REMTTHashtag)initWithObjectIdentifier:(id)a3;
- (id)description;
@end

@implementation REMTTHashtag

- (REMTTHashtag)initWithObjectIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMTTHashtag;
  v6 = [(REMTTHashtag *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_objectIdentifier, a3);
  }

  return v7;
}

+ (id)attributeName
{
  return @"_TTREMHashtag";
}

+ (id)attributeFromHashtag:(id)a3
{
  id v3 = a3;
  v4 = [REMTTHashtag alloc];
  id v5 = [v3 objectIdentifier];

  v6 = [(REMTTHashtag *)v4 initWithObjectIdentifier:v5];

  return v6;
}

+ (BOOL)attributeValue:(id)a3 hasEqualHashtagObjectIdentifierIn:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  v8 = REMDynamicCast(v7, (uint64_t)v6);

  if (v8)
  {
    objc_super v9 = [v8 objectIdentifier];
    char v10 = [v5 containsObject:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(REMTTHashtag *)self objectIdentifier];
  id v6 = [v3 stringWithFormat:@"<%@: %p objectIdentifier: %@>", v4, self, v5];

  return v6;
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (void).cxx_destruct
{
}

@end