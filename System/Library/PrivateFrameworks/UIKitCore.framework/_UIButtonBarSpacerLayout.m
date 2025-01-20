@interface _UIButtonBarSpacerLayout
+ (id)_updateSpacer:(id)a3 layoutMetrics:(id)a4 spacerType:(int64_t)a5;
+ (id)spacerForLayoutMetrics:(id)a3 betweenLayout:(id)a4 andLayout:(id)a5;
+ (int64_t)typeOfSpacerBetweenLayout:(id)a3 andLayout:(id)a4;
- (BOOL)isSpaceLayout;
- (BOOL)suppressSpacing;
- (_UIButtonBarSpacerLayout)initWithLayoutMetrics:(id)a3;
- (_UIButtonBarSpacerLayout)initWithLayoutMetrics:(id)a3 barButtonItem:(id)a4;
- (double)minimumLayoutWidthGivenMinimumSpaceWidth:(double)a3;
- (id)barButtonItem;
- (id)description;
- (int64_t)spacerType;
- (void)_addConstraintsToActivate:(id)a3 toDeactivate:(id)a4;
- (void)_addLayoutViews:(id)a3;
- (void)_configure;
@end

@implementation _UIButtonBarSpacerLayout

+ (int64_t)typeOfSpacerBetweenLayout:(id)a3 andLayout:(id)a4
{
  return _UIButtonBarLayoutSpacerTypeForLayouts(a3, a4);
}

- (double)minimumLayoutWidthGivenMinimumSpaceWidth:(double)a3
{
  item = self->_item;
  if (item) {
    [(UIBarButtonItem *)item _width];
  }
  else {
    double result = 0.0;
  }
  if (result < a3) {
    return a3;
  }
  return result;
}

- (id)barButtonItem
{
  return self->_item;
}

- (void)_addLayoutViews:(id)a3
{
}

- (void)_addConstraintsToActivate:(id)a3 toDeactivate:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  item = self->_item;
  if (self->_flexible)
  {
    BOOL v8 = [(UIBarButtonItem *)item _wantsThreeUp];
    v9 = v14;
    if (v8) {
      goto LABEL_11;
    }
    equalSize = self->_equalSize;
    v11 = v14;
  }
  else
  {
    [(UIBarButtonItem *)item _width];
    if (v12 >= 0.0) {
      double v13 = v12;
    }
    else {
      double v13 = 0.0;
    }
    [(NSLayoutConstraint *)self->_requestedSize setConstant:v13];
    equalSize = self->_requestedSize;
    if (v13 <= 0.0) {
      v11 = v6;
    }
    else {
      v11 = v14;
    }
  }
  [v11 addObject:equalSize];
  v9 = v14;
LABEL_11:
  [v9 addObject:self->_minimumSize];
}

- (BOOL)isSpaceLayout
{
  return 1;
}

+ (id)spacerForLayoutMetrics:(id)a3 betweenLayout:(id)a4 andLayout:(id)a5
{
  id v8 = a3;
  if (_UIButtonBarLayoutSpacerTypeForLayouts(a4, a5))
  {
    v9 = (void *)[objc_alloc((Class)a1) initWithLayoutMetrics:v8 barButtonItem:0];
    v9[9] = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (_UIButtonBarSpacerLayout)initWithLayoutMetrics:(id)a3 barButtonItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v8 && ([v8 isSpaceItem] & 1) == 0)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_UIButtonBarLayout.m", 260, @"Spacer layouts can only manage nil bar button items, or a system item that is a spacer type" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)_UIButtonBarSpacerLayout;
  v10 = [(_UIButtonBarLayout *)&v14 initWithLayoutMetrics:v7];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_item, a4);
    v11->_flexible = [v9 systemItem] == 5;
    v11->_spacerType = 1;
  }

  return v11;
}

- (BOOL)suppressSpacing
{
  return 1;
}

- (void)_configure
{
  spacer = self->_spacer;
  if (!spacer)
  {
    v4 = objc_alloc_init(UIView);
    [(UIView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = self->_spacer;
    self->_spacer = v4;

    spacer = self->_spacer;
  }
  id v23 = [(UIView *)spacer widthAnchor];
  if (self->_flexible)
  {
    p_equalSize = (id *)&self->_equalSize;
    if (self->_equalSize)
    {
      BOOL v7 = 0;
      goto LABEL_15;
    }
    id v14 = [(_UIButtonBarLayoutMetricsData *)self->super._layoutMetrics flexibleSpaceGuide];
    uint64_t v16 = [v23 constraintEqualToAnchor:v14];
    id v17 = *p_equalSize;
    id *p_equalSize = (id)v16;

    BOOL v7 = 0;
    int v15 = 1143111680;
  }
  else
  {
    [(UIBarButtonItem *)self->_item _width];
    if (v8 >= 0.0) {
      double v9 = v8;
    }
    else {
      double v9 = 0.0;
    }
    BOOL v7 = v9 <= 0.0;
    p_equalSize = (id *)&self->_requestedSize;
    requestedSize = self->_requestedSize;
    if (requestedSize)
    {
      [(NSLayoutConstraint *)requestedSize constant];
      if (v11 != v9)
      {
        [(NSLayoutConstraint *)self->_minimumSize setActive:0];
        minimumSize = self->_minimumSize;
        self->_minimumSize = 0;
      }
    }
    [*p_equalSize setActive:0];
    uint64_t v13 = [v23 constraintEqualToConstant:v9];
    id v14 = *p_equalSize;
    id *p_equalSize = (id)v13;
    int v15 = 1143930880;
  }

  LODWORD(v18) = v15;
  [*p_equalSize setPriority:v18];
LABEL_15:
  if (!self->_minimumSize)
  {
    v19 = [(_UIButtonBarLayoutMetricsData *)self->super._layoutMetrics minimumSpaceGuide];
    if (v7) {
      [v23 constraintEqualToAnchor:v19 multiplier:1.0];
    }
    else {
    v20 = [v23 constraintGreaterThanOrEqualToAnchor:v19 multiplier:1.0];
    }
    v21 = self->_minimumSize;
    self->_minimumSize = v20;

    LODWORD(v22) = 1144750080;
    [(NSLayoutConstraint *)self->_minimumSize setPriority:v22];
  }
  [(NSLayoutConstraint *)self->_requestedSize setIdentifier:@"UIButtonBar.requestedSize"];
  [(NSLayoutConstraint *)self->_equalSize setIdentifier:@"UIButtonBar.equalSize"];
  [(NSLayoutConstraint *)self->_minimumSize setIdentifier:@"UIButtonBar.minimumSize"];
}

+ (id)_updateSpacer:(id)a3 layoutMetrics:(id)a4 spacerType:(int64_t)a5
{
  double v8 = a3;
  double v9 = v8;
  if (!v8)
  {
    id v10 = a4;
    double v9 = (void *)[objc_alloc((Class)a1) initWithLayoutMetrics:v10];
  }
  v9[9] = a5;

  return v9;
}

- (_UIButtonBarSpacerLayout)initWithLayoutMetrics:(id)a3
{
  return [(_UIButtonBarSpacerLayout *)self initWithLayoutMetrics:a3 barButtonItem:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_equalSize, 0);
  objc_storeStrong((id *)&self->_minimumSize, 0);
  objc_storeStrong((id *)&self->_requestedSize, 0);
  objc_storeStrong((id *)&self->_spacer, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_UIButtonBarSpacerLayout;
  v3 = [(_UIButtonBarLayout *)&v7 description];
  v4 = (void *)[v3 mutableCopy];

  if (self->_flexible) {
    v5 = @" flexibleSpace";
  }
  else {
    v5 = @" space";
  }
  [v4 appendString:v5];
  if (self->_item) {
    objc_msgSend(v4, "appendFormat:", @" item=%p", self->_item);
  }
  objc_msgSend(v4, "appendFormat:", @" view=%p requestedSize=%p equalSize=%p minimumSize=%p", self->_spacer, self->_requestedSize, self->_equalSize, self->_minimumSize);
  return v4;
}

- (int64_t)spacerType
{
  return self->_spacerType;
}

@end