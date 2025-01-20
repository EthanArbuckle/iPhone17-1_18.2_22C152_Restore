@interface CRLPasteboardCopyAssistant
- (CRLPasteboardCopyAssistant)initWithPasteboard:(id)a3 sourceContext:(id)a4;
- (void)copyToPasteboard;
- (void)copyToPasteboardIsSmartCopy:(BOOL)a3;
- (void)loadData;
@end

@implementation CRLPasteboardCopyAssistant

- (CRLPasteboardCopyAssistant)initWithPasteboard:(id)a3 sourceContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6380);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109217C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E63A0);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardCopyAssistant initWithPasteboard:sourceContext:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardCopyAssistant.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 19, 0, "invalid nil value for '%{public}s'", "pasteboard");
  }
  v15.receiver = self;
  v15.super_class = (Class)CRLPasteboardCopyAssistant;
  v12 = [(CRLPasteboardWriteAssistant *)&v15 initWithContext:v8];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_pasteboard, a3);
  }

  return v13;
}

- (void)loadData
{
  if (self->_didAttemptToCopy)
  {
    v5.receiver = self;
    v5.super_class = (Class)CRLPasteboardCopyAssistant;
    [(CRLPasteboardWriteAssistant *)&v5 loadData];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E63C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109222C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E63E0);
    }
    v2 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardCopyAssistant loadData]");
    v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardCopyAssistant.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:32 isFatal:0 description:"Didn't attempt to copy before trying to load native data."];
  }
}

- (void)copyToPasteboard
{
}

- (void)copyToPasteboardIsSmartCopy:(BOOL)a3
{
  BOOL v3 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6400);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010922C0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6420);
    }
    objc_super v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardCopyAssistant copyToPasteboardIsSmartCopy:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardCopyAssistant.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:41 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  [(CRLPasteboard *)self->_pasteboard clearContents];
  pasteboard = self->_pasteboard;
  v10 = self;
  v9 = +[NSArray arrayWithObjects:&v10 count:1];
  [(CRLPasteboard *)pasteboard addItems:v9 isSmartCopy:v3];

  self->_didAttemptToCopy = 1;
}

- (void).cxx_destruct
{
}

@end