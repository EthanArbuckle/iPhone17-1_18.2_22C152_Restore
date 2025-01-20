@interface CRLWPSearch
- (BOOL)isComplete;
- (CRLSearchCanvasDelegate)searchCanvasDelegate;
- (CRLWPSearch)initWithString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5 storage:(id)a6 range:(_NSRange)a7 searchCanvasDelegate:(id)a8;
- (NSString)searchedString;
- (_NSRange)range;
- (_TtC8Freeform12CRLWPStorage)storage;
- (unint64_t)storageChangeCount;
- (void)foundHitWithRange:(_NSRange)a3;
- (void)setRange:(_NSRange)a3;
@end

@implementation CRLWPSearch

- (CRLWPSearch)initWithString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5 storage:(id)a6 range:(_NSRange)a7 searchCanvasDelegate:(id)a8
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if (v14)
  {
    if (v16) {
      goto LABEL_22;
    }
    goto LABEL_13;
  }
  NSUInteger v29 = location;
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  NSUInteger v31 = length;
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DC730);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010818E8();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DC750);
  }
  v18 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010668E0(v18);
  }
  v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSearch initWithString:options:hitBlock:storage:range:searchCanvasDelegate:]");
  v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSearch.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 26, 0, "invalid nil value for '%{public}s'", "string");

  NSUInteger location = v29;
  NSUInteger length = v31;
  if (!v16)
  {
LABEL_13:
    NSUInteger v30 = location;
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DC770);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101081838();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DC790);
    }
    v21 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v21);
    }
    v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSearch initWithString:options:hitBlock:storage:range:searchCanvasDelegate:]");
    v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSearch.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 27, 0, "invalid nil value for '%{public}s'", "storage");

    NSUInteger location = v30;
  }
LABEL_22:
  v32.receiver = self;
  v32.super_class = (Class)CRLWPSearch;
  v24 = [(CRLSearch *)&v32 initWithString:v14 options:a4 hitBlock:v15];
  v25 = v24;
  if (v24)
  {
    v24->_range.NSUInteger location = location;
    v24->_range.NSUInteger length = length;
    objc_storeWeak((id *)&v24->_storage, v16);
    v25->_storageChangeCount = (unint64_t)[v16 changeCount];
    objc_storeStrong((id *)&v25->_searchCanvasDelegate, a8);
    uint64_t v26 = [v16 string];
    searchedString = v25->_searchedString;
    v25->_searchedString = (NSString *)v26;
  }
  return v25;
}

- (BOOL)isComplete
{
  [(CRLWPSearch *)self range];
  return v2 == 0;
}

- (void)foundHitWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v6 = [(CRLWPSearch *)self searchCanvasDelegate];
  if (objc_opt_respondsToSelector())
  {
    v7 = [(CRLWPSearch *)self searchCanvasDelegate];
    v8 = [(CRLWPSearch *)self storage];
    id v9 = [v7 wpSelectionClassForStorage:v8];
  }
  else
  {
    id v9 = (id)objc_opt_class();
  }

  id v14 = [(CRLSearch *)self hitBlock];
  v10 = [(CRLWPSearch *)self storage];
  v11 = [v9 selectionWithRange:location, length];
  v12 = [(CRLWPSearch *)self searchCanvasDelegate];
  v13 = +[CRLWPSearchReference searchReferenceWithStorage:v10 selection:v11 searchCanvasDelegate:v12];
  v14[2](v14, v13);
}

- (_NSRange)range
{
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  NSUInteger length = p_range->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSString)searchedString
{
  return self->_searchedString;
}

- (unint64_t)storageChangeCount
{
  return self->_storageChangeCount;
}

- (_TtC8Freeform12CRLWPStorage)storage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storage);

  return (_TtC8Freeform12CRLWPStorage *)WeakRetained;
}

- (CRLSearchCanvasDelegate)searchCanvasDelegate
{
  return self->_searchCanvasDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchCanvasDelegate, 0);
  objc_destroyWeak((id *)&self->_storage);

  objc_storeStrong((id *)&self->_searchedString, 0);
}

@end