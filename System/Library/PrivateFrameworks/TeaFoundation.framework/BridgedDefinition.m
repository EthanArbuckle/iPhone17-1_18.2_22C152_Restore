@interface BridgedDefinition
- (_TtC13TeaFoundation17BridgedDefinition)init;
- (id)inScope:(unint64_t)a3;
- (id)withConfiguration:(id)a3;
@end

@implementation BridgedDefinition

- (id)inScope:(unint64_t)a3
{
  v4 = self;
  id v5 = sub_191EAC4E8(a3);

  return v5;
}

- (id)withConfiguration:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  id v7 = sub_191EAC5D8((uint64_t)sub_191EAC904, v5);

  swift_release();

  return v7;
}

- (_TtC13TeaFoundation17BridgedDefinition)init
{
}

- (void).cxx_destruct
{
}

@end