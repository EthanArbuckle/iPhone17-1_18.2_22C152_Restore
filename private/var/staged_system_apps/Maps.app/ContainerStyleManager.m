@interface ContainerStyleManager
- (BOOL)allowOnlyStandardStyle;
- (BOOL)stackOnOppositeSide;
- (ContainerStyleManager)initWithContainer:(id)a3;
- (ContainerViewController)containerViewController;
- (double)containerWidth;
- (double)leadingMargin;
- (unint64_t)containerStyle;
- (unint64_t)layoutStyleForCurrentTraitsCollection;
- (void)configureStyleLayout;
- (void)createConstraints;
- (void)setAllowOnlyStandardStyle:(BOOL)a3;
- (void)setBottomConstraint;
- (void)setContainerStyle:(unint64_t)a3;
- (void)setContainerViewController:(id)a3;
- (void)setStackOnOppositeSide:(BOOL)a3;
- (void)updateLayoutStyle;
@end

@implementation ContainerStyleManager

- (ContainerStyleManager)initWithContainer:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ContainerStyleManager;
  v5 = [(ContainerStyleManager *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_containerViewController, v4);
    v6->_containerStyle = 0;
    v6->_allowOnlyStandardStyle = 1;
  }

  return v6;
}

- (void)updateLayoutStyle
{
  unint64_t v3 = [(ContainerStyleManager *)self layoutStyleForCurrentTraitsCollection];
  if (self->_containerStyle == v3)
  {
    if (v3 != 7)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      [WeakRetained topEdgePadding];
      -[NSLayoutConstraint setConstant:](self->_topContainerViewConstraint, "setConstant:");

      unint64_t containerStyle = self->_containerStyle;
      if (containerStyle - 2 >= 3)
      {
        if (containerStyle == 6)
        {
          BOOL stackOnOppositeSide = self->_stackOnOppositeSide;
          [(ContainerStyleManager *)self leadingMargin];
          double v9 = -v8;
          uint64_t v10 = 24;
          if (stackOnOppositeSide) {
            double v8 = -v8;
          }
          else {
            uint64_t v10 = 16;
          }
          [*(id *)((char *)&self->super.isa + v10) setConstant:v8, v9];
          [(ContainerStyleManager *)self containerWidth];
          -[NSLayoutConstraint setConstant:](self->_widthContainerViewConstraint, "setConstant:");
          [(ContainerStyleManager *)self setBottomConstraint];
        }
      }
      else
      {
        [(ContainerStyleManager *)self leadingMargin];
        -[NSLayoutConstraint setConstant:](self->_leadingContainerViewConstraint, "setConstant:");
        [(ContainerStyleManager *)self containerWidth];
        widthContainerViewConstraint = self->_widthContainerViewConstraint;
        -[NSLayoutConstraint setConstant:](widthContainerViewConstraint, "setConstant:");
      }
    }
  }
  else
  {
    [(ContainerStyleManager *)self setContainerStyle:v3];
  }
}

- (unint64_t)layoutStyleForCurrentTraitsCollection
{
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v5 = [WeakRetained traitCollection];

  id v6 = objc_loadWeakRetained((id *)p_containerViewController);
  LOBYTE(WeakRetained) = [v6 fullscreenMode];

  if ((WeakRetained & 1) == 0)
  {
    BOOL allowOnlyStandardStyle = self->_allowOnlyStandardStyle;
    id v9 = v5;
    uint64_t v10 = v9;
    if (v9)
    {
      if ([v9 userInterfaceIdiom] == (id)5)
      {
        unint64_t v7 = 6;
LABEL_25:

        goto LABEL_26;
      }
      id v11 = [v10 horizontalSizeClass];
      if (allowOnlyStandardStyle)
      {
        if (v11 == (id)2
          || [v10 horizontalSizeClass] == (id)1 && objc_msgSend(v10, "verticalSizeClass") == (id)1)
        {
          unint64_t v7 = 2;
        }
        else if ([v10 userInterfaceIdiom] == (id)5)
        {
          unint64_t v7 = 2;
        }
        else
        {
          unint64_t v7 = 1;
        }
        goto LABEL_25;
      }
      if (v11 == (id)1 && [v10 verticalSizeClass] == (id)2)
      {
        unint64_t v7 = 1;
        goto LABEL_25;
      }
      if ([v10 horizontalSizeClass] == (id)1 && objc_msgSend(v10, "verticalSizeClass") == (id)1
        || [v10 horizontalSizeClass] == (id)2 && objc_msgSend(v10, "verticalSizeClass") == (id)1
        || [v10 horizontalSizeClass] == (id)2 && objc_msgSend(v10, "verticalSizeClass") == (id)2)
      {
        unint64_t v7 = 4;
        goto LABEL_25;
      }
    }
    unint64_t v7 = 0;
    goto LABEL_25;
  }
  unint64_t v7 = 7;
LABEL_26:

  return v7;
}

- (BOOL)allowOnlyStandardStyle
{
  return self->_allowOnlyStandardStyle;
}

- (void)setContainerStyle:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v6 = [WeakRetained viewIfLoaded];

  if (v6 && self->_containerStyle != a3)
  {
    unint64_t v7 = sub_1000BD86C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v10 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "ContainerStyleManager configureStyleLayout %lu ", buf, 0xCu);
    }

    self->_unint64_t containerStyle = a3;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000BD4E4;
    v8[3] = &unk_1012E69C0;
    v8[4] = self;
    v8[5] = a3;
    +[UIView performWithoutAnimation:v8];
  }
}

- (unint64_t)containerStyle
{
  return self->_containerStyle;
}

- (BOOL)stackOnOppositeSide
{
  return self->_stackOnOppositeSide;
}

- (void)configureStyleLayout
{
  [(ContainerStyleManager *)self createConstraints];
  if (self->_widthContainerViewConstraint)
  {
    unint64_t v3 = [(ContainerStyleManager *)self containerViewController];
    id v4 = [v3 containerView];
    long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v78[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v78[1] = v5;
    v78[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v4 setTransform:v78];

    id v6 = +[NSMutableArray array];
    unint64_t v7 = +[NSMutableArray array];
    [(NSLayoutConstraint *)self->_widthContainerViewConstraint setActive:0];
    switch(self->_containerStyle)
    {
      case 1uLL:
      case 5uLL:
        if ((id)[(NSLayoutConstraint *)self->_topContainerViewConstraint relation] != (id)1)
        {
          [(NSLayoutConstraint *)self->_topContainerViewConstraint setActive:0];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
          v26 = [WeakRetained containerView];
          v27 = [v26 topAnchor];
          id v28 = objc_loadWeakRetained((id *)&self->_containerViewController);
          v29 = [v28 view];
          v30 = [v29 topAnchor];
          v31 = [v27 constraintGreaterThanOrEqualToAnchor:v30];
          topContainerViewConstraint = self->_topContainerViewConstraint;
          self->_topContainerViewConstraint = v31;
        }
        if ([(NSLayoutConstraint *)self->_bottomContainerViewConstraint relation])
        {
          [(NSLayoutConstraint *)self->_bottomContainerViewConstraint setActive:0];
          id v33 = objc_loadWeakRetained((id *)&self->_containerViewController);
          v34 = [v33 containerView];
          v35 = [v34 bottomAnchor];
          id v36 = objc_loadWeakRetained((id *)&self->_containerViewController);
          v37 = [v36 view];
          v38 = [v37 bottomAnchor];
          v39 = [v35 constraintEqualToAnchor:v38];
          bottomContainerViewConstraint = self->_bottomContainerViewConstraint;
          self->_bottomContainerViewConstraint = v39;
        }
        [(NSLayoutConstraint *)self->_topContainerViewConstraint setConstant:0.0];
        [(NSLayoutConstraint *)self->_bottomContainerViewConstraint setConstant:0.0];
        [(NSLayoutConstraint *)self->_leadingContainerViewConstraint setConstant:0.0];
        [(NSLayoutConstraint *)self->_trailingContainerViewConstraint setConstant:0.0];
        [v6 addObject:self->_leadingContainerViewConstraint];
        [v6 addObject:self->_trailingContainerViewConstraint];
        [v6 addObject:self->_bottomContainerViewConstraint];
        [v6 addObject:self->_topContainerViewConstraint];
        widthContainerViewConstraint = self->_widthContainerViewConstraint;
        v41 = v7;
        goto LABEL_21;
      case 2uLL:
      case 3uLL:
      case 4uLL:
        if ((id)[(NSLayoutConstraint *)self->_topContainerViewConstraint relation] != (id)1)
        {
          [(NSLayoutConstraint *)self->_topContainerViewConstraint setActive:0];
          id v8 = objc_loadWeakRetained((id *)&self->_containerViewController);
          id v9 = [v8 containerView];
          unint64_t v10 = [v9 topAnchor];
          id v11 = objc_loadWeakRetained((id *)&self->_containerViewController);
          v12 = [v11 view];
          v13 = [v12 topAnchor];
          v14 = [v10 constraintGreaterThanOrEqualToAnchor:v13];
          v15 = self->_topContainerViewConstraint;
          self->_topContainerViewConstraint = v14;
        }
        if ([(NSLayoutConstraint *)self->_bottomContainerViewConstraint relation])
        {
          [(NSLayoutConstraint *)self->_bottomContainerViewConstraint setActive:0];
          id v16 = objc_loadWeakRetained((id *)&self->_containerViewController);
          v17 = [v16 containerView];
          v18 = [v17 bottomAnchor];
          id v19 = objc_loadWeakRetained((id *)&self->_containerViewController);
          v20 = [v19 view];
          v21 = [v20 bottomAnchor];
          v22 = [v18 constraintEqualToAnchor:v21];
          v23 = self->_bottomContainerViewConstraint;
          self->_bottomContainerViewConstraint = v22;
        }
        [(NSLayoutConstraint *)self->_topContainerViewConstraint setConstant:0.0];
        [(NSLayoutConstraint *)self->_bottomContainerViewConstraint setConstant:0.0];
        [(ContainerStyleManager *)self leadingMargin];
        -[NSLayoutConstraint setConstant:](self->_leadingContainerViewConstraint, "setConstant:");
        [(ContainerStyleManager *)self containerWidth];
        -[NSLayoutConstraint setConstant:](self->_widthContainerViewConstraint, "setConstant:");
        [v6 addObject:self->_leadingContainerViewConstraint];
        [v7 addObject:self->_trailingContainerViewConstraint];
        [v6 addObject:self->_bottomContainerViewConstraint];
        [v6 addObject:self->_topContainerViewConstraint];
        widthContainerViewConstraint = self->_widthContainerViewConstraint;
        goto LABEL_20;
      case 6uLL:
        [(NSLayoutConstraint *)self->_topContainerViewConstraint setActive:0];
        id v42 = objc_loadWeakRetained((id *)&self->_containerViewController);
        v43 = [v42 containerView];
        v44 = [v43 topAnchor];
        id v45 = objc_loadWeakRetained((id *)&self->_containerViewController);
        v46 = [v45 view];
        v47 = [v46 topAnchor];
        v48 = [v44 constraintEqualToAnchor:v47];
        v49 = self->_topContainerViewConstraint;
        self->_topContainerViewConstraint = v48;

        if ([(NSLayoutConstraint *)self->_bottomContainerViewConstraint relation] != NSLayoutRelationLessThanOrEqual)
        {
          [(NSLayoutConstraint *)self->_bottomContainerViewConstraint setActive:0];
          id v50 = objc_loadWeakRetained((id *)&self->_containerViewController);
          v51 = [v50 containerView];
          v52 = [v51 bottomAnchor];
          id v53 = objc_loadWeakRetained((id *)&self->_containerViewController);
          v54 = [v53 view];
          v55 = [v54 bottomAnchor];
          v56 = [v52 constraintLessThanOrEqualToAnchor:v55];
          v57 = self->_bottomContainerViewConstraint;
          self->_bottomContainerViewConstraint = v56;
        }
        BOOL stackOnOppositeSide = self->_stackOnOppositeSide;
        [(NSLayoutConstraint *)self->_bottomContainerViewConstraint setConstant:0.0];
        id v59 = objc_loadWeakRetained((id *)&self->_containerViewController);
        [v59 topEdgePadding];
        -[NSLayoutConstraint setConstant:](self->_topContainerViewConstraint, "setConstant:");

        [(ContainerStyleManager *)self leadingMargin];
        if (stackOnOppositeSide)
        {
          [(NSLayoutConstraint *)self->_trailingContainerViewConstraint setConstant:-v60];
          [(ContainerStyleManager *)self containerWidth];
          -[NSLayoutConstraint setConstant:](self->_widthContainerViewConstraint, "setConstant:");
          [v7 addObject:self->_leadingContainerViewConstraint];
          trailingContainerViewConstraint = self->_trailingContainerViewConstraint;
        }
        else
        {
          -[NSLayoutConstraint setConstant:](self->_leadingContainerViewConstraint, "setConstant:");
          [(ContainerStyleManager *)self containerWidth];
          -[NSLayoutConstraint setConstant:](self->_widthContainerViewConstraint, "setConstant:");
          [v7 addObject:self->_trailingContainerViewConstraint];
          trailingContainerViewConstraint = self->_leadingContainerViewConstraint;
        }
        [v6 addObject:trailingContainerViewConstraint];
        [v6 addObject:self->_bottomContainerViewConstraint];
        [v6 addObject:self->_topContainerViewConstraint];
        [v6 addObject:self->_widthContainerViewConstraint];
        [(ContainerStyleManager *)self setBottomConstraint];
        break;
      case 7uLL:
        [(NSLayoutConstraint *)self->_topContainerViewConstraint setActive:0];
        id v62 = objc_loadWeakRetained((id *)&self->_containerViewController);
        v63 = [v62 containerView];
        v64 = [v63 topAnchor];
        id v65 = objc_loadWeakRetained((id *)&self->_containerViewController);
        v66 = [v65 view];
        v67 = [v66 topAnchor];
        v68 = [v64 constraintEqualToAnchor:v67];
        v69 = self->_topContainerViewConstraint;
        self->_topContainerViewConstraint = v68;

        if ([(NSLayoutConstraint *)self->_bottomContainerViewConstraint relation])
        {
          [(NSLayoutConstraint *)self->_bottomContainerViewConstraint setActive:0];
          id v70 = objc_loadWeakRetained((id *)&self->_containerViewController);
          v71 = [v70 containerView];
          v72 = [v71 bottomAnchor];
          id v73 = objc_loadWeakRetained((id *)&self->_containerViewController);
          v74 = [v73 view];
          v75 = [v74 bottomAnchor];
          v76 = [v72 constraintEqualToAnchor:v75];
          v77 = self->_bottomContainerViewConstraint;
          self->_bottomContainerViewConstraint = v76;
        }
        [(NSLayoutConstraint *)self->_topContainerViewConstraint setConstant:0.0];
        [(NSLayoutConstraint *)self->_bottomContainerViewConstraint setConstant:0.0];
        [(NSLayoutConstraint *)self->_leadingContainerViewConstraint setConstant:0.0];
        [(NSLayoutConstraint *)self->_trailingContainerViewConstraint setConstant:0.0];
        [v7 addObject:self->_widthContainerViewConstraint];
        [v6 addObject:self->_trailingContainerViewConstraint];
        [v6 addObject:self->_leadingContainerViewConstraint];
        [v6 addObject:self->_bottomContainerViewConstraint];
        widthContainerViewConstraint = self->_topContainerViewConstraint;
LABEL_20:
        v41 = v6;
LABEL_21:
        [v41 addObject:widthContainerViewConstraint];
        break;
      default:
        break;
    }
    +[NSLayoutConstraint deactivateConstraints:v7];
    +[NSLayoutConstraint activateConstraints:v6];
  }
}

- (void)createConstraints
{
  if (!self->_widthContainerViewConstraint)
  {
    p_containerViewController = &self->_containerViewController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    long long v5 = [WeakRetained containerView];
    id v6 = [v5 widthAnchor];
    unint64_t v7 = [v6 constraintEqualToConstant:0.0];
    widthContainerViewConstraint = self->_widthContainerViewConstraint;
    self->_widthContainerViewConstraint = v7;

    id v9 = objc_loadWeakRetained((id *)p_containerViewController);
    unint64_t v10 = [v9 containerView];
    id v11 = [v10 topAnchor];
    id v12 = objc_loadWeakRetained((id *)p_containerViewController);
    v13 = [v12 view];
    v14 = [v13 safeAreaLayoutGuide];
    v15 = [v14 topAnchor];
    id v16 = [v11 constraintEqualToAnchor:v15];
    topContainerViewConstraint = self->_topContainerViewConstraint;
    self->_topContainerViewConstraint = v16;

    id v18 = objc_loadWeakRetained((id *)p_containerViewController);
    id v19 = [v18 containerView];
    v20 = [v19 bottomAnchor];
    id v21 = objc_loadWeakRetained((id *)p_containerViewController);
    v22 = [v21 view];
    v23 = [v22 bottomAnchor];
    v24 = [v20 constraintEqualToAnchor:v23];
    bottomContainerViewConstraint = self->_bottomContainerViewConstraint;
    self->_bottomContainerViewConstraint = v24;

    id v26 = objc_loadWeakRetained((id *)p_containerViewController);
    v27 = [v26 containerView];
    id v28 = [v27 leadingAnchor];
    id v29 = objc_loadWeakRetained((id *)p_containerViewController);
    v30 = [v29 view];
    v31 = [v30 leadingAnchor];
    v32 = [v28 constraintEqualToAnchor:v31];
    leadingContainerViewConstraint = self->_leadingContainerViewConstraint;
    self->_leadingContainerViewConstraint = v32;

    id v41 = objc_loadWeakRetained((id *)p_containerViewController);
    v34 = [v41 containerView];
    v35 = [v34 trailingAnchor];
    id v36 = objc_loadWeakRetained((id *)p_containerViewController);
    v37 = [v36 view];
    v38 = [v37 trailingAnchor];
    v39 = [v35 constraintEqualToAnchor:v38];
    trailingContainerViewConstraint = self->_trailingContainerViewConstraint;
    self->_trailingContainerViewConstraint = v39;
  }
}

- (ContainerViewController)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  return (ContainerViewController *)WeakRetained;
}

- (void)setStackOnOppositeSide:(BOOL)a3
{
  self->_BOOL stackOnOppositeSide = a3;
}

- (void)setAllowOnlyStandardStyle:(BOOL)a3
{
  self->_BOOL allowOnlyStandardStyle = a3;
}

- (double)leadingMargin
{
  unint64_t v3 = [(ContainerStyleManager *)self containerViewController];
  unsigned int v4 = [v3 hasMargin];

  long long v5 = [(ContainerStyleManager *)self containerViewController];
  id v6 = v5;
  if (v4)
  {
    unint64_t v7 = [v5 view];
    id v8 = [v7 effectiveUserInterfaceLayoutDirection];

    id v9 = [(ContainerStyleManager *)self containerViewController];
    unint64_t v10 = [v9 view];
    id v11 = [v10 window];
    char v12 = (v8 == (id)1) ^ ([v11 interfaceOrientation] == (id)3);

    if (v12)
    {
      v13 = [(ContainerStyleManager *)self containerViewController];
      v14 = [v13 view];
      [v14 safeAreaInsets];
      double left = v15;
      CGFloat right = v17;
    }
    else
    {
      double left = UIEdgeInsetsZero.left;
      CGFloat right = UIEdgeInsetsZero.right;
    }
    id v6 = [(ContainerStyleManager *)self containerViewController];
    [v6 leadingEdgePadding];
    double v21 = v20;
    v22 = [(ContainerStyleManager *)self containerViewController];
    v23 = v22;
    if (v8 == (id)1)
    {
      [v22 rightSafeOffset];
      double left = right;
    }
    else
    {
      [v22 leftSafeOffset];
    }
    if (v21 + v24 > left)
    {
      v25 = [(ContainerStyleManager *)self containerViewController];
      [v25 leadingEdgePadding];
      double v27 = v26;
      id v28 = [(ContainerStyleManager *)self containerViewController];
      id v29 = v28;
      if (v8 == (id)1) {
        [v28 rightSafeOffset];
      }
      else {
        [v28 leftSafeOffset];
      }
      double v31 = v30;

      double left = v27 + v31;
    }
  }
  else
  {
    [v5 leadingEdgePadding];
    double left = v19;
  }

  return left;
}

- (void)setBottomConstraint
{
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained statusBarHeight];
  double v6 = v5;

  id v7 = objc_loadWeakRetained((id *)p_containerViewController);
  id v8 = [v7 view];
  [v8 bounds];
  double Height = CGRectGetHeight(v14);

  double v10 = Height - v6;
  if (Height - v6 < 728.0) {
    double v10 = 728.0;
  }
  double v11 = v10 - Height;
  bottomContainerViewConstraint = self->_bottomContainerViewConstraint;

  [(NSLayoutConstraint *)bottomContainerViewConstraint setConstant:v11];
}

- (double)containerWidth
{
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  double v5 = [WeakRetained traitCollection];
  id v6 = [v5 userInterfaceIdiom];

  if (v6 == (id)5) {
    return 282.0;
  }
  unint64_t containerStyle = self->_containerStyle;
  double v7 = 0.0;
  if (containerStyle > 7) {
    return v7;
  }
  if (((1 << containerStyle) & 0x5C) == 0)
  {
    if (((1 << containerStyle) & 0xA2) != 0)
    {
      id v11 = objc_loadWeakRetained((id *)p_containerViewController);
      char v12 = [v11 view];
      [v12 bounds];
      double v7 = v13;
    }
    return v7;
  }
  id v9 = objc_loadWeakRetained((id *)p_containerViewController);
  double v10 = [v9 view];
  [v10 bounds];

  GEOConfigGetDouble();
  return result;
}

- (void)setContainerViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_bottomContainerViewConstraint, 0);
  objc_storeStrong((id *)&self->_topContainerViewConstraint, 0);
  objc_storeStrong((id *)&self->_trailingContainerViewConstraint, 0);
  objc_storeStrong((id *)&self->_leadingContainerViewConstraint, 0);

  objc_storeStrong((id *)&self->_widthContainerViewConstraint, 0);
}

@end