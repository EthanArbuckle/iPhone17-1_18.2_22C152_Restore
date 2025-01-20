@interface CNVCardTagInclusionPermissivePolicy
- (BOOL)shouldCaptureUnknownTags;
- (BOOL)shouldParseTag:(id)a3;
- (_TtC5vCard35CNVCardTagInclusionPermissivePolicy)init;
- (void)setShouldCaptureUnknownTags:(BOOL)a3;
@end

@implementation CNVCardTagInclusionPermissivePolicy

- (BOOL)shouldParseTag:(id)a3
{
  return 1;
}

- (BOOL)shouldCaptureUnknownTags
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC5vCard35CNVCardTagInclusionPermissivePolicy_shouldCaptureUnknownTags);
}

- (void)setShouldCaptureUnknownTags:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC5vCard35CNVCardTagInclusionPermissivePolicy_shouldCaptureUnknownTags) = a3;
}

- (_TtC5vCard35CNVCardTagInclusionPermissivePolicy)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC5vCard35CNVCardTagInclusionPermissivePolicy_shouldCaptureUnknownTags) = 1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CNVCardTagInclusionPermissivePolicy();
  return [(CNVCardTagInclusionPermissivePolicy *)&v3 init];
}

@end