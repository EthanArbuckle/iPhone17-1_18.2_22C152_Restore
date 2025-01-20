@interface StringTextRange
- (NSString)description;
- (UITextPosition)end;
- (UITextPosition)start;
- (_TtC19PodcastsTranscripts15StringTextRange)init;
@end

@implementation StringTextRange

- (UITextPosition)start
{
  return (UITextPosition *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                   + OBJC_IVAR____TtC19PodcastsTranscripts15StringTextRange_startPosition));
}

- (UITextPosition)end
{
  return (UITextPosition *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                   + OBJC_IVAR____TtC19PodcastsTranscripts15StringTextRange_endPosition));
}

- (NSString)description
{
  v2 = self;
  sub_4B538();

  NSString v3 = sub_768D0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC19PodcastsTranscripts15StringTextRange)init
{
  result = (_TtC19PodcastsTranscripts15StringTextRange *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC19PodcastsTranscripts15StringTextRange_startPosition));
  NSString v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC19PodcastsTranscripts15StringTextRange_endPosition);
}

@end