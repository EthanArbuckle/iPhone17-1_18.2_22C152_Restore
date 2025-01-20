@interface TempProvider
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (OS_dispatch_queue)dispatchQueue;
- (_TtC17proximitycontrold12TempProvider)init;
- (_TtC17proximitycontrold12TempProvider)initWithCoder:(id)a3;
- (id)displayContextHandler;
- (id)progressEventHandler;
- (void)receiveEvent:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDisplayContextHandler:(id)a3;
- (void)setProgressEventHandler:(id)a3;
@end

@implementation TempProvider

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC17proximitycontrold12TempProvider_dispatchQueue));
}

- (void)setDispatchQueue:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17proximitycontrold12TempProvider_dispatchQueue);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17proximitycontrold12TempProvider_dispatchQueue) = (Class)a3;
  id v3 = a3;
}

- (id)displayContextHandler
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17proximitycontrold12TempProvider_displayContextHandler))
  {
    uint64_t v2 = *(void *)&self->dispatchQueue[OBJC_IVAR____TtC17proximitycontrold12TempProvider_displayContextHandler];
    v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17proximitycontrold12TempProvider_displayContextHandler);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_100267BF8;
    v5[3] = &unk_100337320;
    id v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)setDisplayContextHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_10026839C;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC17proximitycontrold12TempProvider_displayContextHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17proximitycontrold12TempProvider_displayContextHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_10000F088(v8);
}

- (id)progressEventHandler
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17proximitycontrold12TempProvider_progressEventHandler))
  {
    uint64_t v2 = *(void *)&self->dispatchQueue[OBJC_IVAR____TtC17proximitycontrold12TempProvider_progressEventHandler];
    v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17proximitycontrold12TempProvider_progressEventHandler);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_100267BF8;
    v5[3] = &unk_1003372D0;
    id v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)setProgressEventHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_100268370;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC17proximitycontrold12TempProvider_progressEventHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17proximitycontrold12TempProvider_progressEventHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_10000F088(v8);
}

+ (BOOL)supportsSecureCoding
{
  return byte_100371810;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_100371810 = a3;
}

- (_TtC17proximitycontrold12TempProvider)init
{
  return (_TtC17proximitycontrold12TempProvider *)sub_100267F0C();
}

- (_TtC17proximitycontrold12TempProvider)initWithCoder:(id)a3
{
  return (_TtC17proximitycontrold12TempProvider *)sub_100267F0C();
}

- (void).cxx_destruct
{
  sub_10000F088(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17proximitycontrold12TempProvider_displayContextHandler));
  sub_10000F088(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17proximitycontrold12TempProvider_progressEventHandler));
  sub_10000F088(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17proximitycontrold12TempProvider_proximityEventHandler));

  swift_bridgeObjectRelease();
}

- (void)receiveEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100268114(v4);
}

@end