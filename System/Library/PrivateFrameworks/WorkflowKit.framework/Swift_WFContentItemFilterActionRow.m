@interface Swift_WFContentItemFilterActionRow
- (WFContentProperty)contentProperty;
- (_TtC11WorkflowKitP33_E09A67776F6F7C3CDD26E2BB23B6F9D634Swift_WFContentItemFilterActionRow)init;
- (id)enumerationValue;
@end

@implementation Swift_WFContentItemFilterActionRow

- (id)enumerationValue
{
  v2 = self;
  v3 = (void *)sub_1C8265310();

  return v3;
}

- (WFContentProperty)contentProperty
{
  id v2 = sub_1C82653D8();
  return (WFContentProperty *)v2;
}

- (_TtC11WorkflowKitP33_E09A67776F6F7C3CDD26E2BB23B6F9D634Swift_WFContentItemFilterActionRow)init
{
}

- (void).cxx_destruct
{
  id v2 = *(id *)&self->row[OBJC_IVAR____TtC11WorkflowKitP33_E09A67776F6F7C3CDD26E2BB23B6F9D634Swift_WFContentItemFilterActionRow_row];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end