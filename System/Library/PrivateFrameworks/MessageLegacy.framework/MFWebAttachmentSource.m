@interface MFWebAttachmentSource
+ (id)_setOfAllSources;
+ (id)allSources;
- (BOOL)setAttachment:(id)a3 forURL:(id)a4;
- (MFWebAttachmentSource)init;
- (id)attachmentForURL:(id)a3;
- (id)description;
- (void)dealloc;
- (void)removeAttachmentForURL:(id)a3;
@end

@implementation MFWebAttachmentSource

+ (id)_setOfAllSources
{
  if (_setOfAllSources_onceToken != -1) {
    dispatch_once(&_setOfAllSources_onceToken, &__block_literal_global_21);
  }
  return (id)_setOfAllSources_sAllWebAttachmentSources;
}

id __41__MFWebAttachmentSource__setOfAllSources__block_invoke()
{
  id result = objc_alloc_init(MEMORY[0x1E4F735A0]);
  _setOfAllSources_sAllWebAttachmentSources = (uint64_t)result;
  return result;
}

+ (id)allSources
{
  v2 = objc_msgSend((id)objc_msgSend(a1, "_setOfAllSources"), "allObjects");
  return (id)[v2 sortedArrayUsingFunction:_SortWebAttachmentSources context:0];
}

- (MFWebAttachmentSource)init
{
  v4.receiver = self;
  v4.super_class = (Class)MFWebAttachmentSource;
  v2 = [(MFWebAttachmentSource *)&v4 init];
  if (v2)
  {
    v2->_attachmentsLock = (MFLock *)[objc_alloc(MEMORY[0x1E4F734E8]) initWithName:@"MFWebAttachmentSource_AttachmentLock" andDelegate:v2];
    v2->_attachmentsByURL = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_setOfAllSources"), "addObject:", v2);
  }
  return v2;
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p>, attachments=%@", NSStringFromClass(v4), self, -[NSMutableDictionary description](self->_attachmentsByURL, "description")];
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_setOfAllSources"), "removeObject:", self);

  v3.receiver = self;
  v3.super_class = (Class)MFWebAttachmentSource;
  [(MFWebAttachmentSource *)&v3 dealloc];
}

- (id)attachmentForURL:(id)a3
{
  if (!a3) {
    return 0;
  }
  [(MFLock *)self->_attachmentsLock lock];
  id v5 = (id)[(NSMutableDictionary *)self->_attachmentsByURL objectForKey:a3];
  [(MFLock *)self->_attachmentsLock unlock];
  return v5;
}

- (BOOL)setAttachment:(id)a3 forURL:(id)a4
{
  return 1;
}

- (void)removeAttachmentForURL:(id)a3
{
  [(MFLock *)self->_attachmentsLock lock];
  [(NSMutableDictionary *)self->_attachmentsByURL removeObjectForKey:a3];
  attachmentsLock = self->_attachmentsLock;
  [(MFLock *)attachmentsLock unlock];
}

@end