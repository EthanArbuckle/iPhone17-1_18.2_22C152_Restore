@interface SSVMediaSocialPostDescription
- (BOOL)isAttributed;
- (NSArray)attachments;
- (NSArray)contentItems;
- (NSArray)externalServiceDestinations;
- (NSNumber)accountIdentifier;
- (NSString)authorIdentifier;
- (NSString)authorType;
- (NSString)sourceApplicationIdentifier;
- (NSString)text;
- (SSVMediaSocialPostDescription)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (void)setAccountIdentifier:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setAttributed:(BOOL)a3;
- (void)setAuthorIdentifier:(id)a3;
- (void)setAuthorType:(id)a3;
- (void)setContentItems:(id)a3;
- (void)setExternalServiceDestinations:(id)a3;
- (void)setSourceApplicationIdentifier:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SSVMediaSocialPostDescription

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setAccountIdentifier:self->_accountIdentifier];
  [v4 setAttachments:self->_attachments];
  [v4 setAttributed:self->_attributed];
  [v4 setAuthorIdentifier:self->_authorIdentifier];
  [v4 setAuthorType:self->_authorType];
  [v4 setContentItems:self->_contentItems];
  [v4 setExternalServiceDestinations:self->_externalServiceDestinations];
  [v4 setSourceApplicationIdentifier:self->_sourceApplicationIdentifier];
  [v4 setText:self->_text];
  return v4;
}

- (SSVMediaSocialPostDescription)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v6 = [(SSVMediaSocialPostDescription *)self init];
    if (!v6) {
      goto LABEL_5;
    }
    v8 = xpc_dictionary_get_value(v5, "1");
    uint64_t v9 = objc_opt_class();
    id v10 = SSXPCCreateNSArrayFromXPCEncodedArray(v8, v9);

    uint64_t v11 = [v10 copy];
    attachments = v6->_attachments;
    v6->_attachments = (NSArray *)v11;

    v6->_attributed = xpc_dictionary_get_BOOL(v5, "8");
    objc_opt_class();
    CFArrayRef v13 = SSXPCDictionaryCopyCFObjectWithClass(v5, "0");
    accountIdentifier = v6->_accountIdentifier;
    v6->_accountIdentifier = (NSNumber *)v13;

    objc_opt_class();
    CFArrayRef v15 = SSXPCDictionaryCopyCFObjectWithClass(v5, "2");
    authorIdentifier = v6->_authorIdentifier;
    v6->_authorIdentifier = (NSString *)v15;

    objc_opt_class();
    CFArrayRef v17 = SSXPCDictionaryCopyCFObjectWithClass(v5, "3");
    authorType = v6->_authorType;
    v6->_authorType = (NSString *)v17;

    v19 = xpc_dictionary_get_value(v5, "4");
    uint64_t v20 = objc_opt_class();
    id v21 = SSXPCCreateNSArrayFromXPCEncodedArray(v19, v20);

    uint64_t v22 = [v21 copy];
    contentItems = v6->_contentItems;
    v6->_contentItems = (NSArray *)v22;

    v24 = xpc_dictionary_get_value(v5, "5");
    uint64_t v25 = objc_opt_class();
    self = (SSVMediaSocialPostDescription *)SSXPCCreateNSArrayFromXPCEncodedArray(v24, v25);

    uint64_t v26 = [(SSVMediaSocialPostDescription *)self copy];
    externalServiceDestinations = v6->_externalServiceDestinations;
    v6->_externalServiceDestinations = (NSArray *)v26;

    objc_opt_class();
    CFArrayRef v28 = SSXPCDictionaryCopyCFObjectWithClass(v5, "6");
    sourceApplicationIdentifier = v6->_sourceApplicationIdentifier;
    v6->_sourceApplicationIdentifier = (NSString *)v28;

    objc_opt_class();
    CFArrayRef v30 = SSXPCDictionaryCopyCFObjectWithClass(v5, "7");
    text = v6->_text;
    v6->_text = (NSString *)v30;
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
  SSXPCDictionarySetObject(v3, "0", self->_accountIdentifier);
  SSXPCDictionarySetObject(v3, "1", self->_attachments);
  xpc_dictionary_set_BOOL(v3, "8", self->_attributed);
  SSXPCDictionarySetObject(v3, "2", self->_authorIdentifier);
  SSXPCDictionarySetObject(v3, "3", self->_authorType);
  SSXPCDictionarySetObject(v3, "4", self->_contentItems);
  SSXPCDictionarySetObject(v3, "5", self->_externalServiceDestinations);
  SSXPCDictionarySetObject(v3, "6", self->_sourceApplicationIdentifier);
  SSXPCDictionarySetObject(v3, "7", self->_text);
  return v3;
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (BOOL)isAttributed
{
  return self->_attributed;
}

- (void)setAttributed:(BOOL)a3
{
  self->_attributed = a3;
}

- (NSString)authorIdentifier
{
  return self->_authorIdentifier;
}

- (void)setAuthorIdentifier:(id)a3
{
}

- (NSString)authorType
{
  return self->_authorType;
}

- (void)setAuthorType:(id)a3
{
}

- (NSArray)contentItems
{
  return self->_contentItems;
}

- (void)setContentItems:(id)a3
{
}

- (NSArray)externalServiceDestinations
{
  return self->_externalServiceDestinations;
}

- (void)setExternalServiceDestinations:(id)a3
{
}

- (NSString)sourceApplicationIdentifier
{
  return self->_sourceApplicationIdentifier;
}

- (void)setSourceApplicationIdentifier:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_sourceApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_externalServiceDestinations, 0);
  objc_storeStrong((id *)&self->_contentItems, 0);
  objc_storeStrong((id *)&self->_authorType, 0);
  objc_storeStrong((id *)&self->_authorIdentifier, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end