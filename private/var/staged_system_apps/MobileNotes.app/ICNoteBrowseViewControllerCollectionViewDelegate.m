@interface ICNoteBrowseViewControllerCollectionViewDelegate
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (ICNoteBrowseViewController)noteBrowseViewController;
- (ICNoteBrowseViewControllerCollectionViewDelegate)initWithNoteBrowseViewController:(id)a3;
- (id)_indexPathOfReferenceItemForLayoutTransitionInCollectionView:(id)a3;
- (id)collectionView:(id)a3 sceneActivationConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
@end

@implementation ICNoteBrowseViewControllerCollectionViewDelegate

- (ICNoteBrowseViewControllerCollectionViewDelegate)initWithNoteBrowseViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICNoteBrowseViewControllerCollectionViewDelegate;
  return [(ICNoteResultsViewControllerCollectionViewDelegate *)&v4 initWithNoteResultsViewController:a3];
}

- (ICNoteBrowseViewController)noteBrowseViewController
{
  objc_opt_class();
  v3 = [(ICNoteResultsViewControllerCollectionViewDelegate *)self noteResultsViewController];
  objc_super v4 = ICDynamicCast();

  return (ICNoteBrowseViewController *)v4;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
  v9 = [v8 noteDataSource];
  v10 = [v9 collectionViewDiffableDataSource];
  v11 = [v10 itemIdentifierForIndexPath:v7];

  objc_opt_class();
  v12 = ICDynamicCast();
  if (v12)
  {
    if ([v6 allowsMultipleSelection])
    {
      v13 = [v6 indexPathsForSelectedItems];
      BOOL v14 = [v13 count] != 0;
    }
    else
    {
      BOOL v14 = 0;
    }
    if (objc_msgSend(v12, "ic_isNoteType")) {
      unsigned int v18 = 1;
    }
    else {
      unsigned int v18 = [v12 ic_isInvitationType];
    }
    v15 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
    LODWORD(self) = ([v15 isEditing] | v14) ^ 1 | v18;
  }
  else
  {
    objc_opt_class();
    v15 = ICDynamicCast();
    if (v15)
    {
      v16 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
      v17 = [v16 tagSelection];
      LOBYTE(self) = [v17 mode] != (id)1;
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
  id v7 = [v6 collectionView];
  unsigned __int8 v8 = [v7 canFocusItemAtIndexPath:v5];

  return v8;
}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  return [a3 isEditing] ^ 1;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
  id v7 = [v6 noteDataSource];
  unsigned __int8 v8 = [v7 collectionViewDiffableDataSource];
  v9 = [v8 itemIdentifierForIndexPath:v5];

  id v12 = v9;
  if (objc_msgSend(v12, "ic_isNoteType"))
  {
    v10 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
    v11 = [v10 viewControllerManager];
    [v11 ensureNoteEditorPresentedAnimated:1 startEditing:0];
  }
  else if (objc_msgSend(v12, "ic_isContainerType"))
  {
    v10 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
    v11 = [v10 viewControllerManager];
    [v11 selectContainerWithIdentifier:v12 usingRootViewController:0 deferUntilDataLoaded:1 animated:1];
  }
  else
  {
    if (!objc_msgSend(v12, "ic_isInvitationType")) {
      goto LABEL_8;
    }
    v10 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
    v11 = [v10 viewControllerManager];
    [v11 selectInvitationWithObjectID:v12 animated:1];
  }

LABEL_8:
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
  unsigned int v8 = [v7 isEditing];

  if (!v8)
  {
    v10 = [v19 indexPathsForSelectedItems];
    id v11 = [v10 count];

    if (v11 != (id)1) {
      goto LABEL_15;
    }
    id v12 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
    v13 = [v12 noteDataSource];
    BOOL v14 = [v13 collectionViewDiffableDataSource];
    v9 = [v14 itemIdentifierForIndexPath:v6];

    objc_opt_class();
    v15 = ICDynamicCast();
    if (+[ICTagCoreDataIndexer isTagItemIdentifier:v9])
    {
      v16 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
      v17 = [v16 tagSelection];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v17 setMode:1];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v17 setMode:0];
          [v17 addObjectID:v9 toExcluded:0];
        }
      }
      unsigned int v18 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
      [v18 setTagSelection:v17];
    }
    else
    {
      if (!objc_msgSend(v15, "ic_isNoteType"))
      {
LABEL_13:

        goto LABEL_14;
      }
      v17 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
      unsigned int v18 = [v17 viewControllerManager];
      [v18 selectNoteWithObjectID:v15 scrollState:0 startEditing:0 animated:1 ensurePresented:1];
    }

    goto LABEL_13;
  }
  v9 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
  [v9 updateBarButtonItemsAnimated:0];
LABEL_14:

LABEL_15:
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v15 = a4;
  id v5 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
  unsigned int v6 = [v5 isEditing];

  id v7 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
  unsigned int v8 = v7;
  if (v6)
  {
    [v7 updateBarButtonItemsAnimated:0];
    v9 = v8;
  }
  else
  {
    v10 = [v7 noteDataSource];
    id v11 = [v10 collectionViewDiffableDataSource];
    v9 = [v11 itemIdentifierForIndexPath:v15];

    if (+[ICTagCoreDataIndexer isTagItemIdentifier:v9])
    {
      id v12 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
      v13 = [v12 tagSelection];

      [v13 removeObjectID:v9 fromExcluded:0];
      if ([v13 isEmpty]) {
        [v13 setMode:1];
      }
      BOOL v14 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
      [v14 setTagSelection:v13];
    }
  }
}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  id v5 = a3;
  id v7 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
  id v6 = [v5 isEditing];

  [v7 setEditing:v6 animated:1];
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v10 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
    id v7 = [v6 viewControllerManager];
    [v10 setShowOperatorMenuButton:[v7 hasCompactWidth]];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    objc_opt_class();
    id v6 = ICDynamicCast();
    id v7 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
    unsigned int v8 = [v7 viewControllerManager];
    v9 = [v8 tagSelection];
    [v6 selectTagsWithTagSelection:v9 animated:0];
  }
LABEL_6:
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v10 = a4;
  if ([a5 isEqualToString:UICollectionElementKindSectionFooter])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v8 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
      [v8 setSummaryView:v10];

      v9 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
      [v9 updateSummaryView];
    }
  }
}

- (id)_indexPathOfReferenceItemForLayoutTransitionInCollectionView:(id)a3
{
  id v3 = a3;
  if ([v3 numberOfSections] && objc_msgSend(v3, "numberOfItemsInSection:", 0))
  {
    objc_super v4 = +[NSIndexPath indexPathForRow:0 inSection:0];
    id v5 = [v3 layoutAttributesForItemAtIndexPath:v4];
    [v5 frame];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    [v3 visibleBounds];
    v19.origin.x = v7;
    v19.origin.y = v9;
    v19.size.width = v11;
    v19.size.height = v13;
    if (CGRectContainsRect(v18, v19)) {
      BOOL v14 = v4;
    }
    else {
      BOOL v14 = 0;
    }
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)collectionView:(id)a3 sceneActivationConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  CGFloat v9 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
  double v10 = [v9 noteDataSource];
  CGFloat v11 = [v10 collectionViewDiffableDataSource];
  double v12 = [v11 itemIdentifierForIndexPath:v8];

  objc_opt_class();
  CGFloat v13 = ICDynamicCast();
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_1000AE2E8;
  v27 = sub_1000AE2F8;
  id v28 = 0;
  if (objc_msgSend(v13, "ic_isModernNoteType"))
  {
    BOOL v14 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
    id v15 = [v14 modernViewContext];
    v16 = v22;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000AE300;
    v22[3] = &unk_100625CA0;
    v22[4] = self;
    v22[5] = v13;
    v22[6] = &v23;
    [v15 performBlockAndWait:v22];
  }
  else
  {
    if (!objc_msgSend(v13, "ic_isLegacyNoteType")) {
      goto LABEL_6;
    }
    BOOL v14 = [(ICNoteBrowseViewControllerCollectionViewDelegate *)self noteBrowseViewController];
    id v15 = [v14 legacyViewContext];
    v16 = v21;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000AE3D0;
    v21[3] = &unk_100625CA0;
    v21[4] = self;
    v21[5] = v13;
    v21[6] = &v23;
    [v15 performBlockAndWait:v21];
  }

LABEL_6:
  if (v24[5])
  {
    id v17 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.notes.open.object"];
    CGRect v18 = [(id)v24[5] absoluteString];
    [v17 setTargetContentIdentifier:v18];

    [v17 setUserInfo:&off_10064B6D8];
    id v19 = [objc_alloc((Class)UIWindowSceneActivationConfiguration) initWithUserActivity:v17];
  }
  else
  {
    id v19 = 0;
  }
  _Block_object_dispose(&v23, 8);

  return v19;
}

@end