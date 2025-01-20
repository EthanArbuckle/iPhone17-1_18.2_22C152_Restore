@interface BKDisplayAnnotationController
+ (id)annotationControllerForDisplay:(id)a3;
+ (void)performBlockForEveryAnnotationController:(id)a3;
- (CAContext)context;
- (CADisplay)display;
- (CALayer)referenceSpaceLayer;
- (CALayer)rootLayer;
- (CALayer)transformLayer;
- (id)_lock_supernodeForRenderingAtKeyPath:(id)a3;
- (id)allAnnotationsForKeyPath:(id)a3;
- (id)annotationForKeyPath:(id)a3;
- (void)_configureReferenceSpaceLayerTransformWithScale:(double)a3;
- (void)_lock_CATransaction:(id)a3;
- (void)_lock_invalidate;
- (void)_lock_locationDidChanges;
- (void)_lock_removeAnnotation:(id)a3;
- (void)_lock_setupLayerTree;
- (void)_lock_tearDownLayerTree;
- (void)_lock_updateLayerTree;
- (void)invalidate;
- (void)monitor:(id)a3 activeDisplayPropertiesDidChange:(id)a4;
- (void)monitor:(id)a3 displayDidBecomeActive:(id)a4;
- (void)monitor:(id)a3 displayDidBecomeInactive:(id)a4;
- (void)orientationManager:(id)a3 deviceOrientationMayHaveChanged:(int64_t)a4 changeSource:(int64_t)a5 isDeviceOrientationLocked:(BOOL)a6;
- (void)performSynchronized:(id)a3;
- (void)performSynchronizedWithCATransaction:(id)a3;
- (void)removeAnnotationsForKeyPath:(id)a3;
- (void)removeAnnotationsForKeyPath:(id)a3 afterDelay:(double)a4 queue:(id)a5;
- (void)setAnnotation:(id)a3 forKeyPath:(id)a4;
- (void)setContext:(id)a3;
- (void)setDisplay:(id)a3;
- (void)setReferenceSpaceLayer:(id)a3;
- (void)setRootLayer:(id)a3;
- (void)setTransformLayer:(id)a3;
@end

@implementation BKDisplayAnnotationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceSpaceLayer, 0);
  objc_storeStrong((id *)&self->_transformLayer, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_display, 0);
  objc_storeStrong((id *)&self->_rootNode, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_orientationObserver, 0);
  objc_storeStrong((id *)&self->_displayObserver, 0);

  objc_storeStrong((id *)&self->_displayController, 0);
}

- (void)setReferenceSpaceLayer:(id)a3
{
}

- (CALayer)referenceSpaceLayer
{
  return self->_referenceSpaceLayer;
}

- (void)setTransformLayer:(id)a3
{
}

- (CALayer)transformLayer
{
  return self->_transformLayer;
}

- (void)setRootLayer:(id)a3
{
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (void)setContext:(id)a3
{
}

- (CAContext)context
{
  return self->_context;
}

- (void)setDisplay:(id)a3
{
}

- (CADisplay)display
{
  return self->_display;
}

- (void)_configureReferenceSpaceLayerTransformWithScale:(double)a3
{
  double a = CGAffineTransformIdentity.a;
  double b = CGAffineTransformIdentity.b;
  double c = CGAffineTransformIdentity.c;
  double d = CGAffineTransformIdentity.d;
  double tx = CGAffineTransformIdentity.tx;
  double ty = CGAffineTransformIdentity.ty;
  double v24 = 0.0;
  double v25 = 0.0;
  char v23 = 0;
  v11 = [(CADisplay *)self->_display uniqueId];
  sub_100011044(v11, &v25, &v24, 0, &v23, 0);

  if (v23 == 1)
  {
    CGAffineTransformMakeRotation(&t2, -1.57079633);
    t1.double a = CGAffineTransformIdentity.a;
    t1.double b = b;
    t1.double c = c;
    t1.double d = d;
    t1.double tx = tx;
    t1.double ty = ty;
    p_CGAffineTransform t2 = &t2;
  }
  else
  {
    if (v23 != 3)
    {
      double v13 = v24;
      double v14 = v25;
      goto LABEL_7;
    }
    CGAffineTransformMakeRotation(&v19, 1.57079633);
    t1.double a = CGAffineTransformIdentity.a;
    t1.double b = b;
    t1.double c = c;
    t1.double d = d;
    t1.double tx = tx;
    t1.double ty = ty;
    p_CGAffineTransform t2 = &v19;
  }
  CGAffineTransformConcat(&v22, &t1, p_t2);
  double a = v22.a;
  double b = v22.b;
  double c = v22.c;
  double d = v22.d;
  double tx = v22.tx;
  double ty = v22.ty;
  double v14 = v24;
  double v13 = v25;
  double v24 = v25;
  double v25 = v14;
LABEL_7:
  double v15 = v14 / a3;
  referenceSpaceLayer = self->_referenceSpaceLayer;
  v18[0] = round(a);
  v18[1] = round(b);
  v18[2] = round(c);
  v18[3] = round(d);
  v18[4] = round(tx);
  v18[5] = round(ty);
  double v17 = v13 / a3;
  [(CALayer *)referenceSpaceLayer setAffineTransform:v18];
  -[CALayer setFrame:](self->_referenceSpaceLayer, "setFrame:", 0.0, 0.0, v15, v17);
}

- (void)_lock_locationDidChanges
{
  os_unfair_lock_assert_owner(&self->_lock);
  rootNode = self->_rootNode;

  [(BKNamespaceNode *)rootNode enumerateNodesWithOptions:1 usingBlock:&stru_1000F7DB8];
}

- (void)_lock_removeAnnotation:(id)a3
{
  p_lock = &self->_lock;
  id v4 = a3;
  os_unfair_lock_assert_owner(p_lock);
  [v4 setAnnotationController:0];
  id v5 = [v4 renderer];

  [v5 didRemoveAnnotation];
}

- (void)_lock_CATransaction:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_assert_owner(p_lock);
  +[CATransaction begin];
  v4[2](v4);

  +[CATransaction flush];

  +[CATransaction commit];
}

- (id)_lock_supernodeForRenderingAtKeyPath:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  double v13 = sub_1000790D0;
  double v14 = sub_1000790E0;
  double v15 = self->_rootNode;
  rootNode = self->_rootNode;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000790E8;
  v9[3] = &unk_1000F90A0;
  v9[4] = &v10;
  id v6 = [(BKNamespaceNode *)rootNode enumerateKeyPathNodes:v4 options:1 ifFound:v9 ifMissing:0];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)performSynchronizedWithCATransaction:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100079234;
  v6[3] = &unk_1000F7D98;
  id v7 = v4;
  id v5 = v4;
  [(BKDisplayAnnotationController *)self _lock_CATransaction:v6];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)performSynchronized:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_tearDownLayerTree
{
  os_unfair_lock_assert_owner(&self->_lock);
  rootLayer = self->_rootLayer;
  if (rootLayer)
  {
    self->_rootLayer = 0;

    referenceSpaceLayer = self->_referenceSpaceLayer;
    self->_referenceSpaceLayer = 0;

    transformLayer = self->_transformLayer;
    self->_transformLayer = 0;

    [(CAContext *)self->_context invalidate];
    context = self->_context;
    self->_context = 0;
  }
}

- (void)_lock_setupLayerTree
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_rootLayer)
  {
    +[CATransaction begin];
    v3 = self->_display;
    *(double *)&uint64_t v44 = 1.0;
    id v4 = [(CADisplay *)v3 uniqueId];
    int v5 = sub_100011180(v4);

    if (v5)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10001143C;
      double v48 = COERCE_DOUBLE(&unk_1000F6620);
      long long v49 = 0uLL;
      v50 = &v44;
      uint64_t v51 = 0;
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      sub_1000112C0(buf);
      double v6 = *(double *)&v44;
    }
    else
    {
      _BKSGetExternalDisplayScale();
      double v6 = v7;
    }

    [(CADisplay *)self->_display bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16 = sub_10005FB14();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [(CADisplay *)self->_display uniqueId];
      id v18 = [v17 length];
      CGAffineTransform v19 = (void *)BKSDisplayUUIDMainKey;
      if (v18) {
        CGAffineTransform v19 = v17;
      }
      double v20 = COERCE_DOUBLE(v19);

      *(_DWORD *)buf = 134218498;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      double v48 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%p     scale (%g)    %@", buf, 0x20u);
    }
    v21 = sub_10005FB14();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [(CADisplay *)self->_display uniqueId];
      id v23 = [v22 length];
      double v24 = (void *)BKSDisplayUUIDMainKey;
      if (v23) {
        double v24 = v22;
      }
      id v25 = v24;

      *(_DWORD *)buf = 134218754;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2048;
      double v48 = v15;
      LOWORD(v49) = 2112;
      *(void *)((char *)&v49 + 2) = v25;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%p      root (%g,%g) %@", buf, 0x2Au);
    }
    v26 = sub_10005FB14();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = [(CADisplay *)self->_display uniqueId];
      id v28 = [v27 length];
      v29 = (void *)BKSDisplayUUIDMainKey;
      if (v28) {
        v29 = v27;
      }
      id v30 = v29;

      *(_DWORD *)buf = 134218754;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v13 / v6;
      *(_WORD *)&buf[22] = 2048;
      double v48 = v15 / v6;
      LOWORD(v49) = 2112;
      *(void *)((char *)&v49 + 2) = v30;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%p transform (%g,%g) %@", buf, 0x2Au);
    }
    v31 = +[CALayer layer];
    rootLayer = self->_rootLayer;
    self->_rootLayer = v31;

    [(CALayer *)self->_rootLayer setName:@"Root"];
    [(CALayer *)self->_rootLayer setRasterizationScale:v6];
    v33 = self->_rootLayer;
    CGAffineTransformMakeScale(&v43, v6, v6);
    [(CALayer *)v33 setAffineTransform:&v43];
    v34 = +[CALayer layer];
    transformLayer = self->_transformLayer;
    self->_transformLayer = v34;

    [(CALayer *)self->_transformLayer setName:@"Transform"];
    [(CALayer *)self->_rootLayer addSublayer:self->_transformLayer];
    v36 = +[CALayer layer];
    referenceSpaceLayer = self->_referenceSpaceLayer;
    self->_referenceSpaceLayer = v36;

    [(CALayer *)self->_referenceSpaceLayer setName:@"ReferenceSpace"];
    [(CALayer *)self->_rootLayer addSublayer:self->_referenceSpaceLayer];
    -[CALayer setFrame:](self->_rootLayer, "setFrame:", v9, v11, v13, v15);
    -[CALayer setFrame:](self->_transformLayer, "setFrame:", 0.0, 0.0, v13 / v6, v15 / v6);
    [(BKDisplayAnnotationController *)self _configureReferenceSpaceLayerTransformWithScale:v6];
    v46[0] = &__kCFBooleanTrue;
    v45[0] = kCAContextDisplayable;
    v45[1] = kCAContextDisplayName;
    v38 = [(CADisplay *)self->_display name];
    v46[1] = v38;
    v46[2] = &__kCFBooleanTrue;
    v45[2] = kCAContextIgnoresHitTest;
    v45[3] = kCAContextSecure;
    v45[4] = kCAContextAllowsOcclusionDetectionOverride;
    v46[3] = &__kCFBooleanTrue;
    v46[4] = &__kCFBooleanTrue;
    v39 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:5];

    v40 = +[CAContext remoteContextWithOptions:v39];
    context = self->_context;
    self->_context = v40;

    LODWORD(v42) = 1173555200;
    [(CAContext *)self->_context setLevel:v42];
    [(CAContext *)self->_context setSecure:1];
    [(CAContext *)self->_context setLayer:self->_rootLayer];
    [(CALayer *)self->_rootLayer setDisableUpdateMask:[(CALayer *)self->_rootLayer disableUpdateMask] | 0x20];
    +[CATransaction flush];
    +[CATransaction commit];
    [(BKNamespaceNode *)self->_rootNode enumerateNodesWithOptions:1 usingBlock:&stru_1000F7D70];
  }
}

- (void)_lock_updateLayerTree
{
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = sub_10005FB14();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "updateLayerTree", v4, 2u);
  }

  +[CATransaction begin];
  [(BKDisplayAnnotationController *)self _lock_tearDownLayerTree];
  [(BKDisplayAnnotationController *)self _lock_setupLayerTree];
  +[CATransaction commit];
}

- (void)monitor:(id)a3 displayDidBecomeInactive:(id)a4
{
  unsigned int v5 = [a4 displayId:a3];
  if (v5 == [(CADisplay *)self->_display displayId])
  {
    os_unfair_lock_lock(&self->_lock);
    [(BKDisplayAnnotationController *)self _lock_tearDownLayerTree];
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)monitor:(id)a3 displayDidBecomeActive:(id)a4
{
  id v7 = a4;
  unsigned int v6 = [v7 displayId];
  if (v6 == [(CADisplay *)self->_display displayId])
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_display, a4);
    [(BKDisplayAnnotationController *)self _lock_setupLayerTree];
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)monitor:(id)a3 activeDisplayPropertiesDidChange:(id)a4
{
  id v7 = a4;
  unsigned int v6 = [v7 displayId];
  if (v6 == [(CADisplay *)self->_display displayId])
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_display, a4);
    [(BKDisplayAnnotationController *)self _lock_updateLayerTree];
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)orientationManager:(id)a3 deviceOrientationMayHaveChanged:(int64_t)a4 changeSource:(int64_t)a5 isDeviceOrientationLocked:(BOOL)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100079B90;
  v6[3] = &unk_1000F8E78;
  void v6[4] = self;
  -[BKDisplayAnnotationController performSynchronizedWithCATransaction:](self, "performSynchronizedWithCATransaction:", v6, a4, a5, a6);
}

- (void)removeAnnotationsForKeyPath:(id)a3 afterDelay:(double)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = sub_10005FB14();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "remove %{public}@", buf, 0xCu);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100079DD4;
  v13[3] = &unk_1000F8F60;
  v13[4] = self;
  id v14 = v8;
  double v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [(BKDisplayAnnotationController *)self performSynchronizedWithCATransaction:v13];
}

- (void)removeAnnotationsForKeyPath:(id)a3
{
}

- (void)setAnnotation:(id)a3 forKeyPath:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007A3D8;
  v8[3] = &unk_1000F8E08;
  id v9 = a3;
  double v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [(BKDisplayAnnotationController *)self performSynchronizedWithCATransaction:v8];
}

- (id)allAnnotationsForKeyPath:(id)a3
{
  id v4 = a3;
  +[NSMutableArray array];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007A634;
  v10[3] = &unk_1000F8E08;
  v10[4] = self;
  id v11 = v4;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v5;
  id v6 = v4;
  [(BKDisplayAnnotationController *)self performSynchronized:v10];
  id v7 = v12;
  id v8 = v5;

  return v8;
}

- (id)annotationForKeyPath:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  double v13 = sub_1000790D0;
  id v14 = sub_1000790E0;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007A848;
  v6[3] = &unk_1000F8EF0;
  id v9 = &v10;
  id v7 = self;
  id v3 = a3;
  id v8 = v3;
  [(BKDisplayAnnotationController *)v7 performSynchronized:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v4;
}

- (void)_lock_invalidate
{
  displayObserver = self->_displayObserver;
  if (displayObserver)
  {
    [(BSInvalidatable *)displayObserver invalidate];
    id v4 = self->_displayObserver;
    self->_displayObserver = 0;

    [(BSInvalidatable *)self->_orientationObserver invalidate];
    orientationObserver = self->_orientationObserver;
    self->_orientationObserver = 0;

    [(BKDisplayAnnotationController *)self _lock_tearDownLayerTree];
  }
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(BKDisplayAnnotationController *)self _lock_invalidate];

  os_unfair_lock_unlock(p_lock);
}

+ (void)performBlockForEveryAnnotationController:(id)a3
{
  id v3 = a3;
  sub_100050028();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v6)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)v6 + 2);
    os_unfair_lock_lock((os_unfair_lock_t)v6 + 2);
    id v5 = [*((id *)v6 + 2) copy];
    os_unfair_lock_unlock((os_unfair_lock_t)v6 + 2);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000500BC;
    v7[3] = &unk_1000F6D88;
    id v8 = v4;
    [v5 enumerateKeysAndObjectsUsingBlock:v7];
  }
}

+ (id)annotationControllerForDisplay:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100050028();
  id v6 = v4;
  if (v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v5 + 8));
    if (!*(void *)(v5 + 16))
    {
      id v7 = objc_alloc_init((Class)NSMutableDictionary);
      id v8 = *(void **)(v5 + 16);
      *(void *)(v5 + 16) = v7;
    }
    id v9 = [v6 uniqueId];
    id v10 = [v9 length];
    id v11 = (void *)BKSDisplayUUIDMainKey;
    if (v10) {
      uint64_t v12 = v9;
    }
    else {
      uint64_t v12 = (void *)BKSDisplayUUIDMainKey;
    }
    id v13 = v12;

    id v14 = [*(id *)(v5 + 16) objectForKey:v13];
    if (!v14)
    {
      id v14 = [BKDisplayAnnotationController alloc];
      id v15 = v6;
      id v16 = (id)v5;
      if (v14)
      {
        v42.receiver = v14;
        v42.super_class = (Class)BKDisplayAnnotationController;
        id v17 = [super init];
        id v14 = v17;
        if (v17)
        {
          v17->_lock._os_unfair_lock_opaque = 0;
          p_display = (id *)&v17->_display;
          objc_storeStrong((id *)&v17->_display, a3);
          objc_storeStrong((id *)&v14->_displayController, (id)v5);
          id displayController = v14->_displayController;
          if (displayController) {
            id displayController = objc_getProperty(displayController, v18, 24, 1);
          }
          id v20 = displayController;
          uint64_t v21 = [v20 addObserver:v14];
          displayObserver = v14->_displayObserver;
          v14->_displayObserver = (BSInvalidatable *)v21;

          id v23 = objc_alloc_init(BKNamespaceNode);
          rootNode = v14->_rootNode;
          v14->_rootNode = v23;

          [(BKNamespaceNode *)v14->_rootNode setName:@"<root>"];
          Properdouble ty = v14->_displayController;
          id v39 = v15;
          id v40 = v16;
          if (Property) {
            Properdouble ty = objc_getProperty(Property, v25, 24, 1);
          }
          id v27 = Property;
          id v28 = [*p_display uniqueId];
          if ([v28 length]) {
            v29 = v28;
          }
          else {
            v29 = v11;
          }
          id v30 = v29;

          unsigned int v31 = [v27 displayUUIDIsActive:v30];
          if (v31)
          {
            os_unfair_lock_lock(&v14->_lock);
            [(BKDisplayAnnotationController *)v14 _lock_setupLayerTree];
            os_unfair_lock_unlock(&v14->_lock);
          }
          if ([*p_display isExternal])
          {
            id v15 = v39;
            id v16 = v40;
          }
          else
          {
            v32 = [*p_display uniqueId];
            int v33 = sub_100011180(v32);

            id v16 = v40;
            if (v33)
            {
              sub_10001C32C();
              v34 = (id *)objc_claimAutoreleasedReturnValue();
              uint64_t v35 = sub_100095730(v34, v14);
              orientationObserver = v14->_orientationObserver;
              v14->_orientationObserver = (BSInvalidatable *)v35;
            }
            id v15 = v39;
          }
        }
      }

      [*(id *)(v5 + 16) setObject:v14 forKey:v13];
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 8));
    v37 = [[_BKDisplayAnnotationControllerReference alloc] initWithController:v14];
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

@end