@interface CRLiOSRepRotateGestureRecognizer
- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3;
- (BOOL)p_touchIsInRep:(id)a3;
- (BOOL)readyToEndOperation;
- (BOOL)touchesAreInRep;
- (CRLCanvasLayoutManipulatingTracker)tracker;
- (CRLiOSRepRotateGestureRecognizer)initWithInteractiveCanvasController:(id)a3;
- (double)p_angleForUnscaledTouchPoint:(CGPoint)a3;
- (double)rotation;
- (void)cancelBecauseOfRotation;
- (void)dealloc;
- (void)operationDidEnd;
- (void)p_beginTracking;
- (void)p_cancelDelayedRecognition;
- (void)p_recognizeAfterDelay:(double)a3;
- (void)p_updateTracker;
- (void)reset;
- (void)setState:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation CRLiOSRepRotateGestureRecognizer

- (CRLiOSRepRotateGestureRecognizer)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSRepRotateGestureRecognizer;
  v5 = [(CRLiOSRepRotateGestureRecognizer *)&v10 initWithTarget:0 action:0];
  if (v5)
  {
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FA218);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B2F60();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FA238);
      }
      v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v6);
      }
      v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepRotateGestureRecognizer initWithInteractiveCanvasController:]");
      v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepRotateGestureRecognizer.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 56, 0, "invalid nil value for '%{public}s'", "icc");
    }
    objc_storeWeak((id *)&v5->mICC, v4);
    v5->mAdditionalRotateInRadians = 0.0;
  }

  return v5;
}

- (void)dealloc
{
  [(CRLiOSRepRotateGestureRecognizer *)self p_cancelDelayedRecognition];
  v3.receiver = self;
  v3.super_class = (Class)CRLiOSRepRotateGestureRecognizer;
  [(CRLiOSRepRotateGestureRecognizer *)&v3 dealloc];
}

- (void)setState:(int64_t)a3
{
  [(CRLiOSRepRotateGestureRecognizer *)self state];
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSRepRotateGestureRecognizer;
  [(CRLiOSRepRotateGestureRecognizer *)&v5 setState:a3];
}

- (void)reset
{
  v7.receiver = self;
  v7.super_class = (Class)CRLiOSRepRotateGestureRecognizer;
  [(CRLiOSRepRotateGestureRecognizer *)&v7 reset];
  [(CRLiOSRepRotateGestureRecognizer *)self p_cancelDelayedRecognition];
  mTouch1 = self->mTouch1;
  self->mTouch1 = 0;

  mTouch2 = self->mTouch2;
  self->mTouch2 = 0;

  mRep = self->mRep;
  self->mRep = 0;

  CGPoint v6 = CGPointZero;
  self->mOriginalUnscaledPoint1 = CGPointZero;
  self->mOriginalUnscaledPoint2 = v6;
  self->mMovingTouchIndex = 0;
  self->mLastAngle = 0.0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v78.receiver = self;
  v78.super_class = (Class)CRLiOSRepRotateGestureRecognizer;
  id v73 = a4;
  -[CRLiOSRepRotateGestureRecognizer touchesBegan:withEvent:](&v78, "touchesBegan:withEvent:", v6);
  id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  v8 = [WeakRetained layerHost];
  v71 = [v8 asUIKitHost];

  if ([(CRLiOSRepRotateGestureRecognizer *)self state]
    || ![WeakRetained currentlyScrolling])
  {
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v70 = v6;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v74 objects:v79 count:16];
    if (!v10) {
      goto LABEL_37;
    }
    id v11 = v10;
    uint64_t v12 = *(void *)v75;
    v13 = &OBJC_IVAR___CRLStrokePattern__phase;
    id v72 = v9;
    while (1)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v75 != v12) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        if (![(CRLiOSRepRotateGestureRecognizer *)self state])
        {
          if ((unint64_t)[(CRLiOSRepRotateGestureRecognizer *)self numberOfTouches] >= 3)
          {
            [(CRLiOSRepRotateGestureRecognizer *)self p_cancelDelayedRecognition];
            [(CRLiOSRepRotateGestureRecognizer *)self setState:5];
            continue;
          }
          v18 = v13;
          v19 = (id *)((char *)&self->super.super.isa + v13[800]);
          if (*v19)
          {
            p_mTouch2 = &self->mTouch2;
            if (self->mTouch2)
            {
              [(CRLiOSRepRotateGestureRecognizer *)self p_cancelDelayedRecognition];
              goto LABEL_31;
            }
            objc_storeStrong((id *)&self->mTouch2, v15);
            if ([(CRLiOSRepRotateGestureRecognizer *)self p_touchIsInRep:*p_mTouch2])
            {
              v34 = *p_mTouch2;
              v35 = [WeakRetained canvasView];
              [(UITouch *)v34 locationInView:v35];
              double v37 = v36;
              double v39 = v38;

              [WeakRetained convertBoundsToUnscaledPoint:v37, v39];
              self->mOriginalUnscaledPoint2.x = v40;
              self->mOriginalUnscaledPoint2.y = v41;
              self->mLastProcessedTouchUnscaledPoint2 = self->mOriginalUnscaledPoint1;
              [WeakRetained convertUnscaledToBoundsPoint:self->mOriginalUnscaledPoint1.x, self->mOriginalUnscaledPoint1.y];
              self->mOriginalBoundsDistance = sub_1000653B4(v42, v43, v37, v39);
              mRep = self->mRep;
              [(CRLCanvasRep *)mRep centerForRotation];
              -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](mRep, "convertNaturalPointToUnscaledCanvas:");
              self->mUnscaledRotationCenter.x = v45;
              self->mUnscaledRotationCenter.y = v46;
              v47 = self;
              double v48 = 0.4;
              goto LABEL_33;
            }
            id v49 = *v19;
            v50 = [WeakRetained canvasView];
            [v49 locationInView:v50];
            double v52 = v51;
            double v54 = v53;

            v55 = self->mRep;
            [(CRLCanvasRep *)v55 centerForRotation];
            -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](v55, "convertNaturalPointToUnscaledCanvas:");
            self->mUnscaledRotationCenter.x = v56;
            self->mUnscaledRotationCenter.y = v57;
            [WeakRetained convertUnscaledToBoundsPoint:];
            if (sub_1000643CC(v52, v54, v58, v59) <= 2500.0)
            {
              self->mPinningTouchIsPresent = 1;
              v60 = *p_mTouch2;
              v61 = [WeakRetained canvasView];
              [(UITouch *)v60 locationInView:v61];
              double v63 = v62;
              double v65 = v64;

              [WeakRetained convertBoundsToUnscaledPoint:v63, v65];
              self->mOriginalUnscaledPoint2.x = v66;
              self->mOriginalUnscaledPoint2.y = v67;
              self->mLastProcessedTouchUnscaledPoint2 = self->mOriginalUnscaledPoint2;
              [WeakRetained convertUnscaledToBoundsPoint:self->mOriginalUnscaledPoint1.x, self->mOriginalUnscaledPoint1.y];
              self->mOriginalBoundsDistance = sub_1000653B4(v68, v69, v63, v65);
              v47 = self;
              double v48 = 0.2;
LABEL_33:
              [(CRLiOSRepRotateGestureRecognizer *)v47 p_recognizeAfterDelay:v48];
            }
            else
            {
LABEL_31:
              [(CRLiOSRepRotateGestureRecognizer *)self setState:5];
            }
          }
          else
          {
            self->mAdditionalRotateInRadians = 0.0;
            objc_storeStrong(v19, v15);
            v27 = [v71 hitRepWithTouch:*v19];
            v28 = [v27 repForRotating];
            v29 = self->mRep;
            self->mRep = v28;

            if (!self->mRep) {
              goto LABEL_31;
            }
            id v30 = *v19;
            v31 = [WeakRetained canvasView];
            [v30 locationInView:v31];
            [WeakRetained convertBoundsToUnscaledPoint:];
            self->mOriginalUnscaledPoint1.x = v32;
            self->mOriginalUnscaledPoint1.y = v33;

            self->mLastProcessedTouchUnscaledPoint1 = self->mOriginalUnscaledPoint1;
          }
          v13 = v18;
          id v9 = v72;
          continue;
        }
        if ([(CRLiOSRepRotateGestureRecognizer *)self state] != (id)2)
        {
          [(CRLiOSRepRotateGestureRecognizer *)self ignoreTouch:v15 forEvent:v73];
          continue;
        }
        v16 = (UITouch **)((char *)self + v13[800]);
        if (*v16 && ((id)[(UITouch *)*v16 phase] == (id)3 || (id)[(UITouch *)*v16 phase] == (id)4))
        {
          objc_storeStrong((id *)v16, v15);
          uint64_t v17 = 32;
LABEL_25:
          v22 = (Class *)((char *)&self->super.super.isa + v17);
          v23 = *v16;
          v24 = [WeakRetained canvasView];
          [(UITouch *)v23 locationInView:v24];
          [WeakRetained convertBoundsToUnscaledPoint:];
          void *v22 = v25;
          v22[1] = v26;

          continue;
        }
        v16 = &self->mTouch2;
        mTouch2 = self->mTouch2;
        if (mTouch2
          && ((id)[(UITouch *)mTouch2 phase] == (id)3 || (id)[(UITouch *)*v16 phase] == (id)4))
        {
          objc_storeStrong((id *)&self->mTouch2, v15);
          uint64_t v17 = 48;
          goto LABEL_25;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v74 objects:v79 count:16];
      if (!v11)
      {
LABEL_37:

        id v6 = v70;
        goto LABEL_38;
      }
    }
  }
  [(CRLiOSRepRotateGestureRecognizer *)self setState:5];
LABEL_38:
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v147.receiver = self;
  v147.super_class = (Class)CRLiOSRepRotateGestureRecognizer;
  [(CRLiOSRepRotateGestureRecognizer *)&v147 touchesMoved:v6 withEvent:a4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  p_mTouch1 = &self->mTouch1;
  mTouch1 = self->mTouch1;
  v8 = &OBJC_IVAR___CRLStrokePattern__phase;
  if (mTouch1)
  {
    p_mTouch2 = (id *)&self->mTouch2;
    if (self->mTouch2)
    {
      unint64_t mMovingTouchIndex = self->mMovingTouchIndex;
      if (mMovingTouchIndex == 1)
      {
        v29 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mLastProcessedTouchUnscaledPoint1;
        id v30 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mLastProcessedTouchUnscaledPoint2;
      }
      else
      {
        if (!mMovingTouchIndex)
        {
          long long v145 = 0u;
          long long v146 = 0u;
          long long v143 = 0u;
          long long v144 = 0u;
          obj = (UITouch *)v6;
          id v11 = [(UITouch *)obj countByEnumeratingWithState:&v143 objects:v148 count:16];
          if (!v11) {
            goto LABEL_36;
          }
          id v12 = v11;
          id v136 = v6;
          uint64_t v13 = *(void *)v144;
          while (1)
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v144 != v13) {
                objc_enumerationMutation(obj);
              }
              v15 = *(void **)(*((void *)&v143 + 1) + 8 * i);
              if (v15 == *p_mTouch1)
              {
                v16 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint1;
                unint64_t v17 = 1;
              }
              else
              {
                if (v15 != *p_mTouch2) {
                  continue;
                }
                v16 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint2;
                unint64_t v17 = 2;
              }
              v18 = [WeakRetained canvasView];
              [v15 locationInView:v18];
              double v20 = v19;
              double v22 = v21;

              [WeakRetained convertUnscaledToBoundsPoint:*(double *)((char *)&self->super.super.isa + *v16) *(double *)((char *)&self->mICC + *v16)];
              double v24 = v23;
              double v26 = v25;
              id v27 = [(CRLiOSRepRotateGestureRecognizer *)self state];
              double v28 = sub_1000653B4(v20, v22, v24, v26);
              if (v27 || v28 < 14.0)
              {
                if (v28 >= 3.0) {
                  self->unint64_t mMovingTouchIndex = v17;
                }
              }
              else
              {
                [(CRLiOSRepRotateGestureRecognizer *)self p_cancelDelayedRecognition];
                [(CRLiOSRepRotateGestureRecognizer *)self setState:5];
              }
            }
            id v12 = [(UITouch *)obj countByEnumeratingWithState:&v143 objects:v148 count:16];
            if (!v12)
            {
              id v6 = v136;
              v8 = &OBJC_IVAR___CRLStrokePattern__phase;
              goto LABEL_36;
            }
          }
        }
        v29 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mLastProcessedTouchUnscaledPoint2;
        mTouch1 = self->mTouch2;
        p_mTouch2 = (id *)&self->mTouch1;
        id v30 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mLastProcessedTouchUnscaledPoint1;
      }
      obj = mTouch1;
      id v31 = *p_mTouch2;
      CGFloat v32 = (double *)((char *)self + *v29);
      double v33 = *v32;
      double v34 = v32[1];
      v35 = (double *)((char *)self + *v30);
      double v137 = *v35;
      double v133 = v33;
      double v134 = v35[1];
      if ([v31 phase] != (id)3)
      {
        double v36 = [WeakRetained canvasView];
        [(UITouch *)obj locationInView:v36];
        double v38 = v37;
        double v40 = v39;

        CGFloat v41 = [WeakRetained canvasView];
        [v31 locationInView:v41];
        double v43 = v42;
        double v45 = v44;

        [WeakRetained convertUnscaledToBoundsPoint:self->mUnscaledRotationCenter.x, self->mUnscaledRotationCenter.y];
        double v47 = v46;
        double v49 = v48;
        if (sub_1000643CC(v43, v45, v46, v48) >= 2500.0)
        {
          double v129 = v40;
          double v131 = v38;
          if (sub_1000643CC(v38, v40, v47, v49) >= 2500.0) {
            self->mPinningTouchIsPresent = 0;
          }
          [WeakRetained convertUnscaledToBoundsPoint:v133, v34];
          double v51 = v50;
          double v53 = v52;
          [WeakRetained convertUnscaledToBoundsPoint:v137, v134];
          double v55 = v54;
          double v57 = v56;
          double v58 = sub_1000643CC(v131, v129, v51, v53);
          if (sub_1000643CC(v43, v45, v55, v57) - v58 > 3.0)
          {
            unint64_t v59 = 1;
            if (self->mMovingTouchIndex == 1) {
              unint64_t v59 = 2;
            }
            self->unint64_t mMovingTouchIndex = v59;
            [WeakRetained convertBoundsToUnscaledPoint:v43, v45];
            -[CRLiOSRepRotateGestureRecognizer p_angleForUnscaledTouchPoint:](self, "p_angleForUnscaledTouchPoint:");
            double v61 = v60;
            if (self->mMovingTouchIndex == 1) {
              double v62 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint1;
            }
            else {
              double v62 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint2;
            }
            -[CRLiOSRepRotateGestureRecognizer p_angleForUnscaledTouchPoint:](self, "p_angleForUnscaledTouchPoint:", *(double *)((char *)&self->super.super.isa + *v62), *(double *)((char *)&self->mICC + *v62));
            sub_100066410(v63 - v61);
            self->mAdditionalRotateInRadians = self->mLastAngle - v64;
          }
        }
      }

LABEL_36:
    }
    double v65 = *p_mTouch1;
    if (*p_mTouch1)
    {
      CGFloat v66 = [WeakRetained canvasView];
      [(UITouch *)v65 locationInView:v66];
      [WeakRetained convertBoundsToUnscaledPoint:];
      self->mLastProcessedTouchUnscaledPoint1.x = v67;
      self->mLastProcessedTouchUnscaledPoint1.y = v68;
    }
  }
  double v69 = &self->mTouch2;
  mTouch2 = self->mTouch2;
  if (mTouch2)
  {
    v71 = [WeakRetained canvasView];
    [(UITouch *)mTouch2 locationInView:v71];
    [WeakRetained convertBoundsToUnscaledPoint:];
    self->mLastProcessedTouchUnscaledPoint2.x = v72;
    self->mLastProcessedTouchUnscaledPoint2.y = v73;
  }
  uint64_t v74 = v8[805];
  uint64_t v75 = *(uint64_t *)((char *)&self->super.super.isa + v74);
  if (v75)
  {
    long long v76 = &self->mTouch1;
    if (v75 != 1) {
      long long v76 = &self->mTouch2;
    }
    long long v77 = *v76;
    objc_super v78 = &self->mTouch1;
    if (*(Class *)((char *)&self->super.super.isa + v74) != (Class)2) {
      objc_super v78 = &self->mTouch2;
    }
    v79 = *v78;
    if (v77)
    {
      v80 = [WeakRetained canvasView];
      [(UITouch *)v77 locationInView:v80];
      double v82 = v81;
      double v84 = v83;

      [WeakRetained convertUnscaledToBoundsPoint:self->mUnscaledRotationCenter.x, self->mUnscaledRotationCenter.y];
      if (!v79 && sub_1000643CC(v82, v84, v85, v86) > 2500.0) {
        self->mPinningTouchIsPresent = 0;
      }
    }
  }
  if (*p_mTouch1 && *v69)
  {
    if (!*(Class *)((char *)&self->super.super.isa + v74)) {
      goto LABEL_87;
    }
    if (![(CRLiOSRepRotateGestureRecognizer *)self state])
    {
      uint64_t v87 = *(uint64_t *)((char *)&self->super.super.isa + v74);
      BOOL v88 = v87 == 1;
      v89 = v87 == 1
          ? &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mLastProcessedTouchUnscaledPoint1
          : &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mLastProcessedTouchUnscaledPoint2;
      double v135 = *(double *)((char *)&self->super.super.isa + *v89);
      v90 = v88
          ? &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mLastProcessedTouchUnscaledPoint2
          : &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mLastProcessedTouchUnscaledPoint1;
      v91 = (double *)((char *)self + *v90);
      double v128 = *v91;
      double v130 = v91[1];
      v92 = v88
          ? &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint1
          : &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint2;
      double v127 = *(double *)((char *)&self->super.super.isa + *v92);
      v93 = v88
          ? &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint2
          : &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint1;
      [WeakRetained convertUnscaledToBoundsPoint:self->mLastProcessedTouchUnscaledPoint1.x, self->mLastProcessedTouchUnscaledPoint1.y, *(Class *)((char *)&self->super.super.isa + *v93), *(CRLInteractiveCanvasController **)((char *)&self->mICC + *v93)];
      double v95 = v94;
      double v97 = v96;
      [WeakRetained convertUnscaledToBoundsPoint:self->mLastProcessedTouchUnscaledPoint2.x, self->mLastProcessedTouchUnscaledPoint2.y];
      double v138 = v99;
      id obja = v98;
      [WeakRetained convertUnscaledToBoundsPoint:sub_100064680(self->mLastProcessedTouchUnscaledPoint1.x, self->mLastProcessedTouchUnscaledPoint1.y, self->mOriginalUnscaledPoint1.x)];
      double v101 = v100;
      double v103 = v102;
      [WeakRetained convertUnscaledToBoundsPoint:sub_100064680(self->mLastProcessedTouchUnscaledPoint2.x, self->mLastProcessedTouchUnscaledPoint2.y, self->mOriginalUnscaledPoint2.x)];
      double v105 = v104;
      double v107 = v106;
      [WeakRetained convertUnscaledToBoundsPoint:self->mUnscaledRotationCenter.x, self->mUnscaledRotationCenter.y];
      double v109 = v108;
      double v111 = v110;
      double v132 = v97;
      double v112 = sub_1000643CC(v95, v97, v108, v110);
      if (sub_1000653A8(v101, v103) > 1.0 || v112 < 2500.0)
      {
        double v113 = sub_1000653A8(v105, v107);
        double v114 = sub_1000643CC(*(double *)&obja, v138, v109, v111);
        if (v113 > 1.0 || v114 < 2500.0)
        {
          double v115 = sub_100064680(v125, v126, v127);
          double v117 = sub_100065C1C(v115, v116);
          double v118 = sub_100064680(v128, v130, v135);
          double v120 = sub_100065C1C(v118, v119);
          double v121 = fabs(fmod(v120 - v117, 6.28318531)) * 57.2957795;
          double v122 = vabdd_f64(sub_1000653B4(v95, v132, *(double *)&obja, v138), self->mOriginalBoundsDistance);
          if (v121 > 2.5 && v122 < 14.0)
          {
            [(CRLiOSRepRotateGestureRecognizer *)self p_beginTracking];
            goto LABEL_87;
          }
          if (v121 <= 2.5 && v122 >= 14.0) {
            -[CRLiOSRepRotateGestureRecognizer setState:](self, "setState:", 5, v122);
          }
        }
      }
    }
  }
  if (*(Class *)((char *)&self->super.super.isa + v74)
    && (*p_mTouch1 && (objc_msgSend(v6, "containsObject:") & 1) != 0
     || *v69 && objc_msgSend(v6, "containsObject:"))
    && (char *)[(CRLiOSRepRotateGestureRecognizer *)self state] - 1 <= (char *)1)
  {
    [(CRLiOSRepRotateGestureRecognizer *)self setState:2];
    [(CRLiOSRepRotateGestureRecognizer *)self p_updateTracker];
  }
LABEL_87:
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CRLiOSRepRotateGestureRecognizer;
  [(CRLiOSRepRotateGestureRecognizer *)&v34 touchesEnded:v6 withEvent:a4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (!v9) {
    goto LABEL_30;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v31;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v31 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(UITouch **)(*((void *)&v30 + 1) + 8 * i);
      mTouch1 = self->mTouch1;
      if (v13 == mTouch1 && self->mMovingTouchIndex == 1)
      {
        mTouch1 = self->mTouch2;
      }
      else
      {
        unint64_t mMovingTouchIndex = self->mMovingTouchIndex;
        if (v13 != self->mTouch2 || mMovingTouchIndex != 2)
        {
          if (!mMovingTouchIndex) {
            goto LABEL_26;
          }
          continue;
        }
      }
      unint64_t v17 = mTouch1;
      if ((id)[(UITouch *)v17 phase] == (id)3 || (id)[(UITouch *)v17 phase] == (id)4)
      {

LABEL_26:
        if ((char *)[(CRLiOSRepRotateGestureRecognizer *)self state] - 1 >= (char *)2) {
          uint64_t v29 = 5;
        }
        else {
          uint64_t v29 = 3;
        }
        [(CRLiOSRepRotateGestureRecognizer *)self setState:v29];
        goto LABEL_30;
      }
      unint64_t v18 = 1;
      if (self->mMovingTouchIndex == 1) {
        unint64_t v18 = 2;
      }
      self->unint64_t mMovingTouchIndex = v18;
      double v19 = [WeakRetained canvasView];
      [(UITouch *)v17 locationInView:v19];
      [WeakRetained convertBoundsToUnscaledPoint:];
      double v21 = v20;
      double v23 = v22;

      -[CRLiOSRepRotateGestureRecognizer p_angleForUnscaledTouchPoint:](self, "p_angleForUnscaledTouchPoint:", v21, v23);
      double v25 = v24;
      double v26 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint2;
      if (self->mMovingTouchIndex == 1) {
        double v26 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint1;
      }
      -[CRLiOSRepRotateGestureRecognizer p_angleForUnscaledTouchPoint:](self, "p_angleForUnscaledTouchPoint:", *(double *)((char *)&self->super.super.isa + *v26), *(double *)((char *)&self->mICC + *v26));
      sub_100066410(v27 - v25);
      self->mAdditionalRotateInRadians = self->mLastAngle - v28;
    }
    id v10 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_30:
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CRLiOSRepRotateGestureRecognizer;
  [(CRLiOSRepRotateGestureRecognizer *)&v18 touchesCancelled:v6 withEvent:a4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(UITouch **)(*((void *)&v14 + 1) + 8 * (void)v11);
        if (v12 == self->mTouch1 || v12 == self->mTouch2)
        {
          if ((char *)[(CRLiOSRepRotateGestureRecognizer *)self state] - 1 < (char *)2) {
            uint64_t v13 = 4;
          }
          else {
            uint64_t v13 = 5;
          }
          [(CRLiOSRepRotateGestureRecognizer *)self setState:v13];
        }
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)cancelBecauseOfRotation
{
  if (self->mTracker) {
    [(CRLiOSRepRotateGestureRecognizer *)self setState:4];
  }
}

- (double)rotation
{
  unint64_t mMovingTouchIndex = self->mMovingTouchIndex;
  if (!mMovingTouchIndex) {
    return 0.0;
  }
  if (mMovingTouchIndex == 1) {
    id v4 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mTouch1;
  }
  else {
    id v4 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mTouch2;
  }
  id v6 = *(id *)((char *)&self->super.super.isa + *v4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  id v8 = [WeakRetained canvasView];
  [v6 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  [WeakRetained convertBoundsToUnscaledPoint:v10, v12];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  -[CRLiOSRepRotateGestureRecognizer p_angleForUnscaledTouchPoint:](self, "p_angleForUnscaledTouchPoint:");
  double v18 = v17;
  if (self->mPinningTouchIsPresent
    && (objc_msgSend(WeakRetained, "convertUnscaledToBoundsPoint:", self->mUnscaledRotationCenter.x, self->mUnscaledRotationCenter.y), sub_1000643CC(v10, v12, v19, v20) < 2500.0))
  {
    if (self->mMovingTouchIndex == 1) {
      double v21 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint1;
    }
    else {
      double v21 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint2;
    }
    double v22 = (Class *)((char *)&self->super.super.isa + *v21);
    void *v22 = v14;
    v22[1] = v16;
    double mLastAngle = self->mLastAngle;
  }
  else
  {
    if (self->mMovingTouchIndex == 1) {
      double v23 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint1;
    }
    else {
      double v23 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint2;
    }
    -[CRLiOSRepRotateGestureRecognizer p_angleForUnscaledTouchPoint:](self, "p_angleForUnscaledTouchPoint:", *(double *)((char *)&self->super.super.isa + *v23), *(double *)((char *)&self->mICC + *v23));
    sub_100066410(v24 - v18 + self->mAdditionalRotateInRadians);
    double mLastAngle = v25;
    self->double mLastAngle = v25;
  }

  return mLastAngle;
}

- (BOOL)touchesAreInRep
{
  unint64_t mMovingTouchIndex = self->mMovingTouchIndex;
  if (!mMovingTouchIndex) {
    return 0;
  }
  if (mMovingTouchIndex == 1) {
    objc_super v3 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mTouch1;
  }
  else {
    objc_super v3 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mTouch2;
  }
  return [(CRLiOSRepRotateGestureRecognizer *)self p_touchIsInRep:*(Class *)((char *)&self->super.super.isa + *v3)];
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return 1;
}

- (CRLCanvasLayoutManipulatingTracker)tracker
{
  return self->mTracker;
}

- (BOOL)readyToEndOperation
{
  return [(CRLiOSRepRotateGestureRecognizer *)self state] == (id)3;
}

- (void)operationDidEnd
{
  if (self->mTracker)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
    id v4 = [WeakRetained dynamicOperationController];
    [(CRLiOSRepRotateGestureRecognizer *)self removeTarget:v4 action:"handleGestureRecognizer:"];

    mTracker = self->mTracker;
    self->mTracker = 0;
  }
}

- (BOOL)p_touchIsInRep:(id)a3
{
  objc_super v3 = self;
  p_mICC = &self->mICC;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_mICC);
  id v7 = [WeakRetained canvasView];
  [v5 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  [WeakRetained convertBoundsToUnscaledPoint:v9, v11];
  double v13 = v12;
  double v15 = v14;

  -[CRLCanvasRep convertNaturalPointFromUnscaledCanvas:](v3->mRep, "convertNaturalPointFromUnscaledCanvas:", v13, v15);
  LOBYTE(v3) = -[CRLCanvasRep containsPoint:withPrecision:](v3->mRep, "containsPoint:withPrecision:", 0);

  return (char)v3;
}

- (double)p_angleForUnscaledTouchPoint:(CGPoint)a3
{
  double v3 = sub_100064680(a3.x, a3.y, self->mUnscaledRotationCenter.x);
  return -sub_1000662B0(v3, v4);
}

- (void)p_beginTracking
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  long double v4 = [WeakRetained dynamicOperationController];
  id v5 = [WeakRetained tmCoordinator];
  if (!self->mTracker)
  {
    if ([v4 isInPossibleDynamicOperation]) {
      [v4 endOperation];
    }
    id v6 = [WeakRetained customRotateTrackerForCurrentSelection];
    mTracker = self->mTracker;
    self->mTracker = v6;

    double v8 = self->mTracker;
    if (v8)
    {
      [(CRLCanvasRepRotateTracking *)v8 unscaledCenterForRotation];
      self->mUnscaledRotationCenter.x = v9;
      self->mUnscaledRotationCenter.y = v10;
    }
    else
    {
      double v11 = [[CRLCanvasRepRotateTracker alloc] initWithRep:self->mRep];
      double v12 = self->mTracker;
      self->mTracker = (CRLCanvasRepRotateTracking *)v11;
    }
    double v13 = [(CRLCanvasRepRotateTracking *)self->mTracker repsBeingRotated];
    [(CRLiOSRepRotateGestureRecognizer *)self addTarget:v4 action:"handleGestureRecognizer:"];
    [v5 registerTrackerManipulator:self];
    if (([v5 takeControlWithTrackerManipulator:self] & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FA258);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B3010();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FA278);
      }
      double v14 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v14);
      }
      double v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepRotateGestureRecognizer p_beginTracking]");
      uint64_t v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepRotateGestureRecognizer.m"];
      +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:542 isFatal:0 description:"rotate GR did not successfully take control"];
    }
    if (([v4 isInOperation] & 1) == 0) {
      [v4 beginOperation];
    }
    [v4 startTransformingReps:v13];
    self->double mLastAngle = 0.0;
    if ([v13 count] == (id)1)
    {
      double v17 = [WeakRetained canvasEditor];
      double v18 = [v13 anyObject];
      double v19 = [v18 info];
      double v20 = [v17 selectionPathWithInfo:v19];

      double v21 = [WeakRetained editorController];
      [v21 setSelectionPath:v20];
    }
  }
  [(CRLiOSRepRotateGestureRecognizer *)self setState:1];
  self->mRecognitionIsBeingDelayed = 0;
}

- (void)p_recognizeAfterDelay:(double)a3
{
  if (!self->mRecognitionIsBeingDelayed)
  {
    self->mRecognitionIsBeingDelayed = 1;
    [(CRLiOSRepRotateGestureRecognizer *)self performSelector:"p_beginTracking" withObject:0 afterDelay:a3];
  }
}

- (void)p_cancelDelayedRecognition
{
  self->mRecognitionIsBeingDelayed = 0;
}

- (void)p_updateTracker
{
  double mLastAngle = self->mLastAngle;
  [(CRLiOSRepRotateGestureRecognizer *)self rotation];
  [(CRLCanvasRepRotateTracking *)self->mTracker addRotateDelta:v4 - mLastAngle];
  if (self->mMovingTouchIndex == 1) {
    id v5 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mTouch1;
  }
  else {
    id v5 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mTouch2;
  }
  id v17 = *(id *)((char *)&self->super.super.isa + *v5);
  id v6 = objc_loadWeakRetained((id *)&self->mICC);
  id v7 = [v6 canvasView];
  [v17 locationInView:v7];
  [v6 convertBoundsToUnscaledPoint:];
  double v9 = v8;
  double v11 = v10;

  double v12 = sub_1000653B4(v9, v11, self->mUnscaledRotationCenter.x, self->mUnscaledRotationCenter.y);
  double v13 = [(CRLCanvasRep *)self->mRep interactiveCanvasController];
  [v13 viewScale];
  double v15 = v12 * v14;

  double v16 = 2.0;
  if (v15 < 200.0) {
    double v16 = 4.0;
  }
  [(CRLCanvasRepRotateTracking *)self->mTracker setSnapThreshold:v16];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTracker, 0);
  objc_storeStrong((id *)&self->mRep, 0);
  objc_storeStrong((id *)&self->mTouch2, 0);
  objc_storeStrong((id *)&self->mTouch1, 0);

  objc_destroyWeak((id *)&self->mICC);
}

@end