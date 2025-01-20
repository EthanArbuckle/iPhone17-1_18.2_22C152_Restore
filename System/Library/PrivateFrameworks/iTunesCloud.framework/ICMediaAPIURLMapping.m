@interface ICMediaAPIURLMapping
- (ICMediaAPIURLMapping)initWithResponseDictionary:(id)a3;
- (NSString)featureName;
- (NSString)pattern;
@end

@implementation ICMediaAPIURLMapping

- (void).cxx_destruct
{
}

- (NSString)pattern
{
  return (NSString *)[(NSDictionary *)self->_responseDictionary ic_stringValueForKey:@"pattern"];
}

- (NSString)featureName
{
  return (NSString *)[(NSDictionary *)self->_responseDictionary ic_stringValueForKey:@"feature"];
}

- (ICMediaAPIURLMapping)initWithResponseDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICMediaAPIURLMapping;
  v5 = [(ICMediaAPIURLMapping *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v6;
  }
  return v5;
}

@end