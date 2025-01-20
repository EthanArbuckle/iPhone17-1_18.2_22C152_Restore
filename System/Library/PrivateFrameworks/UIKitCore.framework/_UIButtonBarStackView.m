@interface _UIButtonBarStackView
+ (Class)layerClass;
- (NSString)description;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)layoutSubviews;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation _UIButtonBarStackView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)traitCollectionDidChange:(id)a3
{
  p_buttonBar = &self->_buttonBar;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_buttonBar);
  [WeakRetained _updateForTraitCollectionChange:v5];

  v7.receiver = self;
  v7.super_class = (Class)_UIButtonBarStackView;
  [(UIView *)&v7 traitCollectionDidChange:v5];
}

- (void)updateConstraints
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42___UIButtonBarStackView_updateConstraints__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  +[UIView performWithoutAnimation:v4];
  v3.receiver = self;
  v3.super_class = (Class)_UIButtonBarStackView;
  [(UIStackView *)&v3 updateConstraints];
}

- (void)layoutSubviews
{
  BOOL v3 = +[UIView areAnimationsEnabled];
  if ((dyld_program_sdk_at_least() & 1) == 0) {
    +[UIView setAnimationsEnabled:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)_UIButtonBarStackView;
  [(UIView *)&v6 layoutSubviews];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonBar);
  [WeakRetained _updateHitRects];

  id v5 = objc_loadWeakRetained((id *)&self->_buttonBar);
  [v5 _buttonBarStackViewDidLayoutSubviews:self];

  +[UIView setAnimationsEnabled:v3];
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)_UIButtonBarStackView;
  BOOL v3 = [(UIStackView *)&v7 description];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonBar);
  id v5 = objc_msgSend(v3, "stringByAppendingFormat:", @" buttonBar=%p", WeakRetained);

  return (NSString *)v5;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  p_buttonBar = &self->_buttonBar;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_buttonBar);
  v12 = [WeakRetained pointerInteraction:v10 regionForRequest:v9 defaultRegion:v8];

  return v12;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  p_buttonBar = &self->_buttonBar;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_buttonBar);
  id v9 = [WeakRetained pointerInteraction:v7 styleForRegion:v6];

  return v9;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  p_buttonBar = &self->_buttonBar;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_buttonBar);
  [WeakRetained pointerInteraction:v10 willEnterRegion:v9 animator:v8];
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  p_buttonBar = &self->_buttonBar;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_buttonBar);
  [WeakRetained pointerInteraction:v10 willExitRegion:v9 animator:v8];
}

- (void).cxx_destruct
{
}

@end