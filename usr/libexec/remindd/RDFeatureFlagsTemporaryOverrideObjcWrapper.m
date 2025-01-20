@interface RDFeatureFlagsTemporaryOverrideObjcWrapper
- (_TtC7remindd42RDFeatureFlagsTemporaryOverrideObjcWrapper)init;
- (void)finish;
@end

@implementation RDFeatureFlagsTemporaryOverrideObjcWrapper

- (void)finish
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd42RDFeatureFlagsTemporaryOverrideObjcWrapper_backing);
  swift_getObjectType();
  v4 = self;
  id v5 = v3;
  dispatch thunk of REMFeatureFlagsTemporaryOverride.finish()();
}

- (_TtC7remindd42RDFeatureFlagsTemporaryOverrideObjcWrapper)init
{
  result = (_TtC7remindd42RDFeatureFlagsTemporaryOverrideObjcWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7remindd42RDFeatureFlagsTemporaryOverrideObjcWrapper_backing));
}

@end