@interface _UINavigationControllerPalette
- (BOOL)_attachmentIsChanging;
- (BOOL)_isPalettePinningBarHidden;
- (BOOL)_paletteOverridesPinningBar;
- (BOOL)_restartPaletteTransitionIfNecessary;
- (BOOL)_supportsSpecialSearchBarTransitions;
- (BOOL)isAttached;
- (BOOL)isPinned;
- (BOOL)isVisibleWhenPinningBarIsHidden;
- (BOOL)paletteIsHidden;
- (BOOL)paletteShadowIsHidden;
- (BOOL)pinningBarShadowIsHidden;
- (BOOL)pinningBarShadowWasHidden;
- (CGSize)_size;
- (NSArray)_backgroundConstraints;
- (NSArray)_constraints;
- (UIEdgeInsets)preferredContentInsets;
- (UINavigationController)navController;
- (UIView)_backgroundView;
- (UIViewController)_unpinnedController;
- (id)_attachedPinningTopBar;
- (id)_backgroundViewLayout;
- (id)_initWithNavigationController:(id)a3 forEdge:(unint64_t)a4;
- (id)_pinningBar;
- (unint64_t)boundaryEdge;
- (void)_configureConstraintsForBackground:(id)a3;
- (void)_configurePaletteConstraintsForBoundary;
- (void)_disableConstraints;
- (void)_enableConstraints;
- (void)_resetConstraintConstants:(double)a3;
- (void)_resetHeightConstraintConstant;
- (void)_setAttached:(BOOL)a3 didComplete:(BOOL)a4;
- (void)_setAttachmentIsChanging:(BOOL)a3;
- (void)_setBackgroundConstraints:(id)a3;
- (void)_setBackgroundView:(id)a3;
- (void)_setConstraints:(id)a3;
- (void)_setLeftConstraintConstant:(double)a3;
- (void)_setPaletteOverridesPinningBar:(BOOL)a3;
- (void)_setPalettePinningBarHidden:(BOOL)a3;
- (void)_setPinningBar:(id)a3;
- (void)_setRestartPaletteTransitionIfNecessary:(BOOL)a3;
- (void)_setSize:(CGSize)a3;
- (void)_setTopConstraintConstant:(double)a3;
- (void)_setVisualAltitude:(double)a3;
- (void)_setVisualAltitudeBias:(CGSize)a3;
- (void)_setupBackgroundViewIfNecessary;
- (void)_updateBackgroundConstraintsIfNecessary;
- (void)_updateBackgroundView;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)setFrame:(CGRect)a3;
- (void)setFrame:(CGRect)a3 isAnimating:(BOOL)a4;
- (void)setPaletteShadowIsHidden:(BOOL)a3;
- (void)setPinned:(BOOL)a3;
- (void)setPinningBarShadowIsHidden:(BOOL)a3;
- (void)setPinningBarShadowWasHidden:(BOOL)a3;
- (void)setPreferredContentInsets:(UIEdgeInsets)a3;
- (void)setVisibleWhenPinningBarIsHidden:(BOOL)a3;
- (void)set_unpinnedController:(id)a3;
@end

@implementation _UINavigationControllerPalette

- (BOOL)_supportsSpecialSearchBarTransitions
{
  return 0;
}

- (id)_initWithNavigationController:(id)a3 forEdge:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UINavigationControllerPalette;
  id result = -[UIView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (result)
  {
    *((void *)result + 56) = a3;
    *((void *)result + 55) = a4;
    *((unsigned char *)result + 432) |= 0x18u;
    *(_OWORD *)((char *)result + 504) = 0u;
    *(_OWORD *)((char *)result + 520) = 0u;
  }
  return result;
}

- (void)dealloc
{
  backgroundView = self->_backgroundView;
  if (backgroundView) {

  }
  constraints = self->__constraints;
  if (constraints) {

  }
  backgroundConstraints = self->__backgroundConstraints;
  if (backgroundConstraints) {

  }
  v6.receiver = self;
  v6.super_class = (Class)_UINavigationControllerPalette;
  [(UIView *)&v6 dealloc];
}

- (void)_setAttachmentIsChanging:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_paletteFlags = *(unsigned char *)&self->_paletteFlags & 0xFD | v3;
}

- (BOOL)_attachmentIsChanging
{
  return (*(unsigned char *)&self->_paletteFlags >> 1) & 1;
}

- (void)_setRestartPaletteTransitionIfNecessary:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_paletteFlags = *(unsigned char *)&self->_paletteFlags & 0xFB | v3;
}

- (BOOL)_restartPaletteTransitionIfNecessary
{
  return (*(unsigned char *)&self->_paletteFlags >> 2) & 1;
}

- (BOOL)pinningBarShadowIsHidden
{
  return (*(unsigned char *)&self->_paletteFlags >> 4) & 1;
}

- (void)setPinningBarShadowIsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UINavigationControllerPalette *)self pinningBarShadowIsHidden] != a3)
  {
    char v5 = v3 ? 16 : 0;
    *(unsigned char *)&self->_paletteFlags = *(unsigned char *)&self->_paletteFlags & 0xEF | v5;
    if ([(UIView *)self superview])
    {
      if (self->__pinningBar && (objc_opt_respondsToSelector() & 1) != 0)
      {
        id pinningBar = self->__pinningBar;
        double v7 = (double)([(_UINavigationControllerPalette *)self pinningBarShadowIsHidden] ^ 1);
        [pinningBar _setShadowAlpha:v7];
      }
    }
  }
}

- (BOOL)pinningBarShadowWasHidden
{
  return (*(unsigned char *)&self->_paletteFlags >> 6) & 1;
}

- (void)setPinningBarShadowWasHidden:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_paletteFlags = *(unsigned char *)&self->_paletteFlags & 0xBF | v3;
}

- (BOOL)paletteShadowIsHidden
{
  if ((*(unsigned char *)&self->_paletteFlags & 0x20) != 0) {
    return 1;
  }
  id v2 = [(_UINavigationControllerPalette *)self _attachedPinningTopBar];
  return [v2 _hidesShadow];
}

- (id)_attachedPinningTopBar
{
  if ([(_UINavigationControllerPalette *)self isAttached]
    && [(_UINavigationControllerPalette *)self boundaryEdge] == 2)
  {
    return self->__pinningBar;
  }
  else
  {
    return 0;
  }
}

- (void)_updateBackgroundView
{
  id v2 = [(UINavigationController *)self->_navController navigationBar];
  [(UINavigationBar *)v2 _updatePaletteBackgroundIfNecessary];
}

- (void)setPaletteShadowIsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UINavigationControllerPalette *)self paletteShadowIsHidden] != a3)
  {
    if (v3) {
      char v5 = 32;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)&self->_paletteFlags = *(unsigned char *)&self->_paletteFlags & 0xDF | v5;
    [(_UINavigationControllerPalette *)self _updateBackgroundView];
  }
}

- (void)_setAttached:(BOOL)a3 didComplete:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  char paletteFlags = (char)self->_paletteFlags;
  if (a4) {
    char v8 = 0;
  }
  else {
    char v8 = 2;
  }
  *(unsigned char *)&self->_char paletteFlags = v8 | a3 | paletteFlags & 0xFC;
  if (a3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ([self->__pinningBar _hidesShadow]) {
      char v9 = 64;
    }
    else {
      char v9 = 0;
    }
    *(unsigned char *)&self->_char paletteFlags = *(unsigned char *)&self->_paletteFlags & 0xBF | v9;
  }
  if (v4 || ((paletteFlags & 1) == 0) == v5)
  {
    if (!v5) {
      self->__unpinnedController = 0;
    }
    id pinningBar = self->__pinningBar;
    [pinningBar _palette:self isAttaching:v5 didComplete:v4];
  }
}

- (BOOL)isPinned
{
  return (*(unsigned char *)&self->_paletteFlags >> 3) & 1;
}

- (void)setPinned:(BOOL)a3
{
  if (a3)
  {
    self->__unpinnedController = 0;
    char v4 = *(unsigned char *)&self->_paletteFlags | 8;
  }
  else
  {
    self->__unpinnedController = [(UINavigationController *)self->_navController topViewController];
    char v4 = *(unsigned char *)&self->_paletteFlags & 0xF7;
  }
  *(unsigned char *)&self->_char paletteFlags = v4;
}

- (BOOL)isAttached
{
  return *(unsigned char *)&self->_paletteFlags & 1;
}

- (BOOL)paletteIsHidden
{
  return (*(unsigned char *)&self->_paletteFlags & 1) != 0 && [(UIView *)self superview] == 0;
}

- (void)_configureConstraintsForBackground:(id)a3
{
  v15[4] = *MEMORY[0x1E4F143B8];
  if (self->_boundaryEdge != 5 && a3 && !self->_backgroundView)
  {
    [(UIView *)self bounds];
    double v6 = v5;
    double v8 = v7;
    [(UIView *)self _visualAltitudeSensitiveBoundsWithInfiniteEdges:10];
    double v10 = v9;
    uint64_t v12 = [MEMORY[0x1E4F5B268] constraintWithItem:a3 attribute:1 relatedBy:0 toItem:self attribute:1 multiplier:1.0 constant:v11 - v6];
    uint64_t v13 = [MEMORY[0x1E4F5B268] constraintWithItem:a3 attribute:7 relatedBy:0 toItem:self attribute:7 multiplier:1.0 constant:v10 - v8];
    uint64_t v14 = [MEMORY[0x1E4F5B268] constraintWithItem:a3 attribute:8 relatedBy:0 toItem:self attribute:8 multiplier:1.0 constant:0.0];
    v15[0] = v12;
    v15[1] = [MEMORY[0x1E4F5B268] constraintWithItem:a3 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:0.0];
    v15[2] = v13;
    v15[3] = v14;
    -[_UINavigationControllerPalette _setBackgroundConstraints:](self, "_setBackgroundConstraints:", [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4]);
    [a3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self addConstraints:self->__backgroundConstraints];
  }
}

- (void)_updateBackgroundConstraintsIfNecessary
{
  backgroundConstraints = self->__backgroundConstraints;
  if (backgroundConstraints)
  {
    id v4 = [(NSArray *)backgroundConstraints objectAtIndex:1];
    id v5 = [(NSArray *)self->__backgroundConstraints objectAtIndex:3];
    if (self->__palettePinningBarHidden && [(_UINavigationControllerPalette *)self isAttached])
    {
      double v6 = 0.0;
      if ([(UINavigationController *)self->_navController _viewControllerUnderlapsStatusBar])
      {
        [(UINavigationController *)self->_navController _statusBarHeightForCurrentInterfaceOrientation];
        double v6 = v7;
      }
      double backgroundUnderlapHeight = self->_backgroundUnderlapHeight;
      if (v6 != backgroundUnderlapHeight)
      {
        double v9 = v6 - backgroundUnderlapHeight;
        [v4 constant];
        [v4 setConstant:v10 - v9];
        [v5 constant];
        [v5 setConstant:v9 + v11];
        self->_double backgroundUnderlapHeight = v6;
      }
    }
    else if (self->_backgroundUnderlapHeight != 0.0)
    {
      [v4 constant];
      [v4 setConstant:v12 + self->_backgroundUnderlapHeight];
      [v5 constant];
      [v5 setConstant:v13 - self->_backgroundUnderlapHeight];
      self->_double backgroundUnderlapHeight = 0.0;
    }
  }
}

- (void)_setPalettePinningBarHidden:(BOOL)a3
{
  self->__palettePinningBarHidden = a3;
  [(_UINavigationControllerPalette *)self _updateBackgroundConstraintsIfNecessary];
}

- (void)_configurePaletteConstraintsForBoundary
{
  v27[3] = *MEMORY[0x1E4F143B8];
  unint64_t boundaryEdge = self->_boundaryEdge;
  if (boundaryEdge == 5)
  {
    double v9 = [(UINavigationController *)self->_navController navigationBar];
    if ([(UIView *)v9 superview] && [(UIView *)self superview])
    {
      constraints = self->__constraints;
      if (!constraints)
      {
        double height = self->__size.height;
        uint64_t v12 = [MEMORY[0x1E4F5B268] constraintWithItem:self attribute:1 relatedBy:0 toItem:v9 attribute:1 multiplier:1.0 constant:0.0];
        uint64_t v13 = [MEMORY[0x1E4F5B268] constraintWithItem:self attribute:7 relatedBy:0 toItem:v9 attribute:7 multiplier:1.0 constant:0.0];
        uint64_t v14 = [MEMORY[0x1E4F5B268] constraintWithItem:self attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:height];
        v23[0] = v12;
        v23[1] = [MEMORY[0x1E4F5B268] constraintWithItem:self attribute:4 relatedBy:0 toItem:v9 attribute:3 multiplier:1.0 constant:0.0];
        v23[2] = v13;
        v23[3] = v14;
        -[_UINavigationControllerPalette _setConstraints:](self, "_setConstraints:", [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4]);
        [(UIView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
        constraints = self->__constraints;
      }
      v15 = (void *)MEMORY[0x1E4F5B268];
      goto LABEL_30;
    }
  }
  else if (boundaryEdge == 2)
  {
    id v4 = objc_msgSend(-[UINavigationController _outermostNavigationController](self->_navController, "_outermostNavigationController"), "navigationBar");
    if ([v4 superview] && -[UIView superview](self, "superview"))
    {
      id v5 = self->__constraints;
      if (!v5)
      {
        id v8 = 0;
        goto LABEL_26;
      }
      uint64_t v6 = [(NSArray *)v5 count];
      if (v6)
      {
        if (v6 == 4)
        {
          if (v4 != objc_msgSend(-[NSArray firstObject](self->__constraints, "firstObject"), "secondItem"))
          {
            double v7 = (void *)MEMORY[0x1E4F5B268];
            v27[0] = [(NSArray *)self->__constraints objectAtIndexedSubscript:0];
            v27[1] = [(NSArray *)self->__constraints objectAtIndexedSubscript:1];
            v27[2] = [(NSArray *)self->__constraints objectAtIndexedSubscript:2];
            objc_msgSend(v7, "deactivateConstraints:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v27, 3));
            id v8 = [(NSArray *)self->__constraints objectAtIndexedSubscript:3];
            [(_UINavigationControllerPalette *)self _setConstraints:0];
            goto LABEL_25;
          }
LABEL_24:
          id v8 = 0;
LABEL_25:
          constraints = self->__constraints;
          if (constraints)
          {
LABEL_29:
            v15 = (void *)MEMORY[0x1E4F5B268];
LABEL_30:
            [v15 activateConstraints:constraints];
            return;
          }
LABEL_26:
          double v18 = self->__size.height;
          uint64_t v19 = [MEMORY[0x1E4F5B268] constraintWithItem:self attribute:1 relatedBy:0 toItem:v4 attribute:1 multiplier:1.0 constant:0.0];
          uint64_t v20 = [MEMORY[0x1E4F5B268] constraintWithItem:self attribute:7 relatedBy:0 toItem:v4 attribute:7 multiplier:1.0 constant:0.0];
          if (!v8) {
            id v8 = (id)[MEMORY[0x1E4F5B268] constraintWithItem:self attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:v18];
          }
          v24[0] = v19;
          v24[1] = [MEMORY[0x1E4F5B268] constraintWithItem:self attribute:3 relatedBy:0 toItem:v4 attribute:4 multiplier:1.0 constant:0.0];
          v24[2] = v20;
          v24[3] = v8;
          -[_UINavigationControllerPalette _setConstraints:](self, "_setConstraints:", [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4]);
          [(UIView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
          constraints = self->__constraints;
          goto LABEL_29;
        }
        if (os_variant_has_internal_diagnostics())
        {
          v21 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
          {
            v22 = self->__constraints;
            *(_DWORD *)buf = 138412290;
            v26 = v22;
            _os_log_fault_impl(&dword_1853B0000, v21, OS_LOG_TYPE_FAULT, "If we have a constraints array, we should have exactly 4 constraints, but we have: %@", buf, 0xCu);
          }
        }
        else
        {
          v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_configurePaletteConstraintsForBoundary___s_category)+ 8);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = self->__constraints;
            *(_DWORD *)buf = 138412290;
            v26 = v17;
            _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "If we have a constraints array, we should have exactly 4 constraints, but we have: %@", buf, 0xCu);
          }
        }
        [MEMORY[0x1E4F5B268] deactivateConstraints:self->__constraints];
      }
      [(_UINavigationControllerPalette *)self _setConstraints:0];
      goto LABEL_24;
    }
  }
  else
  {
    [(UIView *)self setAutoresizingMask:0];
  }
}

- (void)_disableConstraints
{
  if (self->__constraints)
  {
    objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
    [(UIView *)self setTranslatesAutoresizingMaskIntoConstraints:1];
  }
}

- (void)_enableConstraints
{
  if (self->__constraints)
  {
    [(UIView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
    BOOL v3 = (void *)MEMORY[0x1E4F5B268];
    constraints = self->__constraints;
    [v3 activateConstraints:constraints];
  }
}

- (void)_resetConstraintConstants:(double)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  constraints = self->__constraints;
  if (constraints)
  {
    switch(self->_boundaryEdge)
    {
      case 1uLL:
      case 3uLL:
        uint64_t v6 = [(NSArray *)constraints objectAtIndex:2];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        double v7 = self->__constraints;
        uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v34 objects:v43 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v35 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              if (v12 == (void *)v6)
              {
                double width = self->__size.width;
                uint64_t v12 = (void *)v6;
              }
              else
              {
                double width = 0.0;
              }
              [v12 setConstant:width];
            }
            uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v34 objects:v43 count:16];
          }
          while (v9);
        }
        break;
      case 2uLL:
      case 4uLL:
        uint64_t v14 = [(NSArray *)constraints objectAtIndex:3];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        v15 = self->__constraints;
        uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v38 objects:v44 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v39;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v39 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void **)(*((void *)&v38 + 1) + 8 * j);
              if (v20 == (void *)v14)
              {
                double height = self->__size.height;
                uint64_t v20 = (void *)v14;
              }
              else
              {
                double height = 0.0;
              }
              [v20 setConstant:height];
            }
            uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v38 objects:v44 count:16];
          }
          while (v17);
        }
        break;
      case 5uLL:
        uint64_t v22 = [(NSArray *)constraints objectAtIndex:3];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        v23 = self->__constraints;
        uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v30 objects:v42 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v31;
          do
          {
            for (uint64_t k = 0; k != v25; ++k)
            {
              if (*(void *)v31 != v26) {
                objc_enumerationMutation(v23);
              }
              v28 = *(void **)(*((void *)&v30 + 1) + 8 * k);
              if (v28 == (void *)v22)
              {
                double v29 = self->__size.height;
                v28 = (void *)v22;
              }
              else
              {
                double v29 = 0.0;
              }
              [v28 setConstant:v29];
            }
            uint64_t v25 = [(NSArray *)v23 countByEnumeratingWithState:&v30 objects:v42 count:16];
          }
          while (v25);
        }
        break;
      default:
        break;
    }
  }
  if (a3 != 0.0) {
    [(_UINavigationControllerPalette *)self _setTopConstraintConstant:a3];
  }
}

- (void)setFrame:(CGRect)a3 isAnimating:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  int v11 = +[UIView _isInAnimationBlockWithAnimationsEnabled] ^ v4;
  if (has_internal_diagnostics)
  {
    if (v11)
    {
      uint64_t v13 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "The isAnimating parameter in the call to setFrame:isInAnimationBlock: is lying", buf, 2u);
      }
    }
  }
  else if (v11)
  {
    uint64_t v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setFrame_isAnimating____s_category) + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "The isAnimating parameter in the call to setFrame:isInAnimationBlock: is lying", buf, 2u);
    }
  }
  -[_UINavigationControllerPalette _setSize:](self, "_setSize:", width, height);
  if (!+[UIView _isInAnimationBlockWithAnimationsEnabled]&& [(UIView *)self window]&& [(UIView *)[[(_UINavigationControllerPalette *)self navController] navigationBar] window])
  {
    [(_UINavigationControllerPalette *)self _disableConstraints];
    v16.receiver = self;
    v16.super_class = (Class)_UINavigationControllerPalette;
    -[UIView setFrame:](&v16, sel_setFrame_, x, y, width, height);
    [(UIView *)self layoutBelowIfNeeded];
    [(_UINavigationControllerPalette *)self _enableConstraints];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)_UINavigationControllerPalette;
    -[UIView setFrame:](&v15, sel_setFrame_, x, y, width, height);
    [(UIView *)self layoutBelowIfNeeded];
  }
  [(_UINavigationControllerPalette *)self _resetConstraintConstants:0.0];
  if (self->_boundaryEdge == 5)
  {
    navController = self->_navController;
    if (navController) {
      [(UINavigationController *)navController _updateLayoutForStatusBarAndInterfaceOrientation];
    }
  }
}

- (void)_setSize:(CGSize)a3
{
  double height = self->__size.height;
  self->__size = a3;
  if (height != a3.height) {
    [(_UINavigationControllerPalette *)self _resetHeightConstraintConstant];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[_UINavigationControllerPalette _setSize:](self, "_setSize:", a3.size.width, a3.size.height);
  v8.receiver = self;
  v8.super_class = (Class)_UINavigationControllerPalette;
  -[UIView setFrame:](&v8, sel_setFrame_, x, y, width, height);
  if ([(UIView *)self window]) {
    [(UIView *)self layoutBelowIfNeeded];
  }
}

- (void)_setTopConstraintConstant:(double)a3
{
  constraints = self->__constraints;
  if (constraints)
  {
    unint64_t boundaryEdge = self->_boundaryEdge;
    if (boundaryEdge == 5 || boundaryEdge == 2)
    {
      id v8 = [(NSArray *)constraints objectAtIndex:1];
      [v8 constant];
      if (v9 != a3)
      {
        [v8 setConstant:a3];
      }
    }
  }
}

- (void)_setLeftConstraintConstant:(double)a3
{
  constraints = self->__constraints;
  if (constraints)
  {
    unint64_t boundaryEdge = self->_boundaryEdge;
    if (boundaryEdge == 5 || boundaryEdge == 2)
    {
      id v8 = [(NSArray *)constraints objectAtIndex:0];
      [v8 constant];
      if (v9 != a3)
      {
        [v8 setConstant:a3];
      }
    }
  }
}

- (void)_resetHeightConstraintConstant
{
  constraints = self->__constraints;
  if (constraints)
  {
    unint64_t boundaryEdge = self->_boundaryEdge;
    if (boundaryEdge == 5 || boundaryEdge == 2)
    {
      id v6 = [(NSArray *)constraints objectAtIndex:3];
      p_size = &self->__size;
      double height = p_size->height;
      [v6 constant];
      if (height != v9)
      {
        double v10 = p_size->height;
        [v6 setConstant:v10];
      }
    }
  }
}

- (void)_setupBackgroundViewIfNecessary
{
  if (self->_boundaryEdge != 5 && !self->_backgroundView)
  {
    BOOL v3 = (void *)[self->__pinningBar _backgroundViewForPalette:self];
    self->_backgroundViewLayout = (_UIBarBackgroundLayoutLegacy *)[v3 layout];
    [(UIView *)self bounds];
    objc_msgSend(v3, "setFrame:");
    [(UIView *)self insertSubview:v3 atIndex:0];
    [(_UINavigationControllerPalette *)self _configureConstraintsForBackground:v3];
    self->_backgroundView = (_UIBarBackground *)v3;
  }
}

- (id)_backgroundViewLayout
{
  return self->_backgroundViewLayout;
}

- (UIView)_backgroundView
{
  [(_UINavigationControllerPalette *)self _setupBackgroundViewIfNecessary];
  id result = [(_UIBarBackground *)self->_backgroundView customBackgroundView];
  if (!result) {
    return &self->_backgroundView->super;
  }
  return result;
}

- (void)_setBackgroundView:(id)a3
{
  [(_UINavigationControllerPalette *)self _setupBackgroundViewIfNecessary];
  backgroundView = self->_backgroundView;
  [(_UIBarBackground *)backgroundView setCustomBackgroundView:a3];
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationControllerPalette;
  [(UIView *)&v3 didMoveToSuperview];
  [(_UINavigationControllerPalette *)self _setupBackgroundViewIfNecessary];
  if ([(UIView *)self superview])
  {
    if (self->__pinningBar)
    {
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(self->__pinningBar, "_setShadowAlpha:", (double)(-[_UINavigationControllerPalette pinningBarShadowIsHidden](self, "pinningBarShadowIsHidden") ^ 1));
      }
    }
    [(_UINavigationControllerPalette *)self _configurePaletteConstraintsForBoundary];
  }
}

- (void)_setVisualAltitude:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UINavigationControllerPalette;
  [(UIView *)&v4 _setVisualAltitude:a3];
  if (self->_backgroundView) {
    -[_UINavigationControllerPalette _configureConstraintsForBackground:](self, "_configureConstraintsForBackground:");
  }
}

- (void)_setVisualAltitudeBias:(CGSize)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UINavigationControllerPalette;
  -[UIView _setVisualAltitudeBias:](&v4, sel__setVisualAltitudeBias_, a3.width, a3.height);
  if (self->_backgroundView) {
    -[_UINavigationControllerPalette _configureConstraintsForBackground:](self, "_configureConstraintsForBackground:");
  }
}

- (BOOL)_paletteOverridesPinningBar
{
  return self->__paletteOverridesPinningBar;
}

- (void)_setPaletteOverridesPinningBar:(BOOL)a3
{
  self->__paletteOverridesPinningBar = a3;
}

- (unint64_t)boundaryEdge
{
  return self->_boundaryEdge;
}

- (UIEdgeInsets)preferredContentInsets
{
  double top = self->_preferredContentInsets.top;
  double left = self->_preferredContentInsets.left;
  double bottom = self->_preferredContentInsets.bottom;
  double right = self->_preferredContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPreferredContentInsets:(UIEdgeInsets)a3
{
  self->_preferredContentInsets = a3;
}

- (UINavigationController)navController
{
  return self->_navController;
}

- (BOOL)isVisibleWhenPinningBarIsHidden
{
  return self->_visibleWhenPinningBarIsHidden;
}

- (void)setVisibleWhenPinningBarIsHidden:(BOOL)a3
{
  self->_visibleWhenPinningBarIsHidden = a3;
}

- (UIViewController)_unpinnedController
{
  return self->__unpinnedController;
}

- (void)set_unpinnedController:(id)a3
{
  self->__unpinnedController = (UIViewController *)a3;
}

- (id)_pinningBar
{
  return self->__pinningBar;
}

- (void)_setPinningBar:(id)a3
{
  self->__id pinningBar = a3;
}

- (NSArray)_constraints
{
  return self->__constraints;
}

- (void)_setConstraints:(id)a3
{
}

- (CGSize)_size
{
  double width = self->__size.width;
  double height = self->__size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSArray)_backgroundConstraints
{
  return self->__backgroundConstraints;
}

- (void)_setBackgroundConstraints:(id)a3
{
}

- (BOOL)_isPalettePinningBarHidden
{
  return self->__palettePinningBarHidden;
}

@end