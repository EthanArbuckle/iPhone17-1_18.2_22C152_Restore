@interface CRLPasteboardObjectReadAssistantHelper
+ (id)contentDescriptionFromPasteboard:(id)a3;
@end

@implementation CRLPasteboardObjectReadAssistantHelper

+ (id)contentDescriptionFromPasteboard:(id)a3
{
  id v3 = a3;
  if (![v3 containsNativePasteboardTypes]
    || (CFStringRef v20 = @"com.apple.freeform.CRLDescription",
        +[NSArray arrayWithObjects:&v20 count:1],
        v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v3 containsPasteboardTypes:v4],
        v4,
        !v5))
  {
    v10 = 0;
    goto LABEL_26;
  }
  v6 = [v3 dataForPasteboardType:@"com.apple.freeform.CRLDescription"];
  if (!v6)
  {
    int v12 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2A48);
    }
    v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108C508(v12, v13);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2A68);
    }
    v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v14, v12);
    }
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPasteboardObjectReadAssistantHelper contentDescriptionFromPasteboard:]");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardObjectReadAssistantHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v15, 18, 0, "invalid nil value for '%{public}s'", "data");

    goto LABEL_24;
  }
  uint64_t v19 = 0;
  uint64_t v7 = objc_opt_class();
  id v18 = 0;
  v8 = +[NSPropertyListSerialization propertyListWithData:v6 options:0 format:&v19 error:&v18];
  id v9 = v18;
  v10 = sub_1002469D0(v7, v8);

  if (!v10)
  {
    if (qword_101719A68 != -1) {
      dispatch_once(&qword_101719A68, &stru_1014E2A88);
    }
    v16 = off_10166B498;
    if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
      sub_10108C5C4(v16, v9);
    }
    goto LABEL_24;
  }
  if (v19 != 200)
  {

    if (qword_101719A68 != -1) {
      dispatch_once(&qword_101719A68, &stru_1014E2AA8);
    }
    v11 = off_10166B498;
    if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
      sub_10108C6B8(&v19, v11);
    }
LABEL_24:
    v10 = 0;
  }

LABEL_26:

  return v10;
}

@end