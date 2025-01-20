@interface MFWebMessageDocument
- (BOOL)isVisuallyEmpty;
- (MFAttachmentManager)attachmentManager;
- (MFMimeBody)mimeBody;
- (MFMimePart)mimePart;
- (MFWebMessageDocument)init;
- (MFWebMessageDocument)initWithMimeBody:(id)a3;
- (MFWebMessageDocument)initWithMimePart:(id)a3;
- (MFWebMessageDocument)initWithMimePart:(id)a3 htmlData:(id)a4 encoding:(unsigned int)a5;
- (NSData)htmlData;
- (NSURL)baseURL;
- (id)_initWithMimePart:(id)a3 htmlData:(id)a4;
- (id)attachmentForURL:(id)a3;
- (id)attachmentsInDocument;
- (id)fileWrapper;
- (id)mimePartForURL:(id)a3;
- (id)preferredCharacterSet;
- (unsigned)preferredEncoding;
- (void)setAttachmentManager:(id)a3;
- (void)setPreferredEncoding:(unsigned int)a3;
- (void)setVisuallyEmpty:(BOOL)a3;
@end

@implementation MFWebMessageDocument

- (void)setPreferredEncoding:(unsigned int)a3
{
  self->_preferredEncoding = a3;
}

- (unsigned)preferredEncoding
{
  return self->_preferredEncoding;
}

- (BOOL)isVisuallyEmpty
{
  return self->_visuallyEmpty;
}

- (MFWebMessageDocument)init
{
  v12.receiver = self;
  v12.super_class = (Class)MFWebMessageDocument;
  v2 = [(MFWebAttachmentSource *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_uniqueId = atomic_fetch_add_explicit(init_lastUniqueId, 1u, memory_order_relaxed) + 1;
    id v4 = objc_allocWithZone(MEMORY[0x1E4F1CB10]);
    v5 = objc_msgSend(NSString, "stringWithFormat:", @"x-msg://%ul/", v3->_uniqueId);
    uint64_t v6 = [v4 initWithString:v5];
    baseURL = v3->_baseURL;
    v3->_baseURL = (NSURL *)v6;

    v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"MFWebMessageDocument/%ul", v3->_uniqueId);
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F734E8]) initWithName:v8 andDelegate:v3];
    lock = v3->_lock;
    v3->_lock = (MFLock *)v9;

    v3->_preferredEncoding = -1;
  }
  return v3;
}

- (MFWebMessageDocument)initWithMimePart:(id)a3 htmlData:(id)a4 encoding:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [(MFWebMessageDocument *)self _initWithMimePart:v8 htmlData:v9];
  v11 = v10;
  if (v10) {
    [(MFWebMessageDocument *)v10 setPreferredEncoding:v5];
  }

  return v11;
}

- (NSData)htmlData
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (id)_initWithMimePart:(id)a3 htmlData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 mimeBody];
  v10 = (void *)v9;
  v11 = 0;
  if (!v8 || !v7 || !v9) {
    goto LABEL_6;
  }
  objc_super v12 = [(MFWebMessageDocument *)self init];
  v11 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_htmlPart, a3);
    objc_storeStrong((id *)&v11->_mimeBody, v10);
    v13 = (NSData *)v8;
    self = (MFWebMessageDocument *)v11->_htmlData;
    v11->_htmlData = v13;
LABEL_6:
  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentManager, 0);
  objc_storeStrong((id *)&self->_partsByFilename, 0);
  objc_storeStrong((id *)&self->_partsByURL, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_htmlData, 0);
  objc_storeStrong((id *)&self->_htmlPart, 0);
  objc_storeStrong((id *)&self->_mimeBody, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

- (MFWebMessageDocument)initWithMimeBody:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 isHTML])
  {
    uint64_t v6 = [v5 textHtmlPart];
    self = [(MFWebMessageDocument *)self initWithMimePart:v6];

    id v7 = self;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (MFWebMessageDocument)initWithMimePart:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bodyData];
  uint64_t v6 = [(MFWebMessageDocument *)self _initWithMimePart:v4 htmlData:v5];

  return v6;
}

- (id)mimePartForURL:(id)a3
{
  id v24 = a3;
  [(MFLock *)self->_lock lock];
  if (!self->_partsByURL)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    partsByURL = self->_partsByURL;
    self->_partsByURL = v4;

    uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    partsByFilename = self->_partsByFilename;
    self->_partsByFilename = v6;

    id v8 = objc_allocWithZone(MEMORY[0x1E4F1CA48]);
    uint64_t v9 = [(MFWebMessageDocument *)self mimeBody];
    v10 = [v9 topLevelPart];
    v11 = objc_msgSend(v8, "initWithObjects:", v10, 0);
    while (1)
    {

      if (![v11 count]) {
        break;
      }
      uint64_t v9 = [v11 lastObject];
      objc_super v12 = [v9 contentID];
      v10 = (void *)MFCreateURLForContentID(v12);

      v13 = [v9 contentLocation];
      v14 = [v9 attachmentFilename];
      if (v10) {
        [(NSMutableDictionary *)self->_partsByURL setObject:v9 forKey:v10];
      }
      if (v13)
      {
        v15 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CB10]) initWithString:v13 relativeToURL:self->_baseURL];
        v16 = v15;
        if (v15)
        {
          v17 = self->_partsByURL;
          v18 = [v15 absoluteURL];
          [(NSMutableDictionary *)v17 setObject:v9 forKey:v18];
        }
      }
      if (v14) {
        [(NSMutableDictionary *)self->_partsByFilename setObject:v9 forKey:v14];
      }
      [v11 removeLastObject];
      v19 = [v9 subparts];
      if (v19) {
        [v11 addObjectsFromArray:v19];
      }
    }
  }
  if (!v24
    || ([(NSMutableDictionary *)self->_partsByURL objectForKey:v24],
        (v20 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v21 = [v24 path];
    v22 = [v21 lastPathComponent];

    if (v22)
    {
      v20 = [(NSMutableDictionary *)self->_partsByFilename objectForKey:v22];
    }
    else
    {
      v20 = 0;
    }
  }
  [(MFLock *)self->_lock unlock];

  return v20;
}

- (id)attachmentForURL:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFWebMessageDocument;
  uint64_t v5 = [(MFWebAttachmentSource *)&v10 attachmentForURL:v4];
  if (!v5)
  {
    uint64_t v6 = [(MFWebMessageDocument *)self mimePartForURL:v4];
    id v7 = v6;
    if (v6)
    {
      id v8 = [v6 attachments];
      if ([v8 count])
      {
        uint64_t v5 = [v8 objectAtIndexedSubscript:0];
        [(MFWebAttachmentSource *)self setAttachment:v5 forURL:v4];
      }
      else
      {
        uint64_t v5 = 0;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  return v5;
}

- (id)attachmentsInDocument
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(MFWebMessageDocument *)self mimePartForURL:0];
  [(MFLock *)self->_lock lock];
  id v4 = [(NSMutableDictionary *)self->_partsByURL allKeys];
  [(MFLock *)self->_lock unlock];
  if ([v4 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          objc_super v10 = -[MFWebMessageDocument attachmentForURL:](self, "attachmentForURL:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          if (v10) {
            [v5 addObject:v10];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)preferredCharacterSet
{
  if ([(MFWebMessageDocument *)self preferredEncoding] == -1
    || (MFCharsetForEncoding(), (id v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = [(MFWebMessageDocument *)self mimePart];
    id v3 = [v4 bodyParameterForKey:@"charset"];
  }
  return v3;
}

- (id)fileWrapper
{
  id v3 = objc_alloc(MEMORY[0x1E4F73500]);
  id v4 = [(MFWebMessageDocument *)self htmlData];
  id v5 = (void *)[v3 initRegularFileWithContents:v4];

  id v6 = [(MFWebMessageDocument *)self mimePart];
  [v6 configureFileWrapper:v5];

  return v5;
}

- (NSURL)baseURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (MFMimeBody)mimeBody
{
  return (MFMimeBody *)objc_getProperty(self, a2, 40, 1);
}

- (MFMimePart)mimePart
{
  return (MFMimePart *)objc_getProperty(self, a2, 48, 1);
}

- (void)setVisuallyEmpty:(BOOL)a3
{
  self->_visuallyEmpty = a3;
}

- (MFAttachmentManager)attachmentManager
{
  return self->_attachmentManager;
}

- (void)setAttachmentManager:(id)a3
{
}

@end