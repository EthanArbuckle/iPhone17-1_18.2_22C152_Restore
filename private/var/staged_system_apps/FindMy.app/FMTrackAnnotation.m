@interface FMTrackAnnotation
@end

@implementation FMTrackAnnotation

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC6FindMy17FMTrackAnnotation_timestamp;
  uint64_t v4 = type metadata accessor for Date();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end