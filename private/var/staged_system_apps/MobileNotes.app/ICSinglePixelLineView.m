@interface ICSinglePixelLineView
- (BOOL)hasSetUpSizeConstraint;
- (id)addSizeConstraint;
- (id)findSizeLayoutConstraintIfExists;
- (void)setHasSetUpSizeConstraint:(BOOL)a3;
- (void)setUpHeightConstraintIfNecessary;
- (void)updateConstraints;
@end

@implementation ICSinglePixelLineView

- (void)updateConstraints
{
  [(ICSinglePixelLineView *)self setUpHeightConstraintIfNecessary];
  v3.receiver = self;
  v3.super_class = (Class)ICSinglePixelLineView;
  [(ICSinglePixelLineView *)&v3 updateConstraints];
}

- (void)setUpHeightConstraintIfNecessary
{
  if (![(ICSinglePixelLineView *)self hasSetUpSizeConstraint])
  {
    objc_super v3 = +[UIColor tableSeparatorLightColor];
    [(ICSinglePixelLineView *)self setBackgroundColor:v3];

    v4 = +[UIScreen mainScreen];
    [v4 scale];
    double v6 = 1.0 / v5;

    v7 = [(ICSinglePixelLineView *)self findSizeLayoutConstraintIfExists];
    if (!v7)
    {
      v7 = [(ICSinglePixelLineView *)self addSizeConstraint];
    }
    id v8 = v7;
    [v7 setConstant:v6];
    [(ICSinglePixelLineView *)self setHasSetUpSizeConstraint:1];
  }
}

- (id)findSizeLayoutConstraintIfExists
{
  id v3 = [(ICSinglePixelLineView *)self sizeLayoutAttribute];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = [(ICSinglePixelLineView *)self constraints];
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v5)
  {
    v7 = 0;
    goto LABEL_16;
  }
  id v6 = v5;
  v7 = 0;
  uint64_t v8 = *(void *)v17;
  do
  {
    v9 = 0;
    do
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v4);
      }
      v10 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v9);
      if ([v10 firstAttribute] == v3)
      {
        v11 = [v10 firstItem];
        if (v11 != self) {
          goto LABEL_8;
        }
        v12 = [v10 secondItem];

        if (!v12)
        {
          v13 = v10;
          v11 = v7;
          v7 = v13;
LABEL_8:
        }
      }
      v9 = (char *)v9 + 1;
    }
    while (v6 != v9);
    id v14 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    id v6 = v14;
  }
  while (v14);
LABEL_16:

  return v7;
}

- (id)addSizeConstraint
{
  id v3 = [(ICSinglePixelLineView *)self sizeLayoutAttribute];
  v4 = +[UIScreen mainScreen];
  [v4 scale];
  id v6 = +[NSLayoutConstraint constraintWithItem:self attribute:v3 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:1.0 / v5];

  v9 = v6;
  v7 = +[NSArray arrayWithObjects:&v9 count:1];
  +[NSLayoutConstraint activateConstraints:v7];

  return v6;
}

- (BOOL)hasSetUpSizeConstraint
{
  return self->_hasSetUpSizeConstraint;
}

- (void)setHasSetUpSizeConstraint:(BOOL)a3
{
  self->_hasSetUpSizeConstraint = a3;
}

@end