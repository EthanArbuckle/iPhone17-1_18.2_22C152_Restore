@interface MyLibraryEntryCell
- (_TtC9SeymourUI18MyLibraryEntryCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI18MyLibraryEntryCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation MyLibraryEntryCell

- (_TtC9SeymourUI18MyLibraryEntryCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI18MyLibraryEntryCell *)sub_23A368478(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI18MyLibraryEntryCell)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super.super._responderFlags
            + OBJC_IVAR____TtC9SeymourUI18MyLibraryEntryCell_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI18MyLibraryEntryCell_itemInfo;
  uint64_t v6 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC9SeymourUI18MyLibraryEntryCell *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (objc_class *)type metadata accessor for MyLibraryEntryCell();
  v11.receiver = self;
  v11.super_class = v6;
  id v7 = self;
  [(MyLibraryEntryCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI18MyLibraryEntryCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18MyLibraryEntryCell_delegate);
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI18MyLibraryEntryCell_itemInfo;

  sub_239C752B4((uint64_t)v3);
}

@end