@interface SXWebCalAction
- (NSString)type;
- (NSURL)URL;
- (SXJSONDictionary)analytics;
- (SXWebCalAction)initWithURL:(id)a3;
@end

@implementation SXWebCalAction

- (SXWebCalAction)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXWebCalAction;
  v6 = [(SXWebCalAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_URL, a3);
  }

  return v7;
}

- (NSString)type
{
  return (NSString *)@"webcal";
}

- (SXJSONDictionary)analytics
{
  return self->analytics;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->analytics, 0);
}

@end