@interface SUUIJSMediaSocialAuthor
- (NSArray)permissions;
- (NSDictionary)storePlatformData;
- (NSString)dsId;
- (NSString)entityIdentifier;
- (NSString)entityType;
- (NSString)name;
- (SUUIJSMediaSocialAuthor)initWithSUUIMediaSocialAuthor:(id)a3;
@end

@implementation SUUIJSMediaSocialAuthor

- (SUUIJSMediaSocialAuthor)initWithSUUIMediaSocialAuthor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIJSMediaSocialAuthor;
  v6 = [(SUUIJSMediaSocialAuthor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mediaSocialAuthor, a3);
  }

  return v7;
}

- (NSString)dsId
{
  return [(SUUIMediaSocialAuthor *)self->_mediaSocialAuthor dsid];
}

- (NSString)entityIdentifier
{
  return [(SUUIMediaSocialAuthor *)self->_mediaSocialAuthor identifier];
}

- (NSString)entityType
{
  return [(SUUIMediaSocialAuthor *)self->_mediaSocialAuthor authorType];
}

- (NSString)name
{
  return [(SUUIMediaSocialAuthor *)self->_mediaSocialAuthor name];
}

- (NSArray)permissions
{
  return [(SUUIMediaSocialAuthor *)self->_mediaSocialAuthor permissions];
}

- (NSDictionary)storePlatformData
{
  return [(SUUIMediaSocialAuthor *)self->_mediaSocialAuthor storePlatformData];
}

- (void).cxx_destruct
{
}

@end