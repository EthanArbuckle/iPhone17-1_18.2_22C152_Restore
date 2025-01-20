@interface SXLinkAction
- (NSString)type;
- (NSURL)URL;
- (SXJSONDictionary)analytics;
- (SXLinkAction)initWithURL:(id)a3;
- (SXLinkAction)initWithURL:(id)a3 analytics:(id)a4;
@end

@implementation SXLinkAction

- (SXLinkAction)initWithURL:(id)a3
{
  return [(SXLinkAction *)self initWithURL:a3 analytics:0];
}

- (SXLinkAction)initWithURL:(id)a3 analytics:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXLinkAction;
  v9 = [(SXLinkAction *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_URL, a3);
    objc_storeStrong((id *)&v10->_analytics, a4);
  }

  return v10;
}

- (NSString)type
{
  return (NSString *)@"link";
}

- (NSURL)URL
{
  return self->_URL;
}

- (SXJSONDictionary)analytics
{
  return self->_analytics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end