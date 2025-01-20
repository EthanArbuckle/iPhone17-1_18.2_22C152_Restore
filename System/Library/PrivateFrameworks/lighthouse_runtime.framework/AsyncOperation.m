@interface AsyncOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (_TtC18lighthouse_runtime14AsyncOperation)init;
- (void)cancel;
- (void)dealloc;
- (void)main;
- (void)setExecuting:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)start;
@end

@implementation AsyncOperation

- (void)dealloc
{
  if (*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_task))
  {
    v3 = self;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A994FF8);
    sub_262BE4BA0();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AsyncOperation();
  [(AsyncOperation *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_error);
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  return sub_262BE2014(self);
}

- (void)setExecuting:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_262BE21A4(v3, 0x7475636578457369, 0xEB00000000676E69, (uint64_t)sub_262BE3624);
}

- (BOOL)isFinished
{
  return sub_262BE2014(self);
}

- (void)setFinished:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_262BE21A4(v3, 0x6873696E69467369, 0xEA00000000006465, (uint64_t)sub_262BE360C);
}

- (void)start
{
  v2 = self;
  if ([(AsyncOperation *)v2 isCancelled])
  {
    [(AsyncOperation *)v2 setExecuting:0];
    [(AsyncOperation *)v2 setFinished:1];
  }
  else
  {
    [(AsyncOperation *)v2 setFinished:0];
    [(AsyncOperation *)v2 setExecuting:1];
    [(AsyncOperation *)v2 main];
  }
}

- (void)main
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A995008);
  MEMORY[0x270FA5388](v3 - 8, v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_262BE4B80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v8;
  v10 = self;
  uint64_t v11 = sub_262BE2BD0((uint64_t)v6, (uint64_t)&unk_26A9953B0, (uint64_t)v9);
  sub_262BE3490((uint64_t)v6);
  *(Class *)((char *)&v10->super.super.isa + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_task) = (Class)v11;

  swift_release();
}

- (void)cancel
{
  if (*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_task))
  {
    uint64_t v3 = self;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A994FF8);
    sub_262BE4BA0();
    swift_release();
  }
  else
  {
    uint64_t v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AsyncOperation();
  [(AsyncOperation *)&v5 cancel];
}

- (_TtC18lighthouse_runtime14AsyncOperation)init
{
  result = (_TtC18lighthouse_runtime14AsyncOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end