@interface _SFBrowsingAssistantListCell
- (_SFBrowsingAssistantListCell)initWithCoder:(id)a3;
- (_SFBrowsingAssistantListCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation _SFBrowsingAssistantListCell

- (_SFBrowsingAssistantListCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18C6B8EC0();
}

- (_SFBrowsingAssistantListCell)initWithFrame:(CGRect)a3
{
  return (_SFBrowsingAssistantListCell *)sub_18C6B64BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_18C6F8B28();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C6F8B18();
  v8 = self;
  sub_18C6B68CC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  sub_18C57B508((uint64_t)self + OBJC_IVAR____SFBrowsingAssistantListCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____SFBrowsingAssistantListCell_overrideColor));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18C687DD0((uint64_t)self + OBJC_IVAR____SFBrowsingAssistantListCell____lazy_storage___reorderAccessory);
  sub_18C687DD0((uint64_t)self + OBJC_IVAR____SFBrowsingAssistantListCell____lazy_storage___deleteAccessory);
  sub_18C687DD0((uint64_t)self + OBJC_IVAR____SFBrowsingAssistantListCell____lazy_storage___insertAccessory);
  sub_18C687DD0((uint64_t)self + OBJC_IVAR____SFBrowsingAssistantListCell_badgeAccessory);
  swift_bridgeObjectRelease();
  sub_18C687DD0((uint64_t)self + OBJC_IVAR____SFBrowsingAssistantListCell_statusAlertAccessory);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____SFBrowsingAssistantListCell_dotView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____SFBrowsingAssistantListCell_menuButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____SFBrowsingAssistantListCell_popUpMenu));
  sub_18C687DD0((uint64_t)self + OBJC_IVAR____SFBrowsingAssistantListCell_iconAccessory);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____SFBrowsingAssistantListCell_iconView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____SFBrowsingAssistantListCell_icon);
}

@end