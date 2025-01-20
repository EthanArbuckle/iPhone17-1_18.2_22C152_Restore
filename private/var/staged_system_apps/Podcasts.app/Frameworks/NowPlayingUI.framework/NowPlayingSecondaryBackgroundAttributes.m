@interface NowPlayingSecondaryBackgroundAttributes
- (_TtC12NowPlayingUI39NowPlayingSecondaryBackgroundAttributes)init;
@end

@implementation NowPlayingSecondaryBackgroundAttributes

- (_TtC12NowPlayingUI39NowPlayingSecondaryBackgroundAttributes)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI39NowPlayingSecondaryBackgroundAttributes_backgroundColor) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(NowPlayingSecondaryBackgroundAttributes *)&v5 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI39NowPlayingSecondaryBackgroundAttributes_backgroundColor));
}

@end