@interface CRLPdfTaggerParagraphLevelResolver
- (BOOL)paragraphInfo:(id)a3 matchesParagraphInfo:(id)a4 level:(int)a5;
- (CRLPdfTagger)tagger;
- (CRLPdfTaggerParagraphLevelResolver)initWithTagger:(id)a3;
- (int)levelOfCurrentParagraph:(id *)a3;
- (int)tagType;
@end

@implementation CRLPdfTaggerParagraphLevelResolver

- (CRLPdfTaggerParagraphLevelResolver)initWithTagger:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLPdfTaggerParagraphLevelResolver;
  v5 = [(CRLPdfTaggerParagraphLevelResolver *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_tagger, v4);
  }

  return v6;
}

- (int)tagType
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FC8D8);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
  {
    id v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 67110146;
    unsigned int v17 = v2;
    __int16 v18 = 2082;
    v19 = "-[CRLPdfTaggerParagraphLevelResolver tagType]";
    __int16 v20 = 2082;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPdfTagger.mm";
    __int16 v22 = 1024;
    int v23 = 605;
    __int16 v24 = 2114;
    v25 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FC8F8);
  }
  v6 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
  {
    v7 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v17 = v2;
    __int16 v18 = 2114;
    v19 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  objc_super v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPdfTaggerParagraphLevelResolver tagType]");
  v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPdfTagger.mm"];
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 605, 0, "Abstract method not overridden by %{public}@", v11);

  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v13, "-[CRLPdfTaggerParagraphLevelResolver tagType]");
  id v15 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v14 userInfo:0];

  objc_exception_throw(v15);
}

- (int)levelOfCurrentParagraph:(id *)a3
{
  unsigned int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FC918);
  }
  id v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v18 = v3;
    __int16 v19 = 2082;
    __int16 v20 = "-[CRLPdfTaggerParagraphLevelResolver levelOfCurrentParagraph:]";
    __int16 v21 = 2082;
    __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPdfTagger.mm";
    __int16 v23 = 1024;
    int v24 = 610;
    __int16 v25 = 2114;
    v26 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FC938);
  }
  v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
  {
    objc_super v8 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v18 = v3;
    __int16 v19 = 2114;
    __int16 v20 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPdfTaggerParagraphLevelResolver levelOfCurrentParagraph:]");
  v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPdfTagger.mm"];
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 610, 0, "Abstract method not overridden by %{public}@", v12);

  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v14, "-[CRLPdfTaggerParagraphLevelResolver levelOfCurrentParagraph:]");
  id v16 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

- (BOOL)paragraphInfo:(id)a3 matchesParagraphInfo:(id)a4 level:(int)a5
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FC958);
  }
  v9 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
  {
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 67110146;
    unsigned int v23 = v8;
    __int16 v24 = 2082;
    __int16 v25 = "-[CRLPdfTaggerParagraphLevelResolver paragraphInfo:matchesParagraphInfo:level:]";
    __int16 v26 = 2082;
    v27 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPdfTagger.mm";
    __int16 v28 = 1024;
    int v29 = 615;
    __int16 v30 = 2114;
    v31 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FC978);
  }
  v12 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
  {
    v13 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v23 = v8;
    __int16 v24 = 2114;
    __int16 v25 = v13;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPdfTaggerParagraphLevelResolver paragraphInfo:matchesParagraphInfo:level:]");
  id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPdfTagger.mm"];
  id v16 = (objc_class *)objc_opt_class();
  unsigned int v17 = NSStringFromClass(v16);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 615, 0, "Abstract method not overridden by %{public}@", v17);

  unsigned int v18 = (objc_class *)objc_opt_class();
  __int16 v19 = NSStringFromClass(v18);
  __int16 v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v19, "-[CRLPdfTaggerParagraphLevelResolver paragraphInfo:matchesParagraphInfo:level:]");
  id v21 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v20 userInfo:0];

  objc_exception_throw(v21);
}

- (CRLPdfTagger)tagger
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tagger);

  return (CRLPdfTagger *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end