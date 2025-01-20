@interface MPCropController
+ (id)sharedController;
+ (void)releaseSharedController;
- (CGPoint)checkFarApartROIs:(id)a3 withImageSize:(CGSize)a4 visibleAspectRatio:(double)a5 roiCenter:(CGPoint)a6;
- (MPCropController)init;
- (double)durationOfSlide:(id)a3;
- (id)delegate;
- (void)_applyCropToSlidesInEffectContainersWithArguments:(id)a3;
- (void)applyAnimatedCropToBreakSlide:(id)a3 withOptions:(id)a4;
- (void)applyAnimatedCropToSlide:(id)a3 withOptions:(id)a4;
- (void)applyAnimatedCropToSlide:(id)a3 withOptions:(id)a4 centeredAt:(CGPoint)a5 alwaysZoomIn:(BOOL)a6;
- (void)applyAnimatedCropWithROIsToSlide:(id)a3 withOptions:(id)a4;
- (void)applyCropToSlide:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)applyCropToSlide:(id)a3 withOptions:(id)a4;
- (void)applyCropToSlidesInEffectContainers:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)applyMultiFaceAnimatedCropToSlide:(id)a3 withOptions:(id)a4;
- (void)applyStationaryCropToSlide:(id)a3 withOptions:(id)a4;
- (void)batchCrop:(id)a3;
- (void)cleanup;
- (void)cropSlidesForLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)cropSlidesInDocument:(id)a3 withOptions:(id)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setupWithDocument:(id)a3 andOptions:(id)a4;
@end

@implementation MPCropController

+ (id)sharedController
{
  id result = (id)qword_1F1328;
  if (!qword_1F1328)
  {
    objc_sync_enter(a1);
    if (!qword_1F1328) {
      qword_1F1328 = objc_alloc_init(MPCropController);
    }
    objc_sync_exit(a1);
    return (id)qword_1F1328;
  }
  return result;
}

+ (void)releaseSharedController
{
  if (qword_1F1328)
  {
    objc_sync_enter(a1);

    qword_1F1328 = 0;
    objc_sync_exit(a1);
  }
}

- (MPCropController)init
{
  v5.receiver = self;
  v5.super_class = (Class)MPCropController;
  v2 = [(MPCropController *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_delegate = 0;
    v2->_cropLock = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
  }
  return v3;
}

- (void)dealloc
{
  self->_cropLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)MPCropController;
  [(MPCropController *)&v3 dealloc];
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (void)batchCrop:(id)a3
{
  id v24 = objc_alloc_init((Class)NSAutoreleasePool);
  if (!self->_delegate)
  {
    char v5 = 0;
    goto LABEL_5;
  }
  char v5 = objc_opt_respondsToSelector();
  if (!self->_delegate)
  {
LABEL_5:
    int v6 = 1;
    goto LABEL_6;
  }
  int v6 = objc_opt_respondsToSelector() ^ 1;
LABEL_6:
  int v21 = v6;
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", objc_msgSend(a3, "objectForKey:", @"options"));
  id v22 = [a3 objectForKey:@"document"];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [a3 objectForKey:@"slidesToCrop"];
  id v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v8) {
    goto LABEL_29;
  }
  id v9 = v8;
  int v10 = 0;
  uint64_t v11 = *(void *)v26;
  uint64_t v12 = -1;
  do
  {
    v13 = 0;
    do
    {
      if (*(void *)v26 != v11) {
        objc_enumerationMutation(obj);
      }
      v14 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v13);
      id v15 = objc_msgSend(objc_msgSend(v14, "nearestLayer"), "zIndex");
      if (v15 != (id)-1 && v15 != (id)v12)
      {
        uint64_t v17 = (uint64_t)v15;
        v18 = +[NSNumber numberWithInteger:v15];
        [v7 setObject:v18 forKey:kMPAuthoringLayerIndex];
        uint64_t v12 = v17;
      }
      if (v5 & 1) == 0 || ([v14 isSecondary]) {
        goto LABEL_21;
      }
      unsigned int v19 = objc_msgSend(self->_delegate, "document:shouldUseDefaultAnimatedPathsForSlide:inEffect:", v22, v14, objc_msgSend(v14, "parentEffect"));
      if ((v19 | v21) & 1) != 0 || ([v14 isSecondary])
      {
        if (!v19) {
          goto LABEL_22;
        }
LABEL_21:
        [(MPCropController *)self applyCropToSlide:v14 withOptions:v7];
        goto LABEL_22;
      }
      objc_msgSend(self->_delegate, "document:needsAnimationPathsAppliedForSlide:inEffect:", v22, v14, objc_msgSend(v14, "parentEffect"));
LABEL_22:
      if (v10 == 30)
      {

        id v24 = objc_alloc_init((Class)NSAutoreleasePool);
        int v10 = 0;
      }
      else
      {
        ++v10;
      }
      v13 = (char *)v13 + 1;
    }
    while (v9 != v13);
    id v20 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    id v9 = v20;
  }
  while (v20);
LABEL_29:

  [v24 drain];
}

- (void)cropSlidesInDocument:(id)a3 withOptions:(id)a4
{
  id v7 = [a3 documentLayerGroup];
  [(MPCropController *)self cropSlidesForLayerGroup:v7 inDocument:a3 withOptions:a4];
}

- (void)cropSlidesForLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  [(NSRecursiveLock *)self->_cropLock lock];
  id v51 = [a5 mutableCopy];
  if (!v51) {
    id v51 = objc_msgSend(objc_msgSend(a3, "authoringOptions"), "mutableCopy");
  }
  [(MPCropController *)self setupWithDocument:a4 andOptions:a5];
  int v10 = (char *)+[MPAuthoringUtilities reconfigureRangeFromOptions:a5];
  NSUInteger v12 = v11;
  id v13 = objc_alloc_init((Class)NSMutableArray);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = [a3 layers];
  id v45 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
  if (v45)
  {
    v40 = v9;
    char v14 = 0;
    v54 = 0;
    NSUInteger v15 = 0;
    v52 = &v10[v12];
    uint64_t v42 = *(void *)v65;
    id v49 = a4;
    v50 = self;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v65 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v64 + 1) + 8 * (void)v16);
        v18 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v17 zIndex]);
        [v51 setObject:v18 forKey:kMPAuthoringLayerIndex];
        id v19 = [v17 effectContainers];
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v47 = [v19 countByEnumeratingWithState:&v60 objects:v69 count:16];
        if (v47)
        {
          uint64_t v20 = *(void *)v61;
          char v21 = v14;
          v48 = v16;
          v43 = v19;
          uint64_t v44 = *(void *)v61;
LABEL_10:
          uint64_t v22 = 0;
LABEL_11:
          if (*(void *)v61 != v20)
          {
            uint64_t v23 = v22;
            objc_enumerationMutation(v19);
            uint64_t v22 = v23;
          }
          uint64_t v46 = v22;
          id v24 = *(void **)(*((void *)&v60 + 1) + 8 * v22);
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          id v53 = [v24 effects];
          id v25 = [v53 countByEnumeratingWithState:&v56 objects:v68 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v55 = *(void *)v57;
LABEL_15:
            uint64_t v27 = 0;
            while (1)
            {
              if (*(void *)v57 != v55) {
                objc_enumerationMutation(v53);
              }
              long long v28 = *(void **)(*((void *)&v56 + 1) + 8 * v27);
              NSUInteger v29 = (NSUInteger)objc_msgSend(objc_msgSend(v28, "slides"), "count");
              if (v12)
              {
                v71.NSUInteger location = (NSUInteger)v10;
                v71.NSUInteger length = v12;
                v72.NSUInteger location = v15;
                v72.NSUInteger length = v29;
                NSRange v31 = NSIntersectionRange(v71, v72);
                NSUInteger location = v31.location;
                NSUInteger length = v31.length;
                if (v31.length) {
                  goto LABEL_22;
                }
              }
              else
              {
                NSUInteger location = v15;
                NSUInteger length = v29;
                if (v29)
                {
LABEL_22:
                  v33 = v10;
                  objc_msgSend(v13, "addObjectsFromArray:", objc_msgSend(objc_msgSend(v28, "slides"), "subarrayWithRange:", location - v15, length));
                  objc_msgSend(v13, "addObjectsFromArray:", objc_msgSend(v28, "secondarySlides"));
                  if ((unint64_t)[v13 count] >= 0x7D1)
                  {
                    id v34 = v54;
                    if (!v54)
                    {
                      id v34 = objc_alloc_init((Class)NSOperationQueue);
                      [v34 setMaxConcurrentOperationCount:1];
                    }
                    id v35 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v13, @"slidesToCrop", v49, @"document", objc_msgSend(v51, "copy"), @"options", 0);
                    id v36 = [objc_alloc((Class)NSInvocationOperation) initWithTarget:v50 selector:"batchCrop:" object:v35];
                    [v36 setQualityOfService:9];
                    [v36 setQueuePriority:-8];
                    v54 = v34;
                    [v34 addOperation:v36];

                    id v13 = objc_alloc_init((Class)NSMutableArray);
                  }
                  int v10 = v33;
                }
              }
              v15 += v29;
              if (v12 && v15 >= (unint64_t)v52)
              {
                char v14 = 1;
                a4 = v49;
                self = v50;
                v16 = v48;
                goto LABEL_37;
              }
              if (v26 == (id)++v27)
              {
                id v26 = [v53 countByEnumeratingWithState:&v56 objects:v68 count:16];
                if (v26) {
                  goto LABEL_15;
                }
LABEL_33:
                char v21 = 0;
                uint64_t v22 = v46 + 1;
                a4 = v49;
                self = v50;
                v16 = v48;
                id v19 = v43;
                uint64_t v20 = v44;
                if ((id)(v46 + 1) == v47)
                {
                  id v37 = [v43 countByEnumeratingWithState:&v60 objects:v69 count:16];
                  uint64_t v20 = v44;
                  char v21 = 0;
                  char v14 = 0;
                  id v47 = v37;
                  if (!v37) {
                    goto LABEL_37;
                  }
                  goto LABEL_10;
                }
                goto LABEL_11;
              }
            }
          }
          if ((v21 & 1) == 0) {
            goto LABEL_33;
          }
          char v14 = 1;
        }
LABEL_37:
        id v38 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v13, @"slidesToCrop", a4, @"document", objc_msgSend(v51, "copy"), @"options", 0);
        [(MPCropController *)self batchCrop:v38];

        v16 = (char *)v16 + 1;
      }
      while (v16 != v45);
      id v39 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
      id v45 = v39;
    }
    while (v39);
    id v9 = v40;
    if (v54)
    {
      [v54 waitUntilAllOperationsAreFinished];
    }
  }

  [(MPCropController *)self cleanup];
  [(NSRecursiveLock *)self->_cropLock unlock];
}

- (void)_applyCropToSlidesInEffectContainersWithArguments:(id)a3
{
  objc_msgSend(+[MPCropController sharedController](MPCropController, "sharedController"), "applyCropToSlidesInEffectContainers:inDocument:withOptions:", objc_msgSend(a3, "objectForKey:", @"effectContainers"), objc_msgSend(a3, "objectForKey:", @"document"), objc_msgSend(a3, "objectForKey:", @"options"));
}

- (void)applyCropToSlidesInEffectContainers:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  [(NSRecursiveLock *)self->_cropLock lock];
  id v27 = a4;
  long long v28 = self;
  id v9 = a5;
  [(MPCropController *)self setupWithDocument:a4 andOptions:a5];
  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = a3;
  id v25 = [a3 countByEnumeratingWithState:&v33 objects:v38 count:16];
  id v11 = 0;
  if (v25)
  {
    uint64_t v24 = *(void *)v34;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v12;
        id v13 = *(void **)(*((void *)&v33 + 1) + 8 * v12);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v14 = [v13 effects];
        id v15 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v30;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v30 != v17) {
                objc_enumerationMutation(v14);
              }
              id v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              objc_msgSend(v10, "addObjectsFromArray:", objc_msgSend(v19, "slides"));
              objc_msgSend(v10, "addObjectsFromArray:", objc_msgSend(v19, "secondarySlides"));
              if ((unint64_t)[v10 count] >= 0x7D1)
              {
                if (!v11)
                {
                  id v11 = objc_alloc_init((Class)NSOperationQueue);
                  [v11 setMaxConcurrentOperationCount:1];
                }
                id v20 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v10, @"slidesToCrop", v27, @"document", v9, @"options", 0);
                id v21 = [objc_alloc((Class)NSInvocationOperation) initWithTarget:v28 selector:"batchCrop:" object:v20];
                [v21 setQualityOfService:9];
                [v21 setQueuePriority:-8];
                [v11 addOperation:v21];

                id v10 = objc_alloc_init((Class)NSMutableArray);
              }
            }
            id v16 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v16);
        }
        uint64_t v12 = v26 + 1;
      }
      while ((id)(v26 + 1) != v25);
      id v25 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v25);
  }
  id v22 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v10, @"slidesToCrop", v27, @"document", v9, @"options", 0);
  [(MPCropController *)v28 batchCrop:v22];

  if (v11)
  {
    [v11 waitUntilAllOperationsAreFinished];
  }
  [(MPCropController *)v28 cleanup];
  [(NSRecursiveLock *)v28->_cropLock unlock];
}

- (void)applyCropToSlide:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  [(NSRecursiveLock *)self->_cropLock lock];
  if (!a5) {
    a5 = objc_msgSend(objc_msgSend(a4, "documentLayerGroup"), "authoringOptions");
  }
  [(MPCropController *)self setupWithDocument:a4 andOptions:a5];
  id v9 = objc_msgSend(objc_msgSend(a3, "nearestLayer"), "zIndex");
  id v10 = [a5 mutableCopy];
  if (v9 != (id)-1)
  {
    id v11 = +[NSNumber numberWithInteger:v9];
    [v10 setObject:v11 forKey:kMPAuthoringLayerIndex];
  }
  [(MPCropController *)self applyCropToSlide:a3 withOptions:v10];
  [(MPCropController *)self cleanup];
  cropLock = self->_cropLock;
  [(NSRecursiveLock *)cropLock unlock];
}

- (void)setupWithDocument:(id)a3 andOptions:(id)a4
{
  authoredDocument = self->_authoredDocument;
  if (authoredDocument)
  {

    self->_authoredDocument = 0;
  }
  self->_authoredDocument = (MPDocument *)a3;
}

- (void)cleanup
{
  self->_authoredDocument = 0;
}

- (void)applyCropToSlide:(id)a3 withOptions:(id)a4
{
  v4 = (NSMutableDictionary *)a4;
  +[MPAuthoringUtilities kenBurnsLikelihoodFromOptions:a4];
  double v8 = v7;
  unsigned __int8 v9 = +[MPAuthoringUtilities kenBurnsBreaksFromOptions:v4];
  -[MPDocument resolutionForPath:](self->_authoredDocument, "resolutionForPath:", [a3 path]);
  double v12 = v10 / v11;
  if (v10 / v11 >= 0.5 && v12 <= 2.0)
  {
    BOOL v20 = 0;
  }
  else
  {
    +[MPAuthoringUtilities aspectRatioFromOptions:v4];
    double v15 = v14;
    id v16 = [a3 parentEffect];
    objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "mediaAspectRatioForEffectID:usingAttributes:atIndex:defaultAspectRatio:imageAspectRatio:", objc_msgSend(v16, "effectID"), objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "attributesForEffectID:andPresetID:", objc_msgSend(v16, "effectID"), objc_msgSend(v16, "presetID")), objc_msgSend(a3, "index"), v15, v12);
    double v18 = v12 / v17;
    double v19 = v17 / v12;
    if (v12 >= 1.0) {
      double v19 = v18;
    }
    BOOL v20 = v19 >= 1.1;
  }
  if (v8 == 1.0) {
    char v21 = 1;
  }
  else {
    char v21 = v9 & v20;
  }
  int64_t v22 = +[MPAuthoringUtilities kenBurnsLevelFromOptions:v4];
  id v23 = [a3 parentEffect];
  if (!v23
    || (uint64_t v24 = v23,
        id v25 = [v23 effectID],
        id v26 = [v24 presetID],
        id v27 = +[MPAuthoringUtilities styleFromOptions:v4],
        objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "defaultAutoKenBurnsLikelihoodForEffect:withPreset:ofStyle:", v25, v26, v27), v28 <= -1.0))
  {
    if (v21) {
      goto LABEL_19;
    }
LABEL_28:
    [(MPCropController *)self applyStationaryCropToSlide:a3 withOptions:v4];
    return;
  }
  if (v28 == 1.0) {
    char v21 = 1;
  }
  id v29 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "defaultAutoKenBurnsLevelForEffect:withPreset:ofStyle:", v25, v26, v27);
  if ((v21 & 1) == 0) {
    goto LABEL_28;
  }
  int64_t v22 = (int64_t)v29;
LABEL_19:
  id v30 = [(NSMutableDictionary *)v4 objectForKey:kMPAuthoringSeed];
  if (v30) {
    srandom(objc_msgSend(objc_msgSend(a3, "path"), "hash")+ objc_msgSend(v30, "unsignedIntegerValue"));
  }
  if (+[MPAuthoringUtilities useROIFromOptions:v4])
  {
    long long v31 = -[MPDocument regionsOfInterestForPath:detect:](self->_authoredDocument, "regionsOfInterestForPath:detect:", [a3 path], +[MPAuthoringUtilities performFaceDetectionFromOptions:](MPAuthoringUtilities, "performFaceDetectionFromOptions:", v4));
    if (v31) {
      long long v31 = (char *)[v31 count];
    }
    if (v20) {
      goto LABEL_25;
    }
  }
  else
  {
    long long v31 = 0;
    if (v20)
    {
LABEL_25:
      [(MPCropController *)self applyAnimatedCropToBreakSlide:a3 withOptions:v4];
      return;
    }
  }
  if (!v22)
  {
    v4 = +[NSMutableDictionary dictionaryWithDictionary:v4];
    LODWORD(v32) = 0.5;
    long long v33 = +[NSNumber numberWithFloat:v32];
    [(NSMutableDictionary *)v4 setObject:v33 forKey:kMPAuthoringKenBurnsPanFactor];
    LODWORD(v34) = 1067030938;
    long long v35 = +[NSNumber numberWithFloat:v34];
    [(NSMutableDictionary *)v4 setObject:v35 forKey:kMPAuthoringKenBurnsMaxZoom];
LABEL_39:
    [(MPCropController *)self applyAnimatedCropWithROIsToSlide:a3 withOptions:v4];
    return;
  }
  if ((uint64_t)v31 >= 2)
  {
    [(MPCropController *)self applyMultiFaceAnimatedCropToSlide:a3 withOptions:v4];
    return;
  }
  if (v31 == (unsigned char *)&dword_0 + 1) {
    goto LABEL_39;
  }
  [(MPCropController *)self applyAnimatedCropToSlide:a3 withOptions:v4];
}

- (void)applyAnimatedCropToSlide:(id)a3 withOptions:(id)a4
{
}

- (void)applyAnimatedCropWithROIsToSlide:(id)a3 withOptions:(id)a4
{
  id v7 = -[MPDocument regionsOfInterestForPath:detect:](self->_authoredDocument, "regionsOfInterestForPath:detect:", [a3 path], +[MPAuthoringUtilities performFaceDetectionFromOptions:](MPAuthoringUtilities, "performFaceDetectionFromOptions:", a4));
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  *(CGFloat *)&v29[16] = width;
  *(CGFloat *)&v29[24] = height;
  *(CGFloat *)id v29 = CGRectZero.origin.x;
  *(CGFloat *)&v29[8] = y;
  if (v7)
  {
    double v12 = v7;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v13 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
    *(CGFloat *)&v29[16] = width;
    *(CGFloat *)&v29[24] = height;
    *(CGFloat *)id v29 = CGRectZero.origin.x;
    *(CGFloat *)&v29[8] = y;
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v31;
      *(CGFloat *)&v29[16] = width;
      *(CGFloat *)&v29[24] = height;
      *(CGFloat *)id v29 = CGRectZero.origin.x;
      *(CGFloat *)&v29[8] = y;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v12);
          }
          CGRect v35 = CGRectFromString((NSString *)[*(id *)(*((void *)&v30 + 1) + 8 * i) objectForKey:kMPMetaDataRegionOfInterestBounds]);
          CGFloat v17 = v35.origin.x;
          CGFloat v18 = v35.origin.y;
          CGFloat v19 = v35.size.width;
          double v20 = v35.size.height;
          BOOL v21 = v35.size.width == 0.0;
          uint64_t v22 = *(void *)&v29[16];
          uint64_t v23 = *(void *)&v29[24];
          uint64_t v24 = *(void *)v29;
          uint64_t v25 = *(void *)&v29[8];
          if (!v21 && v20 != 0.0)
          {
            v37.origin.CGFloat x = CGRectZero.origin.x;
            v37.origin.CGFloat y = y;
            v37.size.CGFloat width = width;
            v37.size.CGFloat height = height;
            if (CGRectEqualToRect(*(CGRect *)&v24, v37))
            {
              *(CGFloat *)&v29[16] = v19;
              *(double *)&v29[24] = v20;
              *(CGFloat *)id v29 = v17;
              *(CGFloat *)&v29[8] = v18;
            }
            else
            {
              v36.origin.CGFloat x = v17;
              v36.origin.CGFloat y = v18;
              v36.size.CGFloat width = v19;
              v36.size.CGFloat height = v20;
              v38.origin.CGFloat x = CGRectZero.origin.x;
              v38.origin.CGFloat y = y;
              v38.size.CGFloat width = width;
              v38.size.CGFloat height = height;
              if (!CGRectEqualToRect(v36, v38))
              {
                v39.origin.CGFloat x = v17;
                v39.origin.CGFloat y = v18;
                v39.size.CGFloat width = v19;
                v39.size.CGFloat height = v20;
                *(CGRect *)id v29 = CGRectUnion(*(CGRect *)v29, v39);
              }
            }
          }
          CGFloat x = CGRectZero.origin.x;
        }
        id v14 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v14);
    }
  }
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  BOOL v26 = CGRectEqualToRect(*(CGRect *)v29, v40);
  double v27 = 0.5;
  double v28 = 0.5;
  if (!v26) {
    +[MPAuthoringUtilities kbCenterPointFromRect:](MPAuthoringUtilities, "kbCenterPointFromRect:", *(double *)v29, *(double *)&v29[8], *(double *)&v29[16], *(double *)&v29[24]);
  }
  -[MPCropController applyAnimatedCropToSlide:withOptions:centeredAt:alwaysZoomIn:](self, "applyAnimatedCropToSlide:withOptions:centeredAt:alwaysZoomIn:", a3, a4, 1, v27, v28);
}

- (void)applyStationaryCropToSlide:(id)a3 withOptions:(id)a4
{
  [a3 removeAnimationPathForKey:@"scale"];
  [a3 removeAnimationPathForKey:@"center"];
  [a3 removeAnimationPathForKey:@"angle"];
  unint64_t v7 = +[MPAuthoringUtilities croppingModeFromOptions:a4];
  if (v7 == 1)
  {
    [a3 setSizingMode:@"Scale to Fit"];
    double v8 = 0.5;
LABEL_16:
    double v16 = 0.5;
    goto LABEL_17;
  }
  unint64_t v9 = v7;
  -[MPDocument resolutionForPath:](self->_authoredDocument, "resolutionForPath:", [a3 path]);
  double v11 = v10;
  double v13 = v12;
  double v14 = v10 / v12;
  double v8 = 0.5;
  if (v10 / v12 >= 0.5 && v14 <= 2.0)
  {
    if (v9 == 2 && v14 <= 1.0)
    {
      CGFloat v17 = kMPSlideSizingModeFit;
    }
    else
    {
      if (v9 != 4) {
        goto LABEL_22;
      }
      CGFloat v17 = kMPSlideSizingModeBestFit;
    }
    [a3 setSizingMode:*v17];
    goto LABEL_16;
  }
  if (v9) {
    goto LABEL_16;
  }
  double v16 = 0.5;
  if (objc_msgSend(objc_msgSend(a3, "sizingMode"), "isEqual:", @"Scale to Fit"))
  {
LABEL_22:
    id v76 = [a3 parentEffect];
    id v18 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "imageInputInfoForEffectID:", objc_msgSend(v76, "effectID"));
    CGFloat v19 = (char *)[v18 count] - 1;
    double v20 = (char *)[a3 index];
    if (v19 >= v20) {
      BOOL v21 = v20;
    }
    else {
      BOOL v21 = v19;
    }
    id v22 = [v18 objectAtIndex:v21];
    id v23 = [v22 objectForKey:@"kenBurnsType"];
    unsigned int v24 = [v23 hasSuffix:@"to Fit"];
    unsigned int v25 = [a3 hasMovie];
    if (!+[MPAuthoringUtilities useROIFromOptions:a4]
      || (v25 & 1) != 0
      || (v24 & 1) != 0)
    {
      if (v24)
      {
        [a3 setSizingMode:v23];
        char v31 = 1;
        goto LABEL_53;
      }
    }
    else
    {
      BOOL v26 = (NSString *)[a3 userInfoAttributeForKey:@"pickedROIRect"];
      if (v26)
      {
        CGRect v83 = CGRectFromString(v26);
        CGRect v84 = CGRectInset(v83, -0.0500000007, -0.0500000007);
        double x = v84.origin.x;
        double y = v84.origin.y;
        double width = v84.size.width;
        double height = v84.size.height;
        v91.origin.double x = CGRectZero.origin.x;
        v91.origin.double y = CGRectZero.origin.y;
        v91.size.double width = CGRectZero.size.width;
        v91.size.double height = CGRectZero.size.height;
        if (CGRectEqualToRect(v84, v91))
        {
          char v31 = 0;
          double v8 = 0.5;
LABEL_53:
          double v16 = 0.5;
LABEL_54:
          if (v25
            && +[MPAuthoringUtilities fitMoviesWhenPossibleFromOptions:](MPAuthoringUtilities, "fitMoviesWhenPossibleFromOptions:", a4)&& objc_msgSend(objc_msgSend(a3, "parentEffect"), "countOfSlides") == (char *)&dword_0 + 1&& (+[MPAuthoringUtilities croppingModeForFitMoviesFromOptions:](MPAuthoringUtilities, "croppingModeForFitMoviesFromOptions:", a4) & 0x80000000) == 0)
          {
            CFStringRef v51 = @"Scale to Fit";
          }
          else
          {
            if (v9 == 3) {
              char v52 = 1;
            }
            else {
              char v52 = v31;
            }
            if (v52) {
              goto LABEL_17;
            }
            CFStringRef v51 = @"Crop to Fit";
          }
          [a3 setSizingMode:v51];
          goto LABEL_17;
        }
        +[MPAuthoringUtilities kbCenterPointFromRect:](MPAuthoringUtilities, "kbCenterPointFromRect:", x, y, width, height);
        double v8 = 1.0;
        double v16 = 1.0;
        if (v53 > 1.0)
        {
LABEL_78:
          char v31 = 0;
          if (v54 <= v8)
          {
            if (v54 >= 0.0) {
              double v8 = v54;
            }
            else {
              double v8 = 0.0;
            }
          }
          goto LABEL_54;
        }
LABEL_66:
        double v16 = v53;
        if (v53 < 0.0) {
          double v16 = 0.0;
        }
        goto LABEL_78;
      }
      if ((objc_msgSend(objc_msgSend(v22, "objectForKey:", @"fullImage"), "BOOLValue") & 1) == 0)
      {
        id v32 = -[MPDocument regionsOfInterestForPath:detect:](self->_authoredDocument, "regionsOfInterestForPath:detect:", [a3 path], +[MPAuthoringUtilities performFaceDetectionFromOptions:](MPAuthoringUtilities, "performFaceDetectionFromOptions:", a4));
        if (v32)
        {
          long long v33 = v32;
          if ([v32 count])
          {
            double v72 = v14;
            double v73 = v13;
            double v74 = v11;
            unsigned int v75 = v25;
            CGFloat v34 = CGRectZero.origin.x;
            CGFloat v35 = CGRectZero.origin.y;
            CGFloat v36 = CGRectZero.size.width;
            CGFloat v37 = CGRectZero.size.height;
            long long v80 = 0u;
            long long v81 = 0u;
            memset(&rect1[1], 0, 32);
            id v38 = [v33 countByEnumeratingWithState:&rect1[1] objects:v82 count:16];
            if (!v38)
            {
              CGFloat v49 = CGRectZero.origin.x;
              CGFloat v41 = v35;
              CGFloat v42 = v36;
              CGFloat v50 = v37;
LABEL_69:
              CGFloat v55 = v34;
              CGFloat v56 = v41;
              CGFloat v57 = v42;
              CGRect v90 = CGRectInset(*(CGRect *)(&v50 - 3), -0.0500000007, -0.0500000007);
              double v58 = v90.origin.x;
              double v59 = v90.origin.y;
              double v60 = v90.size.width;
              double v61 = v90.size.height;
              v95.origin.double x = v49;
              v95.origin.double y = v35;
              v95.size.double width = v36;
              v95.size.double height = v37;
              double v62 = 0.5;
              double v63 = 0.5;
              if (!CGRectEqualToRect(v90, v95))
              {
                +[MPAuthoringUtilities kbCenterPointFromRect:](MPAuthoringUtilities, "kbCenterPointFromRect:", v58, v59, v60, v61);
                double v63 = v64;
                double v62 = v65;
              }
              +[MPAuthoringUtilities aspectRatioFromOptions:a4];
              double v67 = v66;
              unsigned int v68 = objc_msgSend(objc_msgSend(v22, "objectForKey:", @"needsImageSize"), "BOOLValue");
              rect1[0] = +[MPEffectManager sharedManager];
              id v69 = [v76 effectID];
              if (v68) {
                objc_msgSend(rect1[0], "mediaAspectRatioForEffectID:usingAttributes:atIndex:defaultAspectRatio:imageAspectRatio:", v69, objc_msgSend(v76, "effectAttributes"), objc_msgSend(a3, "index"), v67, v72);
              }
              else {
                objc_msgSend(rect1[0], "mediaAspectRatioForEffectID:usingPresetID:atIndex:defaultAspectRatio:", v69, objc_msgSend(objc_msgSend(a3, "parentEffect"), "presetID"), objc_msgSend(a3, "index"), v67);
              }
              if (v70 == 9.22337204e18) {
                double v71 = v67;
              }
              else {
                double v71 = v70;
              }
              -[MPCropController checkFarApartROIs:withImageSize:visibleAspectRatio:roiCenter:](self, "checkFarApartROIs:withImageSize:visibleAspectRatio:roiCenter:", v33, v74, v73, v71, v63, v62);
              double v8 = 1.0;
              double v16 = 1.0;
              unsigned int v25 = v75;
              if (v53 > 1.0) {
                goto LABEL_78;
              }
              goto LABEL_66;
            }
            id v39 = v38;
            uint64_t v40 = *(void *)rect1[3];
            CGFloat v77 = v36;
            CGFloat v78 = v35;
            CGFloat v41 = v35;
            CGFloat v42 = v36;
            CGFloat v43 = v37;
LABEL_38:
            uint64_t v44 = 0;
            while (1)
            {
              rect1[0] = *(id *)&v34;
              if (*(void *)rect1[3] != v40) {
                objc_enumerationMutation(v33);
              }
              CGRect v85 = CGRectFromString((NSString *)[*((id *)rect1[2] + v44) objectForKey:kMPMetaDataRegionOfInterestBounds]);
              if (v85.size.width == 0.0) {
                goto LABEL_46;
              }
              CGFloat v45 = v85.size.height;
              if (v85.size.height == 0.0) {
                goto LABEL_46;
              }
              CGFloat v34 = v85.origin.x;
              CGFloat v46 = v85.origin.y;
              CGFloat v47 = v85.size.width;
              *(id *)&v86.origin.double x = rect1[0];
              v86.origin.double y = v41;
              v86.size.double width = v42;
              v86.size.double height = v43;
              v92.origin.double x = CGRectZero.origin.x;
              v92.origin.double y = v78;
              v92.size.double width = v77;
              v92.size.double height = v37;
              if (!CGRectEqualToRect(v86, v92)) {
                break;
              }
              CGFloat v41 = v46;
              CGFloat v42 = v47;
              CGFloat v43 = v45;
LABEL_47:
              if (v39 == (id)++v44)
              {
                id v48 = [v33 countByEnumeratingWithState:&rect1[1] objects:v82 count:16];
                id v39 = v48;
                if (!v48)
                {
                  CGFloat v35 = v78;
                  CGFloat v49 = CGRectZero.origin.x;
                  CGFloat v50 = v43;
                  CGFloat v36 = v77;
                  goto LABEL_69;
                }
                goto LABEL_38;
              }
            }
            v87.origin.double x = v34;
            v87.origin.double y = v46;
            v87.size.double width = v47;
            v87.size.double height = v45;
            v93.origin.double x = CGRectZero.origin.x;
            v93.origin.double y = v78;
            v93.size.double width = v77;
            v93.size.double height = v37;
            if (!CGRectEqualToRect(v87, v93))
            {
              v88.origin.double y = v41;
              *(id *)&v88.origin.double x = rect1[0];
              v88.size.double height = v43;
              v88.size.double width = v42;
              v94.origin.double x = v34;
              v94.origin.double y = v46;
              v94.size.double width = v47;
              v94.size.double height = v45;
              CGRect v89 = CGRectUnion(v88, v94);
              CGFloat v34 = v89.origin.x;
              CGFloat v41 = v89.origin.y;
              CGFloat v42 = v89.size.width;
              CGFloat v43 = v89.size.height;
              goto LABEL_47;
            }
LABEL_46:
            CGFloat v34 = *(double *)rect1;
            goto LABEL_47;
          }
        }
      }
    }
    char v31 = 0;
    goto LABEL_53;
  }
LABEL_17:
  if (objc_msgSend(objc_msgSend(a3, "sizingMode"), "isEqualToString:", @"Crop to Fit")
    && (v16 != 0.5 || v8 != 0.5))
  {
    objc_msgSend(a3, "setCenter:", v16, v8);
  }
}

- (CGPoint)checkFarApartROIs:(id)a3 withImageSize:(CGSize)a4 visibleAspectRatio:(double)a5 roiCenter:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double height = a4.height;
  double width = a4.width;
  +[MPAuthoringUtilities rectToFitIn:withAspectRatio:](MPAuthoringUtilities, "rectToFitIn:withAspectRatio:", 0.0, 0.0, a4.width, a4.height, a5);
  double v13 = width * x - v12 * 0.5;
  double v14 = height * y - v11 * 0.5;
  BOOL v15 = v12 + v13 <= width;
  double v167 = v11;
  double v168 = v12;
  double v16 = width - v12;
  double v138 = v16;
  if (v15) {
    double v16 = v13;
  }
  if (v13 >= 0.0) {
    double v17 = v16;
  }
  else {
    double v17 = 0.0;
  }
  double v18 = height - v11;
  double v137 = height - v11;
  if (v11 + v14 <= height) {
    double v18 = height * y - v11 * 0.5;
  }
  long long v179 = 0u;
  long long v180 = 0u;
  double v136 = 0.0;
  if (v14 >= 0.0) {
    double v19 = v18;
  }
  else {
    double v19 = 0.0;
  }
  long long v177 = 0uLL;
  long long v178 = 0uLL;
  id v20 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v177, v183, 16, v18);
  CGFloat v21 = CGRectZero.size.width;
  CGFloat v22 = CGRectZero.size.height;
  CGFloat v165 = v22;
  CGFloat v166 = v21;
  if (!v20) {
    goto LABEL_21;
  }
  id v23 = v20;
  double v160 = y;
  double r1 = x;
  uint64_t v24 = *(void *)v178;
  LOBYTE(v25) = 1;
  do
  {
    for (i = 0; i != v23; i = (char *)i + 1)
    {
      if (*(void *)v178 != v24) {
        objc_enumerationMutation(a3);
      }
      CGRect v185 = CGRectFromString((NSString *)[*(id *)(*((void *)&v177 + 1) + 8 * i) objectForKey:kMPMetaDataRegionOfInterestBounds]);
      double v27 = width * v185.origin.x;
      double v28 = height * v185.origin.y;
      double v29 = width * v185.size.width;
      double v30 = height * v185.size.height;
      v185.origin.double x = width * v185.origin.x;
      v185.origin.double y = height * v185.origin.y;
      v185.size.double width = width * v185.size.width;
      v185.size.double height = height * v185.size.height;
      v204.origin.double x = v17;
      v204.origin.double y = v19;
      v204.size.double height = v167;
      v204.size.double width = v168;
      CGRect v186 = CGRectIntersection(v185, v204);
      BOOL IsNull = CGRectIsNull(v186);
      double v33 = v165;
      double v32 = v166;
      if (!IsNull)
      {
        v187.origin.double x = v27;
        v187.origin.double y = v28;
        v187.size.double width = v29;
        v187.size.double height = v30;
        v205.origin.double x = v17;
        v205.origin.double y = v19;
        v205.size.double height = v167;
        v205.size.double width = v168;
        *(CGRect *)(&v32 - 2) = CGRectIntersection(v187, v205);
      }
      int v25 = (v33 * v32 / (v29 * v30) <= 0.5) & v25;
    }
    id v23 = [a3 countByEnumeratingWithState:&v177 objects:v183 count:16];
  }
  while (v23);
  CGFloat v22 = v165;
  CGFloat v21 = v166;
  double v35 = v160;
  double v34 = r1;
  if (v25)
  {
LABEL_21:
    double v146 = -v167;
    double v147 = -v168;
    CGFloat v36 = CGRectZero.origin.x;
    CGFloat v37 = CGRectZero.origin.y;
    long long v175 = 0u;
    long long v176 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    id v38 = [a3 countByEnumeratingWithState:&v173 objects:v182 count:16];
    CGFloat v142 = v21;
    CGFloat v143 = v22;
    CGFloat v133 = v37;
    CGFloat r1a = v37;
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = *(void *)v174;
      double v41 = CGRectZero.origin.x;
      CGFloat v42 = v165;
      double v43 = v166;
      double v136 = 0.0;
LABEL_23:
      uint64_t v44 = 0;
      CGFloat v45 = v41;
      CGFloat r1a = v37;
      CGFloat v46 = v43;
      while (1)
      {
        if (*(void *)v174 != v40) {
          objc_enumerationMutation(a3);
        }
        CGRect v188 = CGRectFromString((NSString *)[*(id *)(*((void *)&v173 + 1) + 8 * (void)v44) objectForKey:kMPMetaDataRegionOfInterestBounds]);
        double v47 = v188.size.height;
        double v41 = v45;
        double v48 = r1a;
        double v49 = v46;
        CGFloat v50 = v42;
        CGFloat v142 = v46;
        CGFloat v143 = v42;
        double v161 = v45;
        if (v188.size.width != 0.0)
        {
          double v41 = v45;
          double v48 = r1a;
          double v49 = v46;
          CGFloat v50 = v42;
          if (v47 != 0.0)
          {
            double v41 = v188.origin.x;
            CGFloat v152 = v47;
            CGFloat rect1 = v188.origin.y;
            CGFloat v148 = v188.size.width;
            v189.origin.double x = v45;
            v189.size.double width = v46;
            v189.size.double height = v42;
            v206.origin.double x = CGRectZero.origin.x;
            v206.origin.double y = v133;
            v206.size.double width = v166;
            v189.origin.double y = r1a;
            v206.size.double height = v165;
            if (CGRectEqualToRect(v189, v206))
            {
              CGFloat v50 = v152;
              double v48 = rect1;
              double v49 = v148;
            }
            else
            {
              v190.origin.double x = v41;
              v190.origin.double y = rect1;
              v190.size.double width = v148;
              v190.size.double height = v152;
              v207.origin.double x = CGRectZero.origin.x;
              v207.origin.double y = v133;
              v207.size.double width = v166;
              v207.size.double height = v165;
              BOOL v51 = CGRectEqualToRect(v190, v207);
              double v52 = v41;
              CGFloat v53 = v148;
              CGFloat v54 = v152;
              CGFloat v55 = rect1;
              double v41 = v45;
              double v48 = r1a;
              double v49 = v46;
              CGFloat v50 = v42;
              if (!v51)
              {
                v191.origin.double x = v45;
                v191.origin.double y = r1a;
                v191.size.double width = v46;
                v191.size.double height = v42;
                *(CGRect *)(&v50 - 3) = CGRectUnion(v191, *(CGRect *)&v52);
                double v41 = v56;
                double v48 = v57;
                double v49 = v58;
              }
            }
          }
        }
        double v59 = v50;
        +[MPAuthoringUtilities kbCenterPointFromRect:](MPAuthoringUtilities, "kbCenterPointFromRect:", v41, v48, v49);
        double v62 = width * v60 + v147 * 0.5;
        double v63 = height * v61 + v146 * 0.5;
        double v65 = v167;
        double v64 = v168;
        double v66 = v138;
        if (v168 + v62 <= width) {
          double v66 = v62;
        }
        if (v62 < 0.0) {
          double v66 = 0.0;
        }
        double v67 = v137;
        if (v167 + v63 <= height) {
          double v67 = v63;
        }
        if (v63 >= 0.0) {
          double v68 = v67;
        }
        else {
          double v68 = 0.0;
        }
        double v149 = v49;
        double v153 = v48;
        double v69 = height * v48;
        double v70 = width * v49;
        double rect1a = v59;
        double v71 = height * v59;
        CGFloat v72 = v66;
        v192.origin.double x = width * v41;
        v192.origin.double y = v69;
        v192.size.double width = v70;
        v192.size.double height = v71;
        CGFloat v73 = v72;
        CGFloat r2 = v68;
        CGRect v193 = CGRectIntersection(v192, *(CGRect *)(&v64 - 2));
        BOOL v74 = CGRectIsNull(v193);
        double v76 = v165;
        double v75 = v166;
        if (!v74)
        {
          v194.origin.double x = width * v41;
          v194.origin.double y = v69;
          v194.size.double width = v70;
          v194.size.double height = v71;
          v208.origin.double x = v72;
          v208.origin.double y = r2;
          v208.size.double height = v167;
          v208.size.double width = v168;
          *(CGRect *)(&v75 - 2) = CGRectIntersection(v194, v208);
        }
        double v77 = v75 * v76 / (v70 * v71);
        double v43 = v149;
        CGFloat v37 = v153;
        CGFloat v42 = rect1a;
        CGFloat v36 = v161;
        if (v77 != 1.0) {
          break;
        }
        uint64_t v44 = (char *)v44 + 1;
        CGFloat v45 = v41;
        double v136 = 1.0;
        CGFloat r1a = v153;
        CGFloat v46 = v149;
        if (v39 == v44)
        {
          CGFloat v42 = rect1a;
          id v39 = [a3 countByEnumeratingWithState:&v173 objects:v182 count:16];
          double v136 = 1.0;
          CGFloat v142 = v149;
          CGFloat v143 = rect1a;
          CGFloat r1a = v153;
          CGFloat v36 = v41;
          if (v39) {
            goto LABEL_23;
          }
          break;
        }
      }
    }
    id v78 = [a3 reverseObjectEnumerator];
    id v79 = [v78 nextObject];
    CGFloat v162 = v36;
    if (v79)
    {
      double v131 = 0.0;
      CGFloat v80 = v165;
      CGFloat v81 = v166;
      CGFloat v82 = CGRectZero.origin.x;
      CGFloat v154 = v166;
      CGFloat rect1b = CGRectZero.origin.x;
      CGFloat r2a = v133;
      CGFloat v150 = v133;
      CGFloat v83 = v165;
      do
      {
        CGRect v195 = CGRectFromString((NSString *)[v79 objectForKey:kMPMetaDataRegionOfInterestBounds]);
        double v84 = v195.size.height;
        CGFloat v85 = v83;
        double v86 = v154;
        double v87 = rect1b;
        double v88 = v150;
        double v139 = v81;
        double v140 = v80;
        if (v195.size.width != 0.0)
        {
          double v87 = v82;
          double v88 = r2a;
          double v86 = v81;
          CGFloat v85 = v80;
          if (v84 != 0.0)
          {
            CGFloat v151 = v195.origin.x;
            CGFloat v155 = v195.origin.y;
            CGFloat rect1c = v195.size.width;
            CGFloat v134 = v84;
            v196.origin.double x = v82;
            v196.origin.double y = r2a;
            v196.size.double width = v81;
            v196.size.double height = v80;
            v209.origin.double x = CGRectZero.origin.x;
            v209.origin.double y = v133;
            v209.size.double width = v166;
            v209.size.double height = v165;
            if (CGRectEqualToRect(v196, v209))
            {
              double v87 = v151;
              double v88 = v155;
              double v86 = rect1c;
              CGFloat v85 = v134;
            }
            else
            {
              v197.origin.double x = v151;
              v197.origin.double y = v155;
              v197.size.double width = rect1c;
              v197.size.double height = v134;
              v210.origin.double x = CGRectZero.origin.x;
              v210.origin.double y = v133;
              v210.size.double width = v166;
              v210.size.double height = v165;
              BOOL v89 = CGRectEqualToRect(v197, v210);
              CGFloat v90 = v151;
              CGFloat v91 = v155;
              CGFloat v92 = rect1c;
              CGFloat v93 = v134;
              CGFloat v94 = v82;
              double v87 = v82;
              double v88 = r2a;
              double v86 = v81;
              CGFloat v85 = v80;
              if (!v89)
              {
                CGFloat v95 = r2a;
                CGFloat v96 = v81;
                CGFloat v97 = v80;
                *(CGRect *)(&v85 - 3) = CGRectUnion(*(CGRect *)&v94, *(CGRect *)&v90);
                double v87 = v98;
                double v88 = v99;
                double v86 = v100;
              }
            }
          }
        }
        double v135 = v85;
        +[MPAuthoringUtilities kbCenterPointFromRect:](MPAuthoringUtilities, "kbCenterPointFromRect:", v87, v88, v86);
        double v103 = width * v102 + v147 * 0.5;
        double v104 = 0.0;
        double v105 = 0.0;
        double v106 = v86;
        if (v103 >= 0.0)
        {
          double v105 = v103;
          if (v168 + v103 > width) {
            double v105 = v138;
          }
        }
        double v107 = height * v101 + v146 * 0.5;
        if (v107 >= 0.0)
        {
          double v104 = height * v101 + v146 * 0.5;
          if (v167 + v107 > height) {
            double v104 = v137;
          }
        }
        CGFloat v154 = v86;
        CGFloat rect1b = v87;
        double v108 = width * v87;
        CGFloat v150 = v88;
        double v109 = height * v88;
        double v110 = width * v106;
        CGFloat v83 = v135;
        v198.origin.double x = v108;
        v198.origin.double y = height * v88;
        v198.size.double width = width * v106;
        v198.size.double height = height * v135;
        double v111 = v105;
        CGFloat v112 = v104;
        CGFloat v132 = v105;
        double v114 = v167;
        double v113 = v168;
        CGRect v199 = CGRectIntersection(v198, *(CGRect *)(&v104 - 1));
        BOOL v115 = CGRectIsNull(v199);
        double v117 = v165;
        double v116 = v166;
        if (!v115)
        {
          v200.origin.double x = v108;
          v200.origin.double y = v109;
          v200.size.double width = v110;
          v200.size.double height = height * v135;
          v211.origin.double x = v132;
          v211.origin.double y = v112;
          v211.size.double height = v167;
          v211.size.double width = v168;
          *(CGRect *)(&v116 - 2) = CGRectIntersection(v200, v211);
        }
        double v118 = v116 * v117 / (v110 * (height * v135));
        CGFloat v81 = v139;
        CGFloat v80 = v140;
        if (v118 != 1.0) {
          break;
        }
        id v79 = [v78 nextObject];
        double v131 = 1.0;
        CGFloat v80 = v135;
        CGFloat v81 = v154;
        CGFloat r2a = v150;
        CGFloat v82 = rect1b;
      }
      while (v79);
    }
    else
    {
      double v131 = 0.0;
      CGFloat v82 = CGRectZero.origin.x;
      CGFloat r2a = v133;
      CGFloat v80 = v165;
      CGFloat v81 = v166;
    }
    CGFloat v141 = v80;
    v201.origin.double x = v162;
    v201.origin.double y = r1a;
    v201.size.double width = v142;
    v201.size.double height = v143;
    double v120 = v133;
    CGFloat v119 = CGRectZero.origin.x;
    v212.origin.double x = CGRectZero.origin.x;
    v212.origin.double y = v133;
    CGFloat v122 = v165;
    CGFloat v121 = v166;
    v212.size.double width = v166;
    v212.size.double height = v165;
    if (!CGRectEqualToRect(v201, v212)) {
      goto LABEL_78;
    }
    v202.origin.double x = v82;
    v202.origin.double y = r2a;
    v202.size.double width = v81;
    v202.size.double height = v141;
    v213.origin.double x = CGRectZero.origin.x;
    v213.origin.double y = v133;
    v213.size.double width = v166;
    v213.size.double height = v165;
    if (CGRectEqualToRect(v202, v213))
    {
      long long v171 = 0u;
      long long v172 = 0u;
      long long v169 = 0u;
      long long v170 = 0u;
      id v123 = [a3 countByEnumeratingWithState:&v169 objects:v181 count:16];
      if (v123)
      {
        id v124 = v123;
        uint64_t v125 = *(void *)v170;
        do
        {
          for (j = 0; j != v124; j = (char *)j + 1)
          {
            if (*(void *)v170 != v125) {
              objc_enumerationMutation(a3);
            }
            CGRect v203 = CGRectFromString((NSString *)[*(id *)(*((void *)&v169 + 1) + 8 * (void)j) objectForKey:kMPMetaDataRegionOfInterestBounds]);
            if (v203.origin.y > v120)
            {
              CGFloat v119 = v203.origin.x;
              double v120 = v203.origin.y;
              CGFloat v121 = v203.size.width;
              CGFloat v122 = v203.size.height;
            }
          }
          id v124 = [a3 countByEnumeratingWithState:&v169 objects:v181 count:16];
        }
        while (v124);
      }
      double v127 = v119;
      double v128 = v120;
      double v129 = v121;
      double v130 = v122;
    }
    else
    {
LABEL_78:
      double v128 = r2a;
      if (v136 <= v131)
      {
        double v127 = v82;
        double v129 = v81;
        double v130 = v141;
      }
      else
      {
        double v127 = v162;
        double v128 = r1a;
        double v129 = v142;
        double v130 = v143;
      }
    }
    +[MPAuthoringUtilities kbCenterPointFromRect:](MPAuthoringUtilities, "kbCenterPointFromRect:", v127, v128, v129, v130);
  }
  result.double y = v35;
  result.double x = v34;
  return result;
}

- (void)applyAnimatedCropToBreakSlide:(id)a3 withOptions:(id)a4
{
  -[MPDocument resolutionForPath:](self->_authoredDocument, "resolutionForPath:", [a3 path]);
  p_info = MRTiledSprite.info;
  double v10 = v8 / v9;
  unint64_t v11 = +[MPAuthoringUtilities croppingModeFromOptions:a4];
  +[MPAuthoringUtilities aspectRatioFromOptions:a4];
  double v13 = v12;
  int64_t v14 = +[MPAuthoringUtilities kenBurnsOffsetTypeFromOptions:a4];
  if (v11 == 1
    || ((CFStringRef v15 = @"Crop to Fit", v11 == 4) || v11 == 2)
    && (v10 < 1.0 ? (v16 = v13 <= 1.0) : (v16 = 1), !v16 || (v10 > 1.0 ? (BOOL v17 = v13 < 1.0) : (BOOL v17 = 0), v17)))
  {
    CFStringRef v15 = @"Scale to Fit";
  }
  id v18 = -[MPDocument regionsOfInterestForPath:](self->_authoredDocument, "regionsOfInterestForPath:", [a3 path]);
  double v19 = v18;
  if (v10 < 1.0)
  {
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v20 = [v18 countByEnumeratingWithState:&v63 objects:v68 count:16];
    if (!v20) {
      goto LABEL_38;
    }
    id v21 = v20;
    int64_t v55 = v14;
    CFStringRef v57 = v15;
    int v22 = 0;
    int v23 = 0;
    uint64_t v24 = *(void *)v64;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v64 != v24) {
          objc_enumerationMutation(v19);
        }
        CGRect v69 = CGRectFromString((NSString *)objc_msgSend(*(id *)(*((void *)&v63 + 1) + 8 * i), "objectForKey:", kMPMetaDataRegionOfInterestBounds, v55, v57));
        v23 |= v69.origin.y < 0.333000004;
        v22 |= v69.origin.y > 0.666000009;
      }
      id v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v63, v68, 16, v69.origin.x);
    }
    while (v21);
    int64_t v14 = v55;
    CFStringRef v15 = v57;
    p_info = (__objc2_class_ro **)(MRTiledSprite + 32);
    if ((v22 ^ v23))
    {
      if ((v22 & 1) == 0) {
        goto LABEL_25;
      }
    }
    else
    {
LABEL_38:
      LOBYTE(v22) = random() & 1;
      if (!(_BYTE)v22)
      {
LABEL_25:
        double v26 = 1.0;
        if ((v22 & 1) == 0)
        {
          double v27 = 0.5;
          double v28 = 0.0;
LABEL_41:
          double v37 = 0.5;
          goto LABEL_47;
        }
LABEL_40:
        double v27 = 0.5;
        double v28 = 1.0;
        goto LABEL_41;
      }
    }
    double v27 = 0.5;
    double v26 = 0.0;
    double v28 = 0.0;
    double v37 = 0.5;
    if ((v22 & 1) == 0) {
      goto LABEL_47;
    }
    goto LABEL_40;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v29 = [v18 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v29)
  {
    id v30 = v29;
    int64_t v56 = v14;
    CFStringRef v58 = v15;
    int v31 = 0;
    int v32 = 0;
    uint64_t v33 = *(void *)v60;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(void *)v60 != v33) {
          objc_enumerationMutation(v19);
        }
        double v35 = COERCE_DOUBLE(CGRectFromString((NSString *)objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * (void)j), "objectForKey:", kMPMetaDataRegionOfInterestBounds, v56, v58)));
        v31 |= v35 < 0.333000004;
        v32 |= v35 > 0.666000009;
      }
      id v30 = [v19 countByEnumeratingWithState:&v59 objects:v67 count:16];
    }
    while (v30);
    int64_t v14 = v56;
    CFStringRef v15 = v58;
    p_info = (__objc2_class_ro **)(MRTiledSprite + 32);
    if ((v31 ^ v32))
    {
      char v36 = v31 ^ 1;
      if ((v31 & 1) == 0) {
        goto LABEL_36;
      }
LABEL_43:
      double v37 = 1.0;
      if ((v36 & 1) == 0)
      {
        double v27 = 0.0;
        goto LABEL_46;
      }
LABEL_44:
      double v27 = 1.0;
LABEL_46:
      double v28 = 0.5;
      double v26 = 0.5;
      goto LABEL_47;
    }
  }
  char v36 = random() & 1;
  if (!v36) {
    goto LABEL_43;
  }
LABEL_36:
  double v28 = 0.5;
  double v37 = 0.0;
  double v27 = 0.0;
  double v26 = 0.5;
  if (v36) {
    goto LABEL_44;
  }
LABEL_47:
  id v38 = +[MPAnimationPathKeyframed animationPath];
  unsigned int v39 = [p_info + 186 easeKenBurnsPanFromOptions:a4];
  id v40 = objc_msgSend(v38, "createKeyframeWithPoint:atTime:", v37, v26, 0.0);
  if (v39)
  {
    [v40 setPostControl:0.25];
    objc_msgSend(objc_msgSend(v38, "createKeyframeWithPoint:atTime:", v27, v28, 1.0), "setPreControl:", -0.25);
  }
  else if (v14 < 0)
  {
    objc_msgSend(v38, "createKeyframeWithPoint:atTime:", v27, v28, 1.0);
  }
  else
  {
    [v40 setOffsetType:v14];
    objc_msgSend(objc_msgSend(v38, "createKeyframeWithPoint:atTime:", v27, v28, 1.0), "setOffsetType:", v14);
  }
  [a3 setAnimationPath:v38 forKey:@"center"];
  [p_info + 186 kenBurnsStartZoomLevelFromOptions:a4];
  double v42 = v41;
  [p_info + 186 kenBurnsEndZoomLevelFromOptions:a4];
  double v44 = v43;
  if (v42 > -1.0 || v43 > -1.0)
  {
    id v52 = +[MPAnimationPathKeyframed animationPath];
    id v46 = v52;
    double v53 = 1.0;
    if (v44 <= -1.0) {
      double v54 = 1.0;
    }
    else {
      double v54 = v44;
    }
    if (v42 > -1.0) {
      double v53 = v42;
    }
    [v52 createKeyframeWithScalar:v53 atTime:0.0];
    double v49 = 1.0;
    CGFloat v50 = v46;
    double v51 = v54;
  }
  else if (v11 == 4 || v11 == 2)
  {
    id v45 = +[MPAnimationPathKeyframed animationPath];
    id v46 = v45;
    if ((v10 >= 1.0 || v13 <= 1.0) && (v10 <= 1.0 || v13 >= 1.0))
    {
      double v48 = 1.0;
      if (v10 >= 1.0)
      {
        if (v10 * 0.449999988 > v13)
        {
          double v48 = v13 / fmax(v13 / (v10 * 0.449999988), 0.5);
          CFStringRef v15 = @"Scale to Fit";
        }
      }
      else if (v10 * 2.20000005 < v13)
      {
        CFStringRef v15 = @"Scale to Fit";
        double v48 = fmax(v10 * 2.20000005 / v13, 0.5) / (v10 / v13);
      }
    }
    else if (v13 >= 1.0 || v10 <= 1.0)
    {
      double v48 = 2.0;
    }
    else
    {
      double v48 = 4.0;
    }
    [v45 createKeyframeWithScalar:v48 atTime:0.0];
    double v49 = 1.0;
    CGFloat v50 = v46;
    double v51 = v48;
  }
  else
  {
    id v46 = +[MPAnimationPathKeyframed animationPath];
    [v46 createKeyframeWithScalar:1.0 atTime:0.0];
    double v51 = 1.0;
    double v49 = 1.0;
    CGFloat v50 = v46;
  }
  [v50 createKeyframeWithScalar:v51 atTime:v49];
  [a3 setAnimationPath:v46 forKey:@"scale"];
  [a3 setSizingMode:v15];
  [a3 removeAnimationPathForKey:@"angle"];
}

- (void)applyAnimatedCropToSlide:(id)a3 withOptions:(id)a4 centeredAt:(CGPoint)a5 alwaysZoomIn:(BOOL)a6
{
  CGFloat y = a5.y;
  double x = a5.x;
  -[MPDocument resolutionForPath:](self->_authoredDocument, "resolutionForPath:", [a3 path]);
  double v12 = v11;
  double v14 = v13;
  [(MPCropController *)self durationOfSlide:a3];
  double v122 = v15;
  if (v15 == -1.0)
  {
    +[MPAuthoringUtilities durationPerEffectFromOptions:a4];
    double v122 = v16;
  }
  double v17 = v12 / v14;
  +[MPAuthoringUtilities kenBurnsZoomFactorFromOptions:a4];
  double v19 = v18;
  double v113 = y;
  if (a6) {
    unsigned int v20 = 1;
  }
  else {
    unsigned int v20 = +[MPAuthoringUtilities kenBurnsAlwaysZoomInFromOptions:a4];
  }
  +[MPAuthoringUtilities aspectRatioFromOptions:a4];
  double v22 = v21;
  id v23 = [a3 parentEffect];
  objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "mediaAspectRatioForEffectID:usingAttributes:atIndex:defaultAspectRatio:imageAspectRatio:", objc_msgSend(v23, "effectID"), objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "attributesForEffectID:andPresetID:", objc_msgSend(v23, "effectID"), objc_msgSend(v23, "presetID")), objc_msgSend(a3, "index"), v22, v12 / v14);
  if (v24 == 9.22337204e18) {
    double v25 = v22;
  }
  else {
    double v25 = v24;
  }
  unint64_t v26 = +[MPAuthoringUtilities croppingModeFromOptions:a4];
  if ([a3 hasMovie]
    && +[MPAuthoringUtilities fitMoviesWhenPossibleFromOptions:a4])
  {
    unint64_t v27 = +[MPAuthoringUtilities croppingModeForFitMoviesFromOptions:a4];
    BOOL v28 = (v27 & 0x80000000) == 0;
    if ((v27 & 0x80000000) == 0) {
      unint64_t v26 = v27;
    }
  }
  else
  {
    BOOL v28 = 0;
  }
  if (v17 > 1.0)
  {
    BOOL v29 = v22 < 1.0 && v26 == 4;
  }
  else
  {
    if (v26 != 2)
    {
      BOOL v29 = v22 > 1.0 && v26 == 4;
      goto LABEL_38;
    }
    BOOL v29 = 1;
  }
  if (v26 == 2 && v29)
  {
    int v31 = kMPSlideSizingModeFit;
    goto LABEL_43;
  }
  int v32 = v26 != 2 || v29;
  if (v32 != 1)
  {
    BOOL v29 = 0;
LABEL_41:
    int v31 = kMPSlideSizingModeCrop;
    goto LABEL_43;
  }
LABEL_38:
  if (!v26) {
    goto LABEL_41;
  }
  if (v26 == 1)
  {
    [a3 setSizingMode:@"Scale to Fit"];
LABEL_44:
    double v34 = v14 * v25;
    double v118 = 0.0;
    double v119 = 0.0;
    double v35 = v14;
    goto LABEL_49;
  }
  int v31 = kMPSlideSizingModeBestFit;
LABEL_43:
  [a3 setSizingMode:*v31];
  if (v29) {
    goto LABEL_44;
  }
  if (v12 / v25 >= v14) {
    double v35 = v14;
  }
  else {
    double v35 = v12 / v25;
  }
  double v34 = v25 * v35;
  double v118 = (v14 - v35) * 0.5;
  double v119 = (v12 - v25 * v35) * 0.5;
LABEL_49:
  if (v28) {
    double v36 = 1.10000002;
  }
  else {
    double v36 = 1.29999995;
  }
  CGFloat v120 = v35;
  CGFloat v121 = v34;
  double v114 = v19;
  double v116 = v14;
  if (v17 > 1.0)
  {
    if (v12 >= v34 || v14 <= v35)
    {
      double v37 = 1.0;
      if (v14 < v35) {
        double v37 = v35 / v14;
      }
    }
    else
    {
      double v37 = v34 / v12;
    }
    double v36 = v37 + 0.25;
  }
  else
  {
    double v37 = 1.00999999;
  }
  +[MPAuthoringUtilities kenBurnsStartZoomLevelFromOptions:a4];
  double v40 = v39;
  +[MPAuthoringUtilities kenBurnsEndZoomLevelFromOptions:a4];
  double v42 = v41;
  +[MPAuthoringUtilities maxKenBurnsZoomFromOptions:a4];
  if (v36 <= v43 || v43 == -1.0) {
    double v45 = v36;
  }
  else {
    double v45 = v43;
  }
  double v46 = randomFloatInRange(v37, v45);
  double v115 = v12;
  if (v20)
  {
    double v47 = randomFloatInRange(v37, v45 - (v45 - v37) * 0.899999976);
    randomFloatInRange(v37, v45);
    double v37 = v37 + (v45 - v37) * 0.899999976;
  }
  else
  {
    double v47 = v46;
  }
  double v48 = randomFloatInRange(v37, v45);
  if (v40 <= -1.0) {
    double v49 = v47;
  }
  else {
    double v49 = v40;
  }
  if (v42 <= -1.0) {
    double v50 = v48;
  }
  else {
    double v50 = v42;
  }
  double v51 = vabdd_f64(v49, v50);
  if (v51 > 0.150000006)
  {
    double v52 = (v51 + -0.150000006) * 0.5;
    double v53 = -v52;
    BOOL v54 = v49 <= v50;
    if (v49 <= v50) {
      double v55 = v52;
    }
    else {
      double v55 = -v52;
    }
    double v49 = v49 + v55;
    if (!v54) {
      double v53 = v52;
    }
    double v50 = v50 + v53;
  }
  +[MPAuthoringUtilities kenBurnsPanFactorFromOptions:a4];
  double v112 = v56;
  double v57 = CenterRectOverRect(0.0, 0.0, v12 * v49, v116 * v49, v119, v118, v121, v120);
  double v58 = (v119 - FloorRect(v57)) / v121;
  double v61 = -v58;
  BOOL v63 = v62 > v121;
  if (v62 <= v121) {
    double v64 = v58;
  }
  else {
    double v64 = -v58;
  }
  if (v63) {
    double v61 = v58;
  }
  double v65 = (v118 - v59) / v120;
  BOOL v66 = v60 > v120;
  if (v60 <= v120) {
    double v67 = (v118 - v59) / v120;
  }
  else {
    double v67 = -v65;
  }
  if (v66) {
    double v68 = (v118 - v59) / v120;
  }
  else {
    double v68 = -v65;
  }
  double v69 = v122 / 6.0;
  double v70 = v122 / 6.0 * v64;
  double v71 = v122 / 6.0 * v61;
  if (v122 < 6.0)
  {
    double v72 = v122 / 6.0 * v67;
  }
  else
  {
    double v70 = v64;
    double v71 = v61;
    double v72 = v67;
  }
  if (v122 < 6.0) {
    double v73 = v122 / 6.0 * v68;
  }
  else {
    double v73 = v68;
  }
  if (!v29)
  {
    double v75 = x;
LABEL_109:
    double v74 = v113;
    goto LABEL_110;
  }
  double v74 = 0.649999976;
  double v75 = 0.649999976;
  if (x <= 0.649999976)
  {
    double v75 = x;
    if (x < 0.349999994) {
      double v75 = 0.349999994;
    }
  }
  if (v113 <= 0.649999976)
  {
    double v74 = 0.349999994;
    if (v113 >= 0.349999994) {
      goto LABEL_109;
    }
  }
LABEL_110:
  double v109 = v75 + randomFloatInRange(v70, v71) * v112;
  double v111 = v75;
  double v108 = randomFloatInRange(v72, v73);
  CGFloat v76 = v116 * (v50 * v112);
  double v117 = 0.0;
  double v77 = (v119 - CenterRectOverRect(0.0, 0.0, v115 * (v50 * v112), v76, v119, v118, v121, v120)) / v121;
  double v80 = -v77;
  BOOL v82 = v81 > v121;
  if (v81 <= v121) {
    double v83 = v77;
  }
  else {
    double v83 = -v77;
  }
  if (v82) {
    double v80 = v77;
  }
  double v84 = (v118 - v78) / v120;
  BOOL v85 = v79 > v120;
  if (v79 <= v120) {
    double v86 = (v118 - v78) / v120;
  }
  else {
    double v86 = -v84;
  }
  if (v85) {
    double v87 = (v118 - v78) / v120;
  }
  else {
    double v87 = -v84;
  }
  double v88 = v69 * v83;
  double v89 = v69 * v80;
  double v90 = v69 * v87;
  if (v122 < 6.0)
  {
    double v91 = v69 * v86;
  }
  else
  {
    double v88 = v83;
    double v89 = v80;
    double v91 = v86;
  }
  if (v122 < 6.0) {
    double v92 = v90;
  }
  else {
    double v92 = v87;
  }
  double v93 = 0.0;
  if ((v20 & 1) == 0)
  {
    double v117 = v112 * randomFloatInRange(v88, v89);
    double v93 = v112 * randomFloatInRange(v91, v92);
  }
  double v94 = v74 + v108 * v112;
  double v95 = 1.0;
  double v96 = 1.0;
  if (v109 <= 1.0)
  {
    double v96 = v109;
    if (v109 < 0.0) {
      double v96 = 0.0;
    }
  }
  double v97 = v111 + v117;
  double v98 = v50;
  if (v94 <= 1.0)
  {
    double v95 = v74 + v108 * v112;
    if (v94 < 0.0) {
      double v95 = 0.0;
    }
  }
  double v99 = v74 + v93;
  double v100 = 1.0;
  double v101 = 1.0;
  if (v97 <= 1.0)
  {
    double v101 = v111 + v117;
    if (v97 < 0.0) {
      double v101 = 0.0;
    }
  }
  if (v99 <= 1.0)
  {
    double v100 = v74 + v93;
    if (v99 < 0.0) {
      double v100 = 0.0;
    }
  }
  id v102 = +[MPAnimationPathKeyframed animationPath];
  double v103 = v102;
  if (v49 >= v50) {
    double v104 = v50;
  }
  else {
    double v104 = v49;
  }
  if (v49 >= v50) {
    double v105 = v49;
  }
  else {
    double v105 = v50;
  }
  if (!v20) {
    double v104 = v49;
  }
  double v106 = v114 * v104;
  if (v20) {
    double v98 = v105;
  }
  [v102 createKeyframeWithScalar:v106 atTime:0.0];
  [v103 createKeyframeWithScalar:v114 * v98 atTime:1.0];
  [a3 setAnimationPath:v103 forKey:@"scale"];
  id v107 = +[MPAnimationPathKeyframed animationPath];
  objc_msgSend(v107, "createKeyframeWithPoint:atTime:", v96, v95, 0.0);
  objc_msgSend(v107, "createKeyframeWithPoint:atTime:", v101, v100, 1.0);
  [a3 setAnimationPath:v107 forKey:@"center"];
  [a3 removeAnimationPathForKey:@"angle"];
}

- (void)applyMultiFaceAnimatedCropToSlide:(id)a3 withOptions:(id)a4
{
  -[MPDocument resolutionForPath:](self->_authoredDocument, "resolutionForPath:", [a3 path]);
  double v73 = v7;
  double v70 = v8;
  id v9 = -[MPDocument regionsOfInterestForPath:detect:](self->_authoredDocument, "regionsOfInterestForPath:detect:", [a3 path], +[MPAuthoringUtilities performFaceDetectionFromOptions:](MPAuthoringUtilities, "performFaceDetectionFromOptions:", a4));
  +[MPAuthoringUtilities kenBurnsZoomFactorFromOptions:a4];
  double v71 = v10;
  +[MPAuthoringUtilities kenBurnsPanFactorFromOptions:a4];
  double v72 = v11;
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  CGFloat height = CGRectZero.size.height;
  double rect1 = height;
  double width = CGRectZero.size.width;
  CGFloat v74 = y;
  CGFloat v16 = width;
  if (v9)
  {
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v17 = [v9 countByEnumeratingWithState:&v82 objects:v87 count:16];
    double rect1 = height;
    double x = CGRectZero.origin.x;
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v83;
      double rect1 = height;
      double x = CGRectZero.origin.x;
      do
      {
        unsigned int v20 = 0;
        do
        {
          CGFloat v76 = x;
          if (*(void *)v83 != v19) {
            objc_enumerationMutation(v9);
          }
          CGRect v88 = CGRectFromString((NSString *)[*(id *)(*((void *)&v82 + 1) + 8 * (void)v20) objectForKey:kMPMetaDataRegionOfInterestBounds]);
          if (v88.size.width == 0.0) {
            goto LABEL_12;
          }
          CGFloat v21 = v88.size.height;
          if (v88.size.height == 0.0) {
            goto LABEL_12;
          }
          double x = v88.origin.x;
          CGFloat v22 = v88.origin.y;
          CGFloat v23 = v88.size.width;
          v89.size.CGFloat height = rect1;
          v89.origin.double x = v76;
          v89.origin.double y = y;
          v89.size.double width = width;
          v96.origin.double x = CGRectZero.origin.x;
          v96.origin.double y = v74;
          v96.size.double width = v16;
          v96.size.CGFloat height = height;
          if (CGRectEqualToRect(v89, v96))
          {
            double rect1 = v21;
            double width = v23;
            double y = v22;
            goto LABEL_13;
          }
          v90.origin.double x = x;
          v90.origin.double y = v22;
          v90.size.double width = v23;
          v90.size.CGFloat height = v21;
          v97.origin.double x = CGRectZero.origin.x;
          v97.origin.double y = v74;
          v97.size.double width = v16;
          v97.size.CGFloat height = height;
          if (CGRectEqualToRect(v90, v97))
          {
LABEL_12:
            double x = v76;
          }
          else
          {
            v91.size.CGFloat height = rect1;
            v91.origin.double x = v76;
            v91.origin.double y = y;
            v91.size.double width = width;
            v98.origin.double x = x;
            v98.origin.double y = v22;
            v98.size.double width = v23;
            v98.size.CGFloat height = v21;
            CGRect v92 = CGRectUnion(v91, v98);
            double x = v92.origin.x;
            double y = v92.origin.y;
            double width = v92.size.width;
            double rect1 = v92.size.height;
          }
LABEL_13:
          unsigned int v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v24 = [v9 countByEnumeratingWithState:&v82 objects:v87 count:16];
        id v18 = v24;
      }
      while (v24);
    }
  }
  v93.origin.double x = x;
  v93.origin.double y = y;
  v93.size.double width = width;
  v93.size.CGFloat height = rect1;
  v99.origin.double x = CGRectZero.origin.x;
  v99.origin.double y = v74;
  double v77 = v16;
  v99.size.double width = v16;
  v99.size.CGFloat height = height;
  BOOL v25 = CGRectEqualToRect(v93, v99);
  double v26 = 0.5;
  double v27 = 0.5;
  if (!v25) {
    +[MPAuthoringUtilities kbCenterPointFromRect:](MPAuthoringUtilities, "kbCenterPointFromRect:", x, y, width, rect1);
  }
  double v67 = v26;
  double v69 = v27;
  double v28 = CGRectZero.origin.x;
  double v29 = v74;
  CGFloat v30 = v77;
  double v31 = v77;
  CGFloat v32 = height;
  double v33 = height;
  if (v9)
  {
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v34 = [v9 countByEnumeratingWithState:&v78 objects:v86 count:16];
    double v28 = CGRectZero.origin.x;
    double v29 = v74;
    double v31 = v77;
    double v33 = height;
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v79;
      double v28 = CGRectZero.origin.x;
      double v29 = v74;
      double v31 = v77;
      double v33 = height;
      do
      {
        for (i = 0; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v79 != v36) {
            objc_enumerationMutation(v9);
          }
          CGRect v94 = CGRectFromString((NSString *)objc_msgSend(*(id *)(*((void *)&v78 + 1) + 8 * i), "objectForKey:", kMPMetaDataRegionOfInterestBounds, *(void *)&v67));
          if (v94.size.width * v94.size.height > v31 * v33)
          {
            double v28 = v94.origin.x;
            double v29 = v94.origin.y;
            double v31 = v94.size.width;
            double v33 = v94.size.height;
          }
        }
        id v35 = [v9 countByEnumeratingWithState:&v78 objects:v86 count:16];
      }
      while (v35);
      CGFloat v30 = v77;
      CGFloat v32 = height;
    }
  }
  v95.origin.double x = v28;
  v95.origin.double y = v29;
  v95.size.double width = v31;
  v95.size.CGFloat height = v33;
  v100.origin.double x = CGRectZero.origin.x;
  v100.origin.double y = v74;
  v100.size.double width = v30;
  v100.size.CGFloat height = v32;
  double v38 = 0.5;
  double v39 = 0.5;
  if (!CGRectEqualToRect(v95, v100))
  {
    +[MPAuthoringUtilities kbCenterPointFromRect:](MPAuthoringUtilities, "kbCenterPointFromRect:", v28, v29, v31, v33);
    double v38 = v40;
    double v39 = v41;
  }
  double v42 = v73 / v70;
  double v43 = randomFloatInRange(1.00999999, 1.03899999);
  double v44 = randomFloatInRange(1.27099995, 1.29999995);
  unint64_t v45 = +[MPAuthoringUtilities croppingModeFromOptions:a4];
  if ([a3 hasMovie]
    && +[MPAuthoringUtilities fitMoviesWhenPossibleFromOptions:a4])
  {
    +[MPAuthoringUtilities croppingModeForFitMoviesFromOptions:a4];
  }
  if (v42 < 1.0 && v45 == 2) {
    goto LABEL_37;
  }
  if (v42 >= 1.0 && v45 == 2 || !v45)
  {
    double v46 = kMPSlideSizingModeCrop;
  }
  else
  {
    if (v45 == 1)
    {
LABEL_37:
      double v46 = kMPSlideSizingModeFit;
      goto LABEL_44;
    }
    double v46 = kMPSlideSizingModeBestFit;
  }
LABEL_44:
  double v47 = *v46;
  objc_msgSend(a3, "setSizingMode:", *v46, *(void *)&v67);
  if (!v47)
  {
    double v49 = v38;
LABEL_52:
    double v48 = v39;
    goto LABEL_53;
  }
  double v48 = 0.649999976;
  double v49 = 0.649999976;
  if (v38 <= 0.649999976)
  {
    double v49 = v38;
    if (v38 < 0.349999994) {
      double v49 = 0.349999994;
    }
  }
  if (v39 <= 0.649999976)
  {
    double v48 = 0.349999994;
    if (v39 >= 0.349999994) {
      goto LABEL_52;
    }
  }
LABEL_53:
  if (width / v73 <= 0.800000012)
  {
    if (rect1 / v70 <= 0.800000012) {
      goto LABEL_58;
    }
    double v50 = -0.5;
  }
  else
  {
    double v50 = -0.200000003;
  }
  double v44 = v44 + v50;
LABEL_58:
  double v51 = vabdd_f64(v43, v44);
  if (v51 > 0.200000003)
  {
    float v52 = (v51 + -0.200000003) * 0.5;
    double v53 = v52;
    if (v43 <= v44)
    {
      double v43 = v43 + v53;
      double v44 = v44 - v53;
    }
    else
    {
      double v43 = v43 - v53;
      double v44 = v44 + v53;
    }
  }
  uint64_t v54 = random();
  if ((v54 & 0x8000000000000001) == 1) {
    double v55 = v44;
  }
  else {
    double v55 = v43;
  }
  if ((v54 & 0x8000000000000001) == 1) {
    double v44 = v43;
  }
  +[MPAuthoringUtilities kenBurnsStartZoomLevelFromOptions:a4];
  double v57 = v56;
  +[MPAuthoringUtilities kenBurnsEndZoomLevelFromOptions:a4];
  if (v57 <= -1.0) {
    double v57 = v55;
  }
  if (v58 > -1.0) {
    double v44 = v58;
  }
  id v59 = +[MPAnimationPathKeyframed animationPath];
  [v59 createKeyframeWithScalar:v71 * v57 atTime:0.0];
  double v60 = 1.0;
  [v59 createKeyframeWithScalar:v71 * v44 atTime:1.0];
  [a3 setAnimationPath:v59 forKey:@"scale"];
  double v61 = 1.0;
  if (v49 <= 1.0)
  {
    double v61 = v49;
    if (v49 < 0.0) {
      double v61 = 0.0;
    }
  }
  double v62 = v68 + (v49 - v68) * v72;
  if (v48 <= 1.0)
  {
    double v60 = v48;
    if (v48 < 0.0) {
      double v60 = 0.0;
    }
  }
  double v63 = v69 + (v48 - v69) * v72;
  double v64 = 1.0;
  double v65 = 1.0;
  if (v62 <= 1.0)
  {
    double v65 = v68 + (v49 - v68) * v72;
    if (v62 < 0.0) {
      double v65 = 0.0;
    }
  }
  if (v63 <= 1.0)
  {
    double v64 = v69 + (v48 - v69) * v72;
    if (v63 < 0.0) {
      double v64 = 0.0;
    }
  }
  id v66 = +[MPAnimationPathKeyframed animationPath];
  objc_msgSend(v66, "createKeyframeWithPoint:atTime:", v61, v60, 0.0);
  objc_msgSend(v66, "createKeyframeWithPoint:atTime:", v65, v64, 1.0);
  [a3 setAnimationPath:v66 forKey:@"center"];
  [a3 removeAnimationPathForKey:@"angle"];
}

- (double)durationOfSlide:(id)a3
{
  id v4 = [a3 parentEffect];
  double result = -1.0;
  if (v4) {
    objc_msgSend(objc_msgSend(a3, "parentEffect", -1.0), "fullDuration");
  }
  if (result == 0.0) {
    return -1.0;
  }
  return result;
}

@end