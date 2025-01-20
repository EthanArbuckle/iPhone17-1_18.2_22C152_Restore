@interface UGCAddPhotosCell
- (UGCARPAddPhotosCellRequestDelegate)delegate;
- (UGCAddPhotosCell)initWithDelegate:(id)a3;
- (void)_addPhotosUsingSourceType:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setupSubviews;
@end

@implementation UGCAddPhotosCell

- (UGCAddPhotosCell)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UGCAddPhotosCell;
  v5 = -[UGCPOIEnrichmentEditorCell initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    [(UGCAddPhotosCell *)v6 setupSubviews];
  }

  return v6;
}

- (void)setupSubviews
{
  v3 = (MUPlatterView *)[objc_alloc((Class)MUPlatterView) initWithContentView:0];
  platterView = self->_platterView;
  self->_platterView = v3;

  [(MUPlatterView *)self->_platterView setClipsToBounds:1];
  [(UGCAddPhotosCell *)self addSubview:self->_platterView];
  v5 = objc_alloc_init(_UGCAddPhotoViewModel);
  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100AAE4D8;
  v19[3] = &unk_1012E6708;
  objc_copyWeak(&v20, &location);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100AAE520;
  v17[3] = &unk_1012E6708;
  objc_copyWeak(&v18, &location);
  v6 = +[MUPhotoOptionsMenuButton menuForPhotoOptionsMenuButtonWithCameraCompletion:v19 libraryCompletion:v17];
  [(_UGCAddPhotoViewModel *)v5 setMenu:v6];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100AAE568;
  v15[3] = &unk_1012F4058;
  objc_copyWeak(&v16, &location);
  [(_UGCAddPhotoViewModel *)v5 setActionBlock:v15];
  v7 = [objc_alloc((Class)MUButtonCellRowView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  buttonView = self->_buttonView;
  self->_buttonView = v7;

  [(MUButtonCellRowView *)self->_buttonView setBottomHairlineHidden:1];
  [(MUButtonCellRowView *)self->_buttonView setViewModel:v5];
  [(MUPlatterView *)self->_platterView addSubview:self->_buttonView];
  id v9 = [objc_alloc((Class)MUEdgeLayout) initWithItem:self->_buttonView container:self->_platterView];
  id v10 = objc_alloc((Class)MUEdgeLayout);
  v11 = self->_platterView;
  v12 = [(UGCAddPhotosCell *)self layoutMarginsGuide];
  id v13 = [v10 initWithItem:v11 container:v12];

  v22[0] = v9;
  v22[1] = v13;
  v14 = +[NSArray arrayWithObjects:v22 count:2];
  +[NSLayoutConstraint _mapsui_activateLayouts:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)_addPhotosUsingSourceType:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained addPhotosCellRequestsAddingNewPhoto:self usingSourceType:a3];
}

- (UGCARPAddPhotosCellRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UGCARPAddPhotosCellRequestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_platterView, 0);

  objc_storeStrong((id *)&self->_buttonView, 0);
}

@end