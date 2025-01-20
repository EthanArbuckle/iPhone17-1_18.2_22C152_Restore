@interface CRLAdditionalTransformCoordinateSpace
- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4;
- (CGRect)bounds;
- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4;
- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4;
- (CRLAdditionalTransformCoordinateSpace)initWithCoordinateSpace:(id)a3 identifier:(id)a4;
- (NSString)identifier;
@end

@implementation CRLAdditionalTransformCoordinateSpace

- (CRLAdditionalTransformCoordinateSpace)initWithCoordinateSpace:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CRLAdditionalTransformCoordinateSpace;
  v9 = [(CRLAdditionalTransformCoordinateSpace *)&v19 init];
  if (v9)
  {
    if (!v7)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F4628);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A9AEC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F4648);
      }
      v10 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v10);
      }
      v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAdditionalTransformCoordinateSpace initWithCoordinateSpace:identifier:]");
      v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLAdditionalTransformCoordinateSpace.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 23, 0, "invalid nil value for '%{public}s'", "coordinateSpace");
    }
    objc_storeStrong((id *)&v9->_originalCoordinateSpace, a3);
    if (!v8)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F4668);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A9A3C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F4688);
      }
      v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v13);
      }
      v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAdditionalTransformCoordinateSpace initWithCoordinateSpace:identifier:]");
      v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLAdditionalTransformCoordinateSpace.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 25, 0, "invalid nil value for '%{public}s'", "identifier");
    }
    v16 = (NSString *)[v8 copy];
    identifier = v9->_identifier;
    v9->_identifier = v16;
  }
  return v9;
}

- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4
{
  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)self, *(Swift::String *)&a2);

  -[CRLAdditionalTransformCoordinateSpace convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", a4);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4
{
  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)self, *(Swift::String *)&a2);

  -[CRLAdditionalTransformCoordinateSpace convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", a4);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v9 = (CRLAdditionalTransformCoordinateSpace *)a4;
  if (v9 != self)
  {
    memset(&v22, 0, sizeof(v22));
    originalCoordinateSpace = self->_originalCoordinateSpace;
    if (originalCoordinateSpace)
    {
      [(CRLAdditionallyTransformedCoordinateSpace *)originalCoordinateSpace additionalTransformIntoCoordinateSpace:self];
      v11 = self->_originalCoordinateSpace;
    }
    else
    {
      v11 = 0;
    }
    CGAffineTransform v20 = v22;
    CGAffineTransformInvert(&v21, &v20);
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    CGRect v24 = CGRectApplyAffineTransform(v23, &v21);
    -[CRLAdditionallyTransformedCoordinateSpace convertRect:toCoordinateSpace:](v11, "convertRect:toCoordinateSpace:", v9, v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
    CGFloat x = v12;
    CGFloat y = v13;
    CGFloat width = v14;
    CGFloat height = v15;
  }

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9 = (CRLAdditionalTransformCoordinateSpace *)a4;
  if (v9 != self)
  {
    memset(&v15[1], 0, sizeof(CGAffineTransform));
    originalCoordinateSpace = self->_originalCoordinateSpace;
    if (originalCoordinateSpace)
    {
      [(CRLAdditionallyTransformedCoordinateSpace *)originalCoordinateSpace additionalTransformIntoCoordinateSpace:self];
      originalCoordinateSpace = self->_originalCoordinateSpace;
    }
    -[CRLAdditionallyTransformedCoordinateSpace convertRect:fromCoordinateSpace:](originalCoordinateSpace, "convertRect:fromCoordinateSpace:", v9, x, y, width, height);
    v15[0] = v15[1];
    CGRect v17 = CGRectApplyAffineTransform(v16, v15);
    double x = v17.origin.x;
    double y = v17.origin.y;
    double width = v17.size.width;
    double height = v17.size.height;
  }

  double v11 = x;
  double v12 = y;
  double v13 = width;
  double v14 = height;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)bounds
{
  memset(&v4[1], 0, sizeof(CGAffineTransform));
  originalCoordinateSpace = self->_originalCoordinateSpace;
  if (originalCoordinateSpace)
  {
    [(CRLAdditionallyTransformedCoordinateSpace *)originalCoordinateSpace additionalTransformIntoCoordinateSpace:self];
    originalCoordinateSpace = self->_originalCoordinateSpace;
  }
  [(CRLAdditionallyTransformedCoordinateSpace *)originalCoordinateSpace bounds];
  v4[0] = v4[1];
  return CGRectApplyAffineTransform(v5, v4);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_originalCoordinateSpace, 0);
}

@end