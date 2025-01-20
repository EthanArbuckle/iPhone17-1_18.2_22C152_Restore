@interface PSUIDeferredDeepLink
- (NSDictionary)resourceDictionary;
- (NSString)specifierID;
- (PSUIDeferredDeepLink)initWithSpecifierID:(id)a3 resourceDictionary:(id)a4 completion:(id)a5;
- (id)completion;
- (void)setCompletion:(id)a3;
- (void)setResourceDictionary:(id)a3;
- (void)setSpecifierID:(id)a3;
@end

@implementation PSUIDeferredDeepLink

- (PSUIDeferredDeepLink)initWithSpecifierID:(id)a3 resourceDictionary:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PSUIDeferredDeepLink;
  v11 = [(PSUIDeferredDeepLink *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(PSUIDeferredDeepLink *)v11 setSpecifierID:v8];
    [(PSUIDeferredDeepLink *)v12 setResourceDictionary:v9];
    [(PSUIDeferredDeepLink *)v12 setCompletion:v10];
  }

  return v12;
}

- (NSString)specifierID
{
  return self->_specifierID;
}

- (void)setSpecifierID:(id)a3
{
}

- (NSDictionary)resourceDictionary
{
  return self->_resourceDictionary;
}

- (void)setResourceDictionary:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_resourceDictionary, 0);
  objc_storeStrong((id *)&self->_specifierID, 0);
}

@end