@interface SBActiveAppLayoutFloatingSwitcherModifier
- (SBActiveAppLayoutFloatingSwitcherModifier)initWithActiveAppLayout:(id)a3 floatingConfiguration:(int64_t)a4 environmentMode:(int64_t)a5;
@end

@implementation SBActiveAppLayoutFloatingSwitcherModifier

- (SBActiveAppLayoutFloatingSwitcherModifier)initWithActiveAppLayout:(id)a3 floatingConfiguration:(int64_t)a4 environmentMode:(int64_t)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBActiveAppLayoutFloatingSwitcherModifier;
  v9 = [(SBSwitcherModifier *)&v16 init];
  if (v9)
  {
    v10 = objc_alloc_init(SBStackedFloatingSwitcherModifier);
    stackedModifier = v9->_stackedModifier;
    v9->_stackedModifier = v10;

    [(SBChainableModifier *)v9 addChildModifier:v9->_stackedModifier atLevel:0 key:0];
    v12 = [[_SBActiveAppFloorFloatingSwitcherModifier alloc] initWithActiveAppLayout:v8 floatingConfiguration:a4 environmentMode:a5];
    floorModifier = v9->_floorModifier;
    v9->_floorModifier = v12;

    [(SBChainableModifier *)v9 addChildModifier:v9->_floorModifier atLevel:1 key:0];
    v14 = objc_alloc_init(SBDefaultImplementationsSwitcherModifier);
    [(SBChainableModifier *)v9 addChildModifier:v14 atLevel:2 key:0];
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floorModifier, 0);
  objc_storeStrong((id *)&self->_stackedModifier, 0);
}

@end