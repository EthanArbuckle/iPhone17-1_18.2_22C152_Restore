@interface TUIFeedData
+ (id)feedDataWithDictionary:(id)a3;
- (NSDictionary)dictionary;
- (TUIFeedData)initWithDictionary:(id)a3;
- (id)dataForKey:(id)a3;
@end

@implementation TUIFeedData

+ (id)feedDataWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = [[TUIFeedData alloc] initWithDictionary:v3];

  return v4;
}

- (TUIFeedData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIFeedData;
  v5 = [(TUIFeedData *)&v9 init];
  if (v5)
  {
    v6 = (NSDictionary *)[v4 copy];
    dictionary = v5->_dictionary;
    v5->_dictionary = v6;
  }
  return v5;
}

- (id)dataForKey:(id)a3
{
  return [(NSDictionary *)self->_dictionary objectForKey:a3];
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
}

@end