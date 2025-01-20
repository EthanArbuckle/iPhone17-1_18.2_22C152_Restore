@interface CRLBoardItemImporterPlaceholder
+ (id)allocWithZone:(_NSZone *)a3;
- (CRLBoardItemImporterPlaceholder)initWithData:(id)a3 boardItemFactory:(id)a4;
- (CRLBoardItemImporterPlaceholder)initWithURL:(id)a3 boardItemFactory:(id)a4;
@end

@implementation CRLBoardItemImporterPlaceholder

+ (id)allocWithZone:(_NSZone *)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100383A9C;
  v5[3] = &unk_1014F2EF8;
  v5[4] = a3;
  v5[5] = a1;
  if (qword_1016A9830 != -1) {
    dispatch_once(&qword_1016A9830, v5);
  }
  v3 = (void *)qword_1016A9828;

  return v3;
}

- (CRLBoardItemImporterPlaceholder)initWithURL:(id)a3 boardItemFactory:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (CRLBoardItemImporterPlaceholder *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "p_subclassForURL:", v7)), "initWithURL:boardItemFactory:", v7, v6);

  return v8;
}

- (CRLBoardItemImporterPlaceholder)initWithData:(id)a3 boardItemFactory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [objc_opt_class() p_subclassForPreinsertionAssetWrapper:v6];
  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2F18);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A6FF4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F2F38);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemImporterPlaceholder initWithData:boardItemFactory:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 374, 0, "invalid nil value for '%{public}s'", "instanceClass");
  }
  v12 = (CRLBoardItemImporterPlaceholder *)[[v8 alloc] initWithData:v6 boardItemFactory:v7];

  return v12;
}

@end