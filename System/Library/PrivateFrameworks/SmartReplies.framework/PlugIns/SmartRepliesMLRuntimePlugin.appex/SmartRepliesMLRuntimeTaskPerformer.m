@interface SmartRepliesMLRuntimeTaskPerformer
- (_TtC27SmartRepliesMLRuntimePlugin34SmartRepliesMLRuntimeTaskPerformer)init;
- (id)performTask:(id)a3 error:(id *)a4;
@end

@implementation SmartRepliesMLRuntimeTaskPerformer

- (_TtC27SmartRepliesMLRuntimePlugin34SmartRepliesMLRuntimeTaskPerformer)init
{
  return (_TtC27SmartRepliesMLRuntimePlugin34SmartRepliesMLRuntimeTaskPerformer *)sub_100009B88();
}

- (id)performTask:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = SmartRepliesMLRuntimeTaskPerformer.perform(_:)(v5);

  return v7;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27SmartRepliesMLRuntimePlugin34SmartRepliesMLRuntimeTaskPerformer____lazy_storage___imageCaptioner));
  swift_release();
  sub_10000B9B0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC27SmartRepliesMLRuntimePlugin34SmartRepliesMLRuntimeTaskPerformer____lazy_storage___uninterestingPhraseResolver));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC27SmartRepliesMLRuntimePlugin34SmartRepliesMLRuntimeTaskPerformer_latestImage);
}

@end