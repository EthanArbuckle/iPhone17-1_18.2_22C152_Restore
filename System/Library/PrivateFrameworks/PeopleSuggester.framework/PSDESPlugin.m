@interface PSDESPlugin
+ (void)initialize;
- (BOOL)shouldDownloadAttachmentWithURL:(id)a3 recipe:(id)a4 recordInfo:(id)a5;
- (_DKKnowledgeQuerying)knowledgeStore;
- (void)setKnowledgeStore:(id)a3;
@end

@implementation PSDESPlugin

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sLog_1 = (uint64_t)os_log_create("com.apple.PeopleSuggester.dodML", "Plugin");
    MEMORY[0x1F41817F8]();
  }
}

- (BOOL)shouldDownloadAttachmentWithURL:(id)a3 recipe:(id)a4 recordInfo:(id)a5
{
  return 1;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end