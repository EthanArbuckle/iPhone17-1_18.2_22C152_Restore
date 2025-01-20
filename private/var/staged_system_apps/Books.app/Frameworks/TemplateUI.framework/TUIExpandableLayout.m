@interface TUIExpandableLayout
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidth;
- (BOOL)_isExpanded;
- (BOOL)didExamineChildren;
- (BOOL)shouldUseDefaultGuideForLayout:(id)a3 edge:(unint64_t)a4;
- (TUIExpandableContentLayout)expandableChild;
- (TUILayout)expandedContentChild;
- (TUILayout)moreChild;
- (double)computedHeightAbovePivot;
- (id)effectiveGuideBottom;
- (id)effectiveGuideLeading;
- (id)effectiveGuideTop;
- (id)effectiveGuideTrailing;
- (id)guideProviderForLayout:(id)a3;
- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4;
- (void)_examineChildrenIfNeeded;
- (void)computeLayout;
- (void)onChildrenUpdated;
- (void)setDidExamineChildren:(BOOL)a3;
- (void)setExpandableChild:(id)a3;
- (void)setExpandedContentChild:(id)a3;
- (void)setMoreChild:(id)a3;
@end

@implementation TUIExpandableLayout

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  v7 = [(TUILayout *)self box];
  v8 = [v7 viewState];

  v9 = 0;
  if (a3 >= 4 && v8)
  {
    v10 = objc_opt_new();
    v11 = [(TUILayout *)self box];
    v12 = [v11 pointerRefId];
    v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_moreChild);
      v16 = [WeakRetained box];
      id v14 = [v16 refId];
    }
    v34 = v14;

    v17 = [(TUILayout *)self box];
    v18 = [v17 pointerStyle];
    v19 = +[TUIPointer pointerWithRefId:v14 style:v18];

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_29E34;
    v37[3] = &unk_252320;
    v37[4] = self;
    id v20 = v6;
    id v38 = v20;
    id v39 = v10;
    id v33 = v10;
    [v20 evaluateWithPointer:v19 block:v37];
    CFStringRef v40 = @"press";
    v21 = objc_alloc_init(TUIElementBehaviorArgumentsMap);
    v41 = v21;
    v32 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];

    v31 = [[TUIElementTriggerBehaviorMap alloc] initWithMap:v32];
    v22 = [TUIElementActionTriggerHandler alloc];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_29F14;
    v35[3] = &unk_252348;
    id v23 = v8;
    id v36 = v23;
    v24 = [(TUIElementActionTriggerHandler *)v22 initWithActionsData:v31 block:v35];
    v25 = [(TUILayout *)self box];
    v26 = [v25 identifier];
    LOWORD(v30) = 0;
    LOBYTE(v29) = 0;
    LOBYTE(v28) = 1;
    +[TUIControlView renderModelWithStateToButtonAttributes:stateToRenderModel:imageModelIDToResource:actionHandler:viewState:linkEntities:type:role:userInterfaceStyle:enabled:pressScale:touchInsets:identifier:style:pointer:focusStyle:menu:contextMenuIsPrimaryAction:name:axAttributes:enableBackgroundForHighlightPreview:enableShadowForHighlightPreview:](TUIControlView, "renderModelWithStateToButtonAttributes:stateToRenderModel:imageModelIDToResource:actionHandler:viewState:linkEntities:type:role:userInterfaceStyle:enabled:pressScale:touchInsets:identifier:style:pointer:focusStyle:menu:contextMenuIsPrimaryAction:name:axAttributes:enableBackgroundForHighlightPreview:enableShadowForHighlightPreview:", 0, v33, 0, v24, v23, 0, 1.0, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, 0, 0, 0, v28,
      v26,
      0,
      v19,
      0,
      0,
      v29,
      0,
      0,
    v9 = v30);

    [(TUILayout *)self renderModelSizeWithContext:v20];
    [v9 setSize:];
  }
  return v9;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  v3 = [(TUIExpandableLayout *)self expandableChild];
  v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)[v3 validatedIntrinsicWidthConsideringSpecified];

  return v4;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  v3 = [(TUIExpandableLayout *)self expandableChild];
  v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)[v3 validatedIntrinsicHeightConsideringSpecified];

  return v4;
}

- (double)computedHeightAbovePivot
{
  v2 = [(TUIExpandableLayout *)self expandableChild];
  [v2 computedHeightAbovePivot];
  double v4 = v3;

  return v4;
}

- (void)onChildrenUpdated
{
  v3.receiver = self;
  v3.super_class = (Class)TUIExpandableLayout;
  [(TUILayout *)&v3 onChildrenUpdated];
  objc_storeWeak((id *)&self->_expandableChild, 0);
  objc_storeWeak((id *)&self->_expandedContentChild, 0);
  objc_storeWeak((id *)&self->_moreChild, 0);
  self->_didExamineChildren = 0;
}

- (void)computeLayout
{
  unsigned int v3 = [(TUIExpandableLayout *)self _isExpanded];
  double v4 = [(TUIExpandableLayout *)self expandableChild];
  int v5 = v3 ^ 1;
  if (v4) {
    int v6 = v3 ^ 1;
  }
  else {
    int v6 = 0;
  }

  if (v6 == 1)
  {
    v7 = [(TUIExpandableLayout *)self moreChild];
    [v7 validateLayout];

    v8 = [(TUIExpandableLayout *)self moreChild];
    [v8 computedTransformedSize];
    double v10 = v9;
    v11 = [(TUIExpandableLayout *)self expandableChild];
    [v11 setExpandableMoreWidth:v10];
  }
  [(TUILayout *)self flexedWidth];
  double v13 = v12;
  id v14 = [(TUIExpandableLayout *)self expandableChild];
  [v14 setFlexedWidth:v13];

  [(TUILayout *)self flexedHeight];
  double v16 = v15;
  v17 = [(TUIExpandableLayout *)self expandableChild];
  [v17 setFlexedHeight:v16];

  [(TUILayout *)self computeWidth];
  double v19 = v18;
  id v20 = [(TUIExpandableLayout *)self expandableChild];
  [v20 setContainingWidth:v19];

  [(TUILayout *)self containingHeight];
  [(TUILayout *)self containingHeight];
  double v22 = v21;
  id v23 = [(TUIExpandableLayout *)self expandableChild];
  [v23 setContainingHeight:v22];

  v24 = [(TUIExpandableLayout *)self expandableChild];
  [v24 validateLayout];

  v25 = [(TUIExpandableLayout *)self expandableChild];
  [v25 computedTransformedSize];
  double v27 = v26;
  double v29 = v28;

  uint64_t v30 = [(TUIExpandableLayout *)self expandableChild];
  unsigned int v31 = [v30 expandableContentIsTruncated];

  uint64_t v32 = v5 & v31;
  id v33 = [(TUIExpandableLayout *)self moreChild];
  [v33 setHidden:v6 & v32 ^ 1];

  v34 = [(TUIExpandableLayout *)self expandedContentChild];
  [v34 setHidden:v32];

  if ((((v6 & v32) ^ 1) & 1) == 0)
  {
    v35 = [(TUIExpandableLayout *)self expandableChild];
    [v35 expandableMoreXOffset];
    double v37 = v36;

    id v38 = [(TUIExpandableLayout *)self expandableChild];
    [v38 computedOrigin];
    double v40 = v39;
    v41 = [(TUIExpandableLayout *)self expandableChild];
    [v41 computedHeightAbovePivot];
    double v43 = v40 + v42;
    v44 = [(TUIExpandableLayout *)self moreChild];
    [v44 computedHeightAbovePivot];
    double v46 = v43 - v45;

    v47 = [(TUIExpandableLayout *)self moreChild];
    -[TUIVStack setComputedOrigin:](v47, "setComputedOrigin:", v37, v46);
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v48 = [(TUIExpandableLayout *)self expandedContentChild];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [(TUIExpandableLayout *)self expandedContentChild];
    unsigned __int8 v51 = [v50 hidden];

    if ((v51 & 1) == 0)
    {
      v52 = [TUIVStack alloc];
      v53 = [(TUIExpandableLayout *)self expandableChild];
      v58[0] = v53;
      v54 = [(TUIExpandableLayout *)self expandedContentChild];
      v58[1] = v54;
      v55 = +[NSArray arrayWithObjects:v58 count:2];
      v47 = [(TUIVStack *)v52 initWithLayout:self children:v55];

      [(TUILayout *)self flexedHeight];
      -[TUIVStack setFlexedHeight:](v47, "setFlexedHeight:");
      [(TUIVStack *)v47 setWidth:v19];
      -[TUIVStack computeLayoutWithOffset:](v47, "computeLayoutWithOffset:", CGPointZero.x, CGPointZero.y);
      [(TUIVStack *)v47 computedSize];
      double v27 = v56;
      double v29 = v57;
      goto LABEL_11;
    }
  }
LABEL_12:
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v27, v29);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidth
{
  unsigned int v3 = [(TUIExpandableLayout *)self expandableChild];
  double v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)[v3 computedContentWidth];

  return v4;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentHeight
{
  unsigned int v3 = [(TUIExpandableLayout *)self expandableChild];
  double v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)[v3 computedContentHeight];

  return v4;
}

- (id)guideProviderForLayout:(id)a3
{
  id v4 = a3;
  int v5 = [(TUILayout *)self layoutAncestor];
  int v6 = [v5 guideProviderForLayout:v4];

  return v6;
}

- (BOOL)shouldUseDefaultGuideForLayout:(id)a3 edge:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 layoutAncestor];
  if (v7 == self)
  {
    double v9 = [v6 box];
    if ([v9 role])
    {
      unsigned __int8 v8 = 0;
    }
    else
    {
      double v10 = [(TUILayout *)self layoutAncestor];
      unsigned __int8 v8 = [v10 shouldUseDefaultGuideForLayout:self edge:a4];
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)effectiveGuideTop
{
  v2 = [(TUIExpandableLayout *)self expandableChild];
  unsigned int v3 = [v2 effectiveGuideTop];

  return v3;
}

- (id)effectiveGuideBottom
{
  v2 = [(TUIExpandableLayout *)self expandableChild];
  unsigned int v3 = [v2 effectiveGuideBottom];

  return v3;
}

- (id)effectiveGuideLeading
{
  v2 = [(TUIExpandableLayout *)self expandableChild];
  unsigned int v3 = [v2 effectiveGuideLeading];

  return v3;
}

- (id)effectiveGuideTrailing
{
  v2 = [(TUIExpandableLayout *)self expandableChild];
  unsigned int v3 = [v2 effectiveGuideTrailing];

  return v3;
}

- (TUIExpandableContentLayout)expandableChild
{
  [(TUIExpandableLayout *)self _examineChildrenIfNeeded];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_expandableChild);

  return (TUIExpandableContentLayout *)WeakRetained;
}

- (TUILayout)moreChild
{
  [(TUIExpandableLayout *)self _examineChildrenIfNeeded];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_moreChild);

  return (TUILayout *)WeakRetained;
}

- (void)_examineChildrenIfNeeded
{
  if (![(TUIExpandableLayout *)self didExamineChildren])
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    unsigned int v3 = [(TUILayout *)self children];
    id v4 = [v3 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (!v4) {
      goto LABEL_28;
    }
    id v5 = v4;
    uint64_t v6 = *(void *)v31;
    while (1)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned __int8 v8 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        double v9 = [v8 box];
        id v10 = [v9 role];

        if (v10)
        {
          v11 = [v8 box];
          double v12 = (char *)[v11 role];

          if (v12 == (unsigned char *)&def_141F14 + 2)
          {
            p_expandedContentChild = &self->_expandedContentChild;
            id WeakRetained = objc_loadWeakRetained((id *)&self->_expandedContentChild);

            if (WeakRetained)
            {
              double v15 = TUIDefaultLog();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
                sub_190F3C((uint64_t)v35, (uint64_t)self);
              }
              goto LABEL_24;
            }
          }
          else
          {
            double v27 = [v8 box];
            double v28 = (char *)[v27 role];

            if (v28 != (unsigned char *)&dword_4 + 1) {
              continue;
            }
            p_expandedContentChild = &self->_moreChild;
            id v29 = objc_loadWeakRetained((id *)&self->_moreChild);

            if (v29)
            {
              double v15 = TUIDefaultLog();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
                sub_190F98((uint64_t)v34, (uint64_t)self);
              }
LABEL_24:
            }
          }
          objc_storeWeak((id *)p_expandedContentChild, v8);
          continue;
        }
        id v16 = objc_loadWeakRetained((id *)&self->_expandableChild);

        if (v16)
        {
          v17 = TUIDefaultLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_190EE0((uint64_t)v37, (uint64_t)self);
          }
        }
        uint64_t v18 = objc_opt_class();
        v24 = TUIClassAndProtocolCast(v8, v18, 1, v19, v20, v21, v22, v23, (uint64_t)&OBJC_PROTOCOL___TUIExpandableContentLayout);
        objc_storeWeak((id *)&self->_expandableChild, v24);

        id v25 = objc_loadWeakRetained((id *)&self->_expandableChild);
        if (!v25)
        {
          double v26 = TUIDefaultLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            sub_190E84((uint64_t)v36, (uint64_t)self);
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (!v5)
      {
LABEL_28:

        [(TUIExpandableLayout *)self setDidExamineChildren:1];
        return;
      }
    }
  }
}

- (BOOL)_isExpanded
{
  v2 = [(TUILayout *)self box];
  unsigned int v3 = [v2 viewState];
  id v4 = [v3 value];
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (void)setExpandableChild:(id)a3
{
}

- (TUILayout)expandedContentChild
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_expandedContentChild);

  return (TUILayout *)WeakRetained;
}

- (void)setExpandedContentChild:(id)a3
{
}

- (void)setMoreChild:(id)a3
{
}

- (BOOL)didExamineChildren
{
  return self->_didExamineChildren;
}

- (void)setDidExamineChildren:(BOOL)a3
{
  self->_didExamineChildren = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_moreChild);
  objc_destroyWeak((id *)&self->_expandedContentChild);

  objc_destroyWeak((id *)&self->_expandableChild);
}

@end