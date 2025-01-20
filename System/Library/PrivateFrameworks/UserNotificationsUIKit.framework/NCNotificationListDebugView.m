@interface NCNotificationListDebugView
+ (BOOL)shouldShow;
- (NCNotificationListDebugView)initWithCoder:(id)a3;
- (NCNotificationListDebugView)initWithFrame:(CGRect)a3;
- (NCNotificationListDebugView)initWithListView:(id)a3;
- (NCNotificationListView)listView;
- (void)dealloc;
- (void)displayRect:(CGRect)a3 withName:(id)a4;
- (void)setListView:(id)a3;
- (void)updateText;
@end

@implementation NCNotificationListDebugView

+ (BOOL)shouldShow
{
  if (qword_1EBA39128 != -1) {
    swift_once();
  }
  if (byte_1EBA39A70 != 1) {
    return 0;
  }
  id v2 = objc_msgSend(self, sel_standardDefaults);
  unsigned __int8 v3 = objc_msgSend(v2, sel_listDebugGuides);

  return v3;
}

- (NCNotificationListDebugView)initWithListView:(id)a3
{
  sub_1D7D48748(a3);
  return result;
}

- (void)dealloc
{
  id v2 = self;
  sub_1D7D497A4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)displayRect:(CGRect)a3 withName:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v9 = sub_1D7D7F790();
  uint64_t v11 = v10;
  v12 = self;
  sub_1D7D49974(v9, v11, x, y, width, height);

  swift_bridgeObjectRelease();
}

- (NCNotificationListDebugView)initWithCoder:(id)a3
{
  id v3 = a3;
  _sSo27NCNotificationListDebugViewC22UserNotificationsUIKitE5coderABSgSo7NSCoderC_tcfc_0();
}

- (NCNotificationListView)listView
{
  id v2 = (void *)MEMORY[0x1D9481D00]((char *)self + OBJC_IVAR___NCNotificationListDebugView_listView, a2);

  return (NCNotificationListView *)v2;
}

- (void)setListView:(id)a3
{
}

- (NCNotificationListDebugView)initWithFrame:(CGRect)a3
{
}

- (void)updateText
{
  id v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCNotificationListDebugView_label);
  id v3 = self;
  id v4 = v2;
  sub_1D7D4A5A8();
  id v5 = (id)sub_1D7D7F760();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setText_, v5);
}

@end