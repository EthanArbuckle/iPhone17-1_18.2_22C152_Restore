@interface _UIVisualEffectDescriptor
+ (id)newTransitionDescriptorForStops:(id)a3;
- (BOOL)allowsVibrancyInContent;
- (BOOL)contentViewRequiresClipping;
- (BOOL)disableInPlaceFiltering;
- (BOOL)layerHitTestsAsOpaque;
- (BOOL)requestAlphaTransition;
- (BOOL)textShouldRenderWithTintColor;
- (NSArray)filterEntries;
- (NSArray)overlays;
- (NSArray)underlays;
- (NSArray)viewEffects;
- (_UIVisualEffectDescriptor)init;
- (_UIVisualEffectViewParticipating)_identityContainerView;
- (_UIVisualEffectViewParticipating)_requestedContainerView;
- (_UIVisualEffectViewParticipating)containerView;
- (id)copyForTransitionToDescriptor:(id)a3;
- (id)description;
- (int64_t)alphaTransition;
- (void)addFilterEntry:(id)a3;
- (void)addOverlay:(id)a3;
- (void)addUnderlay:(id)a3;
- (void)addViewEffect:(id)a3;
- (void)setAllowsVibrancyInContent:(BOOL)a3;
- (void)setAlphaTransition:(int64_t)a3;
- (void)setContainerView:(id)a3;
- (void)setContentViewRequiresClipping:(BOOL)a3;
- (void)setDisableInPlaceFiltering:(BOOL)a3;
- (void)setFilterEntries:(id)a3;
- (void)setLayerHitTestsAsOpaque:(BOOL)a3;
- (void)setOverlays:(id)a3;
- (void)setRequestAlphaTransition:(BOOL)a3;
- (void)setTextShouldRenderWithTintColor:(BOOL)a3;
- (void)setUnderlays:(id)a3;
- (void)setViewEffects:(id)a3;
- (void)set_identityContainerView:(id)a3;
- (void)set_requestedContainerView:(id)a3;
- (void)uniqueFilterNames;
@end

@implementation _UIVisualEffectDescriptor

- (void)setTextShouldRenderWithTintColor:(BOOL)a3
{
  self->_textShouldRenderWithTintColor = a3;
}

- (void)addViewEffect:(id)a3
{
}

- (void)addFilterEntry:(id)a3
{
}

- (void)setDisableInPlaceFiltering:(BOOL)a3
{
  self->_disableInPlaceFiltering = a3;
}

- (void)setLayerHitTestsAsOpaque:(BOOL)a3
{
  self->_layerHitTestsAsOpaque = a3;
}

- (void)setAllowsVibrancyInContent:(BOOL)a3
{
  self->_allowsVibrancyInContent = a3;
}

- (BOOL)textShouldRenderWithTintColor
{
  return self->_textShouldRenderWithTintColor;
}

- (_UIVisualEffectDescriptor)init
{
  v12.receiver = self;
  v12.super_class = (Class)_UIVisualEffectDescriptor;
  v2 = [(_UIVisualEffectDescriptor *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    viewEffects = v2->_viewEffects;
    v2->_viewEffects = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    filterEntries = v2->_filterEntries;
    v2->_filterEntries = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    overlays = v2->_overlays;
    v2->_overlays = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    underlays = v2->_underlays;
    v2->_underlays = (NSMutableArray *)v9;
  }
  return v2;
}

- (BOOL)contentViewRequiresClipping
{
  return self->_contentViewRequiresClipping;
}

- (void)uniqueFilterNames
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_filterEntries;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "filterType", (void)v11);
        if ([v3 containsObject:v10]) {
          [v9 forceUniqueName];
        }
        else {
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (_UIVisualEffectViewParticipating)_identityContainerView
{
  return self->_identityContainerView;
}

- (_UIVisualEffectViewParticipating)_requestedContainerView
{
  return self->_requestedContainerView;
}

- (NSArray)filterEntries
{
  return &self->_filterEntries->super;
}

- (NSArray)viewEffects
{
  return &self->_viewEffects->super;
}

- (NSArray)underlays
{
  return &self->_underlays->super;
}

- (NSArray)overlays
{
  return &self->_overlays->super;
}

- (BOOL)layerHitTestsAsOpaque
{
  return self->_layerHitTestsAsOpaque;
}

- (BOOL)allowsVibrancyInContent
{
  return self->_allowsVibrancyInContent;
}

- (BOOL)disableInPlaceFiltering
{
  return self->_disableInPlaceFiltering;
}

- (void)addUnderlay:(id)a3
{
}

- (void)addOverlay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedContainerView, 0);
  objc_storeStrong((id *)&self->_identityContainerView, 0);
  objc_storeStrong((id *)&self->_overlays, 0);
  objc_storeStrong((id *)&self->_underlays, 0);
  objc_storeStrong((id *)&self->_viewEffects, 0);
  objc_storeStrong((id *)&self->_filterEntries, 0);
}

- (void)setFilterEntries:(id)a3
{
  v4 = (NSMutableArray *)[a3 mutableCopy];
  filterEntries = self->_filterEntries;
  self->_filterEntries = v4;
}

- (void)setViewEffects:(id)a3
{
  v4 = (NSMutableArray *)[a3 mutableCopy];
  viewEffects = self->_viewEffects;
  self->_viewEffects = v4;
}

- (_UIVisualEffectViewParticipating)containerView
{
  return self->_requestedContainerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_requestedContainerView, a3);
  id v6 = a3;
  identityContainerView = self->_identityContainerView;
  self->_identityContainerView = 0;
}

- (void)setUnderlays:(id)a3
{
  v4 = (NSMutableArray *)[a3 mutableCopy];
  underlays = self->_underlays;
  self->_underlays = v4;
}

- (void)setOverlays:(id)a3
{
  v4 = (NSMutableArray *)[a3 mutableCopy];
  overlays = self->_overlays;
  self->_overlays = v4;
}

- (id)copyForTransitionToDescriptor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(_UIVisualEffectDescriptor);
  id v6 = objc_alloc_init(_UIVisualEffectDifferenceEngine);
  [(_UIVisualEffectDescriptor *)v5 set_identityContainerView:self->_requestedContainerView];
  uint64_t v7 = [v4 _requestedContainerView];
  [(_UIVisualEffectDescriptor *)v5 set_requestedContainerView:v7];

  -[_UIVisualEffectDescriptor setTextShouldRenderWithTintColor:](v5, "setTextShouldRenderWithTintColor:", [v4 textShouldRenderWithTintColor]);
  -[_UIVisualEffectDescriptor setAllowsVibrancyInContent:](v5, "setAllowsVibrancyInContent:", [v4 allowsVibrancyInContent]);
  if (self->_disableInPlaceFiltering) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = [v4 disableInPlaceFiltering];
  }
  [(_UIVisualEffectDescriptor *)v5 setDisableInPlaceFiltering:v8];
  if (!self->_requestAlphaTransition)
  {
    if (![v4 requestAlphaTransition]
      || [(NSMutableArray *)self->_filterEntries count]
      || [(NSMutableArray *)self->_viewEffects count])
    {
      goto LABEL_12;
    }
    [(_UIVisualEffectDescriptor *)v5 setAlphaTransition:1];
    v10 = [v4 filterEntries];
    [(_UIVisualEffectDescriptor *)v5 setFilterEntries:v10];

    long long v11 = [v4 viewEffects];
    [(_UIVisualEffectDescriptor *)v5 setViewEffects:v11];

    long long v12 = [_UIVisualEffectAlphaEntry alloc];
    double v13 = 0.0;
    double v14 = 1.0;
    goto LABEL_15;
  }
  uint64_t v9 = [v4 filterEntries];
  if (![v9 count])
  {
    v15 = [v4 viewEffects];
    uint64_t v16 = [v15 count];

    if (v16) {
      goto LABEL_12;
    }
    [(_UIVisualEffectDescriptor *)v5 setAlphaTransition:2];
    [(_UIVisualEffectDescriptor *)v5 setFilterEntries:self->_filterEntries];
    [(_UIVisualEffectDescriptor *)v5 setViewEffects:self->_viewEffects];
    long long v12 = [_UIVisualEffectAlphaEntry alloc];
    double v13 = 1.0;
    double v14 = 0.0;
LABEL_15:
    v21 = [(_UIVisualEffectAlphaEntry *)v12 initWithInitialAlpha:v13 finalAlpha:v14];
    [(_UIVisualEffectDescriptor *)v5 addViewEffect:v21];
    goto LABEL_13;
  }

LABEL_12:
  [(_UIVisualEffectDescriptor *)v5 setAlphaTransition:0];
  filterEntries = self->_filterEntries;
  v18 = [v4 filterEntries];
  v19 = [(_UIVisualEffectDifferenceEngine *)v6 mergeSource:filterEntries andDestination:v18];
  [(_UIVisualEffectDescriptor *)v5 setFilterEntries:v19];

  viewEffects = self->_viewEffects;
  v21 = [v4 viewEffects];
  v22 = [(_UIVisualEffectDifferenceEngine *)v6 mergeSource:viewEffects andDestination:v21];
  [(_UIVisualEffectDescriptor *)v5 setViewEffects:v22];

LABEL_13:
  underlays = self->_underlays;
  v24 = [v4 underlays];
  v25 = [(_UIVisualEffectDifferenceEngine *)v6 mergeSource:underlays andDestination:v24];
  [(_UIVisualEffectDescriptor *)v5 setUnderlays:v25];

  overlays = self->_overlays;
  v27 = [v4 overlays];
  v28 = [(_UIVisualEffectDifferenceEngine *)v6 mergeSource:overlays andDestination:v27];
  [(_UIVisualEffectDescriptor *)v5 setOverlays:v28];

  return v5;
}

+ (id)newTransitionDescriptorForStops:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 count];
  if (v6 == 2)
  {
    uint64_t v8 = [v5 firstObject];
    uint64_t v9 = [v5 lastObject];
    uint64_t v7 = (void *)[v8 copyForTransitionToDescriptor:v9];
  }
  else if (v6 == 1)
  {
    uint64_t v7 = [v5 firstObject];
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"_UIVisualEffectModel.m", 782, @"We don't handle this yet, sorry" object file lineNumber description];

    uint64_t v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@ %p>:", v5, self];

  if (self->_textShouldRenderWithTintColor) {
    [v6 appendString:@" textShouldRenderWithTintColor"];
  }
  if (self->_allowsVibrancyInContent) {
    [v6 appendString:@" allowsVibrancyInContent"];
  }
  if (self->_disableInPlaceFiltering) {
    [v6 appendString:@" disableInPlaceFiltering"];
  }
  _UIFilterEntryAppendArrayDescription(v6, @"filters", self->_filterEntries);
  _UIFilterEntryAppendArrayDescription(v6, @"viewEffects", self->_viewEffects);
  _UIFilterEntryAppendArrayDescription(v6, @"underlays", self->_underlays);
  _UIFilterEntryAppendArrayDescription(v6, @"overlays", self->_overlays);
  return v6;
}

- (void)set_identityContainerView:(id)a3
{
}

- (void)set_requestedContainerView:(id)a3
{
}

- (BOOL)requestAlphaTransition
{
  return self->_requestAlphaTransition;
}

- (void)setRequestAlphaTransition:(BOOL)a3
{
  self->_requestAlphaTransition = a3;
}

- (int64_t)alphaTransition
{
  return self->_alphaTransition;
}

- (void)setAlphaTransition:(int64_t)a3
{
  self->_alphaTransition = a3;
}

- (void)setContentViewRequiresClipping:(BOOL)a3
{
  self->_contentViewRequiresClipping = a3;
}

@end