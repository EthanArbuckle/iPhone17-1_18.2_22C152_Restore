@interface TranscriptModelBuilder
- (_TtC18PodcastsFoundation22TranscriptModelBuilder)init;
- (void)parser:(id)a3 didEndElementType:(int64_t)a4;
- (void)parser:(id)a3 didStartElementType:(int64_t)a4;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)parser:(id)a3 validationErrorOccurred:(id)a4;
- (void)parserDidEndDocument:(id)a3;
- (void)parserDidStartDocument:(id)a3;
@end

@implementation TranscriptModelBuilder

- (void)parser:(id)a3 didStartElementType:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_1ACB9B6E0(v6, a4);
}

- (void)parser:(id)a3 didEndElementType:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_1ACB9C828(a4);
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  uint64_t v6 = sub_1ACE761B8();
  uint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  sub_1ACB9CA74(v6, v8);

  swift_bridgeObjectRelease();
}

- (void)parserDidStartDocument:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1ACB9CCEC();
}

- (void)parserDidEndDocument:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1ACB9D044();
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  uint64_t v7 = self;
  sub_1ACB9D460(v8);
}

- (void)parser:(id)a3 validationErrorOccurred:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  uint64_t v7 = self;
  sub_1ACB9D960(v8);
}

- (_TtC18PodcastsFoundation22TranscriptModelBuilder)init
{
  return (_TtC18PodcastsFoundation22TranscriptModelBuilder *)TranscriptModelBuilder.init()();
}

- (void).cxx_destruct
{
  sub_1ACB9C7E4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation22TranscriptModelBuilder_currentParagraph), *(void *)&self->currentParagraph[OBJC_IVAR____TtC18PodcastsFoundation22TranscriptModelBuilder_currentParagraph], *(void *)&self->currentParagraph[OBJC_IVAR____TtC18PodcastsFoundation22TranscriptModelBuilder_currentParagraph + 8], *(void *)&self->currentParagraph[OBJC_IVAR____TtC18PodcastsFoundation22TranscriptModelBuilder_currentParagraph+ 16], *(void *)&self->currentParagraph[OBJC_IVAR____TtC18PodcastsFoundation22TranscriptModelBuilder_currentParagraph+ 24]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end