@interface MFAttachmentCompositionContext
- (MFAttachmentCompositionContext)init;
- (MFAttachmentCompositionContext)initWithContextID:(id)a3;
- (MFAttachmentManager)attachmentsManager;
- (NSArray)attachments;
- (NSString)contextID;
- (NSURL)attachmentsBaseURL;
- (id)attachmentForHostIdentifier:(id)a3;
- (void)dealloc;
- (void)setAttachmentsBaseURL:(id)a3;
- (void)setAttachmentsManager:(id)a3;
- (void)setHostIdentifier:(id)a3 forAttachment:(id)a4;
@end

@implementation MFAttachmentCompositionContext

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [(MFAttachmentCompositionContext *)self attachments];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v14 + 1) + 8 * v6);
        v8 = [(MFAttachmentCompositionContext *)self attachmentsManager];
        v9 = [v7 url];
        [v8 removeAttachmentForURL:v9];

        v10 = [(MFAttachmentCompositionContext *)self attachmentsManager];
        [v10 clearMetadataForAttachment:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  v11 = [(MFAttachmentCompositionContext *)self attachmentsManager];
  v12 = [(MFAttachmentCompositionContext *)self attachmentsBaseURL];
  [v11 removeProviderForBaseURL:v12];

  v13.receiver = self;
  v13.super_class = (Class)MFAttachmentCompositionContext;
  [(MFAttachmentCompositionContext *)&v13 dealloc];
}

- (MFAttachmentCompositionContext)init
{
  v3 = objc_msgSend(NSString, "ef_UUID");
  uint64_t v4 = [(MFAttachmentCompositionContext *)self initWithContextID:v3];

  return v4;
}

- (MFAttachmentCompositionContext)initWithContextID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFAttachmentCompositionContext;
  uint64_t v5 = [(MFAttachmentCompositionContext *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contextID = v5->_contextID;
    v5->_contextID = (NSString *)v6;
  }
  return v5;
}

- (NSArray)attachments
{
  v3 = [(MFAttachmentCompositionContext *)self attachmentsManager];
  id v4 = [(MFAttachmentCompositionContext *)self contextID];
  uint64_t v5 = [v3 attachmentsForContext:v4];

  return (NSArray *)v5;
}

- (void)setHostIdentifier:(id)a3 forAttachment:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (!self->_hostIdentifierToAttachmentContentIDMap)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    hostIdentifierToAttachmentContentIDMap = self->_hostIdentifierToAttachmentContentIDMap;
    self->_hostIdentifierToAttachmentContentIDMap = v7;
  }
  objc_super v9 = [v6 contentID];
  [(NSMutableDictionary *)self->_hostIdentifierToAttachmentContentIDMap setObject:v9 forKeyedSubscript:v10];
}

- (id)attachmentForHostIdentifier:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_hostIdentifierToAttachmentContentIDMap objectForKeyedSubscript:a3];
  uint64_t v5 = [(MFAttachmentCompositionContext *)self attachmentsManager];
  id v6 = [v5 attachmentForContentID:v4];

  return v6;
}

- (NSString)contextID
{
  return self->_contextID;
}

- (NSURL)attachmentsBaseURL
{
  return self->_attachmentsBaseURL;
}

- (void)setAttachmentsBaseURL:(id)a3
{
}

- (MFAttachmentManager)attachmentsManager
{
  return self->_attachmentsManager;
}

- (void)setAttachmentsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentsManager, 0);
  objc_storeStrong((id *)&self->_attachmentsBaseURL, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_hostIdentifierToAttachmentContentIDMap, 0);
}

@end