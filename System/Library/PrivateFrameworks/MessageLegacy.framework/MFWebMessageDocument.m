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
- (void)dealloc;
- (void)setAttachmentManager:(id)a3;
- (void)setPreferredEncoding:(unsigned int)a3;
- (void)setVisuallyEmpty:(BOOL)a3;
@end

@implementation MFWebMessageDocument

- (id)preferredCharacterSet
{
  if ([(MFWebMessageDocument *)self preferredEncoding] == -1
    || (id result = (id)MFCharsetForEncoding()) == 0)
  {
    id v4 = (id)[(MFMimePart *)[(MFWebMessageDocument *)self mimePart] bodyParameterForKey:@"charset"];
    return v4;
  }
  return result;
}

- (unsigned)preferredEncoding
{
  return self->_preferredEncoding;
}

- (MFMimePart)mimePart
{
  return self->_htmlPart;
}

- (MFWebMessageDocument)init
{
  v7.receiver = self;
  v7.super_class = (Class)MFWebMessageDocument;
  v2 = [(MFWebAttachmentSource *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_uniqueId = atomic_fetch_add_explicit(&init_lastUniqueId, 1u, memory_order_relaxed) + 1;
    id v4 = objc_allocWithZone(MEMORY[0x1E4F1CB10]);
    v3->_baseURL = (NSURL *)[v4 initWithString:objc_msgSend(NSString, "stringWithFormat:", @"x-msg://%ul/", v3->_uniqueId)];
    v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"MFWebMessageDocument/%ul", v3->_uniqueId);
    v3->_lock = (MFLock *)[objc_alloc(MEMORY[0x1E4F734E8]) initWithName:v5 andDelegate:v3];

    v3->_preferredEncoding = -1;
  }
  return v3;
}

- (MFWebMessageDocument)initWithMimeBody:(id)a3
{
  if (a3 && [a3 isHTML])
  {
    uint64_t v5 = [a3 textHtmlPart];
    return [(MFWebMessageDocument *)self initWithMimePart:v5];
  }
  else
  {
    [(MFWebMessageDocument *)self dealloc];
    return 0;
  }
}

- (id)_initWithMimePart:(id)a3 htmlData:(id)a4
{
  uint64_t v7 = [a3 mimeBody];
  if (a4 && a3 && (v8 = (void *)v7) != 0)
  {
    v9 = [(MFWebMessageDocument *)self init];
    if (v9)
    {
      v9->_htmlPart = (MFMimePart *)a3;
      v9->_mimeBody = (MFMimeBody *)v8;
      v9->_htmlData = (NSData *)a4;
    }
  }
  else
  {
    [(MFWebMessageDocument *)self dealloc];
    return 0;
  }
  return v9;
}

- (MFWebMessageDocument)initWithMimePart:(id)a3
{
  uint64_t v5 = [a3 bodyData];
  return (MFWebMessageDocument *)[(MFWebMessageDocument *)self _initWithMimePart:a3 htmlData:v5];
}

- (MFWebMessageDocument)initWithMimePart:(id)a3 htmlData:(id)a4 encoding:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  v6 = [(MFWebMessageDocument *)self _initWithMimePart:a3 htmlData:a4];
  uint64_t v7 = v6;
  if (v6) {
    [(MFWebMessageDocument *)v6 setPreferredEncoding:v5];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFWebMessageDocument;
  [(MFWebAttachmentSource *)&v3 dealloc];
}

- (id)mimePartForURL:(id)a3
{
  [(MFLock *)self->_lock lock];
  if (!self->_partsByURL)
  {
    id v17 = a3;
    self->_partsByURL = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_partsByFilename = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA48]), "initWithObjects:", -[MFMimeBody topLevelPart](-[MFWebMessageDocument mimeBody](self, "mimeBody"), "topLevelPart"), 0);
    while ([v5 count])
    {
      id v6 = (id)[v5 lastObject];
      uint64_t v7 = (void *)MFCreateURLForContentID((__CFString *)[v6 contentID]);
      uint64_t v8 = [v6 contentLocation];
      uint64_t v9 = [v6 attachmentFilename];
      if (v7)
      {
        [(NSMutableDictionary *)self->_partsByURL setObject:v6 forKey:v7];
      }
      if (v8)
      {
        v10 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CB10]) initWithString:v8 relativeToURL:self->_baseURL];
        if (v10)
        {
          v11 = v10;
          -[NSMutableDictionary setObject:forKey:](self->_partsByURL, "setObject:forKey:", v6, [v10 absoluteURL]);
        }
      }
      if (v9) {
        [(NSMutableDictionary *)self->_partsByFilename setObject:v6 forKey:v9];
      }
      [v5 removeLastObject];
      uint64_t v12 = [v6 subparts];
      if (v12) {
        [v5 addObjectsFromArray:v12];
      }
    }
    a3 = v17;
    if (!v17) {
      goto LABEL_17;
    }
LABEL_16:
    v13 = (void *)[(NSMutableDictionary *)self->_partsByURL objectForKey:a3];
    if (v13) {
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  if (a3) {
    goto LABEL_16;
  }
LABEL_17:
  uint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "path"), "lastPathComponent");
  if (v14) {
    v13 = (void *)[(NSMutableDictionary *)self->_partsByFilename objectForKey:v14];
  }
  else {
    v13 = 0;
  }
LABEL_20:
  id v15 = v13;
  [(MFLock *)self->_lock unlock];
  return v13;
}

- (id)attachmentForURL:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MFWebMessageDocument;
  id v5 = -[MFWebAttachmentSource attachmentForURL:](&v9, sel_attachmentForURL_);
  if (!v5)
  {
    id v6 = [(MFWebMessageDocument *)self mimePartForURL:a3];
    if (v6 && (uint64_t v7 = (void *)[v6 attachments], objc_msgSend(v7, "count")))
    {
      id v5 = (id)[v7 objectAtIndex:0];
      [(MFWebAttachmentSource *)self setAttachment:v5 forURL:a3];
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (id)attachmentsInDocument
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(MFWebMessageDocument *)self mimePartForURL:0];
  [(MFLock *)self->_lock lock];
  objc_super v3 = (void *)[(NSMutableDictionary *)self->_partsByURL allKeys];
  [(MFLock *)self->_lock unlock];
  if (![v3 count]) {
    return 0;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = [(MFWebMessageDocument *)self attachmentForURL:*(void *)(*((void *)&v12 + 1) + 8 * v8)];
        if (v9) {
          [v4 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  id v10 = v4;
  return v4;
}

- (id)fileWrapper
{
  id v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F73500]), "initRegularFileWithContents:", -[MFWebMessageDocument htmlData](self, "htmlData"));
  [(MFMimePart *)[(MFWebMessageDocument *)self mimePart] configureFileWrapper:v3];
  return v3;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (MFMimeBody)mimeBody
{
  return self->_mimeBody;
}

- (NSData)htmlData
{
  return self->_htmlData;
}

- (void)setPreferredEncoding:(unsigned int)a3
{
  self->_preferredEncoding = a3;
}

- (BOOL)isVisuallyEmpty
{
  return self->_visuallyEmpty;
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