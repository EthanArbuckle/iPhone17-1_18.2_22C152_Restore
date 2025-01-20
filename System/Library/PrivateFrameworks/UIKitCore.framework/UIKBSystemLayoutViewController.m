@interface UIKBSystemLayoutViewController
+ (id)systemLayoutViewControllerWithViewController:(id)a3;
- (CGSize)centeredOffsets;
- (UIEdgeInsets)minimumInsets;
- (unint64_t)horizontalLayoutType;
- (unint64_t)verticalLayoutType;
- (void)setCenteredOffsets:(CGSize)a3;
- (void)setHorizontalLayoutType:(unint64_t)a3;
- (void)setMinimumInsets:(UIEdgeInsets)a3;
- (void)setVerticalLayoutType:(unint64_t)a3;
- (void)updateViewConstraints;
@end

@implementation UIKBSystemLayoutViewController

+ (id)systemLayoutViewControllerWithViewController:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithNibName:0 bundle:0];
  v6 = [v5 view];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5[123] = 1;
  v5[124] = 1;
  [v5 addChildViewController:v4];
  v7 = [v5 view];
  v8 = [v4 view];
  [v7 addSubview:v8];

  [v4 didMoveToParentViewController:v5];
  v9 = [v4 view];

  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 updateViewConstraints];
  return v5;
}

- (void)setHorizontalLayoutType:(unint64_t)a3
{
  self->_horizontalLayoutType = a3;
  [(UIKBSystemLayoutViewController *)self updateViewConstraints];
}

- (void)setVerticalLayoutType:(unint64_t)a3
{
  self->_verticalLayoutType = a3;
  [(UIKBSystemLayoutViewController *)self updateViewConstraints];
}

- (void)setMinimumInsets:(UIEdgeInsets)a3
{
  self->_minimumInsets = a3;
  [(UIKBSystemLayoutViewController *)self updateViewConstraints];
}

- (void)setCenteredOffsets:(CGSize)a3
{
  self->_centeredOffsets = a3;
  [(UIKBSystemLayoutViewController *)self updateViewConstraints];
}

- (void)updateViewConstraints
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v45.receiver = self;
  v45.super_class = (Class)UIKBSystemLayoutViewController;
  [(UIViewController *)&v45 updateViewConstraints];
  v3 = [(UIViewController *)self view];
  [v3 removeConstraints:self->_constraints];

  [(NSMutableArray *)self->_constraints removeAllObjects];
  id v4 = [(UIViewController *)self view];
  v5 = [v4 subviews];
  v6 = [v5 firstObject];

  v40 = v6;
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  v11 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v12 = [(UIKBSystemLayoutViewController *)self horizontalLayoutType];
  BOOL v13 = 0;
  v14 = &unk_1ED3F4770;
  switch(v12)
  {
    case 0uLL:
      goto LABEL_7;
    case 1uLL:
      BOOL v13 = 0;
      v14 = &unk_1ED3F4788;
      goto LABEL_7;
    case 2uLL:
      BOOL v13 = 0;
      goto LABEL_6;
    case 3uLL:
      goto LABEL_5;
    case 4uLL:
      BOOL v13 = v8 > 0.0;
LABEL_5:
      [v11 addObject:&unk_1ED3F4770];
LABEL_6:
      v14 = &unk_1ED3F47A0;
LABEL_7:
      [v11 addObject:v14];
      break;
    default:
      break;
  }
  unint64_t v15 = [(UIKBSystemLayoutViewController *)self verticalLayoutType];
  BOOL v16 = 0;
  BOOL v38 = v13;
  v17 = &unk_1ED3F47B8;
  switch(v15)
  {
    case 0uLL:
      goto LABEL_14;
    case 1uLL:
      BOOL v16 = 0;
      v17 = &unk_1ED3F47D0;
      goto LABEL_14;
    case 2uLL:
      BOOL v16 = 0;
      goto LABEL_13;
    case 3uLL:
      goto LABEL_12;
    case 4uLL:
      BOOL v16 = v10 > 0.0;
LABEL_12:
      [v11 addObject:&unk_1ED3F47B8];
LABEL_13:
      v17 = &unk_1ED3F47E8;
LABEL_14:
      [v11 addObject:v17];
      break;
    default:
      break;
  }
  BOOL v37 = v16;
  if (!self->_constraints)
  {
    v18 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
    constraints = self->_constraints;
    self->_constraints = v18;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v11;
  uint64_t v20 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v42 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = [*(id *)(*((void *)&v41 + 1) + 8 * i) integerValue];
        double v25 = 0.0;
        v26 = &OBJC_IVAR___UIKBSystemLayoutViewController__minimumInsets;
        p_overrideTransitioningDelegate = (char *)self;
        switch(v24)
        {
          case 1:
            v26 = &OBJC_IVAR___UIKBSystemLayoutViewController__minimumInsets;
            goto LABEL_26;
          case 2:
            v26 = &OBJC_IVAR___UIKBSystemLayoutViewController__minimumInsets;
            p_overrideTransitioningDelegate = (char *)&self->super._overrideTransitioningDelegate;
            goto LABEL_29;
          case 3:
            goto LABEL_29;
          case 4:
            v26 = &OBJC_IVAR___UIKBSystemLayoutViewController__minimumInsets;
            p_overrideTransitioningDelegate = (char *)&self->super.super.__layeringSceneIdentity;
            goto LABEL_29;
          case 9:
            v26 = &OBJC_IVAR___UIKBSystemLayoutViewController__centeredOffsets;
            p_overrideTransitioningDelegate = (char *)self;
            goto LABEL_29;
          case 10:
            v26 = &OBJC_IVAR___UIKBSystemLayoutViewController__centeredOffsets;
LABEL_26:
            p_overrideTransitioningDelegate = (char *)&self->super.super._responderFlags;
LABEL_29:
            double v25 = *(double *)&p_overrideTransitioningDelegate[*v26];
            break;
          default:
            break;
        }
        v28 = (void *)MEMORY[0x1E4F5B268];
        v29 = [(UIViewController *)self view];
        v30 = [v28 constraintWithItem:v29 attribute:v24 relatedBy:0 toItem:v40 attribute:v24 multiplier:1.0 constant:v25];

        LODWORD(v31) = 1148846080;
        [v30 setPriority:v31];
        [(NSMutableArray *)self->_constraints addObject:v30];
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v21);
  }

  if (v37)
  {
    v32 = self->_constraints;
    v33 = [MEMORY[0x1E4F5B268] constraintWithItem:v40 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:v10];
    [(NSMutableArray *)v32 addObject:v33];
  }
  if (v38)
  {
    v34 = self->_constraints;
    v35 = [MEMORY[0x1E4F5B268] constraintWithItem:v40 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:v8];
    [(NSMutableArray *)v34 addObject:v35];
  }
  v36 = [(UIViewController *)self view];
  [v36 addConstraints:self->_constraints];
}

- (unint64_t)horizontalLayoutType
{
  return self->_horizontalLayoutType;
}

- (unint64_t)verticalLayoutType
{
  return self->_verticalLayoutType;
}

- (UIEdgeInsets)minimumInsets
{
  double top = self->_minimumInsets.top;
  double left = self->_minimumInsets.left;
  double bottom = self->_minimumInsets.bottom;
  double right = self->_minimumInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)centeredOffsets
{
  double width = self->_centeredOffsets.width;
  double height = self->_centeredOffsets.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
}

@end