@interface PersistedTranslation
- (PersistedTranslation)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (double)ttsPlaybackRateDouble;
- (void).cxx_construct;
- (void)setTtsPlaybackRateDouble:(double)a3;
@end

@implementation PersistedTranslation

- (double)ttsPlaybackRateDouble
{
  v2 = (double *)((char *)self + OBJC_IVAR___PersistedTranslation_ttsPlaybackRateDouble);
  swift_beginAccess();
  return *v2;
}

- (void)setTtsPlaybackRateDouble:(double)a3
{
  v5 = (double *)((char *)self + OBJC_IVAR___PersistedTranslation_ttsPlaybackRateDouble);
  swift_beginAccess();
  double *v5 = a3;
  v6 = self;
  sub_2603135B8();
  sub_260313468();

  swift_release();
}

- (PersistedTranslation)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PersistedTranslation();
  return [(PersistedTranslation *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

- (void).cxx_construct
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PersistedTranslation_ttsPlaybackRateDouble) = (Class)0x3FF0000000000000;
  v2 = (char *)self + OBJC_IVAR___PersistedTranslation_selfLoggingInvocationId;
  uint64_t v3 = sub_260313368();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
}

- (void).cxx_destruct
{
}

@end