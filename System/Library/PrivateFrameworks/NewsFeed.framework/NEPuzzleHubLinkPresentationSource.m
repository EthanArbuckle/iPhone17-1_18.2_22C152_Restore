@interface NEPuzzleHubLinkPresentationSource
- (FCTagProviding)tag;
- (LPLinkMetadata)linkMetadata;
- (NEPuzzleHubLinkPresentationSource)initWithTitle:(id)a3 tag:(id)a4;
- (NSString)title;
@end

@implementation NEPuzzleHubLinkPresentationSource

- (NEPuzzleHubLinkPresentationSource)initWithTitle:(id)a3 tag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NEPuzzleHubLinkPresentationSource;
  v9 = [(NEPuzzleHubLinkPresentationSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_tag, a4);
  }

  return v10;
}

- (LPLinkMetadata)linkMetadata
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"https://apple.news/puzzles"];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  v5 = (void *)*MEMORY[0x1E4F44460];
  v6 = [(id)*MEMORY[0x1E4F44460] identifier];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__NEPuzzleHubLinkPresentationSource_linkMetadata__block_invoke;
  v15[3] = &unk_1E6415880;
  v15[4] = self;
  [v4 registerItemForTypeIdentifier:v6 loadHandler:v15];

  id v7 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  id v8 = [v5 identifier];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__NEPuzzleHubLinkPresentationSource_linkMetadata__block_invoke_3;
  v14[3] = &unk_1E6415880;
  v14[4] = self;
  [v7 registerItemForTypeIdentifier:v8 loadHandler:v14];

  v9 = [NELinkMetadataSource alloc];
  v10 = [(NEPuzzleHubLinkPresentationSource *)self title];
  v11 = [(NELinkMetadataSource *)v9 initWithTitle:v10 url:v3 imageProvider:v7 iconProvider:v4];

  objc_super v12 = [(NELinkMetadataSource *)v11 linkMetadata];

  return (LPLinkMetadata *)v12;
}

void __49__NEPuzzleHubLinkPresentationSource_linkMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) tag];
  v5 = [v4 feedNavImageAssetHandle];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__NEPuzzleHubLinkPresentationSource_linkMetadata__block_invoke_2;
  v9[3] = &unk_1E6415830;
  id v10 = v5;
  id v11 = v3;
  id v6 = v3;
  id v7 = v5;
  id v8 = (id)[v7 downloadIfNeededWithCompletion:v9];
}

void __49__NEPuzzleHubLinkPresentationSource_linkMetadata__block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1818]);
  id v3 = [*(id *)(a1 + 32) filePath];
  image = (UIImage *)[v2 initWithContentsOfFile:v3];

  id v4 = UIImagePNGRepresentation(image);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __49__NEPuzzleHubLinkPresentationSource_linkMetadata__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) tag];
  v5 = [v4 feedNavImageHQAssetHandle];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__NEPuzzleHubLinkPresentationSource_linkMetadata__block_invoke_4;
  v9[3] = &unk_1E6415830;
  id v10 = v5;
  id v11 = v3;
  id v6 = v3;
  id v7 = v5;
  id v8 = (id)[v7 downloadIfNeededWithCompletion:v9];
}

void __49__NEPuzzleHubLinkPresentationSource_linkMetadata__block_invoke_4(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1818]);
  id v3 = [*(id *)(a1 + 32) filePath];
  image = (UIImage *)[v2 initWithContentsOfFile:v3];

  id v4 = UIImagePNGRepresentation(image);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSString)title
{
  return self->_title;
}

- (FCTagProviding)tag
{
  return self->_tag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end