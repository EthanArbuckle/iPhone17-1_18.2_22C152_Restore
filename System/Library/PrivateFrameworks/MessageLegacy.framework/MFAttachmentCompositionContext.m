@interface MFAttachmentCompositionContext
- (MFAttachmentCompositionContext)init;
- (MFAttachmentCompositionContext)initWithContextID:(id)a3;
- (NSArray)attachments;
- (NSString)contextID;
- (NSURL)attachmentsBaseURL;
- (void)dealloc;
- (void)setAttachmentsBaseURL:(id)a3;
@end

@implementation MFAttachmentCompositionContext

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(MFAttachmentCompositionContext *)self attachments];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        objc_msgSend(+[MFAttachmentManager defaultManager](MFAttachmentManager, "defaultManager"), "removeAttachmentForURL:", objc_msgSend(v8, "url"));
        objc_msgSend(+[MFAttachmentManager defaultManager](MFAttachmentManager, "defaultManager"), "clearMetadataForAttachment:", v8);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  objc_msgSend(+[MFAttachmentManager defaultManager](MFAttachmentManager, "defaultManager"), "removeProviderForBaseURL:", -[MFAttachmentCompositionContext attachmentsBaseURL](self, "attachmentsBaseURL"));

  v9.receiver = self;
  v9.super_class = (Class)MFAttachmentCompositionContext;
  [(MFAttachmentCompositionContext *)&v9 dealloc];
}

- (NSArray)attachments
{
  id v3 = +[MFAttachmentManager defaultManager];
  uint64_t v4 = [(MFAttachmentCompositionContext *)self contextID];
  return (NSArray *)[v3 attachmentsForContext:v4];
}

- (NSString)contextID
{
  return self->_contextID;
}

- (NSURL)attachmentsBaseURL
{
  return self->_attachmentsBaseURL;
}

- (MFAttachmentCompositionContext)init
{
  uint64_t v3 = objc_msgSend(NSString, "mf_UUID");
  return [(MFAttachmentCompositionContext *)self initWithContextID:v3];
}

- (MFAttachmentCompositionContext)initWithContextID:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFAttachmentCompositionContext;
  uint64_t v4 = [(MFAttachmentCompositionContext *)&v6 init];
  if (v4) {
    v4->_contextID = (NSString *)a3;
  }
  return v4;
}

- (void)setAttachmentsBaseURL:(id)a3
{
}

@end