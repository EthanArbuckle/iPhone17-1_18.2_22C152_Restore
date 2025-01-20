@interface NEIssueLinkPresentationSource
- (FCIssue)issue;
- (LPLinkMetadata)linkMetadata;
- (NEIssueLinkPresentationSource)initWithIssue:(id)a3;
- (id)imageItemProviderFromIssue:(id)a3;
- (id)subtitleFromIssue:(id)a3;
- (id)titleFromIssue:(id)a3;
- (id)urlFromIssue:(id)a3;
@end

@implementation NEIssueLinkPresentationSource

- (NEIssueLinkPresentationSource)initWithIssue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NEIssueLinkPresentationSource;
  v6 = [(NEIssueLinkPresentationSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_issue, a3);
  }

  return v7;
}

- (LPLinkMetadata)linkMetadata
{
  v3 = [(NEIssueLinkPresentationSource *)self issue];
  v4 = [(NEIssueLinkPresentationSource *)self titleFromIssue:v3];

  id v5 = [(NEIssueLinkPresentationSource *)self issue];
  v6 = [(NEIssueLinkPresentationSource *)self subtitleFromIssue:v5];

  v7 = [(NEIssueLinkPresentationSource *)self issue];
  v8 = [(NEIssueLinkPresentationSource *)self urlFromIssue:v7];

  objc_super v9 = [NSString stringWithFormat:@"%@ - %@", v4, v6];
  v10 = [(NEIssueLinkPresentationSource *)self issue];
  v11 = [(NEIssueLinkPresentationSource *)self imageItemProviderFromIssue:v10];

  v12 = [[NELinkMetadataSource alloc] initWithTitle:v9 url:v8 imageProvider:v11 iconProvider:v11];
  v13 = [(NELinkMetadataSource *)v12 linkMetadata];

  return (LPLinkMetadata *)v13;
}

- (id)titleFromIssue:(id)a3
{
  return (id)[a3 title];
}

- (id)subtitleFromIssue:(id)a3
{
  return (id)[a3 coverDate];
}

- (id)imageItemProviderFromIssue:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  id v5 = [(id)*MEMORY[0x1E4F44460] identifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__NEIssueLinkPresentationSource_imageItemProviderFromIssue___block_invoke;
  v8[3] = &unk_1E6415880;
  id v9 = v3;
  id v6 = v3;
  [v4 registerItemForTypeIdentifier:v5 loadHandler:v8];

  return v4;
}

void __60__NEIssueLinkPresentationSource_imageItemProviderFromIssue___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v2 = v4;
  id v3 = (id)FCFetchThumbnailForIssue();
}

void __60__NEIssueLinkPresentationSource_imageItemProviderFromIssue___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(25, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__NEIssueLinkPresentationSource_imageItemProviderFromIssue___block_invoke_3;
  v7[3] = &unk_1E6415830;
  id v8 = v4;
  id v9 = *(id *)(a1 + 32);
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__NEIssueLinkPresentationSource_imageItemProviderFromIssue___block_invoke_3(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4FB1818];
  id v3 = [*(id *)(a1 + 32) filePath];
  id v4 = [v2 imageWithContentsOfFile:v3];
  UIImagePNGRepresentation(v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)urlFromIssue:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [a3 identifier];
  id v5 = objc_msgSend(v3, "nss_NewsURLForIssueID:", v4);

  return v5;
}

- (FCIssue)issue
{
  return self->_issue;
}

- (void).cxx_destruct
{
}

@end