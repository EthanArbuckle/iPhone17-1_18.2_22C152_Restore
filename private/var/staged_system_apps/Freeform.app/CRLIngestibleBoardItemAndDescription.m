@interface CRLIngestibleBoardItemAndDescription
+ (CRLIngestibleBoardItemAndDescription)ingestibleBoardItemAndDescriptionWithBoardItem:(id)a3 description:(id)a4;
+ (CRLIngestibleBoardItemAndDescription)ingestibleBoardItemAndDescriptionWithBoardItems:(id)a3 descriptions:(id)a4;
- (CRLIngestibleBoardItemAndDescription)init;
- (CRLIngestibleBoardItemAndDescription)initWithBoardItem:(id)a3 description:(id)a4;
- (NSDictionary)ingestibleDescription;
- (_TtC8Freeform12CRLBoardItem)boardItem;
@end

@implementation CRLIngestibleBoardItemAndDescription

+ (CRLIngestibleBoardItemAndDescription)ingestibleBoardItemAndDescriptionWithBoardItem:(id)a3 description:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithBoardItem:v7 description:v6];

  return (CRLIngestibleBoardItemAndDescription *)v8;
}

+ (CRLIngestibleBoardItemAndDescription)ingestibleBoardItemAndDescriptionWithBoardItems:(id)a3 descriptions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 count];
  if (v7 != [v6 count])
  {
    int v8 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DC0B8);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      v19 = v9;
      *(_DWORD *)buf = 67110402;
      int v21 = v8;
      __int16 v22 = 2082;
      v23 = "+[CRLIngestibleBoardItemAndDescription ingestibleBoardItemAndDescriptionWithBoardItems:descriptions:]";
      __int16 v24 = 2082;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLIngestibleBoardItemAndDescription.m";
      __int16 v26 = 1024;
      int v27 = 27;
      __int16 v28 = 2048;
      id v29 = [v5 count];
      __int16 v30 = 2048;
      id v31 = [v6 count];
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Must provide the same number of drawables (%lu) and descriptions (%lu).", buf, 0x36u);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DC0D8);
    }
    v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v10, v8);
    }
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLIngestibleBoardItemAndDescription ingestibleBoardItemAndDescriptionWithBoardItems:descriptions:]");
    v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLIngestibleBoardItemAndDescription.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 27, 0, "Must provide the same number of drawables (%lu) and descriptions (%lu).", [v5 count], [v6 count]);
  }
  v13 = +[NSMutableArray array];
  if ([v5 count])
  {
    unint64_t v14 = 0;
    do
    {
      v15 = [v5 objectAtIndexedSubscript:v14];
      v16 = [v6 objectAtIndexedSubscript:v14];
      v17 = +[CRLIngestibleBoardItemAndDescription ingestibleBoardItemAndDescriptionWithBoardItem:v15 description:v16];

      [v13 addObject:v17];
      ++v14;
    }
    while (v14 < (unint64_t)[v5 count]);
  }

  return (CRLIngestibleBoardItemAndDescription *)v13;
}

- (CRLIngestibleBoardItemAndDescription)initWithBoardItem:(id)a3 description:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLIngestibleBoardItemAndDescription;
  v9 = [(CRLIngestibleBoardItemAndDescription *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_boardItem, a3);
    objc_storeStrong((id *)&v10->_ingestibleDescription, a4);
  }

  return v10;
}

- (CRLIngestibleBoardItemAndDescription)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DC0F8);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    unint64_t v14 = "-[CRLIngestibleBoardItemAndDescription init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLIngestibleBoardItemAndDescription.m";
    __int16 v17 = 1024;
    int v18 = 46;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DC118);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v5 = v4;
    id v6 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v12 = v2;
    __int16 v13 = 2114;
    unint64_t v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLIngestibleBoardItemAndDescription init]");
  id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLIngestibleBoardItemAndDescription.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:46 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLIngestibleBoardItemAndDescription init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (_TtC8Freeform12CRLBoardItem)boardItem
{
  return self->_boardItem;
}

- (NSDictionary)ingestibleDescription
{
  return self->_ingestibleDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ingestibleDescription, 0);

  objc_storeStrong((id *)&self->_boardItem, 0);
}

@end