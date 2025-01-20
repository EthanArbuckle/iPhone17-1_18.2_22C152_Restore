@interface _UIContextMenuLayoutArbiter
- ($9638EFF0CCCAFE90921E224CC361F7AC)menuAnchor;
- (CGPoint)_computedMenuAnchorPointForMenuFrame:(CGRect)a3 previewFrame:(CGRect)a4;
- (CGRect)_computedMenuBoundsForContentBounds:(CGRect)a3 predictedPreviewFrame:(CGRect)a4;
- (CGRect)_computedPreviewBoundsForContentBounds:(CGRect)a3 sourceWindowBounds:(CGRect)a4;
- (CGRect)contentBounds;
- (CGRect)contentBoundsForConstrainingPreview;
- (CGRect)sourceWindowBounds;
- (UIView)containerView;
- (_UIContextMenuLayoutArbiter)initWithContainerView:(id)a3 layout:(unint64_t)a4;
- (_UIContextMenuLayoutArbiterInput)currentInput;
- (double)_applyEdgeInsetsToBounds:(void *)a1;
- (double)contentSpacing;
- (id)_accessoryPositionsForBaseLayout:(id)a3;
- (id)computedLayoutWithInput:(id)a3;
- (unint64_t)_automaticAlignmentAndOffset:(double *)a3 forAttachment:(unint64_t)a4 sourcePoint:(CGPoint)a5;
- (unint64_t)_defaultAttachmentEdge;
- (unint64_t)currentLayout;
- (void)_drawContentBoundsDebugUI:(CGRect)a3;
- (void)_positionPlatterFrame:(CGRect *)a3 andActionViewFrame:(CGRect *)a4 inBounds:(CGRect)a5 aboutSourcePoint:(CGPoint)a6;
- (void)setContainerView:(id)a3;
- (void)setCurrentInput:(id)a3;
- (void)setCurrentLayout:(unint64_t)a3;
@end

@implementation _UIContextMenuLayoutArbiter

- (_UIContextMenuLayoutArbiter)initWithContainerView:(id)a3 layout:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIContextMenuLayoutArbiter;
  v7 = [(_UIContextMenuLayoutArbiter *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(_UIContextMenuLayoutArbiter *)v7 setContainerView:v6];
    [(_UIContextMenuLayoutArbiter *)v8 setCurrentLayout:a4];
    v8->_menuAnchor.gravity = 0;
    *(_OWORD *)&v8->_menuAnchor.attachment = _UIContextMenuNullAnchor_0;
    *(_OWORD *)&v8->_menuAnchor.attachmentOffset = *(_OWORD *)algn_186B96AA8;
  }

  return v8;
}

- ($9638EFF0CCCAFE90921E224CC361F7AC)menuAnchor
{
  p_var4 = &self->var4;
  if (self->var4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = self;
    self = ($9638EFF0CCCAFE90921E224CC361F7AC *)[($9638EFF0CCCAFE90921E224CC361F7AC *)self _defaultAttachmentEdge];
    v5->var4 = (int64_t)self;
  }
  long long v6 = *((_OWORD *)p_var4 + 1);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)p_var4;
  *(_OWORD *)&retstr->var2 = v6;
  retstr->var4 = p_var4[4];
  return self;
}

- (id)computedLayoutWithInput:(id)a3
{
  id v4 = a3;
  [(_UIContextMenuLayoutArbiter *)self setCurrentInput:v4];
  CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  v118.CGPoint origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v118.CGSize size = v5;
  [v4 preferredMenuSize];
  v117.origin.CGFloat x = 0.0;
  v117.origin.CGFloat y = 0.0;
  v117.size.width = v6;
  v117.size.height = v7;
  if (([v4 shouldUpdateAttachment] & 1) != 0
    || self->_menuAnchor.attachment == 0x7FFFFFFFFFFFFFFFLL && self->_menuAnchor.alignment == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = [(_UIContextMenuLayoutArbiter *)self currentInput];
    v9 = v8;
    if (v8)
    {
      [v8 preferredAnchor];
    }
    else
    {
      double v110 = 0.0;
      long long v108 = 0u;
      CGSize v109 = (CGSize)0;
    }
    CGSize v10 = v109;
    *(_OWORD *)&self->_menuAnchor.attachment = v108;
    *(CGSize *)&self->_menuAnchor.attachmentOffset = v10;
    *(double *)&self->_menuAnchor.gravitCGFloat y = v110;
  }
  v11 = [(_UIContextMenuLayoutArbiter *)self containerView];
  [(_UIContextMenuLayoutArbiter *)self contentBounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [v11 traitCollection];
  v21 = _UIContextMenuGetPlatformMetrics([v20 userInterfaceIdiom]);

  v22 = [v4 sourcePreview];
  v23 = [v22 target];
  id v24 = v11;
  [v23 center];
  double v26 = v25;
  double v28 = v27;
  v29 = [v23 container];
  double v99 = _UIContextMenuConvertPointBetweenViews(v29, v24, v26, v28);
  double v96 = v30;

  v31 = [v4 sourcePreview];
  uint64_t v32 = [v31 target];
  id v33 = v24;
  [(id)v32 center];
  double v35 = v34;
  double v37 = v36;
  v38 = [(id)v32 container];
  _UIContextMenuConvertPointBetweenViews(v38, v33, v35, v37);

  [(_UIContextMenuLayoutArbiter *)self contentBounds];
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  [(_UIContextMenuLayoutArbiter *)self sourceWindowBounds];
  -[_UIContextMenuLayoutArbiter _computedPreviewBoundsForContentBounds:sourceWindowBounds:](self, "_computedPreviewBoundsForContentBounds:sourceWindowBounds:", v40, v42, v44, v46, v47, v48, v49, v50);
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;
  double v58 = v57;
  v118.origin.CGFloat x = v51;
  v118.origin.CGFloat y = v53;
  v118.size.width = v55;
  v118.size.height = v57;
  v59 = [(_UIContextMenuLayoutArbiter *)self currentInput];
  LOBYTE(v32) = [v59 _hasVisibleMenu];

  if (v32)
  {
    v60 = [v33 _screen];
    [v60 scale];
    UIRectCenteredAboutPointScale(v52, v54, v56, v58, v99, v96, v61);
    double v63 = v62;
    double v65 = v64;
    double v67 = v66;
    double v69 = v68;

    -[_UIContextMenuLayoutArbiter _computedMenuBoundsForContentBounds:predictedPreviewFrame:](self, "_computedMenuBoundsForContentBounds:predictedPreviewFrame:", v13, v15, v17, v19, v63, v65, v67, v69);
    v117.origin.CGFloat x = v70;
    v117.origin.CGFloat y = v71;
    v117.size.width = v72;
    v117.size.height = v73;
  }
  -[_UIContextMenuLayoutArbiter _positionPlatterFrame:andActionViewFrame:inBounds:aboutSourcePoint:](self, "_positionPlatterFrame:andActionViewFrame:inBounds:aboutSourcePoint:", &v118, &v117, v13, v15, v17, v19, v99, v96);
  -[_UIContextMenuLayoutArbiter _drawContentBoundsDebugUI:](self, "_drawContentBoundsDebugUI:", v13, v15, v17, v19);
  long long v95 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v97 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v116.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v116.c = v95;
  long long v94 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v116.tCGFloat x = v94;
  v74 = [(_UIContextMenuLayoutArbiter *)self currentInput];
  int v75 = [v74 shouldConcealMenu];

  double v76 = 1.0;
  if (v75)
  {
    v117.size.height = 22.0;
    CGAffineTransformMakeScale(&v116, 0.2, 0.2);
    double v76 = 0.0;
  }
  uint64_t v100 = *(void *)&v76;
  v77 = objc_opt_new();
  objc_msgSend(v77, "setType:", -[_UIContextMenuLayoutArbiter currentLayout](self, "currentLayout"));
  [(_UIContextMenuLayoutArbiter *)self contentBounds];
  objc_msgSend(v77, "setContentBounds:");
  CGPoint origin = v118.origin;
  CGSize size = v118.size;
  double v80 = origin.x + size.width * 0.5 + CGRectGetWidth(v118) * 0.0;
  v120.CGPoint origin = origin;
  v120.CGSize size = size;
  CGFloat Height = CGRectGetHeight(v120);
  *(_OWORD *)&v114.a = v97;
  *(_OWORD *)&v114.c = v95;
  *(_OWORD *)&v114.tCGFloat x = v94;
  long long v108 = 0uLL;
  CGSize v109 = v118.size;
  double v110 = v80;
  double v111 = origin.y + size.height * 0.5 + Height * 0.0;
  long long v112 = xmmword_186B943E0;
  uint64_t v113 = 0x3FE0000000000000;
  uint64_t v115 = 0x3FF0000000000000;
  _validatedItemLayout((uint64_t)v107, (uint64_t *)&v108, v4, @"Preview");
  [v77 setPreview:v107];
  -[_UIContextMenuLayoutArbiter _computedMenuAnchorPointForMenuFrame:previewFrame:](self, "_computedMenuAnchorPointForMenuFrame:previewFrame:", v117.origin.x, v117.origin.y, *(_OWORD *)&v117.size, *(_OWORD *)&v118.origin, *(_OWORD *)&v118.size);
  double v83 = v82;
  double v85 = v84;
  CGFloat x = v117.origin.x;
  CGFloat y = v117.origin.y;
  CGSize v88 = v117.size;
  CGFloat v89 = v117.origin.x + v117.size.width * 0.5;
  CGFloat v98 = v117.origin.y + v117.size.height * 0.5;
  double v90 = v89 + (v82 + -0.5) * CGRectGetWidth(v117);
  v121.origin.CGFloat x = x;
  v121.origin.CGFloat y = y;
  v121.CGSize size = v88;
  CGFloat v91 = CGRectGetHeight(v121);
  CGAffineTransform v114 = v116;
  long long v108 = 0uLL;
  CGSize v109 = v117.size;
  double v110 = v90;
  double v111 = v98 + (v85 + -0.5) * v91;
  *(void *)&long long v112 = 0;
  *((double *)&v112 + 1) = v83;
  uint64_t v113 = *(void *)&v85;
  uint64_t v115 = v100;
  _validatedItemLayout((uint64_t)v106, (uint64_t *)&v108, v4, @"Menu");
  [v77 setMenu:v106];
  [(_UIContextMenuLayoutArbiter *)self menuAnchor];
  v101[0] = v103;
  v101[1] = v104;
  uint64_t v102 = v105;
  [v77 setAnchor:v101];
  v92 = [(_UIContextMenuLayoutArbiter *)self _accessoryPositionsForBaseLayout:v77];
  [v77 setAccessoryPositions:v92];

  return v77;
}

- (double)_applyEdgeInsetsToBounds:(void *)a1
{
  if (!a1) {
    return 0.0;
  }
  v3 = [a1 currentInput];
  [v3 preferredEdgeInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = [a1 containerView];
  double v37 = v7;
  BOOL v13 = v7 == 0.0;
  if (v5 != 0.0) {
    BOOL v13 = 0;
  }
  if (v11 != 0.0) {
    BOOL v13 = 0;
  }
  BOOL v14 = v9 == 0.0 && v13;
  double v15 = objc_msgSend(a1, "currentInput", *(void *)&v11);
  int v16 = [v15 shouldAvoidInputViews];
  id v17 = v12;
  [v17 safeAreaInsets];
  double v19 = v18;
  v20 = [v17 traitCollection];
  uint64_t v21 = [v20 verticalSizeClass];

  if (v21 != 1) {
    double v19 = v19 + 0.0;
  }
  double v22 = _UIContextMenuDefaultContentSpacing(v17);
  if (v16) {
    _UIContextMenuInputViewOverlapBottomInsets(v17);
  }
  double v23 = fmax(v19, v22);

  if (!v14)
  {
    uint64_t v24 = [a1 currentLayout];
    double v25 = fmin(v37, v23);
    if (v24 == 3) {
      double v23 = v25;
    }
    else {
      double v23 = v37;
    }
  }
  double v26 = [v17 traitCollection];
  double v27 = _UIContextMenuGetPlatformMetrics([v26 userInterfaceIdiom]);

  [v27 minimumContainerInsets];
  double v29 = v28;

  [v17 safeAreaInsets];
  double v31 = fmax(v23, fmax(v29, v30));
  if (v14)
  {
    double v32 = a2;
  }
  else
  {
    id v33 = [a1 currentInput];
    int v34 = [v33 shouldAvoidInputViews];

    double v32 = a2;
    if (v34) {
      _UIContextMenuInputViewOverlapBottomInsets(v17);
    }
  }
  double v35 = v32 + v31;

  return v35;
}

- (CGRect)sourceWindowBounds
{
  v3 = [(_UIContextMenuLayoutArbiter *)self containerView];
  [v3 bounds];
  double v5 = v4;
  double v6 = [(_UIContextMenuLayoutArbiter *)self currentInput];
  double v7 = [v6 sourcePreview];
  double v8 = [v7 target];
  double v9 = [v8 container];
  double v10 = [v9 _window];

  if (v10)
  {
    [v10 bounds];
    double v5 = _UIContextMenuProjectFrameFromViewToView(v10, v3, v11, v12, v13, v14);
  }
  double v15 = -[_UIContextMenuLayoutArbiter _applyEdgeInsetsToBounds:](self, v5);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGRect)contentBounds
{
  v3 = [(_UIContextMenuLayoutArbiter *)self containerView];
  [v3 bounds];
  double v5 = -[_UIContextMenuLayoutArbiter _applyEdgeInsetsToBounds:](self, v4);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGRect)contentBoundsForConstrainingPreview
{
  v3 = [(_UIContextMenuLayoutArbiter *)self containerView];
  double v4 = [v3 traitCollection];
  double v5 = _UIContextMenuGetPlatformMetrics([v4 userInterfaceIdiom]);

  if ([v5 previewIsConstrainedToSourceWindowBounds]) {
    [(_UIContextMenuLayoutArbiter *)self sourceWindowBounds];
  }
  else {
    [(_UIContextMenuLayoutArbiter *)self contentBounds];
  }
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (double)contentSpacing
{
  unint64_t v3 = [(_UIContextMenuLayoutArbiter *)self currentLayout];
  double result = 0.0;
  if (v3 != 3)
  {
    double v5 = [(_UIContextMenuLayoutArbiter *)self currentInput];
    [v5 preferredContentSpacing];
    double v7 = fabs(v6);

    if (v7 < 2.22044605e-16)
    {
      double v11 = [(_UIContextMenuLayoutArbiter *)self containerView];
      double v12 = _UIContextMenuDefaultContentSpacing(v11);

      double v13 = [(_UIContextMenuLayoutArbiter *)self currentInput];
      [v13 preferredEdgeInsets];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;

      if (v21 == 0.0 && v17 == 0.0 && v15 == 0.0)
      {
        if (v17 >= v12) {
          double result = v12;
        }
        else {
          double result = v17;
        }
        if (v19 == 0.0) {
          return v12;
        }
      }
      else if (v17 >= v12)
      {
        return v12;
      }
      else
      {
        return v17;
      }
    }
    else
    {
      double v8 = [(_UIContextMenuLayoutArbiter *)self currentInput];
      [v8 preferredContentSpacing];
      double v10 = v9;

      return v10;
    }
  }
  return result;
}

- (unint64_t)_defaultAttachmentEdge
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(_UIContextMenuLayoutArbiter *)self currentInput];
  int v4 = [v3 _hasVisibleMenu];

  if (!v4)
  {
    unint64_t v30 = 4;
    goto LABEL_20;
  }
  double v5 = [(_UIContextMenuLayoutArbiter *)self containerView];
  double v6 = [(_UIContextMenuLayoutArbiter *)self currentInput];
  double v7 = [v6 sourcePreview];
  double v8 = [v7 target];
  id v9 = v5;
  [v8 center];
  double v11 = v10;
  double v13 = v12;
  double v14 = [v8 container];
  double v15 = _UIContextMenuConvertPointBetweenViews(v14, v9, v11, v13);
  double v17 = v16;

  double v18 = [v9 traitCollection];
  uint64_t v19 = [v18 userInterfaceIdiom];
  double v20 = [(_UIContextMenuLayoutArbiter *)self currentInput];
  [v20 preferredPreviewSize];
  double v22 = v21;
  double v24 = v23;
  id v25 = v18;
  double v26 = _UIContextMenuGetPlatformMetrics(v19);
  uint64_t v27 = [v26 prefersWrapToSidesHandler];
  if (v27)
  {
    double v28 = (void *)v27;
    char v29 = (*(uint64_t (**)(uint64_t, id, double, double))(v27 + 16))(v27, v25, v22, v24);

    if (v29) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  uint64_t v31 = [v25 horizontalSizeClass];
  double v32 = [(_UIContextMenuLayoutArbiter *)self currentInput];
  [v32 preferredMenuSize];
  double v34 = v33;

  if ([(_UIContextMenuLayoutArbiter *)self currentLayout] == 1)
  {
    memset(&slice, 0, sizeof(slice));
    memset(&remainder, 0, sizeof(remainder));
    [(_UIContextMenuLayoutArbiter *)self contentBounds];
    CGFloat v35 = v17 - CGRectGetMinY(v67);
    [(_UIContextMenuLayoutArbiter *)self contentBounds];
    CGRectDivide(v68, &slice, &remainder, v35, CGRectMinYEdge);
    double v36 = [(_UIContextMenuLayoutArbiter *)self currentInput];
    [v36 preferredPreviewSize];
    double v38 = v37;
    [(_UIContextMenuLayoutArbiter *)self contentSpacing];
    double v40 = v39;

    double Height = CGRectGetHeight(slice);
    double v42 = CGRectGetHeight(remainder);
    if (v31 != 2 || (double v43 = v40 + v38 * 0.5, v34 <= Height - v43) || v34 <= v42 - v43)
    {
      double v44 = CGRectGetHeight(slice);
      if (v44 > CGRectGetHeight(remainder)) {
        unint64_t v30 = 1;
      }
      else {
        unint64_t v30 = 4;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v30 = 4;
    if (v31 != 2 || v34 <= 135.0) {
      goto LABEL_19;
    }
  }
LABEL_16:
  [v9 bounds];
  if (v15 <= CGRectGetMidX(v69)) {
    unint64_t v30 = 8;
  }
  else {
    unint64_t v30 = 2;
  }
LABEL_19:

LABEL_20:
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  double v45 = [(_UIContextMenuLayoutArbiter *)self currentInput];
  double v46 = [v45 accessoryViews];

  uint64_t v47 = [v46 countByEnumeratingWithState:&v59 objects:v65 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = 0;
    uint64_t v50 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v60 != v50) {
          objc_enumerationMutation(v46);
        }
        double v52 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        if (objc_msgSend(v52, "location", v56, v57, v58) == 1)
        {
          if (v52)
          {
            [v52 anchor];
            uint64_t v53 = v56;
          }
          else
          {
            uint64_t v53 = 0;
            uint64_t v58 = 0;
            long long v56 = 0u;
            long long v57 = 0u;
          }
          v49 |= v53;
        }
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v59 objects:v65 count:16];
    }
    while (v48);
  }
  else
  {
    uint64_t v49 = 0;
  }

  if ((v49 & v30) != 0)
  {
    unint64_t v54 = v30 - 1;
    if (v30 - 1 <= 7 && ((0x8Bu >> v54) & 1) != 0) {
      return qword_186B96AC0[v54];
    }
  }
  return v30;
}

- (unint64_t)_automaticAlignmentAndOffset:(double *)a3 forAttachment:(unint64_t)a4 sourcePoint:(CGPoint)a5
{
  double x = a5.x;
  if (a4 != 4 && a4 != 1) {
    return 1;
  }
  [(_UIContextMenuLayoutArbiter *)self contentBounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  if ([(_UIContextMenuLayoutArbiter *)self currentLayout] == 3)
  {
    if ([(id)UIApp userInterfaceLayoutDirection])
    {
      *a3 = -2.0;
      return 8;
    }
    else
    {
      *a3 = 2.0;
      return 2;
    }
  }
  else
  {
    double v17 = [(_UIContextMenuLayoutArbiter *)self currentInput];
    double v18 = [v17 sourcePreview];
    uint64_t v19 = [v18 view];
    [v19 bounds];
    double Width = CGRectGetWidth(v23);
    double v21 = [(_UIContextMenuLayoutArbiter *)self containerView];
    [v21 bounds];
    double v22 = CGRectGetWidth(v24);

    if (Width < v22
      && (v25.origin.double x = v9,
          v25.origin.CGFloat y = v11,
          v25.size.width = v13,
          v25.size.height = v15,
          vabdd_f64(x, CGRectGetMidX(v25)) <= 1.0))
    {
      return 0;
    }
    else
    {
      v26.origin.double x = v9;
      v26.origin.CGFloat y = v11;
      v26.size.width = v13;
      v26.size.height = v15;
      if (x <= CGRectGetMidX(v26)) {
        return 2;
      }
      else {
        return 8;
      }
    }
  }
}

- (void)_positionPlatterFrame:(CGRect *)a3 andActionViewFrame:(CGRect *)a4 inBounds:(CGRect)a5 aboutSourcePoint:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double height = a5.size.height;
  double width = a5.size.width;
  double v158 = a5.origin.x;
  double v159 = a5.origin.y;
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  double v12 = [(_UIContextMenuLayoutArbiter *)self containerView];
  CGFloat v13 = [v12 _screen];
  [v13 scale];
  double v15 = v14;

  double v16 = a3->origin.x;
  double v17 = a3->origin.y;
  double v18 = a3->size.width;
  double v19 = a3->size.height;
  double v166 = a4->origin.x;
  double rect = a4->origin.y;
  double v164 = a4->size.height;
  double v165 = a4->size.width;
  unint64_t v20 = [(_UIContextMenuLayoutArbiter *)self currentLayout];
  [(_UIContextMenuLayoutArbiter *)self menuAnchor];
  uint64_t v21 = v173;
  [(_UIContextMenuLayoutArbiter *)self menuAnchor];
  unint64_t v22 = v172;
  if (v172 == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)buf = 0;
    unint64_t v22 = -[_UIContextMenuLayoutArbiter _automaticAlignmentAndOffset:forAttachment:sourcePoint:](self, "_automaticAlignmentAndOffset:forAttachment:sourcePoint:", buf, v173, x, y);
    self->_menuAnchor.alignment = v22;
    self->_menuAnchor.alignmentOffset = *(double *)buf;
  }
  v161 = v12;
  CGFloat v156 = height;
  CGFloat v157 = width;
  double v160 = v15;
  if ([(_UIContextMenuLayoutArbiter *)self currentLayout] == 3) {
    goto LABEL_34;
  }
  gravitdouble y = self->_menuAnchor.gravity;
  if (gravity == 2) {
    goto LABEL_8;
  }
  if (!gravity)
  {
    CGRect v24 = +[UIDevice currentDevice];
    uint64_t v25 = [v24 userInterfaceIdiom];

    if ((v25 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      CGRect v26 = [(_UIContextMenuLayoutArbiter *)self currentInput];
      char v27 = [v26 _hasVisibleMenu];

      if ((v27 & 1) == 0)
      {
LABEL_8:
        [v12 bounds];
        double x = v29 + v28 * 0.5;
        double y = v31 + v30 * 0.5;
      }
    }
  }
  double v32 = [v12 _screen];
  [v32 scale];
  CGFloat v154 = v19;
  CGFloat v155 = v18;
  double v162 = y;
  UIRectCenteredAboutPointScale(v16, v17, v18, v19, x, y, v33);
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;

  double v42 = [(_UIContextMenuLayoutArbiter *)self currentInput];
  char v43 = [v42 shouldConcealMenu];

  if ((v43 & 1) == 0)
  {
    [(_UIContextMenuLayoutArbiter *)self contentSpacing];
    double v152 = v17;
    double v153 = v16;
    double v45 = v44;
    switch(v173)
    {
      case 0:
        double v47 = v164;
        double v46 = v165;
        double MinY = round(v37 + v41 * 0.5 - v164 * 0.5);
        double MinX = round(v35 + v39 * 0.5 - v165 * 0.5);
        goto LABEL_14;
      case 1:
        v176.origin.double x = v35;
        v176.origin.double y = v37;
        v176.size.double width = v39;
        v176.size.double height = v41;
        double MinX = CGRectGetMinX(v176);
        v177.origin.double x = v35;
        v177.origin.double y = v37;
        v177.size.double width = v39;
        v177.size.double height = v41;
        CGFloat v50 = CGRectGetMinY(v177) - v45;
        v178.origin.double x = MinX;
        v178.origin.double y = rect;
        double v47 = v164;
        double v46 = v165;
        v178.size.double width = v165;
        v178.size.double height = v164;
        double MinY = v50 - CGRectGetHeight(v178);
        goto LABEL_14;
      case 2:
        v179.origin.double x = v35;
        v179.origin.double y = v37;
        v179.size.double width = v39;
        v179.size.double height = v41;
        CGFloat v51 = CGRectGetMinX(v179) - v45;
        v180.origin.double x = v166;
        v180.origin.double y = rect;
        double v47 = v164;
        double v46 = v165;
        v180.size.double width = v165;
        v180.size.double height = v164;
        double MinX = v51 - CGRectGetWidth(v180);
        v181.origin.double x = v35;
        v181.origin.double y = v37;
        v181.size.double width = v39;
        v181.size.double height = v41;
        double MinY = CGRectGetMinY(v181);
LABEL_14:
        double height = v156;
        goto LABEL_21;
      case 4:
        v182.origin.double x = v35;
        v182.origin.double y = v37;
        v182.size.double width = v39;
        v182.size.double height = v41;
        double MinX = CGRectGetMinX(v182);
        v183.origin.double x = v35;
        v183.origin.double y = v37;
        v183.size.double width = v39;
        v183.size.double height = v41;
        double MinY = v45 + CGRectGetMaxY(v183);
        goto LABEL_20;
      case 8:
        v184.origin.double x = v35;
        v184.origin.double y = v37;
        v184.size.double width = v39;
        v184.size.double height = v41;
        double MinX = v45 + CGRectGetMaxX(v184);
        v185.origin.double x = v35;
        v185.origin.double y = v37;
        v185.size.double width = v39;
        v185.size.double height = v41;
        double MinY = CGRectGetMinY(v185);
        goto LABEL_20;
      default:
        if (os_variant_has_internal_diagnostics())
        {
          v151 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v151, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&buf[4] = v173;
            _os_log_fault_impl(&dword_1853B0000, v151, OS_LOG_TYPE_FAULT, "_UIContextMenuLayoutArbiter Attempting to lay out with unsupported attachment edge: %lu", buf, 0xCu);
          }

          double MinX = v166;
          double MinY = rect;
LABEL_20:
          double height = v156;
          double v47 = v164;
          double v46 = v165;
        }
        else
        {
          double v52 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_CombinedActionsAndPreviewRect___s_category) + 8);
          BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);
          double MinX = v166;
          double MinY = rect;
          double height = v156;
          double v47 = v164;
          double v46 = v165;
          if (v53)
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&buf[4] = v173;
            _os_log_impl(&dword_1853B0000, v52, OS_LOG_TYPE_ERROR, "_UIContextMenuLayoutArbiter Attempting to lay out with unsupported attachment edge: %lu", buf, 0xCu);
            double MinX = v166;
            double MinY = rect;
          }
        }
LABEL_21:
        v186.origin.double x = v35;
        v186.origin.double y = v37;
        v186.size.double width = v39;
        v186.size.double height = v41;
        double v54 = MinX;
        double v55 = v46;
        double v56 = v47;
        CGRect v187 = CGRectUnion(v186, *(CGRect *)(&MinY - 1));
        double v35 = v187.origin.x;
        double v37 = v187.origin.y;
        double v39 = v187.size.width;
        double v41 = v187.size.height;
        double width = v157;
        double v17 = v152;
        double v16 = v153;
        break;
    }
  }
  long long v57 = objc_msgSend(v12, "traitCollection", *(void *)&v152, *(void *)&v153);
  uint64_t v58 = [v57 verticalSizeClass];

  if (v58 != 1) {
    goto LABEL_25;
  }
  CGFloat v59 = v158;
  CGFloat v60 = v159;
  if (v20 != 1)
  {
    long long v61 = [v12 _screen];
    [v61 scale];
    double v62 = v158 + width * 0.5;
    double v63 = v159 + height * 0.5;
    double height = v156;
    double width = v157;
    UIRectCenteredAboutPointScale(v35, v37, v39, v41, v62, v63, v64);
    double v35 = v65;
    double v37 = v66;
    double v39 = v67;
    double v41 = v68;

LABEL_25:
    CGFloat v59 = v158;
    CGFloat v60 = v159;
  }
  double v69 = _CGRectConstrainedWithinRect(15, v35, v37, v39, v41, v59, v60, width, height);
  double v15 = v160;
  double v19 = v154;
  double v18 = v155;
  double y = v162;
  switch(v173)
  {
    case 1:
      double MaxY = CGRectGetMaxY(*(CGRect *)&v69);
      v188.origin.double x = v16;
      v188.origin.double y = v17;
      v188.size.double width = v155;
      v188.size.double height = v154;
      double v74 = CGRectGetHeight(v188);
      double v75 = -0.5;
      goto LABEL_30;
    case 2:
      double MaxX = CGRectGetMaxX(*(CGRect *)&v69);
      v189.origin.double x = v16;
      v189.origin.double y = v17;
      v189.size.double width = v155;
      v189.size.double height = v154;
      double v77 = CGRectGetWidth(v189);
      double v78 = -0.5;
      goto LABEL_32;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_34;
    case 4:
      double MaxY = CGRectGetMinY(*(CGRect *)&v69);
      v190.origin.double x = v16;
      v190.origin.double y = v17;
      v190.size.double width = v155;
      v190.size.double height = v154;
      double v74 = CGRectGetHeight(v190);
      double v75 = 0.5;
LABEL_30:
      double y = MaxY + v74 * v75;
      goto LABEL_34;
    case 8:
      double MaxX = CGRectGetMinX(*(CGRect *)&v69);
      v191.origin.double x = v16;
      v191.origin.double y = v17;
      v191.size.double width = v155;
      v191.size.double height = v154;
      double v77 = CGRectGetWidth(v191);
      double v78 = 0.5;
LABEL_32:
      double x = MaxX + v77 * v78;
      break;
    default:
      double v15 = v160;
      double v19 = v154;
      double v18 = v155;
      break;
  }
  double y = v162;
LABEL_34:
  UIRectCenteredAboutPointScale(v16, v17, v18, v19, x, y, v15);
  double v80 = v79;
  CGFloat v82 = v81;
  CGFloat v84 = v83;
  CGFloat v86 = v85;
  if ([(_UIContextMenuLayoutArbiter *)self currentLayout] == 3)
  {
    CGFloat v169 = v84;
    double v163 = v86;
  }
  else
  {
    [(_UIContextMenuLayoutArbiter *)self contentBoundsForConstrainingPreview];
    double v80 = _CGRectConstrainedWithinRect(15, v80, v82, v84, v86, v87, v88, v89, v90);
    CGFloat v82 = v91;
    CGFloat v169 = v92;
    double v163 = v93;
  }
  long long v94 = (double *)MEMORY[0x1E4F1DAD8];
  [(_UIContextMenuLayoutArbiter *)self menuAnchor];
  [(_UIContextMenuLayoutArbiter *)self menuAnchor];
  long long v95 = [(_UIContextMenuLayoutArbiter *)self currentInput];
  [v95 preferredMenuAttachmentPoint];
  double v97 = v96;
  double v99 = v98;

  if (v97 != 1.79769313e308 || (double v100 = v80, v101 = v82, v102 = v169, v103 = v163, v99 != 1.79769313e308))
  {
    CGFloat v102 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v103 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    long long v104 = [(_UIContextMenuLayoutArbiter *)self currentInput];
    uint64_t v105 = [v104 sourcePreview];
    [v105 target];
    unint64_t v106 = v22;
    long long v108 = v107 = v20;
    CGSize v109 = [v108 container];
    double v100 = _UIContextMenuConvertPointBetweenViews(v109, v161, v97, v99);
    CGFloat v101 = v110;

    unint64_t v20 = v107;
    unint64_t v22 = v106;
    uint64_t v21 = v173;
    long long v94 = (double *)MEMORY[0x1E4F1DAD8];
  }
  double MidX = *v94;
  switch(v21)
  {
    case 0:
      v192.origin.double x = v100;
      v192.origin.double y = v101;
      v192.size.double width = v102;
      v192.size.double height = v103;
      double MidX = CGRectGetMidX(v192);
      if (v22)
      {
        long long v112 = v161;
        double v113 = v160;
        goto LABEL_53;
      }
      v209.origin.double x = v100;
      v209.origin.double y = v101;
      v209.size.double width = v102;
      v209.size.double height = v103;
      double MidY = CGRectGetMidY(v209);
      char v134 = 15;
      long long v112 = v161;
      goto LABEL_63;
    case 1:
      v193.origin.double x = v100;
      v193.origin.double y = v101;
      v193.size.double width = v102;
      v193.size.double height = v103;
      double v114 = CGRectGetMinY(v193);
      [(_UIContextMenuLayoutArbiter *)self contentSpacing];
      double v116 = v114 - v115;
      v194.origin.double x = v166;
      v194.origin.double y = rect;
      v194.size.double height = v164;
      v194.size.double width = v165;
      double v117 = CGRectGetHeight(v194);
      double v118 = -0.5;
      goto LABEL_46;
    case 2:
      v195.origin.double x = v100;
      v195.origin.double y = v101;
      v195.size.double width = v102;
      v195.size.double height = v103;
      double v119 = CGRectGetMinX(v195);
      [(_UIContextMenuLayoutArbiter *)self contentSpacing];
      double v121 = v119 - v120;
      v196.origin.double x = v166;
      v196.origin.double y = rect;
      v196.size.double height = v164;
      v196.size.double width = v165;
      double v122 = CGRectGetWidth(v196);
      double v123 = -0.5;
      goto LABEL_51;
    case 4:
      v197.origin.double x = v100;
      v197.origin.double y = v101;
      v197.size.double width = v102;
      v197.size.double height = v103;
      double v124 = CGRectGetMaxY(v197);
      [(_UIContextMenuLayoutArbiter *)self contentSpacing];
      double v116 = v124 + v125;
      v198.origin.double x = v166;
      v198.origin.double y = rect;
      v198.size.double height = v164;
      v198.size.double width = v165;
      double v117 = CGRectGetHeight(v198);
      double v118 = 0.5;
LABEL_46:
      double v126 = v116 + v117 * v118;
      long long v112 = v161;
      if (v22 == 8)
      {
        v205.origin.double x = v100;
        v205.origin.double y = v101;
        v205.size.double width = v102;
        v205.size.double height = v103;
        double v135 = CGRectGetMaxX(v205);
        v206.origin.double x = v166;
        v206.origin.double y = rect;
        v206.size.double height = v164;
        v206.size.double width = v165;
        double v136 = CGRectGetWidth(v206);
        double v137 = -0.5;
      }
      else
      {
        if (v22 != 2)
        {
          if (!v22)
          {
            v199.origin.double x = v100;
            v199.origin.double y = v101;
            v199.size.double width = v102;
            v199.size.double height = v103;
            double MidX = CGRectGetMidX(v199);
          }
LABEL_60:
          double MidX = v170 + MidX;
          double MidY = v171 + v126;
          if (v20) {
            char v134 = 15;
          }
          else {
            char v134 = 11;
          }
LABEL_63:
          double v113 = v160;
          goto LABEL_64;
        }
        v207.origin.double x = v100;
        v207.origin.double y = v101;
        v207.size.double width = v102;
        v207.size.double height = v103;
        double v135 = CGRectGetMinX(v207);
        v208.origin.double x = v166;
        v208.origin.double y = rect;
        v208.size.double height = v164;
        v208.size.double width = v165;
        double v136 = CGRectGetWidth(v208);
        double v137 = 0.5;
      }
      double MidX = v135 + v136 * v137;
      goto LABEL_60;
    case 8:
      v200.origin.double x = v100;
      v200.origin.double y = v101;
      v200.size.double width = v102;
      v200.size.double height = v103;
      double v127 = CGRectGetMaxX(v200);
      [(_UIContextMenuLayoutArbiter *)self contentSpacing];
      double v121 = v127 + v128;
      v201.origin.double x = v166;
      v201.origin.double y = rect;
      v201.size.double height = v164;
      v201.size.double width = v165;
      double v122 = CGRectGetWidth(v201);
      double v123 = 0.5;
LABEL_51:
      double MidX = v121 + v122 * v123;
      goto LABEL_52;
    default:
LABEL_52:
      long long v112 = v161;
      double v113 = v160;
      if (v22)
      {
LABEL_53:
        v202.origin.double x = v100;
        v202.origin.double y = v101;
        v202.size.double width = v102;
        v202.size.double height = v103;
        double v129 = CGRectGetMinY(v202);
        v203.origin.double x = v166;
        v203.origin.double y = rect;
        double v131 = v164;
        double v130 = v165;
        v203.size.double width = v165;
        v203.size.double height = v164;
        double MidY = v129 + CGRectGetHeight(v203) * 0.5;
LABEL_56:
        CGFloat v133 = v163;
        double MidX = v171 + MidX;
        double MidY = v170 + MidY;
        char v134 = 15;
        goto LABEL_65;
      }
      v204.origin.double x = v100;
      v204.origin.double y = v101;
      v204.size.double width = v102;
      v204.size.double height = v103;
      double MidY = CGRectGetMidY(v204);
      if (v21)
      {
        double v131 = v164;
        double v130 = v165;
        goto LABEL_56;
      }
      char v134 = 15;
LABEL_64:
      double v131 = v164;
      double v130 = v165;
      CGFloat v133 = v163;
LABEL_65:
      UIRectCenteredAboutPointScale(v166, rect, v130, v131, MidX, MidY, v113);
      double v139 = v138;
      CGFloat v141 = v140;
      CGFloat v143 = v142;
      CGFloat v145 = v144;
      v146 = [(_UIContextMenuLayoutArbiter *)self currentInput];
      char v147 = [v146 shouldConcealMenu];

      if ((v147 & 1) == 0)
      {
        double v139 = _CGRectConstrainedWithinRect(v134, v139, v141, v143, v145, v158, v159, v157, v156);
        CGFloat v141 = v148;
        CGFloat v143 = v149;
        CGFloat v145 = v150;
      }
      a3->origin.double x = v80;
      a3->origin.double y = v82;
      a3->size.double width = v169;
      a3->size.double height = v133;
      a4->origin.double x = v139;
      a4->origin.double y = v141;
      a4->size.double width = v143;
      a4->size.double height = v145;

      return;
  }
}

- (CGRect)_computedPreviewBoundsForContentBounds:(CGRect)a3 sourceWindowBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double v6 = a3.size.height;
  double v7 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat rect = a3.origin.x;
  double v10 = a3.size.width;
  CGFloat v11 = [(_UIContextMenuLayoutArbiter *)self currentInput];
  [v11 preferredMenuSize];
  double v13 = v12;

  [(_UIContextMenuLayoutArbiter *)self menuAnchor];
  if (fabs(v13) >= 2.22044605e-16 && (v72 == 8 || v72 == 2))
  {
    [(_UIContextMenuLayoutArbiter *)self contentSpacing];
    double v10 = v7 - (v13 + v15);
  }
  double v16 = [(_UIContextMenuLayoutArbiter *)self containerView];
  double v17 = [v16 traitCollection];
  double v18 = _UIContextMenuGetPlatformMetrics([v17 userInterfaceIdiom]);

  unsigned __int8 v19 = [v18 previewIsConstrainedToSourceWindowBounds];
  if ((v19 & (height < v6)) == 0) {
    double height = v6;
  }
  if ((v19 & (width < v10)) != 0) {
    double v10 = width;
  }
  unint64_t v20 = [(_UIContextMenuLayoutArbiter *)self currentLayout];
  uint64_t v21 = [(_UIContextMenuLayoutArbiter *)self currentInput];
  [v21 preferredPreviewSize];
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  CGFloat v68 = v10;
  if (v20 == 1)
  {
    CGRect v26 = [(_UIContextMenuLayoutArbiter *)self containerView];
    char v27 = [v26 traitCollection];
    double v28 = _UIContextMenuGetPlatformMetrics([v27 userInterfaceIdiom]);
    [v28 maxLiftScale];
    double v30 = v29;
    [v28 maxLiftScaleUpPoints];
    double v66 = v31;
    v73.origin.double x = 0.0;
    v73.origin.CGFloat y = 0.0;
    v73.size.double width = v23;
    v73.size.double height = v25;
    double v67 = height;
    double v32 = CGRectGetWidth(v73);
    v74.origin.double x = 0.0;
    v74.origin.CGFloat y = 0.0;
    v74.size.double width = v23;
    v74.size.double height = v25;
    double v33 = CGRectGetHeight(v74);
    if (v32 >= v33) {
      double v34 = v32;
    }
    else {
      double v34 = v33;
    }
    v75.origin.double x = rect;
    v75.origin.CGFloat y = y;
    v75.size.double width = v7;
    v75.size.double height = v6;
    double v35 = CGRectGetWidth(v75) / v32;
    double height = v67;
    if (v35 >= v30) {
      double v35 = v30;
    }
    if ((v66 + v34) / v34 >= v35) {
      double v36 = v35;
    }
    else {
      double v36 = (v66 + v34) / v34;
    }

    memset(&v71, 0, sizeof(v71));
    CGFloat v37 = v36;
    CGFloat v38 = v36;
    double v10 = v68;
    CGAffineTransformMakeScale(&v71, v37, v38);
    CGAffineTransform rect_8 = v71;
    v76.origin.double x = 0.0;
    v76.origin.CGFloat y = 0.0;
    v76.size.double width = v23;
    v76.size.double height = v25;
    CGRect v77 = CGRectApplyAffineTransform(v76, &rect_8);
    double x = v77.origin.x;
    CGFloat v40 = v77.origin.y;
    CGFloat v23 = v77.size.width;
    CGFloat v25 = v77.size.height;
  }
  else
  {
    CGFloat v40 = 0.0;
    v78.origin.double x = 0.0;
    v78.origin.CGFloat y = 0.0;
    v78.size.double width = v23;
    v78.size.double height = v25;
    if (CGRectIsEmpty(v78)
      || (v79.origin.double x = 0.0,
          v79.origin.CGFloat y = 0.0,
          v79.size.double width = v23,
          v79.size.double height = v25,
          double x = 0.0,
          CGRectIsInfinite(v79)))
    {
      CGFloat v25 = height;
      CGFloat v23 = v10;
      CGFloat v40 = y;
      double x = rect;
    }
  }
  double v41 = [(_UIContextMenuLayoutArbiter *)self currentInput];
  uint64_t v42 = [v41 preferredPreviewFittingStrategy];

  if (v42 == 1)
  {
    v80.origin.double x = rect;
    v80.origin.CGFloat y = y;
    v80.size.double width = v10;
    v80.size.double height = height;
    double v43 = CGRectGetWidth(v80);
    v81.origin.double x = x;
    v81.origin.CGFloat y = v40;
    v81.size.double width = v23;
    v81.size.double height = v25;
    double v44 = fmin(v43 / CGRectGetWidth(v81), 1.0);
    v82.origin.double x = x;
    v82.origin.CGFloat y = v40;
    v82.size.double width = v23;
    v82.size.double height = v25;
    double v45 = CGRectGetWidth(v82) * v44;
    v83.origin.double x = x;
    v83.origin.CGFloat y = v40;
    v83.size.double width = v45;
    v83.size.double height = v25;
    double v46 = CGRectGetHeight(v83) * v44;
    v84.origin.double x = rect;
    v84.origin.CGFloat y = y;
    v84.size.double width = v68;
    v84.size.double height = height;
    double v47 = CGRectGetHeight(v84) * 0.75;
    if (v46 >= v47) {
      double v46 = v47;
    }
  }
  else
  {
    _CGRectScaledToAspectFitWithinRect(x, v40, v23, v25, rect, y, v10, height);
    double v45 = v48;
    double v46 = v49;
  }
  double v50 = *MEMORY[0x1E4F1DAD8];
  double v51 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v52 = [(_UIContextMenuLayoutArbiter *)self containerView];
  BOOL v53 = [v52 _screen];
  [v53 scale];
  double v55 = UIRectIntegralWithScale(v50, v51, v45, v46, v54);
  double v57 = v56;
  double v59 = v58;
  double v61 = v60;

  double v62 = v55;
  double v63 = v57;
  double v64 = v59;
  double v65 = v61;
  result.size.double height = v65;
  result.size.double width = v64;
  result.origin.CGFloat y = v63;
  result.origin.double x = v62;
  return result;
}

- (CGRect)_computedMenuBoundsForContentBounds:(CGRect)a3 predictedPreviewFrame:(CGRect)a4
{
  CGFloat width = a4.size.width;
  CGFloat height = a4.size.height;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v6 = a3.size.height;
  CGFloat v7 = a3.size.width;
  CGFloat v8 = a3.origin.y;
  CGFloat v9 = a3.origin.x;
  double v11 = CGRectGetHeight(a3);
  double v12 = v11;
  v47.origin.CGFloat x = v9;
  v47.origin.CGFloat y = v8;
  v47.size.CGFloat width = v7;
  v47.size.CGFloat height = v6;
  double v13 = CGRectGetWidth(v47);
  [(_UIContextMenuLayoutArbiter *)self menuAnchor];
  if ([(_UIContextMenuLayoutArbiter *)self currentLayout] == 1)
  {
    if (v46 != 4 && v46 != 1) {
      goto LABEL_18;
    }
    v48.origin.CGFloat x = x;
    v48.origin.CGFloat y = y;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    double v15 = CGRectGetHeight(v48);
    [(_UIContextMenuLayoutArbiter *)self contentSpacing];
    double v17 = v15 + v16;
    if (v11 * 0.55 < v17) {
      double v17 = v11 * 0.55;
    }
  }
  else
  {
    if (v46 != 4 && v46 != 1) {
      goto LABEL_18;
    }
    v49.origin.CGFloat x = x;
    v49.origin.CGFloat y = y;
    v49.size.CGFloat width = width;
    v49.size.CGFloat height = height;
    double v17 = CGRectGetHeight(v49);
    if (v17 > 198.0) {
      double v17 = 198.0;
    }
  }
  double v12 = v11 - v17;
LABEL_18:
  unsigned __int8 v19 = +[UIDevice currentDevice];
  uint64_t v20 = [v19 userInterfaceIdiom];

  if ((v20 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    uint64_t v21 = [(_UIContextMenuLayoutArbiter *)self containerView];
    double v22 = [v21 traitCollection];
    CGFloat v23 = [v22 preferredContentSizeCategory];
    if (UIContentSizeCategoryIsAccessibilityCategory(v23))
    {
      unint64_t v24 = [(_UIContextMenuLayoutArbiter *)self currentLayout];
      BOOL v25 = v11 > v13 && v24 == 3;
      BOOL v26 = v25;
    }
    else
    {
      BOOL v26 = 0;
    }

    if (v26) {
      double v12 = v12 + -44.0;
    }
  }
  char v27 = [(_UIContextMenuLayoutArbiter *)self currentInput];
  [v27 maximumMenuHeight];
  double v29 = v28;

  if (v12 >= v29) {
    double v12 = v29;
  }
  double v30 = [(_UIContextMenuLayoutArbiter *)self currentInput];
  [v30 preferredMenuSize];
  double v32 = v31;

  double v33 = [(_UIContextMenuLayoutArbiter *)self currentInput];
  [v33 preferredMenuSize];
  double v35 = v34;

  if (v35 >= v12) {
    double v35 = v12;
  }
  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_ContextMenuScrollTruncationDetentsEnabled, @"ContextMenuScrollTruncationDetentsEnabled") & 1) == 0)
  {
    if (byte_1E8FD4EFC)
    {
      double v36 = [(_UIContextMenuLayoutArbiter *)self currentInput];
      CGFloat v37 = [v36 computePreferredScrollTruncationDetentForHeight];

      if (v37)
      {
        CGFloat v38 = [(_UIContextMenuLayoutArbiter *)self currentInput];
        double v39 = [v38 computePreferredScrollTruncationDetentForHeight];
        double v35 = v39[2](v35);
      }
    }
  }
  if (v32 >= v13) {
    double v40 = v13;
  }
  else {
    double v40 = v32;
  }
  double v41 = 0.0;
  double v42 = 0.0;
  double v43 = v35;
  result.size.CGFloat height = v43;
  result.size.CGFloat width = v40;
  result.origin.CGFloat y = v42;
  result.origin.CGFloat x = v41;
  return result;
}

- (CGPoint)_computedMenuAnchorPointForMenuFrame:(CGRect)a3 previewFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  unint64_t v13 = [(_UIContextMenuLayoutArbiter *)self currentLayout];
  CGFloat v54 = v8;
  if (v13 == 3)
  {
    BOOL v14 = 0;
  }
  else
  {
    v59.origin.CGFloat x = v11;
    v59.origin.CGFloat y = v10;
    v59.size.CGFloat width = v9;
    v59.size.CGFloat height = v8;
    double v15 = CGRectGetWidth(v59);
    v60.origin.CGFloat x = x;
    v60.origin.CGFloat y = y;
    v60.size.CGFloat width = width;
    v60.size.CGFloat height = height;
    BOOL v14 = v15 > CGRectGetWidth(v60);
  }
  [(_UIContextMenuLayoutArbiter *)self menuAnchor];
  uint64_t v16 = v56 - 1;
  double v17 = 0.5;
  double v18 = 0.5;
  if ((unint64_t)(v56 - 1) <= 7)
  {
    double v17 = dbl_186B96B00[v16];
    double v18 = dbl_186B96B40[v16];
  }
  switch(v57)
  {
    case 1:
      double v17 = 0.0;
      break;
    case 2:
      BOOL v19 = !v14;
      double v20 = 0.1;
      double v21 = 0.0;
      goto LABEL_11;
    case 4:
      double v17 = 1.0;
      break;
    case 8:
      BOOL v19 = !v14;
      double v20 = 0.9;
      double v21 = 1.0;
LABEL_11:
      if (v19) {
        double v18 = v21;
      }
      else {
        double v18 = v20;
      }
      break;
    default:
      break;
  }
  if (v13 == 3)
  {
    double v22 = [(_UIContextMenuLayoutArbiter *)self currentInput];
    CGFloat v23 = [v22 sourcePreview];
    unint64_t v24 = [v23 target];
    BOOL v25 = [(_UIContextMenuLayoutArbiter *)self containerView];
    id v26 = v24;
    [v26 center];
    double v28 = v27;
    double v30 = v29;
    double v31 = [v26 container];

    double v32 = _UIContextMenuConvertPointBetweenViews(v31, v25, v28, v30);
    double v34 = v33;

    double v35 = [(_UIContextMenuLayoutArbiter *)self currentInput];
    [v35 preferredMenuAttachmentPoint];
    double v37 = v36;
    double v39 = v38;

    if (v37 != 1.79769313e308 || v39 != 1.79769313e308)
    {
      double v40 = [(_UIContextMenuLayoutArbiter *)self currentInput];
      [v40 preferredMenuAttachmentPoint];
      double v42 = v41;
      double v44 = v43;

      double v45 = [(_UIContextMenuLayoutArbiter *)self currentInput];
      uint64_t v46 = [v45 sourcePreview];
      CGRect v47 = [v46 target];
      CGRect v48 = [v47 container];
      CGRect v49 = [(_UIContextMenuLayoutArbiter *)self containerView];
      double v32 = _UIContextMenuConvertPointBetweenViews(v48, v49, v42, v44);
      double v34 = v50;
    }
    v61.origin.CGFloat x = v11;
    v61.origin.CGFloat y = v10;
    v61.size.CGFloat width = v9;
    v61.size.CGFloat height = v55;
    double v51 = v32 - CGRectGetMinX(v61);
    v62.origin.CGFloat x = v11;
    v62.origin.CGFloat y = v10;
    v62.size.CGFloat width = v9;
    v62.size.CGFloat height = v55;
    double v18 = fmax(fmin(v51 / CGRectGetWidth(v62), 1.0), 0.0);
    v63.origin.CGFloat x = v11;
    v63.origin.CGFloat y = v10;
    v63.size.CGFloat width = v9;
    v63.size.CGFloat height = v55;
    double v52 = v34 - CGRectGetMinY(v63);
    v64.origin.CGFloat x = v11;
    v64.origin.CGFloat y = v10;
    v64.size.CGFloat width = v9;
    v64.size.CGFloat height = v55;
    double v17 = fmax(fmin(v52 / CGRectGetHeight(v64), 1.0), 0.0);
  }
  double v53 = v18;
  result.CGFloat y = v17;
  result.CGFloat x = v53;
  return result;
}

- (id)_accessoryPositionsForBaseLayout:(id)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v74 = a3;
  id v77 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  int v4 = [(_UIContextMenuLayoutArbiter *)self currentInput];
  double v5 = [v4 accessoryViews];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v83 objects:v87 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v76 = *(void *)v84;
    double v72 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v73 = *MEMORY[0x1E4F1DB28];
    double v70 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v71 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v84 != v76) {
          objc_enumerationMutation(obj);
        }
        CGFloat v9 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        CGFloat v10 = [(_UIContextMenuLayoutArbiter *)self containerView];
        CGFloat v11 = [(_UIContextMenuLayoutArbiter *)self currentInput];
        double v12 = [v11 sourcePreview];
        unint64_t v13 = [v12 target];
        BOOL v14 = [v13 container];
        double v15 = [v14 _window];

        uint64_t v16 = [v9 location];
        if (v16 == 2)
        {
          if (v74) {
            [v74 menu];
          }
          else {
            memset(v81, 0, sizeof(v81));
          }
          CGFloat v54 = (CGRect *)v81;
LABEL_21:
          double v19 = _UIContextMenuItemFrameFromLayout(v54);
          double v20 = v55;
          double v17 = v56;
          double v18 = v57;
          if (!v9) {
            goto LABEL_22;
          }
          goto LABEL_11;
        }
        if (v16 == 1)
        {
          if (v74) {
            [v74 preview];
          }
          else {
            memset(v82, 0, sizeof(v82));
          }
          CGFloat v54 = (CGRect *)v82;
          goto LABEL_21;
        }
        double v18 = v70;
        double v17 = v71;
        double v20 = v72;
        double v19 = v73;
        if (!v16)
        {
          [v15 bounds];
          double v25 = _UIContextMenuProjectFrameFromViewToView(v15, v10, v21, v22, v23, v24);
          double v67 = v26;
          double v68 = v25;
          double v69 = v27;
          double v78 = v28;
          [v10 safeAreaInsets];
          double v30 = v29;
          double v32 = v31;
          double v34 = v33;
          double v36 = v35;
          double v37 = [v15 traitCollection];
          double v38 = _UIContextMenuGetPlatformMetrics([v37 userInterfaceIdiom]);

          [v38 minimumContainerInsets];
          double v40 = v39;
          double v42 = v41;
          double v44 = v43;
          double v46 = v45;

          double v47 = fmax(v30, v40);
          double v48 = fmax(v32, v42);
          double v49 = fmax(v34, v44);
          double v50 = fmax(v36, v46);
          double v19 = v68 + v48;
          double v20 = v67 + v47;
          double v17 = v69 - (v48 + v50);
          double v18 = v78 - (v47 + v49);
        }
        if (!v9)
        {
LABEL_22:
          double v52 = 0.5;
          double v53 = 0.5;
          long long v80 = 0u;
          goto LABEL_23;
        }
LABEL_11:
        [v9 anchor];
        uint64_t v51 = v80 - 1;
        double v52 = 0.5;
        double v53 = 0.5;
        if ((unint64_t)(v80 - 1) <= 7)
        {
          double v52 = dbl_186B96B80[v51];
          double v53 = dbl_186B96BC0[v51];
        }
LABEL_23:
        switch(*((void *)&v80 + 1))
        {
          case 1:
            double v52 = 0.0;
            break;
          case 2:
            double v53 = 0.0;
            break;
          case 4:
            double v52 = 1.0;
            break;
          case 8:
            double v53 = 1.0;
            break;
          default:
            break;
        }
        double v79 = v52;
        objc_msgSend(v9, "attachmentOffsetWithReferenceFrame:", _UIContextMenuProjectFrameFromViewToView(v10, v15, v19, v20, v17, v18));
        double v59 = v58;
        double v61 = v60;
        objc_msgSend(v9, "setOffset:");
        v90.origin.CGFloat x = v19;
        v90.origin.CGFloat y = v20;
        v90.size.CGFloat width = v17;
        v90.size.CGFloat height = v18;
        double MinX = CGRectGetMinX(v90);
        v91.origin.CGFloat x = v19;
        v91.origin.CGFloat y = v20;
        v91.size.CGFloat width = v17;
        v91.size.CGFloat height = v18;
        double v63 = v59 + MinX + v53 * CGRectGetWidth(v91);
        v92.origin.CGFloat x = v19;
        v92.origin.CGFloat y = v20;
        v92.size.CGFloat width = v17;
        v92.size.CGFloat height = v18;
        double MinY = CGRectGetMinY(v92);
        v93.origin.CGFloat x = v19;
        v93.origin.CGFloat y = v20;
        v93.size.CGFloat width = v17;
        v93.size.CGFloat height = v18;
        double v65 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v63, v61 + MinY + v79 * CGRectGetHeight(v93));
        [v77 setObject:v65 forKey:v9];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v83 objects:v87 count:16];
    }
    while (v7);
  }

  return v77;
}

- (void)_drawContentBoundsDebugUI:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_ClickUIDebugEnabled, @"ClickUIDebugEnabled") & 1) == 0&& byte_1E8FD4F1C)
  {
    if (!_MergedGlobals_1082)
    {
      uint64_t v8 = objc_opt_new();
      CGFloat v9 = (void *)_MergedGlobals_1082;
      _MergedGlobals_1082 = v8;

      CGFloat v10 = +[UIColor cyanColor];
      [(id)_MergedGlobals_1082 setBackgroundColor:v10];

      [(id)_MergedGlobals_1082 setUserInteractionEnabled:0];
      [(id)_MergedGlobals_1082 setAlpha:0.4];
    }
    CGFloat v11 = [(_UIContextMenuLayoutArbiter *)self containerView];
    [v11 bounds];
    objc_msgSend((id)_MergedGlobals_1082, "setFrame:");

    double v12 = [(_UIContextMenuLayoutArbiter *)self containerView];
    [v12 addSubview:_MergedGlobals_1082];

    unint64_t v13 = (void *)qword_1EB260CD8;
    if (!qword_1EB260CD8)
    {
      uint64_t v14 = objc_opt_new();
      double v15 = (void *)qword_1EB260CD8;
      qword_1EB260CD8 = v14;

      uint64_t v16 = +[UIColor blackColor];
      [(id)qword_1EB260CD8 setBackgroundColor:v16];

      unint64_t v13 = (void *)qword_1EB260CD8;
    }
    objc_msgSend(v13, "setFrame:", x, y, width, height);
    uint64_t v17 = *MEMORY[0x1E4F3A098];
    double v18 = [(id)qword_1EB260CD8 layer];
    [v18 setCompositingFilter:v17];

    [(id)_MergedGlobals_1082 addSubview:qword_1EB260CD8];
    if (!qword_1EB260CE0)
    {
      uint64_t v19 = objc_opt_new();
      double v20 = (void *)qword_1EB260CE0;
      qword_1EB260CE0 = v19;

      double v21 = [(id)qword_1EB260CE0 layer];
      [v21 setBorderWidth:1.0];

      id v22 = +[UIColor redColor];
      uint64_t v23 = [v22 CGColor];
      double v24 = [(id)qword_1EB260CE0 layer];
      [v24 setBorderColor:v23];

      [(id)qword_1EB260CE0 setUserInteractionEnabled:0];
    }
    double v25 = [(_UIContextMenuLayoutArbiter *)self currentInput];
    double v26 = [v25 sourcePreview];

    [v26 size];
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    double v31 = [v26 target];
    double v32 = v31;
    if (v31) {
      [v31 transform];
    }
    else {
      memset(&v44, 0, sizeof(v44));
    }
    v45.origin.double x = 0.0;
    v45.origin.double y = 0.0;
    v45.size.double width = v28;
    v45.size.double height = v30;
    CGRect v46 = CGRectApplyAffineTransform(v45, &v44);
    double v33 = v46.size.width;
    double v34 = v46.size.height;

    double v35 = [v26 target];
    [v35 center];
    double v37 = round(v36 - v34 * 0.5);
    double v39 = round(v38 - v33 * 0.5);

    double v40 = [v26 target];
    double v41 = [v40 container];
    double v42 = [(_UIContextMenuLayoutArbiter *)self containerView];
    objc_msgSend(v41, "convertRect:toView:", v42, v39, v37, v33, v34);
    objc_msgSend((id)qword_1EB260CE0, "setFrame:");

    double v43 = [(_UIContextMenuLayoutArbiter *)self containerView];
    [v43 addSubview:qword_1EB260CE0];
  }
}

- (UIView)containerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  return (UIView *)WeakRetained;
}

- (void)setContainerView:(id)a3
{
}

- (unint64_t)currentLayout
{
  return self->_currentLayout;
}

- (void)setCurrentLayout:(unint64_t)a3
{
  self->_currentLayout = a3;
}

- (_UIContextMenuLayoutArbiterInput)currentInput
{
  return self->_currentInput;
}

- (void)setCurrentInput:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentInput, 0);
  objc_destroyWeak((id *)&self->_containerView);
}

@end