@interface PXPostFilesToSharedAlbumAction
- (PXPostFilesToSharedAlbumAction)initWithSharedAlbum:(id)a3 fileURLs:(id)a4 comment:(id)a5;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXPostFilesToSharedAlbumAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_fileURLs, 0);
  objc_storeStrong((id *)&self->_sharedAlbum, 0);
}

- (void)performUndo:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28C58];
  id v5 = a3;
  objc_msgSend(v4, "px_genericErrorWithDebugDescription:", @"No undo support for post actions");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a3 + 2))(v5, 0, v6);
}

- (void)performAction:(id)a3
{
  v4 = (void (**)(id, void, id))a3;
  id v5 = self->_fileURLs;
  if (![(NSArray *)v5 count])
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<PLStreamShareSource *> * _Nullable _StreamShareSourcesForFileURLs(NSArray<NSURL *> *__strong, NSError *__autoreleasing *)");
    [v14 handleFailureInFunction:v15, @"PXPostFilesToSharedAlbumAction.m", 142, @"Invalid parameter not satisfying: %@", @"fileURLs.count" file lineNumber description];
  }
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 1;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__183620;
  v32 = __Block_byref_object_dispose__183621;
  id v33 = 0;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = ___StreamShareSourcesForFileURLs_block_invoke;
  v24[3] = &unk_1E5DC29C0;
  id v7 = v6;
  id v25 = v7;
  v26 = &v34;
  v27 = &v28;
  [(NSArray *)v5 enumerateObjectsUsingBlock:v24];
  if (*((unsigned char *)v35 + 24))
  {
    id v8 = v7;
    id v9 = 0;
  }
  else
  {
    id v9 = (id) v29[5];
    id v8 = 0;
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  id v10 = v9;
  if (!v8)
  {
    v4[2](v4, 0, v10);
    goto LABEL_11;
  }
  v11 = [(PHCloudSharedAlbum *)self->_sharedAlbum pl_assetContainer];
  if (!v11)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = [NSString stringWithUTF8String:"-[PXPostFilesToSharedAlbumAction performAction:]"];
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    [v16 handleFailureInFunction:v17, @"PXPostFilesToSharedAlbumAction.m", 50, @"%@ should be an instance inheriting from %@, but it is nil", @"_sharedAlbum.pl_assetContainer", v19 file lineNumber description];
LABEL_14:

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = [NSString stringWithUTF8String:"-[PXPostFilesToSharedAlbumAction performAction:]"];
    v20 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v20);
    v21 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
    [v16 handleFailureInFunction:v17, @"PXPostFilesToSharedAlbumAction.m", 50, @"%@ should be an instance inheriting from %@, but it is %@", @"_sharedAlbum.pl_assetContainer", v19, v21 file lineNumber description];

    goto LABEL_14;
  }
LABEL_9:
  v12 = (void *)MEMORY[0x1E4F8A738];
  comment = self->_comment;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __48__PXPostFilesToSharedAlbumAction_performAction___block_invoke;
  v22[3] = &unk_1E5DCDD58;
  v23 = v4;
  [v12 publishMediaFromSources:v8 toSharedAlbum:v11 withCommentText:comment completionHandler:v22];

LABEL_11:
}

uint64_t __48__PXPostFilesToSharedAlbumAction_performAction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)actionNameLocalizationKey
{
  return @"PXPostToSharedAlbumActionName";
}

- (id)actionIdentifier
{
  return @"PostFilesToSharedAlbum";
}

- (PXPostFilesToSharedAlbumAction)initWithSharedAlbum:(id)a3 fileURLs:(id)a4 comment:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PXPostFilesToSharedAlbumAction.m", 23, @"Invalid parameter not satisfying: %@", @"sharedAlbum" object file lineNumber description];
  }
  if (![v11 count])
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXPostFilesToSharedAlbumAction.m", 24, @"Invalid parameter not satisfying: %@", @"fileURLs.count" object file lineNumber description];
  }
  v13 = [v10 photoLibrary];
  v22.receiver = self;
  v22.super_class = (Class)PXPostFilesToSharedAlbumAction;
  v14 = [(PXPhotosAction *)&v22 initWithPhotoLibrary:v13];

  if (v14)
  {
    objc_storeStrong((id *)&v14->_sharedAlbum, a3);
    uint64_t v15 = [v11 copy];
    fileURLs = v14->_fileURLs;
    v14->_fileURLs = (NSArray *)v15;

    uint64_t v17 = [v12 copy];
    comment = v14->_comment;
    v14->_comment = (NSString *)v17;
  }
  return v14;
}

@end