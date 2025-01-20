@interface SSVDirectUpload
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicitContent;
- (NSError)error;
- (NSString)UTI;
- (NSString)_uploadKind;
- (NSString)categoryName;
- (NSString)description;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)thumbnailImageURL;
- (SSVDirectUpload)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (int64_t)countOfBytesExpectedToSend;
- (int64_t)countOfBytesSent;
- (int64_t)persistentIdentifier;
- (int64_t)state;
- (void)_adoptStatusFromUpload:(id)a3;
- (void)_setUploadKind:(id)a3;
- (void)setCategoryName:(id)a3;
- (void)setCountOfBytesExpectedToSend:(int64_t)a3;
- (void)setCountOfBytesSent:(int64_t)a3;
- (void)setError:(id)a3;
- (void)setExplicitContent:(BOOL)a3;
- (void)setPersistentIdentifier:(int64_t)a3;
- (void)setState:(int64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setThumbnailImageURL:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUTI:(id)a3;
@end

@implementation SSVDirectUpload

- (void)_adoptStatusFromUpload:(id)a3
{
  id v4 = a3;
  self->_countOfBytesExpectedToSend = [v4 countOfBytesExpectedToSend];
  self->_countOfBytesSent = [v4 countOfBytesSent];
  v5 = [v4 error];
  error = self->_error;
  self->_error = v5;

  int64_t v7 = [v4 state];
  self->_state = v7;
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SSVDirectUpload;
  id v4 = [(SSVDirectUpload *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ [PID: %lld]", v4, self->_persistentIdentifier];

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    int64_t v7 = [(SSVDirectUpload *)self persistentIdentifier];
    BOOL v6 = v7 == [v4 persistentIdentifier];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (SSVDirectUpload)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v25.receiver = self;
    v25.super_class = (Class)SSVDirectUpload;
    BOOL v6 = [(SSVDirectUpload *)&v25 init];
    if (v6)
    {
      objc_opt_class();
      CFArrayRef v8 = SSXPCDictionaryCopyCFObjectWithClass(v5, "2");
      categoryName = v6->_categoryName;
      v6->_categoryName = (NSString *)v8;

      v6->_countOfBytesExpectedToSend = xpc_dictionary_get_int64(v5, "0");
      v6->_countOfBytesSent = xpc_dictionary_get_int64(v5, "1");
      id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
      v11 = xpc_dictionary_get_value(v5, "3");
      uint64_t v12 = [v10 initWithXPCEncoding:v11];
      error = v6->_error;
      v6->_error = (NSError *)v12;

      v6->_explicitContent = xpc_dictionary_get_BOOL(v5, "4");
      v6->_persistentIdentifier = xpc_dictionary_get_int64(v5, "5");
      v6->_state = xpc_dictionary_get_int64(v5, "6");
      objc_opt_class();
      CFArrayRef v14 = SSXPCDictionaryCopyCFObjectWithClass(v5, "7");
      subtitle = v6->_subtitle;
      v6->_subtitle = (NSString *)v14;

      objc_opt_class();
      CFArrayRef v16 = SSXPCDictionaryCopyCFObjectWithClass(v5, "9");
      title = v6->_title;
      v6->_title = (NSString *)v16;

      objc_opt_class();
      CFArrayRef v18 = SSXPCDictionaryCopyCFObjectWithClass(v5, "A");
      uploadKind = v6->_uploadKind;
      v6->_uploadKind = (NSString *)v18;

      objc_opt_class();
      CFArrayRef v20 = SSXPCDictionaryCopyCFObjectWithClass(v5, "B");
      uti = v6->_uti;
      v6->_uti = (NSString *)v20;

      objc_opt_class();
      CFArrayRef v22 = SSXPCDictionaryCopyCFObjectWithClass(v5, "8");
      if (v22)
      {
        uint64_t v23 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v22];
        thumbnailImageURL = v6->_thumbnailImageURL;
        v6->_thumbnailImageURL = (NSURL *)v23;
      }
    }
  }
  else
  {

    BOOL v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "2", self->_categoryName);
  xpc_dictionary_set_int64(v3, "0", self->_countOfBytesExpectedToSend);
  xpc_dictionary_set_int64(v3, "1", self->_countOfBytesSent);
  SSXPCDictionarySetObject(v3, "3", self->_error);
  xpc_dictionary_set_BOOL(v3, "4", self->_explicitContent);
  xpc_dictionary_set_int64(v3, "5", self->_persistentIdentifier);
  xpc_dictionary_set_int64(v3, "6", self->_state);
  SSXPCDictionarySetObject(v3, "7", self->_subtitle);
  id v4 = [(NSURL *)self->_thumbnailImageURL absoluteString];
  SSXPCDictionarySetObject(v3, "8", v4);

  SSXPCDictionarySetObject(v3, "9", self->_title);
  SSXPCDictionarySetObject(v3, "A", self->_uploadKind);
  SSXPCDictionarySetObject(v3, "B", self->_uti);
  return v3;
}

- (NSString)categoryName
{
  return self->_categoryName;
}

- (void)setCategoryName:(id)a3
{
}

- (int64_t)countOfBytesExpectedToSend
{
  return self->_countOfBytesExpectedToSend;
}

- (void)setCountOfBytesExpectedToSend:(int64_t)a3
{
  self->_countOfBytesExpectedToSend = a3;
}

- (int64_t)countOfBytesSent
{
  return self->_countOfBytesSent;
}

- (void)setCountOfBytesSent:(int64_t)a3
{
  self->_countOfBytesSent = a3;
}

- (BOOL)isExplicitContent
{
  return self->_explicitContent;
}

- (void)setExplicitContent:(BOOL)a3
{
  self->_explicitContent = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (int64_t)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (void)setPersistentIdentifier:(int64_t)a3
{
  self->_persistentIdentifier = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSURL)thumbnailImageURL
{
  return self->_thumbnailImageURL;
}

- (void)setThumbnailImageURL:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)_uploadKind
{
  return self->_uploadKind;
}

- (void)_setUploadKind:(id)a3
{
}

- (NSString)UTI
{
  return self->_uti;
}

- (void)setUTI:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_uploadKind, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_thumbnailImageURL, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_categoryName, 0);
}

@end