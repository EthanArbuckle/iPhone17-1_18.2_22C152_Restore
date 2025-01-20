@interface _SFBrowsingAssistantSwitchCell
- (BOOL)isOn;
- (_SFBrowsingAssistantSwitchCell)initWithCoder:(id)a3;
- (_SFBrowsingAssistantSwitchCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)setOn:(BOOL)a3;
@end

@implementation _SFBrowsingAssistantSwitchCell

- (_SFBrowsingAssistantSwitchCell)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super.super._responderFlags
            + OBJC_IVAR____SFBrowsingAssistantSwitchCell_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____SFBrowsingAssistantSwitchCell_title);
  void *v5 = 0;
  v5[1] = 0;
  uint64_t v6 = OBJC_IVAR____SFBrowsingAssistantSwitchCell_switch;
  id v7 = objc_allocWithZone(MEMORY[0x1E4FB1CD0]);
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_init);

  result = (_SFBrowsingAssistantSwitchCell *)sub_18C6FA758();
  __break(1u);
  return result;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_18C6F8B28();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C6F8B18();
  id v8 = self;
  sub_18C58E30C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_SFBrowsingAssistantSwitchCell)initWithFrame:(CGRect)a3
{
  return (_SFBrowsingAssistantSwitchCell *)sub_18C36F9B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)isOn
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____SFBrowsingAssistantSwitchCell_switch), sel_isOn);
}

- (void)setOn:(BOOL)a3
{
}

- (void).cxx_destruct
{
  sub_18C57B508((uint64_t)self + OBJC_IVAR____SFBrowsingAssistantSwitchCell_delegate);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____SFBrowsingAssistantSwitchCell_switch);
}

@end