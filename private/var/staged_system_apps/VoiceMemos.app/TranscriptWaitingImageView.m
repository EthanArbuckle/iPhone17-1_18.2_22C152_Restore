@interface TranscriptWaitingImageView
- (CGSize)intrinsicContentSize;
- (_TtC10VoiceMemos26TranscriptWaitingImageView)init;
- (_TtC10VoiceMemos26TranscriptWaitingImageView)initWithCoder:(id)a3;
- (_TtC10VoiceMemos26TranscriptWaitingImageView)initWithFrame:(CGRect)a3;
- (_TtC10VoiceMemos26TranscriptWaitingImageView)initWithImage:(id)a3;
- (_TtC10VoiceMemos26TranscriptWaitingImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
@end

@implementation TranscriptWaitingImageView

- (_TtC10VoiceMemos26TranscriptWaitingImageView)init
{
  return (_TtC10VoiceMemos26TranscriptWaitingImageView *)sub_100143C68();
}

- (_TtC10VoiceMemos26TranscriptWaitingImageView)initWithCoder:(id)a3
{
  id v3 = a3;
  _StringGuts.grow(_:)(27);
  swift_bridgeObjectRelease();
  result = (_TtC10VoiceMemos26TranscriptWaitingImageView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  id v3 = [(TranscriptWaitingImageView *)v2 image];
  if (v3)
  {
    v4 = v3;
    [v3 size];
    double v6 = v5;
    [v4 size];

    double v7 = nullsub_9(v6);
    double v9 = v8;
  }
  else
  {
    v14.receiver = v2;
    v14.super_class = (Class)type metadata accessor for TranscriptWaitingImageView();
    [(TranscriptWaitingImageView *)&v14 intrinsicContentSize];
    double v7 = v10;
    double v9 = v11;
  }
  double v12 = v7;
  double v13 = v9;
  result.height = v13;
  result.width = v12;
  return result;
}

- (_TtC10VoiceMemos26TranscriptWaitingImageView)initWithImage:(id)a3
{
  id v3 = a3;
  CGSize result = (_TtC10VoiceMemos26TranscriptWaitingImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10VoiceMemos26TranscriptWaitingImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CGSize result = (_TtC10VoiceMemos26TranscriptWaitingImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10VoiceMemos26TranscriptWaitingImageView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC10VoiceMemos26TranscriptWaitingImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end