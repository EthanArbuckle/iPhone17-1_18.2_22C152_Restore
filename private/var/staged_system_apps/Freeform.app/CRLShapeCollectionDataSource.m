@interface CRLShapeCollectionDataSource
+ (unint64_t)p_firstIndexOfShapeLibraryCategories;
- (BOOL)hasUserDefinedShapesInCategoryAtIndex:(unint64_t)a3;
- (BOOL)p_hasUserDefinedShapes;
- (BOOL)showConnectionLinesInLibrary;
- (BOOL)showLinesInLibrary;
- (CRLBasicShapeLibraryCollection)p_basicShapeLibraryCollection;
- (CRLShapeCollectionDataSource)initWithBasicShapeLibrary:(id)a3;
- (CRLShapeCollectionDataSource)initWithShapeLibrary:(id)a3 basicShapeLibrary:(id)a4;
- (CRLShapeLibrary)p_shapeLibrary;
- (NSArray)categoryNames;
- (id)p_shapeAtIndex:(unint64_t)a3 categoryIndex:(unint64_t)a4;
- (id)p_shapeCollectionAtIndex:(unint64_t)a3;
- (id)p_shapeWithIdentifier:(id)a3 categoryIndex:(unint64_t)a4;
- (id)shapeAtIndex:(unint64_t)a3 categoryIndex:(unint64_t)a4;
- (id)shapeWithIdentifier:(id)a3 categoryIndex:(unint64_t)a4;
- (unint64_t)numberOfShapesInCategoryAtIndex:(unint64_t)a3;
- (unint64_t)p_numberOfCategories;
- (unint64_t)p_numberOfNonUserDefinedCategories;
- (void)setP_basicShapeLibraryCollection:(id)a3;
- (void)setP_shapeLibrary:(id)a3;
- (void)setShowConnectionLinesInLibrary:(BOOL)a3;
- (void)setShowLinesInLibrary:(BOOL)a3;
@end

@implementation CRLShapeCollectionDataSource

- (CRLShapeCollectionDataSource)initWithShapeLibrary:(id)a3 basicShapeLibrary:(id)a4
{
  id v7 = a3;
  v8 = [(CRLShapeCollectionDataSource *)self initWithBasicShapeLibrary:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_shapeLibrary, a3);
  }

  return v9;
}

- (CRLShapeCollectionDataSource)initWithBasicShapeLibrary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLShapeCollectionDataSource;
  v5 = [(CRLShapeCollectionDataSource *)&v9 init];
  if (v5)
  {
    v6 = [[CRLBasicShapeLibraryCollection alloc] initWithBasicShapeLibrary:v4];
    basicShapeLibraryCollection = v5->_basicShapeLibraryCollection;
    v5->_basicShapeLibraryCollection = v6;
  }
  return v5;
}

- (NSArray)categoryNames
{
  unint64_t v3 = [(CRLShapeCollectionDataSource *)self p_numberOfCategories];
  id v4 = +[NSMutableArray arrayWithCapacity:v3];
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      v6 = [(CRLShapeCollectionDataSource *)self p_shapeCollectionAtIndex:i];
      id v7 = [v6 name];

      [v4 addObject:v7];
    }
  }

  return (NSArray *)v4;
}

- (BOOL)hasUserDefinedShapesInCategoryAtIndex:(unint64_t)a3
{
  BOOL v5 = [(CRLShapeCollectionDataSource *)self p_hasUserDefinedShapes];
  if (v5) {
    LOBYTE(v5) = [(CRLShapeCollectionDataSource *)self indexOfUserDefinedLibraryCategory] == a3;
  }
  return v5;
}

- (unint64_t)numberOfShapesInCategoryAtIndex:(unint64_t)a3
{
  unint64_t v3 = [(CRLShapeCollectionDataSource *)self p_shapeCollectionAtIndex:a3];
  id v4 = [v3 numberOfShapes];

  return (unint64_t)v4;
}

- (id)shapeAtIndex:(unint64_t)a3 categoryIndex:(unint64_t)a4
{
  return [(CRLShapeCollectionDataSource *)self p_shapeAtIndex:a3 categoryIndex:a4];
}

- (id)shapeWithIdentifier:(id)a3 categoryIndex:(unint64_t)a4
{
  return [(CRLShapeCollectionDataSource *)self p_shapeWithIdentifier:a3 categoryIndex:a4];
}

- (void)setShowConnectionLinesInLibrary:(BOOL)a3
{
}

- (BOOL)showConnectionLinesInLibrary
{
  return [(CRLBasicShapeLibraryCollection *)self->_basicShapeLibraryCollection showConnectionLinesInLibrary];
}

- (void)setShowLinesInLibrary:(BOOL)a3
{
}

- (BOOL)showLinesInLibrary
{
  return [(CRLBasicShapeLibraryCollection *)self->_basicShapeLibraryCollection showLinesInLibrary];
}

+ (unint64_t)p_firstIndexOfShapeLibraryCategories
{
  return 1;
}

- (unint64_t)p_numberOfNonUserDefinedCategories
{
  v2 = [(CRLShapeCollectionDataSource *)self p_shapeLibrary];
  unint64_t v3 = [v2 categories];
  id v4 = (char *)[v3 count] + 1;

  return (unint64_t)v4;
}

- (unint64_t)p_numberOfCategories
{
  unint64_t v3 = [(CRLShapeCollectionDataSource *)self p_hasUserDefinedShapes];
  id v4 = [(CRLShapeCollectionDataSource *)self p_shapeLibrary];
  if (v4) {
    v3 += [(CRLShapeCollectionDataSource *)self p_numberOfNonUserDefinedCategories];
  }

  return v3;
}

- (id)p_shapeCollectionAtIndex:(unint64_t)a3
{
  if (!a3)
  {
    objc_super v9 = [(CRLShapeCollectionDataSource *)self p_basicShapeLibraryCollection];
    goto LABEL_16;
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFD50);
    }
    BOOL v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A1B94(v4, v5);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFD70);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v6, v4);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeCollectionDataSource p_shapeCollectionAtIndex:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeCollectionDataSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:122 isFatal:0 description:"Attempting to find a shape collection at an invalid index (NSNotFound)."];
  }
  else if (self->_shapeLibrary)
  {
    unint64_t v10 = a3
        - +[CRLShapeCollectionDataSource p_firstIndexOfShapeLibraryCategories];
    v11 = [CRLShapeLibraryCollection alloc];
    v12 = [(CRLShapeCollectionDataSource *)self p_shapeLibrary];
    objc_super v9 = [(CRLShapeLibraryCollection *)v11 initWithShapeLibrary:v12 categoryIndex:v10];

    goto LABEL_16;
  }
  objc_super v9 = 0;
LABEL_16:

  return v9;
}

- (id)p_shapeAtIndex:(unint64_t)a3 categoryIndex:(unint64_t)a4
{
  BOOL v5 = [(CRLShapeCollectionDataSource *)self p_shapeCollectionAtIndex:a4];
  v6 = [v5 shapeAtIndex:a3];

  return v6;
}

- (id)p_shapeWithIdentifier:(id)a3 categoryIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(CRLShapeCollectionDataSource *)self p_shapeCollectionAtIndex:a4];
  v8 = [v7 shapeWithIdentifier:v6];

  return v8;
}

- (BOOL)p_hasUserDefinedShapes
{
  return 0;
}

- (CRLBasicShapeLibraryCollection)p_basicShapeLibraryCollection
{
  return self->_basicShapeLibraryCollection;
}

- (void)setP_basicShapeLibraryCollection:(id)a3
{
}

- (CRLShapeLibrary)p_shapeLibrary
{
  return self->_shapeLibrary;
}

- (void)setP_shapeLibrary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeLibrary, 0);

  objc_storeStrong((id *)&self->_basicShapeLibraryCollection, 0);
}

@end