@interface CRLiOSScribbleInteractionSetupHelper
+ (void)setupScribbleEditingProvider:(id)a3 scribbleObserver:(id)a4 scribbleActive:(BOOL)a5;
@end

@implementation CRLiOSScribbleInteractionSetupHelper

+ (void)setupScribbleEditingProvider:(id)a3 scribbleObserver:(id)a4 scribbleActive:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 scribbleInteraction];
  v10 = v9;
  if (v5)
  {

    if (v10)
    {
      int v11 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D2B58);
      }
      v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101073B6C(v11, v12);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D2B78);
      }
      v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101066770(v13, v11);
      }
      v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLiOSScribbleInteractionSetupHelper setupScribbleEditingProvider:scribbleObserver:scribbleActive:]");
      v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSScribbleInteractionSetupHelper.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 24, 0, "expected nil value for '%{public}s'", "editingProvider.scribbleInteraction");
    }
    v16 = [[CRLiOSScribbleInteractionDelegate alloc] initWithEditingProvider:v7 scribbleInteractionObserver:v8];
    [v7 setScribbleInteractionDelegate:v16];

    id v17 = objc_alloc((Class)UIIndirectScribbleInteraction);
    v18 = [v7 scribbleInteractionDelegate];
    id v19 = [v17 initWithDelegate:v18];

    v20 = [v7 view];
    [v20 addInteraction:v19];

    id v21 = objc_alloc((Class)UIScribbleInteraction);
    v22 = [v7 scribbleInteractionDelegate];
    id v23 = [v21 initWithDelegate:v22];

    v24 = [v7 view];
    [v24 addInteraction:v23];

    [v7 setScribbleInteraction:v19];
    [v7 setDirectScribbleInteraction:v23];
  }
  else
  {

    if (v10)
    {
      v25 = [v7 view];
      v26 = [v7 scribbleInteraction];
      [v25 removeInteraction:v26];

      [v7 setScribbleInteraction:0];
    }
    [v7 setScribbleInteractionDelegate:0];
    [v7 setDirectScribbleInteraction:0];
  }
}

@end