@interface CRLBasicShapeLibraryCollection
- (BOOL)showConnectionLinesInLibrary;
- (BOOL)showLinesInLibrary;
- (CRLBasicShapeLibrary)p_basicShapeLibrary;
- (CRLBasicShapeLibraryCollection)initWithBasicShapeLibrary:(id)a3;
- (NSString)name;
- (id)shapeAtIndex:(unint64_t)a3;
- (id)shapeWithIdentifier:(id)a3;
- (unint64_t)numberOfShapes;
- (void)setP_basicShapeLibrary:(id)a3;
- (void)setShowConnectionLinesInLibrary:(BOOL)a3;
- (void)setShowLinesInLibrary:(BOOL)a3;
@end

@implementation CRLBasicShapeLibraryCollection

- (CRLBasicShapeLibraryCollection)initWithBasicShapeLibrary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLBasicShapeLibraryCollection;
  v6 = [(CRLBasicShapeLibraryCollection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_basicShapeLibrary, a3);
  }

  return v7;
}

- (NSString)name
{
  v2 = [(CRLBasicShapeLibraryCollection *)self p_basicShapeLibrary];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (unint64_t)numberOfShapes
{
  v2 = [(CRLBasicShapeLibraryCollection *)self p_basicShapeLibrary];
  id v3 = [v2 numberOfBasicShapes];

  return (unint64_t)v3;
}

- (id)shapeAtIndex:(unint64_t)a3
{
  v4 = [(CRLBasicShapeLibraryCollection *)self p_basicShapeLibrary];
  id v5 = [v4 basicShapeAtIndex:a3];

  return v5;
}

- (id)shapeWithIdentifier:(id)a3
{
  int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DF240);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10108638C(v3, v4);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DF260);
  }
  id v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101066770(v5, v3);
  }
  v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBasicShapeLibraryCollection shapeWithIdentifier:]");
  v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBasicShapeLibraryCollection.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 50, 0, "-[CRLBasicShapeLibraryCollection shapeWithIdentifier:] should not be called because CRLBasicShapeLibraryCollection has no editable shapes");

  return 0;
}

- (void)setShowConnectionLinesInLibrary:(BOOL)a3
{
}

- (BOOL)showConnectionLinesInLibrary
{
  return [(CRLBasicShapeLibrary *)self->_basicShapeLibrary showConnectionLinesInLibrary];
}

- (void)setShowLinesInLibrary:(BOOL)a3
{
}

- (BOOL)showLinesInLibrary
{
  return [(CRLBasicShapeLibrary *)self->_basicShapeLibrary showLinesInLibrary];
}

- (CRLBasicShapeLibrary)p_basicShapeLibrary
{
  return self->_basicShapeLibrary;
}

- (void)setP_basicShapeLibrary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end