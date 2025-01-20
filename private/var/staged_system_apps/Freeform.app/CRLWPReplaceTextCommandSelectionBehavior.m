@interface CRLWPReplaceTextCommandSelectionBehavior
- (id)commandSelectionBehaviorByCoalescingWithCommandSelectionBehavior:(id)a3;
@end

@implementation CRLWPReplaceTextCommandSelectionBehavior

- (id)commandSelectionBehaviorByCoalescingWithCommandSelectionBehavior:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  p_vtable = __CRLWPShapeRepAccessibility_super.vtable;
  if ([v5 isEqual:objc_opt_class()])
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = [(CRLCommandSelectionBehavior *)self commitSelectionPath];
    v9 = [v8 mostSpecificSelectionOfClass:objc_opt_class()];
    v10 = sub_10024715C(v7, v9);

    v11 = (objc_class *)objc_opt_class();
    v12 = [v4 commitSelectionPath];
    v13 = [v12 mostSpecificSelectionOfClass:objc_opt_class()];
    v14 = sub_10024715C(v11, v13);

    v15 = [v10 boardItems];
    v16 = [v14 boardItems];
    LODWORD(v13) = [v15 isEqual:v16];

    if (v13)
    {
      v17 = [_TtC8Freeform25CRLSelectionPathValidator alloc];
      v18 = [v10 boardItems];
      v19 = [v18 anyObject];
      v20 = [v19 parentBoard];
      v21 = objc_opt_new();
      v22 = [(CRLSelectionPathValidator *)v17 initWithBoard:v20 translator:v21];

      v23 = [(CRLCommandSelectionBehavior *)self persistableForwardSelectionPath];
      v24 = v22;
      v47 = v22;
      v25 = [(CRLSelectionPathValidator *)v22 selectionPathFromPersistableSelectionPath:v23];

      v26 = (objc_class *)objc_opt_class();
      v48 = v25;
      v27 = [v25 mostSpecificSelectionOfClass:objc_opt_class()];
      v28 = sub_10024715C(v26, v27);

      +[CRLWPSelection selectionFromWPSelection:v28];
      v29 = id v49 = v4;
      [v29 setTailCursorAffinity:2];
      v46 = [v25 selectionPathReplacingMostSpecificLocationOfSelection:v28 withSelection:v29];
      v50 = [[_TtC8Freeform27CRLPersistableSelectionPath alloc] initWithSelectionPath:v46];
      v30 = [(CRLCommandSelectionBehavior *)self persistableReverseSelectionPath];
      v31 = [(CRLSelectionPathValidator *)v24 selectionPathFromPersistableSelectionPath:v30];

      v32 = (objc_class *)objc_opt_class();
      v33 = [v31 mostSpecificSelectionOfClass:objc_opt_class()];
      sub_10024715C(v32, v33);
      v35 = v34 = v10;

      v36 = +[CRLWPSelection selectionFromWPSelection:v35];
      [v36 setTailCursorAffinity:2];
      v37 = [v31 selectionPathReplacingMostSpecificLocationOfSelection:v35 withSelection:v36];
      v38 = [[_TtC8Freeform27CRLPersistableSelectionPath alloc] initWithSelectionPath:v37];

      p_vtable = (void **)(__CRLWPShapeRepAccessibility_super + 24);
      v10 = v34;

      v39 = v50;
      id v4 = v49;
    }
    else
    {
      v38 = 0;
      v39 = 0;
    }

    v40 = (CRLWPReplaceTextCommandSelectionBehavior *)objc_alloc((Class)(p_vtable + 152));
    if (v39)
    {
      int v41 = 0;
      v51 = v39;
      goto LABEL_9;
    }
  }
  else
  {
    v40 = [CRLWPReplaceTextCommandSelectionBehavior alloc];
    v38 = 0;
  }
  v39 = [v4 persistableForwardSelectionPath];
  v51 = 0;
  int v41 = 1;
LABEL_9:
  v42 = v38;
  if (!v38)
  {
    v42 = [v4 persistableReverseSelectionPath];
  }
  v43 = [(CRLCommandSelectionBehavior *)self commitSelectionPath];
  v44 = -[CRLCommandSelectionBehavior initWithPersistableForwardSelectionPath:persistableReverseSelectionPath:commitSelectionPath:selectionFlags:commitSelectionFlags:forwardSelectionFlags:reverseSelectionFlags:](v40, "initWithPersistableForwardSelectionPath:persistableReverseSelectionPath:commitSelectionPath:selectionFlags:commitSelectionFlags:forwardSelectionFlags:reverseSelectionFlags:", v39, v42, v43, -[CRLCommandSelectionBehavior selectionFlags](self, "selectionFlags"), 0, [v4 additionalForwardSelectionFlags], -[CRLCommandSelectionBehavior additionalReverseSelectionFlags](self, "additionalReverseSelectionFlags"));

  if (v38)
  {
    if (!v41) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  if (v41) {
LABEL_13:
  }

LABEL_14:

  return v44;
}

@end