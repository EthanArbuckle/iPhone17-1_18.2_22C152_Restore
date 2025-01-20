@interface BKViewBookUpdatesOperation
- (BKViewBookUpdatesOperation)init;
- (BKViewBookUpdatesOperation)initWithAdamID:(id)a3 version:(id)a4;
- (NSError)error;
- (NSString)parameters;
- (void)main;
- (void)setError:(id)a3;
- (void)setParameters:(id)a3;
@end

@implementation BKViewBookUpdatesOperation

- (BKViewBookUpdatesOperation)initWithAdamID:(id)a3 version:(id)a4
{
  uint64_t v5 = sub_1007FDC70();
  uint64_t v7 = v6;
  uint64_t v8 = sub_1007FDC70();
  v9 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKViewBookUpdatesOperation_parameters);
  void *v9 = 0;
  v9[1] = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKViewBookUpdatesOperation_error) = 0;
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___BKViewBookUpdatesOperation_adamID);
  uint64_t *v10 = v5;
  v10[1] = v7;
  v11 = (uint64_t *)((char *)self + OBJC_IVAR___BKViewBookUpdatesOperation_version);
  uint64_t *v11 = v8;
  v11[1] = v12;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for ViewBookUpdatesOperation();
  return [(BKViewBookUpdatesOperation *)&v14 init];
}

- (NSString)parameters
{
  v2 = (char *)self + OBJC_IVAR___BKViewBookUpdatesOperation_parameters;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    NSString v3 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setParameters:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1007FDC70();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = (uint64_t *)((char *)self + OBJC_IVAR___BKViewBookUpdatesOperation_parameters);
  swift_beginAccess();
  *uint64_t v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSError)error
{
  v2 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKViewBookUpdatesOperation_error);
  swift_beginAccess();
  if (*v2)
  {
    swift_errorRetain();
    NSString v3 = (void *)sub_1007F27F0();
    swift_errorRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSError *)v3;
}

- (void)setError:(id)a3
{
  uint64_t v4 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___BKViewBookUpdatesOperation_error);
  swift_beginAccess();
  *uint64_t v4 = a3;
  id v5 = a3;
  swift_errorRelease();
}

- (void)main
{
  v2 = self;
  ViewBookUpdatesOperation.main()();
}

- (BKViewBookUpdatesOperation)init
{
  result = (BKViewBookUpdatesOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_errorRelease();
}

@end