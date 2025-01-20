@interface FixedHeaderOBWelcomeController
- (_TtC13FindMyAppCoreP33_DB2C930DAA579D7B94A7199D42D47C9230FixedHeaderOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC13FindMyAppCoreP33_DB2C930DAA579D7B94A7199D42D47C9230FixedHeaderOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (double)_contentViewHeight;
@end

@implementation FixedHeaderOBWelcomeController

- (double)_contentViewHeight
{
  sub_C06E8();
  sub_C06D8();
  sub_C06B8();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_65328();
  double v5 = v4;
  swift_release();

  return v5;
}

- (_TtC13FindMyAppCoreP33_DB2C930DAA579D7B94A7199D42D47C9230FixedHeaderOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  sub_C06E8();
  sub_C06D8();
  sub_C06B8();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v9 = sub_C05A8();
  uint64_t v11 = v10;
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a5) {
      goto LABEL_5;
    }
LABEL_7:
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    goto LABEL_8;
  }
  a4 = (id)sub_C05A8();
  uint64_t v13 = v12;
  if (!a5) {
    goto LABEL_7;
  }
LABEL_5:
  uint64_t v14 = sub_C05A8();
  uint64_t v16 = v15;
LABEL_8:
  v17 = (_TtC13FindMyAppCoreP33_DB2C930DAA579D7B94A7199D42D47C9230FixedHeaderOBWelcomeController *)sub_65584(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  swift_release();
  return v17;
}

- (_TtC13FindMyAppCoreP33_DB2C930DAA579D7B94A7199D42D47C9230FixedHeaderOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  sub_C06E8();
  sub_C06D8();
  sub_C06B8();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_C05A8();
  if (a4)
  {
    sub_C05A8();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v11 = 0;
  }
  *(void *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC13FindMyAppCoreP33_DB2C930DAA579D7B94A7199D42D47C9230FixedHeaderOBWelcomeController_maximumCompactAspectRatio] = 0x3FEB333333333333;
  id v12 = a5;
  NSString v13 = sub_C0588();
  swift_bridgeObjectRelease();
  if (v11)
  {
    NSString v14 = sub_C0588();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v14 = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for FixedHeaderOBWelcomeController();
  uint64_t v15 = [(FixedHeaderOBWelcomeController *)&v17 initWithTitle:v13 detailText:v14 icon:v12 contentLayout:a6];
  swift_release();

  return v15;
}

@end