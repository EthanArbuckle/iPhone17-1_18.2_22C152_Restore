@interface UIFocusEffectManager
@end

@implementation UIFocusEffectManager

void __41___UIFocusEffectManager_moveFocusToItem___block_invoke(uint64_t a1)
{
  id v42 = [*(id *)(a1 + 32) haloView];
  uint64_t v2 = [*(id *)(a1 + 40) position];
  switch(v2)
  {
    case 2:
      BOOL v29 = 1;
      goto LABEL_32;
    case 1:
      BOOL v29 = 0;
      goto LABEL_32;
    case 0:
      v3 = *(void **)(a1 + 48);
      v4 = *(void **)(a1 + 56);
      [v42 totalConsumedSpace];
      CGFloat v6 = v5;
      id v7 = v3;
      id v8 = v4;
      v9 = v8;
      if (!v8) {
        goto LABEL_30;
      }
      id v10 = v8;
      while (1)
      {
        double v11 = _UIFocusItemFrameInCoordinateSpace(v7, v10);
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        id v18 = v10;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (![v18 clipsToBounds]) {
          goto LABEL_15;
        }
        [v18 bounds];
        CGRect v49 = CGRectInset(v48, v6, v6);
        v51.origin.x = v11;
        v51.origin.y = v13;
        v51.size.double width = v15;
        v51.size.double height = v17;
        BOOL v28 = CGRectContainsRect(v49, v51);

        if (!v28)
        {
          id v10 = v18;
          goto LABEL_31;
        }
LABEL_16:
        id v10 = [v18 superview];

        if (!v10) {
          goto LABEL_31;
        }
      }
      id v10 = v18;
      [v10 contentSize];
      double v20 = v19;
      [v10 frame];
      BOOL v22 = v20 > v21;
      [v10 contentSize];
      double v24 = v23;
      [v10 frame];
      unint64_t v26 = (v24 > v25) | (unint64_t)(2 * v22);
      v44.origin.x = v11;
      v44.origin.y = v13;
      v44.size.double width = v15;
      v44.size.double height = v17;
      CGRect v45 = CGRectInset(v44, -v6, -v6);
      if (v26)
      {
        if (v26 != 1)
        {
          if (v26 != 3)
          {
            double width = v45.size.width;
            if (objc_msgSend(v10, "clipsToBounds", v45.origin.x, v45.origin.y))
            {
              [v10 frame];
              double v32 = v31;

              if (width >= v32) {
                goto LABEL_31;
              }
LABEL_29:

LABEL_30:
              id v10 = 0;
              goto LABEL_31;
            }
          }
LABEL_28:

          goto LABEL_29;
        }
        double height = v45.size.height;
        if (!objc_msgSend(v10, "clipsToBounds", v45.origin.x, v45.origin.y, v45.size.width)) {
          goto LABEL_28;
        }
        [v10 frame];
        double v35 = v34;

        if (height < v35) {
          goto LABEL_29;
        }
LABEL_31:
        BOOL v29 = v10 != 0;

LABEL_32:
        [v42 setPosition:v29];
        break;
      }
      if (objc_msgSend(v10, "clipsToBounds", v45.origin.x, v45.origin.y, v45.size.width, v45.size.height))
      {
        [v10 bounds];
        CGRect v47 = CGRectInset(v46, v6, v6);
        v50.origin.x = v11;
        v50.origin.y = v13;
        v50.size.double width = v15;
        v50.size.double height = v17;
        BOOL v27 = CGRectContainsRect(v47, v50);

        if (!v27) {
          goto LABEL_31;
        }
        goto LABEL_16;
      }

LABEL_15:
      goto LABEL_16;
  }
  if (dyld_program_sdk_at_least()
    && ([*(id *)(a1 + 40) referenceView], (uint64_t v36 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v37 = (void *)v36;
    while (1)
    {
      v38 = [v37 superview];
      v39 = *(void **)(a1 + 56);

      if (v38 == v39) {
        break;
      }
      uint64_t v40 = [v37 superview];

      v37 = (void *)v40;
      if (!v40) {
        goto LABEL_38;
      }
    }
    [*(id *)(a1 + 56) insertSubview:v42 above:v37];
  }
  else
  {
LABEL_38:
    [*(id *)(a1 + 56) addSubview:v42];
  }
  [v42 setGeometryFrozen:0];
  [*(id *)(a1 + 64) bounds];
  objc_msgSend(v42, "setFrame:");
  v41 = [*(id *)(a1 + 64) zeroOriginShape];
  [v42 setShape:v41];

  [v42 setGeometryFrozen:1];
}

@end