@interface GenericContextTransformer
- (_TtC14SiriKitRuntime25GenericContextTransformer)init;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
@end

@implementation GenericContextTransformer

- (_TtC14SiriKitRuntime25GenericContextTransformer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GenericContextTransformer();
  return [(GenericContextTransformer *)&v3 init];
}

- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6
{
  v9 = _Block_copy(a6);
  v10 = (void (*)(void *, id, id))v9[2];
  swift_unknownObjectRetain();
  id v11 = a4;
  v12 = self;
  v10(v9, a3, v11);
  _Block_release(v9);
  swift_unknownObjectRelease();
}

@end