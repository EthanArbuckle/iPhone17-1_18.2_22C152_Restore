@interface SUPurchaseAnimator
+ (void)performHopAnimationForView:(id)a3 relativeToView:(id)a4 finalAlpha:(float)a5 scale:(float)a6;
+ (void)performHopAnimationForView:(id)a3 relativeToView:(id)a4 tabBarController:(id)a5 finalAlpha:(float)a6 scale:(float)a7;
@end

@implementation SUPurchaseAnimator

+ (void)performHopAnimationForView:(id)a3 relativeToView:(id)a4 finalAlpha:(float)a5 scale:(float)a6
{
  id v11 = +[SUClientDispatch tabBarController];
  *(float *)&double v12 = a5;
  *(float *)&double v13 = a6;

  [a1 performHopAnimationForView:a3 relativeToView:a4 tabBarController:v11 finalAlpha:v12 scale:v13];
}

+ (void)performHopAnimationForView:(id)a3 relativeToView:(id)a4 tabBarController:(id)a5 finalAlpha:(float)a6 scale:(float)a7
{
  uint64_t v13 = [a5 view];
  if (a3)
  {
    v14 = (void *)v13;
    if (v13)
    {
      float v55 = a6;
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "beginIgnoringInteractionEvents");
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"SUPurchaseAnimationWillBeginNotification", a1);
      [v14 bounds];
      double v53 = v16;
      double v54 = v15;
      [a3 frame];
      objc_msgSend(v14, "convertRect:fromView:", a4);
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      objc_msgSend(a3, "setFrame:");
      [v14 addSubview:a3];
      v25 = (void *)[a5 tabBar];
      [v25 bounds];
      double v27 = v26;
      double v56 = v28;
      unint64_t v29 = objc_msgSend((id)objc_msgSend(v25, "items"), "count");
      double v52 = v27;
      float v30 = v27 / (double)v29;
      float v31 = a7;
      double v32 = floorf(v30);
      uint64_t v33 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom");
      if (v33 == 1) {
        double v34 = 30.0;
      }
      else {
        double v34 = 0.0;
      }
      if (v33 == 1) {
        double v35 = 80.0;
      }
      else {
        double v35 = v32;
      }
      if (v31 < 0.0)
      {
        double v36 = v22 / v35;
        if (v22 / v35 >= v24 / v56) {
          double v36 = v24 / v56;
        }
        float v31 = v36;
      }
      v37 = (void *)[MEMORY[0x263F157D8] animation];
      Mutable = CGPathCreateMutable();
      CGPathMoveToPoint(Mutable, 0, v18 + ceil(v22 * 0.5), v20 + ceil(v24 * 0.5));
      objc_opt_class();
      unint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
      if (objc_opt_isKindOfClass())
      {
        unint64_t v39 = [a5 indexOfViewControllerWithSectionType:2];
        if (v39 == 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v39 = [a5 indexOfViewControllerWithSectionType:6];
        }
      }
      if (v29 - 1 >= v39) {
        unint64_t v40 = v39;
      }
      else {
        unint64_t v40 = v29 - 1;
      }
      float v41 = v22 * v31;
      float v42 = floorf(v41);
      float v43 = (v52 - (double)v29 * v35 - (double)(v29 - 1) * v34) * 0.5;
      float v44 = (v34 + v35) * (double)v40;
      float v45 = v42 * 0.5 + (v35 - v42) * 0.5;
      CGFloat v46 = floorf(v43) + floorf(v44) + floorf(v45);
      float v47 = v54 + v53 - v56 * 0.5;
      CGPathAddQuadCurveToPoint(Mutable, 0, v46, 0.0, v46, floorf(v47));
      [v37 setKeyPath:@"position"];
      v48 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v49 = [NSNumber numberWithFloat:0.0];
      LODWORD(v50) = 1.0;
      objc_msgSend(v37, "setKeyTimes:", objc_msgSend(v48, "arrayWithObjects:", v49, objc_msgSend(NSNumber, "numberWithFloat:", v50), 0));
      [v37 setPath:Mutable];
      [v37 setDuration:0.5];
      [v37 setCalculationMode:*MEMORY[0x263F15970]];
      [v37 setFillMode:@"frozen"];
      [v37 setRemovedOnCompletion:0];
      v51 = [[SUPurchaseAnimationDelegate alloc] initWithView:a3];
      [v37 setDelegate:v51];

      objc_msgSend((id)objc_msgSend(a3, "layer"), "addAnimation:forKey:", v37, @"position");
      CGPathRelease(Mutable);
      [MEMORY[0x263F1CB60] beginAnimations:0];
      [MEMORY[0x263F1CB60] setAnimationDuration:0.5];
      [a3 transform];
      CGAffineTransform v57 = v59;
      CGAffineTransformScale(&v58, &v57, v31, v31);
      CGAffineTransform v59 = v58;
      [a3 setTransform:&v58];
      [a3 setAlpha:v55];
      [MEMORY[0x263F1CB60] endAnimations];
    }
  }
}

@end