@interface NFAssertPreventBackgroundTagReading
- (BOOL)isEntitled:(id)a3;
- (BOOL)isSupported;
- (void)onAssertWithCompletion:(id)a3;
- (void)onDeassertWithCompletion:(id)a3;
@end

@implementation NFAssertPreventBackgroundTagReading

- (BOOL)isEntitled:(id)a3
{
  v3 = [a3 NF_whitelistChecker];
  unsigned __int8 v4 = [v3 bgTagReadingAssertion];

  return v4;
}

- (BOOL)isSupported
{
  return 1;
}

- (void)onAssertWithCompletion:(id)a3
{
  v3 = (void (**)(id, void))a3;
  uint64_t v4 = +[_NFHardwareManager sharedHardwareManager];
  id v7 = (id)v4;
  if (v4) {
    v5 = *(void **)(v4 + 408);
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  [v6 queueSuspend];

  v3[2](v3, 0);
}

- (void)onDeassertWithCompletion:(id)a3
{
  id v7 = (void (**)(id, void))a3;
  uint64_t v3 = +[_NFHardwareManager sharedHardwareManager];
  uint64_t v4 = (void *)v3;
  if (v3) {
    v5 = *(void **)(v3 + 408);
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  [v6 queueResume];

  if (v7) {
    v7[2](v7, 0);
  }
}

@end