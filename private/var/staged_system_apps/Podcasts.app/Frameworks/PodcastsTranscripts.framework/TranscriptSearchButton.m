@interface TranscriptSearchButton
- (_TtC19PodcastsTranscripts22TranscriptSearchButton)initWithCoder:(id)a3;
- (_TtC19PodcastsTranscripts22TranscriptSearchButton)initWithFrame:(CGRect)a3;
@end

@implementation TranscriptSearchButton

- (_TtC19PodcastsTranscripts22TranscriptSearchButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_99050);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15.receiver = self;
  v15.super_class = ObjectType;
  v12 = -[TranscriptSearchButton initWithFrame:](&v15, "initWithFrame:", x, y, width, height);
  sub_2A6EC((uint64_t)v11);
  uint64_t v13 = sub_76F50();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 0, 1, v13);
  sub_76F60();
  sub_2A4C0();

  return v12;
}

- (_TtC19PodcastsTranscripts22TranscriptSearchButton)initWithCoder:(id)a3
{
  result = (_TtC19PodcastsTranscripts22TranscriptSearchButton *)sub_77160();
  __break(1u);
  return result;
}

@end