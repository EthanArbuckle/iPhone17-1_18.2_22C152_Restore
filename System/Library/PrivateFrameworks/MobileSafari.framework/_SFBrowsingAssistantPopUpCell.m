@interface _SFBrowsingAssistantPopUpCell
- (_SFBrowsingAssistantPopUpCell)initWithCoder:(id)a3;
- (_SFBrowsingAssistantPopUpCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)updateActions;
@end

@implementation _SFBrowsingAssistantPopUpCell

- (_SFBrowsingAssistantPopUpCell)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____SFBrowsingAssistantPopUpCell_title);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____SFBrowsingAssistantPopUpCell_subtitle);
  void *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____SFBrowsingAssistantPopUpCell_actions) = (Class)MEMORY[0x1E4FBC860];
  id v6 = a3;

  result = (_SFBrowsingAssistantPopUpCell *)sub_18C6FA758();
  __break(1u);
  return result;
}

- (_SFBrowsingAssistantPopUpCell)initWithFrame:(CGRect)a3
{
  return (_SFBrowsingAssistantPopUpCell *)sub_18C6867FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_18C6F8B28();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C6F8B18();
  v8 = self;
  sub_18C686ADC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)updateActions
{
  v2 = self;
  sub_18C686D8C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end