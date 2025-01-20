@interface SBOverridePreferredFrameSwitcherModifier
- (CGPoint)newPreferredCenter;
- (CGRect)newPreferredFrame;
- (CGRect)preferredFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 bounds:(CGRect)a5 interfaceOrientation:(int64_t)a6;
- (CGSize)newPreferredSize;
- (SBDisplayItem)displayItem;
- (SBOverridePreferredFrameSwitcherModifier)initWithDisplayItem:(id)a3;
- (SBOverridePreferredFrameSwitcherModifier)initWithNewPreferredCenter:(CGPoint)a3 forDisplayItem:(id)a4;
- (SBOverridePreferredFrameSwitcherModifier)initWithNewPreferredFrame:(CGRect)a3 forDisplayItem:(id)a4;
- (SBOverridePreferredFrameSwitcherModifier)initWithNewPreferredSize:(CGSize)a3 forDisplayItem:(id)a4;
- (SBOverridePreferredFrameSwitcherModifier)initWithNewPreferredSize:(CGSize)a3 newPreferredCenter:(CGPoint)a4 forDisplayItem:(id)a5;
- (void)setNewPreferredCenter:(CGPoint)a3;
- (void)setNewPreferredFrame:(CGRect)a3;
- (void)setNewPreferredSize:(CGSize)a3;
@end

@implementation SBOverridePreferredFrameSwitcherModifier

- (SBOverridePreferredFrameSwitcherModifier)initWithDisplayItem:(id)a3
{
  return -[SBOverridePreferredFrameSwitcherModifier initWithNewPreferredSize:newPreferredCenter:forDisplayItem:](self, "initWithNewPreferredSize:newPreferredCenter:forDisplayItem:", a3, 1.79769313e308, 1.79769313e308, 1.79769313e308, 1.79769313e308);
}

- (SBOverridePreferredFrameSwitcherModifier)initWithNewPreferredSize:(CGSize)a3 forDisplayItem:(id)a4
{
  return -[SBOverridePreferredFrameSwitcherModifier initWithNewPreferredSize:newPreferredCenter:forDisplayItem:](self, "initWithNewPreferredSize:newPreferredCenter:forDisplayItem:", a4, a3.width, a3.height, 1.79769313e308, 1.79769313e308);
}

- (SBOverridePreferredFrameSwitcherModifier)initWithNewPreferredCenter:(CGPoint)a3 forDisplayItem:(id)a4
{
  return -[SBOverridePreferredFrameSwitcherModifier initWithNewPreferredSize:newPreferredCenter:forDisplayItem:](self, "initWithNewPreferredSize:newPreferredCenter:forDisplayItem:", a4, 1.79769313e308, 1.79769313e308, a3.x, a3.y);
}

- (SBOverridePreferredFrameSwitcherModifier)initWithNewPreferredFrame:(CGRect)a3 forDisplayItem:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  id v7 = a4;
  UIRectGetCenter();
  v10 = -[SBOverridePreferredFrameSwitcherModifier initWithNewPreferredSize:newPreferredCenter:forDisplayItem:](self, "initWithNewPreferredSize:newPreferredCenter:forDisplayItem:", v7, width, height, v8, v9);

  return v10;
}

- (SBOverridePreferredFrameSwitcherModifier)initWithNewPreferredSize:(CGSize)a3 newPreferredCenter:(CGPoint)a4 forDisplayItem:(id)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBOverridePreferredFrameSwitcherModifier;
  v13 = [(SBSwitcherModifier *)&v16 init];
  if (v13)
  {
    if (!v12)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, v13, @"SBOverridePreferredFrameSwitcherModifier.m", 34, @"Invalid parameter not satisfying: %@", @"displayItem" object file lineNumber description];
    }
    v13->_newPreferredSize.CGFloat width = width;
    v13->_newPreferredSize.CGFloat height = height;
    v13->_newPreferredCenter.CGFloat x = x;
    v13->_newPreferredCenter.CGFloat y = y;
    objc_storeStrong((id *)&v13->_displayItem, a5);
  }

  return v13;
}

- (void)setNewPreferredFrame:(CGRect)a3
{
  self->_newPreferredSize.CGFloat width = a3.size.width;
  self->_newPreferredSize.CGFloat height = a3.size.height;
  p_newPreferredCenter = &self->_newPreferredCenter;
  UIRectGetCenter();
  p_newPreferredCenter->CGFloat x = v4;
  p_newPreferredCenter->CGFloat y = v5;
}

- (CGRect)newPreferredFrame
{
  BOOL v2 = self->_newPreferredCenter.x == 1.79769313e308 && self->_newPreferredCenter.y == 1.79769313e308;
  if (v2
    || (self->_newPreferredSize.width == 1.79769313e308
      ? (BOOL v3 = self->_newPreferredSize.height == 1.79769313e308)
      : (BOOL v3 = 0),
        v3))
  {
    double v4 = *MEMORY[0x1E4F1DB20];
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    SBRectWithSize();
    UIRectCenteredAboutPoint();
  }
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (void)setNewPreferredSize:(CGSize)a3
{
  self->_newPreferredSize = a3;
}

- (void)setNewPreferredCenter:(CGPoint)a3
{
  self->_newPreferredCenter = a3;
}

- (CGRect)preferredFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 bounds:(CGRect)a5 interfaceOrientation:(int64_t)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v13 = a4;
  v14 = [v13 itemForLayoutRole:a3];
  if ([v14 isEqual:self->_displayItem])
  {
    BOOL v15 = self->_newPreferredSize.width == 1.79769313e308;
    if (self->_newPreferredSize.height != 1.79769313e308) {
      BOOL v15 = 0;
    }
    if (self->_newPreferredCenter.x != 1.79769313e308 || self->_newPreferredCenter.y != 1.79769313e308)
    {
      if (v15)
      {
        v31.receiver = self;
        v31.super_class = (Class)SBOverridePreferredFrameSwitcherModifier;
        -[SBOverridePreferredFrameSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](&v31, sel_preferredFrameForLayoutRole_inAppLayout_bounds_interfaceOrientation_, a3, v13, a6, x, y, width, height, 1.79769313e308, 1.79769313e308, 1.79769313e308, 1.79769313e308);
      }
      SBRectWithSize();
      goto LABEL_14;
    }
    if (!v15)
    {
      v30.receiver = self;
      v30.super_class = (Class)SBOverridePreferredFrameSwitcherModifier;
      -[SBOverridePreferredFrameSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](&v30, sel_preferredFrameForLayoutRole_inAppLayout_bounds_interfaceOrientation_, a3, v13, a6, x, y, width, height, 1.79769313e308, 1.79769313e308, 1.79769313e308, 1.79769313e308);
      UIRectGetCenter();
      SBRectWithSize();
LABEL_14:
      UIRectCenteredAboutPoint();
      goto LABEL_15;
    }
  }
  v29.receiver = self;
  v29.super_class = (Class)SBOverridePreferredFrameSwitcherModifier;
  -[SBOverridePreferredFrameSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](&v29, sel_preferredFrameForLayoutRole_inAppLayout_bounds_interfaceOrientation_, a3, v13, a6, x, y, width, height);
LABEL_15:
  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
  double v24 = v20;

  double v25 = v21;
  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (CGSize)newPreferredSize
{
  double width = self->_newPreferredSize.width;
  double height = self->_newPreferredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPoint)newPreferredCenter
{
  double x = self->_newPreferredCenter.x;
  double y = self->_newPreferredCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (SBDisplayItem)displayItem
{
  return self->_displayItem;
}

- (void).cxx_destruct
{
}

@end