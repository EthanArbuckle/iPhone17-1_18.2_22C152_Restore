@interface SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider
- (SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider)initWithFBSScene:(id)a3;
- (SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider)initWithUIScene:(id)a3;
- (id)_init;
- (id)assertionAttributes;
@end

@implementation SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider

- (SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider)initWithFBSScene:(id)a3
{
  id v4 = a3;
  v5 = [[SBFSAlwaysOnLiveRenderingAssertionFBSScene alloc] initWithScene:v4];

  return &v5->super;
}

- (SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider)initWithUIScene:(id)a3
{
  id v4 = a3;
  v5 = [[SBFSAlwaysOnLiveRenderingAssertionUIScene alloc] initWithScene:v4];

  return &v5->super;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider;
  return [(SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider *)&v3 init];
}

- (id)assertionAttributes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end