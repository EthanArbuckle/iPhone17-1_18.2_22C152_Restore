@interface PGUpNextComputer
- (BOOL)enumerateSuggestionsWith:(id)a3 featureWeightVectors:(id)a4 error:(id *)a5 block:(id)a6;
- (_TtC11PhotosGraph16PGUpNextComputer)init;
- (_TtC11PhotosGraph16PGUpNextComputer)initWithTargets:(id)a3;
@end

@implementation PGUpNextComputer

- (_TtC11PhotosGraph16PGUpNextComputer)initWithTargets:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD476E8);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph16PGUpNextComputer_targets) = (Class)sub_1D1EBE1B0();
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(PGUpNextComputer *)&v6 init];
}

- (BOOL)enumerateSuggestionsWith:(id)a3 featureWeightVectors:(id)a4 error:(id *)a5 block:(id)a6
{
  v9 = _Block_copy(a6);
  if (a4)
  {
    sub_1D18E4770();
    a4 = (id)sub_1D1EBE1B0();
  }
  _Block_copy(v9);
  swift_unknownObjectRetain();
  v10 = self;
  sub_1D18E4500((uint64_t)a3, (unint64_t)a4, (int)v10, (unint64_t)v9);
  _Block_release(v9);

  swift_unknownObjectRelease();
  _Block_release(v9);
  swift_bridgeObjectRelease();
  return 1;
}

- (_TtC11PhotosGraph16PGUpNextComputer)init
{
  result = (_TtC11PhotosGraph16PGUpNextComputer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end