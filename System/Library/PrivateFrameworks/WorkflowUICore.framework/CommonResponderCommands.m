@interface CommonResponderCommands
- (_TtC14WorkflowUICore23CommonResponderCommands)init;
- (uint64_t)duplicateShortcut:(uint64_t)a3;
@end

@implementation CommonResponderCommands

- (_TtC14WorkflowUICore23CommonResponderCommands)init
{
  return (_TtC14WorkflowUICore23CommonResponderCommands *)sub_2353AE634();
}

- (uint64_t)duplicateShortcut:(uint64_t)a3
{
  if (a3)
  {
    id v4 = a1;
    swift_unknownObjectRetain();
    sub_2353FDC48();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    id v5 = a1;
  }

  return sub_2353616F4((uint64_t)v7);
}

@end