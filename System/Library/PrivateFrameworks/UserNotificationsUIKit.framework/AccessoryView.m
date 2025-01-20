@interface AccessoryView
- (_TtC22UserNotificationsUIKitP33_E56270D007896E6F9A012E31D0F23E8813AccessoryView)initWithCoder:(id)a3;
- (_TtC22UserNotificationsUIKitP33_E56270D007896E6F9A012E31D0F23E8813AccessoryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AccessoryView

- (void)layoutSubviews
{
  v2 = self;
  sub_1D7D4ABA8();
}

- (_TtC22UserNotificationsUIKitP33_E56270D007896E6F9A012E31D0F23E8813AccessoryView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC22UserNotificationsUIKitP33_E56270D007896E6F9A012E31D0F23E8813AccessoryView_label;
  id v9 = objc_allocWithZone((Class)type metadata accessor for DebugLabel());
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);
  uint64_t v11 = OBJC_IVAR____TtC22UserNotificationsUIKitP33_E56270D007896E6F9A012E31D0F23E8813AccessoryView_dashedBorder;
  *(Class *)((char *)&v10->super.super.super.isa + v11) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F39C88]), sel_init);
  *(Class *)((char *)&v10->super.super.super.isa
           + OBJC_IVAR____TtC22UserNotificationsUIKitP33_E56270D007896E6F9A012E31D0F23E8813AccessoryView_borderWidth) = (Class)0x4000000000000000;

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for AccessoryView();
  return -[AccessoryView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
}

- (_TtC22UserNotificationsUIKitP33_E56270D007896E6F9A012E31D0F23E8813AccessoryView)initWithCoder:(id)a3
{
  return (_TtC22UserNotificationsUIKitP33_E56270D007896E6F9A012E31D0F23E8813AccessoryView *)sub_1D7D4B130(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKitP33_E56270D007896E6F9A012E31D0F23E8813AccessoryView_label));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22UserNotificationsUIKitP33_E56270D007896E6F9A012E31D0F23E8813AccessoryView_dashedBorder);
}

@end