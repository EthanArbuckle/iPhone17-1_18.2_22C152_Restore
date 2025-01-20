@interface ActivityEventResolver
- (ActivityEventResolver)init;
- (ActivityEventResolver)initWithObject:(id)a3 error:(id *)a4;
@end

@implementation ActivityEventResolver

- (ActivityEventResolver)initWithObject:(id)a3 error:(id *)a4
{
  id v5 = a3;
  return (ActivityEventResolver *)ActivityEventResolver.init(object:)(a3);
}

- (ActivityEventResolver)init
{
  result = (ActivityEventResolver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ActivityEventResolver_context);
}

@end