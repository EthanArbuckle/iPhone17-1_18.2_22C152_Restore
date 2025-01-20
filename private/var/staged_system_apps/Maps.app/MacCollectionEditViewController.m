@interface MacCollectionEditViewController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CollectionHandler)collection;
- (MacCollectionEditViewController)initWithCollection:(id)a3 delegate:(id)a4;
- (MacCollectionEditViewControllerDelegate)delegate;
- (NSString)newTitle;
- (id)_buttonWithTitle:(id)a3 imageNamed:(id)a4;
- (id)_spacerImage;
- (void)_changePhoto;
- (void)_delete;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MacCollectionEditViewController

- (MacCollectionEditViewController)initWithCollection:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MacCollectionEditViewController;
  v9 = [(MacCollectionEditViewController *)&v12 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collection, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)viewDidLoad
{
  v45.receiver = self;
  v45.super_class = (Class)MacCollectionEditViewController;
  [(MacCollectionEditViewController *)&v45 viewDidLoad];
  v3 = [(MacCollectionEditViewController *)self view];
  [v3 setLayoutMargins:16.0, 16.0, 16.0, 16.0];

  v4 = [(MacCollectionEditViewController *)self view];
  [v4 setAccessibilityIdentifier:@"MacCollectionEditView"];

  id v5 = objc_alloc((Class)UITextField);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v9 = [v5 initWithFrame:CGRectZero.origin.x, y, width, height];
  textField = self->_textField;
  self->_textField = v9;

  [(UITextField *)self->_textField setBorderStyle:3];
  [(UITextField *)self->_textField setControlSize:2];
  v11 = [(CollectionHandler *)self->_collection title];
  [(UITextField *)self->_textField setText:v11];

  objc_super v12 = +[UIFont system20Bold];
  [(UITextField *)self->_textField setFont:v12];

  [(UITextField *)self->_textField setDelegate:self];
  [(UITextField *)self->_textField setEnabled:[(CollectionHandler *)self->_collection canEditTitle]];
  [(UITextField *)self->_textField setAccessibilityIdentifier:@"MacCollectionEditTextField"];
  v13 = [(MacCollectionEditViewController *)self view];
  [v13 addSubview:self->_textField];

  v14 = -[CollectionImageView initWithFrame:makeCornersRounded:]([CollectionImageView alloc], "initWithFrame:makeCornersRounded:", 0, CGRectZero.origin.x, y, width, height);
  imageView = self->_imageView;
  self->_imageView = v14;

  [(CollectionImageView *)self->_imageView _setContinuousCornerRadius:17.0];
  [(CollectionImageView *)self->_imageView setClipsToBounds:1];
  [(CollectionImageView *)self->_imageView setCollectionInfo:self->_collection];
  [(CollectionImageView *)self->_imageView setAccessibilityIdentifier:@"MacCollectionEditImage"];
  v16 = [(MacCollectionEditViewController *)self view];
  [v16 addSubview:self->_imageView];

  if ([(CollectionHandler *)self->_collection canEditImage])
  {
    v17 = +[NSBundle mainBundle];
    v18 = [v17 localizedStringForKey:@"[Edit Collection] Change Key Photo" value:@"localized string not found" table:0];
    v19 = [(MacCollectionEditViewController *)self _buttonWithTitle:v18 imageNamed:@"photo"];
    changePhotoButton = self->_changePhotoButton;
    self->_changePhotoButton = v19;

    [(UIButton *)self->_changePhotoButton addTarget:self action:"_changePhoto" forControlEvents:64];
    [(UIButton *)self->_changePhotoButton setAccessibilityIdentifier:@"MacCollectionEditChangePhotoButton"];
    v21 = [(MacCollectionEditViewController *)self view];
    [v21 addSubview:self->_changePhotoButton];
  }
  if ([(CollectionHandler *)self->_collection canDelete])
  {
    v22 = +[NSBundle mainBundle];
    v23 = [v22 localizedStringForKey:@"[Edit Guide] Delete Guide" value:@"localized string not found" table:0];
    v24 = [(MacCollectionEditViewController *)self _buttonWithTitle:v23 imageNamed:@"trash"];
    deleteButton = self->_deleteButton;
    self->_deleteButton = v24;

    [(UIButton *)self->_deleteButton addTarget:self action:"_delete" forControlEvents:64];
    [(UIButton *)self->_deleteButton setAccessibilityIdentifier:@"MacCollectionEditDeleteButton"];
    v26 = [(MacCollectionEditViewController *)self view];
    [v26 addSubview:self->_deleteButton];
  }
  id v27 = objc_alloc((Class)MUSizeLayout);
  v28 = [(MacCollectionEditViewController *)self view];
  +[MUSizeLayout useIntrinsicContentSize];
  LODWORD(v29) = 1144750080;
  id v31 = [v27 initWithItem:v28 size:282.0 priority:v30 v29];

  id v32 = [objc_alloc((Class)MUSizeLayout) initWithItem:self->_imageView size:60.0, 60.0];
  id v33 = objc_alloc((Class)MUStackLayout);
  v34 = [(MacCollectionEditViewController *)self view];
  v35 = [v34 layoutMarginsGuide];
  id v36 = [v33 initWithContainer:v35 axis:1];

  [v36 setDistribution:2];
  LODWORD(v37) = 1112276992;
  [v36 setDistributionFittingSizePriority:v37];
  [v36 setAlignment:1];
  [v36 addArrangedLayoutItem:self->_textField];
  [v36 setAlignment:0 forArrangedLayoutItem:self->_textField];
  [v36 addArrangedLayoutItem:self->_imageView];
  double v38 = 20.0;
  [v36 setPadding:20.0 forArrangedLayoutItem:self->_imageView];
  if (self->_changePhotoButton)
  {
    [v36 addArrangedLayoutItem:];
    [v36 setPadding:20.0 forArrangedLayoutItem:self->_changePhotoButton];
    double v38 = 8.0;
  }
  if (self->_deleteButton)
  {
    [v36 addArrangedLayoutItem:];
    [v36 setPadding:self->_deleteButton forArrangedLayoutItem:v38 padding:0.0, 0.0, 0.0];
  }
  v46[0] = v31;
  v46[1] = v32;
  v46[2] = v36;
  v39 = +[NSArray arrayWithObjects:v46 count:3];
  +[NSLayoutConstraint _mapsui_activateLayouts:v39];

  v40 = [(MacCollectionEditViewController *)self view];
  [v40 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
  double v42 = v41;
  double v44 = v43;

  -[MacCollectionEditViewController setPreferredContentSize:](self, "setPreferredContentSize:", v42, v44);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MacCollectionEditViewController;
  [(MacCollectionEditViewController *)&v4 viewDidAppear:a3];
  [(UITextField *)self->_textField becomeFirstResponder];
}

- (id)_buttonWithTitle:(id)a3 imageNamed:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  v9 = +[UIButtonConfiguration tintedButtonConfiguration];
  [v9 setTitle:v7];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100B1535C;
  v25[3] = &unk_1012E90F0;
  id v26 = v8;
  id v24 = v8;
  [v9 setTitleTextAttributesTransformer:v25];
  v10 = [(MacCollectionEditViewController *)self _spacerImage];
  [v9 setImage:v10];

  [v9 setImagePadding:0.0];
  [v9 setContentInsets:NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing];
  v11 = +[UIButton buttonWithType:0];
  [v11 setConfiguration:v9];
  id v12 = objc_alloc((Class)UIImageView);
  v13 = +[UIImage systemImageNamed:v6];

  id v14 = [v12 initWithImage:v13];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  v15 = +[UIImageSymbolConfiguration configurationWithFont:v24];
  [v14 setPreferredSymbolConfiguration:v15];

  [v11 addSubview:v14];
  v16 = [v14 centerXAnchor];
  v17 = [v11 leadingAnchor];
  v18 = [v16 constraintEqualToAnchor:v17 constant:9.0];
  v27[0] = v18;
  v19 = [v14 centerYAnchor];
  v20 = [v11 centerYAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v27[1] = v21;
  v22 = +[NSArray arrayWithObjects:v27 count:2];
  +[NSLayoutConstraint activateConstraints:v22];

  return v11;
}

- (id)_spacerImage
{
  id v2 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:22.0, 1.0];
  v3 = [v2 imageWithActions:&stru_1013180D0];

  return v3;
}

- (NSString)newTitle
{
  return (NSString *)objc_claimAutoreleasedReturnValue();
}

- (void)_changePhoto
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained macCollectionEditViewControllerPickPhoto:self];
}

- (void)_delete
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained macCollectionEditViewControllerDelete:self];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 text];
  v11 = [v10 stringByReplacingCharactersInRange:location length:length withString:v9];

  unint64_t UInteger = GEOConfigGetUInteger();
  id v13 = [v11 length];
  if ((unint64_t)v13 > UInteger)
  {
    uint64_t v14 = [v11 substringWithRange:0, UInteger];

    [v8 setText:v14];
    v11 = (void *)v14;
  }

  return (unint64_t)v13 <= UInteger;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained macCollectionEditViewControllerDismiss:self];

  return 1;
}

- (CollectionHandler)collection
{
  return self->_collection;
}

- (MacCollectionEditViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MacCollectionEditViewControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_changePhotoButton, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_textField, 0);
}

@end