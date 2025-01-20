@interface SBRootDodgingLayerModifier
- (BOOL)hasPerformedInitialSetup;
- (id)_floorModifier;
- (id)handleInsertionEvent:(id)a3;
- (id)handlePreferenceChangeEvent:(id)a3;
- (id)handleRemovalEvent:(id)a3;
- (id)handleRotationEvent:(id)a3;
- (void)_setup;
- (void)didMoveToParentModifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasPerformedInitialSetup:(BOOL)a3;
@end

@implementation SBRootDodgingLayerModifier

- (void)setDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBRootDodgingLayerModifier;
  -[SBChainableModifier setDelegate:](&v5, sel_setDelegate_);
  if (a3)
  {
    if (!self->_hasPerformedInitialSetup)
    {
      self->_hasPerformedInitialSetup = 1;
      [(SBRootDodgingLayerModifier *)self _setup];
    }
  }
}

- (void)didMoveToParentModifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBRootDodgingLayerModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!self->_hasPerformedInitialSetup)
    {
      self->_hasPerformedInitialSetup = 1;
      [(SBRootDodgingLayerModifier *)self _setup];
    }
  }
}

- (void)_setup
{
  v3 = [(SBRootDodgingLayerModifier *)self _floorModifier];
  if (!v3)
  {
    v4 = objc_alloc_init(SBFloorDodgingLayerModifier);
    [(SBChainableModifier *)self addChildModifier:v4 atLevel:1 key:@"Floor Modifier"];

    v3 = 0;
  }
}

- (id)handleInsertionEvent:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)SBRootDodgingLayerModifier;
  id v4 = a3;
  objc_super v5 = [(SBDodgingModifier *)&v18 handleInsertionEvent:v4];
  v6 = [SBInsertionDodgingModifier alloc];
  v7 = objc_msgSend(v4, "identifier", v18.receiver, v18.super_class);
  [v4 center];
  double v9 = v8;
  double v11 = v10;
  [v4 size];
  double v13 = v12;
  double v15 = v14;

  v16 = -[SBInsertionDodgingModifier initWithIdentifier:initialCenter:initialSize:](v6, "initWithIdentifier:initialCenter:initialSize:", v7, v9, v11, v13, v15);
  [(SBChainableModifier *)self addChildModifier:v16 atLevel:0 key:0];

  return v5;
}

- (id)handleRemovalEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBRootDodgingLayerModifier;
  id v4 = a3;
  objc_super v5 = [(SBDodgingModifier *)&v10 handleRemovalEvent:v4];
  v6 = [SBRemovalDodgingModifier alloc];
  v7 = objc_msgSend(v4, "identifier", v10.receiver, v10.super_class);

  double v8 = [(SBRemovalDodgingModifier *)v6 initWithIdentifier:v7];
  [(SBChainableModifier *)self addChildModifier:v8 atLevel:0 key:0];

  return v5;
}

- (id)handleRotationEvent:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBRootDodgingLayerModifier;
  objc_super v5 = [(SBDodgingModifier *)&v10 handleRotationEvent:v4];
  if (![v4 phase])
  {
    v6 = [SBRotationDodgingModifier alloc];
    v7 = [v4 identifier];
    double v8 = -[SBRotationDodgingModifier initWithIdentifier:fromOrientation:toOrientation:](v6, "initWithIdentifier:fromOrientation:toOrientation:", v7, [v4 fromOrientation], objc_msgSend(v4, "toOrientation"));

    [(SBChainableModifier *)self addChildModifier:v8 atLevel:0 key:0];
  }

  return v5;
}

- (id)handlePreferenceChangeEvent:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBRootDodgingLayerModifier;
  objc_super v5 = [(SBDodgingModifier *)&v14 handlePreferenceChangeEvent:v4];
  uint64_t v6 = [v4 style];
  if (![v4 phase] && (objc_msgSend(v4, "isHandled") & 1) == 0)
  {
    if (v6 == 1)
    {
      v7 = [SBInteractivePreferenceChangeDodgingModifier alloc];
      double v8 = [v4 identifier];
      uint64_t v9 = [(SBInteractivePreferenceChangeDodgingModifier *)v7 initWithIdentifier:v8];
    }
    else
    {
      BOOL v10 = v6 == 2;
      double v11 = [SBPreferenceChangeDodgingModifier alloc];
      double v8 = [v4 identifier];
      uint64_t v9 = [(SBPreferenceChangeDodgingModifier *)v11 initWithIdentifier:v8 animated:v10];
    }
    double v12 = (void *)v9;

    [(SBChainableModifier *)self addChildModifier:v12 atLevel:0 key:0];
  }

  return v5;
}

- (id)_floorModifier
{
  return [(SBChainableModifier *)self childModifierByKey:@"Floor Modifier"];
}

- (BOOL)hasPerformedInitialSetup
{
  return self->_hasPerformedInitialSetup;
}

- (void)setHasPerformedInitialSetup:(BOOL)a3
{
  self->_hasPerformedInitialSetup = a3;
}

@end