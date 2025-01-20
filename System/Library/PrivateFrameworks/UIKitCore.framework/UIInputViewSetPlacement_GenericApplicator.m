@interface UIInputViewSetPlacement_GenericApplicator
+ (id)applicatorForOwner:(id)a3 withPlacement:(id)a4;
- (BOOL)allConstraintsActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGesture:(id)a3 inDraggableView:(CGPoint)a4;
- (BOOL)preBeginGesture:(id)a3 shouldBegin:(BOOL *)a4;
- (CGPoint)origin;
- (CGRect)popoverFrame;
- (CGRect)targetRect;
- (NSArray)constraints;
- (NSString)description;
- (UIEdgeInsets)contentInsets;
- (UIEdgeInsets)inputAccessoryPadding;
- (UIEdgeInsets)inputAssistantPadding;
- (UIView)backdropContainer;
- (UIView)draggableView;
- (UIView)twoFingerDraggableView;
- (id)initForOwner:(id)a3 withPlacement:(id)a4;
- (void)applyChanges:(id)a3;
- (void)checkVerticalConstraint;
@end

@implementation UIInputViewSetPlacement_GenericApplicator

+ (id)applicatorForOwner:(id)a3 withPlacement:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initForOwner:v7 withPlacement:v6];

  return v8;
}

- (id)initForOwner:(id)a3 withPlacement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v44.receiver = self;
  v44.super_class = (Class)UIInputViewSetPlacement_GenericApplicator;
  v8 = [(UIInputViewSetPlacement_GenericApplicator *)&v44 init];
  p_isa = (id *)&v8->super.isa;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_owner, v6);
    if (!v7)
    {
      id v7 = [v6 placement];
    }
    v10 = [v6 inputViewSet];
    v11 = [v6 hostView];
    v12 = [v6 containerView];
    uint64_t v13 = [v7 horizontalConstraintForInputViewSet:v10 hostView:v11 containerView:v12];
    id v14 = p_isa[1];
    p_isa[1] = (id)v13;

    v15 = [v6 inputViewSet];
    v16 = [v6 hostView];
    v17 = [v6 containerView];
    uint64_t v18 = [v7 verticalConstraintForInputViewSet:v15 hostView:v16 containerView:v17];
    id v19 = p_isa[2];
    p_isa[2] = (id)v18;

    v20 = [v6 inputViewSet];
    v21 = [v6 hostView];
    v22 = [v6 containerView];
    uint64_t v23 = [v7 widthConstraintForInputViewSet:v20 hostView:v21 containerView:v22];
    id v24 = p_isa[3];
    p_isa[3] = (id)v23;

    v25 = NSString;
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    v30 = [v25 stringWithFormat:@"%@<%@>.horizontal", v27, v29];
    [p_isa[1] setIdentifier:v30];

    v31 = NSString;
    v32 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v32);
    v34 = (objc_class *)objc_opt_class();
    v35 = NSStringFromClass(v34);
    v36 = [v31 stringWithFormat:@"%@<%@>.vertical", v33, v35];
    [p_isa[2] setIdentifier:v36];

    v37 = NSString;
    v38 = (objc_class *)objc_opt_class();
    v39 = NSStringFromClass(v38);
    v40 = (objc_class *)objc_opt_class();
    v41 = NSStringFromClass(v40);
    v42 = [v37 stringWithFormat:@"%@<%@>.width", v39, v41];
    [p_isa[3] setIdentifier:v42];
  }
  return p_isa;
}

- (void)applyChanges:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  id v6 = [v4 objectForKey:@"Alpha"];
  if (v6)
  {
    id v7 = [WeakRetained hostView];
    v8 = [v7 layer];
    [v8 setAllowsGroupOpacity:0];

    [v6 doubleValue];
    double v10 = v9;
    v11 = [WeakRetained hostView];
    [v11 setAlpha:v10];
  }
  [WeakRetained setHideInputViewBackdrops:0];
  v12 = [v4 objectForKey:@"Transform"];
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 CGAffineTransformValue];
  }
  else
  {
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v31 = *MEMORY[0x1E4F1DAB8];
    long long v32 = v14;
    long long v33 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  v15 = [WeakRetained hostView];
  v30[0] = v31;
  v30[1] = v32;
  v30[2] = v33;
  [v15 setTransform:v30];

  v16 = [v4 objectForKey:@"TouchInsets"];
  v17 = v16;
  if (v16)
  {
    [v16 UIEdgeInsetsValue];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
  }
  else
  {
    double v19 = 0.0;
    double v21 = 0.0;
    double v23 = 0.0;
    double v25 = 0.0;
  }
  v26 = [WeakRetained hostView];
  objc_msgSend(v26, "_setTouchInsets:", v19, v21, v23, v25);

  v27 = [v4 objectForKey:@"Origin"];
  v28 = v27;
  if (v27)
  {
    [v27 pointValue];
    [(NSLayoutConstraint *)self->_verticalConstraint setConstant:v29];
  }
  else
  {
    [(UIInputViewSetPlacement_GenericApplicator *)self checkVerticalConstraint];
  }
}

- (void)checkVerticalConstraint
{
}

- (UIView)twoFingerDraggableView
{
  return 0;
}

- (UIView)draggableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  v3 = [WeakRetained hostView];

  return (UIView *)v3;
}

- (NSArray)constraints
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_horizontalConstraint) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_verticalConstraint) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_widthConstraint) {
    objc_msgSend(v4, "addObject:");
  }
  return (NSArray *)v4;
}

- (CGPoint)origin
{
  [(NSLayoutConstraint *)self->_horizontalConstraint constant];
  double v4 = v3;
  [(NSLayoutConstraint *)self->_verticalConstraint constant];
  double v6 = v5;
  double v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (UIView)backdropContainer
{
  return 0;
}

- (CGRect)targetRect
{
  double v3 = +[UIKeyboardImpl activeInstance];
  double v4 = [v3 _window];

  if (v4)
  {
    double v5 = +[UIKeyboardImpl activeInstance];
    double v6 = [(UIInputViewSetPlacement_GenericApplicator *)self draggableView];
    [v5 dragGestureRectInView:v6];
    double v8 = v7;
    double v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;
  }
  else
  {
    double v5 = [(UIInputViewSetPlacement_GenericApplicator *)self draggableView];
    [v5 bounds];
    double v8 = v15 + -80.0;
    double v6 = [(UIInputViewSetPlacement_GenericApplicator *)self draggableView];
    [v6 bounds];
    double v10 = v16 + -80.0;
    *(double *)&uint64_t v12 = 80.0;
    *(double *)&uint64_t v14 = 80.0;
  }

  double v17 = v8;
  double v18 = v10;
  double v19 = *(double *)&v12;
  double v20 = *(double *)&v14;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)preBeginGesture:(id)a3 shouldBegin:(BOOL *)a4
{
  id v6 = a3;
  [(UIInputViewSetPlacement_GenericApplicator *)self targetRect];
  if (CGRectIsEmpty(v10))
  {
    BOOL v7 = 0;
  }
  else
  {
    if ([v6 numberOfTouches] != 2)
    {
      BOOL v8 = 0;
      goto LABEL_7;
    }
    BOOL v7 = 1;
  }
  *a4 = v7;
  BOOL v8 = 1;
LABEL_7:

  return v8;
}

- (BOOL)isGesture:(id)a3 inDraggableView:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  [(UIInputViewSetPlacement_GenericApplicator *)self targetRect];
  CGFloat v10 = x;
  CGFloat v11 = y;
  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (UIEdgeInsets)contentInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGRect)popoverFrame
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (UIEdgeInsets)inputAssistantPadding
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  [WeakRetained inputViewPadding];
  double v4 = v3;
  double v6 = v5;

  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = v4;
  double v10 = v6;
  result.right = v10;
  result.bottom = v8;
  result.left = v9;
  result.top = v7;
  return result;
}

- (UIEdgeInsets)inputAccessoryPadding
{
  p_owner = &self->_owner;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  double v4 = [WeakRetained hostView];
  double v5 = [v4 _rootInputWindowController];
  double v6 = [v5 placement];

  double v7 = [v6 subPlacements];
  double v8 = [v7 firstObject];
  id v9 = objc_loadWeakRetained((id *)p_owner);
  double v10 = [v9 placement];

  double v11 = 0.0;
  if (v8 == v10
    && [v6 isFloatingAssistantView]
    && ([v6 isCompactAssistantView] & 1) == 0)
  {
    id v12 = objc_loadWeakRetained((id *)p_owner);
    uint64_t v13 = [v12 hostView];
    uint64_t v14 = [v13 _rootInputWindowController];
    double v15 = [v14 inputViewSet];
    double v16 = [v15 inputAssistantView];
    [v16 frame];
    double v11 = v17;
  }
  double v18 = 0.0;
  double v19 = 0.0;
  double v20 = 0.0;
  double v21 = -v11;
  result.right = v20;
  result.bottom = v21;
  result.left = v19;
  result.top = v18;
  return result;
}

- (BOOL)allConstraintsActive
{
  if (![(NSLayoutConstraint *)self->_horizontalConstraint isActive]
    || ![(NSLayoutConstraint *)self->_verticalConstraint isActive])
  {
    return 0;
  }
  widthConstraint = self->_widthConstraint;
  return [(NSLayoutConstraint *)widthConstraint isActive];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    double v5 = (void **)v4;
    BOOL v6 = UIInputViewSetAreConstraintsEqualEnough(self->_horizontalConstraint, v5[1])
      && UIInputViewSetAreConstraintsEqualEnough(self->_verticalConstraint, v5[2])
      && UIInputViewSetAreConstraintsEqualEnough(self->_widthConstraint, v5[3]);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  double v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)UIInputViewSetPlacement_GenericApplicator;
  id v4 = [(UIInputViewSetPlacement_GenericApplicator *)&v8 description];
  double v5 = [(UIInputViewSetPlacement_GenericApplicator *)self constraints];
  BOOL v6 = [v3 stringWithFormat:@"<%@; %@>", v4, v5];

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_verticalConstraint, 0);
  objc_storeStrong((id *)&self->_horizontalConstraint, 0);
}

@end