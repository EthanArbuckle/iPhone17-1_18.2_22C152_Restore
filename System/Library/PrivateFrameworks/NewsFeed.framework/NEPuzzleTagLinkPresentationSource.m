@interface NEPuzzleTagLinkPresentationSource
- (FCPuzzleTypeProviding)puzzleTag;
- (LPLinkMetadata)linkMetadata;
- (NEPuzzleTagLinkPresentationSource)initWithPuzzleTag:(id)a3;
@end

@implementation NEPuzzleTagLinkPresentationSource

- (NEPuzzleTagLinkPresentationSource)initWithPuzzleTag:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NEPuzzleTagLinkPresentationSource;
  v6 = [(NEPuzzleTagLinkPresentationSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_puzzleTag, a3);
  }

  return v7;
}

- (LPLinkMetadata)linkMetadata
{
  v3 = [(NEPuzzleTagLinkPresentationSource *)self puzzleTag];
  v4 = [v3 nameForSharing];

  id v5 = (void *)MEMORY[0x1E4F1CB10];
  v6 = [(NEPuzzleTagLinkPresentationSource *)self puzzleTag];
  v7 = [v6 identifier];
  v8 = objc_msgSend(v5, "nss_NewsURLForTagID:", v7);

  id v9 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  v10 = [(id)*MEMORY[0x1E4F44460] identifier];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__NEPuzzleTagLinkPresentationSource_linkMetadata__block_invoke;
  v14[3] = &unk_1E6415880;
  v14[4] = self;
  [v9 registerItemForTypeIdentifier:v10 loadHandler:v14];

  v11 = [[NELinkMetadataSource alloc] initWithTitle:v4 url:v8 imageProvider:v9 iconProvider:v9];
  v12 = [(NELinkMetadataSource *)v11 linkMetadata];

  return (LPLinkMetadata *)v12;
}

void __49__NEPuzzleTagLinkPresentationSource_linkMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) puzzleTag];
  id v5 = [v4 feedNavImageAssetHandle];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__NEPuzzleTagLinkPresentationSource_linkMetadata__block_invoke_2;
  v9[3] = &unk_1E6415830;
  id v10 = v5;
  id v11 = v3;
  id v6 = v3;
  id v7 = v5;
  id v8 = (id)[v7 downloadIfNeededWithCompletion:v9];
}

void __49__NEPuzzleTagLinkPresentationSource_linkMetadata__block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1818]);
  id v3 = [*(id *)(a1 + 32) filePath];
  image = (UIImage *)[v2 initWithContentsOfFile:v3];

  v4 = UIImagePNGRepresentation(image);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (FCPuzzleTypeProviding)puzzleTag
{
  return self->_puzzleTag;
}

- (void).cxx_destruct
{
}

@end