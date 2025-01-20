@interface CRLWPAdornmentRect
- (CGRect)rect;
- (CRLBezierPath)path;
- (CRLFill)fill;
- (CRLShadow)shadow;
- (CRLStroke)stroke;
- (CRLWPAdornmentRect)initWithCharacterFill:(id)a3 rect:(CGRect)a4 range:(_NSRange)a5 paths:(id)a6 rubyPaths:(id)a7;
- (CRLWPAdornmentRect)initWithCharacterFillAdornmentState:(id)a3;
- (CRLWPAdornmentRect)initWithCharacterStroke:(id)a3 rect:(CGRect)a4 range:(_NSRange)a5 paths:(id)a6 rubyPaths:(id)a7;
- (CRLWPAdornmentRect)initWithCharacterStrokeAdornmentState:(id)a3;
- (CRLWPAdornmentRect)initWithRect:(CGRect)a3 fill:(id)a4;
- (CRLWPAdornmentRect)initWithRect:(CGRect)a3 stroke:(id)a4;
- (CRLWPAdornmentRect)initWithRect:(CGRect)a3 stroke:(id)a4 fill:(id)a5 type:(int)a6;
- (CRLWPAdornmentRect)initWithRect:(CGRect)a3 stroke:(id)a4 fill:(id)a5 type:(int)a6 range:(_NSRange)a7 paths:(id)a8 rubyPaths:(id)a9;
- (CRLWPAdornmentRect)initWithRect:(CGRect)a3 stroke:(id)a4 fill:(id)a5 type:(int)a6 range:(_NSRange)a7 paths:(id)a8 rubyPaths:(id)a9 shadow:(id)a10;
- (TSUSparseArray)paths;
- (TSUSparseArray)rubyPaths;
- (_NSRange)range;
- (id)pathFromExcludeRange:(_NSRange)a3 limitSelection:(id)a4 rubyGlyphRange:(_NSRange)a5;
- (int)type;
- (void)setShadow:(id)a3;
@end

@implementation CRLWPAdornmentRect

- (CRLWPAdornmentRect)initWithRect:(CGRect)a3 stroke:(id)a4 fill:(id)a5 type:(int)a6 range:(_NSRange)a7 paths:(id)a8 rubyPaths:(id)a9 shadow:(id)a10
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v43 = a4;
  id v21 = a5;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  v44.receiver = self;
  v44.super_class = (Class)CRLWPAdornmentRect;
  v25 = [(CRLWPAdornmentRect *)&v44 init];
  v26 = v25;
  if (v25)
  {
    v25->_rect.origin.CGFloat x = x;
    v25->_rect.origin.CGFloat y = y;
    v25->_rect.size.CGFloat width = width;
    v25->_rect.size.CGFloat height = height;
    objc_storeStrong((id *)&v25->_stroke, a4);
    objc_storeStrong((id *)&v26->_fill, a5);
    v26->_type = a6;
    v26->_range.NSUInteger location = location;
    v26->_range.NSUInteger length = length;
    v27 = (TSUSparseArray *)[v22 copy];
    paths = v26->_paths;
    v26->_paths = v27;

    if ([(TSUSparseArray *)v26->_paths count]
      && [(TSUSparseArray *)v26->_paths count] > v26->_range.length)
    {
      unsigned int v29 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E07A0);
      }
      v30 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        v42 = v26->_paths;
        v39 = v30;
        id v40 = [(TSUSparseArray *)v42 count];
        NSUInteger v41 = v26->_range.length;
        *(_DWORD *)buf = 67110402;
        unsigned int v46 = v29;
        __int16 v47 = 2082;
        v48 = "-[CRLWPAdornmentRect initWithRect:stroke:fill:type:range:paths:rubyPaths:shadow:]";
        __int16 v49 = 2082;
        v50 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPAdornmentRect.m";
        __int16 v51 = 1024;
        int v52 = 31;
        __int16 v53 = 2048;
        id v54 = v40;
        __int16 v55 = 2048;
        NSUInteger v56 = v41;
        _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Should have no more than one path per glyph. %lu paths for range %lu", buf, 0x36u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E07C0);
      }
      v31 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v31);
      }
      v32 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPAdornmentRect initWithRect:stroke:fill:type:range:paths:rubyPaths:shadow:]");
      v33 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPAdornmentRect.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v32, v33, 31, 0, "Should have no more than one path per glyph. %lu paths for range %lu", [(TSUSparseArray *)v26->_paths count], v26->_range.length);
    }
    v34 = (TSUSparseArray *)[v23 copy];
    rubyPaths = v26->_rubyPaths;
    v26->_rubyPaths = v34;

    v36 = (CRLShadow *)[v24 copy];
    shadow = v26->_shadow;
    v26->_shadow = v36;
  }
  return v26;
}

- (CRLWPAdornmentRect)initWithRect:(CGRect)a3 stroke:(id)a4 fill:(id)a5 type:(int)a6 range:(_NSRange)a7 paths:(id)a8 rubyPaths:(id)a9
{
  return -[CRLWPAdornmentRect initWithRect:stroke:fill:type:range:paths:rubyPaths:shadow:](self, "initWithRect:stroke:fill:type:range:paths:rubyPaths:shadow:", a4, a5, *(void *)&a6, a7.location, a7.length, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a9, 0);
}

- (CRLWPAdornmentRect)initWithRect:(CGRect)a3 stroke:(id)a4 fill:(id)a5 type:(int)a6
{
  return -[CRLWPAdornmentRect initWithRect:stroke:fill:type:range:paths:rubyPaths:](self, "initWithRect:stroke:fill:type:range:paths:rubyPaths:", a4, a5, *(void *)&a6, 0x7FFFFFFFFFFFFFFFLL, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0);
}

- (CRLWPAdornmentRect)initWithRect:(CGRect)a3 stroke:(id)a4
{
  return -[CRLWPAdornmentRect initWithRect:stroke:fill:type:](self, "initWithRect:stroke:fill:type:", a4, 0, 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CRLWPAdornmentRect)initWithRect:(CGRect)a3 fill:(id)a4
{
  return -[CRLWPAdornmentRect initWithRect:stroke:fill:type:](self, "initWithRect:stroke:fill:type:", 0, a4, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CRLWPAdornmentRect)initWithCharacterFill:(id)a3 rect:(CGRect)a4 range:(_NSRange)a5 paths:(id)a6 rubyPaths:(id)a7
{
  return -[CRLWPAdornmentRect initWithRect:stroke:fill:type:range:paths:rubyPaths:](self, "initWithRect:stroke:fill:type:range:paths:rubyPaths:", 0, a3, 4, a5.location, a5.length, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a7);
}

- (CRLWPAdornmentRect)initWithCharacterStroke:(id)a3 rect:(CGRect)a4 range:(_NSRange)a5 paths:(id)a6 rubyPaths:(id)a7
{
  return -[CRLWPAdornmentRect initWithRect:stroke:fill:type:range:paths:rubyPaths:](self, "initWithRect:stroke:fill:type:range:paths:rubyPaths:", a3, 0, 5, a5.location, a5.length, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a7);
}

- (CRLWPAdornmentRect)initWithCharacterFillAdornmentState:(id)a3
{
  id v4 = a3;
  [v4 currentFillRect];
  if (!sub_100065AF4(v5, v6, v7, v8))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E07E0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010887E4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0800);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v9);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPAdornmentRect initWithCharacterFillAdornmentState:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPAdornmentRect.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:65 isFatal:0 description:"Attempted to create an adornment with a non-finite rect"];
  }
  [v4 currentFillRect];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [v4 currentAdornmentFill];
  id v21 = [v4 currentFillRange];
  uint64_t v23 = v22;
  id v24 = [v4 currentFillPaths];
  v25 = [v4 currentRubyFillPaths];
  v26 = [v4 currentFillShadow];

  v27 = -[CRLWPAdornmentRect initWithRect:stroke:fill:type:range:paths:rubyPaths:shadow:](self, "initWithRect:stroke:fill:type:range:paths:rubyPaths:shadow:", 0, v20, 4, v21, v23, v24, v13, v15, v17, v19, v25, v26);
  return v27;
}

- (CRLWPAdornmentRect)initWithCharacterStrokeAdornmentState:(id)a3
{
  id v4 = a3;
  [v4 currentStrokeRect];
  if (!sub_100065AF4(v5, v6, v7, v8))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0820);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101088878();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0840);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v9);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPAdornmentRect initWithCharacterStrokeAdornmentState:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPAdornmentRect.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:77 isFatal:0 description:"Attempted to create an adornment with a non-finite rect"];
  }
  [v4 currentStrokeRect];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [v4 currentAdornmentStroke];
  id v21 = [v4 currentStrokeRange];
  uint64_t v23 = v22;
  id v24 = [v4 currentStrokePaths];
  v25 = [v4 currentRubyStrokePaths];
  v26 = [v4 currentStrokeShadow];

  v27 = -[CRLWPAdornmentRect initWithRect:stroke:fill:type:range:paths:rubyPaths:shadow:](self, "initWithRect:stroke:fill:type:range:paths:rubyPaths:shadow:", v20, 0, 5, v21, v23, v24, v13, v15, v17, v19, v25, v26);
  return v27;
}

- (CRLBezierPath)path
{
  v3 = +[CRLBezierPath bezierPath];
  id v4 = [(CRLWPAdornmentRect *)self paths];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001DD994;
  v17[3] = &unk_1014E0868;
  id v5 = v3;
  id v18 = v5;
  [v4 foreach:v17];

  double v6 = [(CRLWPAdornmentRect *)self rubyPaths];
  double v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  double v14 = sub_1001DD9A0;
  double v15 = &unk_1014E0868;
  id v7 = v5;
  id v16 = v7;
  [v6 foreach:&v12];

  if (objc_msgSend(v7, "isEmpty", v12, v13, v14, v15)) {
    id v8 = 0;
  }
  else {
    id v8 = v7;
  }
  v9 = v16;
  v10 = (CRLBezierPath *)v8;

  return v10;
}

- (id)pathFromExcludeRange:(_NSRange)a3 limitSelection:(id)a4 rubyGlyphRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v7 = a3.length;
  NSUInteger v8 = a3.location;
  id v10 = a4;
  v11 = +[CRLBezierPath bezierPath];
  double v12 = [(CRLWPAdornmentRect *)self paths];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1001DDB6C;
  v32[3] = &unk_1014E0890;
  NSUInteger v35 = v8;
  NSUInteger v36 = v7;
  id v13 = v10;
  id v33 = v13;
  id v14 = v11;
  id v34 = v14;
  [v12 foreach:v32];

  double v15 = [(CRLWPAdornmentRect *)self rubyPaths];
  uint64_t v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  id v24 = sub_1001DDC24;
  v25 = &unk_1014E08B8;
  NSUInteger v28 = v8;
  NSUInteger v29 = v7;
  id v26 = v13;
  NSUInteger v30 = location;
  NSUInteger v31 = length;
  id v16 = v14;
  id v27 = v16;
  id v17 = v13;
  [v15 foreach:&v22];

  if (objc_msgSend(v16, "isEmpty", v22, v23, v24, v25)) {
    id v18 = 0;
  }
  else {
    id v18 = v16;
  }
  double v19 = v27;
  id v20 = v18;

  return v20;
}

- (int)type
{
  return self->_type;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CRLStroke)stroke
{
  return self->_stroke;
}

- (CRLFill)fill
{
  return self->_fill;
}

- (CRLShadow)shadow
{
  return self->_shadow;
}

- (void)setShadow:(id)a3
{
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (TSUSparseArray)paths
{
  return self->_paths;
}

- (TSUSparseArray)rubyPaths
{
  return self->_rubyPaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rubyPaths, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_fill, 0);

  objc_storeStrong((id *)&self->_stroke, 0);
}

@end