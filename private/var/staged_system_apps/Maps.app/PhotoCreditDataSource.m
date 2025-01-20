@interface PhotoCreditDataSource
+ (void)registerCellsInCollectionView:(id)a3;
- (BOOL)photoCreditTextFieldDoesContainText;
- (PhotoCreditChangesDelegate)photoCreditChangesDelegate;
- (PhotoCreditDataSource)init;
- (SupplementaryElementsDataSourceDelegate)privacyDelegate;
- (double)footerHeightForCollectionView:(id)a3;
- (id)_footerLinkText;
- (id)_footerText;
- (id)_photoCreditNameValidationErrorMessage;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (void)_photoCreditDidUpdate;
- (void)fetchPhotoCreditPreferences;
- (void)prepareContent;
- (void)privacyTextTapped;
- (void)setPhotoCreditChangesDelegate:(id)a3;
- (void)setPrivacyDelegate:(id)a3;
- (void)updatePhotoCreditPreferencesWithCompletion:(id)a3;
@end

@implementation PhotoCreditDataSource

+ (void)registerCellsInCollectionView:(id)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PhotoCreditDataSource;
  id v3 = a3;
  [super registerCellsInCollectionView:v3];
  uint64_t v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v3 registerClass:v4 forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:v6];
}

- (PhotoCreditDataSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)PhotoCreditDataSource;
  v2 = [(PhotoCreditDataSource *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(PhotoCreditDataSource *)v2 fetchPhotoCreditPreferences];
  }
  return v3;
}

- (void)fetchPhotoCreditPreferences
{
  objc_initWeak(&location, self);
  id v3 = +[UGCPhotoAttributionPreferencesManager sharedManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100542E6C;
  v4[3] = &unk_1012EE6B8;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [v3 photoAttributionPreferencesWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)updatePhotoCreditPreferencesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void))v4;
  if (self->_didChangeAttributionPreferences)
  {
    uint64_t v6 = [(PhotoCreditDataSource *)self _photoCreditNameValidationErrorMessage];
    objc_super v7 = (void *)v6;
    if (!self->_photoCredit || v6 == 0)
    {
      v9 = +[UGCPhotoAttributionPreferencesManager sharedManager];
      BOOL photoCredit = self->_photoCredit;
      photoCreditName = self->_photoCreditName;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100543208;
      v12[3] = &unk_1012EDF20;
      v13 = v5;
      [v9 updatePhotoAttributionPreferencesAttributePhotos:photoCredit attributionName:photoCreditName completion:v12];
    }
    else
    {
      v5[2](v5, v6);
    }
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (id)_photoCreditNameValidationErrorMessage
{
  unint64_t Integer = GEOConfigGetInteger();
  unint64_t v4 = GEOConfigGetInteger();
  if ([(NSString *)self->_photoCreditName length] >= Integer
    && [(NSString *)self->_photoCreditName length] <= v4)
  {
    v11 = 0;
  }
  else
  {
    id v5 = +[NSNumber numberWithInteger:Integer];
    uint64_t v6 = +[NSNumberFormatter localizedStringFromNumber:v5 numberStyle:0];

    objc_super v7 = +[NSNumber numberWithInteger:v4];
    v8 = +[NSNumberFormatter localizedStringFromNumber:v7 numberStyle:0];

    v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"[Photo Credit] Photo Credit name too short or long" value:@"localized string not found" table:0];

    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v6, v8);
  }

  return v11;
}

- (void)prepareContent
{
  v6.receiver = self;
  v6.super_class = (Class)PhotoCreditDataSource;
  [(PreferenceValuesDataSource *)&v6 prepareContent];
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100543608;
  v3[3] = &unk_1012EE3E8;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  [(PreferenceValuesDataSource *)self addSectionWithTitle:0 content:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (double)footerHeightForCollectionView:(id)a3
{
  [a3 frame];
  double v5 = v4 + -32.0;
  double height = UILayoutFittingExpandedSize.height;
  objc_super v7 = -[MapsThemeCollectionReusableView initWithFrame:]([UserProfileSectionFooterView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v8 = [UserProfileSectionFooterViewModel alloc];
  id v9 = objc_alloc((Class)NSAttributedString);
  v10 = [(PhotoCreditDataSource *)self _footerText];
  id v11 = [v9 initWithString:v10];
  v12 = [(UserProfileSectionFooterViewModel *)v8 initWithContentString:v11];

  [(UserProfileSectionFooterView *)v7 configureWithViewModel:v12];
  LODWORD(v13) = 1148846080;
  LODWORD(v14) = 1132068864;
  -[UserProfileSectionFooterView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v7, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v5, height, v13, v14);
  double v16 = v15;

  return v16;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100544060;
  v31[3] = &unk_1012EE458;
  id v10 = v8;
  id v32 = v10;
  id v11 = v9;
  id v33 = v11;
  v34 = self;
  id v12 = a4;
  double v13 = objc_retainBlock(v31);
  unsigned int v14 = [v12 isEqualToString:UICollectionElementKindSectionFooter];

  if (v14)
  {
    id v15 = objc_alloc_init((Class)NSMutableParagraphStyle);
    [v15 setLineBreakMode:0];
    v35[0] = NSParagraphStyleAttributeName;
    v35[1] = NSForegroundColorAttributeName;
    v36[0] = v15;
    double v16 = +[UIColor secondaryLabelColor];
    v36[1] = v16;
    v30 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];

    id v17 = objc_alloc((Class)NSMutableAttributedString);
    v18 = [(PhotoCreditDataSource *)self _footerText];
    id v19 = [v17 initWithString:v18 attributes:v30];

    v20 = [(PhotoCreditDataSource *)self _footerText];
    v21 = [(PhotoCreditDataSource *)self _footerLinkText];
    id v22 = [v20 rangeOfString:v21];
    id v23 = v10;
    uint64_t v25 = v24;

    v26 = +[UIColor systemBlueColor];
    uint64_t v27 = v25;
    id v10 = v23;
    [v19 addAttribute:NSForegroundColorAttributeName value:v26 range:v22 v27];

    v28 = ((void (*)(void *, id, uint64_t))v13[2])(v13, v19, 1);
  }
  else
  {
    v28 = ((void (*)(void *, void, void))v13[2])(v13, 0, 0);
  }

  return v28;
}

- (void)privacyTextTapped
{
  id v2 = [(PhotoCreditDataSource *)self privacyDelegate];
  [v2 didTapOnPrivacyText];
}

- (BOOL)photoCreditTextFieldDoesContainText
{
  return [(NSString *)self->_photoCreditName length] != 0;
}

- (void)_photoCreditDidUpdate
{
  BOOL v3 = [(PhotoCreditDataSource *)self photoCreditTextFieldDoesContainText];
  id v4 = [(PhotoCreditDataSource *)self photoCreditChangesDelegate];
  [v4 updateAppearanceForPhotoCredit:self->_photoCredit photoCreditNameExists:v3];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PhotoCreditDataSource;
  id v4 = [(PreferenceValuesDataSource *)&v8 collectionView:a3 cellForItemAtIndexPath:a4];
  double v5 = +[UIBackgroundConfiguration listGroupedCellConfiguration];
  objc_super v6 = [v5 backgroundColor];
  [v4 setBackgroundColor:v6];

  return v4;
}

- (id)_footerText
{
  BOOL v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"[Photo Credit] Footer string." value:@"localized string not found" table:0];
  double v5 = [(PhotoCreditDataSource *)self _footerLinkText];
  objc_super v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5);

  return v6;
}

- (id)_footerLinkText
{
  id v2 = objc_alloc((Class)NSString);
  BOOL v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"[Photo Credit] Terms" value:@"localized string not found" table:0];
  id v5 = [v2 initWithString:v4];

  return v5;
}

- (PhotoCreditChangesDelegate)photoCreditChangesDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoCreditChangesDelegate);

  return (PhotoCreditChangesDelegate *)WeakRetained;
}

- (void)setPhotoCreditChangesDelegate:(id)a3
{
}

- (SupplementaryElementsDataSourceDelegate)privacyDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privacyDelegate);

  return (SupplementaryElementsDataSourceDelegate *)WeakRetained;
}

- (void)setPrivacyDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_privacyDelegate);
  objc_destroyWeak((id *)&self->_photoCreditChangesDelegate);

  objc_storeStrong((id *)&self->_photoCreditName, 0);
}

@end