@interface DefaultSpamFilterSettingsProvider
- (void)updateExtensions;
@end

@implementation DefaultSpamFilterSettingsProvider

- (void)updateExtensions
{
  swift_getKeyPath();
  sub_1E4E07524(&qword_1EAE98110, (void (*)(uint64_t))type metadata accessor for DefaultSpamFilterSettingsProvider);
  swift_retain();
  sub_1E4E0C218();
  swift_release();
  v3 = *(void (**)(uint64_t))(**(void **)self->_extensionObserver + 312);
  uint64_t v4 = swift_retain();
  v3(v4);
  swift_release();
  swift_release();
}

@end