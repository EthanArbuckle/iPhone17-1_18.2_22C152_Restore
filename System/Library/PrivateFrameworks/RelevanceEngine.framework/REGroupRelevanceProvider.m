@interface REGroupRelevanceProvider
+ (id)relevanceSimulatorID;
- (BOOL)isEqual:(id)a3;
- (NSString)groupIdentifier;
- (REGroupRelevanceProvider)initWithDictionary:(id)a3;
- (REGroupRelevanceProvider)initWithGroupIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryEncoding;
- (unint64_t)_hash;
@end

@implementation REGroupRelevanceProvider

- (REGroupRelevanceProvider)initWithGroupIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REGroupRelevanceProvider;
  v5 = [(RERelevanceProvider *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v6;
  }
  return v5;
}

+ (id)relevanceSimulatorID
{
  return @"group";
}

- (REGroupRelevanceProvider)initWithDictionary:(id)a3
{
  uint64_t v4 = [a3 objectForKeyedSubscript:@"group_name"];
  v5 = (void *)v4;
  uint64_t v6 = &stru_26CFA57D0;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  v7 = v6;

  v8 = [(REGroupRelevanceProvider *)self initWithGroupIdentifier:v7];
  return v8;
}

- (id)dictionaryEncoding
{
  v6[1] = *MEMORY[0x263EF8340];
  groupIdentifier = self->_groupIdentifier;
  v5 = @"group_name";
  v6[0] = groupIdentifier;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)REGroupRelevanceProvider;
  uint64_t v4 = [(RERelevanceProvider *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 4, self->_groupIdentifier);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (REGroupRelevanceProvider *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)REGroupRelevanceProvider;
    if ([(RERelevanceProvider *)&v11 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      groupIdentifier = self->_groupIdentifier;
      objc_super v6 = v4->_groupIdentifier;
      v7 = groupIdentifier;
      v8 = v7;
      if (v7 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = [(NSString *)v7 isEqual:v6];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)_hash
{
  return [(NSString *)self->_groupIdentifier hash];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)REGroupRelevanceProvider;
  v3 = [(REGroupRelevanceProvider *)&v6 description];
  uint64_t v4 = [v3 stringByAppendingFormat:@" groupIdentifier=%@", self->_groupIdentifier];

  return v4;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void).cxx_destruct
{
}

@end