@interface CRLShapeLibraryCollection
- (CRLShapeLibrary)p_shapeLibrary;
- (CRLShapeLibraryCollection)initWithShapeLibrary:(id)a3 categoryIndex:(unint64_t)a4;
- (NSString)name;
- (id)p_category;
- (id)shapeAtIndex:(unint64_t)a3;
- (id)shapeWithIdentifier:(id)a3;
- (unint64_t)numberOfShapes;
- (unint64_t)p_categoryIndex;
- (void)setP_categoryIndex:(unint64_t)a3;
- (void)setP_shapeLibrary:(id)a3;
@end

@implementation CRLShapeLibraryCollection

- (CRLShapeLibraryCollection)initWithShapeLibrary:(id)a3 categoryIndex:(unint64_t)a4
{
  id v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRLShapeLibraryCollection;
  v8 = [(CRLShapeLibraryCollection *)&v21 init];
  if (v8)
  {
    v9 = [v7 categories];
    id v10 = [v9 count];

    if ((unint64_t)v10 <= a4)
    {
      unsigned int v11 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D6388);
      }
      v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        v18 = v12;
        v19 = [v7 categories];
        id v20 = [v19 count];
        *(_DWORD *)buf = 67110402;
        unsigned int v23 = v11;
        __int16 v24 = 2082;
        v25 = "-[CRLShapeLibraryCollection initWithShapeLibrary:categoryIndex:]";
        __int16 v26 = 2082;
        v27 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibraryCollection.m";
        __int16 v28 = 1024;
        int v29 = 33;
        __int16 v30 = 2048;
        unint64_t v31 = a4;
        __int16 v32 = 2048;
        id v33 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Tried to initialize CRLShapeLibraryCollection with a category index (%lu) beyond the bounds of the shape library's categories (%lu).", buf, 0x36u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D63A8);
      }
      v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v13);
      }
      v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibraryCollection initWithShapeLibrary:categoryIndex:]");
      v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibraryCollection.m"];
      v16 = [v7 categories];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 33, 0, "Tried to initialize CRLShapeLibraryCollection with a category index (%lu) beyond the bounds of the shape library's categories (%lu).", a4, [v16 count]);
    }
    v8->_categoryIndex = a4;
    objc_storeStrong((id *)&v8->_shapeLibrary, a3);
  }

  return v8;
}

- (NSString)name
{
  v2 = [(CRLShapeLibraryCollection *)self p_category];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (unint64_t)numberOfShapes
{
  v2 = [(CRLShapeLibraryCollection *)self p_category];
  v3 = [v2 shapeIDs];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (id)shapeAtIndex:(unint64_t)a3
{
  if ([(CRLShapeLibraryCollection *)self numberOfShapes] <= a3)
  {
    if ([(CRLShapeLibraryCollection *)self numberOfShapes])
    {
      unsigned int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D63C8);
      }
      unsigned int v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        v16 = v11;
        *(_DWORD *)buf = 67110402;
        unsigned int v18 = v10;
        __int16 v19 = 2082;
        id v20 = "-[CRLShapeLibraryCollection shapeAtIndex:]";
        __int16 v21 = 2082;
        v22 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibraryCollection.m";
        __int16 v23 = 1024;
        int v24 = 56;
        __int16 v25 = 2048;
        unint64_t v26 = a3;
        __int16 v27 = 2048;
        unint64_t v28 = [(CRLShapeLibraryCollection *)self p_categoryIndex];
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Tried to retrieve a shape at an index (%lu) beyond the size of the number of shapes in this category: %lu", buf, 0x36u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D63E8);
      }
      v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v12);
      }
      v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibraryCollection shapeAtIndex:]");
      v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibraryCollection.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 56, 0, "Tried to retrieve a shape at an index (%lu) beyond the size of the number of shapes in this category: %lu", a3, [(CRLShapeLibraryCollection *)self p_categoryIndex]);
    }
    v9 = 0;
  }
  else
  {
    v5 = [(CRLShapeLibraryCollection *)self p_category];
    v6 = [v5 shapeIDs];
    id v7 = [v6 objectAtIndexedSubscript:a3];

    v8 = [(CRLShapeLibraryCollection *)self p_shapeLibrary];
    v9 = [v8 shapeWithID:v7];
  }

  return v9;
}

- (id)shapeWithIdentifier:(id)a3
{
  int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D6408);
  }
  id v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101079CEC(v3, v4);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D6428);
  }
  v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010668E0(v5);
  }
  v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibraryCollection shapeWithIdentifier:]");
  id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibraryCollection.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 62, 0, "-[CRLShapeLibraryCollection shapeWithIdentifier:] should not be called because CRLShapeLibraryCollection has no editable shapes");

  return 0;
}

- (id)p_category
{
  int v3 = [(CRLShapeLibraryCollection *)self p_shapeLibrary];
  id v4 = [v3 categories];
  v5 = [v4 objectAtIndexedSubscript:[self p_categoryIndex]];

  return v5;
}

- (unint64_t)p_categoryIndex
{
  return self->_categoryIndex;
}

- (void)setP_categoryIndex:(unint64_t)a3
{
  self->_categoryIndex = a3;
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
}

@end