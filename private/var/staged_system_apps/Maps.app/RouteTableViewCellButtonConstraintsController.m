@interface RouteTableViewCellButtonConstraintsController
- (BOOL)isButtonVisible;
- (NSArray)constraintsWhenButtonHidden;
- (NSArray)constraintsWhenButtonShown;
- (NSLayoutAnchor)firstBaselineAnchor;
- (NSLayoutAnchor)leadingAnchor;
- (NSLayoutAnchor)trailingAnchor;
- (NSLayoutConstraint)firstBaselineConstraintShown;
- (RouteTableViewCellButtonConstraintsController)initWithLeadingAnchor:(id)a3 trailingAnchor:(id)a4 firstBaselineAnchor:(id)a5 leadingDistance:(double)a6 firstBaselineDistance:(double)a7;
- (UIButton)button;
- (double)firstBaselineDistance;
- (double)leadingDistance;
- (void)_invalidateButtonConstraints;
- (void)_updateActiveConstraintsToSetButtonVisible:(BOOL)a3;
- (void)setButton:(id)a3;
- (void)setButtonVisible:(BOOL)a3;
- (void)setConstraintsWhenButtonHidden:(id)a3;
- (void)setConstraintsWhenButtonShown:(id)a3;
- (void)setFirstBaselineDistance:(double)a3;
@end

@implementation RouteTableViewCellButtonConstraintsController

- (RouteTableViewCellButtonConstraintsController)initWithLeadingAnchor:(id)a3 trailingAnchor:(id)a4 firstBaselineAnchor:(id)a5 leadingDistance:(double)a6 firstBaselineDistance:(double)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v20.receiver = self;
  v20.super_class = (Class)RouteTableViewCellButtonConstraintsController;
  v16 = [(RouteTableViewCellButtonConstraintsController *)&v20 init];
  v17 = v16;
  v18 = 0;
  if (v16 && v13 && v14 && v15)
  {
    objc_storeStrong((id *)&v16->_leadingAnchor, a3);
    objc_storeStrong((id *)&v17->_trailingAnchor, a4);
    objc_storeStrong((id *)&v17->_firstBaselineAnchor, a5);
    v17->_leadingDistance = a6;
    v17->_firstBaselineDistance = a7;
    v18 = v17;
  }

  return v18;
}

- (void)setButton:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_button);

  if (WeakRetained != obj)
  {
    [(RouteTableViewCellButtonConstraintsController *)self _invalidateButtonConstraints];
    id v5 = objc_storeWeak((id *)&self->_button, obj);
    [obj setTranslatesAutoresizingMaskIntoConstraints:0];

    id v6 = objc_loadWeakRetained((id *)&self->_button);
    LODWORD(v7) = 1148846080;
    [v6 _mapkit_setContentCompressionResistancePriority:0 forAxis:v7];

    id v8 = objc_loadWeakRetained((id *)&self->_button);
    LODWORD(v9) = 1148846080;
    [v8 _mapkit_setContentHuggingPriority:0 forAxis:v9];

    [(RouteTableViewCellButtonConstraintsController *)self _updateActiveConstraintsToSetButtonVisible:[(RouteTableViewCellButtonConstraintsController *)self isButtonVisible]];
  }
}

- (void)setButtonVisible:(BOOL)a3
{
  if (self->_buttonVisible != a3)
  {
    self->_buttonVisible = a3;
    -[RouteTableViewCellButtonConstraintsController _updateActiveConstraintsToSetButtonVisible:](self, "_updateActiveConstraintsToSetButtonVisible:");
  }
}

- (void)setFirstBaselineDistance:(double)a3
{
  if (self->_firstBaselineDistance != a3)
  {
    self->_firstBaselineDistance = a3;
    -[NSLayoutConstraint setConstant:](self->_firstBaselineConstraintShown, "setConstant:");
  }
}

- (NSArray)constraintsWhenButtonHidden
{
  if (self->_leadingAnchor && self->_trailingAnchor)
  {
    if (![(NSArray *)self->_constraintsWhenButtonHidden count])
    {
      v3 = [(NSLayoutAnchor *)self->_leadingAnchor constraintLessThanOrEqualToAnchor:self->_trailingAnchor];
      id v8 = v3;
      v4 = +[NSArray arrayWithObjects:&v8 count:1];
      constraintsWhenButtonHidden = self->_constraintsWhenButtonHidden;
      self->_constraintsWhenButtonHidden = v4;
    }
    id v6 = self->_constraintsWhenButtonHidden;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSArray)constraintsWhenButtonShown
{
  if (self->_leadingAnchor && self->_trailingAnchor && self->_firstBaselineAnchor)
  {
    if (![(NSArray *)self->_constraintsWhenButtonShown count])
    {
      v3 = [(RouteTableViewCellButtonConstraintsController *)self button];

      if (v3)
      {
        v4 = [(RouteTableViewCellButtonConstraintsController *)self button];
        id v5 = [v4 leadingAnchor];
        id v6 = [v5 constraintEqualToAnchor:self->_leadingAnchor constant:self->_leadingDistance];

        double v7 = [(RouteTableViewCellButtonConstraintsController *)self button];
        id v8 = [v7 trailingAnchor];
        double v9 = [v8 constraintEqualToAnchor:self->_trailingAnchor];

        v10 = [(RouteTableViewCellButtonConstraintsController *)self button];
        v11 = [v10 firstBaselineAnchor];
        v12 = [v11 constraintEqualToAnchor:self->_firstBaselineAnchor constant:self->_firstBaselineDistance];
        firstBaselineConstraintShown = self->_firstBaselineConstraintShown;
        self->_firstBaselineConstraintShown = v12;

        LODWORD(v14) = 1148829696;
        [v6 setPriority:v14];
        v19[0] = v6;
        v19[1] = v9;
        v19[2] = self->_firstBaselineConstraintShown;
        id v15 = +[NSArray arrayWithObjects:v19 count:3];
        constraintsWhenButtonShown = self->_constraintsWhenButtonShown;
        self->_constraintsWhenButtonShown = v15;
      }
    }
    v17 = self->_constraintsWhenButtonShown;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_updateActiveConstraintsToSetButtonVisible:(BOOL)a3
{
  if (a3)
  {
    id v5 = [(RouteTableViewCellButtonConstraintsController *)self constraintsWhenButtonShown];
    [(RouteTableViewCellButtonConstraintsController *)self constraintsWhenButtonHidden];
  }
  else
  {
    id v5 = [(RouteTableViewCellButtonConstraintsController *)self constraintsWhenButtonHidden];
    [(RouteTableViewCellButtonConstraintsController *)self constraintsWhenButtonShown];
  v4 = };
  if ([v4 count]) {
    +[NSLayoutConstraint deactivateConstraints:v4];
  }
  if ([v5 count]) {
    +[NSLayoutConstraint activateConstraints:v5];
  }
}

- (void)_invalidateButtonConstraints
{
  if ([(NSArray *)self->_constraintsWhenButtonShown count]) {
    +[NSLayoutConstraint deactivateConstraints:self->_constraintsWhenButtonShown];
  }
  constraintsWhenButtonShown = self->_constraintsWhenButtonShown;
  self->_constraintsWhenButtonShown = 0;

  firstBaselineConstraintShown = self->_firstBaselineConstraintShown;
  self->_firstBaselineConstraintShown = 0;
}

- (NSLayoutAnchor)leadingAnchor
{
  return self->_leadingAnchor;
}

- (NSLayoutAnchor)trailingAnchor
{
  return self->_trailingAnchor;
}

- (NSLayoutAnchor)firstBaselineAnchor
{
  return self->_firstBaselineAnchor;
}

- (double)leadingDistance
{
  return self->_leadingDistance;
}

- (double)firstBaselineDistance
{
  return self->_firstBaselineDistance;
}

- (NSLayoutConstraint)firstBaselineConstraintShown
{
  return self->_firstBaselineConstraintShown;
}

- (void)setConstraintsWhenButtonHidden:(id)a3
{
}

- (void)setConstraintsWhenButtonShown:(id)a3
{
}

- (UIButton)button
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_button);

  return (UIButton *)WeakRetained;
}

- (BOOL)isButtonVisible
{
  return self->_buttonVisible;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_button);
  objc_storeStrong((id *)&self->_constraintsWhenButtonShown, 0);
  objc_storeStrong((id *)&self->_constraintsWhenButtonHidden, 0);
  objc_storeStrong((id *)&self->_firstBaselineConstraintShown, 0);
  objc_storeStrong((id *)&self->_firstBaselineAnchor, 0);
  objc_storeStrong((id *)&self->_trailingAnchor, 0);

  objc_storeStrong((id *)&self->_leadingAnchor, 0);
}

@end