@interface VMRecordingContext
- (BOOL)isActionButtonInitiated;
- (_TtC10VoiceMemos18VMRecordingContext)init;
- (void)setIsActionButtonInitiated:(BOOL)a3;
@end

@implementation VMRecordingContext

- (BOOL)isActionButtonInitiated
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos18VMRecordingContext_isActionButtonInitiated);
}

- (void)setIsActionButtonInitiated:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos18VMRecordingContext_isActionButtonInitiated) = a3;
}

- (_TtC10VoiceMemos18VMRecordingContext)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos18VMRecordingContext_isActionButtonInitiated) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VMRecordingContext();
  return [(VMRecordingContext *)&v3 init];
}

@end