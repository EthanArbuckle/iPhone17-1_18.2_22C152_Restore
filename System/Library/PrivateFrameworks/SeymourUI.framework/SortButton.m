@interface SortButton
- (_TtC9SeymourUI10SortButton)initWithCoder:(id)a3;
- (_TtC9SeymourUI10SortButton)initWithFrame:(CGRect)a3;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
@end

@implementation SortButton

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  sub_239F4A694((uint64_t)v8, (uint64_t)v9, (uint64_t)a5);

  swift_unknownObjectRelease();
}

- (_TtC9SeymourUI10SortButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(void *)((char *)&self->super.super.super.super._responderFlags + OBJC_IVAR____TtC9SeymourUI10SortButton_delegate) = 0;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SortButton();
  return -[SortButton initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SeymourUI10SortButton)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super._responderFlags + OBJC_IVAR____TtC9SeymourUI10SortButton_delegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SortButton();
  return [(SortButton *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end