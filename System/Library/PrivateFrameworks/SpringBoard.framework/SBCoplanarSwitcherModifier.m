@interface SBCoplanarSwitcherModifier
- (BOOL)usesContainerViewBoundsAsActiveFrame;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBCoplanarSwitcherModifier)initWithActiveAppLayout:(id)a3;
- (double)_offscreenSpacing;
- (double)scale;
- (double)scaleForIndex:(unint64_t)a3;
- (int64_t)_indexOfActiveAppLayout;
- (int64_t)spacingType;
- (uint64_t)activeAppLayout;
- (void)setActiveAppLayout:(uint64_t)a1;
- (void)setScale:(double)a3;
- (void)setSpacingType:(int64_t)a3;
- (void)setUsesContainerViewBoundsAsActiveFrame:(BOOL)a3;
@end

@implementation SBCoplanarSwitcherModifier

- (CGRect)frameForIndex:(unint64_t)a3
{
  int v5 = [(SBCoplanarSwitcherModifier *)self isChamoisWindowingUIEnabled];
  if (v5
    && ([(SBCoplanarSwitcherModifier *)self prefersStripHiddenAndDisabled] & 1) == 0)
  {
    v49.receiver = self;
    v49.super_class = (Class)SBCoplanarSwitcherModifier;
    [(SBCoplanarSwitcherModifier *)&v49 frameForIndex:a3];
    double x = v29;
    CGFloat y = v30;
    double width = v31;
    CGFloat height = v32;
  }
  else
  {
    [(SBCoplanarSwitcherModifier *)self containerViewBounds];
    double v9 = v8;
    if (self->_usesContainerViewBoundsAsActiveFrame) {
      char v10 = v5;
    }
    else {
      char v10 = 1;
    }
    if (v10)
    {
      v48.receiver = self;
      v48.super_class = (Class)SBCoplanarSwitcherModifier;
      [(SBCoplanarSwitcherModifier *)&v48 frameForIndex:a3];
      double x = v11;
      CGFloat y = v13;
      double width = v15;
      CGFloat height = v17;
    }
    else
    {
      CGFloat y = v6;
      CGFloat height = v7;
      UIRectGetCenter();
      double x = v19 + v9 * -0.5;
      double width = v9;
    }
    v20 = [(SBCoplanarSwitcherModifier *)self appLayouts];
    v21 = [v20 objectAtIndex:a3];

    if (![(SBAppLayout *)self->_activeAppLayout isOrContainsAppLayout:v21])
    {
      v22 = [(SBCoplanarSwitcherModifier *)self appLayoutContainingAppLayout:v21];
      char v23 = [v22 isOrContainsAppLayout:self->_activeAppLayout];

      if ((v23 & 1) == 0)
      {
        int64_t v24 = [(SBCoplanarSwitcherModifier *)self _indexOfActiveAppLayout];
        if (v24 == 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v25 = ~a3;
        }
        else {
          unint64_t v25 = v24 - a3;
        }
        if ([(SBCoplanarSwitcherModifier *)self isRTLEnabled]) {
          uint64_t v26 = -(uint64_t)v25;
        }
        else {
          uint64_t v26 = v25;
        }
        v27 = [(SBCoplanarSwitcherModifier *)self switcherSettings];
        if ([(SBCoplanarSwitcherModifier *)self isDevicePad]) {
          [v27 coplanarSpacingPad];
        }
        else {
          [v27 coplanarSpacingPhone];
        }
        double v33 = v28;
        if (v5)
        {
          v34 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v21];
          [v34 boundingBox];
          double x = v35;
          CGFloat y = v36;
          double width = v37;
          CGFloat height = v38;

          double v39 = (v9 + v33) * (double)v26;
          if (v26 < 1) {
            double v40 = v39 + v9 - (x + width);
          }
          else {
            double v40 = v39 - x;
          }
          double v41 = v40 * self->_scale;
        }
        else
        {
          double v41 = (width + v28) * self->_scale * (double)v26;
        }
        if (self->_spacingType == 1)
        {
          [(SBCoplanarSwitcherModifier *)self _offscreenSpacing];
          double v43 = 1.0;
          if (v26 < 0) {
            double v43 = -1.0;
          }
          double v41 = v41 + v42 * v43;
        }
        v50.origin.double x = x;
        v50.origin.CGFloat y = y;
        v50.size.double width = width;
        v50.size.CGFloat height = height;
        CGRect v51 = CGRectOffset(v50, v41, 0.0);
        double x = v51.origin.x;
        CGFloat y = v51.origin.y;
        double width = v51.size.width;
        CGFloat height = v51.size.height;
      }
    }
  }
  double v44 = x;
  double v45 = y;
  double v46 = width;
  double v47 = height;
  result.size.CGFloat height = v47;
  result.size.double width = v46;
  result.origin.CGFloat y = v45;
  result.origin.double x = v44;
  return result;
}

- (void).cxx_destruct
{
}

- (SBCoplanarSwitcherModifier)initWithActiveAppLayout:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBCoplanarSwitcherModifier;
  double v6 = [(SBSwitcherModifier *)&v9 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activeAppLayout, a3);
    v7->_scale = 1.0;
    v7->_spacingType = 0;
    v7->_usesContainerViewBoundsAsActiveFrame = 0;
  }

  return v7;
}

- (double)scaleForIndex:(unint64_t)a3
{
  if ([(SBCoplanarSwitcherModifier *)self isChamoisWindowingUIEnabled]
    && ([(SBCoplanarSwitcherModifier *)self prefersStripHiddenAndDisabled] & 1) == 0)
  {
    -[SBCoplanarSwitcherModifier scaleForIndex:](&v7, sel_scaleForIndex_, a3, v6.receiver, v6.super_class, self, SBCoplanarSwitcherModifier);
  }
  else if ([(SBCoplanarSwitcherModifier *)self isSystemAssistantExperienceEnabled]&& [(SBCoplanarSwitcherModifier *)self assistantPresentationState])
  {
    -[SBCoplanarSwitcherModifier scaleForIndex:](&v6, sel_scaleForIndex_, a3, self, SBCoplanarSwitcherModifier, v7.receiver, v7.super_class);
  }
  else
  {
    return self->_scale;
  }
  return result;
}

- (void)setUsesContainerViewBoundsAsActiveFrame:(BOOL)a3
{
  self->_usesContainerViewBoundsAsActiveFrame = a3;
}

- (int64_t)_indexOfActiveAppLayout
{
  if (!self->_activeAppLayout) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v3 = [(SBCoplanarSwitcherModifier *)self appLayouts];
  int64_t v4 = [v3 indexOfObject:self->_activeAppLayout];

  return v4;
}

- (double)_offscreenSpacing
{
  [(SBCoplanarSwitcherModifier *)self containerViewBounds];
  return v3 * (1.0 - self->_scale) * 0.5;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (BOOL)usesContainerViewBoundsAsActiveFrame
{
  return self->_usesContainerViewBoundsAsActiveFrame;
}

- (int64_t)spacingType
{
  return self->_spacingType;
}

- (void)setSpacingType:(int64_t)a3
{
  self->_spacingType = a3;
}

- (uint64_t)activeAppLayout
{
  if (result) {
    return *(void *)(result + 120);
  }
  return result;
}

- (void)setActiveAppLayout:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 120), a2);
  }
}

@end