@interface TUIHFlowLayout
- (BOOL)isVerticallyAligningChildren;
- (BOOL)shouldUseDefaultGuideForLayout:(id)a3 edge:(unint64_t)a4;
- (TUIHFlowLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5;
- (id)defaultGuideSpecForLayout:(id)a3 edge:(unint64_t)a4;
- (id)guideForLayout:(id)a3 spec:(id)a4;
- (id)guideLayoutControllerForLayout:(id)a3;
- (id)guideProviderForLayout:(id)a3;
- (unint64_t)visibleBoundsGeneration;
- (void)computeLayout;
- (void)onChildInvalidate:(id)a3;
@end

@implementation TUIHFlowLayout

- (TUIHFlowLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TUIHFlowLayout;
  v11 = [(TUILayout *)&v16 initWithModel:v8 parent:v9 controller:v10];
  v12 = v11;
  if (v11)
  {
    [(TUILayout *)v11 specifiedWidth];
    if ((v13 & 0x6000000000000) == 0x2000000000000) {
      [(TUILayout *)v12 setSpecifiedHeightComputeInherited:1];
    }
    v14 = [(TUILayout *)v12 box];
    v12->_guideLayout = [v14 layoutMode] == (char *)&def_141F14 + 1;
  }
  return v12;
}

- (id)guideLayoutControllerForLayout:(id)a3
{
  v4 = (TUIHFlowLayout *)a3;
  if (v4)
  {
    while (1)
    {
      v5 = [(TUILayout *)v4 layoutAncestor];
      if (v5 == self) {
        break;
      }

      v4 = v5;
      if (!v5) {
        goto LABEL_6;
      }
    }
  }
LABEL_6:
  v6 = [(TUILayout *)v4 guideLayoutController];

  return v6;
}

- (id)guideForLayout:(id)a3 spec:(id)a4
{
  id v6 = a4;
  v7 = [(TUIHFlowLayout *)self guideLayoutControllerForLayout:a3];
  id v8 = [v7 guideForSpec:v6];

  return v8;
}

- (id)guideProviderForLayout:(id)a3
{
  if (!self->_guideLayout) {
    self = 0;
  }
  return self;
}

- (id)defaultGuideSpecForLayout:(id)a3 edge:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2
    && [v5 shouldUseDefaultGuideForLayout:v5 edge:a4])
  {
    v7 = +[TUIGuideSpec unbound];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)shouldUseDefaultGuideForLayout:(id)a3 edge:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if (self->_guideLayout)
  {
    id v8 = [v6 layoutAncestor];
    unsigned __int8 v9 = v8 == self;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TUIHFlowLayout;
    unsigned __int8 v9 = [(TUILayout *)&v11 shouldUseDefaultGuideForLayout:v6 edge:a4];
  }

  return v9;
}

- (BOOL)isVerticallyAligningChildren
{
  return 1;
}

- (void)computeLayout
{
  [(TUILayout *)self computeWidth];
  double v4 = v3;
  v33 = objc_opt_new();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v5 = [(TUILayout *)self children];
  id v6 = 0;
  id v7 = [v5 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v44;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v44 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        [v10 setFlexedWidth:NAN];
        [(TUILayout *)self containingWidth];
        [v10 setContainingWidth:];
        [v10 validateLayout];
        if (([v10 hidden] & 1) == 0
          && ![(TUIMutableHStack *)v6 addChildLayout:v10 ifFitting:1])
        {
          objc_super v11 = [TUIMutableHStack alloc];
          v12 = [(TUILayout *)self box];
          id v13 = [v12 hspacing];
          v15 = -[TUIMutableHStack initWithLayout:spacing:maxWidth:](v11, "initWithLayout:spacing:maxWidth:", self, v13, v14, v4);

          id v6 = v15;
          if (self->_guideLayout)
          {
            objc_super v16 = objc_alloc_init(TUIGuideLayoutController);
            [(TUIHStack *)v15 setGuideLayoutController:v16];
          }
          [v33 addObject:v15];
          [(TUIMutableHStack *)v15 addChildLayout:v10 ifFitting:0];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v7);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v17 = v33;
  id v18 = [v17 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v40;
    double v20 = 0.0;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v39 + 1) + 8 * (void)j) accumulatedWidth];
        double v20 = fmax(v20, v22);
      }
      id v18 = [v17 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v18);
  }
  else
  {
    double v20 = 0.0;
  }

  uint64_t v35 = 0;
  v36 = (double *)&v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  v23 = [(TUILayout *)self box];
  [v23 vspacing];

  v24 = [(TUILayout *)self box];
  float v25 = COERCE_FLOAT([v24 vspacing]);

  double v26 = v25;
  unint64_t v27 = [(TUILayout *)self computedLayoutDirection];
  v28 = [(TUILayout *)self layoutAncestor];
  unsigned __int8 v29 = [v28 isHorizontallyAligningChildren];

  double v30 = 0.0;
  if (v29)
  {
    double v4 = v20;
  }
  else
  {
    v31 = [(TUILayout *)self box];
    v32 = (char *)[v31 halign];

    if ((unint64_t)v32 < 2)
    {
      if (v27 == 2) {
        double v30 = v4 - v20;
      }
      else {
        double v30 = 0.0;
      }
    }
    else if (v32 == (unsigned char *)&def_141F14 + 2)
    {
      double v30 = (v4 - v20) * 0.5;
    }
    else if (v32 == (unsigned char *)&def_141F14 + 3)
    {
      if (v27 == 2) {
        double v30 = 0.0;
      }
      else {
        double v30 = v4 - v20;
      }
    }
  }
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_478AC;
  v34[3] = &unk_252B78;
  v34[4] = &v35;
  *(double *)&v34[5] = v26;
  *(double *)&v34[6] = v30;
  *(double *)&v34[7] = v4;
  [v17 enumerateObjectsUsingBlock:v34];
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v4, v36[3]);
  _Block_object_dispose(&v35, 8);
}

- (void)onChildInvalidate:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TUIHFlowLayout;
  [(TUILayout *)&v5 onChildInvalidate:v4];
  [v4 setFlexedWidth:NAN];
}

- (unint64_t)visibleBoundsGeneration
{
  return self->_visibleBoundsGeneration;
}

@end