@interface _UIBarCustomizationContainerView
- (_UIBarCustomizationContainerView)initWithParentTraitEnvironment:(id)a3;
- (_UITraitEnvironmentInternal)parentTraitEnvironment;
- (id)traitChangeHandler;
- (id)traitCollection;
- (void)_traitCollectionDidChangeOnSubtreeInternal:(const _UITraitCollectionChangeDescription *)a3;
- (void)setParentTraitEnvironment:(id)a3;
- (void)setTraitChangeHandler:(id)a3;
@end

@implementation _UIBarCustomizationContainerView

- (_UIBarCustomizationContainerView)initWithParentTraitEnvironment:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIBarCustomizationContainerView;
  v5 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    [(UIView *)v5 setAutoresizingMask:18];
    [(_UIBarCustomizationContainerView *)v6 setParentTraitEnvironment:v4];
    v7 = +[_UIBarCustomizationCustomViewPortalSourceContainer sharedContainer];
    [(UIView *)v6 addSubview:v7];
  }
  return v6;
}

- (id)traitCollection
{
  v3 = [(_UIBarCustomizationContainerView *)self parentTraitEnvironment];
  id v4 = [v3 _traitCollectionForChildEnvironment:self];

  v5 = [v4 _traitCollectionByReplacingNSIntegerValue:1 forTraitToken:0x1ED3F5B20];

  return v5;
}

- (void)_traitCollectionDidChangeOnSubtreeInternal:(const _UITraitCollectionChangeDescription *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIBarCustomizationContainerView;
  [(UIView *)&v6 _traitCollectionDidChangeOnSubtreeInternal:a3];
  id v4 = [(_UIBarCustomizationContainerView *)self traitChangeHandler];

  if (v4)
  {
    v5 = [(_UIBarCustomizationContainerView *)self traitChangeHandler];
    ((void (**)(void, _UIBarCustomizationContainerView *))v5)[2](v5, self);
  }
}

- (id)traitChangeHandler
{
  return self->_traitChangeHandler;
}

- (void)setTraitChangeHandler:(id)a3
{
}

- (_UITraitEnvironmentInternal)parentTraitEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentTraitEnvironment);
  return (_UITraitEnvironmentInternal *)WeakRetained;
}

- (void)setParentTraitEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentTraitEnvironment);
  objc_storeStrong(&self->_traitChangeHandler, 0);
}

@end