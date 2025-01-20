@interface SBDodgingTesterView
- (BOOL)stashed;
- (CGPoint)initialMoveCenter;
- (CGPoint)preferredCenter;
- (CGSize)preferredSize;
- (NSArray)otherIdentifiers;
- (NSMutableSet)ignoringItems;
- (NSString)name;
- (SBDodgingItem)item;
- (SBDodgingResolverViewController)controller;
- (SBDodgingTesterView)initWithName:(id)a3 color:(id)a4 controller:(id)a5;
- (UIColor)color;
- (UILabel)resolvedValuesLabel;
- (UILabel)titleLabel;
- (UIPanGestureRecognizer)moveGesture;
- (UIPanGestureRecognizer)resizeGesture;
- (UITableView)otherItemsTable;
- (UIView)resizeView;
- (id)dodgingResolver:(id)a3 preferenceForDodgingItem:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)corner;
- (void)_handleChangeAnchorGesture:(id)a3;
- (void)_handleDeleteGesture:(id)a3;
- (void)_handleMoveGesture:(id)a3;
- (void)_handleResizeGesture:(id)a3;
- (void)_updateResolvedValuesLabel;
- (void)dodgingResolver:(id)a3 dodgingItemDidChange:(id)a4;
- (void)dodgingResolver:(id)a3 dodgingItemDidSettle:(id)a4;
- (void)layoutSubviews;
- (void)setColor:(id)a3;
- (void)setController:(id)a3;
- (void)setCorner:(unint64_t)a3;
- (void)setIgnoringItems:(id)a3;
- (void)setInitialMoveCenter:(CGPoint)a3;
- (void)setItem:(id)a3;
- (void)setMoveGesture:(id)a3;
- (void)setName:(id)a3;
- (void)setOtherIdentifiers:(id)a3;
- (void)setOtherItemsTable:(id)a3;
- (void)setPreferredCenter:(CGPoint)a3;
- (void)setPreferredSize:(CGSize)a3;
- (void)setResizeGesture:(id)a3;
- (void)setResizeView:(id)a3;
- (void)setResolvedValuesLabel:(id)a3;
- (void)setStashed:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SBDodgingTesterView

- (SBDodgingTesterView)initWithName:(id)a3 color:(id)a4 controller:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v42.receiver = self;
  v42.super_class = (Class)SBDodgingTesterView;
  double v11 = *MEMORY[0x1E4F1DB28];
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v15 = -[SBDodgingTesterView initWithFrame:](&v42, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v12, v13, v14);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_controller, v10);
    uint64_t v17 = [v8 copy];
    name = v16->_name;
    v16->_name = (NSString *)v17;

    objc_storeStrong((id *)&v16->_color, a4);
    uint64_t v19 = objc_opt_new();
    ignoringItems = v16->_ignoringItems;
    v16->_ignoringItems = (NSMutableSet *)v19;

    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v11, v12, v13, v14);
    titleLabel = v16->_titleLabel;
    v16->_titleLabel = (UILabel *)v21;

    v23 = v16->_titleLabel;
    v24 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:22.0];
    [(UILabel *)v23 setFont:v24];

    [(UILabel *)v16->_titleLabel setTextAlignment:1];
    [(UILabel *)v16->_titleLabel setAdjustsFontSizeToFitWidth:1];
    [(SBDodgingTesterView *)v16 addSubview:v16->_titleLabel];
    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v11, v12, v13, v14);
    resolvedValuesLabel = v16->_resolvedValuesLabel;
    v16->_resolvedValuesLabel = (UILabel *)v25;

    v27 = v16->_resolvedValuesLabel;
    v28 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:15.0];
    [(UILabel *)v27 setFont:v28];

    [(UILabel *)v16->_resolvedValuesLabel setNumberOfLines:0];
    [(UILabel *)v16->_resolvedValuesLabel setAdjustsFontSizeToFitWidth:1];
    [(SBDodgingTesterView *)v16 addSubview:v16->_resolvedValuesLabel];
    uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v11, v12, v13, v14);
    resizeView = v16->_resizeView;
    v16->_resizeView = (UIView *)v29;

    [(SBDodgingTesterView *)v16 addSubview:v16->_resizeView];
    uint64_t v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42E98]), "initWithFrame:style:", 0, v11, v12, v13, v14);
    otherItemsTable = v16->_otherItemsTable;
    v16->_otherItemsTable = (UITableView *)v31;

    [(UITableView *)v16->_otherItemsTable setDelegate:v16];
    [(UITableView *)v16->_otherItemsTable setDataSource:v16];
    [(SBDodgingTesterView *)v16 addSubview:v16->_otherItemsTable];
    [(SBDodgingTesterView *)v16 _setCornerRadius:7.0];
    [(SBDodgingTesterView *)v16 setClipsToBounds:1];
    uint64_t v33 = [objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:v16 action:sel__handleMoveGesture_];
    moveGesture = v16->_moveGesture;
    v16->_moveGesture = (UIPanGestureRecognizer *)v33;

    [(SBDodgingTesterView *)v16 addGestureRecognizer:v16->_moveGesture];
    uint64_t v35 = [objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:v16 action:sel__handleResizeGesture_];
    resizeGesture = v16->_resizeGesture;
    v16->_resizeGesture = (UIPanGestureRecognizer *)v35;

    [(UIView *)v16->_resizeView addGestureRecognizer:v16->_resizeGesture];
    v37 = (void *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:v16 action:sel__handleDeleteGesture_];
    [(SBDodgingTesterView *)v16 addGestureRecognizer:v37];
    v38 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v16 action:sel__handleChangeAnchorGesture_];
    [v38 setNumberOfTapsRequired:2];
    [(SBDodgingTesterView *)v16 addGestureRecognizer:v38];
    v16->_preferredSize = (CGSize)xmmword_1D8FD1E50;
    v16->_preferredCenter = (CGPoint)*MEMORY[0x1E4F1DAD8];
    uint64_t v39 = objc_msgSend(v10, "addItemWithIdentifier:view:initialCenter:initialSize:delegate:", v8, v16, v16, 10.0, -250.0, v16->_preferredSize.width, v16->_preferredSize.height);
    item = v16->_item;
    v16->_item = (SBDodgingItem *)v39;
  }
  return v16;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_otherIdentifiers count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"ident"];
  if (!v7) {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F42EA0]) initWithStyle:1 reuseIdentifier:@"ident"];
  }
  id v8 = -[NSArray objectAtIndex:](self->_otherIdentifiers, "objectAtIndex:", [v6 row]);
  id v9 = [v7 textLabel];
  id v10 = [NSString stringWithFormat:@"%@", v8];
  [v9 setText:v10];

  if ([(NSMutableSet *)self->_ignoringItems containsObject:v8]) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 0;
  }
  [v7 setAccessoryType:v11];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 deselectRowAtIndexPath:v6 animated:1];
  otherIdentifiers = self->_otherIdentifiers;
  uint64_t v9 = [v6 row];

  id v13 = [(NSArray *)otherIdentifiers objectAtIndex:v9];
  int v10 = -[NSMutableSet containsObject:](self->_ignoringItems, "containsObject:");
  ignoringItems = self->_ignoringItems;
  if (v10) {
    [(NSMutableSet *)ignoringItems removeObject:v13];
  }
  else {
    [(NSMutableSet *)ignoringItems addObject:v13];
  }
  double v12 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  [v7 reloadSections:v12 withRowAnimation:100];

  [(SBDodgingItem *)self->_item setNeedsUpdateAnimated:1];
}

- (void)layoutSubviews
{
  [(SBDodgingTesterView *)self _updateResolvedValuesLabel];
  [(SBDodgingTesterView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v3, v5);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 0.0, 10.0, v4, v7);
  resolvedValuesLabel = self->_resolvedValuesLabel;
  [(UILabel *)self->_titleLabel bounds];
  double v10 = v6 - v9;
  [(UILabel *)self->_titleLabel bounds];
  -[UILabel sizeThatFits:](resolvedValuesLabel, "sizeThatFits:", v4 + -10.0, v10 - v11 + -15.0);
  double v13 = v12;
  double v14 = self->_resolvedValuesLabel;
  [(UILabel *)self->_titleLabel bounds];
  double v16 = v15;
  [(UILabel *)self->_titleLabel bounds];
  -[UILabel setFrame:](v14, "setFrame:", 5.0, v16 + v17 + 15.0, v4 + -10.0, v13);
  switch(self->_corner)
  {
    case 0uLL:
      -[UIView setFrame:](self->_resizeView, "setFrame:", v4 + -30.0, v6 + -30.0, 30.0, 30.0);
      v18 = [MEMORY[0x1E4F39C88] layer];
      uint64_t v19 = (void *)MEMORY[0x1E4F427D0];
      double v20 = 24.0;
      goto LABEL_5;
    case 1uLL:
      -[UIView setFrame:](self->_resizeView, "setFrame:", 0.0, v6 + -30.0, 30.0, 30.0);
      v18 = [MEMORY[0x1E4F39C88] layer];
      uint64_t v21 = (void *)MEMORY[0x1E4F427D0];
      double v22 = 24.0;
      goto LABEL_7;
    case 2uLL:
      -[UIView setFrame:](self->_resizeView, "setFrame:", v4 + -30.0, 0.0, 30.0, 30.0);
      v18 = [MEMORY[0x1E4F39C88] layer];
      uint64_t v19 = (void *)MEMORY[0x1E4F427D0];
      double v20 = 0.0;
LABEL_5:
      v23 = objc_msgSend(v19, "bezierPathWithRect:", 0.0, v20, 30.0, 6.0);
      v24 = (void *)MEMORY[0x1E4F427D0];
      double v25 = 24.0;
      goto LABEL_8;
    case 3uLL:
      -[UIView setFrame:](self->_resizeView, "setFrame:", 0.0, 0.0, 30.0, 30.0);
      v18 = [MEMORY[0x1E4F39C88] layer];
      uint64_t v21 = (void *)MEMORY[0x1E4F427D0];
      double v22 = 0.0;
LABEL_7:
      v23 = objc_msgSend(v21, "bezierPathWithRect:", 0.0, v22, 30.0, 6.0);
      v24 = (void *)MEMORY[0x1E4F427D0];
      double v25 = 0.0;
LABEL_8:
      v26 = objc_msgSend(v24, "bezierPathWithRect:", v25, 0.0, 6.0, 30.0);
      [v23 appendPath:v26];

      id v27 = v23;
      objc_msgSend(v18, "setPath:", objc_msgSend(v27, "CGPath"));
      v28 = [(UIView *)self->_resizeView layer];
      [v28 setMask:v18];

      break;
    default:
      break;
  }
  -[UITableView sizeThatFits:](self->_otherItemsTable, "sizeThatFits:", v4, v6);
  double v30 = v29;
  otherItemsTable = self->_otherItemsTable;
  [(UILabel *)self->_resolvedValuesLabel frame];
  double v33 = v32;
  [(UILabel *)self->_resolvedValuesLabel frame];
  -[UITableView setFrame:](otherItemsTable, "setFrame:", 0.0, v33 + v34 + 5.0, v4, v30);
  titleLabel = self->_titleLabel;
  v36 = (void *)MEMORY[0x1E4F428B8];
  v58 = self->_color;
  v37 = [v36 blackColor];
  v38 = [v37 colorWithAlphaComponent:0.15];
  uint64_t v39 = [(UIColor *)v58 _colorBlendedWithColor:v38];
  [(UILabel *)titleLabel setTextColor:v39];

  v40 = self->_resolvedValuesLabel;
  v41 = [MEMORY[0x1E4F428B8] blackColor];
  objc_super v42 = [v41 colorWithAlphaComponent:0.65];
  v43 = [(UIColor *)v58 _colorBlendedWithColor:v42];
  [(UILabel *)v40 setTextColor:v43];

  resizeView = self->_resizeView;
  v45 = [MEMORY[0x1E4F428B8] blackColor];
  v46 = [v45 colorWithAlphaComponent:0.15];
  v47 = [(UIColor *)v58 _colorBlendedWithColor:v46];
  [(UIView *)resizeView setBackgroundColor:v47];

  v48 = [MEMORY[0x1E4F428B8] whiteColor];
  v49 = [v48 colorWithAlphaComponent:0.85];
  v50 = [(UIColor *)v58 _colorBlendedWithColor:v49];
  [(SBDodgingTesterView *)self setBackgroundColor:v50];

  [(UILabel *)self->_titleLabel setText:self->_name];
  v51 = [(SBDodgingTesterView *)self layer];
  v52 = v51;
  if (self->_stashed) {
    double v53 = 5.0;
  }
  else {
    double v53 = 0.0;
  }
  [v51 setBorderWidth:v53];

  v54 = [(SBDodgingTesterView *)self layer];
  v55 = [MEMORY[0x1E4F428B8] blackColor];
  v56 = [v55 colorWithAlphaComponent:0.25];
  id v57 = [(UIColor *)v58 _colorBlendedWithColor:v56];
  objc_msgSend(v54, "setBorderColor:", objc_msgSend(v57, "CGColor"));

  [(UIView *)self->_resizeView setHidden:self->_stashed];
}

- (void)_updateResolvedValuesLabel
{
  id v10 = (id)objc_opt_new();
  CGFloat x = self->_preferredCenter.x;
  CGFloat y = self->_preferredCenter.y;
  CGFloat width = self->_preferredSize.width;
  CGFloat height = self->_preferredSize.height;
  [(SBDodgingTesterView *)self bounds];
  uint64_t v8 = v7;
  [(SBDodgingTesterView *)self bounds];
  objc_msgSend(v10, "appendFormat:", @"preferredCenter: %0.1f,%0.1f\npreferredSize: %0.1f,%0.1f\nsize: %0.1f,%0.1f", *(void *)&x, *(void *)&y, *(void *)&width, *(void *)&height, v8, v9);
  [v10 appendFormat:@"\n\ndouble tap to stash; hold to remove"];
  [v10 appendFormat:@"\nignore these:"];
  [(UILabel *)self->_resolvedValuesLabel setText:v10];
}

- (void)_handleMoveGesture:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    [(SBDodgingItem *)self->_item center];
    self->_initialMoveCenter.CGFloat x = v5;
    self->_initialMoveCenter.CGFloat y = v6;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __42__SBDodgingTesterView__handleMoveGesture___block_invoke;
    v26[3] = &unk_1E6AF4AC0;
    v26[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:4 delay:v26 options:0 animations:0.25 completion:0.0];
  }
  uint64_t v7 = [v4 view];
  uint64_t v8 = [v7 superview];
  [v4 velocityInView:v8];
  double v10 = v9;
  double v12 = v11;

  double v13 = [v4 view];
  double v14 = [v13 superview];
  [v4 translationInView:v14];
  double v16 = v15;
  double v18 = v17;

  double v19 = v16 + self->_initialMoveCenter.x;
  double v20 = v18 + self->_initialMoveCenter.y;
  uint64_t v21 = [v4 state];
  double v22 = v19 + v10 * 0.1;
  double v23 = v20 + v12 * 0.1;
  if (v21 != 3)
  {
    double v22 = v19;
    double v23 = v20;
  }
  self->_preferredCenter.CGFloat x = v22;
  self->_preferredCenter.CGFloat y = v23;
  item = self->_item;
  uint64_t v25 = [v4 state];

  [(SBDodgingItem *)item setNeedsUpdateAnimated:v25 == 3];
}

uint64_t __42__SBDodgingTesterView__handleMoveGesture___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 496) setAlpha:0.0];
}

- (void)_handleResizeGesture:(id)a3
{
  id v4 = a3;
  [v4 locationInView:self];
  double v6 = v5;
  double v8 = v7;
  [(UIView *)self->_resizeView frame];
  UIRectGetCenter();
  double v10 = v9;
  double v12 = v11;
  [(SBDodgingTesterView *)self frame];
  double v15 = v6 - v10;
  double v16 = v8 - v12;
  switch(self->_corner)
  {
    case 0uLL:
      double v13 = v15 + v13;
      double v14 = v16 + v14;
      break;
    case 1uLL:
      double v13 = v13 - v15;
      double v14 = v16 + v14;
      break;
    case 2uLL:
      double v13 = v15 + v13;
      double v14 = v14 - v16;
      break;
    case 3uLL:
      double v13 = v13 - v15;
      double v14 = v14 - v16;
      break;
    default:
      break;
  }
  self->_preferredSize.CGFloat width = v13;
  self->_preferredSize.CGFloat height = v14;
  UIRectGetCenter();
  self->_preferredCenter.CGFloat x = v17;
  self->_preferredCenter.CGFloat y = v18;
  item = self->_item;
  uint64_t v20 = [v4 state];

  [(SBDodgingItem *)item setNeedsUpdateAnimated:v20 == 3];
}

- (void)_handleDeleteGesture:(id)a3
{
  id v4 = [(SBDodgingItem *)self->_item invalidate];
  item = self->_item;
  self->_item = 0;
}

- (void)_handleChangeAnchorGesture:(id)a3
{
  self->_stashed ^= 1u;
  [(SBDodgingTesterView *)self setNeedsLayout];
  item = self->_item;
  [(SBDodgingItem *)item setNeedsUpdateAnimated:1];
}

- (id)dodgingResolver:(id)a3 preferenceForDodgingItem:(id)a4
{
  uint64_t v5 = [(UIPanGestureRecognizer *)self->_moveGesture state];
  uint64_t v6 = [(UIPanGestureRecognizer *)self->_resizeGesture state];
  double v7 = [SBDodgingItemPreference alloc];
  if (self->_stashed)
  {
    double x = 0.0;
    uint64_t v9 = 2;
  }
  else
  {
    double x = self->_preferredCenter.x;
    uint64_t v9 = 3;
  }
  BOOL v12 = (unint64_t)(v5 - 1) < 2 || v6 == 1 || v6 == 2;
  double v13 = -[SBDodgingItemPreference initWithPreferredSize:preferredCenter:updateInteractively:dodgingAxisMask:minimumSize:canBePositionedOutsideContainerBounds:excludedDodgingIdentifiers:](v7, "initWithPreferredSize:preferredCenter:updateInteractively:dodgingAxisMask:minimumSize:canBePositionedOutsideContainerBounds:excludedDodgingIdentifiers:", v12, v9, self->_stashed, self->_ignoringItems, self->_preferredSize.width, self->_preferredSize.height, x, self->_preferredCenter.y, 100.0, 100.0);
  return v13;
}

- (void)dodgingResolver:(id)a3 dodgingItemDidChange:(id)a4
{
  id v5 = a4;
  [(SBDodgingTesterView *)self setNeedsLayout];
  [v5 center];
  double v7 = v6;
  double v9 = v8;
  [v5 containerSize];
  SBRectWithSize();
  UIRectGetCenter();
  if (v7 < v10 && v9 < v11)
  {
    unint64_t v16 = 0;
    goto LABEL_21;
  }
  if (v7 >= v10 && v9 < v11)
  {
    unint64_t v16 = 1;
    goto LABEL_21;
  }
  if (v7 < v10 && v9 >= v11)
  {
    unint64_t v16 = 2;
LABEL_21:
    self->_corner = v16;
    goto LABEL_22;
  }
  if (v7 >= v10 && v9 >= v11)
  {
    unint64_t v16 = 3;
    goto LABEL_21;
  }
LABEL_22:
  id obj = [v5 otherDodgingIdentifiers];

  if ((BSEqualArrays() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_otherIdentifiers, obj);
    otherItemsTable = self->_otherItemsTable;
    CGFloat v18 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
    [(UITableView *)otherItemsTable reloadSections:v18 withRowAnimation:100];

    [(SBDodgingTesterView *)self setNeedsLayout];
  }
  if (![(UIPanGestureRecognizer *)self->_moveGesture state]) {
    [(SBDodgingTesterView *)self layoutIfNeeded];
  }
}

- (void)dodgingResolver:(id)a3 dodgingItemDidSettle:(id)a4
{
  uint64_t v5 = [(UIPanGestureRecognizer *)self->_moveGesture state];
  uint64_t v6 = [(UIPanGestureRecognizer *)self->_resizeGesture state];
  if ((unint64_t)(v5 - 1) >= 2 && v6 != 1 && v6 != 2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__SBDodgingTesterView_dodgingResolver_dodgingItemDidSettle___block_invoke;
    v9[3] = &unk_1E6AF4AC0;
    v9[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:4 delay:v9 options:0 animations:0.25 completion:0.0];
  }
}

uint64_t __60__SBDodgingTesterView_dodgingResolver_dodgingItemDidSettle___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 496) setAlpha:1.0];
}

- (SBDodgingItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (SBDodgingResolverViewController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  return (SBDodgingResolverViewController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (CGSize)preferredSize
{
  double width = self->_preferredSize.width;
  double height = self->_preferredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredSize:(CGSize)a3
{
  self->_preferredSize = a3;
}

- (CGPoint)preferredCenter
{
  double x = self->_preferredCenter.x;
  double y = self->_preferredCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPreferredCenter:(CGPoint)a3
{
  self->_preferredCenter = a3;
}

- (NSMutableSet)ignoringItems
{
  return self->_ignoringItems;
}

- (void)setIgnoringItems:(id)a3
{
}

- (unint64_t)corner
{
  return self->_corner;
}

- (void)setCorner:(unint64_t)a3
{
  self->_corner = a3;
}

- (BOOL)stashed
{
  return self->_stashed;
}

- (void)setStashed:(BOOL)a3
{
  self->_stashed = a3;
}

- (UIPanGestureRecognizer)moveGesture
{
  return self->_moveGesture;
}

- (void)setMoveGesture:(id)a3
{
}

- (CGPoint)initialMoveCenter
{
  double x = self->_initialMoveCenter.x;
  double y = self->_initialMoveCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialMoveCenter:(CGPoint)a3
{
  self->_initialMoveCenter = a3;
}

- (UIPanGestureRecognizer)resizeGesture
{
  return self->_resizeGesture;
}

- (void)setResizeGesture:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)resolvedValuesLabel
{
  return self->_resolvedValuesLabel;
}

- (void)setResolvedValuesLabel:(id)a3
{
}

- (UIView)resizeView
{
  return self->_resizeView;
}

- (void)setResizeView:(id)a3
{
}

- (NSArray)otherIdentifiers
{
  return self->_otherIdentifiers;
}

- (void)setOtherIdentifiers:(id)a3
{
}

- (UITableView)otherItemsTable
{
  return self->_otherItemsTable;
}

- (void)setOtherItemsTable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherItemsTable, 0);
  objc_storeStrong((id *)&self->_otherIdentifiers, 0);
  objc_storeStrong((id *)&self->_resizeView, 0);
  objc_storeStrong((id *)&self->_resolvedValuesLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_resizeGesture, 0);
  objc_storeStrong((id *)&self->_moveGesture, 0);
  objc_storeStrong((id *)&self->_ignoringItems, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_item, 0);
}

@end