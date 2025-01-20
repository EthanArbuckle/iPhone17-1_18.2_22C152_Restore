@interface WFWorkflowCollection(WorkflowKit)
+ (id)defaultName;
+ (uint64_t)defaultGlyphCharacter;
- (uint64_t)systemIconName;
@end

@implementation WFWorkflowCollection(WorkflowKit)

- (uint64_t)systemIconName
{
  [a1 glyphCharacter];
  return WFSystemImageNameForOutlineGlyphCharacter();
}

+ (id)defaultName
{
  return WFLocalizedString(@"New Folder");
}

+ (uint64_t)defaultGlyphCharacter
{
  return 59737;
}

@end