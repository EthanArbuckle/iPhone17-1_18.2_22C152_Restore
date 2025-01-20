@interface CRLiOSShapePresetProvider
+ (id)p_placeholderLocalizedString;
- (BOOL)contextIsLowContrast:(id)a3 forBackgroundColor:(id)a4;
- (BOOL)isDefaultLocalizedNameForPresetAtIndexPath:(id)a3 context:(id)a4;
- (BOOL)shouldWaitBeforeDeliveringSwatchesInContext:(id)a3;
- (BOOL)suppressesAnimation;
- (CRLShapeCollectionDataSource)p_shapeCollectionDataSource;
- (CRLShapeSearchResultsCollection)p_searchResultsCollection;
- (CRLiOSShapePresetProvider)initWithShapeCollectionDataSource:(id)a3 searchResultsCollection:(id)a4;
- (UIEdgeInsets)swatchInsets;
- (id)defaultLocalizedNameForPresetAtIndexPath:(id)a3 context:(id)a4;
- (id)localizedAccessibilityNameForPresetAtIndexPath:(id)a3 context:(id)a4;
- (id)localizedNameForPresetAtIndexPath:(id)a3 context:(id)a4;
- (id)p_localizedNameForPresetAtIndexPath:(id)a3 context:(id)a4 isUserDefinedShape:(BOOL *)a5;
- (id)p_shapeAtIndexPath:(id)a3 context:(id)a4;
- (id)swatchOperationWithSize:(CGSize)a3 atIndexPath:(id)a4 context:(id)a5;
- (void)setP_searchResultsCollection:(id)a3;
- (void)setP_shapeCollectionDataSource:(id)a3;
@end

@implementation CRLiOSShapePresetProvider

- (CRLiOSShapePresetProvider)initWithShapeCollectionDataSource:(id)a3 searchResultsCollection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSShapePresetProvider;
  v9 = [(CRLiOSShapePresetProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_shapeCollectionDataSource, a3);
    objc_storeStrong((id *)&v10->_searchResultsCollection, a4);
  }

  return v10;
}

- (BOOL)contextIsLowContrast:(id)a3 forBackgroundColor:(id)a4
{
  return 0;
}

- (id)p_localizedNameForPresetAtIndexPath:(id)a3 context:(id)a4 isUserDefinedShape:(BOOL *)a5
{
  id v8 = a4;
  v9 = [(CRLiOSShapePresetProvider *)self p_shapeAtIndexPath:a3 context:v8];
  v10 = [v9 name];
  if ([v8 isSearching])
  {
    v11 = [(CRLiOSShapePresetProvider *)self p_searchResultsCollection];
    uint64_t v12 = [v11 displayNameForShape:v9];

    v10 = (void *)v12;
  }
  id v13 = [v8 pageIndex];
  v14 = [(CRLiOSShapePresetProvider *)self p_shapeCollectionDataSource];
  id v15 = [v14 indexOfUserDefinedLibraryCategory];

  if (a5) {
    *a5 = v13 == v15;
  }
  if (![v10 length] && v13 == v15)
  {
    uint64_t v16 = +[CRLiOSShapePresetProvider p_placeholderLocalizedString];

    v10 = (void *)v16;
  }

  return v10;
}

- (id)localizedNameForPresetAtIndexPath:(id)a3 context:(id)a4
{
  return [(CRLiOSShapePresetProvider *)self p_localizedNameForPresetAtIndexPath:a3 context:a4 isUserDefinedShape:0];
}

- (BOOL)isDefaultLocalizedNameForPresetAtIndexPath:(id)a3 context:(id)a4
{
  char v8 = 0;
  v4 = [(CRLiOSShapePresetProvider *)self p_localizedNameForPresetAtIndexPath:a3 context:a4 isUserDefinedShape:&v8];
  if (v8)
  {
    v5 = +[CRLiOSShapePresetProvider p_placeholderLocalizedString];
    unsigned __int8 v6 = [v4 isEqualToString:v5];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)defaultLocalizedNameForPresetAtIndexPath:(id)a3 context:(id)a4
{
  [a4 pageIndex:a3];
  unsigned __int8 v6 = [(CRLiOSShapePresetProvider *)self p_shapeCollectionDataSource];
  id v7 = [v6 indexOfUserDefinedLibraryCategory];

  if (v5 == v7)
  {
    char v8 = +[CRLiOSShapePresetProvider p_placeholderLocalizedString];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)localizedAccessibilityNameForPresetAtIndexPath:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = [(CRLiOSShapePresetProvider *)self p_shapeAtIndexPath:a3 context:v6];
  char v8 = [v7 accessibilityName];
  if (![v8 length])
  {
    id v9 = [v6 pageIndex];
    v10 = [(CRLiOSShapePresetProvider *)self p_shapeCollectionDataSource];
    id v11 = [v10 indexOfUserDefinedLibraryCategory];

    if (v9 == v11)
    {
      uint64_t v12 = +[NSBundle mainBundle];
      uint64_t v13 = [v12 localizedStringForKey:@"Shape" value:0 table:0];

      char v8 = (void *)v13;
    }
  }

  return v8;
}

- (BOOL)shouldWaitBeforeDeliveringSwatchesInContext:(id)a3
{
  return 1;
}

- (BOOL)suppressesAnimation
{
  return 1;
}

- (UIEdgeInsets)swatchInsets
{
  v2 = +[CRLSwatchCache swatchCache];
  [v2 shapeSwatchInset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v6;
  double v8 = v4;
  double v9 = v6;
  double v10 = v4;
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v7;
  return result;
}

- (id)swatchOperationWithSize:(CGSize)a3 atIndexPath:(id)a4 context:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  double v10 = [(CRLiOSShapePresetProvider *)self p_shapeAtIndexPath:a4 context:v9];
  unint64_t v11 = (unint64_t)[v10 shapeType];
  uint64_t v12 = [v9 editingCoordinator];
  if (v11 > 0x14 || ((1 << v11) & 0x1D8006) == 0) {
    double v14 = 0.0;
  }
  else {
    double v14 = 45.0;
  }
  unsigned int v15 = [v9 isInDarkContainer];
  unsigned int v16 = [v9 isInTranslucentContainer];
  uint64_t v17 = 2;
  if (v16) {
    uint64_t v17 = 3;
  }
  if (v15) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = v16;
  }
  v19 = objc_alloc_init(CRLSwatchRenderingContext);
  [(CRLSwatchRenderingContext *)v19 setBackgroundAppearance:v18];
  [(CRLSwatchRenderingContext *)v19 setWantsToRenderHighContrastBackground:0];
  v20 = [CRLShapeRenderingOperation alloc];
  +[UIScreen crl_screenScale];
  double v22 = v21;
  v23 = [v10 pathSourceWithSize:width, height];
  v24 = -[CRLShapeRenderingOperation initWithImageSize:imageScale:shapeType:shapePathSource:angle:editingCoordinator:swatchCacheRenderingContext:](v20, "initWithImageSize:imageScale:shapeType:shapePathSource:angle:editingCoordinator:swatchCacheRenderingContext:", v11, v23, v12, v19, width, height, v22, v14);

  return v24;
}

- (id)p_shapeAtIndexPath:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 isSearching])
  {
    double v8 = [(CRLiOSShapePresetProvider *)self p_searchResultsCollection];
    id v9 = [v8 shapeAtIndexPath:v7];
  }
  else
  {
    double v8 = [(CRLiOSShapePresetProvider *)self p_shapeCollectionDataSource];
    id v10 = [v7 row];

    id v9 = [v8 shapeAtIndex:v10 categoryIndex:[v6 pageIndex]];
  }

  return v9;
}

+ (id)p_placeholderLocalizedString
{
  v2 = +[NSBundle mainBundle];
  double v3 = [v2 localizedStringForKey:@"Shape" value:0 table:0];

  return v3;
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