@interface SSVMediaSocialPostArtist
- (NSString)identifier;
- (NSString)name;
- (SSVMediaSocialPostArtist)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
@end

@implementation SSVMediaSocialPostArtist

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setIdentifier:self->_identifier];
  [v4 setName:self->_name];
  return v4;
}

- (SSVMediaSocialPostArtist)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v12.receiver = self;
    v12.super_class = (Class)SSVMediaSocialPostArtist;
    v6 = [(SSVMediaSocialPostArtist *)&v12 init];
    if (v6)
    {
      objc_opt_class();
      CFArrayRef v8 = SSXPCDictionaryCopyCFObjectWithClass(v5, "0");
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v8;

      objc_opt_class();
      CFArrayRef v10 = SSXPCDictionaryCopyCFObjectWithClass(v5, "1");
      name = v6->_name;
      v6->_name = (NSString *)v10;
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
  SSXPCDictionarySetObject(v3, "0", self->_identifier);
  SSXPCDictionarySetObject(v3, "1", self->_name);
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end