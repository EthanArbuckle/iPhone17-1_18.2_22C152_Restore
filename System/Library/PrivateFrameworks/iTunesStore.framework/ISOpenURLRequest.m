@interface ISOpenURLRequest
+ (ISOpenURLRequest)openURLRequestWithURL:(id)a3;
- (BOOL)interruptsKeybagRefresh;
- (BOOL)isITunesStoreURL;
- (ISOpenURLRequest)init;
- (ISOpenURLRequest)initWithURL:(id)a3;
- (ISOpenURLRequest)initWithURLBagKey:(id)a3;
- (NSString)URLBagKey;
- (NSString)targetIdentifier;
- (NSURL)URL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setITunesStoreURL:(BOOL)a3;
- (void)setInterruptsKeybagRefresh:(BOOL)a3;
- (void)setTargetIdentifier:(id)a3;
- (void)setURL:(id)a3;
- (void)setURLBagKey:(id)a3;
@end

@implementation ISOpenURLRequest

- (ISOpenURLRequest)init
{
  return [(ISOpenURLRequest *)self initWithURL:0];
}

- (ISOpenURLRequest)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISOpenURLRequest;
  v6 = [(ISOpenURLRequest *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_isITunesStoreURL = 1;
    objc_storeStrong((id *)&v6->_url, a3);
  }

  return v7;
}

- (ISOpenURLRequest)initWithURLBagKey:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ISOpenURLRequest;
  id v5 = [(ISOpenURLRequest *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_isITunesStoreURL = 1;
    uint64_t v7 = [v4 copy];
    urlBagKey = v6->_urlBagKey;
    v6->_urlBagKey = (NSString *)v7;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(unsigned char *)(v5 + 40) = self->_interruptsKeybagRefresh;
  *(unsigned char *)(v5 + 8) = self->_isITunesStoreURL;
  uint64_t v6 = [(NSString *)self->_targetIdentifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSURL *)self->_url copyWithZone:a3];
  objc_super v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_urlBagKey copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  return (id)v5;
}

+ (ISOpenURLRequest)openURLRequestWithURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithURL:v4];

  return (ISOpenURLRequest *)v5;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)ISOpenURLRequest;
  id v4 = [(ISOpenURLRequest *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@: (%@, %@)", v4, self->_urlBagKey, self->_url];

  return v5;
}

- (BOOL)interruptsKeybagRefresh
{
  return self->_interruptsKeybagRefresh;
}

- (void)setInterruptsKeybagRefresh:(BOOL)a3
{
  self->_interruptsKeybagRefresh = a3;
}

- (BOOL)isITunesStoreURL
{
  return self->_isITunesStoreURL;
}

- (void)setITunesStoreURL:(BOOL)a3
{
  self->_isITunesStoreURL = a3;
}

- (NSString)targetIdentifier
{
  return self->_targetIdentifier;
}

- (void)setTargetIdentifier:(id)a3
{
}

- (NSURL)URL
{
  return self->_url;
}

- (void)setURL:(id)a3
{
}

- (NSString)URLBagKey
{
  return self->_urlBagKey;
}

- (void)setURLBagKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_urlBagKey, 0);

  objc_storeStrong((id *)&self->_targetIdentifier, 0);
}

@end