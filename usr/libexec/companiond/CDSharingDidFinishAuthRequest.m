@interface CDSharingDidFinishAuthRequest
- (CDSharingDidFinishAuthRequest)initWithRapportDictionary:(id)a3;
- (NSError)error;
- (NSString)description;
- (id)makeRapportDictionary;
- (void)setError:(id)a3;
@end

@implementation CDSharingDidFinishAuthRequest

- (CDSharingDidFinishAuthRequest)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CDSharingDidFinishAuthRequest;
  v5 = [(CDSharingDidFinishAuthRequest *)&v10 init];
  if (v5)
  {
    v6 = self;
    uint64_t v7 = sub_10001CD14(v4, @"authError", (uint64_t)v6);
    error = v5->_error;
    v5->_error = (NSError *)v7;
  }
  return v5;
}

- (id)makeRapportDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = sub_10001D014((uint64_t)self->_error);
  [v3 setObject:v4 forKeyedSubscript:@"authError"];

  id v5 = [v3 copy];

  return v5;
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendObject:self->_error withName:@"error" skipIfNil:1];
  id v5 = [v3 build];

  return (NSString *)v5;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end