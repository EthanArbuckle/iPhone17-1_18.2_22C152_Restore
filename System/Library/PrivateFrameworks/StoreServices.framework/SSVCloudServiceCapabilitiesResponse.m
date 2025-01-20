@interface SSVCloudServiceCapabilitiesResponse
- (BOOL)canSubscribeToMusicCatalog;
- (BOOL)supportsAddToCloudMusicLibrary;
- (BOOL)supportsMusicCatalogPlayback;
- (NSString)debugDescription;
- (NSString)description;
- (SSVCloudServiceCapabilitiesResponse)initWithXPCEncoding:(id)a3;
- (SSVSubscriptionStatus)subscriptionStatus;
- (id)_descriptionWithSubscriptionStatusDescriptorBlock:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (void)setCanSubscribeToMusicCatalog:(BOOL)a3;
- (void)setSubscriptionStatus:(id)a3;
- (void)setSupportsAddToCloudMusicLibrary:(BOOL)a3;
- (void)setSupportsMusicCatalogPlayback:(BOOL)a3;
@end

@implementation SSVCloudServiceCapabilitiesResponse

- (id)_descriptionWithSubscriptionStatusDescriptorBlock:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id v5 = objc_alloc(MEMORY[0x1E4F28E78]);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = (void *)[v5 initWithFormat:@"<%@: %p", v7, self];

  if (v4) {
    v4[2](v4, v8);
  }
  if (self->_supportsMusicCatalogPlayback) {
    [v8 appendString:@"; supportsMusicCatalogPlayback = YES"];
  }
  if (self->_supportsAddToCloudMusicLibrary) {
    [v8 appendString:@"; supportsAddToCloudMusicLibrary = YES"];
  }
  if (self->_canSubscribeToMusicCatalog) {
    [v8 appendString:@"; canSubscribeToMusicCatalog = YES"];
  }
  [v8 appendString:@">"];

  return v8;
}

- (NSString)description
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__SSVCloudServiceCapabilitiesResponse_description__block_invoke;
  v4[3] = &unk_1E5BA7F38;
  v4[4] = self;
  v2 = [(SSVCloudServiceCapabilitiesResponse *)self _descriptionWithSubscriptionStatusDescriptorBlock:v4];
  return (NSString *)v2;
}

void __50__SSVCloudServiceCapabilitiesResponse_description__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  id v7 = a2;
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    objc_msgSend(v7, "appendFormat:", @"; subscriptionStatus = <%@: %p>",
      v5,
      *(void *)(*(void *)(a1 + 32) + 16));

    v6 = (void *)v5;
  }
  else
  {
    [v7 appendFormat:@"; subscriptionStatus = %@", 0];
    v6 = v7;
  }
}

- (NSString)debugDescription
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__SSVCloudServiceCapabilitiesResponse_debugDescription__block_invoke;
  v4[3] = &unk_1E5BA7F38;
  v4[4] = self;
  v2 = [(SSVCloudServiceCapabilitiesResponse *)self _descriptionWithSubscriptionStatusDescriptorBlock:v4];
  return (NSString *)v2;
}

void __55__SSVCloudServiceCapabilitiesResponse_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = a2;
  id v4 = [v2 debugDescription];
  [v3 appendFormat:@"; subscriptionStatus = %@", v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(SSVSubscriptionStatus *)self->_subscriptionStatus copy];
  v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  *(unsigned char *)(v4 + 8) = self->_supportsMusicCatalogPlayback;
  *(unsigned char *)(v4 + 9) = self->_supportsAddToCloudMusicLibrary;
  *(unsigned char *)(v4 + 10) = self->_canSubscribeToMusicCatalog;
  return (id)v4;
}

- (SSVCloudServiceCapabilitiesResponse)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v12.receiver = self;
    v12.super_class = (Class)SSVCloudServiceCapabilitiesResponse;
    v6 = [(SSVCloudServiceCapabilitiesResponse *)&v12 init];
    if (v6)
    {
      v8 = [SSVSubscriptionStatus alloc];
      v9 = xpc_dictionary_get_dictionary(v5, "0");
      uint64_t v10 = [(SSVSubscriptionStatus *)v8 initWithXPCEncoding:v9];
      subscriptionStatus = v6->_subscriptionStatus;
      v6->_subscriptionStatus = (SSVSubscriptionStatus *)v10;

      v6->_supportsMusicCatalogPlayback = xpc_dictionary_get_BOOL(v5, "1");
      v6->_supportsAddToCloudMusicLibrary = xpc_dictionary_get_BOOL(v5, "2");
      v6->_canSubscribeToMusicCatalog = xpc_dictionary_get_BOOL(v5, "3");
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_subscriptionStatus);
  xpc_dictionary_set_BOOL(v3, "1", self->_supportsMusicCatalogPlayback);
  xpc_dictionary_set_BOOL(v3, "2", self->_supportsAddToCloudMusicLibrary);
  xpc_dictionary_set_BOOL(v3, "3", self->_canSubscribeToMusicCatalog);
  return v3;
}

- (SSVSubscriptionStatus)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (void)setSubscriptionStatus:(id)a3
{
}

- (BOOL)supportsMusicCatalogPlayback
{
  return self->_supportsMusicCatalogPlayback;
}

- (void)setSupportsMusicCatalogPlayback:(BOOL)a3
{
  self->_supportsMusicCatalogPlayback = a3;
}

- (BOOL)supportsAddToCloudMusicLibrary
{
  return self->_supportsAddToCloudMusicLibrary;
}

- (void)setSupportsAddToCloudMusicLibrary:(BOOL)a3
{
  self->_supportsAddToCloudMusicLibrary = a3;
}

- (BOOL)canSubscribeToMusicCatalog
{
  return self->_canSubscribeToMusicCatalog;
}

- (void)setCanSubscribeToMusicCatalog:(BOOL)a3
{
  self->_canSubscribeToMusicCatalog = a3;
}

- (void).cxx_destruct
{
}

@end