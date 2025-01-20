@interface TVFocusableCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC9SeymourUI29TVFocusableCollectionViewCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI29TVFocusableCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)prepareForReuse;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation TVFocusableCollectionViewCell

- (BOOL)canBecomeFocused
{
  return (*((unsigned char *)&self->super.super.super.super.super.isa
          + OBJC_IVAR____TtC9SeymourUI29TVFocusableCollectionViewCell_underlyingControlState) & 2) == 0;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TVFocusableCollectionViewCell();
  v2 = v3.receiver;
  [(TVFocusableCollectionViewCell *)&v3 prepareForReuse];
  (*(void (**)(void, void))((*MEMORY[0x263F8EED0] & *v2) + 0x80))(0, 0);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  sub_239C24FF0(0, &qword_268A102C8);
  sub_239DA29C0((unint64_t *)&qword_268A10A40, &qword_268A102C8);
  uint64_t v6 = sub_23A7FFF58();
  id v7 = a4;
  v8 = self;
  if (sub_23A065CBC(v6)
    && (uint64_t v9 = *(uint64_t *)((char *)&v8->super.super.super.super.super.isa
                        + OBJC_IVAR____TtC9SeymourUI29TVFocusableCollectionViewCell_underlyingControlState),
        (v9 & 8) != 0))
  {
    (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & (uint64_t)v8->super.super.super.super.super.isa)
                                             + 0x80))(v9 | 1, 1);

    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = (void *)sub_23A7FFF48();
    v11.receiver = v8;
    v11.super_class = (Class)type metadata accessor for TVFocusableCollectionViewCell();
    [(TVFocusableCollectionViewCell *)&v11 pressesBegan:v10 withEvent:v7];

    swift_bridgeObjectRelease();
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_23A238EE0(v6, v7);
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  id v7 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.super.super.isa) + 0x78))();
  id v8 = a4;
  uint64_t v9 = self;
  id v10 = objc_msgSend(v7, sel__preferredConfigurationForFocusAnimation_inContext_, a3, v8);

  return v10;
}

- (_TtC9SeymourUI29TVFocusableCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI29TVFocusableCollectionViewCell_underlyingControlState) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TVFocusableCollectionViewCell();
  return -[TVFocusableCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SeymourUI29TVFocusableCollectionViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI29TVFocusableCollectionViewCell_underlyingControlState) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVFocusableCollectionViewCell();
  return [(TVFocusableCollectionViewCell *)&v5 initWithCoder:a3];
}

@end