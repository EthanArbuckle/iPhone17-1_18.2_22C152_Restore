@interface TSDContainerRep
+ (id)childrenFromLayoutInContainerRep:(id)a3;
+ (id)containerRep:(id)a3 hitRep:(CGPoint)a4 withGesture:(id)a5 passingTest:(id)a6;
- (BOOL)shouldHitTestChildImageRep:(id)a3;
@end

@implementation TSDContainerRep

+ (id)childrenFromLayoutInContainerRep:(id)a3
{
  id v4 = [a3 childReps];
  id v5 = objc_msgSend(objc_msgSend(a3, "layout"), "children");
  id v6 = [v5 count];
  if (v6 == [v4 count])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v28;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(id *)(*((void *)&v27 + 1) + 8 * v11);
        if (objc_msgSend(objc_msgSend(v4, "objectAtIndex:", v9 + v11), "layout") != v12) {
          break;
        }
        if (v8 == (id)++v11)
        {
          id v8 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
          v9 += v11;
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      id v13 = [v5 count];
      if (!v13) {
        goto LABEL_27;
      }
      id v14 = v13;
      uint64_t v15 = 0;
      while (objc_msgSend(objc_msgSend(v4, "objectAtIndex:", v15), "parentRep") == a3)
      {
        if (v14 == (id)++v15) {
          goto LABEL_27;
        }
      }
    }
  }
  id v4 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v5);
        }
        v20 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v19);
        id v21 = objc_msgSend(objc_msgSend(a3, "canvas"), "repForLayout:", v20);
        if (v21) {
          goto LABEL_24;
        }
        id v21 = objc_msgSend(objc_alloc((Class)objc_msgSend(v20, "repClassOverride")), "initWithLayout:canvas:", v20, objc_msgSend(a3, "canvas"));
        objc_msgSend(objc_msgSend(a3, "canvas"), "delegate");
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(objc_msgSend(objc_msgSend(a3, "canvas"), "delegate"), "canvas:willLayoutRep:", objc_msgSend(a3, "canvas"), v21);
        }
        if (v21)
        {
LABEL_24:
          [v4 addObject:v21];
        }
        [v21 setParentRep:a3];
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }
LABEL_27:
  [v4 makeObjectsPerformSelector:"updateChildrenFromLayout"];
  return v4;
}

+ (id)containerRep:(id)a3 hitRep:(CGPoint)a4 withGesture:(id)a5 passingTest:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = objc_msgSend(objc_msgSend(a3, "childRepsForHitTesting"), "reverseObjectEnumerator");
  id v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v30;
    float64x2_t v24 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&x, 0);
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v15 = objc_msgSend(objc_msgSend(v14, "layout"), "geometry");
        if (v15)
        {
          [v15 inverseTransform];
          float64x2_t v16 = v26;
          float64x2_t v17 = v27;
          float64x2_t v18 = v28;
        }
        else
        {
          float64x2_t v27 = 0u;
          float64x2_t v28 = 0u;
          float64x2_t v18 = 0uLL;
          float64x2_t v16 = 0uLL;
          float64x2_t v17 = 0uLL;
          float64x2_t v26 = 0u;
        }
        id v19 = [v14 hitRep:a5 withGesture:a6 passingTest:vaddq_f64(v18, vmlaq_f64(vmulq_n_f64(v17, y), v24, v16))];
        if (v19) {
          return v19;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v20 = [a3 hitRep:x, y];
  id v21 = v20;
  if (a6 && v20 && !(*((unsigned int (**)(id, id))a6 + 2))(a6, v20)) {
    return 0;
  }
  return v21;
}

- (BOOL)shouldHitTestChildImageRep:(id)a3
{
  objc_opt_class();
  [(TSDContainerRep *)self parentRep];
  id v5 = (void *)TSUDynamicCast();

  return [v5 shouldHitTestChildImageRep:a3];
}

@end