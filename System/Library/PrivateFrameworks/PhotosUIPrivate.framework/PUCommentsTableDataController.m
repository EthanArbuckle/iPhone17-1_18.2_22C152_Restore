@interface PUCommentsTableDataController
- (BOOL)_canPostCommentWithText:(id)a3 localizedFailureDescription:(id *)a4;
- (BOOL)_isAssetOwnerSectionVisible;
- (BOOL)_isVideoAsset;
- (BOOL)isEditing;
- (BOOL)photoCommentEntryViewShouldEndEditing:(id)a3;
- (BOOL)shouldUseCompactCommentSeparators;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4;
- (NSString)justInsertedCommentUUID;
- (PHAsset)asset;
- (PHFetchResult)orderedCommentsFetchResult;
- (PHFetchResult)orderedLikesFetchResult;
- (PLManagedAsset)managedAsset;
- (PUCommentsTableDataController)init;
- (PUCommentsTableDataController)initWithTableView:(id)a3;
- (PUCommentsTableDataControllerDelegate)delegate;
- (UITableView)tableView;
- (double)_heightForComment:(id)a3 forWidth:(double)a4 forInterfaceOrientation:(int64_t)a5;
- (double)minimumHeight;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_commentText;
- (id)_currentEntryView;
- (id)_orderedComments;
- (id)_orderedFetchOptions;
- (id)_orderedLikes;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_assetOwnerCommentSection;
- (int64_t)_postCommentSection;
- (int64_t)_smileCommentSection;
- (int64_t)_textCommentSection;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_fontCacheDidChange:(id)a3;
- (void)_invalidateCommentsAndLikes;
- (void)_postCommentWithText:(id)a3 completionHandler:(id)a4;
- (void)_scrollToComment:(id)a3 animated:(BOOL)a4;
- (void)_setIsPostingComment:(BOOL)a3 postButton:(id)a4;
- (void)_setManagedAsset:(id)a3;
- (void)_updateFirstResponder;
- (void)_updateOrderedComments;
- (void)_updatedOrderedLikes;
- (void)_validateAndPostComment:(id)a3;
- (void)cloudCommentsDidChange:(id)a3;
- (void)dealloc;
- (void)photoCommentEntryViewDidEndEditing:(id)a3;
- (void)photoCommentEntryViewWillBeginEditing:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAsset:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setJustInsertedCommentUUID:(id)a3;
- (void)setManagedAsset:(id)a3;
- (void)setOrderedCommentsFetchResult:(id)a3;
- (void)setOrderedLikesFetchResult:(id)a3;
- (void)setShouldUseCompactCommentSeparators:(BOOL)a3;
- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation PUCommentsTableDataController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedLikesFetchResult, 0);
  objc_storeStrong((id *)&self->_orderedCommentsFetchResult, 0);
  objc_storeStrong((id *)&self->_justInsertedCommentUUID, 0);
  objc_storeStrong((id *)&self->_managedAsset, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_entryView, 0);
  objc_storeStrong((id *)&self->_commentsHeightCache, 0);
}

- (void)setOrderedLikesFetchResult:(id)a3
{
}

- (PHFetchResult)orderedLikesFetchResult
{
  return self->_orderedLikesFetchResult;
}

- (void)setOrderedCommentsFetchResult:(id)a3
{
}

- (PHFetchResult)orderedCommentsFetchResult
{
  return self->_orderedCommentsFetchResult;
}

- (void)setJustInsertedCommentUUID:(id)a3
{
}

- (NSString)justInsertedCommentUUID
{
  return self->_justInsertedCommentUUID;
}

- (void)setManagedAsset:(id)a3
{
}

- (PLManagedAsset)managedAsset
{
  return self->_managedAsset;
}

- (void)setDelegate:(id)a3
{
}

- (PUCommentsTableDataControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUCommentsTableDataControllerDelegate *)WeakRetained;
}

- (BOOL)shouldUseCompactCommentSeparators
{
  return self->_shouldUseCompactCommentSeparators;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)cloudCommentsDidChange:(id)a3
{
  id v4 = a3;
  if ([(PUCommentsTableDataController *)self isEditing]
    && ([(PUCommentsTableDataController *)self justInsertedCommentUUID],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    self->_hasPendingChanges = 1;
  }
  else
  {
    v6 = [v4 asset];
    v7 = [(PUCommentsTableDataController *)self managedAsset];
    int v8 = [v6 isEqual:v7];

    if (v8)
    {
      self->_hasPendingChanges = 0;
      [(PUCommentsTableDataController *)self _invalidateCommentsAndLikes];
      char v9 = [v4 shouldReload];
      v10 = [v4 deletedIndexes];
      v11 = [v4 insertedIndexes];
      uint64_t v47 = 0;
      v48 = &v47;
      uint64_t v49 = 0x2020000000;
      char v50 = 0;
      v12 = [(PUCommentsTableDataController *)self justInsertedCommentUUID];
      uint64_t v41 = 0;
      v42 = &v41;
      uint64_t v43 = 0x3032000000;
      v44 = __Block_byref_object_copy__19701;
      v45 = __Block_byref_object_dispose__19702;
      id v46 = 0;
      NSInteger v13 = [(UITableView *)self->_tableView numberOfSections];
      if (v13 == [(PUCommentsTableDataController *)self numberOfSectionsInTableView:self->_tableView])char v14 = v9; {
      else
      }
        char v14 = 1;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __56__PUCommentsTableDataController_cloudCommentsDidChange___block_invoke;
      aBlock[3] = &unk_1E5F2E690;
      aBlock[4] = self;
      v15 = (uint64_t (**)(void))_Block_copy(aBlock);
      v16 = v15;
      if (v14)
      {
        int v17 = v15[2](v15);
        [(UITableView *)self->_tableView reloadData];
      }
      else if ([v10 count] || objc_msgSend(v11, "count"))
      {
        [(UITableView *)self->_tableView beginUpdates];
        if ([v10 count])
        {
          v18 = [MEMORY[0x1E4F1CA48] array];
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __56__PUCommentsTableDataController_cloudCommentsDidChange___block_invoke_2;
          v37[3] = &unk_1E5F2BCD0;
          id v19 = v18;
          id v38 = v19;
          v39 = self;
          [v10 enumerateIndexesUsingBlock:v37];
          [(UITableView *)self->_tableView deleteRowsAtIndexPaths:v19 withRowAnimation:0];
        }
        if ([v11 count])
        {
          v20 = [MEMORY[0x1E4F1CA48] array];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __56__PUCommentsTableDataController_cloudCommentsDidChange___block_invoke_3;
          v31[3] = &unk_1E5F245D0;
          id v21 = v20;
          id v32 = v21;
          v33 = self;
          id v34 = v12;
          v35 = &v47;
          v36 = &v41;
          [v11 enumerateIndexesUsingBlock:v31];
          if (*((unsigned char *)v48 + 24))
          {
            [(PUCommentsTableDataController *)self setEditing:0];
            int v17 = 1;
          }
          else
          {
            int v17 = v16[2](v16);
          }
          if (*((unsigned char *)v48 + 24))
          {
            uint64_t v22 = 5;
          }
          else if ((unint64_t)[v11 count] >= 0x15)
          {
            uint64_t v22 = 5;
          }
          else
          {
            uint64_t v22 = 100;
          }
          [(UITableView *)self->_tableView insertRowsAtIndexPaths:v21 withRowAnimation:v22];
        }
        else
        {
          int v17 = 0;
        }
        v23 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, -[PUCommentsTableDataController _smileCommentSection](self, "_smileCommentSection"));
        tableView = self->_tableView;
        v25 = [MEMORY[0x1E4F1C978] arrayWithObject:v23];
        [(UITableView *)tableView reloadRowsAtIndexPaths:v25 withRowAnimation:5];

        [(UITableView *)self->_tableView endUpdates];
      }
      else
      {
        [(UITableView *)self->_tableView beginUpdates];
        v28 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, -[PUCommentsTableDataController _smileCommentSection](self, "_smileCommentSection"));
        v29 = self->_tableView;
        v30 = [MEMORY[0x1E4F1C978] arrayWithObject:v28];
        [(UITableView *)v29 reloadRowsAtIndexPaths:v30 withRowAnimation:5];

        [(UITableView *)self->_tableView endUpdates];
        int v17 = 0;
      }
      if (*((unsigned char *)v48 + 24))
      {
        uint64_t v26 = v42[5];
        if (v26) {
          [(PUCommentsTableDataController *)self _scrollToComment:v26 animated:0];
        }
      }
      if (v17) {
        [(UITableView *)self->_tableView px_scrollToEdge:3 animated:1];
      }
      v27 = [(PUCommentsTableDataController *)self justInsertedCommentUUID];

      if (v27) {
        [(PUCommentsTableDataController *)self setJustInsertedCommentUUID:0];
      }

      _Block_object_dispose(&v41, 8);
      _Block_object_dispose(&v47, 8);
    }
  }
}

uint64_t __56__PUCommentsTableDataController_cloudCommentsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "px_isScrolledAtEdge:tolerance:", 3, 10.0);
}

void __56__PUCommentsTableDataController_cloudCommentsDidChange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", a2, objc_msgSend(*(id *)(a1 + 40), "_textCommentSection"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void __56__PUCommentsTableDataController_cloudCommentsDidChange___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", a2, objc_msgSend(*(id *)(a1 + 40), "_textCommentSection"));
  [v4 addObject:v5];

  if (*(void *)(a1 + 48) && !*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v6 = [*(id *)(a1 + 40) _orderedComments];
    id obj = [v6 objectAtIndex:a2];

    v7 = [obj uuid];
    LODWORD(v6) = [v7 isEqualToString:*(void *)(a1 + 48)];

    if (v6)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), obj);
    }
  }
}

- (void)photoCommentEntryViewDidEndEditing:(id)a3
{
  [(PUCommentsTableDataController *)self setEditing:0];
  if (self->_hasPendingChanges)
  {
    tableView = self->_tableView;
    [(UITableView *)tableView reloadData];
  }
}

- (BOOL)photoCommentEntryViewShouldEndEditing:(id)a3
{
  if (![(PUCommentsTableDataController *)self isEditing]) {
    return 1;
  }
  id v4 = [(PUCommentsTableDataController *)self _commentText];
  if ([v4 length])
  {
    if ([(PUCommentsTableDataController *)self _canPostCommentWithText:v4 localizedFailureDescription:0])
    {
      v5 = [(PUCommentsTableDataController *)self justInsertedCommentUUID];
      BOOL v6 = v5 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)photoCommentEntryViewWillBeginEditing:(id)a3
{
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = [(PUCommentsTableDataController *)self delegate];
  [v5 commentsTableDataController:self tableViewDidScroll:v4];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(PUCommentsTableDataController *)self isEditing]) {
    goto LABEL_5;
  }
  uint64_t v6 = [v5 section];
  if (v6 != [(PUCommentsTableDataController *)self _textCommentSection]) {
    goto LABEL_5;
  }
  uint64_t v7 = [(PUCommentsTableDataController *)self _orderedComments];
  int v8 = objc_msgSend((id)v7, "objectAtIndex:", objc_msgSend(v5, "row"));

  LOBYTE(v7) = [v8 canBeDeletedByUser];
  if (v7) {
    BOOL v9 = 1;
  }
  else {
LABEL_5:
  }
    BOOL v9 = 0;

  return v9;
}

- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  id v13 = a5;
  uint64_t v8 = [v13 section];
  if (v8 == [(PUCommentsTableDataController *)self _textCommentSection] && sel_copy_ == a4)
  {
    BOOL v9 = [(PUCommentsTableDataController *)self _orderedComments];
    v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v13, "row"));

    v11 = [v10 commentText];
    v12 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    [v12 setString:v11];
  }
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  uint64_t v8 = objc_msgSend(a5, "section", a3);
  return v8 == [(PUCommentsTableDataController *)self _textCommentSection] && sel_copy_ == a4;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "section", a3);
  return v5 != [(PUCommentsTableDataController *)self _postCommentSection];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6 = a4;
  uint64_t v7 = [(PUCommentsTableDataController *)self managedAsset];
  if ([v7 totalCommentsCount])
  {
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      objc_initWeak(&location, self);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __77__PUCommentsTableDataController_tableView_willDisplayCell_forRowAtIndexPath___block_invoke;
      v9[3] = &unk_1E5F2E530;
      objc_copyWeak(&v10, &location);
      dispatch_async(MEMORY[0x1E4F14428], v9);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __77__PUCommentsTableDataController_tableView_willDisplayCell_forRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateFirstResponder];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v7 = [v6 statusBarOrientation];

  [(UITableView *)self->_tableView frame];
  double v9 = v8;
  uint64_t v10 = [v5 section];
  if (v10 == [(PUCommentsTableDataController *)self _smileCommentSection])
  {
    v11 = [(PUCommentsTableDataController *)self _orderedLikes];
    +[PUPhotoSmilesCommentCell heightOfSmileCellWithComments:v11 forWidth:[(PUCommentsTableDataController *)self _isVideoAsset] isVideo:v7 forInterfaceOrientation:v9];
LABEL_7:
    double v15 = v12;

    goto LABEL_8;
  }
  if (v10 == [(PUCommentsTableDataController *)self _assetOwnerCommentSection])
  {
    id v13 = [(PUCommentsTableDataController *)self managedAsset];
    +[PUPhotoOwnerCommentCell heightOfOwnerCellWithAsset:v13 forWidth:v7 forInterfaceOrientation:v9];
    double v15 = v14;
  }
  else
  {
    if (v10 == [(PUCommentsTableDataController *)self _textCommentSection])
    {
      v16 = [(PUCommentsTableDataController *)self _orderedComments];
      v11 = objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v5, "row"));

      [(PUCommentsTableDataController *)self _heightForComment:v11 forWidth:v7 forInterfaceOrientation:v9];
      goto LABEL_7;
    }
    double v15 = 0.0;
    if (v10 == [(PUCommentsTableDataController *)self _postCommentSection])
    {
      +[PUPhotoPostCommentTextEntryCell heightForWidth:v9];
      double v15 = v18;
    }
  }
LABEL_8:

  return v15;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 section];
  if (v9 == [(PUCommentsTableDataController *)self _smileCommentSection])
  {
    uint64_t v10 = [v7 dequeueReusableCellWithIdentifier:@"PLPhotoSmilesCommentCell"];
    if (!v10) {
      uint64_t v10 = [[PUPhotoSmilesCommentCell alloc] initWithStyle:3 reuseIdentifier:@"PLPhotoSmilesCommentCell" isVideo:[(PUCommentsTableDataController *)self _isVideoAsset]];
    }
    v11 = [(PUCommentsTableDataController *)self _orderedLikes];
    [(PUPhotoSmilesCommentCell *)v10 setUserLikes:v11];

    [(PUPhotoSmilesCommentCell *)v10 setUsesCompactSeparators:[(PUCommentsTableDataController *)self shouldUseCompactCommentSeparators]];
    goto LABEL_14;
  }
  if (v9 == [(PUCommentsTableDataController *)self _assetOwnerCommentSection])
  {
    uint64_t v10 = [v7 dequeueReusableCellWithIdentifier:@"PLPhotoOwnerCommentCell"];
    if (!v10) {
      uint64_t v10 = [[PUPhotoOwnerCommentCell alloc] initWithStyle:3 reuseIdentifier:@"PLPhotoOwnerCommentCell"];
    }
    [(PUPhotoSmilesCommentCell *)v10 setUsesCompactSeparators:[(PUCommentsTableDataController *)self shouldUseCompactCommentSeparators]];
    double v12 = [(PUCommentsTableDataController *)self managedAsset];
    [(PUPhotoSmilesCommentCell *)v10 updateContentFromAsset:v12];
LABEL_13:

    goto LABEL_14;
  }
  if (v9 == [(PUCommentsTableDataController *)self _textCommentSection])
  {
    uint64_t v10 = [v7 dequeueReusableCellWithIdentifier:@"CommentsTableViewCell"];
    if (!v10) {
      uint64_t v10 = [[PUPhotoCommentCell alloc] initWithStyle:0 reuseIdentifier:@"CommentsTableViewCell"];
    }
    [(PUPhotoSmilesCommentCell *)v10 setUsesCompactSeparators:[(PUCommentsTableDataController *)self shouldUseCompactCommentSeparators]];
    id v13 = [(PUCommentsTableDataController *)self asset];
    [(PUPhotoSmilesCommentCell *)v10 setAsset:v13];

    double v12 = [(PUCommentsTableDataController *)self _orderedComments];
    double v14 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v8, "row"));
    [(PUPhotoSmilesCommentCell *)v10 setComment:v14];

    goto LABEL_13;
  }
  if (v9 != [(PUCommentsTableDataController *)self _postCommentSection])
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PUCommentsTableDataController.m" lineNumber:420 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  uint64_t v10 = [v7 dequeueReusableCellWithIdentifier:@"PLPhotoPostCommentCell"];
  if (!v10)
  {
    uint64_t v10 = [[PUPhotoPostCommentTextEntryCell alloc] initWithStyle:3 reuseIdentifier:@"PLPhotoPostCommentCell"];
    v16 = [(PUPhotoSmilesCommentCell *)v10 textEntryView];
    [v16 setDelegate:self];

    int v17 = [(PUPhotoSmilesCommentCell *)v10 textEntryView];
    double v18 = [v17 postButton];

    [v18 addTarget:self action:sel__validateAndPostComment_ forControlEvents:64];
  }
LABEL_14:

  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(PUCommentsTableDataController *)self _smileCommentSection] == a4
    || [(PUCommentsTableDataController *)self _assetOwnerCommentSection] == a4)
  {
    return 1;
  }
  if ([(PUCommentsTableDataController *)self _textCommentSection] != a4) {
    return [(PUCommentsTableDataController *)self _postCommentSection] == a4;
  }
  id v7 = [(PUCommentsTableDataController *)self managedAsset];
  int64_t v8 = [v7 cloudCommentsCount];

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(PUCommentsTableDataController *)self _postCommentSection] + 1;
}

- (void)_validateAndPostComment:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_isPostingComment)
  {
    id v6 = v4;
    [(PUCommentsTableDataController *)self _setIsPostingComment:1 postButton:v6];
    if ([(PUCommentsTableDataController *)self isEditing])
    {
      id v7 = [(PUCommentsTableDataController *)self _commentText];
      id v21 = 0;
      BOOL v8 = [(PUCommentsTableDataController *)self _canPostCommentWithText:v7 localizedFailureDescription:&v21];
      id v9 = v21;
      uint64_t v10 = v9;
      if (v8)
      {
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __57__PUCommentsTableDataController__validateAndPostComment___block_invoke;
        v19[3] = &unk_1E5F2E1C0;
        v19[4] = self;
        id v20 = v6;
        [(PUCommentsTableDataController *)self _postCommentWithText:v7 completionHandler:v19];
      }
      else if (v9)
      {
        v11 = PLLocalizedFrameworkString();
        double v12 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v11 message:v10 preferredStyle:1];
        id v13 = (void *)MEMORY[0x1E4FB1410];
        double v14 = PULocalizedString(@"OK");
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __57__PUCommentsTableDataController__validateAndPostComment___block_invoke_2;
        v17[3] = &unk_1E5F2BF70;
        v17[4] = self;
        id v18 = v6;
        double v15 = [v13 actionWithTitle:v14 style:1 handler:v17];
        [v12 addAction:v15];

        v16 = [(PUCommentsTableDataController *)self delegate];
        [v16 commentsTableDataController:self presentViewController:v12];
      }
    }
    else
    {
      [(PUCommentsTableDataController *)self _setIsPostingComment:0 postButton:v6];
    }
  }
}

uint64_t __57__PUCommentsTableDataController__validateAndPostComment___block_invoke(uint64_t a1, char a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = *(void *)(a1 + 40);
  }
  return [v3 _setIsPostingComment:0 postButton:v4];
}

uint64_t __57__PUCommentsTableDataController__validateAndPostComment___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setIsPostingComment:0 postButton:*(void *)(a1 + 40)];
}

- (void)_setIsPostingComment:(BOOL)a3 postButton:(id)a4
{
  self->_isPostingComment = a3;
  if (a4) {
    [a4 setEnabled:!a3];
  }
}

- (void)_fontCacheDidChange:(id)a3
{
  [(NSCache *)self->_commentsHeightCache removeAllObjects];
  tableView = self->_tableView;
  [(UITableView *)tableView reloadData];
}

- (void)_postCommentWithText:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(PUCommentsTableDataController *)self asset];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__19701;
  v22[4] = __Block_byref_object_dispose__19702;
  id v23 = 0;
  id v9 = [v8 photoLibrary];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__PUCommentsTableDataController__postCommentWithText_completionHandler___block_invoke;
  v18[3] = &unk_1E5F2E0D0;
  id v19 = v8;
  id v10 = v6;
  id v20 = v10;
  id v21 = v22;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__PUCommentsTableDataController__postCommentWithText_completionHandler___block_invoke_224;
  v13[3] = &unk_1E5F245A8;
  id v11 = v19;
  id v14 = v11;
  double v15 = self;
  int v17 = v22;
  id v12 = v7;
  id v16 = v12;
  [v9 performChanges:v18 completionHandler:v13];

  _Block_object_dispose(v22, 8);
}

void __72__PUCommentsTableDataController__postCommentWithText_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PLSharedAlbumsGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) uuid];
    *(_DWORD *)buf = 138543362;
    id v12 = v3;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "Posting comment to shared asset %{public}@", buf, 0xCu);
  }
  uint64_t v4 = [MEMORY[0x1E4F38F00] creationRequestForAssetCommentWithText:*(void *)(a1 + 40)];
  id v5 = [MEMORY[0x1E4F38ED0] changeRequestForAsset:*(void *)(a1 + 32)];
  uint64_t v6 = [v4 placeholderForCreatedAssetComment];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  [v5 addComments:v9];
}

void __72__PUCommentsTableDataController__postCommentWithText_completionHandler___block_invoke_224(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = PLSharedAlbumsGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 32) uuid];
      int v16 = 138543362;
      int v17 = v7;
      BOOL v8 = "Succesfully posted comment to shared asset %{public}@";
      id v9 = v6;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
LABEL_9:
      uint32_t v12 = 12;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v6 = PLSharedAlbumsGetLog();
    BOOL v11 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v11)
      {
        uint64_t v7 = [*(id *)(a1 + 32) uuid];
        int v16 = 138543618;
        int v17 = v7;
        __int16 v18 = 2112;
        id v19 = v5;
        BOOL v8 = "Failed to post comment to shared asset %{public}@, with error: %@";
        id v9 = v6;
        os_log_type_t v10 = OS_LOG_TYPE_ERROR;
        uint32_t v12 = 22;
LABEL_10:
        _os_log_impl(&dword_1AE9F8000, v9, v10, v8, (uint8_t *)&v16, v12);
      }
    }
    else if (v11)
    {
      uint64_t v7 = [*(id *)(a1 + 32) uuid];
      int v16 = 138543362;
      int v17 = v7;
      BOOL v8 = "Failed to post comment to shared asset %{public}@";
      id v9 = v6;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      goto LABEL_9;
    }
  }

  uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) uuid];
  [*(id *)(a1 + 40) setJustInsertedCommentUUID:v13];

  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a2, v14, v15);
}

- (BOOL)_canPostCommentWithText:(id)a3 localizedFailureDescription:(id *)a4
{
  uint64_t v6 = [a3 length];
  if (v6 <= [MEMORY[0x1E4F8AAB0] maxCharactersPerComment])
  {
    if (v6)
    {
      id v9 = [(PUCommentsTableDataController *)self managedAsset];
      uint64_t v10 = [v9 totalCommentsCount];

      if (v10 < [MEMORY[0x1E4F8AAB0] maxCommentsPerAsset])
      {
        BOOL v8 = 0;
        BOOL v11 = 1;
        if (!a4) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
      BOOL v8 = PLLocalizedFrameworkString();
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    uint64_t v7 = PULocalizedString(@"TOO_MANY_CHARS_IN_COMMENT");
    BOOL v8 = PULocalizedStringWithValidatedFormat(v7, @"%ld");
  }
  BOOL v11 = 0;
  if (a4) {
LABEL_10:
  }
    *a4 = v8;
LABEL_11:

  return v11;
}

- (id)_commentText
{
  v2 = [(PUCommentsTableDataController *)self _currentEntryView];
  id v3 = [v2 trimmedText];

  return v3;
}

- (double)_heightForComment:(id)a3 forWidth:(double)a4 forInterfaceOrientation:(int64_t)a5
{
  id v8 = a3;
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = NSString;
    BOOL v11 = [v8 uuid];
    uint32_t v12 = [v10 stringWithFormat:@"%@%f%d", v11, *(void *)&a4, (unint64_t)(a5 - 3) < 2];

    uint64_t v13 = [(NSCache *)self->_commentsHeightCache objectForKey:v12];
    uint64_t v14 = v13;
    if (v13)
    {
      [v13 doubleValue];
      double v16 = v15;
    }
    else
    {
      int v17 = [(PUCommentsTableDataController *)self asset];
      +[PUPhotoCommentCell heightForComment:v9 ofAsset:v17 forWidth:a5 forInterfaceOrientation:a4];
      double v16 = v18;

      commentsHeightCache = self->_commentsHeightCache;
      uint64_t v20 = [NSNumber numberWithDouble:v16];
      [(NSCache *)commentsHeightCache setObject:v20 forKey:v12];
    }
  }
  else
  {
    double v16 = 0.0;
  }

  return v16;
}

- (void)_scrollToComment:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v10 = [(PUCommentsTableDataController *)self _orderedComments];
  uint64_t v7 = [v10 fetchedObjects];
  uint64_t v8 = [v7 indexOfObject:v6];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v8, -[PUCommentsTableDataController _textCommentSection](self, "_textCommentSection"));
    [(UITableView *)self->_tableView scrollToRowAtIndexPath:v9 atScrollPosition:2 animated:v4];
  }
}

- (id)_currentEntryView
{
  id v3 = self->_entryView;
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, -[PUCommentsTableDataController _postCommentSection](self, "_postCommentSection"));
  id v5 = [(UITableView *)self->_tableView cellForRowAtIndexPath:v4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 textEntryView];

      id v3 = (PUPhotoCommentEntryView *)v6;
    }
  }

  return v3;
}

- (int64_t)_textCommentSection
{
  if ([(PUCommentsTableDataController *)self _isAssetOwnerSectionVisible]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)_postCommentSection
{
  if ([(PUCommentsTableDataController *)self _isAssetOwnerSectionVisible]) {
    return 3;
  }
  else {
    return 2;
  }
}

- (int64_t)_assetOwnerCommentSection
{
  if ([(PUCommentsTableDataController *)self _isAssetOwnerSectionVisible]) {
    return 1;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)_smileCommentSection
{
  return 0;
}

- (BOOL)_isAssetOwnerSectionVisible
{
  v2 = [(PUCommentsTableDataController *)self _orderedComments];
  id v3 = [v2 firstObject];
  BOOL v4 = v3;
  if (v3) {
    int v5 = [v3 isCaption] ^ 1;
  }
  else {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (id)_orderedLikes
{
  [(PUCommentsTableDataController *)self _updatedOrderedLikes];
  return [(PUCommentsTableDataController *)self orderedLikesFetchResult];
}

- (id)_orderedComments
{
  [(PUCommentsTableDataController *)self _updateOrderedComments];
  return [(PUCommentsTableDataController *)self orderedCommentsFetchResult];
}

- (void)_updatedOrderedLikes
{
  if (!self->_orderedLikesFetchResult)
  {
    id v3 = (void *)MEMORY[0x1E4F38EF8];
    id v7 = [(PUCommentsTableDataController *)self asset];
    BOOL v4 = [(PUCommentsTableDataController *)self _orderedFetchOptions];
    int v5 = [v3 fetchLikesForAsset:v7 options:v4];
    orderedLikesFetchResult = self->_orderedLikesFetchResult;
    self->_orderedLikesFetchResult = v5;
  }
}

- (void)_updateOrderedComments
{
  if (!self->_orderedCommentsFetchResult)
  {
    id v3 = (void *)MEMORY[0x1E4F38EF8];
    id v7 = [(PUCommentsTableDataController *)self asset];
    BOOL v4 = [(PUCommentsTableDataController *)self _orderedFetchOptions];
    int v5 = [v3 fetchCommentsForAsset:v7 options:v4];
    orderedCommentsFetchResult = self->_orderedCommentsFetchResult;
    self->_orderedCommentsFetchResult = v5;
  }
}

- (id)_orderedFetchOptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [(PUCommentsTableDataController *)self asset];
  id v3 = [v2 photoLibrary];
  BOOL v4 = [v3 librarySpecificFetchOptions];

  int v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"commentDate" ascending:1];
  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v4 setSortDescriptors:v6];

  return v4;
}

- (void)_invalidateCommentsAndLikes
{
  orderedCommentsFetchResult = self->_orderedCommentsFetchResult;
  self->_orderedCommentsFetchResult = 0;

  orderedLikesFetchResult = self->_orderedLikesFetchResult;
  self->_orderedLikesFetchResult = 0;
}

- (void)_setManagedAsset:(id)a3
{
  int v5 = (PLManagedAsset *)a3;
  managedAsset = self->_managedAsset;
  id v9 = v5;
  if (managedAsset != v5)
  {
    if (managedAsset)
    {
      id v7 = [MEMORY[0x1E4F8A6E8] defaultCenter];
      [v7 removeCloudCommentsChangeObserver:self asset:self->_managedAsset];
    }
    objc_storeStrong((id *)&self->_managedAsset, a3);
    if (self->_managedAsset)
    {
      uint64_t v8 = [MEMORY[0x1E4F8A6E8] defaultCenter];
      [v8 addCloudCommentsChangeObserver:self asset:self->_managedAsset];
    }
  }
}

- (BOOL)_isVideoAsset
{
  v2 = [(PUCommentsTableDataController *)self asset];
  if ([v2 isVideo] & 1) != 0 || (objc_msgSend(v2, "isStreamedVideo")) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 isAudio];
  }

  return v3;
}

- (void)_updateFirstResponder
{
  id v4 = [(PUCommentsTableDataController *)self _currentEntryView];
  if ([(PUCommentsTableDataController *)self isEditing])
  {
    char v3 = [v4 textView];
    [v3 becomeFirstResponder];
  }
  else
  {
    [v4 clearText];
    char v3 = [v4 textView];
    [v3 resignFirstResponder];
  }
}

- (double)minimumHeight
{
  char v3 = [(PUCommentsTableDataController *)self tableView];
  id v4 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0, -[PUCommentsTableDataController _assetOwnerCommentSection](self, "_assetOwnerCommentSection"));
  [(PUCommentsTableDataController *)self tableView:v3 heightForRowAtIndexPath:v4];
  double v6 = v5 + 0.0;

  id v7 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0, -[PUCommentsTableDataController _postCommentSection](self, "_postCommentSection"));
  [(PUCommentsTableDataController *)self tableView:v3 heightForRowAtIndexPath:v7];
  double v9 = v6 + v8;

  return v9;
}

- (void)setShouldUseCompactCommentSeparators:(BOOL)a3
{
  if (self->_shouldUseCompactCommentSeparators != a3)
  {
    self->_shouldUseCompactCommentSeparators = a3;
    id v3 = [(PUCommentsTableDataController *)self tableView];
    [v3 reloadData];
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    BOOL v3 = a3;
    self->_editing = a3;
    [(PUCommentsTableDataController *)self _updateFirstResponder];
    id v5 = [(PUCommentsTableDataController *)self delegate];
    [v5 commentsTableDataController:self didChangeEditing:v3];
  }
}

- (void)setAsset:(id)a3
{
  id v7 = (PHAsset *)a3;
  if (self->_asset != v7)
  {
    objc_storeStrong((id *)&self->_asset, a3);
    [(PUCommentsTableDataController *)self _invalidateCommentsAndLikes];
    id v5 = [MEMORY[0x1E4F8AA78] systemPhotoLibrary];
    double v6 = [(PHAsset *)v7 pl_managedAssetFromPhotoLibrary:v5];
    [(PUCommentsTableDataController *)self _setManagedAsset:v6];
  }
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F8A6E8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PUCommentsTableDataController;
  [(PUCommentsTableDataController *)&v4 dealloc];
}

- (PUCommentsTableDataController)init
{
  return [(PUCommentsTableDataController *)self initWithTableView:0];
}

- (PUCommentsTableDataController)initWithTableView:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUCommentsTableDataController;
  double v6 = [(PUCommentsTableDataController *)&v11 init];
  if (v6)
  {
    id v7 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    commentsHeightCache = v6->_commentsHeightCache;
    v6->_commentsHeightCache = v7;

    objc_storeStrong((id *)&v6->_tableView, a3);
    [(UITableView *)v6->_tableView setDelegate:v6];
    [(UITableView *)v6->_tableView setDataSource:v6];
    double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v6 selector:sel__fontCacheDidChange_ name:*MEMORY[0x1E4F8A628] object:0];
  }
  return v6;
}

@end