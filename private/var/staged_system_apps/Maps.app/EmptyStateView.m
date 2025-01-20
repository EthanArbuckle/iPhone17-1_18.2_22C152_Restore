@interface EmptyStateView
- (NSAttributedString)attributedSubtitle;
- (NSString)disclosureSubtitle;
- (NSString)disclosureTitle;
- (NSString)subtitle;
- (NSString)title;
- (UIButton)button;
- (UIImage)image;
- (_TtC4Maps14EmptyStateView)initWithCoder:(id)a3;
- (_TtC4Maps14EmptyStateView)initWithFrame:(CGRect)a3;
- (id)disclosureAction;
- (void)_pressedDisclosureCell;
- (void)setAttributedSubtitle:(id)a3;
- (void)setButton:(id)a3;
- (void)setDisclosureAction:(id)a3;
- (void)setDisclosureSubtitle:(id)a3;
- (void)setDisclosureTitle:(id)a3;
- (void)setImage:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation EmptyStateView

- (NSString)title
{
  return (NSString *)sub_1002A4E1C((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps14EmptyStateView_titleLabel);
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)sub_1002A4E1C((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps14EmptyStateView_subtitleLabel);
}

- (void)setSubtitle:(id)a3
{
}

- (NSAttributedString)attributedSubtitle
{
  id v2 = [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps14EmptyStateView_subtitleLabel) attributedText];

  return (NSAttributedString *)v2;
}

- (void)setAttributedSubtitle:(id)a3
{
}

- (UIImage)image
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC4Maps14EmptyStateView_image));
}

- (void)setImage:(id)a3
{
}

- (UIButton)button
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC4Maps14EmptyStateView_button));
}

- (void)setButton:(id)a3
{
}

- (NSString)disclosureTitle
{
  return (NSString *)sub_1001C3764((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureTitle);
}

- (void)setDisclosureTitle:(id)a3
{
}

- (NSString)disclosureSubtitle
{
  return (NSString *)sub_1001C3764((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureSubtitle);
}

- (void)setDisclosureSubtitle:(id)a3
{
}

- (id)disclosureAction
{
  if (*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureAction))
  {
    uint64_t v2 = *(void *)&self->titleLabel[OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureAction];
    v5[4] = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureAction);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_10008C380;
    v5[3] = &unk_1012E1510;
    v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setDisclosureAction:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_100135AFC;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureAction);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureAction);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_10006C5D8(v8);
}

- (_TtC4Maps14EmptyStateView)initWithFrame:(CGRect)a3
{
  return (_TtC4Maps14EmptyStateView *)sub_1002A5F08(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC4Maps14EmptyStateView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002A72C4();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureModel;
  uint64_t v4 = type metadata accessor for UIListContentConfiguration();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureAction);

  sub_10006C5D8(v5);
}

- (void)_pressedDisclosureCell
{
  uint64_t v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC4Maps14EmptyStateView_disclosureAction);
  if (v2)
  {
    uint64_t v4 = self;
    uint64_t v3 = sub_1000F4F24((uint64_t)v2);
    v2(v3);
    sub_10006C5D8((uint64_t)v2);
  }
}

@end