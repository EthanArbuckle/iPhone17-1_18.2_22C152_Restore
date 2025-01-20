@interface TTRIAccountsListsCellAccessoryView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)result;
- (_TtC9Reminders34TTRIAccountsListsCellAccessoryView)initWithCoder:(id)a3;
- (_TtC9Reminders34TTRIAccountsListsCellAccessoryView)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)_didInvalidateIntrinsicContentSize;
- (void)buttonShapesSettingDidChange;
- (void)dealloc;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)sizeToFit;
@end

@implementation TTRIAccountsListsCellAccessoryView

- (void)_didInvalidateIntrinsicContentSize
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = (char *)v6.receiver;
  [(TTRIAccountsListsCellAccessoryView *)&v6 _didInvalidateIntrinsicContentSize];
  v3 = &v2[OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView_layoutDelegate];
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v4 = *((void *)v3 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 8))(v2, ObjectType, v4);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (_TtC9Reminders34TTRIAccountsListsCellAccessoryView)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders34TTRIAccountsListsCellAccessoryView *)sub_100036A34(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView_gridView);
  if (v3) {
    [v3 effectiveLayoutSizeFittingSize:result.width, result.height];
  }
  else {
    __break(1u);
  }
  return result;
}

- (_TtC9Reminders34TTRIAccountsListsCellAccessoryView)initWithCoder:(id)a3
{
  return (_TtC9Reminders34TTRIAccountsListsCellAccessoryView *)sub_1004E3E78(a3);
}

- (void)sizeToFit
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView_gridView);
  if (v2)
  {
    v3 = self;
    [v2 intrinsicContentSize];
    [(TTRIAccountsListsCellAccessoryView *)v3 frame];
    -[TTRIAccountsListsCellAccessoryView setFrame:](v3, "setFrame:");
  }
  else
  {
    __break(1u);
  }
}

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView_gridView);
  if (v2) {
    [v2 intrinsicContentSize];
  }
  else {
    __break(1u);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)dealloc
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v6[3] = ObjectType;
  v6[0] = self;
  double v4 = self;
  static UIAccessibility.removeButtonShapesStatusChangeObserver(_:)();
  sub_100038CD8((uint64_t)v6);
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(TTRIAccountsListsCellAccessoryView *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView_preferredTintColor));
  sub_1000499D4((uint64_t)self + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView_layoutDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView_gridView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView_countLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView_disclosureImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView____lazy_storage___chevronFont));
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView____lazy_storage___chevronConfiguration);
}

- (void)buttonShapesSettingDidChange
{
  v2 = self;
  sub_100036FFC();
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v2 = v7.receiver;
  unint64_t v3 = [(TTRIAccountsListsCellAccessoryView *)&v7 accessibilityTraits];
  UIAccessibilityTraits v4 = UIAccessibilityTraitHeader;

  uint64_t v5 = -1;
  if ((v4 & v3) != 0) {
    uint64_t v5 = ~v4;
  }
  return v5 & v3;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(TTRIAccountsListsCellAccessoryView *)&v4 setAccessibilityTraits:a3];
}

@end