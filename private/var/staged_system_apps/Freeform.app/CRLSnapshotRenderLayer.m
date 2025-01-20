@interface CRLSnapshotRenderLayer
- (CRLSnapshotImageSlotID)slotId;
- (CRLSnapshotRenderLayer)initWithSourceLayer:(id)a3;
- (void)_setSlotId:(id)a3;
- (void)setContents:(id)a3;
@end

@implementation CRLSnapshotRenderLayer

- (CRLSnapshotRenderLayer)initWithSourceLayer:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC3A0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B6B2C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC3C0);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSnapshotRenderLayer initWithSourceLayer:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CrossPlatformUI/CRLSnapshotRenderLayer.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 75, 0, "invalid nil value for '%{public}s'", "sourceLayer");
  }
  v69.receiver = self;
  v69.super_class = (Class)CRLSnapshotRenderLayer;
  v8 = [(CRLSnapshotRenderLayer *)&v69 init];
  if (v8)
  {
    [v4 bounds];
    -[CRLSnapshotRenderLayer setBounds:](v8, "setBounds:");
    [v4 contentsScale];
    -[CRLSnapshotRenderLayer setContentsScale:](v8, "setContentsScale:");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [v4 slotId];
      [(CRLSnapshotRenderLayer *)v8 _setSlotId:v9];

      goto LABEL_36;
    }
    v10 = [v4 context];

    if (v10)
    {
      if ([v4 hasBeenCommitted])
      {
        long long v61 = *(_OWORD *)&CATransform3DIdentity.m33;
        *(_OWORD *)&v68.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
        long long v60 = *(_OWORD *)&v68.m31;
        *(_OWORD *)&v68.m33 = v61;
        long long v59 = *(_OWORD *)&CATransform3DIdentity.m43;
        *(_OWORD *)&v68.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
        long long v58 = *(_OWORD *)&v68.m41;
        *(_OWORD *)&v68.m43 = v59;
        long long v57 = *(_OWORD *)&CATransform3DIdentity.m13;
        *(_OWORD *)&v68.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
        long long v56 = *(_OWORD *)&v68.m11;
        *(_OWORD *)&v68.m13 = v57;
        long long v55 = *(_OWORD *)&CATransform3DIdentity.m23;
        *(_OWORD *)&v68.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
        long long v54 = *(_OWORD *)&v68.m21;
        *(_OWORD *)&v68.m23 = v55;
        [v4 contentsScale];
        double v12 = v11 + v11;
        [v4 bounds];
        CATransform3DMakeTranslation(&b, 0.0, -(v13 * (v12 + -1.0)), 0.0);
        *(_OWORD *)&a.m31 = v60;
        *(_OWORD *)&a.m33 = v61;
        *(_OWORD *)&a.m41 = v58;
        *(_OWORD *)&a.m43 = v59;
        *(_OWORD *)&a.m11 = v56;
        *(_OWORD *)&a.m13 = v57;
        *(_OWORD *)&a.m21 = v54;
        *(_OWORD *)&a.m23 = v55;
        CATransform3DConcat(&v68, &a, &b);
        if ([v4 isGeometryFlipped])
        {
          CATransform3DMakeScale(&v65, 1.0, -1.0, 1.0);
          CATransform3D v64 = v68;
          CATransform3DConcat(&a, &v64, &v65);
          CATransform3D v68 = a;
          [v4 bounds];
          CATransform3DMakeTranslation(&v63, 0.0, v14, 0.0);
          CATransform3D v64 = v68;
          CATransform3DConcat(&a, &v64, &v63);
          CATransform3D v68 = a;
        }
        CATransform3DMakeScale(&v62, v12, v12, 1.0);
        CATransform3D v64 = v68;
        CATransform3DConcat(&a, &v64, &v62);
        CATransform3D v68 = a;
        [v4 bounds];
        double v17 = sub_1000646A4(v15, v16, v12);
        v19 = -[CRLSnapshotImageSlotID initWithSize:]([CRLSnapshotImageSlotID alloc], "initWithSize:", v17, v18);
        [(CRLSnapshotRenderLayer *)v8 _setSlotId:v19];

        v70[0] = kCASnapshotMode;
        v70[1] = kCASnapshotDisplayName;
        v71[0] = kCASnapshotModeLayer;
        v71[1] = @"DisplayName";
        v70[2] = kCASnapshotContextId;
        v20 = [v4 context];
        v21 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v20 contextId]);
        v71[2] = v21;
        v70[3] = kCASnapshotLayerId;
        v22 = +[NSNumber numberWithUnsignedLongLong:v4];
        v71[3] = v22;
        v70[4] = kCASnapshotDestination;
        v23 = [(CRLSnapshotRenderLayer *)v8 slotId];
        v24 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v23 value]);
        v71[4] = v24;
        v70[5] = kCASnapshotTransform;
        CATransform3D a = v68;
        v25 = +[NSValue valueWithCATransform3D:&a];
        v71[5] = v25;
        v71[6] = &__kCFBooleanTrue;
        v70[6] = kCASnapshotReuseBackdropContents;
        v70[7] = kCASnapshotIgnoreRootAccessibilityFilters;
        v70[8] = kCASnapshotBottomLeftOrigin;
        v71[7] = &__kCFBooleanTrue;
        v71[8] = &__kCFBooleanTrue;
        v26 = +[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:9];

        if ((CARenderServerSnapshot() & 1) == 0)
        {

          if (qword_101719C48 != -1) {
            dispatch_once(&qword_101719C48, &stru_1014FC420);
          }
          v27 = off_10166B678;
          if (os_log_type_enabled((os_log_t)off_10166B678, OS_LOG_TYPE_ERROR)) {
            sub_1010B6ABC(v27, v28, v29, v30, v31, v32, v33, v34);
          }
          v8 = 0;
        }
        v35 = [v4 valueForKey:@"wantsExtendedDynamicRangeContent"];
        unsigned int v36 = [v35 BOOLValue];

        if (v36) {
          [(CRLSnapshotRenderLayer *)v8 setValue:&__kCFBooleanTrue forKey:@"wantsExtendedDynamicRangeContent"];
        }

        goto LABEL_36;
      }

      if (qword_101719C48 != -1) {
        dispatch_once(&qword_101719C48, &stru_1014FC400);
      }
      v45 = off_10166B678;
      if (os_log_type_enabled((os_log_t)off_10166B678, OS_LOG_TYPE_ERROR)) {
        sub_1010B6AF4(v45, v46, v47, v48, v49, v50, v51, v52);
      }
    }
    else
    {

      if (qword_101719C48 != -1) {
        dispatch_once(&qword_101719C48, &stru_1014FC3E0);
      }
      v37 = off_10166B678;
      if (os_log_type_enabled((os_log_t)off_10166B678, OS_LOG_TYPE_ERROR)) {
        sub_1010B6A84(v37, v38, v39, v40, v41, v42, v43, v44);
      }
    }
    v8 = 0;
  }
LABEL_36:

  return v8;
}

- (void)setContents:(id)a3
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FC440);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010B6BDC();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FC460);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010668E0(v3);
  }
  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSnapshotRenderLayer setContents:]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CrossPlatformUI/CRLSnapshotRenderLayer.m"];
  +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:148 isFatal:0 description:"CRLSnapshotRenderLayer.setContents is unsupported. Use -initWithSourceLayer:"];
}

- (void)_setSlotId:(id)a3
{
  id v4 = (CRLSnapshotImageSlotID *)a3;
  v5 = [(CRLSnapshotImageSlotID *)v4 object];
  v7.receiver = self;
  v7.super_class = (Class)CRLSnapshotRenderLayer;
  [(CRLSnapshotRenderLayer *)&v7 setContents:v5];

  slotId = self->_slotId;
  self->_slotId = v4;
}

- (CRLSnapshotImageSlotID)slotId
{
  return self->_slotId;
}

- (void).cxx_destruct
{
}

@end