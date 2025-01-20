@interface SBAppUnderFloatingSwitcherTransitionSwitcherModifier
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
@end

@implementation SBAppUnderFloatingSwitcherTransitionSwitcherModifier

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(1u, 0);
}

@end