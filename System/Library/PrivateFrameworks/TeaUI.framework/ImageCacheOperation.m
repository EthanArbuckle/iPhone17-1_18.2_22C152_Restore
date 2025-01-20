@interface ImageCacheOperation
- (_TtC5TeaUIP33_2088E17F5F01413CA71FFC03BB03F42919ImageCacheOperation)init;
- (void)main;
@end

@implementation ImageCacheOperation

- (void)main
{
  v2 = self;
  sub_1B5EB3B80();
}

- (_TtC5TeaUIP33_2088E17F5F01413CA71FFC03BB03F42919ImageCacheOperation)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC5TeaUIP33_2088E17F5F01413CA71FFC03BB03F42919ImageCacheOperation_image));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC5TeaUIP33_2088E17F5F01413CA71FFC03BB03F42919ImageCacheOperation_error));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUIP33_2088E17F5F01413CA71FFC03BB03F42919ImageCacheOperation_request);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUIP33_2088E17F5F01413CA71FFC03BB03F42919ImageCacheOperation_downloader);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUIP33_2088E17F5F01413CA71FFC03BB03F42919ImageCacheOperation_processor);
  swift_unknownObjectRelease();
  sub_1B5E3799C(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC5TeaUIP33_2088E17F5F01413CA71FFC03BB03F42919ImageCacheOperation_imageCompletionBlock));
  swift_bridgeObjectRelease();
}

@end