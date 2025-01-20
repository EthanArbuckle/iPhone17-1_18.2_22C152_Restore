@interface TTRILabeledIconCell
- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5;
- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5;
- (_TtC15RemindersUICore19TTRILabeledIconCell)initWithArrangedSubviews:(id)a3;
- (_TtC15RemindersUICore19TTRILabeledIconCell)initWithCoder:(id)a3;
- (_TtC15RemindersUICore19TTRILabeledIconCell)initWithFrame:(CGRect)a3;
- (void)buttonAction:(id)a3;
- (void)containerViewDidLayoutArrangedSubviews:(id)a3;
- (void)tintColorDidChange;
@end

@implementation TTRILabeledIconCell

- (_TtC15RemindersUICore19TTRILabeledIconCell)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_cellDelegate) = 0;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_isSelected) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_isDebugTitleFramesEnabled) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_selectionView) = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_debugViews);
  void *v5 = 0;
  v5[1] = 0;
  id v6 = a3;

  result = (_TtC15RemindersUICore19TTRILabeledIconCell *)sub_1B99708A0();
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_1B92A5FD0();
}

- (void)buttonAction:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B9970200();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  if (MEMORY[0x1BA9DB180]((char *)self + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_cellDelegate))
  {
    sub_1B92A5A24(*(unint64_t *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_index));

    swift_unknownObjectRelease();
  }
  else
  {
  }
  sub_1B922A57C((uint64_t)v6);
}

- (_TtC15RemindersUICore19TTRILabeledIconCell)initWithFrame:(CGRect)a3
{
  result = (_TtC15RemindersUICore19TTRILabeledIconCell *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore19TTRILabeledIconCell)initWithArrangedSubviews:(id)a3
{
  result = (_TtC15RemindersUICore19TTRILabeledIconCell *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_cellDelegate);
  sub_1B913A12C((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_button));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_titleFont));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_selectionView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_debugViews);
  v4 = *(void **)((char *)&self->super.super.super.super._responderFlags
                + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_debugViews);

  sub_1B91109DC(v3, v4);
}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  id v7 = a3;
  v8 = (char *)a5;
  v9 = self;
  sub_1B92A6FE0(v8);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  double v13 = self;
  sub_1B92A7104((uint64_t)v12, x, y, width, height);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B92A7480();
}

@end