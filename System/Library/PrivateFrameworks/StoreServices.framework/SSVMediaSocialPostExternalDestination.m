@interface SSVMediaSocialPostExternalDestination
- (NSString)accessToken;
- (NSString)pageAccessToken;
- (NSString)pageIdentifier;
- (NSString)serviceIdentifier;
- (SSVMediaSocialPostExternalDestination)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (void)setAccessToken:(id)a3;
- (void)setPageAccessToken:(id)a3;
- (void)setPageIdentifier:(id)a3;
- (void)setServiceIdentifier:(id)a3;
@end

@implementation SSVMediaSocialPostExternalDestination

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setAccessToken:self->_accessToken];
  [v4 setPageAccessToken:self->_pageAccessToken];
  [v4 setPageIdentifier:self->_pageIdentifier];
  [v4 setServiceIdentifier:self->_serviceIdentifier];
  return v4;
}

- (SSVMediaSocialPostExternalDestination)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v6 = [(SSVMediaSocialPostExternalDestination *)self init];
    if (!v6) {
      goto LABEL_5;
    }
    objc_opt_class();
    CFArrayRef v8 = SSXPCDictionaryCopyCFObjectWithClass(v5, "0");
    accessToken = v6->_accessToken;
    v6->_accessToken = (NSString *)v8;

    objc_opt_class();
    CFArrayRef v10 = SSXPCDictionaryCopyCFObjectWithClass(v5, "1");
    pageAccessToken = v6->_pageAccessToken;
    v6->_pageAccessToken = (NSString *)v10;

    objc_opt_class();
    CFArrayRef v12 = SSXPCDictionaryCopyCFObjectWithClass(v5, "2");
    pageIdentifier = v6->_pageIdentifier;
    v6->_pageIdentifier = (NSString *)v12;

    objc_opt_class();
    CFArrayRef v14 = SSXPCDictionaryCopyCFObjectWithClass(v5, "3");
    self = (SSVMediaSocialPostExternalDestination *)v6->_serviceIdentifier;
    v6->_serviceIdentifier = (NSString *)v14;
  }
  else
  {
    v6 = 0;
  }

LABEL_5:
  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_accessToken);
  SSXPCDictionarySetObject(v3, "1", self->_pageAccessToken);
  SSXPCDictionarySetObject(v3, "2", self->_pageIdentifier);
  SSXPCDictionarySetObject(v3, "3", self->_serviceIdentifier);
  return v3;
}

- (NSString)accessToken
{
  return self->_accessToken;
}

- (void)setAccessToken:(id)a3
{
}

- (NSString)pageAccessToken
{
  return self->_pageAccessToken;
}

- (void)setPageAccessToken:(id)a3
{
}

- (NSString)pageIdentifier
{
  return self->_pageIdentifier;
}

- (void)setPageIdentifier:(id)a3
{
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_pageIdentifier, 0);
  objc_storeStrong((id *)&self->_pageAccessToken, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
}

@end