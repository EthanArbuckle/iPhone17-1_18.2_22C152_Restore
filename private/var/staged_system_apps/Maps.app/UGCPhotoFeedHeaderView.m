@interface UGCPhotoFeedHeaderView
- (BOOL)shouldShowAddPhotoButton;
- (BOOL)shouldShowDoneButton;
- (NSString)subtitleText;
- (UGCPhotoFeedHeaderTitleModel)titleModel;
- (UGCPhotoFeedHeaderView)initWithOptions:(unint64_t)a3;
- (UGCPhotoFeedHeaderViewDelegate)delegate;
- (double)heightForUnscaledHeight:(double)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)titleText;
- (unint64_t)options;
- (void)_addButtonPressed;
- (void)_addPhoto;
- (void)_addPhotosWithEntryPoint:(int64_t)a3;
- (void)_doneButtonPressed;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateFonts;
- (void)_updateForOptionsChange;
- (void)_updateTitleText;
- (void)setDelegate:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTitleModel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UGCPhotoFeedHeaderView

- (UGCPhotoFeedHeaderView)initWithOptions:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UGCPhotoFeedHeaderView;
  v4 = -[UGCPhotoFeedHeaderView initWithFrame:](&v7, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    [(UGCPhotoFeedHeaderView *)v4 setAccessibilityIdentifier:@"PhotoFeedHeader"];
    [(UGCPhotoFeedHeaderView *)v5 _setupSubviews];
    [(UGCPhotoFeedHeaderView *)v5 _setupConstraints];
    [(UGCPhotoFeedHeaderView *)v5 _updateForOptionsChange];
  }
  return v5;
}

- (void)_setupSubviews
{
  id v3 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  objc_super v7 = (UILabel *)[v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  placeNameLabel = self->_placeNameLabel;
  self->_placeNameLabel = v7;

  [(UILabel *)self->_placeNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
  v10 = [v9 _mapkit_fontWithWeight:UIFontWeightBold];
  [(UILabel *)self->_placeNameLabel setFont:v10];

  [(UILabel *)self->_placeNameLabel setNumberOfLines:0];
  [(UILabel *)self->_placeNameLabel setUserInteractionEnabled:0];
  [(UILabel *)self->_placeNameLabel setAccessibilityIdentifier:@"PlaceNameLabel"];
  [(UILabel *)self->_placeNameLabel setOverrideUserInterfaceStyle:2];
  v11 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  attributionLabel = self->_attributionLabel;
  self->_attributionLabel = v11;

  [(UILabel *)self->_attributionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
  v14 = [v13 _mapkit_fontWithWeight:UIFontWeightSemibold];
  [(UILabel *)self->_attributionLabel setFont:v14];

  [(UILabel *)self->_attributionLabel setNumberOfLines:0];
  [(UILabel *)self->_attributionLabel setUserInteractionEnabled:0];
  [(UILabel *)self->_attributionLabel setAccessibilityIdentifier:@"AttributionLabel"];
  [(UILabel *)self->_attributionLabel setOverrideUserInterfaceStyle:2];
  v15 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  photoViewerDescriptionLayoutGuide = self->_photoViewerDescriptionLayoutGuide;
  self->_photoViewerDescriptionLayoutGuide = v15;

  v17 = +[UIButtonConfiguration plainButtonConfiguration];
  v18 = +[UIBlurEffect effectWithStyle:6];
  v19 = [v17 background];
  [v19 setVisualEffect:v18];

  [v17 setCornerStyle:4];
  v20 = +[UIColor whiteColor];
  [v17 setBaseForegroundColor:v20];

  v21 = +[UIButton buttonWithType:7];
  floatingDoneButton = self->_floatingDoneButton;
  self->_floatingDoneButton = v21;

  v39 = v17;
  [(UIButton *)self->_floatingDoneButton setConfiguration:v17];
  [(UIButton *)self->_floatingDoneButton setAccessibilityIdentifier:@"DoneButton"];
  -[UIButton _setTouchInsets:](self->_floatingDoneButton, "_setTouchInsets:", -16.0, -16.0, -16.0, -16.0);
  [(UIButton *)self->_floatingDoneButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_floatingDoneButton addTarget:self action:"_doneButtonPressed" forControlEvents:64];
  v23 = +[UIButtonConfiguration plainButtonConfiguration];
  v24 = +[UIBlurEffect effectWithStyle:6];
  v25 = [v23 background];
  [v25 setVisualEffect:v24];

  [v23 setCornerStyle:4];
  v26 = +[UIColor whiteColor];
  [v23 setBaseForegroundColor:v26];

  [v23 setImagePadding:4.0];
  v27 = [(UGCPhotoFeedHeaderView *)self traitCollection];
  v28 = [v27 _maps_traitCollectionWithMaximumContentSizeCategory:UIContentSizeCategoryExtraExtraLarge];

  v29 = +[NSBundle mainBundle];
  v30 = [v29 localizedStringForKey:@"Add Photo [UGC]" value:@"localized string not found" table:0];
  [v23 setTitle:v30];

  objc_initWeak(location, self);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100B80244;
  v44[3] = &unk_101319FD8;
  objc_copyWeak(&v46, location);
  id v31 = v28;
  id v45 = v31;
  [v23 setTitleTextAttributesTransformer:v44];
  v32 = +[UIButton buttonWithType:0];
  floatingAddButton = self->_floatingAddButton;
  self->_floatingAddButton = v32;

  [(UIButton *)self->_floatingAddButton setConfiguration:v23];
  [(UIButton *)self->_floatingAddButton addTarget:self action:"_addButtonPressed" forControlEvents:64];
  [(UIButton *)self->_floatingAddButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_floatingAddButton setShowsMenuAsPrimaryAction:1];
  [(UIButton *)self->_floatingAddButton setPreferredMenuElementOrder:2];
  [(UIButton *)self->_floatingAddButton setAccessibilityIdentifier:@"AddButton"];
  -[UIButton _setTouchInsets:](self->_floatingAddButton, "_setTouchInsets:", -16.0, -16.0, -16.0, -16.0);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100B8035C;
  v42[3] = &unk_1012E6708;
  objc_copyWeak(&v43, location);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100B803A4;
  v40[3] = &unk_1012E6708;
  objc_copyWeak(&v41, location);
  v34 = +[MUPhotoOptionsMenuButton menuForPhotoOptionsMenuButtonWithCameraCompletion:v42 libraryCompletion:v40];
  [(UIButton *)self->_floatingAddButton setMenu:v34];

  [(UIButton *)self->_floatingAddButton addTarget:self action:"_addPhoto" forControlEvents:0x4000];
  LODWORD(v35) = 1148846080;
  [(UIButton *)self->_floatingAddButton setContentCompressionResistancePriority:0 forAxis:v35];
  LODWORD(v36) = 1148846080;
  [(UIButton *)self->_floatingAddButton setContentHuggingPriority:0 forAxis:v36];
  v37 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, y, width, height];
  floatingButtonsStackView = self->_floatingButtonsStackView;
  self->_floatingButtonsStackView = v37;

  [(UIStackView *)self->_floatingButtonsStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_floatingButtonsStackView setAxis:0];
  [(UIStackView *)self->_floatingButtonsStackView setSpacing:12.0];
  -[UIStackView _setTouchInsets:](self->_floatingButtonsStackView, "_setTouchInsets:", -16.0, -16.0, -16.0, -16.0);
  [(UIStackView *)self->_floatingButtonsStackView addArrangedSubview:self->_floatingAddButton];
  [(UIStackView *)self->_floatingButtonsStackView addArrangedSubview:self->_floatingDoneButton];
  [(UGCPhotoFeedHeaderView *)self addSubview:self->_floatingButtonsStackView];
  [(UGCPhotoFeedHeaderView *)self addLayoutGuide:self->_photoViewerDescriptionLayoutGuide];
  [(UGCPhotoFeedHeaderView *)self addSubview:self->_placeNameLabel];
  [(UGCPhotoFeedHeaderView *)self addSubview:self->_attributionLabel];
  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);

  objc_destroyWeak(&v46);
  objc_destroyWeak(location);
}

- (void)_doneButtonPressed
{
  id v4 = objc_alloc_init((Class)MUPresentationOptions);
  [v4 setSourceView:self->_floatingDoneButton];
  id v3 = [(UGCPhotoFeedHeaderView *)self delegate];
  [v3 photoFeedHeaderView:self selectedDoneWithPresentationOptions:v4];
}

- (void)_addButtonPressed
{
}

- (void)_addPhotosWithEntryPoint:(int64_t)a3
{
  id v6 = objc_alloc_init((Class)MUPresentationOptions);
  [v6 setSourceView:self->_floatingAddButton];
  [v6 setProgressObserver:self->_floatingAddButton];
  v5 = [(UGCPhotoFeedHeaderView *)self delegate];
  [v5 photoFeedHeaderView:self selectedAddPhotoWithEntryPoint:a3 usingPresentationOptions:v6];
}

- (void)_addPhoto
{
  +[GEOAPPortal captureUserAction:2147 target:612 value:0];
  id v3 = +[MUPhotoOptionsMenuButton preferredEntryPoint];
  if (v3)
  {
    [(UGCPhotoFeedHeaderView *)self _addPhotosWithEntryPoint:v3];
  }
}

- (BOOL)shouldShowAddPhotoButton
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)shouldShowDoneButton
{
  return self->_options & 1;
}

- (void)_setupConstraints
{
  id v63 = objc_alloc_init((Class)NSMutableArray);
  v62 = [(UILabel *)self->_placeNameLabel leadingAnchor];
  v61 = [(UILayoutGuide *)self->_photoViewerDescriptionLayoutGuide leadingAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v64[0] = v60;
  v59 = [(UILabel *)self->_placeNameLabel trailingAnchor];
  v58 = [(UILayoutGuide *)self->_photoViewerDescriptionLayoutGuide trailingAnchor];
  v57 = [v59 constraintLessThanOrEqualToAnchor:v58];
  v64[1] = v57;
  v56 = [(UILabel *)self->_placeNameLabel topAnchor];
  v55 = [(UILayoutGuide *)self->_photoViewerDescriptionLayoutGuide topAnchor];
  v54 = [v56 constraintEqualToAnchor:v55];
  v64[2] = v54;
  v53 = [(UILabel *)self->_placeNameLabel bottomAnchor];
  v52 = [(UILabel *)self->_attributionLabel topAnchor];
  v51 = [v53 constraintEqualToAnchor:v52 constant:-4.0];
  v64[3] = v51;
  v50 = [(UILabel *)self->_attributionLabel leadingAnchor];
  v49 = [(UILayoutGuide *)self->_photoViewerDescriptionLayoutGuide leadingAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v64[4] = v48;
  v47 = [(UILabel *)self->_attributionLabel trailingAnchor];
  id v46 = [(UILayoutGuide *)self->_photoViewerDescriptionLayoutGuide trailingAnchor];
  id v45 = [v47 constraintLessThanOrEqualToAnchor:v46];
  v64[5] = v45;
  v44 = [(UILabel *)self->_attributionLabel bottomAnchor];
  id v43 = [(UILayoutGuide *)self->_photoViewerDescriptionLayoutGuide bottomAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v64[6] = v42;
  v40 = [(UILayoutGuide *)self->_photoViewerDescriptionLayoutGuide leadingAnchor];
  id v41 = [(UGCPhotoFeedHeaderView *)self layoutMarginsGuide];
  v39 = [v41 leadingAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v64[7] = v38;
  double v36 = [(UILayoutGuide *)self->_photoViewerDescriptionLayoutGuide topAnchor];
  v37 = [(UGCPhotoFeedHeaderView *)self layoutMarginsGuide];
  double v35 = [v37 topAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v64[8] = v34;
  v33 = [(UILayoutGuide *)self->_photoViewerDescriptionLayoutGuide bottomAnchor];
  v32 = [(UGCPhotoFeedHeaderView *)self bottomAnchor];
  id v31 = [v33 constraintLessThanOrEqualToAnchor:v32 constant:-16.0];
  v64[9] = v31;
  v29 = [(UIButton *)self->_floatingDoneButton topAnchor];
  v30 = [(UGCPhotoFeedHeaderView *)self layoutMarginsGuide];
  v28 = [v30 topAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v64[10] = v27;
  v25 = [(UIButton *)self->_floatingDoneButton trailingAnchor];
  v26 = [(UGCPhotoFeedHeaderView *)self layoutMarginsGuide];
  v24 = [v26 trailingAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v64[11] = v23;
  v22 = [(UIButton *)self->_floatingDoneButton widthAnchor];
  v21 = [v22 constraintEqualToConstant:30.0];
  v64[12] = v21;
  v20 = [(UIButton *)self->_floatingDoneButton heightAnchor];
  v19 = [v20 constraintEqualToConstant:30.0];
  v64[13] = v19;
  v18 = [(UIStackView *)self->_floatingButtonsStackView leadingAnchor];
  v17 = [(UILayoutGuide *)self->_photoViewerDescriptionLayoutGuide trailingAnchor];
  v16 = [v18 constraintEqualToAnchor:v17 constant:8.0];
  v64[14] = v16;
  v14 = [(UIStackView *)self->_floatingButtonsStackView topAnchor];
  v15 = [(UGCPhotoFeedHeaderView *)self layoutMarginsGuide];
  id v3 = [v15 topAnchor];
  id v4 = [v14 constraintEqualToAnchor:v3];
  v64[15] = v4;
  v5 = [(UIStackView *)self->_floatingButtonsStackView trailingAnchor];
  id v6 = [(UGCPhotoFeedHeaderView *)self layoutMarginsGuide];
  objc_super v7 = [v6 trailingAnchor];
  v8 = [v5 constraintEqualToAnchor:v7];
  v64[16] = v8;
  v9 = [(UIButton *)self->_floatingAddButton heightAnchor];
  v10 = [(UIButton *)self->_floatingDoneButton heightAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v64[17] = v11;
  v12 = +[NSArray arrayWithObjects:v64 count:18];
  [v63 addObjectsFromArray:v12];

  id v13 = [v63 copy];
  +[NSLayoutConstraint activateConstraints:v13];
}

- (void)setTitleModel:(id)a3
{
  id v5 = a3;
  if (!-[UGCPhotoFeedHeaderTitleModel isEqual:](self->_titleModel, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_titleModel, a3);
    [(UGCPhotoFeedHeaderView *)self _updateTitleText];
  }
}

- (void)_updateTitleText
{
  id v3 = [(UGCPhotoFeedHeaderTitleModel *)self->_titleModel titleText];
  id v4 = [v3 length];

  if (v4)
  {
    v28[0] = NSFontAttributeName;
    id v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
    id v6 = [v5 _mapkit_fontWithWeight:UIFontWeightBold];
    v29[0] = v6;
    v28[1] = NSForegroundColorAttributeName;
    objc_super v7 = +[UIColor whiteColor];
    v29[1] = v7;
    v8 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];

    if ([(UGCPhotoFeedHeaderTitleModel *)self->_titleModel showPunchoutSymbol])
    {
      v9 = +[NSBundle mainBundle];
      v10 = [v9 localizedStringForKey:@"%@ %@ [Badge format]" value:@"localized string not found" table:0];

      id v26 = [objc_alloc((Class)NSAttributedString) initWithString:v10];
      id v11 = objc_alloc_init((Class)NSTextAttachment);
      +[UIImage systemImageNamed:@"arrow.up.right.square.fill"];
      v12 = v27 = v8;
      id v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
      v14 = [v13 _mapkit_fontWithWeight:UIFontWeightBold];
      v15 = +[UIImageSymbolConfiguration configurationWithFont:v14 scale:1];
      v16 = [v12 imageWithConfiguration:v15];
      v17 = [v16 imageWithRenderingMode:2];
      [v11 setImage:v17];

      v8 = v27;
      v18 = +[NSAttributedString attributedStringWithAttachment:v11];
      id v19 = objc_alloc((Class)NSAttributedString);
      v20 = [(UGCPhotoFeedHeaderTitleModel *)self->_titleModel titleText];
      id v21 = [v19 initWithString:v20];

      +[NSMutableAttributedString localizedAttributedStringWithFormat:](NSMutableAttributedString, "localizedAttributedStringWithFormat:", v26, v21, v18);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v24 = objc_alloc((Class)NSMutableAttributedString);
      v10 = [(UGCPhotoFeedHeaderTitleModel *)self->_titleModel titleText];
      id v22 = [v24 initWithString:v10 attributes:v8];
    }

    [v22 addAttributes:v8 range:0, [v22 length]];
    id v25 = [v22 copy];
    [(UILabel *)self->_placeNameLabel setAttributedText:v25];
  }
  else
  {
    placeNameLabel = self->_placeNameLabel;
    [(UILabel *)placeNameLabel setAttributedText:0];
  }
}

- (id)titleText
{
  return [(UILabel *)self->_placeNameLabel text];
}

- (void)setSubtitleText:(id)a3
{
}

- (NSString)subtitleText
{
  return [(UILabel *)self->_attributionLabel text];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v8 = [(UGCPhotoFeedHeaderView *)self subviews];
  v9 = [v8 reverseObjectEnumerator];

  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v14 isUserInteractionEnabled])
        {
          if (([v14 isHidden] & 1) == 0)
          {
            [v14 alpha];
            if (v15 >= 0.01)
            {
              [v14 convertPoint:self x:y];
              double v17 = v16;
              double v19 = v18;
              if (objc_msgSend(v14, "pointInside:withEvent:", v7))
              {
                uint64_t v20 = [v14 hitTest:v7 withEvent:v17];
                if (v20)
                {
                  id v21 = (void *)v20;
                  goto LABEL_15;
                }
              }
            }
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v21 = 0;
LABEL_15:

  return v21;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UGCPhotoFeedHeaderView;
  id v4 = a3;
  [(UGCPhotoFeedHeaderView *)&v9 traitCollectionDidChange:v4];
  id v5 = [(UGCPhotoFeedHeaderView *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];

  uint64_t v8 = sub_1000E93B0(v6, v7);
  if (v8) {
    [(UGCPhotoFeedHeaderView *)self _updateFonts];
  }
}

- (void)_updateFonts
{
  id v3 = [(UGCPhotoFeedHeaderView *)self traitCollection];
  [v3 _maps_traitCollectionWithMaximumContentSizeCategory:UIContentSizeCategoryExtraExtraLarge];
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
  id v5 = [v4 _mapkit_fontWithWeight:UIFontWeightBold];
  id v6 = [v5 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v10];
  [(UILabel *)self->_placeNameLabel setFont:v6];

  id v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
  uint64_t v8 = [v7 _mapkit_fontWithWeight:UIFontWeightSemibold];
  objc_super v9 = [v8 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v10];
  [(UILabel *)self->_attributionLabel setFont:v9];
}

- (double)heightForUnscaledHeight:(double)a3
{
  id v4 = [(UGCPhotoFeedHeaderView *)self traitCollection];
  id v5 = [v4 _maps_traitCollectionWithMaximumContentSizeCategory:UIContentSizeCategoryExtraExtraLarge];

  id v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
  id v7 = [v6 _mapkit_fontWithWeight:UIFontWeightBold];
  uint64_t v8 = [v7 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v5];

  [v8 _scaledValueForValue:a3];
  double v10 = v9;

  return v10;
}

- (void)setOptions:(unint64_t)a3
{
  if (self->_options != a3)
  {
    self->_options = a3;
    [(UGCPhotoFeedHeaderView *)self _updateForOptionsChange];
  }
}

- (void)_updateForOptionsChange
{
  [(UIButton *)self->_floatingDoneButton setHidden:[(UGCPhotoFeedHeaderView *)self shouldShowDoneButton] ^ 1];
  uint64_t v3 = [(UGCPhotoFeedHeaderView *)self shouldShowAddPhotoButton] ^ 1;
  floatingAddButton = self->_floatingAddButton;

  [(UIButton *)floatingAddButton setHidden:v3];
}

- (UGCPhotoFeedHeaderTitleModel)titleModel
{
  return self->_titleModel;
}

- (unint64_t)options
{
  return self->_options;
}

- (UGCPhotoFeedHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UGCPhotoFeedHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleModel, 0);
  objc_storeStrong((id *)&self->_attributionLabel, 0);
  objc_storeStrong((id *)&self->_placeNameLabel, 0);
  objc_storeStrong((id *)&self->_photoViewerDescriptionLayoutGuide, 0);
  objc_storeStrong((id *)&self->_floatingButtonsStackView, 0);
  objc_storeStrong((id *)&self->_floatingAddButton, 0);

  objc_storeStrong((id *)&self->_floatingDoneButton, 0);
}

@end