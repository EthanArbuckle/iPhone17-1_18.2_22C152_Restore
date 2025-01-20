@interface WFLibraryCollection
- (NSArray)shortcutIdentifiers;
- (WFLibraryCollection)init;
- (WFLibraryCollection)initWithWorkflowCollection:(id)a3 shortcutIdentifiers:(id)a4;
- (WFWorkflowCollection)workflowCollection;
@end

@implementation WFLibraryCollection

- (WFWorkflowCollection)workflowCollection
{
  id v2 = LibraryCollection.workflowCollection.getter();
  return (WFWorkflowCollection *)v2;
}

- (NSArray)shortcutIdentifiers
{
  LibraryCollection.shortcutIdentifiers.getter();
  id v2 = (void *)sub_1C8532828();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (WFLibraryCollection)initWithWorkflowCollection:(id)a3 shortcutIdentifiers:(id)a4
{
  uint64_t v5 = sub_1C8532838();
  return (WFLibraryCollection *)LibraryCollection.init(workflowCollection:shortcutIdentifiers:)((uint64_t)a3, v5);
}

- (WFLibraryCollection)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end