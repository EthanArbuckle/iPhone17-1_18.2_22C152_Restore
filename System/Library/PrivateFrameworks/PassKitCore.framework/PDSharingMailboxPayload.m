@interface PDSharingMailboxPayload
- (NSData)data;
- (PDSharingMailboxPayload)init;
- (PDSharingMailboxPayload)initWithData:(id)a3 scheme:(unint64_t)a4;
- (PDSharingMailboxPayload)initWithDictionary:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)scheme;
- (void)setData:(id)a3;
- (void)setScheme:(unint64_t)a3;
@end

@implementation PDSharingMailboxPayload

- (PDSharingMailboxPayload)init
{
  return 0;
}

- (PDSharingMailboxPayload)initWithData:(id)a3 scheme:(unint64_t)a4
{
  id v7 = a3;
  v8 = 0;
  if (v7 && a4)
  {
    v12.receiver = self;
    v12.super_class = (Class)PDSharingMailboxPayload;
    v9 = [(PDSharingMailboxPayload *)&v12 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_data, a3);
      v10->_scheme = a4;
    }
    self = v10;
    v8 = self;
  }

  return v8;
}

- (PDSharingMailboxPayload)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 PKStringForKey:@"data"];
  if (v5)
  {
    id v6 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v5 options:0];
    if (v6)
    {
      id v7 = [v4 PKStringForKey:@"type"];
      v8 = v7;
      if (v7 == @"AEAD_AES_128_GCM")
      {
LABEL_6:
        uint64_t v10 = 1;
LABEL_7:

        self = [(PDSharingMailboxPayload *)self initWithData:v6 scheme:v10];
        v11 = self;
LABEL_14:

        goto LABEL_15;
      }
      if (v7)
      {
        unsigned __int8 v9 = [(__CFString *)v7 isEqualToString:@"AEAD_AES_128_GCM"];

        if (v9) {
          goto LABEL_6;
        }
        objc_super v12 = v8;
        if (v12 == @"AEAD_AES_256_GCM"
          || (v13 = v12,
              unsigned __int8 v14 = [(__CFString *)v12 isEqualToString:@"AEAD_AES_256_GCM"],
              v13,
              (v14 & 1) != 0))
        {
          uint64_t v10 = 2;
          goto LABEL_7;
        }
      }
    }
    v11 = 0;
    goto LABEL_14;
  }
  v11 = 0;
LABEL_15:

  return v11;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(NSData *)self->_data base64EncodedStringWithOptions:0];
  [v3 setObject:v4 forKeyedSubscript:@"data"];

  unint64_t scheme = self->_scheme;
  CFStringRef v6 = @"AEAD_AES_256_GCM";
  if (scheme != 2) {
    CFStringRef v6 = 0;
  }
  if (scheme == 1) {
    CFStringRef v7 = @"AEAD_AES_128_GCM";
  }
  else {
    CFStringRef v7 = v6;
  }
  [v3 setObject:v7 forKeyedSubscript:@"type"];
  id v8 = [v3 copy];

  return v8;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (unint64_t)scheme
{
  return self->_scheme;
}

- (void)setScheme:(unint64_t)a3
{
  self->_unint64_t scheme = a3;
}

- (void).cxx_destruct
{
}

@end