@interface OntologyGraphCompatible
- (BOOL)isDescendentWithDescendent:(id)a3 ancestor:(id)a4;
- (_TtC18VisualIntelligence23OntologyGraphCompatible)init;
- (id)findLeastCommonAncestorWithNode1:(id)a3 node2:(id)a4;
- (id)ontologyNodeWithKnowledgeGraphID:(id)a3;
- (unint64_t)count;
@end

@implementation OntologyGraphCompatible

- (BOOL)isDescendentWithDescendent:(id)a3 ancestor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1DCF34B4C(v6, v7);

  return v9 & 1;
}

- (id)ontologyNodeWithKnowledgeGraphID:(id)a3
{
  uint64_t v4 = sub_1DD048408();
  uint64_t v6 = v5;
  id v7 = self;
  id v8 = sub_1DCF34D0C(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (unint64_t)count
{
  return (*(void **)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18VisualIntelligence23OntologyGraphCompatible_ontologyGraph))[2];
}

- (id)findLeastCommonAncestorWithNode1:(id)a3 node2:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = sub_1DCF34EF4(v6, v7);

  return v9;
}

- (_TtC18VisualIntelligence23OntologyGraphCompatible)init
{
  result = (_TtC18VisualIntelligence23OntologyGraphCompatible *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end