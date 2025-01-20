@interface SSVMediaSocialPostItem
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (NSString)type;
- (SSVMediaSocialPostItem)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (unint64_t)hash;
- (void)setIdentifier:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SSVMediaSocialPostItem

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setIdentifier:self->_identifier];
  [v4 setType:self->_type];
  return v4;
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SSVMediaSocialPostItem;
  v4 = [(SSVMediaSocialPostItem *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@: [ID: %@, Type: %@]", v4, self->_identifier, self->_type];

  return (NSString *)v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    objc_super v7 = [(SSVMediaSocialPostItem *)self identifier];
    v8 = [v4 identifier];
    char v6 = [v7 isEqualToString:v8];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (SSVMediaSocialPostItem)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v12.receiver = self;
    v12.super_class = (Class)SSVMediaSocialPostItem;
    char v6 = [(SSVMediaSocialPostItem *)&v12 init];
    if (v6)
    {
      CFArrayRef v8 = SSXPCDictionaryCopyCFObject(v5, "0");
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v8;

      CFArrayRef v10 = SSXPCDictionaryCopyCFObject(v5, "1");
      type = v6->_type;
      v6->_type = (NSString *)v10;
    }
  }
  else
  {

    char v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_identifier);
  SSXPCDictionarySetObject(v3, "1", self->_type);
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end