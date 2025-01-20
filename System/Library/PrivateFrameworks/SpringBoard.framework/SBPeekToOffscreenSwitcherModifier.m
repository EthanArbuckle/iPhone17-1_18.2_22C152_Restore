@interface SBPeekToOffscreenSwitcherModifier
- (BOOL)isSwitcherWindowVisible;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBPeekToOffscreenSwitcherModifier)initWithTransitionID:(id)a3 peekingAppLayout:(id)a4 peekConfiguration:(int64_t)a5 spaceConfiguration:(int64_t)a6;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (void)setState:(int64_t)a3;
@end

@implementation SBPeekToOffscreenSwitcherModifier

- (SBPeekToOffscreenSwitcherModifier)initWithTransitionID:(id)a3 peekingAppLayout:(id)a4 peekConfiguration:(int64_t)a5 spaceConfiguration:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  if (!v12)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBPeekToOffscreenSwitcherModifier.m", 30, @"Invalid parameter not satisfying: %@", @"peekingAppLayout" object file lineNumber description];
  }
  if (!SBPeekConfigurationIsValid(a5))
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBPeekToOffscreenSwitcherModifier.m", 31, @"Invalid parameter not satisfying: %@", @"SBPeekConfigurationIsValid(peekConfiguration)" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)SBPeekToOffscreenSwitcherModifier;
  v13 = [(SBTransitionSwitcherModifier *)&v18 initWithTransitionID:v11];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_peekingAppLayout, a4);
    v14->_peekConfiguration = a5;
    v14->_spaceConfiguration = a6;
  }

  return v14;
}

- (void)setState:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBPeekToOffscreenSwitcherModifier;
  [(SBChainableModifier *)&v3 setState:a3];
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v46[1] = *MEMORY[0x1E4F143B8];
  v5 = [(SBPeekToOffscreenSwitcherModifier *)self appLayouts];
  v6 = [v5 objectAtIndex:a3];

  if (v6 == self->_peekingAppLayout && [(SBTransitionSwitcherModifier *)self isUpdatingLayout])
  {
    uint64_t v7 = 1;
    v39 = [(SBAppLayout *)self->_peekingAppLayout itemForLayoutRole:1];
    if (self->_spaceConfiguration == 1)
    {
      v8 = [SBAppLayout alloc];
      v38 = [NSNumber numberWithInteger:1];
      v45 = v38;
      v46[0] = v39;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
      v10 = [(SBAppLayout *)v8 initWithItemsForLayoutRoles:v9 configuration:1 environment:[(SBAppLayout *)self->_peekingAppLayout environment] preferredDisplayOrdinal:[(SBPeekToOffscreenSwitcherModifier *)self displayOrdinal]];
    }
    else
    {
      v23 = [[SBDisplayItem alloc] initWithType:0 bundleIdentifier:@"SBPeekToOffscreenSwitcherModifier-placeholder" uniqueIdentifier:&stru_1F3084718];
      v9 = [(SBAppLayout *)self->_peekingAppLayout itemForLayoutRole:1];
      int64_t peekConfiguration = self->_peekConfiguration;
      if (peekConfiguration == 2) {
        uint64_t v25 = 2;
      }
      else {
        uint64_t v25 = 1;
      }
      if (peekConfiguration != 2) {
        uint64_t v7 = 2;
      }
      v36 = [SBAppLayout alloc];
      v37 = [NSNumber numberWithInteger:v7];
      v43[0] = v37;
      v44[0] = v9;
      v26 = [NSNumber numberWithInteger:v25];
      v43[1] = v26;
      v38 = v23;
      v44[1] = v23;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];
      v10 = [(SBAppLayout *)v36 initWithItemsForLayoutRoles:v27 configuration:SBAppLayoutConfigurationFromMainDisplayLayoutStateSpaceConfiguration(self->_spaceConfiguration) environment:[(SBAppLayout *)self->_peekingAppLayout environment] preferredDisplayOrdinal:[(SBPeekToOffscreenSwitcherModifier *)self displayOrdinal]];
    }
    v42.receiver = self;
    v42.super_class = (Class)SBPeekToOffscreenSwitcherModifier;
    [(SBPeekToOffscreenSwitcherModifier *)&v42 frameForIndex:a3];
    SBRectWithSize();
    v41.receiver = self;
    v41.super_class = (Class)SBPeekToOffscreenSwitcherModifier;
    -[SBPeekToOffscreenSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v41, sel_frameForLayoutRole_inAppLayout_withBounds_, v7, v10);
    SBRectWithSize();
    double v16 = v28;
    double v18 = v29;
    char v30 = [(SBPeekToOffscreenSwitcherModifier *)self isRTLEnabled];
    int64_t v31 = self->_peekConfiguration;
    if (v30)
    {
      if (v31 != 3)
      {
LABEL_15:
        [(SBPeekToOffscreenSwitcherModifier *)self containerViewBounds];
        double v12 = v32 + v33;
LABEL_18:
        [(SBPeekToOffscreenSwitcherModifier *)self containerViewBounds];
        double v14 = v35;

        goto LABEL_6;
      }
    }
    else if (v31 != 2)
    {
      goto LABEL_15;
    }
    [(SBPeekToOffscreenSwitcherModifier *)self containerViewBounds];
    double v12 = v34 - v16;
    goto LABEL_18;
  }
  v40.receiver = self;
  v40.super_class = (Class)SBPeekToOffscreenSwitcherModifier;
  [(SBPeekToOffscreenSwitcherModifier *)&v40 frameForIndex:a3];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
LABEL_6:

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  if (self->_peekingAppLayout == a4) {
    return 1.0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBPeekToOffscreenSwitcherModifier;
  -[SBPeekToOffscreenSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v6, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3);
  return result;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (void).cxx_destruct
{
}

@end