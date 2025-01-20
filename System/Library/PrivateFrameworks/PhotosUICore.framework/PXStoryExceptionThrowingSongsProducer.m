@interface PXStoryExceptionThrowingSongsProducer
- (PXStoryExceptionThrowingSongsProducer)init;
- (id)requestSongsWithOptions:(unint64_t)a3 resultHandler:(id)a4;
- (unint64_t)logContext;
- (void)setLogContext:(unint64_t)a3;
@end

@implementation PXStoryExceptionThrowingSongsProducer

- (id)requestSongsWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  v5 = _Block_copy(a4);
  v6 = self;
  _Block_release(v5);
  sub_1AB23BF3C();
  swift_bridgeObjectRelease();
  id result = (id)sub_1AB23C1FC();
  __break(1u);
  return result;
}

- (unint64_t)logContext
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___PXStoryExceptionThrowingSongsProducer_logContext);
  swift_beginAccess();
  return *v2;
}

- (void)setLogContext:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self + OBJC_IVAR___PXStoryExceptionThrowingSongsProducer_logContext);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (PXStoryExceptionThrowingSongsProducer)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXStoryExceptionThrowingSongsProducer_logContext) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StoryExceptionThrowingSongsProducer();
  return [(PXStoryExceptionThrowingSongsProducer *)&v3 init];
}

@end