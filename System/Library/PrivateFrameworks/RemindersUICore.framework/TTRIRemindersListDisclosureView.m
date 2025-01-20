@interface TTRIRemindersListDisclosureView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (UIColor)tintColor;
- (_TtC15RemindersUICore31TTRIRemindersListDisclosureView)init;
- (_TtC15RemindersUICore31TTRIRemindersListDisclosureView)initWithArrangedSubviews:(id)a3;
- (_TtC15RemindersUICore31TTRIRemindersListDisclosureView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore31TTRIRemindersListDisclosureView)initWithFrame:(CGRect)a3;
- (void)buttonShapesSettingDidChange;
- (void)dealloc;
- (void)setTintColor:(id)a3;
- (void)subtaskDisclosureButtonAction:(id)a3;
@end

@implementation TTRIRemindersListDisclosureView

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = [(TTRIRemindersListDisclosureView *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v14.receiver = self;
  v14.super_class = ObjectType;
  id v6 = a3;
  v7 = self;
  [(TTRIRemindersListDisclosureView *)&v14 setTintColor:v6];
  v8 = *(Class *)((char *)&v7->super.super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListDisclosureView_collapsed);
  v13.receiver = v7;
  v13.super_class = ObjectType;
  v9 = [(TTRIRemindersListDisclosureView *)&v13 tintColor];
  objc_msgSend(v8, sel_setTintColor_, v9);

  v10 = *(Class *)((char *)&v7->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListDisclosureView_expanded);
  v12.receiver = v7;
  v12.super_class = ObjectType;
  v11 = [(TTRIRemindersListDisclosureView *)&v12 tintColor];
  objc_msgSend(v10, sel_setTintColor_, v11);
}

- (_TtC15RemindersUICore31TTRIRemindersListDisclosureView)init
{
  return (_TtC15RemindersUICore31TTRIRemindersListDisclosureView *)TTRIRemindersListDisclosureView.init()();
}

- (_TtC15RemindersUICore31TTRIRemindersListDisclosureView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s15RemindersUICore31TTRIRemindersListDisclosureViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  objc_super v4 = self;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_defaultCenter);
  objc_msgSend(v6, sel_removeObserver_name_object_, v5, *MEMORY[0x1E4FB2428], 0);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(NUIContainerBoxView *)&v7 dealloc];
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListDisclosureView_actionDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListDisclosureView_collapsed));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListDisclosureView_expanded));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListDisclosureView_imageConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListDisclosureView_cachedCollapsedImage));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListDisclosureView_cachedExpandedImage);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  objc_super v4 = (objc_class *)a4;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v11.value.super.isa = v4;
  LOBYTE(v4) = NUIContainerView.ttr_pointIncludingExpandedHitTestInsets(inside:with:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v11);

  return v4 & 1;
}

- (void)subtaskDisclosureButtonAction:(id)a3
{
  if (a3)
  {
    objc_super v4 = self;
    swift_unknownObjectRetain();
    sub_1B9970200();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v5 = self;
  }
  id v6 = (char *)self + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListDisclosureView_actionDelegate;
  swift_beginAccess();
  if (MEMORY[0x1BA9DB180](v6))
  {
    uint64_t v7 = *((void *)v6 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(_TtC15RemindersUICore31TTRIRemindersListDisclosureView *, uint64_t, uint64_t))(v7 + 8))(self, ObjectType, v7);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  sub_1B922A57C((uint64_t)v9);
}

- (void)buttonShapesSettingDidChange
{
  v2 = self;
  sub_1B93DA43C();
}

- (_TtC15RemindersUICore31TTRIRemindersListDisclosureView)initWithFrame:(CGRect)a3
{
  result = (_TtC15RemindersUICore31TTRIRemindersListDisclosureView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore31TTRIRemindersListDisclosureView)initWithArrangedSubviews:(id)a3
{
  result = (_TtC15RemindersUICore31TTRIRemindersListDisclosureView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end