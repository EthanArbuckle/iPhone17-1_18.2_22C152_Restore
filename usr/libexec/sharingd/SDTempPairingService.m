@interface SDTempPairingService
- (void)handleRapportIdentitiesChanged;
@end

@implementation SDTempPairingService

- (void)handleRapportIdentitiesChanged
{
  v2 = *(void **)&self->_anon_0[OBJC_IVAR____TtC16DaemoniOSLibrary20SDTempPairingService_client];
  if (v2)
  {
    swift_retain();
    id v3 = v2;
    sub_100415284((uint64_t)v3);
    swift_release();
  }
}

@end