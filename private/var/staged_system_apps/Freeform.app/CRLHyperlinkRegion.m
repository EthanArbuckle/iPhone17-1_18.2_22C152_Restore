@interface CRLHyperlinkRegion
+ (id)hyperlinkRegionWithURL:(id)a3 bezierPath:(id)a4;
- (BOOL)isEqual:(id)a3;
- (CRLBezierPath)bezierPath;
- (CRLHyperlinkRegion)initWithURL:(id)a3 bezierPath:(id)a4;
- (NSURL)URL;
- (id)description;
- (unint64_t)hash;
@end

@implementation CRLHyperlinkRegion

+ (id)hyperlinkRegionWithURL:(id)a3 bezierPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithURL:v7 bezierPath:v6];

  return v8;
}

- (CRLHyperlinkRegion)initWithURL:(id)a3 bezierPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_22;
    }
    goto LABEL_13;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E9F10);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010985AC();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E9F30);
  }
  v9 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010668E0(v9);
  }
  v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLHyperlinkRegion initWithURL:bezierPath:]");
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLHyperlinkRegion.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 29, 0, "Invalid parameter not satisfying: %{public}s", "aURL != nil");

  if (!v8)
  {
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9F50);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010984FC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9F70);
    }
    v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v12);
    }
    v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLHyperlinkRegion initWithURL:bezierPath:]");
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLHyperlinkRegion.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 30, 0, "Invalid parameter not satisfying: %{public}s", "aBezierPath != nil");
  }
LABEL_22:
  v21.receiver = self;
  v21.super_class = (Class)CRLHyperlinkRegion;
  v15 = [(CRLHyperlinkRegion *)&v21 init];
  if (v15)
  {
    v16 = (NSURL *)[v6 copy];
    URL = v15->_URL;
    v15->_URL = v16;

    v18 = (CRLBezierPath *)[v8 copy];
    bezierPath = v15->_bezierPath;
    v15->_bezierPath = v18;
  }
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = sub_1002469D0(v5, v4);

  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v7 = [(CRLHyperlinkRegion *)self URL];
  uint64_t v8 = [v6 URL];
  if (!(v7 | v8)
    || (v9 = (void *)v8,
        unsigned int v10 = [(id)v7 isEqual:v8],
        v9,
        (id)v7,
        v10))
  {
    v11 = [(CRLHyperlinkRegion *)self bezierPath];
    v12 = [v6 bezierPath];
    unsigned __int8 v13 = [v11 isEqual:v12];
  }
  else
  {
LABEL_5:
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  v2 = [(CRLHyperlinkRegion *)self URL];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)description
{
  URL = self->_URL;
  [(CRLBezierPath *)self->_bezierPath bounds];
  id v3 = NSStringFromCGRect(v7);
  id v4 = +[NSString stringWithFormat:@"URL={%@} bounds=%@", URL, v3];

  return v4;
}

- (NSURL)URL
{
  return self->_URL;
}

- (CRLBezierPath)bezierPath
{
  return self->_bezierPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bezierPath, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

@end