@interface TTRIQuickBarInputAccessoryView
- (CGRect)bounds;
- (CGSize)intrinsicContentSize;
- (NSString)accessibilityLabel;
- (_TtC15RemindersUICore30TTRIQuickBarInputAccessoryView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore30TTRIQuickBarInputAccessoryView)initWithFrame:(CGRect)a3;
- (int64_t)accessibilityContainerType;
- (void)setBounds:(CGRect)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation TTRIQuickBarInputAccessoryView

- (_TtC15RemindersUICore30TTRIQuickBarInputAccessoryView)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC15RemindersUICore30TTRIQuickBarInputAccessoryView_cachedQuickBarFittingSize;
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  v4[16] = 1;
  id v5 = a3;

  result = (_TtC15RemindersUICore30TTRIQuickBarInputAccessoryView *)sub_1B99708A0();
  __break(1u);
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = (char *)v7.receiver;
  [(TTRIQuickBarInputAccessoryView *)&v7 willMoveToWindow:v4];
  v6 = &v5[OBJC_IVAR____TtC15RemindersUICore30TTRIQuickBarInputAccessoryView_cachedQuickBarFittingSize];
  *(void *)v6 = 0;
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  objc_msgSend(v5, sel_invalidateIntrinsicContentSize, v7.receiver, v7.super_class);
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_1B933940C();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGRect)bounds
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  [(TTRIQuickBarInputAccessoryView *)&v6 bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = self;
  v15.origin.double x = x;
  v15.origin.double y = y;
  v15.size.double width = width;
  v15.size.double height = height;
  double v10 = CGRectGetWidth(v15);
  v14.receiver = v9;
  v14.super_class = ObjectType;
  [(TTRIQuickBarInputAccessoryView *)&v14 bounds];
  double v11 = CGRectGetWidth(v16);
  v13.receiver = v9;
  v13.super_class = ObjectType;
  -[TTRIQuickBarInputAccessoryView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (v10 != v11)
  {
    v12 = (char *)v9 + OBJC_IVAR____TtC15RemindersUICore30TTRIQuickBarInputAccessoryView_cachedQuickBarFittingSize;
    *(void *)v12 = 0;
    *((void *)v12 + 1) = 0;
    v12[16] = 1;
    [(TTRIQuickBarInputAccessoryView *)v9 invalidateIntrinsicContentSize];
  }
}

- (NSString)accessibilityLabel
{
  uint64_t v2 = qword_1EB9B6110;
  double v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  sub_1B996A200();

  double v4 = (void *)sub_1B996E9B0();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (_TtC15RemindersUICore30TTRIQuickBarInputAccessoryView)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC15RemindersUICore30TTRIQuickBarInputAccessoryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore30TTRIQuickBarInputAccessoryView_quickBar));
}

@end