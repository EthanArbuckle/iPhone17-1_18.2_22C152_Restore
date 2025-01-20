@interface RUISwiftUITableViewRow
- (BOOL)isSelected;
- (RUIXMLElement)xmlElement;
- (_TtC8RemoteUI22RUISwiftUITableViewRow)init;
- (_TtC8RemoteUI22RUISwiftUITableViewRow)initWithAttributes:(id)a3 parent:(id)a4;
- (id)tableCell;
- (void)didBecomeDeselected;
- (void)didBecomeSelected;
- (void)populatePostbackDictionary:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setXmlElement:(id)a3;
@end

@implementation RUISwiftUITableViewRow

- (RUIXMLElement)xmlElement
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8RemoteUI22RUISwiftUITableViewRow_xmlElement);
  swift_beginAccess();
  return (RUIXMLElement *)*v2;
}

- (void)setXmlElement:(id)a3
{
  v4 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8RemoteUI22RUISwiftUITableViewRow_xmlElement);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RUISwiftUITableViewRow();
  return [(RUITableViewRow *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780E780);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (uint64_t *)((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = (objc_class *)type metadata accessor for RUISwiftUITableViewRow();
  v14.receiver = self;
  v14.super_class = v8;
  v9 = self;
  [(RUITableViewRow *)&v14 setSelected:v3];
  uint64_t v10 = swift_allocObject();
  *(unsigned char *)(v10 + 16) = v3;
  uint64_t *v7 = v10;
  uint64_t v11 = *MEMORY[0x263F513F0];
  uint64_t v12 = sub_214602328();
  uint64_t v13 = *(void *)(v12 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v13 + 104))(v7, v11, v12);
  (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v13 + 56))(v7, 0, 1, v12);
  sub_214602388();
}

- (_TtC8RemoteUI22RUISwiftUITableViewRow)init
{
  return (_TtC8RemoteUI22RUISwiftUITableViewRow *)RUISwiftUITableViewRow.init()();
}

- (_TtC8RemoteUI22RUISwiftUITableViewRow)initWithAttributes:(id)a3 parent:(id)a4
{
  if (a3) {
    uint64_t v5 = sub_214602E08();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = a4;
  return (_TtC8RemoteUI22RUISwiftUITableViewRow *)RUISwiftUITableViewRow.init(attributes:parent:)(v5, a4);
}

- (id)tableCell
{
  v2 = self;
  id v3 = sub_21459F6D8();

  return v3;
}

- (void)didBecomeSelected
{
}

- (void)didBecomeDeselected
{
}

- (void)populatePostbackDictionary:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_21459FC78(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RemoteUI22RUISwiftUITableViewRow_xmlElement));

  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RemoteUI22RUISwiftUITableViewRow____lazy_storage___contentRegistry));
  swift_release();
  swift_release();
}

@end