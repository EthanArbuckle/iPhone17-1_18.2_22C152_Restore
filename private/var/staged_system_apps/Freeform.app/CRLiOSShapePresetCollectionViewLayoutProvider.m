@interface CRLiOSShapePresetCollectionViewLayoutProvider
- (BOOL)isCellEditableForSection:(unint64_t)a3 context:(id)a4;
- (BOOL)p_isLabeledContext:(id)a3;
- (BOOL)p_isUserDefinedShapeContext:(id)a3;
- (BOOL)shouldVerticallyDistributeEvenlyForContext:(id)a3;
- (BOOL)showsSubpageNavigator;
- (BOOL)supportsSearch;
- (CGSize)p_preferredGridSpacingInSection:(unint64_t)a3 forContext:(id)a4;
- (CGSize)p_preferredSwatchSize;
- (CGSize)swatchInsets;
- (CRLShapeCollectionDataSource)p_shapeCollectionDataSource;
- (CRLShapeSearchResultsCollection)p_searchResultsCollection;
- (CRLiOSShapePresetCollectionViewLayoutProvider)initWithShapeCollectionDataSource:(id)a3 searchResultsCollection:(id)a4;
- (NSArray)pageControlTitles;
- (double)additionalHeightForItemInSection:(unint64_t)a3 context:(id)a4;
- (double)horizontalInsetForItemInSection:(unint64_t)a3 context:(id)a4;
- (double)minimumHorizontalSpacingMultiplierInSection:(unint64_t)a3 forContext:(id)a4;
- (double)minimumVerticalSpacingMultiplierInSection:(unint64_t)a3 forContext:(id)a4;
- (double)presetWidthToHeightRatioForContext:(id)a3;
- (id)cellRegistrationDictionary;
- (id)cellReuseIdentifierForSection:(unint64_t)a3 context:(id)a4;
- (unint64_t)itemsPerRowForContext:(id)a3;
- (unint64_t)numberOfItemsInSection:(unint64_t)a3 context:(id)a4;
- (unint64_t)numberOfSectionsInCollectionViewForContext:(id)a3;
- (unint64_t)pageControlType;
- (void)setP_searchResultsCollection:(id)a3;
- (void)setP_shapeCollectionDataSource:(id)a3;
@end

@implementation CRLiOSShapePresetCollectionViewLayoutProvider

- (CRLiOSShapePresetCollectionViewLayoutProvider)initWithShapeCollectionDataSource:(id)a3 searchResultsCollection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSShapePresetCollectionViewLayoutProvider;
  v9 = [(CRLiOSShapePresetCollectionViewLayoutProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_shapeCollectionDataSource, a3);
    objc_storeStrong((id *)&v10->_searchResultsCollection, a4);
  }

  return v10;
}

- (double)additionalHeightForItemInSection:(unint64_t)a3 context:(id)a4
{
  unsigned int v4 = [(CRLiOSShapePresetCollectionViewLayoutProvider *)self p_isLabeledContext:a4];
  double result = 30.0 + -2.0;
  if (!v4) {
    return 0.0;
  }
  return result;
}

- (id)cellReuseIdentifierForSection:(unint64_t)a3 context:(id)a4
{
  if ([(CRLiOSShapePresetCollectionViewLayoutProvider *)self p_isLabeledContext:a4]) {
    unsigned int v4 = @"CRLiOSPresetCollectionViewLabeledCell";
  }
  else {
    unsigned int v4 = @"CRLiOSPresetCollectionViewCell";
  }

  return v4;
}

- (BOOL)isCellEditableForSection:(unint64_t)a3 context:(id)a4
{
  return [(CRLiOSShapePresetCollectionViewLayoutProvider *)self p_isUserDefinedShapeContext:a4];
}

- (id)cellRegistrationDictionary
{
  v2 = +[UINib nibWithNibName:@"CRLiOSPresetCollectionViewCell" bundle:0];
  uint64_t v3 = +[UINib nibWithNibName:@"CRLiOSPresetCollectionViewLabeledCell" bundle:0];
  unsigned int v4 = (void *)v3;
  if (v2)
  {
    if (v3) {
      goto LABEL_22;
    }
    goto LABEL_13;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F6DF0);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010ADD48();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F6E10);
  }
  v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010668E0(v5);
  }
  v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapePresetCollectionViewLayoutProvider cellRegistrationDictionary]");
  id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapePresetCollectionViewLayoutProvider.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 68, 0, "invalid nil value for '%{public}s'", "cellNib");

  if (!v4)
  {
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6E30);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010ADC98();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6E50);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v8);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapePresetCollectionViewLayoutProvider cellRegistrationDictionary]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapePresetCollectionViewLayoutProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 69, 0, "invalid nil value for '%{public}s'", "labeledCellNib");
  }
LABEL_22:
  v15[0] = @"CRLiOSPresetCollectionViewCell";
  v11 = v2;
  if (!v2)
  {
    v11 = +[NSNull null];
  }
  v15[1] = @"CRLiOSPresetCollectionViewLabeledCell";
  v16[0] = v11;
  objc_super v12 = v4;
  if (!v4)
  {
    objc_super v12 = +[NSNull null];
  }
  v16[1] = v12;
  v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  if (v4)
  {
    if (v2) {
      goto LABEL_28;
    }
  }
  else
  {

    if (v2) {
      goto LABEL_28;
    }
  }

LABEL_28:

  return v13;
}

- (double)horizontalInsetForItemInSection:(unint64_t)a3 context:(id)a4
{
  unsigned int v4 = [(CRLiOSShapePresetCollectionViewLayoutProvider *)self p_isLabeledContext:a4];
  double result = 0.0;
  if (v4) {
    return 8.0;
  }
  return result;
}

- (unint64_t)itemsPerRowForContext:(id)a3
{
  id v3 = a3;
  if (([v3 hasCompactHeightRegularWidthTraitCollection] & 1) != 0
    || [v3 hasCompactHeightCompactWidthTraitCollection])
  {
    unint64_t v4 = 5;
  }
  else
  {
    unint64_t v4 = 3;
  }

  return v4;
}

- (double)minimumHorizontalSpacingMultiplierInSection:(unint64_t)a3 forContext:(id)a4
{
  [(CRLiOSShapePresetCollectionViewLayoutProvider *)self p_preferredGridSpacingInSection:a3 forContext:a4];
  double v6 = v5;
  [(CRLiOSShapePresetCollectionViewLayoutProvider *)self p_preferredSwatchSize];
  return v6 / v7;
}

- (double)minimumVerticalSpacingMultiplierInSection:(unint64_t)a3 forContext:(id)a4
{
  [(CRLiOSShapePresetCollectionViewLayoutProvider *)self p_preferredGridSpacingInSection:a3 forContext:a4];
  double v6 = v5;
  [(CRLiOSShapePresetCollectionViewLayoutProvider *)self p_preferredSwatchSize];
  return v6 / v7;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  if ([v6 isSearching])
  {
    double v7 = [(CRLiOSShapePresetCollectionViewLayoutProvider *)self p_searchResultsCollection];
    id v8 = [v7 numberOfShapesInSection:a3];
  }
  else
  {
    double v7 = [(CRLiOSShapePresetCollectionViewLayoutProvider *)self p_shapeCollectionDataSource];
    id v8 = [v7 numberOfShapesInCategoryAtIndex:[v6 pageIndex]];
  }
  unint64_t v9 = (unint64_t)v8;

  return v9;
}

- (unint64_t)numberOfSectionsInCollectionViewForContext:(id)a3
{
  if (![a3 isSearching]) {
    return 1;
  }
  unint64_t v4 = [(CRLiOSShapePresetCollectionViewLayoutProvider *)self p_searchResultsCollection];
  id v5 = [v4 numberOfSections];

  return (unint64_t)v5;
}

- (double)presetWidthToHeightRatioForContext:(id)a3
{
  return 1.0;
}

- (BOOL)shouldVerticallyDistributeEvenlyForContext:(id)a3
{
  id v3 = a3;
  if ([v3 pageIndex])
  {
    BOOL v4 = 0;
  }
  else if ([v3 isInPopover])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [v3 traitCollection];
    BOOL v4 = [v5 userInterfaceIdiom] == 0;
  }
  return v4;
}

- (BOOL)showsSubpageNavigator
{
  return 0;
}

- (BOOL)supportsSearch
{
  return 1;
}

- (CGSize)swatchInsets
{
  v2 = +[CRLSwatchCache swatchCache];
  [v2 shapeSwatchInset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (unint64_t)pageControlType
{
  return 1;
}

- (NSArray)pageControlTitles
{
  v2 = [(CRLiOSShapePresetCollectionViewLayoutProvider *)self p_shapeCollectionDataSource];
  double v3 = [v2 categoryNames];

  return (NSArray *)v3;
}

- (CGSize)p_preferredSwatchSize
{
  double v2 = 62.0;
  double v3 = 62.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)p_preferredGridSpacingInSection:(unint64_t)a3 forContext:(id)a4
{
  id v5 = a4;
  double v6 = [v5 traitCollection];
  id v7 = [v6 userInterfaceIdiom];

  if (v7)
  {
    [v5 contentSize];
    double v9 = v8;
    BOOL v10 = v8 <= 438.0 && v8 > 375.0;
    id v11 = [v5 pageIndex];
    unsigned int v12 = +[UIScreen crl_deviceIsLandscape];
    unsigned int v13 = [v5 isSearching];
    unsigned __int8 v14 = [v5 isInPopover];
    if ([v5 isSidebarLike])
    {
      if (v9 <= 375.0)
      {
        if (v12) {
          double v26 = 28.0;
        }
        else {
          double v26 = 34.0;
        }
        double v21 = 33.5;
      }
      else
      {
        if (v11)
        {
          BOOL v15 = v13 == 0;
          if (v12)
          {
            double v16 = 35.0;
            double v17 = 31.0;
          }
          else
          {
            double v16 = 40.0;
            double v17 = 34.0;
          }
        }
        else
        {
          BOOL v15 = v12 == 0;
          double v16 = 34.0;
          double v17 = 30.0;
        }
        if (v15) {
          double v26 = v16;
        }
        else {
          double v26 = v17;
        }
        double v21 = 49.0;
      }
      goto LABEL_54;
    }
    double v24 = 62.5;
    double v25 = 80.0;
    if (!v12) {
      double v25 = 62.5;
    }
    if (!v10) {
      double v24 = 33.5;
    }
    if (v9 <= 438.0) {
      double v21 = v24;
    }
    else {
      double v21 = v25;
    }
    BOOL v20 = v11 == 0;
    if (v14)
    {
      double v22 = 25.0;
      double v23 = 17.0;
      goto LABEL_41;
    }
    if (v11)
    {
      BOOL v27 = v13 == 0;
      if (v10)
      {
        double v28 = 32.0;
        double v33 = 28.0;
        goto LABEL_51;
      }
      double v28 = 36.0;
      uint64_t v29 = 0x4041000000000000;
    }
    else
    {
      BOOL v27 = v12 == 0;
      double v28 = 32.0;
      uint64_t v29 = 0x4042000000000000;
    }
    double v33 = *(double *)&v29;
LABEL_51:
    if (v27) {
      double v26 = v28;
    }
    else {
      double v26 = v33;
    }
    goto LABEL_54;
  }
  v18 = [v5 traitCollection];
  id v19 = [v18 verticalSizeClass];

  if ((id)+[UIScreen crl_screenClass] == (id)4)
  {
    BOOL v20 = v19 == (id)1;
    double v21 = dbl_1011783C0[v19 == (id)1];
    double v22 = 32.0;
    double v23 = 27.0;
    goto LABEL_41;
  }
  if (+[UIScreen crl_phoneUI568H])
  {
    BOOL v20 = v19 == (id)1;
    double v21 = dbl_1011783B0[v19 == (id)1];
    double v22 = 36.0;
    double v23 = 30.0;
    goto LABEL_41;
  }
  if (!+[UIScreen crl_screenClassPhoneUIRegularOrLarge])
  {
    BOOL v20 = v19 == (id)1;
    double v21 = dbl_101178390[v19 == (id)1];
    double v22 = 35.0;
    double v23 = 20.0;
LABEL_41:
    if (v20) {
      double v26 = v23;
    }
    else {
      double v26 = v22;
    }
    goto LABEL_54;
  }
  id v30 = [v5 pageIndex];
  double v21 = dbl_1011783A0[v19 == (id)1];
  double v31 = 56.0;
  if (v19 == (id)1) {
    double v31 = 23.0;
  }
  double v32 = 40.0;
  if (v19 == (id)1) {
    double v32 = 20.0;
  }
  if (v30) {
    double v26 = v32;
  }
  else {
    double v26 = v31;
  }
LABEL_54:
  if ([(CRLiOSShapePresetCollectionViewLayoutProvider *)self p_isLabeledContext:v5]) {
    double v26 = v26 + -5.0;
  }

  double v34 = v21;
  double v35 = v26;
  result.height = v35;
  result.width = v34;
  return result;
}

- (BOOL)p_isLabeledContext:(id)a3
{
  id v4 = a3;
  if ([(CRLiOSShapePresetCollectionViewLayoutProvider *)self p_isUserDefinedShapeContext:v4])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    unsigned __int8 v5 = [v4 isSearching];
  }

  return v5;
}

- (BOOL)p_isUserDefinedShapeContext:(id)a3
{
  id v4 = [a3 pageIndex];
  unsigned __int8 v5 = [(CRLiOSShapePresetCollectionViewLayoutProvider *)self p_shapeCollectionDataSource];
  LOBYTE(v4) = v4 == [v5 indexOfUserDefinedLibraryCategory];

  return (char)v4;
}

- (CRLShapeCollectionDataSource)p_shapeCollectionDataSource
{
  return self->_shapeCollectionDataSource;
}

- (void)setP_shapeCollectionDataSource:(id)a3
{
}

- (CRLShapeSearchResultsCollection)p_searchResultsCollection
{
  return self->_searchResultsCollection;
}

- (void)setP_searchResultsCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultsCollection, 0);

  objc_storeStrong((id *)&self->_shapeCollectionDataSource, 0);
}

@end