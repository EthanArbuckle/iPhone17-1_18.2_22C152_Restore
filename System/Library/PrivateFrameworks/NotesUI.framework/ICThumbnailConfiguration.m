@interface ICThumbnailConfiguration
- (BOOL)hasBorder;
- (BOOL)prepareThumbnail;
- (CGSize)preferredSize;
- (ICAppearanceInfo)appearanceInfo;
- (ICThumbnailConfiguration)initWithThumbnailType:(int64_t)a3 associatedObject:(id)a4 associatedObjectIdentifier:(id)a5 associatedObjectTitle:(id)a6 accountIdentifier:(id)a7 cacheLevel:(int64_t)a8 preferredSize:(CGSize)a9 scale:(double)a10 appearanceInfo:(id)a11 backgroundColor:(id)a12 hasBorder:(BOOL)a13;
- (ICThumbnailConfiguration)initWithThumbnailType:(int64_t)a3 uniqueKey:(id)a4 associatedObject:(id)a5 associatedObjectIdentifier:(id)a6 associatedObjectTitle:(id)a7 accountIdentifier:(id)a8 cacheLevel:(int64_t)a9 preferredSize:(CGSize)a10 scale:(double)a11 appearanceInfo:(id)a12 backgroundColor:(id)a13 hasBorder:(BOOL)a14;
- (ICThumbnailKey)uniqueKey;
- (NSString)associatedObjectIdentifier;
- (NSString)associatedObjectTitle;
- (UIColor)backgroundColor;
- (UITraitCollection)traitCollection;
- (double)scale;
- (id)associatedObject;
- (id)debugDescription;
- (id)fallbackBlock;
- (id)initForAttachment:(id)a3 preferredSize:(CGSize)a4 scale:(double)a5 appearanceInfo:(id)a6;
- (id)initForAvatarWithParticipants:(id)a3 preferredSize:(CGSize)a4 hasBorder:(BOOL)a5;
- (id)initForLargeQuickNoteWidgetWithNote:(id)a3 appearanceInfo:(id)a4 traitCollection:(id)a5;
- (id)initForNoteGalleryWithNote:(id)a3 preferredSize:(CGSize)a4 traitCollection:(id)a5 scale:(double)a6 appearanceInfo:(id)a7;
- (id)initForNoteListWithFoundAttachment:(id)a3 preferredSize:(CGSize)a4 scale:(double)a5 appearanceInfo:(id)a6;
- (id)initForNoteListWithNote:(id)a3 preferredSize:(CGSize)a4 scale:(double)a5 appearanceInfo:(id)a6;
- (id)initForNoteNavigationBarIconWithNote:(id)a3 preferredSize:(CGSize)a4;
- (id)initForSharePreviewThumbnailWithNote:(id)a3 appearanceInfo:(id)a4;
- (id)initForShareThumbnailWithNote:(id)a3 appearanceInfo:(id)a4;
- (id)initForShortcutsWithNote:(id)a3 preferredSize:(CGSize)a4 scale:(double)a5 appearanceInfo:(id)a6;
- (id)initForSmallQuickNoteWidgetWithNote:(id)a3 appearanceInfo:(id)a4 traitCollection:(id)a5;
- (id)initForSystemPaperChromeLayerWithThumbnailType:(int64_t)a3 traitCollection:(id)a4;
- (id)initForSystemPaperChromeWithNote:(id)a3 appearanceInfo:(id)a4;
- (id)initForSystemPaperPreviewWithNote:(id)a3 appearanceInfo:(id)a4;
- (int64_t)cacheLevel;
- (int64_t)thumbnailType;
- (void)performAsCurrentAppearance:(id)a3;
- (void)setAssociatedObject:(id)a3;
- (void)setAssociatedObjectTitle:(id)a3;
- (void)setFallbackBlock:(id)a3;
- (void)setTraitCollection:(id)a3;
@end

@implementation ICThumbnailConfiguration

- (ICThumbnailConfiguration)initWithThumbnailType:(int64_t)a3 associatedObject:(id)a4 associatedObjectIdentifier:(id)a5 associatedObjectTitle:(id)a6 accountIdentifier:(id)a7 cacheLevel:(int64_t)a8 preferredSize:(CGSize)a9 scale:(double)a10 appearanceInfo:(id)a11 backgroundColor:(id)a12 hasBorder:(BOOL)a13
{
  double height = a9.height;
  double width = a9.width;
  id v22 = a12;
  id v23 = a11;
  id v24 = a7;
  id v25 = a6;
  id v26 = a5;
  id v27 = a4;
  v28 = -[ICThumbnailKey initWithType:accountId:objectId:preferredSize:scale:appearance:]([ICThumbnailKey alloc], "initWithType:accountId:objectId:preferredSize:scale:appearance:", a3, v24, v26, [v23 type], width, height, a10);
  LOBYTE(v31) = a13;
  v29 = -[ICThumbnailConfiguration initWithThumbnailType:uniqueKey:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:uniqueKey:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", a3, v28, v27, v26, v25, v24, width, height, a10, a8, v23, v22, v31);

  return v29;
}

- (ICThumbnailKey)uniqueKey
{
  return (ICThumbnailKey *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)cacheLevel
{
  return self->_cacheLevel;
}

- (ICThumbnailConfiguration)initWithThumbnailType:(int64_t)a3 uniqueKey:(id)a4 associatedObject:(id)a5 associatedObjectIdentifier:(id)a6 associatedObjectTitle:(id)a7 accountIdentifier:(id)a8 cacheLevel:(int64_t)a9 preferredSize:(CGSize)a10 scale:(double)a11 appearanceInfo:(id)a12 backgroundColor:(id)a13 hasBorder:(BOOL)a14
{
  CGFloat height = a10.height;
  CGFloat width = a10.width;
  id v23 = a4;
  id v31 = a5;
  id v30 = a6;
  id v29 = a7;
  id v28 = a12;
  id v24 = a13;
  v32.receiver = self;
  v32.super_class = (Class)ICThumbnailConfiguration;
  id v25 = [(ICThumbnailConfiguration *)&v32 init];
  if (v25)
  {
    if (a11 <= 0.0)
    {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"scale > 0.0" functionName:"-[ICThumbnailConfiguration initWithThumbnailType:uniqueKey:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:]" simulateCrash:1 showAlert:0 format:@"Passing invalid scale to ICThumbnailConfiguration"];
      a11 = 1.0;
    }
    v25->_thumbnailType = a3;
    objc_storeStrong((id *)&v25->_uniqueKey, a4);
    objc_storeStrong(&v25->_associatedObject, a5);
    objc_storeStrong((id *)&v25->_associatedObjectIdentifier, a6);
    objc_storeStrong((id *)&v25->_associatedObjectTitle, a7);
    v25->_cacheLevel = a9;
    v25->_preferredSize.CGFloat width = width;
    v25->_preferredSize.CGFloat height = height;
    v25->_scale = a11;
    objc_storeStrong((id *)&v25->_appearanceInfo, a12);
    objc_storeStrong((id *)&v25->_backgroundColor, a13);
    v25->_hasBorder = a14;
    id v26 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
    [(ICThumbnailConfiguration *)v25 setTraitCollection:v26];
  }
  return v25;
}

- (void)setTraitCollection:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__ICThumbnailConfiguration_setTraitCollection___block_invoke;
  v6[3] = &unk_1E5FDA2B0;
  v6[4] = self;
  v4 = [a3 traitCollectionByModifyingTraits:v6];
  traitCollection = self->_traitCollection;
  self->_traitCollection = v4;
}

- (BOOL)prepareThumbnail
{
  return self->_prepareThumbnail;
}

- (CGSize)preferredSize
{
  double width = self->_preferredSize.width;
  double height = self->_preferredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)hasBorder
{
  return self->_hasBorder;
}

- (id)associatedObject
{
  return self->_associatedObject;
}

- (NSString)associatedObjectIdentifier
{
  return self->_associatedObjectIdentifier;
}

void __47__ICThumbnailConfiguration_setTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 scale];
  objc_msgSend(v4, "setDisplayScale:");
  id v6 = [*(id *)(a1 + 32) appearanceInfo];
  v5 = [v6 defaultTraitCollection];
  objc_msgSend(v4, "setUserInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));
}

- (double)scale
{
  return self->_scale;
}

- (ICAppearanceInfo)appearanceInfo
{
  return self->_appearanceInfo;
}

- (id)initForAvatarWithParticipants:(id)a3 preferredSize:(CGSize)a4 hasBorder:(BOOL)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  v10 = objc_msgSend(v9, "ic_map:", &__block_literal_global_21);
  v11 = objc_msgSend(v9, "ic_compactMap:", &__block_literal_global_21);

  v12 = [v11 componentsJoinedByString:@"-"];

  objc_msgSend(MEMORY[0x1E4FB1BA8], "ic_scale");
  double v14 = v13;
  v15 = [MEMORY[0x1E4F83298] appearanceInfoWithType:0];
  LOBYTE(v18) = a5;
  v16 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 8, v10, v12, 0, 0, 1, width, height, v14, v15, 0, v18);

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong(&self->_fallbackBlock, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_appearanceInfo, 0);
  objc_storeStrong((id *)&self->_uniqueKey, 0);
  objc_storeStrong((id *)&self->_associatedObjectTitle, 0);
  objc_storeStrong((id *)&self->_associatedObjectIdentifier, 0);
  objc_storeStrong(&self->_associatedObject, 0);
}

- (int64_t)thumbnailType
{
  return self->_thumbnailType;
}

- (id)initForNoteListWithNote:(id)a3 preferredSize:(CGSize)a4 scale:(double)a5 appearanceInfo:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  id v12 = a3;
  double v13 = [v12 identifier];
  double v14 = [v12 title];
  v15 = [v12 account];

  v16 = [v15 identifier];
  LOBYTE(v19) = 0;
  v17 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 2, 0, v13, v14, v16, 1, width, height, a5, v11, 0, v19);

  return v17;
}

- (id)initForNoteListWithFoundAttachment:(id)a3 preferredSize:(CGSize)a4 scale:(double)a5 appearanceInfo:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  id v12 = a3;
  double v13 = [v12 identifier];
  double v14 = [v12 title];
  v15 = [v12 note];

  v16 = [v15 account];
  v17 = [v16 identifier];
  LOBYTE(v20) = 0;
  uint64_t v18 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 3, 0, v13, v14, v17, 1, width, height, a5, v11, 0, v20);

  return v18;
}

- (id)initForNoteGalleryWithNote:(id)a3 preferredSize:(CGSize)a4 traitCollection:(id)a5 scale:(double)a6 appearanceInfo:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a7;
  id v14 = a5;
  id v15 = a3;
  v16 = [v15 identifier];
  v17 = [v15 title];
  uint64_t v18 = [v15 account];

  uint64_t v19 = [v18 identifier];
  LOBYTE(v22) = 0;
  uint64_t v20 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 1, 0, v16, v17, v19, 1, width, height, a6, v13, 0, v22);

  [(ICThumbnailConfiguration *)v20 setTraitCollection:v14];
  return v20;
}

- (id)initForShortcutsWithNote:(id)a3 preferredSize:(CGSize)a4 scale:(double)a5 appearanceInfo:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  id v12 = a3;
  id v13 = [v12 identifier];
  id v14 = [v12 title];
  id v15 = [v12 account];
  v16 = [v15 identifier];
  v17 = (void *)MEMORY[0x1E4FB1618];
  uint64_t v18 = objc_msgSend(v12, "ic_hasLightBackground");

  uint64_t v19 = objc_msgSend(v17, "ic_notePreviewBackgroundLightContent:", v18);
  LOBYTE(v22) = 0;
  uint64_t v20 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 1, 0, v13, v14, v16, 1, width, height, a5, v11, v19, v22);

  if (v20) {
    v20->_prepareThumbnail = 1;
  }
  return v20;
}

- (id)initForAttachment:(id)a3 preferredSize:(CGSize)a4 scale:(double)a5 appearanceInfo:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  id v12 = a3;
  id v13 = [v12 identifier];
  id v14 = [v12 title];
  id v15 = [v12 note];

  v16 = [v15 account];
  v17 = [v16 identifier];
  LOBYTE(v20) = 0;
  uint64_t v18 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 0, 0, v13, v14, v17, 1, width, height, a5, v11, 0, v20);

  return v18;
}

- (id)initForShareThumbnailWithNote:(id)a3 appearanceInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__16;
  v34 = __Block_byref_object_dispose__16;
  id v35 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__16;
  id v28 = __Block_byref_object_dispose__16;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__16;
  uint64_t v22 = __Block_byref_object_dispose__16;
  id v23 = 0;
  v8 = [v6 managedObjectContext];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__ICThumbnailConfiguration_initForShareThumbnailWithNote_appearanceInfo___block_invoke;
  v13[3] = &unk_1E5FDA248;
  id v15 = &v30;
  id v9 = v6;
  id v14 = v9;
  v16 = &v24;
  v17 = &v18;
  [v8 performBlockAndWait:v13];

  LOBYTE(v12) = 0;
  v10 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 2, 0, v31[5], v25[5], v19[5], 1, 128.0, 128.0, 2.0, v7, 0, v12);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v10;
}

void __73__ICThumbnailConfiguration_initForShareThumbnailWithNote_appearanceInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) title];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v11 = [*(id *)(a1 + 32) account];
  uint64_t v8 = [v11 identifier];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)initForSharePreviewThumbnailWithNote:(id)a3 appearanceInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 identifier];
  uint64_t v9 = [v7 title];
  v10 = [v7 account];
  id v11 = [v10 identifier];
  uint64_t v12 = (void *)MEMORY[0x1E4FB1618];
  uint64_t v13 = objc_msgSend(v7, "ic_hasLightBackground");

  id v14 = objc_msgSend(v12, "ic_notePreviewBackgroundLightContent:", v13);
  LOBYTE(v17) = 0;
  id v15 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 1, 0, v8, v9, v11, 1, 512.0, 512.0, 2.0, v6, v14, v17);

  return v15;
}

- (id)initForNoteNavigationBarIconWithNote:(id)a3 preferredSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = (void *)MEMORY[0x1E4FB1618];
  id v8 = a3;
  uint64_t v9 = objc_msgSend(v7, "ic_noteEditorBackgroundColor");
  v10 = [v8 identifier];
  id v11 = [v8 title];
  uint64_t v12 = [v8 account];

  uint64_t v13 = [v12 identifier];
  objc_msgSend(MEMORY[0x1E4FB1BA8], "ic_scale");
  double v15 = v14;
  v16 = [MEMORY[0x1E4F83298] currentInfo];
  LOBYTE(v19) = 0;
  uint64_t v17 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 1, 0, v10, v11, v13, 1, width, height, v15, v16, v9, v19);

  return v17;
}

- (id)initForSystemPaperChromeWithNote:(id)a3 appearanceInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 identifier];
  uint64_t v9 = [v7 title];
  v10 = [v7 account];
  id v11 = [v10 identifier];
  objc_msgSend(MEMORY[0x1E4FB1BA8], "ic_scale");
  double v13 = v12;
  double v14 = (void *)MEMORY[0x1E4FB1618];
  uint64_t v15 = objc_msgSend(v7, "ic_hasLightBackground");

  v16 = objc_msgSend(v14, "ic_notePreviewBackgroundLightContent:", v15);
  LOBYTE(v19) = 0;
  uint64_t v17 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 4, 0, v8, v9, v11, 2, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), v13, v6, v16, v19);

  return v17;
}

- (id)initForSystemPaperChromeLayerWithThumbnailType:(int64_t)a3 traitCollection:(id)a4
{
  id v6 = a4;
  id v7 = [ICThumbnailKey alloc];
  double v8 = *MEMORY[0x1E4F1DB30];
  double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  v10 = -[ICThumbnailKey initWithType:accountId:objectId:preferredSize:traitCollection:](v7, "initWithType:accountId:objectId:preferredSize:traitCollection:", a3, 0, 0, v6, *MEMORY[0x1E4F1DB30], v9);
  BOOL v11 = [v6 userInterfaceStyle] == 2;
  [v6 displayScale];
  double v13 = v12;
  double v14 = [MEMORY[0x1E4F83298] appearanceInfoWithType:v11];
  LOBYTE(v17) = 0;
  uint64_t v15 = -[ICThumbnailConfiguration initWithThumbnailType:uniqueKey:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:uniqueKey:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", a3, v10, 0, 0, 0, 0, v8, v9, v13, 0, v14, 0, v17);

  [(ICThumbnailConfiguration *)v15 setTraitCollection:v6];
  return v15;
}

- (id)initForLargeQuickNoteWidgetWithNote:(id)a3 appearanceInfo:(id)a4 traitCollection:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = [v10 identifier];
  double v12 = [v10 title];
  double v13 = [v10 account];

  double v14 = [v13 identifier];
  objc_msgSend(MEMORY[0x1E4FB1BA8], "ic_scale");
  LOBYTE(v18) = 0;
  v16 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 10, 0, v11, v12, v14, 2, 350.0, 380.0, v15, v9, 0, v18);

  [(ICThumbnailConfiguration *)v16 setTraitCollection:v8];
  return v16;
}

- (id)initForSmallQuickNoteWidgetWithNote:(id)a3 appearanceInfo:(id)a4 traitCollection:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = [v10 identifier];
  double v12 = [v10 title];
  double v13 = [v10 account];

  double v14 = [v13 identifier];
  objc_msgSend(MEMORY[0x1E4FB1BA8], "ic_scale");
  LOBYTE(v18) = 0;
  v16 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 11, 0, v11, v12, v14, 2, 150.0, 162.0, v15, v9, 0, v18);

  [(ICThumbnailConfiguration *)v16 setTraitCollection:v8];
  return v16;
}

- (id)initForSystemPaperPreviewWithNote:(id)a3 appearanceInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 identifier];
  id v9 = [v7 title];
  id v10 = [v7 account];
  BOOL v11 = [v10 identifier];
  objc_msgSend(MEMORY[0x1E4FB1BA8], "ic_scale");
  double v13 = v12;
  double v14 = (void *)MEMORY[0x1E4FB1618];
  uint64_t v15 = objc_msgSend(v7, "ic_hasLightBackground");

  v16 = objc_msgSend(v14, "ic_notePreviewBackgroundLightContent:", v15);
  LOBYTE(v19) = 0;
  uint64_t v17 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 7, 0, v8, v9, v11, 2, 110.0, 121.0, v13, v6, v16, v19);

  return v17;
}

uint64_t __82__ICThumbnailConfiguration_initForAvatarWithParticipants_preferredSize_hasBorder___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E4F1B8F8], "ic_contactFromParticipant:", a2);
}

id __82__ICThumbnailConfiguration_initForAvatarWithParticipants_preferredSize_hasBorder___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 userIdentity];
  uint64_t v3 = [v2 userRecordID];
  id v4 = [v3 recordName];

  return v4;
}

- (void)performAsCurrentAppearance:(id)a3
{
  id v4 = a3;
  id v5 = [(ICThumbnailConfiguration *)self traitCollection];
  [v5 performAsCurrentTraitCollection:v4];
}

- (id)debugDescription
{
  uint64_t v2 = [(ICThumbnailConfiguration *)self uniqueKey];
  uint64_t v3 = [v2 description];

  return v3;
}

- (void)setAssociatedObject:(id)a3
{
}

- (NSString)associatedObjectTitle
{
  return self->_associatedObjectTitle;
}

- (void)setAssociatedObjectTitle:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (id)fallbackBlock
{
  return self->_fallbackBlock;
}

- (void)setFallbackBlock:(id)a3
{
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

@end