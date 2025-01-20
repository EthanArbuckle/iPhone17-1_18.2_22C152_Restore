@interface CRLiOSEditMenuTapGestureRecognizer
- (BOOL)ignoreTargetAction;
- (CRLCanvasRep)touchedRep;
- (int64_t)touchTypeForTap;
- (void)reset;
- (void)setIgnoreTargetAction:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation CRLiOSEditMenuTapGestureRecognizer

- (void)reset
{
  self->_ignoreTargetAction = 0;
  touchedRep = self->_touchedRep;
  self->_touchedRep = 0;

  self->_touchTypeForTap = 0;
  v4.receiver = self;
  v4.super_class = (Class)CRLiOSEditMenuTapGestureRecognizer;
  [(CRLiOSEditMenuTapGestureRecognizer *)&v4 reset];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CRLiOSEditMenuTapGestureRecognizer *)self delegate];
  v15 = sub_100246B08(v8, 1, v9, v10, v11, v12, v13, v14, (uint64_t)&OBJC_PROTOCOL___CRLUIKitInteractionHost);

  v16 = [v15 interactiveCanvasController];
  if (((unint64_t)[(CRLiOSEditMenuTapGestureRecognizer *)self modifierFlags] & 0x120000) == 0)
  {
    if ([(CRLiOSEditMenuTapGestureRecognizer *)self numberOfTouches]) {
      goto LABEL_19;
    }
    v17 = [v7 allTouches];
    if ([v17 count] != (id)1) {
      goto LABEL_18;
    }
    unsigned __int8 v18 = [v16 currentlyScrolling];

    if (v18) {
      goto LABEL_19;
    }
    v19 = [v6 anyObject];
    v17 = v19;
    if (!v19 || [v19 tapCount] != (id)1)
    {
LABEL_18:

LABEL_19:
      if (self->_touchedRep) {
        goto LABEL_20;
      }
      goto LABEL_2;
    }
    v20 = [(CRLiOSEditMenuTapGestureRecognizer *)self view];
    [v17 locationInView:v20];
    double v22 = v21;
    double v24 = v23;

    [v16 convertBoundsToUnscaledPoint:v22, v24];
    double v26 = v25;
    double v28 = v27;
    id v42 = 0;
    v29 = objc_msgSend(v16, "hitKnobAtPoint:inputType:returningRep:", sub_10036FEA4((BOOL)objc_msgSend(v17, "type")), &v42, v25, v27);
    id v30 = v42;
    v31 = v30;
    if (!v29
      || !objc_msgSend(v30, "wantsEditMenuForTapAtPoint:onKnob:", v29, v26, v28)
      || (id v32 = v31) == 0)
    {
      v40 = v31;
      v33 = [v16 hitRep:v26, v28];
      id v32 = [v33 repForSelecting];

      if (!v32) {
        goto LABEL_16;
      }
      uint64_t v34 = [v32 info];
      if (!v34) {
        goto LABEL_16;
      }
      v35 = (void *)v34;
      v38 = [v16 layerHost];
      [v38 asUIKitHost];
      v36 = v39 = v29;
      unsigned __int8 v37 = [v36 shouldSelectAndShowEditMenuOnFirstTapForRep:v32];

      v29 = v39;
      if ((v37 & 1) == 0)
      {
LABEL_16:

        id v32 = 0;
        v31 = v40;
        goto LABEL_17;
      }
      v31 = v40;
    }
    objc_storeStrong((id *)&self->_touchedRep, v32);
    self->_ignoreTargetAction = 0;
    self->_touchTypeForTap = (int64_t)[v17 type];
    v41.receiver = self;
    v41.super_class = (Class)CRLiOSEditMenuTapGestureRecognizer;
    [(CRLiOSEditMenuTapGestureRecognizer *)&v41 touchesBegan:v6 withEvent:v7];
LABEL_17:

    goto LABEL_18;
  }
LABEL_2:
  [(CRLiOSEditMenuTapGestureRecognizer *)self setState:5];
LABEL_20:
}

- (CRLCanvasRep)touchedRep
{
  return self->_touchedRep;
}

- (BOOL)ignoreTargetAction
{
  return self->_ignoreTargetAction;
}

- (void)setIgnoreTargetAction:(BOOL)a3
{
  self->_ignoreTargetAction = a3;
}

- (int64_t)touchTypeForTap
{
  return self->_touchTypeForTap;
}

- (void).cxx_destruct
{
}

@end