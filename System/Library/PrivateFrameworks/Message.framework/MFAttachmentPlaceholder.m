@interface MFAttachmentPlaceholder
+ (BOOL)hasPlaceholderRepresentation:(id)a3;
+ (BOOL)isPlaceholderSerializedRepresentation:(id)a3;
+ (BOOL)setFileProtectionForFileAt:(id)a3 error:(id *)a4;
+ (BOOL)writeData:(id)a3 forURL:(id)a4;
+ (id)_localStoreURLForFileData:(id)a3 contentID:(id)a4;
+ (id)_placeholderMagic;
+ (id)attachmentPlaceholderForData:(id)a3 fileName:(id)a4 type:(id)a5 contentID:(id)a6;
+ (id)attachmentPlaceholderForFileURL:(id)a3 fileName:(id)a4 fileSize:(int64_t)a5 type:(id)a6 contentID:(id)a7;
+ (id)dataForPlaceholder:(id)a3;
+ (id)placeholder;
+ (id)placeholderDirectory;
+ (id)placeholderFromSerializedRepresentation:(id)a3;
+ (id)placeholderRepresentations:(id)a3;
+ (id)serializedPlaceholderForFileName:(id)a3 fileSize:(int64_t)a4 mimeType:(id)a5 contentID:(id)a6;
+ (void)cloneFileAtURL:(id)a3 toPlaceholderURL:(id)a4;
+ (void)placeholderDirectory;
+ (void)removePlaceholder:(id)a3;
+ (void)removePlaceholderForFileURL:(id)a3;
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
  v6.receiver = self;
  v6.super_class = (Class)MFAttachmentPlaceholder;
  id v2 = [(MFAttachmentPlaceholder *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    jsonDictionary = v2->_jsonDictionary;
    v2->_jsonDictionary = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (id)attachmentPlaceholderForFileURL:(id)a3 fileName:(id)a4 fileSize:(int64_t)a5 type:(id)a6 contentID:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v15 = +[MFAttachmentUtilities makeAttachmentPlaceholder:v12 fileSize:a5 mimeType:v13 contentID:v14];
  v16 = [v15 fileURL];
  v17 = +[MFAttachmentUtilities securityScopeForFileURL:v16];

  v18 = [v17 startWriteAccess];
  +[MFAttachmentPlaceholder cloneFileAtURL:v11 toPlaceholderURL:v18];

  [v17 stopAccess];
  return v15;
}

+ (id)attachmentPlaceholderForData:(id)a3 fileName:(id)a4 type:(id)a5 contentID:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[MFAttachmentUtilities makeAttachmentPlaceholder:fileSize:mimeType:contentID:](MFAttachmentUtilities, "makeAttachmentPlaceholder:fileSize:mimeType:contentID:", v10, [v9 length], v11, v12);
  id v14 = [v13 fileURL];
  v15 = +[MFAttachmentUtilities securityScopeForFileURL:v14];

  v16 = [v15 startWriteAccess];
  +[MFAttachmentPlaceholder writeData:v9 forURL:v16];

  [v15 stopAccess];
  return v13;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = [(MFAttachmentPlaceholder *)self fileName];
  unint64_t v5 = [(MFAttachmentPlaceholder *)self fileSize];
  objc_super v6 = [(MFAttachmentPlaceholder *)self mimeType];
  v7 = [(MFAttachmentPlaceholder *)self fileURLString];
  v8 = [(MFAttachmentPlaceholder *)self contentID];
  BOOL v9 = [(MFAttachmentPlaceholder *)self useMailDrop];
  id v10 = "SMTP";
  if (v9) {
    id v10 = "MailDrop";
  }
  id v11 = [v3 stringWithFormat:@"%@ %lu [%@] @ %@ : %@ [%s]", v4, v5, v6, v7, v8, v10];

  return v11;
}

- (void)_setJSONDictionary:(id)a3
{
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
  id v2 = [(NSMutableDictionary *)self->_jsonDictionary objectForKeyedSubscript:@"fileSize"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setFileSize:(unint64_t)a3
{
  jsonDictionary = self->_jsonDictionary;
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  -[NSMutableDictionary setValue:forKey:](jsonDictionary, "setValue:forKey:");
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
  unint64_t v3 = [(MFAttachmentPlaceholder *)self fileURLString];
  id v4 = [v2 URLWithString:v3];

  return v4;
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
  id v2 = [(NSMutableDictionary *)self->_jsonDictionary objectForKeyedSubscript:@"mailDrop"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setUseMailDrop:(BOOL)a3
{
  jsonDictionary = self->_jsonDictionary;
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  -[NSMutableDictionary setValue:forKey:](jsonDictionary, "setValue:forKey:");
}

+ (id)_localStoreURLForFileData:(id)a3 contentID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)objc_opt_class() placeholderDirectory];
  BOOL v9 = [v8 stringByAppendingPathComponent:v7];
  if ([v9 length])
  {
    id v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
    if ([v6 length]) {
      [a1 writeData:v6 forURL:v10];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)placeholderFromSerializedRepresentation:(id)a3
{
  id v4 = a3;
  if ([a1 isPlaceholderSerializedRepresentation:v4])
  {
    unint64_t v5 = objc_msgSend(v4, "subdataWithRange:", 4, objc_msgSend(v4, "length") - 4);
    if (v5)
    {
      id v11 = 0;
      id v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v11];
      id v7 = v11;
      v8 = 0;
      if (!v7 && v6)
      {
        v8 = +[MFAttachmentPlaceholder placeholder];
        BOOL v9 = (void *)[v6 mutableCopy];
        [v8 _setJSONDictionary:v9];
      }
    }
    else
    {
      id v7 = MFLogGeneral();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:]();
      }
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_placeholderMagic
{
  if (_placeholderMagic_onceToken != -1) {
    dispatch_once(&_placeholderMagic_onceToken, &__block_literal_global_25);
  }
  id v2 = (void *)_placeholderMagic_placeholderMagic;
  return v2;
}

void __44__MFAttachmentPlaceholder__placeholderMagic__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&MFAttachmentPlaceholderMagic length:4];
  v1 = (void *)_placeholderMagic_placeholderMagic;
  _placeholderMagic_placeholderMagic = v0;
}

+ (BOOL)isPlaceholderSerializedRepresentation:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] < 0x35 || (unint64_t)objc_msgSend(v4, "length") > 0x833)
  {
    BOOL v7 = 0;
  }
  else
  {
    unint64_t v5 = [a1 _placeholderMagic];
    uint64_t v6 = objc_msgSend(v4, "rangeOfData:options:range:", v5, 2, 0, 4);

    BOOL v7 = v6 != 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)serializedRepresentation
{
  jsonDictionary = self->_jsonDictionary;
  if (jsonDictionary)
  {
    id v8 = 0;
    char v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:jsonDictionary options:0 error:&v8];
    id v4 = v8;
    if (v3)
    {
      unint64_t v5 = [MEMORY[0x1E4F1CA58] dataWithBytes:&MFAttachmentPlaceholderMagic length:4];
      [v5 appendData:v3];
    }
    else
    {
      uint64_t v6 = MFLogGeneral();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[MFAttachmentPlaceholder serializedRepresentation]();
      }

      unint64_t v5 = 0;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v5;
}

+ (BOOL)hasPlaceholderRepresentation:(id)a3
{
  char v3 = [a3 messageBody];
  id v4 = [v3 rawData];

  if ([v4 length])
  {
    uint64_t v5 = [v4 length];
    uint64_t v6 = [@"=FA=CA=DE{" dataUsingEncoding:4];
    uint64_t v7 = objc_msgSend(v4, "rangeOfData:options:range:", v6, 0, 0, v5);

    BOOL v8 = v7 != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)placeholderRepresentations:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v24 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [v22 messageBody];
  uint64_t v5 = [v4 rawData];

  id v23 = v5;
  if ([v5 length])
  {
    v20 = objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(v5, "bytes"));
    v21 = [v20 componentsSeparatedByString:@"=FA=CA=DE{"];
    if ([v21 count])
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v6 = v21;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v26 != v8) {
              objc_enumerationMutation(v6);
            }
            id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            uint64_t v11 = [v10 rangeOfString:@"}"];
            if (v11 != 0x7FFFFFFFFFFFFFFFLL)
            {
              id v12 = [v10 substringToIndex:v11 + 1];
              id v13 = [v12 stringByReplacingOccurrencesOfString:@"=\n" withString:&stru_1EFF11268];

              id v14 = (void *)MEMORY[0x1E4F1CA58];
              v15 = [a1 _placeholderMagic];
              v16 = [v14 dataWithData:v15];

              v17 = [v13 dataUsingEncoding:4];
              [v16 appendData:v17];

              v18 = [a1 placeholderFromSerializedRepresentation:v16];
              if (v18) {
                [v24 addObject:v18];
              }
            }
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v7);
      }
    }
  }

  return v24;
}

+ (id)dataForPlaceholder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 fileURL];
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [v4 path];
  int v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__MFAttachmentPlaceholder_dataForPlaceholder___block_invoke;
    aBlock[3] = &unk_1E5D3DF68;
    uint64_t v8 = v4;
    id v22 = v8;
    BOOL v9 = (void (**)(void *, void))_Block_copy(aBlock);
    if (MFIsMobileMail())
    {
      id v10 = v9[2](v9, 0);
    }
    else
    {
      id v14 = [MEMORY[0x1E4F60E18] promise];
      v15 = (void *)MEMORY[0x1E4F73B68];
      v16 = [v14 completionHandlerAdapter];
      [v15 securityScopeForPlaceholderURL:v8 completionBlock:v16];

      v17 = [v14 future];
      id v10 = [v17 then:v9];
    }
    v18 = [v10 result:0];
    id v13 = [v18 data];

    if (!v13)
    {
      v19 = MFLogGeneral();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        +[MFAttachmentPlaceholder dataForPlaceholder:]();
      }
    }
    uint64_t v11 = v22;
  }
  else
  {
    uint64_t v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[MFAttachmentPlaceholder dataForPlaceholder:v12];
    }
    id v10 = 0;
    id v13 = 0;
  }

  return v13;
}

id __46__MFAttachmentPlaceholder_dataForPlaceholder___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = +[MFAttachmentSecurityScope securityScopedURL:*(void *)(a1 + 32) withToken:a2];
  id v3 = [MEMORY[0x1E4F60D70] futureWithResult:v2];

  return v3;
}

+ (BOOL)writeData:(id)a3 forURL:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  char v4 = [a3 writeToURL:a4 options:0x40000000 error:&v9];
  id v5 = v9;
  if ((v4 & 1) == 0)
  {
    id v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = objc_msgSend(v5, "ef_publicDescription");
      +[MFAttachmentPlaceholder writeData:forURL:](v7, (uint64_t)v10, v6);
    }
  }
  return v4;
}

+ (void)cloneFileAtURL:(id)a3 toPlaceholderURL:(id)a4
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v9 = [v8 copyItemAtURL:v6 toURL:v7 error:0];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v11 = *MEMORY[0x1E4F1C530];
    v20[0] = *MEMORY[0x1E4F1C540];
    v20[1] = v11;
    v21[0] = v10;
    v21[1] = v10;
    v20[2] = *MEMORY[0x1E4F1C590];
    v21[2] = *MEMORY[0x1E4F1C580];
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
    id v18 = 0;
    char v13 = [v7 setResourceValues:v12 error:&v18];
    id v14 = v18;
    if ((v13 & 1) == 0)
    {
      v15 = MFLogGeneral();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = objc_msgSend(v14, "ef_publicDescription");
        +[MFAttachmentPlaceholder cloneFileAtURL:toPlaceholderURL:](v16, (uint64_t)v19, v15);
      }
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F734C0] dataWithContentsOfURL:v6];
    [a1 writeData:v17 forURL:v7];
  }
}

+ (BOOL)setFileProtectionForFileAt:(id)a3 error:(id *)a4
{
  return [a3 setResourceValue:*MEMORY[0x1E4F1C580] forKey:*MEMORY[0x1E4F1C590] error:a4];
}

+ (void)removePlaceholderForFileURL:(id)a3
{
  id v3 = a3;
  if (MFIsMobileMail())
  {
    char v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v7 = 0;
    [v4 removeItemAtURL:v3 error:&v7];
    id v5 = v7;

    if (v5)
    {
      id v6 = MFLogGeneral();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        +[MFAttachmentPlaceholder removePlaceholderForFileURL:]();
      }
    }
  }
}

+ (void)removePlaceholder:(id)a3
{
  id v4 = [a3 fileURL];
  objc_msgSend(a1, "removePlaceholderForFileURL:");
}

+ (id)placeholderDirectory
{
  id v2 = +[MailAccount defaultAccountDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"AttachmentPlaceholders"];
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v4 fileExistsAtPath:v3] & 1) == 0)
  {
    id v11 = 0;
    char v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v11];
    id v6 = v11;
    if ((v5 & 1) == 0)
    {
      id v7 = MFLogGeneral();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[MFAttachmentPlaceholder placeholderDirectory];
      }

      id v3 = 0;
    }
  }
  char v9 = objc_msgSend(v3, "mf_canonicalizedAbsolutePath");

  return v9;
}

+ (id)serializedPlaceholderForFileName:(id)a3 fileSize:(int64_t)a4 mimeType:(id)a5 contentID:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (![v12 length])
  {
    char v13 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v14 = [v13 UUIDString];

    id v12 = (id)v14;
  }
  v15 = [MEMORY[0x1E4F1C9B8] data];
  v16 = [a1 _localStoreURLForFileData:v15 contentID:v12];

  if (v16)
  {
    v17 = +[MFAttachmentPlaceholder placeholder];
    [v17 setFileName:v10];
    [v17 setFileSize:a4];
    [v17 setMimeType:v11];
    id v18 = [v16 absoluteString];
    [v17 setFileURLString:v18];

    [v17 setContentID:v12];
    v19 = [v17 serializedRepresentation];
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void).cxx_destruct
{
}

+ (void)attachmentPlaceholderForFileURL:fileName:fileSize:type:contentID:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_3(&dword_1A7EFF000, v0, v1, "#Attachments Exception thrown when writing file: %@ : %@");
}

+ (void)attachmentPlaceholderForData:fileName:type:contentID:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_3(&dword_1A7EFF000, v0, v1, "#Attachments Exception thrown when writing data: %@ : %@");
}

+ (void)placeholderFromSerializedRepresentation:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "#Attachments Failed to deserialize placeholder", v2, v3, v4, v5, v6);
}

- (void)serializedRepresentation
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "#Attachments Failed to serialize placeholder", v2, v3, v4, v5, v6);
}

+ (void)dataForPlaceholder:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "#Attachments Failed obtain data for temporary file", v2, v3, v4, v5, v6);
}

+ (void)dataForPlaceholder:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, a2, a3, "#Attachments Attempted to resolve placeholder for non-existant file: %@", (uint8_t *)&v3);
}

+ (void)writeData:(NSObject *)a3 forURL:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, a3, (uint64_t)a3, "#Attachments Placeholder attachment data write error %{public}@", (uint8_t *)a2);
}

+ (void)cloneFileAtURL:(NSObject *)a3 toPlaceholderURL:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, a3, (uint64_t)a3, "#Attachments Unable to set resource values on placeholder attachment data: %{public}@", (uint8_t *)a2);
}

+ (void)removePlaceholderForFileURL:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "#Attachments Failed to remove temporary file", v2, v3, v4, v5, v6);
}

+ (void)placeholderDirectory
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, a2, a3, "#Attachments Failed to create placeholder directory %@", (uint8_t *)&v3);
}

@end