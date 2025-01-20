@interface RAPReportComposerPhotosSection
- (RAPReportComposerPhotosSection)initWithQuestion:(id)a3;
- (id)cellForRowAtIndex:(int64_t)a3;
- (id)headerTitle;
- (int64_t)rowsCount;
- (void)_startPickingPhotoFromView:(id)a3 sourceType:(int64_t)a4;
- (void)photoCarouselController:(id)a3 requestsRemovingImageForIdentifier:(id)a4 completion:(id)a5;
- (void)photoCarouselControllerRequestsAddingNewPhoto:(id)a3;
- (void)photoCarouselControllerRequestsAddingNewPhoto:(id)a3 forSourceType:(int64_t)a4;
@end

@implementation RAPReportComposerPhotosSection

- (RAPReportComposerPhotosSection)initWithQuestion:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)RAPReportComposerPhotosSection;
  v6 = [(RAPTablePartSection *)&v28 init];
  v7 = v6;
  if (v6)
  {
    v23 = v5;
    p_question = (id *)&v6->_question;
    objc_storeStrong((id *)&v6->_question, a3);
    v9 = -[UGCPhotoCarouselController initWithDelegate:maximumNumberOfPhotos:prefersMenu:]([UGCPhotoCarouselController alloc], "initWithDelegate:maximumNumberOfPhotos:prefersMenu:", v7, [*p_question maximumNumberOfPhotos], 1);
    carouselViewModel = v7->_carouselViewModel;
    v7->_carouselViewModel = v9;

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v11 = [*p_question photos];
    id v12 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v17 = v7->_carouselViewModel;
          v18 = [v16 photo];
          v19 = [v16 _maps_diffableDataSourceIdentifier];
          [(UGCPhotoCarouselController *)v17 addImage:v18 forIdentifier:v19];
        }
        id v13 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v13);
    }

    id v5 = v23;
    if ([*p_question emphasis] == (id)1)
    {
      v20 = [v23 localizedPhotosPickerLabel];
      [(RAPTablePartSection *)v7 setHeaderTitle:v20];
    }
    v21 = [v23 localizedPhotosPickerExplanation];
    [(RAPTablePartSection *)v7 setFooterTitle:v21];
  }
  return v7;
}

- (id)headerTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Photos [Add Photos Section]" value:@"localized string not found" table:0];

  return v3;
}

- (int64_t)rowsCount
{
  return 1;
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  v4 = [(RAPTablePartSection *)self dequeueCellWithNamespacedReuseIdentifier:@"PhotoCell"];
  if (!v4)
  {
    v4 = [[RAPPhotoCarouselTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"PhotoCell"];
    [(RAPPhotoCarouselTableViewCell *)v4 setPhotoCarouselController:self->_carouselViewModel];
    id v5 = [(RAPTablePartSection *)self presentingViewController];
    [(UGCPhotoCarouselController *)self->_carouselViewModel setPresentingViewController:v5];
  }

  return v4;
}

- (void)_startPickingPhotoFromView:(id)a3 sourceType:(int64_t)a4
{
  id v6 = a3;
  v7 = [(RAPTablePartSection *)self presentingViewController];
  [(RAPPhotoPickerController *)self->_picker setPresentingViewController:v7];

  [(RAPPhotoPickerController *)self->_picker setAnchoringView:v6];
  picker = self->_picker;

  [(RAPPhotoPickerController *)picker startPickingWithSourceType:a4];
}

- (void)photoCarouselControllerRequestsAddingNewPhoto:(id)a3
{
}

- (void)photoCarouselControllerRequestsAddingNewPhoto:(id)a3 forSourceType:(int64_t)a4
{
  id v6 = a3;
  picker = self->_picker;
  if (!picker)
  {
    v8 = [RAPPhotoPickerController alloc];
    v9 = [(RAPCommentQuestion *)self->_question photos];
    v10 = [v9 firstObject];
    v11 = [(RAPPhotoPickerController *)v8 initWithInitialPhoto:v10];
    id v12 = self->_picker;
    self->_picker = v11;

    id v13 = self->_carouselViewModel;
    uint64_t v14 = self->_question;
    v15 = self->_picker;
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_100ACF4F4;
    v22 = &unk_101316CD8;
    v23 = v14;
    long long v24 = v13;
    v16 = v13;
    v17 = v14;
    [(RAPPhotoPickerController *)v15 addObserver:self changeHandler:&v19];

    picker = self->_picker;
  }
  [(RAPPhotoPickerController *)picker clearSelectedPhoto];
  v18 = [v6 anchoringView];
  [(RAPReportComposerPhotosSection *)self _startPickingPhotoFromView:v18 sourceType:a4];
}

- (void)photoCarouselController:(id)a3 requestsRemovingImageForIdentifier:(id)a4 completion:(id)a5
{
  question = self->_question;
  v7 = (void (**)(id, id))a5;
  v7[2](v7, (id)[(RAPCommentQuestion *)question removePhotoForIdentifier:a4]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carouselViewModel, 0);
  objc_storeStrong((id *)&self->_picker, 0);

  objc_storeStrong((id *)&self->_question, 0);
}

@end