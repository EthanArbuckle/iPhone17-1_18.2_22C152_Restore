@interface UIInputViewSetPlacementFloating
+ (BOOL)supportsSecureCoding;
+ (CGRect)frameAtOffset:(CGPoint)a3 keyboardSize:(CGSize)a4 screenSize:(CGSize)a5;
+ (id)infoWithPoint:(CGPoint)a3 forOwner:(id)a4;
+ (id)placementWithUndockedOffset:(CGPoint)a3 chromeBuffer:(UIEdgeInsets)a4 floatingWidth:(double)a5;
- (BOOL)accessoryViewWillAppear;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFloating;
- (BOOL)isFloatingAssistantView;
- (BOOL)showsEditItems;
- (CGRect)adjustBoundsForNotificationsWithOwner:(id)a3;
- (CGRect)remoteIntrinsicContentSizeForInputViewInSet:(id)a3 includingIAV:(BOOL)a4;
- (Class)applicatorClassForKeyboard:(BOOL)a3;
- (UIInputViewSetPlacementFloating)initWithCoder:(id)a3;
- (UIResponder)responderToFollow;
- (double)floatingWidth;
- (id)applicatorInfoForOwner:(id)a3;
- (id)assistantView;
- (id)currentResponderView;
- (id)expiringPlacement;
- (id)horizontalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5;
- (id)subPlacements;
- (id)widthConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5;
- (unint64_t)indexForPurpose:(unint64_t)a3;
- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4;
- (void)checkSizeForOwner:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFloatingWidth:(double)a3;
- (void)setResponderToFollow:(id)a3;
- (void)setSubPlacements:(id)a3;
- (void)updateChromeBuffer;
@end

@implementation UIInputViewSetPlacementFloating

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  p_responderToFollow = &self->_responderToFollow;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_responderToFollow);

  if (WeakRetained != v7)
  {
    if ((a3->var0 & 0x80) != 0)
    {
      id v10 = [(UIInputViewSetPlacement *)self delegate];
      [v10 placementNeedsUpdate:self];
    }
    else
    {
      v9 = objc_loadWeakRetained((id *)p_responderToFollow);
      -[UIView _removeGeometryChangeObserver:](v9, self);

      objc_storeWeak((id *)p_responderToFollow, 0);
    }
  }
}

- (void)checkSizeForOwner:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 hostView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double width = self->_lastSize.width;
  double height = self->_lastSize.height;

  if (width != v7 || height != v9) {
    goto LABEL_21;
  }
  double v14 = *MEMORY[0x1E4F1DAD8];
  double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v15 = [v4 containerView];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v20 = objc_msgSend(v4, "applicator", 0);
  v21 = [v20 constraints];

  uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v27 = [v26 firstAttribute];
        if (v27 == 4)
        {
          [v26 constant];
          double v13 = -v29 / v19;
        }
        else if (v27 == 1)
        {
          [v26 constant];
          double v14 = v28 / v17;
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v23);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_responderToFollow);
  if (!WeakRetained)
  {
    -[UIInputViewSetPlacementUndocked setNormalizedOffset:](self, "setNormalizedOffset:", v14, v13);
    goto LABEL_23;
  }
  [(UIInputViewSetPlacementUndocked *)self normalizedOffset];
  if (v32 != v14 || v31 != v13)
  {
    v33 = objc_loadWeakRetained((id *)&self->_responderToFollow);
    -[UIView _removeGeometryChangeObserver:](v33, self);

    objc_storeWeak((id *)&self->_responderToFollow, 0);
    -[UIInputViewSetPlacementUndocked setNormalizedOffset:](self, "setNormalizedOffset:", v14, v13);
LABEL_21:
    v34 = [(UIInputViewSetPlacement *)self delegate];
    [v34 placementNeedsUpdate:self];
  }
LABEL_23:
}

- (Class)applicatorClassForKeyboard:(BOOL)a3
{
  return (Class)objc_opt_class();
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_responderToFollow);

  if (WeakRetained)
  {
    double v6 = objc_loadWeakRetained((id *)&self->_responderToFollow);
    -[UIView _removeGeometryChangeObserver:](v6, self);

    objc_storeWeak((id *)&self->_responderToFollow, 0);
  }
  v9.receiver = self;
  v9.super_class = (Class)UIInputViewSetPlacementFloating;
  [(UIInputViewSetPlacement *)&v9 setDelegate:v4];
  if (v4)
  {
    double v7 = [(UIInputViewSetPlacementFloating *)self currentResponderView];
    objc_storeWeak((id *)&self->_responderToFollow, v7);

    double v8 = objc_loadWeakRetained((id *)&self->_responderToFollow);
    -[UIView _addGeometryChangeObserver:](v8, self);
  }
}

- (id)currentResponderView
{
  return 0;
}

- (id)applicatorInfoForOwner:(id)a3
{
  id v4 = a3;
  if ([v4 keyboardController])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_responderToFollow);

    if (WeakRetained)
    {
      double v6 = [(UIInputViewSetPlacementFloating *)self currentResponderView];
      double v7 = v6;
      if (v6)
      {
        [v6 bounds];
        objc_msgSend(v7, "_convertViewPointToSceneSpaceForKeyboard:");
        self->_responderRect.origin.x = v8;
        self->_responderRect.origin.y = v9;
        self->_responderRect.size.double width = v10;
        self->_responderRect.size.double height = v11;
        v12 = objc_loadWeakRetained((id *)&self->_responderToFollow);

        if (v12 != v7)
        {
          double v13 = objc_loadWeakRetained((id *)&self->_responderToFollow);
          -[UIView _removeGeometryChangeObserver:](v13, self);

          id v14 = objc_storeWeak((id *)&self->_responderToFollow, v7);
          -[UIView _addGeometryChangeObserver:](v7, self);
        }
      }
    }
  }
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __58__UIInputViewSetPlacementFloating_applicatorInfoForOwner___block_invoke;
  v74[3] = &unk_1E52D9F70;
  id v15 = v4;
  id v75 = v15;
  +[UIView performWithoutAnimation:v74];
  double v16 = [v15 containerView];
  [v16 frame];
  double v18 = v17;
  double v20 = v19;

  if ([v15 keyboardController]
    && (id v21 = objc_loadWeakRetained((id *)&self->_responderToFollow), v21, v21))
  {
    uint64_t v22 = [v15 containerView];
    uint64_t v23 = [v22 layer];
    objc_msgSend(v23, "convertRect:fromLayer:", 0, self->_responderRect.origin.x, self->_responderRect.origin.y, self->_responderRect.size.width, self->_responderRect.size.height);
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;

    double v32 = (void *)MEMORY[0x1E4F1CA60];
    v33 = [v15 hostView];
    [v33 bounds];
    long long v35 = +[UIKeyboardPopoverContainer propertiesForTargetRect:withHeight:onScreenSize:](UIKeyboardPopoverContainer, "propertiesForTargetRect:withHeight:onScreenSize:", v25, v27, v29, v31, v34, v18, v20);
    long long v36 = [v32 dictionaryWithDictionary:v35];

    long long v37 = [v36 objectForKey:_UIKeyboardPopoverKeyboardRect];
    [v37 rectValue];
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;

    double v44 = v41 + v43 - v20;
    v45 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", v39, v44);
    [v36 setObject:v45 forKey:@"Origin"];

    -[UIInputViewSetPlacementUndocked setNormalizedOffset:](self, "setNormalizedOffset:", v39 / v18, -v44 / v20);
  }
  else
  {
    v46 = (void *)MEMORY[0x1E4F1CA60];
    v73.receiver = self;
    v73.super_class = (Class)UIInputViewSetPlacementFloating;
    v47 = -[UIInputViewSetPlacementUndocked applicatorInfoForOwner:](&v73, sel_applicatorInfoForOwner_, v15, *(void *)&v20);
    long long v36 = [v46 dictionaryWithDictionary:v47];

    v48 = [v15 applicator];
    [v48 contentInsets];
    double v50 = v49;
    double v52 = v51;

    v53 = [v36 objectForKey:@"Origin"];
    [v53 CGPointValue];
    double v55 = v54;

    v56 = [v15 hostView];
    [v56 bounds];
    double v58 = v57;

    +[UIKeyboardImpl floatingWidth];
    double v60 = v59;
    double v61 = 0.0;
    double v62 = 0.0;
    if (v18 > 0.0)
    {
      double v61 = (v18 - v52 - v59) / v18;
      double v62 = v50 / v18;
    }
    [(UIInputViewSetPlacementUndocked *)self normalizedOffset];
    if (v63 >= v61) {
      double v63 = v61;
    }
    if (v63 < v62) {
      double v63 = v62;
    }
    double v64 = v18 * v63;
    v65 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v18 * v63, v55);
    [v36 setObject:v65 forKey:@"Origin"];

    v66 = +[UIKeyboardPopoverContainer propertiesForSpecificKeyboardFrame:onScreenSize:](UIKeyboardPopoverContainer, "propertiesForSpecificKeyboardFrame:onScreenSize:", v64, v55, v60, v58, v18, v72);
    [v36 addEntriesFromDictionary:v66];
  }
  p_lastSize = &self->_lastSize;
  v68 = [v15 hostView];
  [v68 frame];
  p_lastSize->double width = v69;
  p_lastSize->double height = v70;

  return v36;
}

void __58__UIInputViewSetPlacementFloating_applicatorInfoForOwner___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) hostView];
  [v1 layoutIfNeeded];
}

- (void)dealloc
{
  p_responderToFollow = &self->_responderToFollow;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_responderToFollow);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_responderToFollow);
    -[UIView _removeGeometryChangeObserver:](v5, self);

    objc_storeWeak((id *)p_responderToFollow, 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)UIInputViewSetPlacementFloating;
  [(UIInputViewSetPlacementFloating *)&v6 dealloc];
}

+ (id)placementWithUndockedOffset:(CGPoint)a3 chromeBuffer:(UIEdgeInsets)a4 floatingWidth:(double)a5
{
  objc_super v6 = objc_msgSend(a1, "placementWithUndockedOffset:chromeBuffer:", a3.x, a3.y, a4.top, a4.left, a4.bottom, a4.right);
  [v6 setFloatingWidth:a5];
  return v6;
}

+ (CGRect)frameAtOffset:(CGPoint)a3 keyboardSize:(CGSize)a4 screenSize:(CGSize)a5
{
  +[UIKeyboardPopoverContainer frameAtOffset:keyboardSize:screenSize:](UIKeyboardPopoverContainer, "frameAtOffset:keyboardSize:screenSize:", a3.x, a3.y, a4.width, a4.height, a5.width, a5.height);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (UIInputViewSetPlacementFloating)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIInputViewSetPlacementFloating;
  double v5 = [(UIInputViewSetPlacementUndocked *)&v8 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"FloatingWidth"];
    v5->_floatingWidth = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIInputViewSetPlacementFloating;
  id v4 = a3;
  [(UIInputViewSetPlacementUndocked *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"FloatingWidth", self->_floatingWidth, v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)updateChromeBuffer
{
  +[UIPeripheralHost floatingChromeBuffer];
  -[UIInputViewSetPlacementUndocked setChromeBuffer:](self, "setChromeBuffer:");
}

- (id)horizontalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  id v7 = a5;
  if (a4)
  {
    id v8 = a4;
    +[UIKeyboardImpl floatingWidth];
    double v10 = v9;
    [v7 bounds];
    double v12 = v11;
    double v13 = 0.0;
    if (v11 > 0.0) {
      double v13 = (v11 - v10) / v11;
    }
    [(UIInputViewSetPlacementUndocked *)self normalizedOffset];
    if (v14 >= v13) {
      double v14 = v13;
    }
    id v15 = [MEMORY[0x1E4F5B268] constraintWithItem:v8 attribute:1 relatedBy:0 toItem:v7 attribute:1 multiplier:1.0 constant:v12 * v14];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)widthConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  if (a4)
  {
    double v6 = [MEMORY[0x1E4F5B268] constraintWithItem:a4 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:self->_floatingWidth];
  }
  else
  {
    double v6 = 0;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (id *)a3;
  v9.receiver = self;
  v9.super_class = (Class)UIInputViewSetPlacementFloating;
  if ([(UIInputViewSetPlacementUndocked *)&v9 isEqual:v4]
    && *((double *)v4 + 11) == self->_floatingWidth)
  {
    id WeakRetained = objc_loadWeakRetained(v4 + 12);
    id v6 = objc_loadWeakRetained((id *)&self->_responderToFollow);
    BOOL v7 = WeakRetained == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)infoWithPoint:(CGPoint)a3 forOwner:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = +[UIInputViewSetPlacementUndocked infoWithPoint:](UIInputViewSetPlacementUndocked, "infoWithPoint:", x, y);
  objc_super v9 = [v6 dictionaryWithDictionary:v8];

  double v10 = [v7 containerView];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;

  id v15 = [v7 hostView];

  [v15 frame];
  double v17 = v16;
  double v19 = v18;

  double v20 = +[UIKeyboardPopoverContainer propertiesForSpecificKeyboardFrame:onScreenSize:](UIKeyboardPopoverContainer, "propertiesForSpecificKeyboardFrame:onScreenSize:", x, y, v17, v19, v12, v14);
  [v9 addEntriesFromDictionary:v20];

  return v9;
}

- (void)setSubPlacements:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  subPlacements = self->_subPlacements;
  self->_subPlacements = v4;
}

- (id)subPlacements
{
  v9[1] = *MEMORY[0x1E4F143B8];
  subPlacements = self->_subPlacements;
  if (subPlacements)
  {
    v3 = subPlacements;
  }
  else
  {
    cachedSecondaryPlacement = self->_cachedSecondaryPlacement;
    if (!cachedSecondaryPlacement)
    {
      id v6 = +[UIInputViewSetPlacement placement];
      id v7 = self->_cachedSecondaryPlacement;
      self->_cachedSecondaryPlacement = v6;

      cachedSecondaryPlacement = self->_cachedSecondaryPlacement;
    }
    v9[0] = cachedSecondaryPlacement;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  return v3;
}

- (unint64_t)indexForPurpose:(unint64_t)a3
{
  unint64_t result = 0;
  if ((uint64_t)a3 <= 3)
  {
    if (a3 < 4) {
      return result;
    }
    return 1;
  }
  if ((uint64_t)a3 > 100)
  {
    if (a3 == 102) {
      return [(NSArray *)self->_subPlacements count] != 0;
    }
    return 1;
  }
  if (a3 != 100) {
    return 1;
  }
  return result;
}

- (id)expiringPlacement
{
  if ([(UIInputViewSetPlacement *)self isVisible])
  {
    uint64_t v3 = +[UIInputViewSetPlacementInvisible placementWithPlacement:self];
  }
  else
  {
    uint64_t v3 = self;
  }
  return v3;
}

- (CGRect)adjustBoundsForNotificationsWithOwner:(id)a3
{
  v31.receiver = self;
  v31.super_class = (Class)UIInputViewSetPlacementFloating;
  id v3 = a3;
  [(UIInputViewSetPlacement *)&v31 adjustBoundsForNotificationsWithOwner:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = objc_msgSend(v3, "containerView", v31.receiver, v31.super_class);

  [v12 frame];
  double v14 = v13;
  double v16 = v15;

  double v17 = +[UIKeyboardPopoverContainer propertiesForSpecificKeyboardFrame:onScreenSize:](UIKeyboardPopoverContainer, "propertiesForSpecificKeyboardFrame:onScreenSize:", v5, v7, v9, v11, v14, v16);
  double v18 = [v17 objectForKeyedSubscript:@"PopoverRect"];
  [v18 CGRectValue];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  double v27 = v20;
  double v28 = v11 + v22 - v16;
  double v29 = v24;
  double v30 = v26;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

- (CGRect)remoteIntrinsicContentSizeForInputViewInSet:(id)a3 includingIAV:(BOOL)a4
{
  v17.receiver = self;
  v17.super_class = (Class)UIInputViewSetPlacementFloating;
  [(UIInputViewSetPlacementUndocked *)&v17 remoteIntrinsicContentSizeForInputViewInSet:a3 includingIAV:a4];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  +[UIKeyboardImpl floatingWidth];
  if (v9 <= v12) {
    double v13 = v7;
  }
  else {
    double v13 = 0.0;
  }
  double v14 = v5;
  double v15 = v9;
  double v16 = v11;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v13;
  result.origin.double x = v14;
  return result;
}

- (BOOL)showsEditItems
{
  return 0;
}

- (BOOL)isFloating
{
  return 1;
}

- (id)assistantView
{
  return [(NSArray *)self->_subPlacements firstObject];
}

- (BOOL)isFloatingAssistantView
{
  return [(NSArray *)self->_subPlacements count] != 0;
}

- (BOOL)accessoryViewWillAppear
{
  return 1;
}

- (UIResponder)responderToFollow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_responderToFollow);
  return (UIResponder *)WeakRetained;
}

- (void)setResponderToFollow:(id)a3
{
}

- (double)floatingWidth
{
  return self->_floatingWidth;
}

- (void)setFloatingWidth:(double)a3
{
  self->_floatingWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subPlacements, 0);
  objc_storeStrong((id *)&self->_cachedSecondaryPlacement, 0);
  objc_destroyWeak((id *)&self->_responderToFollow);
}

@end