@interface SFStartPageBackgroundImageModel
- (BOOL)isCustomImage;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSelected;
- (NSItemProvider)itemProvider;
- (NSString)mobileAssetFileName;
- (NSString)profileIdentifier;
- (NSString)symbolName;
- (SFStartPageBackgroundImageModel)initWithIndex:(int64_t)a3 inDataSource:(id)a4 selected:(BOOL)a5;
- (SFStartPageBackgroundImageModel)initWithItemProvider:(id)a3;
- (SFStartPageBackgroundImageModel)initWithItemProvider:(id)a3 fileName:(id)a4 selected:(BOOL)a5;
- (SFStartPageBackgroundImageModel)initWithItemProvider:(id)a3 symbolName:(id)a4 profileIdentifier:(id)a5 selected:(BOOL)a6;
- (WBSStartPageBackgroundImageDescription)imageDescription;
- (id)description;
- (unint64_t)hash;
- (void)getThumbnailImageWithCompletionHandler:(id)a3;
- (void)setMobileAssetFileName:(id)a3;
- (void)setProfileIdentifier:(id)a3;
- (void)setSymbolName:(id)a3;
@end

@implementation SFStartPageBackgroundImageModel

- (SFStartPageBackgroundImageModel)initWithItemProvider:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFStartPageBackgroundImageModel;
  v6 = [(SFStartPageBackgroundImageModel *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_itemProvider, a3);
    v7->_selected = v5 != 0;
    v8 = v7;
  }

  return v7;
}

- (SFStartPageBackgroundImageModel)initWithItemProvider:(id)a3 symbolName:(id)a4 profileIdentifier:(id)a5 selected:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SFStartPageBackgroundImageModel;
  v14 = [(SFStartPageBackgroundImageModel *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_itemProvider, a3);
    v15->_selected = a6;
    objc_storeStrong((id *)&v15->_symbolName, a4);
    objc_storeStrong((id *)&v15->_profileIdentifier, a5);
    v16 = v15;
  }

  return v15;
}

- (SFStartPageBackgroundImageModel)initWithItemProvider:(id)a3 fileName:(id)a4 selected:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SFStartPageBackgroundImageModel;
  id v11 = [(SFStartPageBackgroundImageModel *)&v17 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_itemProvider, a3);
    v12->_selected = a5;
    uint64_t v13 = [v10 copy];
    mobileAssetFileName = v12->_mobileAssetFileName;
    v12->_mobileAssetFileName = (NSString *)v13;

    v15 = v12;
  }

  return v12;
}

- (SFStartPageBackgroundImageModel)initWithIndex:(int64_t)a3 inDataSource:(id)a4 selected:(BOOL)a5
{
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SFStartPageBackgroundImageModel;
  id v10 = [(SFStartPageBackgroundImageModel *)&v14 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_dataSource, a4);
    v11->_index = a3;
    v11->_selected = a5;
    id v12 = v11;
  }

  return v11;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v4 = v3;
  if (self->_itemProvider)
  {
    [v3 appendFormat:@"itemProvider = %@", self->_itemProvider];
  }
  else if (self->_dataSource)
  {
    [v3 appendFormat:@"dataSource = %@; index = %zd", self->_dataSource, self->_index];
  }
  else
  {
    [v3 appendFormat:@"no-content"];
  }
  if ([(SFStartPageBackgroundImageModel *)self isCustomImage]) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  if (self->_selected) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v7 = v5;
  [v4 appendFormat:@"; isCustom = %@; isSelected = %@>", v7, v6];

  return v4;
}

- (void)getThumbnailImageWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = self->_itemProvider;
  v6 = v5;
  if (v5)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__SFStartPageBackgroundImageModel_getThumbnailImageWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E54EB460;
    objc_super v14 = v5;
    id v15 = v4;
    [(NSItemProvider *)v14 loadPreviewImageWithOptions:0 completionHandler:v13];

    v7 = v14;
  }
  else
  {
    dataSource = self->_dataSource;
    if (!dataSource)
    {
      id v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus"];
      (*((void (**)(id, void *, uint64_t))v4 + 2))(v4, v10, 1);

      goto LABEL_6;
    }
    int64_t index = self->_index;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__SFStartPageBackgroundImageModel_getThumbnailImageWithCompletionHandler___block_invoke_5;
    v11[3] = &unk_1E54EB488;
    id v12 = (NSItemProvider *)v4;
    [(WBSStartPageBackgroundImagesDataSource *)dataSource imageThumbnailWithItemIndex:index completion:v11];
    v7 = v12;
  }

LABEL_6:
}

void __74__SFStartPageBackgroundImageModel_getThumbnailImageWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5
    && (self,
        v7 = objc_claimAutoreleasedReturnValue(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        (isKindOfClass & 1) != 0))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__SFStartPageBackgroundImageModel_getThumbnailImageWithCompletionHandler___block_invoke_4;
    block[3] = &unk_1E54EB410;
    id v9 = &v15;
    id v15 = *(id *)(a1 + 40);
    id v14 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = objc_opt_class();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __74__SFStartPageBackgroundImageModel_getThumbnailImageWithCompletionHandler___block_invoke_2;
    v16[3] = &unk_1E54EB438;
    id v17 = *(id *)(a1 + 40);
    id v12 = (id)[v10 loadObjectOfClass:v11 completionHandler:v16];
    id v9 = &v17;
  }
}

void __74__SFStartPageBackgroundImageModel_getThumbnailImageWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__SFStartPageBackgroundImageModel_getThumbnailImageWithCompletionHandler___block_invoke_3;
  v6[3] = &unk_1E54EB410;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __74__SFStartPageBackgroundImageModel_getThumbnailImageWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __74__SFStartPageBackgroundImageModel_getThumbnailImageWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __74__SFStartPageBackgroundImageModel_getThumbnailImageWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (v3)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:", objc_msgSend(v3, "CGImage"));
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (WBSStartPageBackgroundImageDescription)imageDescription
{
  return (WBSStartPageBackgroundImageDescription *)[(WBSStartPageBackgroundImagesDataSource *)self->_dataSource imageURLAndLuminanceWithItemIndex:self->_index];
}

- (BOOL)isCustomImage
{
  return self->_itemProvider && !self->_profileIdentifier && self->_mobileAssetFileName == 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (unsigned __int8 *)v4;
    id v6 = v5;
    if (self->_dataSource == (WBSStartPageBackgroundImagesDataSource *)*((void *)v5 + 1)
      && self->_index == *((void *)v5 + 2)
      && self->_itemProvider == (NSItemProvider *)*((void *)v5 + 3)
      && self->_selected == v5[32]
      && WBSIsEqual()
      && WBSIsEqual())
    {
      char v7 = WBSIsEqual();
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(WBSStartPageBackgroundImagesDataSource *)self->_dataSource hash];
  id v4 = [NSNumber numberWithInteger:self->_index];
  uint64_t v5 = [v4 hash];
  uint64_t v6 = [(NSItemProvider *)self->_itemProvider hash];
  char v7 = [NSNumber numberWithBool:self->_selected];
  unint64_t v8 = v5 ^ v3 ^ v6 ^ [v7 hash];

  return v8;
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
}

- (NSString)mobileAssetFileName
{
  return self->_mobileAssetFileName;
}

- (void)setMobileAssetFileName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetFileName, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end