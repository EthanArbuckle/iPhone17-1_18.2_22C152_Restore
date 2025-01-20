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

- (MFWebAttachmentSource)init
{
  v9.receiver = self;
  v9.super_class = (Class)MFWebAttachmentSource;
  v2 = [(MFWebAttachmentSource *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F734E8]) initWithName:@"MFWebAttachmentSource_AttachmentLock" andDelegate:v2];
    attachmentsLock = v2->_attachmentsLock;
    v2->_attachmentsLock = (MFLock *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    attachmentsByURL = v2->_attachmentsByURL;
    v2->_attachmentsByURL = v5;

    v7 = [(id)objc_opt_class() _setOfAllSources];
    [v7 addObject:v2];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [(id)objc_opt_class() _setOfAllSources];
  [v3 removeObject:self];

  v4.receiver = self;
  v4.super_class = (Class)MFWebAttachmentSource;
  [(MFWebAttachmentSource *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentsByURL, 0);
  objc_storeStrong((id *)&self->_attachmentsLock, 0);
}

+ (id)_setOfAllSources
{
  if (_setOfAllSources_onceToken != -1) {
    dispatch_once(&_setOfAllSources_onceToken, &__block_literal_global_61);
  }
  v2 = (void *)_setOfAllSources_sAllWebAttachmentSources;
  return v2;
}

void __41__MFWebAttachmentSource__setOfAllSources__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F735A0]);
  v1 = (void *)_setOfAllSources_sAllWebAttachmentSources;
  _setOfAllSources_sAllWebAttachmentSources = (uint64_t)v0;
}

+ (id)allSources
{
  v2 = [a1 _setOfAllSources];
  uint64_t v3 = [v2 allObjects];
  objc_super v4 = [v3 sortedArrayUsingFunction:_SortWebAttachmentSources context:0];

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(NSMutableDictionary *)self->_attachmentsByURL description];
  v7 = [v3 stringWithFormat:@"<%@ %p>, attachments=%@", v5, self, v6];

  return v7;
}

- (id)attachmentForURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(MFLock *)self->_attachmentsLock lock];
    v5 = [(NSMutableDictionary *)self->_attachmentsByURL objectForKeyedSubscript:v4];
    [(MFLock *)self->_attachmentsLock unlock];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)setAttachment:(id)a3 forURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(MFLock *)self->_attachmentsLock lock];
  [(NSMutableDictionary *)self->_attachmentsByURL setObject:v6 forKey:v7];
  [(MFLock *)self->_attachmentsLock unlock];

  return 1;
}

- (void)removeAttachmentForURL:(id)a3
{
  id v4 = a3;
  [(MFLock *)self->_attachmentsLock lock];
  [(NSMutableDictionary *)self->_attachmentsByURL removeObjectForKey:v4];
  [(MFLock *)self->_attachmentsLock unlock];
}

@end