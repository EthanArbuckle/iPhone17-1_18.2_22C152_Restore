@interface UGCPhotosSectionController
- (BOOL)deferAddPhotoPresentationToParent;
- (BOOL)formInteractionEnabled;
- (NSArray)rowItems;
- (UGCPOIEnrichmentAnalyticsDelegate)analyticsDelegate;
- (UGCPhotoSectionControllerDelegate)delegate;
- (UGCPhotosSectionController)initWithPhotosForm:(id)a3 mapItem:(id)a4 presentingViewController:(id)a5 deferAddPhotoPresentationToParent:(BOOL)a6 analyticsDelegate:(id)a7 showSuggestedPhotos:(BOOL)a8;
- (id)addPhotosControllerRequestsAnchoringView:(id)a3;
- (id)configureCollectionViewHeader;
- (id)imagePreviewAtIndex:(unint64_t)a3;
- (unint64_t)numberOfImagePreviews;
- (unint64_t)numberOfSelectedPhotosForAddPhotosController:(id)a3;
- (void)_addFakePhoto;
- (void)_addPhotosToEditorController;
- (void)_addPhotosWithMetadataToEditor:(id)a3;
- (void)_checkForNearbyPhotos;
- (void)_dismissTakePhotoController:(id)a3;
- (void)_photoCarouselControllerRequestsPhotoCreditEditor;
- (void)_presentAddPhotosControllerWithSourceType:(int64_t)a3;
- (void)_removeAddPhotosRowItemIfNeeded;
- (void)_requestAddingNewPhotoWithSourceType:(int64_t)a3;
- (void)addPhotosCellRequestsAddingNewPhoto:(id)a3 usingSourceType:(int64_t)a4;
- (void)photoCarouselController:(id)a3 requestsRemovingImageForIdentifier:(id)a4 completion:(id)a5;
- (void)photoCarouselControllerDidUpdatePhotoCredit:(id)a3;
- (void)photoCarouselControllerRequestsAddingNewPhoto:(id)a3;
- (void)photoCarouselControllerRequestsAddingNewPhoto:(id)a3 forSourceType:(int64_t)a4;
- (void)removeAddPhotosRowItem;
- (void)setDeferAddPhotoPresentationToParent:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFormInteractionEnabled:(BOOL)a3;
- (void)suggestedPhotoController:(id)a3 didSelectPhotosWithMetadata:(id)a4;
- (void)takePhotoController:(id)a3 didSelectPhotosWithMetadata:(id)a4;
- (void)updatePhotoCreditInCollectionViewHeader;
- (void)updateSelectedPhotosCountInCollectionViewHeader;
@end

@implementation UGCPhotosSectionController

- (UGCPhotosSectionController)initWithPhotosForm:(id)a3 mapItem:(id)a4 presentingViewController:(id)a5 deferAddPhotoPresentationToParent:(BOOL)a6 analyticsDelegate:(id)a7 showSuggestedPhotos:(BOOL)a8
{
  BOOL v8 = a8;
  id v15 = a3;
  v16 = (MKMapItem *)a4;
  id v17 = a5;
  id v18 = a7;
  v43.receiver = self;
  v43.super_class = (Class)UGCPhotosSectionController;
  v19 = [(UGCPhotosSectionController *)&v43 init];
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_analyticsDelegate, v18);
    objc_storeStrong((id *)&v20->_photosForm, a3);
    objc_storeWeak((id *)&v20->_presentingViewController, v17);
    v21 = +[UIApplication sharedMapsDelegate];
    v22 = [v21 appCoordinator];
    uint64_t v23 = [v22 baseActionCoordinator];
    actionCoordinator = v20->_actionCoordinator;
    v20->_actionCoordinator = (ActionCoordination *)v23;

    v20->_deferAddPhotoPresentationToParent = a6;
    id v42 = v15;
    if (v16 && MapsFeature_IsEnabled_SydneyARP())
    {
      v25 = [UGCARPPhotoCarouselController alloc];
      WeakRetained = objc_loadWeakRetained((id *)&v20->_presentingViewController);
      id v27 = [v15 maximumNumberOfPhotos];
      v28 = [(UGCPhotosForm *)v20->_photosForm activePhotoList];
      BOOL v29 = [v28 count] != 0;
      [(MKMapItem *)v16 _coordinate];
      v30 = -[UGCARPPhotoCarouselController initWithDelegate:presentingViewController:maximumNumberOfPhotos:previouslySubmittedPhotosExist:mapItemCoordinate:showPhotoCarousel:](v25, "initWithDelegate:presentingViewController:maximumNumberOfPhotos:previouslySubmittedPhotosExist:mapItemCoordinate:showPhotoCarousel:", v20, WeakRetained, v27, v29, v8);
      photoEditorController = v20->_photoEditorController;
      v20->_photoEditorController = &v30->super;
    }
    else
    {
      v32 = [UGCPhotoCarouselController alloc];
      v33 = [(UGCPhotosForm *)v20->_photosForm activePhotoList];
      v34 = -[UGCPhotoCarouselController initWithDelegate:maximumNumberOfPhotos:prefersMenu:](v32, "initWithDelegate:maximumNumberOfPhotos:prefersMenu:", v20, (char *)[v33 count] + sub_1004CF958(v20->_photosForm), 1);
      v35 = v20->_photoEditorController;
      v20->_photoEditorController = v34;

      WeakRetained = +[MapsTheme ugcAddPhotoCellBackgroundColor];
      [(UGCPhotoCarouselController *)v20->_photoEditorController setCellBackgroundColor:WeakRetained];
    }

    v36 = v16;
    mapItem = v20->_mapItem;
    v20->_mapItem = v16;

    [(UGCPhotosSectionController *)v20 _addPhotosToEditorController];
    [(UGCPhotoCarouselController *)v20->_photoEditorController setDelegate:v20];
    id v15 = v42;
    if (MapsFeature_IsEnabled_SydneyARP())
    {
      if (v20->_deferAddPhotoPresentationToParent)
      {
        v20->_showingAddYourPhotosCell = 1;
      }
      else
      {
        v38 = [(UGCPhotosForm *)v20->_photosForm addedPhotos];
        id v39 = [v38 count];

        if (v39)
        {
          v40 = [(UGCPhotosForm *)v20->_photosForm addedPhotos];
          v20->_showingAddYourPhotosCell = [v40 count] == 0;
        }
        else
        {
          v20->_showingAddYourPhotosCell = 1;
        }
        id v15 = v42;
      }
    }
  }

  return v20;
}

- (void)_addPhotosToEditorController
{
  if (!self->_deferAddPhotoPresentationToParent)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v4 = [(UGCPhotosForm *)self->_photosForm activePhotoList];
    id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (!v5) {
      goto LABEL_15;
    }
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 url];

        photoEditorController = self->_photoEditorController;
        if (v10)
        {
          v12 = [v9 url];
          v13 = [v9 identifier];
          [(UGCPhotoCarouselController *)photoEditorController addImageURL:v12 forIdentifier:v13];
        }
        else
        {
          if (isKindOfClass)
          {
            v12 = [v9 identifier];
            [(UGCPhotoCarouselController *)photoEditorController addPhotoWithMetadata:v9 forIdentifier:v12];
            goto LABEL_13;
          }
          v12 = [v9 image];
          v13 = [v9 identifier];
          [(UGCPhotoCarouselController *)photoEditorController addImage:v12 forIdentifier:v13];
        }

LABEL_13:
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (!v6)
      {
LABEL_15:

        return;
      }
    }
  }
}

- (void)_requestAddingNewPhotoWithSourceType:(int64_t)a3
{
}

- (void)_photoCarouselControllerRequestsPhotoCreditEditor
{
  actionCoordinator = self->_actionCoordinator;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  [(ActionCoordination *)actionCoordinator viewControllerShowPhotoCredit:WeakRetained];
}

- (void)addPhotosCellRequestsAddingNewPhoto:(id)a3 usingSourceType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(UGCPhotosSectionController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(UGCPhotosSectionController *)self delegate];
    [v9 photosSectionController:self userActionCapturedForAction:2147 value:@"business info"];
  }
  if ([(UGCPhotosSectionController *)self deferAddPhotoPresentationToParent])
  {
    id v10 = objc_alloc_init((Class)MUPresentationOptions);
    [v10 setSourceView:v6];
    [v6 frame];
    [v10 setSourceRect:];
    v11 = [(UGCPhotosSectionController *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      v13 = [(UGCPhotosSectionController *)self delegate];
      [v13 photosSectionController:self selectedAddPhotosUsingSourceType:a4 presentationOptions:v10];
    }
  }
  else if (MapsFeature_IsEnabled_ARPCommunityID() && GEOConfigGetBOOL())
  {
    objc_initWeak(&location, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1007FD508;
    v15[3] = &unk_1012F9AD8;
    objc_copyWeak(v16, &location);
    v16[1] = (id)a4;
    +[UGCInformedConsentViewController presentIfNeededWithPresentingViewController:WeakRetained presentationContext:0 completion:v15];

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
  else
  {
    [(UGCPhotosSectionController *)self _presentAddPhotosControllerWithSourceType:a4];
  }
}

- (void)_presentAddPhotosControllerWithSourceType:(int64_t)a3
{
  id v5 = [UGCAddPhotosController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  int64_t v7 = sub_1004CF958(self->_photosForm);
  char v8 = [(MKMapItem *)self->_mapItem _geoMapItem];
  v9 = [v8 _placeQuestionnaire];
  id v10 = [(UGCAddPhotosController *)v5 initWithPresentingViewController:WeakRetained sourceType:a3 multipleSelectionLimit:v7 placeQuestionnaire:v9 delegate:self];
  takePhotoController = self->_takePhotoController;
  self->_takePhotoController = v10;

  char v12 = self->_takePhotoController;

  [(UGCAddPhotosController *)v12 present];
}

- (void)photoCarouselController:(id)a3 requestsRemovingImageForIdentifier:(id)a4 completion:(id)a5
{
  char v12 = (void (**)(id, BOOL))a5;
  BOOL v7 = [(UGCPhotosForm *)self->_photosForm removePhotoWithIdentifier:a4];
  if (v7)
  {
    char v8 = self->_photosForm;
    v9 = [(UGCPhotosForm *)v8 activePhotoList];
    id v10 = (char *)[v9 count];
    int64_t v11 = sub_1004CF958(v8);

    [(UGCPhotoCarouselController *)self->_photoEditorController setMaximumNumberOfPhotos:&v10[v11]];
  }
  v12[2](v12, v7);
}

- (void)photoCarouselControllerRequestsAddingNewPhoto:(id)a3
{
}

- (void)photoCarouselControllerDidUpdatePhotoCredit:(id)a3
{
}

- (void)photoCarouselControllerRequestsAddingNewPhoto:(id)a3 forSourceType:(int64_t)a4
{
  id v6 = [UGCAddPhotosController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  int64_t v8 = sub_1004CF958(self->_photosForm);
  v9 = [(MKMapItem *)self->_mapItem _geoMapItem];
  id v10 = [v9 _placeQuestionnaire];
  int64_t v11 = [(UGCAddPhotosController *)v6 initWithPresentingViewController:WeakRetained sourceType:a4 multipleSelectionLimit:v8 placeQuestionnaire:v10 delegate:self];
  takePhotoController = self->_takePhotoController;
  self->_takePhotoController = v11;

  v13 = self->_takePhotoController;

  [(UGCAddPhotosController *)v13 present];
}

- (void)suggestedPhotoController:(id)a3 didSelectPhotosWithMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(UGCPhotosForm *)self->_photosForm addPhotoListWithMetadata:v7];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v14 = [v13 photoMetadata:v20];
        long long v15 = [v14 clientImageUuid];
        [v6 addPhotoWithMetadata:v13 forIdentifier:v15];
      }
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  long long v16 = self->_photosForm;
  long long v17 = [(UGCPhotosForm *)v16 activePhotoList];
  id v18 = (char *)[v17 count];
  int64_t v19 = sub_1004CF958(v16);

  [(UGCPhotoCarouselController *)self->_photoEditorController setMaximumNumberOfPhotos:&v18[v19]];
  [(UGCPhotosSectionController *)self updateSelectedPhotosCountInCollectionViewHeader];
}

- (void)takePhotoController:(id)a3 didSelectPhotosWithMetadata:(id)a4
{
  photosForm = self->_photosForm;
  id v7 = a4;
  id v12 = a3;
  [(UGCPhotosForm *)photosForm addPhotoListWithMetadata:v7];
  [(UGCPhotosSectionController *)self _addPhotosWithMetadataToEditor:v7];

  [(UGCPhotosSectionController *)self _removeAddPhotosRowItemIfNeeded];
  id v8 = self->_photosForm;
  id v9 = [(UGCPhotosForm *)v8 activePhotoList];
  id v10 = (char *)[v9 count];
  int64_t v11 = sub_1004CF958(v8);

  [(UGCPhotoCarouselController *)self->_photoEditorController setMaximumNumberOfPhotos:&v10[v11]];
  [(UGCPhotosSectionController *)self _dismissTakePhotoController:v12];
}

- (void)_addPhotosWithMetadataToEditor:(id)a3
{
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v8);
        id v10 = objc_opt_class();
        unsigned int v11 = [v10 isEqual:objc_opt_class()];
        photoEditorController = self->_photoEditorController;
        if (v11)
        {
          v13 = [v9 photoMetadata];
          long long v14 = [v13 clientImageUuid];
          [(UGCPhotoCarouselController *)photoEditorController addPhotoWithMetadata:v9 forIdentifier:v14];

          [(UGCPhotosSectionController *)self updateSelectedPhotosCountInCollectionViewHeader];
        }
        else
        {
          long long v15 = [v9 image];
          long long v16 = [v9 photoMetadata];
          long long v17 = [v16 clientImageUuid];
          [(UGCPhotoCarouselController *)photoEditorController addImage:v15 forIdentifier:v17];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
}

- (id)addPhotosControllerRequestsAnchoringView:(id)a3
{
  addPhotosCell = self->_addPhotosCell;
  if (!addPhotosCell) {
    addPhotosCell = self->_photoEditorController;
  }
  [addPhotosCell anchoringView:a3];

  return v5;
}

- (unint64_t)numberOfSelectedPhotosForAddPhotosController:(id)a3
{
  return [(UGCPhotosForm *)self->_photosForm numberOfAddedPhotos];
}

- (void)_removeAddPhotosRowItemIfNeeded
{
  if (self->_showingAddYourPhotosCell)
  {
    self->_showingAddYourPhotosCell = 0;
    [(UGCPhotosSectionController *)self removeAddPhotosRowItem];
  }
}

- (void)_dismissTakePhotoController:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1007FDCC4;
  v3[3] = &unk_1012E5D08;
  v3[4] = self;
  [a3 dismissWithCompletion:v3];
}

- (id)configureCollectionViewHeader
{
  v3 = self->_photoEditorController;
  id v4 = objc_alloc_init(UGCPhotoCreditSectionHeaderView);
  id v5 = [(UGCPhotoCarouselController *)v3 collectionViewHeaderTitleForNumberOfSelectedPhotos:[(UGCPhotosForm *)self->_photosForm numberOfAddedPhotos]];
  [(UGCPhotoCreditSectionHeaderView *)v4 setTitle:v5];

  id v6 = [(UGCPhotoCarouselController *)v3 collectionViewButtonTitle];
  objc_initWeak(&location, self);
  uint64_t v7 = [(UGCPhotoCarouselController *)v3 configurePhotoCreditStringForCollectionViewHeader];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1007FDEC4;
  v11[3] = &unk_1012E6708;
  objc_copyWeak(&v12, &location);
  [(UGCPhotoCreditSectionHeaderView *)v4 setSubtitleActionTitle:v7 completionHandler:v11];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1007FDF08;
  v9[3] = &unk_1012F9B00;
  objc_copyWeak(&v10, &location);
  [(UGCPhotoCreditSectionHeaderView *)v4 setAccessoryActionTitle:v6 selectionHandler:v9];
  [(UGCPhotoCreditSectionHeaderView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v4;
}

- (void)updatePhotoCreditInCollectionViewHeader
{
  id v3 = [(UGCPhotoCarouselController *)self->_photoEditorController configurePhotoCreditStringForCollectionViewHeader];
  [(UGCPhotoCreditSectionHeaderView *)self->_headerView setSubtitle:v3];
}

- (void)updateSelectedPhotosCountInCollectionViewHeader
{
  unint64_t v3 = [(UGCPhotosForm *)self->_photosForm numberOfAddedPhotos];
  id v4 = [(UGCPhotoCarouselController *)self->_photoEditorController collectionViewHeaderTitleForNumberOfSelectedPhotos:v3];
  [(UGCPhotoCreditSectionHeaderView *)self->_headerView setTitle:v4];

  BOOL v5 = v3 < [(UGCPhotosForm *)self->_photosForm maximumNumberOfPhotos];
  headerView = self->_headerView;

  [(UGCPhotoCreditSectionHeaderView *)headerView setAccessoryActionButtonEnabled:v5];
}

- (NSArray)rowItems
{
  if (!self->_photosForm)
  {
    v26 = (NSArray *)&__NSArray0__struct;
    goto LABEL_22;
  }
  rowItems = self->_rowItems;
  if (!rowItems)
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    BOOL v5 = +[UIDevice currentDevice];
    if ([(UGCPOIEnrichmentHeaderCell *)v5 userInterfaceIdiom] == (id)5)
    {
      char IsEnabled_SydneyARP = MapsFeature_IsEnabled_SydneyARP();

      if (IsEnabled_SydneyARP)
      {
LABEL_7:
        id v10 = [UGCPhotoCarouselCell alloc];
        double y = CGRectZero.origin.y;
        double width = CGRectZero.size.width;
        double height = CGRectZero.size.height;
        long long v14 = -[UGCPhotoCarouselCell initWithFrame:](v10, "initWithFrame:", CGRectZero.origin.x, y, width, height);
        [(UGCPhotoCarouselCell *)v14 setCarouselController:self->_photoEditorController];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v15 = [(UGCPhotosSectionController *)self configureCollectionViewHeader];
          headerView = self->_headerView;
          self->_headerView = v15;

          [(UGCPhotoCreditSectionHeaderView *)self->_headerView setPreservesSuperviewLayoutMargins:1];
          long long v17 = +[UGCPOIEnrichmentRowItem rowItemWithView:self->_headerView];
          [(UGCPhotoCreditSectionHeaderView *)self->_headerView setHidden:self->_showingAddYourPhotosCell];
          [v4 addObject:v17];
        }
        long long v18 = -[UGCPOIEnrichmentEditorCell initWithFrame:]([UGCPOIEnrichmentEditorCell alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
        photoEditorContainerCell = self->_photoEditorContainerCell;
        self->_photoEditorContainerCell = v18;

        [(UGCPOIEnrichmentEditorCell *)self->_photoEditorContainerCell setHidden:self->_showingAddYourPhotosCell];
        [(UGCPOIEnrichmentEditorCell *)self->_photoEditorContainerCell addSubview:v14];
        id v20 = [objc_alloc((Class)MUEdgeLayout) initWithItem:v14 container:self->_photoEditorContainerCell];
        [v20 activate];

        long long v21 = +[UGCPOIEnrichmentRowItem rowItemWithView:self->_photoEditorContainerCell bottomSpacing:16.0];
        if (MapsFeature_IsEnabled_SydneyARP())
        {
          if (self->_showingAddYourPhotosCell)
          {
            long long v22 = [[UGCAddPhotosCell alloc] initWithDelegate:self];
            addPhotosCell = self->_addPhotosCell;
            self->_addPhotosCell = v22;

            [(UGCAddPhotosCell *)self->_addPhotosCell setClipsToBounds:1];
            v24 = +[UGCPOIEnrichmentRowItem rowItemWithView:self->_addPhotosCell bottomSpacing:16.0];
            [v4 addObject:v24];
          }
          v25 = [(UGCPhotosForm *)self->_photosForm activePhotoList];
          if ([v25 count])
          {
          }
          else
          {
            BOOL deferAddPhotoPresentationToParent = self->_deferAddPhotoPresentationToParent;

            if (!deferAddPhotoPresentationToParent
              && (!MapsFeature_IsEnabled_ARPCommunityID()
               || !GEOConfigGetBOOL()
               || MKGetHasUserConsentedToAddingContributions() == 1))
            {
              [(UGCPhotosSectionController *)self _checkForNearbyPhotos];
            }
          }
        }
        [v4 addObject:v21];
        v28 = (NSArray *)[v4 copy];
        BOOL v29 = self->_rowItems;
        self->_rowItems = v28;

        rowItems = self->_rowItems;
        goto LABEL_21;
      }
      BOOL v5 = -[UGCPOIEnrichmentHeaderCell initWithFrame:]([UGCPOIEnrichmentHeaderCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      uint64_t v7 = +[NSBundle mainBundle];
      id v8 = [v7 localizedStringForKey:@"Your Photos Header [UGC]" value:@"localized string not found" table:0];
      [(UGCPOIEnrichmentHeaderCell *)v5 setHeaderText:v8];

      id v9 = +[UGCPOIEnrichmentRowItem rowItemWithView:v5 bottomSpacing:10.0];
      [v4 addObject:v9];
    }
    goto LABEL_7;
  }
LABEL_21:
  v26 = rowItems;
LABEL_22:

  return v26;
}

- (void)_checkForNearbyPhotos
{
  objc_initWeak(&location, self);
  mapItem = self->_mapItem;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1007FE474;
  v4[3] = &unk_1012E6998;
  objc_copyWeak(&v5, &location);
  +[UGCNearbyPhotosAvailibility hasTakenPhotosForMapItem:mapItem completion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)removeAddPhotosRowItem
{
  self->_showingAddYourPhotosCell = 0;
  [(UGCPOIEnrichmentEditorCell *)self->_photoEditorContainerCell setHidden:0];
  [(UGCPhotoCreditSectionHeaderView *)self->_headerView setHidden:0];
  [(UGCAddPhotosCell *)self->_addPhotosCell setHidden:1];
  unint64_t v3 = [(UGCPhotosSectionController *)self delegate];
  [v3 photosSectionController:self willShowPhotoCarousel:1];

  id v4 = [(UGCPhotosSectionController *)self delegate];
  [v4 sectionControllerDidUpdateRowItems:self];
}

- (void)_addFakePhoto
{
  id v10 = +[UIImage imageNamed:@"RAPNotListed"];
  unint64_t v3 = UIImageJPEGRepresentation(v10, 0.800000012);
  id v4 = [objc_alloc((Class)CLLocation) initWithLatitude:33.3 longitude:-128.7];
  id v5 = [UGCPhotoWithMetadata alloc];
  id v6 = +[NSDate date];
  uint64_t v7 = [(UGCPhotoWithMetadata *)v5 initWithImageData:v3 date:v6 location:v4 source:2];

  [(UGCPhotosForm *)self->_photosForm addPhoto:v7];
  photoEditorController = self->_photoEditorController;
  id v9 = [(UGCPhotoWithMetadata *)v7 identifier];
  [(UGCPhotoCarouselController *)photoEditorController addImage:v10 forIdentifier:v9];
}

- (unint64_t)numberOfImagePreviews
{
  v2 = [(UGCPhotosForm *)self->_photosForm activePhotoList];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (id)imagePreviewAtIndex:(unint64_t)a3
{
  id v4 = [(UGCPhotosForm *)self->_photosForm activePhotoList];
  id v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (BOOL)formInteractionEnabled
{
  return self->_formInteractionEnabled;
}

- (void)setFormInteractionEnabled:(BOOL)a3
{
  self->_formInteractionEnabled = a3;
}

- (UGCPOIEnrichmentAnalyticsDelegate)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);

  return (UGCPOIEnrichmentAnalyticsDelegate *)WeakRetained;
}

- (UGCPhotoSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UGCPhotoSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)deferAddPhotoPresentationToParent
{
  return self->_deferAddPhotoPresentationToParent;
}

- (void)setDeferAddPhotoPresentationToParent:(BOOL)a3
{
  self->_BOOL deferAddPhotoPresentationToParent = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_rowItems, 0);
  objc_storeStrong((id *)&self->_actionCoordinator, 0);
  objc_storeStrong((id *)&self->_takePhotoController, 0);
  objc_storeStrong((id *)&self->_photoEditorController, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_photoEditorContainerCell, 0);
  objc_storeStrong((id *)&self->_addPhotosCell, 0);
  objc_storeStrong((id *)&self->_photosCollectionView, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_storeStrong((id *)&self->_photosForm, 0);
}

@end