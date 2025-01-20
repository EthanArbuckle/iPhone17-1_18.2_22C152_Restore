@interface BECustomViewMenuEditDelegate
- (_TtC8BookCore28BECustomViewMenuEditDelegate)init;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5;
@end

@implementation BECustomViewMenuEditDelegate

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  Class v10 = sub_1D8110();

  return v10;
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v12 = a4;
  swift_unknownObjectRetain();
  id v8 = self;
  id v9 = [v7 view];
  if (v9)
  {
    Class v10 = v9;
    [v9 removeInteraction:v7];
    v11 = *(_TtC8BookCore28BECustomViewMenuEditDelegate **)((char *)&v8->super.isa
                                                          + OBJC_IVAR____TtC8BookCore28BECustomViewMenuEditDelegate_interaction);
    *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC8BookCore28BECustomViewMenuEditDelegate_interaction) = 0;
    swift_unknownObjectRelease();

    id v8 = v11;
  }
  else
  {
    swift_unknownObjectRelease();
  }
}

- (_TtC8BookCore28BECustomViewMenuEditDelegate)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8BookCore28BECustomViewMenuEditDelegate_interaction) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BECustomViewMenuEditDelegate();
  return [(BECustomViewMenuEditDelegate *)&v3 init];
}

- (void).cxx_destruct
{
}

@end