@interface SBKeyboardClientSettingObserverContext
- (void)setOldClientSettings:(uint64_t)a1;
- (void)setScene:(uint64_t)a1;
@end

@implementation SBKeyboardClientSettingObserverContext

- (void)setOldClientSettings:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)setScene:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_oldClientSettings, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end