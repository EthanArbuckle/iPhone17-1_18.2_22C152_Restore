@interface MFAttachmentPlaceholder
+ (BOOL)isPlaceholderSerializedRepresentation:(id)a3;
+ (id)_placeholderMagic;
+ (id)dataForPlaceholder:(id)a3;
+ (id)placeholder;
+ (id)placeholderFromSerializedRepresentation:(id)a3;
- (BOOL)useMailDrop;
- (MFAttachmentPlaceholder)init;
- (id)contentID;
- (id)description;
- (id)fileName;
- (id)fileURL;
- (id)fileURLString;
- (id)mimeType;
- (id)serializedRepresentation;
- (unint64_t)fileSize;
- (void)_setJSONDictionary:(id)a3;
- (void)dealloc;
- (void)serializedRepresentation;
- (void)setContentID:(id)a3;
- (void)setFileName:(id)a3;
- (void)setFileSize:(unint64_t)a3;
- (void)setFileURLString:(id)a3;
- (void)setMimeType:(id)a3;
- (void)setUseMailDrop:(BOOL)a3;
@end

@implementation MFAttachmentPlaceholder

+ (id)placeholder
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (MFAttachmentPlaceholder)init
{
  v4.receiver = self;
  v4.super_class = (Class)MFAttachmentPlaceholder;
  id v2 = [(MFAttachmentPlaceholder *)&v4 init];
  if (v2) {
    v2->_jsonDictionary = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFAttachmentPlaceholder;
  [(MFAttachmentPlaceholder *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  id v4 = [(MFAttachmentPlaceholder *)self fileName];
  unint64_t v5 = [(MFAttachmentPlaceholder *)self fileSize];
  id v6 = [(MFAttachmentPlaceholder *)self mimeType];
  id v7 = [(MFAttachmentPlaceholder *)self fileURLString];
  id v8 = [(MFAttachmentPlaceholder *)self contentID];
  BOOL v9 = [(MFAttachmentPlaceholder *)self useMailDrop];
  v10 = "SMTP";
  if (v9) {
    v10 = "MailDrop";
  }
  return (id)[v3 stringWithFormat:@"%@ %lu [%@] @ %@ : %@ [%s]", v4, v5, v6, v7, v8, v10];
}

- (void)_setJSONDictionary:(id)a3
{
  self->_jsonDictionary = (NSMutableDictionary *)a3;
}

- (id)fileName
{
  return (id)[(NSMutableDictionary *)self->_jsonDictionary objectForKeyedSubscript:@"fileName"];
}

- (void)setFileName:(id)a3
{
}

- (unint64_t)fileSize
{
  id v2 = (void *)[(NSMutableDictionary *)self->_jsonDictionary objectForKeyedSubscript:@"fileSize"];
  return [v2 unsignedIntegerValue];
}

- (void)setFileSize:(unint64_t)a3
{
  jsonDictionary = self->_jsonDictionary;
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)jsonDictionary setValue:v4 forKey:@"fileSize"];
}

- (id)mimeType
{
  return (id)[(NSMutableDictionary *)self->_jsonDictionary objectForKeyedSubscript:@"mimeType"];
}

- (void)setMimeType:(id)a3
{
}

- (id)fileURLString
{
  return (id)[(NSMutableDictionary *)self->_jsonDictionary objectForKeyedSubscript:@"fileURL"];
}

- (void)setFileURLString:(id)a3
{
}

- (id)fileURL
{
  id v2 = (void *)MEMORY[0x1E4F1CB10];
  id v3 = [(MFAttachmentPlaceholder *)self fileURLString];
  return (id)[v2 URLWithString:v3];
}

- (id)contentID
{
  return (id)[(NSMutableDictionary *)self->_jsonDictionary objectForKeyedSubscript:@"contentID"];
}

- (void)setContentID:(id)a3
{
}

- (BOOL)useMailDrop
{
  id v2 = (void *)[(NSMutableDictionary *)self->_jsonDictionary objectForKeyedSubscript:@"mailDrop"];
  return [v2 BOOLValue];
}

- (void)setUseMailDrop:(BOOL)a3
{
  jsonDictionary = self->_jsonDictionary;
  uint64_t v4 = [NSNumber numberWithBool:a3];
  [(NSMutableDictionary *)jsonDictionary setValue:v4 forKey:@"mailDrop"];
}

+ (id)placeholderFromSerializedRepresentation:(id)a3
{
  if (!objc_msgSend(a1, "isPlaceholderSerializedRepresentation:")) {
    return 0;
  }
  uint64_t v4 = objc_msgSend(a3, "subdataWithRange:", 4, objc_msgSend(a3, "length") - 4);
  if (!v4)
  {
    BOOL v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
    return 0;
  }
  uint64_t v18 = 0;
  uint64_t v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:&v18];
  id v6 = 0;
  if (!v18)
  {
    id v7 = (void *)v5;
    if (v5)
    {
      id v6 = +[MFAttachmentPlaceholder placeholder];
      id v8 = (void *)[v7 mutableCopy];
      [v6 _setJSONDictionary:v8];
    }
  }
  return v6;
}

+ (id)_placeholderMagic
{
  if (_placeholderMagic_onceToken != -1) {
    dispatch_once(&_placeholderMagic_onceToken, &__block_literal_global_11);
  }
  return (id)_placeholderMagic_placeholderMagic;
}

id __44__MFAttachmentPlaceholder__placeholderMagic__block_invoke()
{
  id result = (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:&MFAttachmentPlaceholderMagic length:4];
  _placeholderMagic_placeholderMagic = (uint64_t)result;
  return result;
}

+ (BOOL)isPlaceholderSerializedRepresentation:(id)a3
{
  return (unint64_t)[a3 length] >= 0x35
      && (unint64_t)[a3 length] <= 0x833
      && objc_msgSend(a3, "rangeOfData:options:range:", objc_msgSend(a1, "_placeholderMagic"), 2, 0, 4) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)serializedRepresentation
{
  jsonDictionary = self->_jsonDictionary;
  if (!jsonDictionary) {
    return 0;
  }
  uint64_t v15 = 0;
  uint64_t v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:jsonDictionary options:0 error:&v15];
  if (!v3)
  {
    id v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(MFAttachmentPlaceholder *)v6 serializedRepresentation];
    }
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA58] dataWithBytes:&MFAttachmentPlaceholderMagic length:4];
  [v5 appendData:v4];
  return v5;
}

+ (id)dataForPlaceholder:(id)a3
{
  uint64_t v3 = (void *)[a3 fileURL];
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v3, "path")))
  {
    uint64_t v5 = MFLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[MFAttachmentPlaceholder dataForPlaceholder:]((uint64_t)v3, v5);
    }
    return 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  uint64_t v16 = __46__MFAttachmentPlaceholder_dataForPlaceholder___block_invoke;
  v17 = &unk_1E68671A8;
  uint64_t v18 = v3;
  if (MFIsMobileMail()) {
    uint64_t v4 = (void *)v16((uint64_t)v15, 0);
  }
  else {
    uint64_t v4 = 0;
  }
  id result = (id)objc_msgSend((id)objc_msgSend(v4, "result:", 0), "data");
  if (!result)
  {
    uint64_t v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[MFAttachmentPlaceholder dataForPlaceholder:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
    return 0;
  }
  return result;
}

uint64_t __46__MFAttachmentPlaceholder_dataForPlaceholder___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = +[MFAttachmentSecurityScope securityScopedURL:*(void *)(a1 + 32) withToken:a2];
  uint64_t v3 = (void *)MEMORY[0x1E4F60D70];
  return [v3 futureWithResult:v2];
}

+ (void)placeholderFromSerializedRepresentation:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)serializedRepresentation
{
}

+ (void)dataForPlaceholder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)dataForPlaceholder:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1CFCFE000, a2, OS_LOG_TYPE_ERROR, "#Attachments Attempted to resolve placeholder for non-existant file: %@", (uint8_t *)&v2, 0xCu);
}

@end