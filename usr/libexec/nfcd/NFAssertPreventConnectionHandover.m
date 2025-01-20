@interface NFAssertPreventConnectionHandover
- (BOOL)isEntitled:(id)a3;
- (BOOL)isSupported;
- (void)onAssertWithCompletion:(id)a3;
- (void)onDeassertWithCompletion:(id)a3;
@end

@implementation NFAssertPreventConnectionHandover

- (BOOL)isEntitled:(id)a3
{
  v3 = [a3 NF_whitelistChecker];
  unsigned __int8 v4 = [v3 chAssertion];

  return v4;
}

- (BOOL)isSupported
{
  return 1;
}

- (void)onAssertWithCompletion:(id)a3
{
  unsigned __int8 v4 = (void (**)(id, void))a3;
  uint64_t v5 = +[_NFHardwareManager sharedHardwareManager];
  id v9 = (id)v5;
  if (v5) {
    v6 = *(void **)(v5 + 408);
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  [v7 queueSuspend];

  if (self) {
    clientInfo = self->_clientInfo;
  }
  else {
    clientInfo = 0;
  }
  sub_100180030((uint64_t)v9, clientInfo);
  v4[2](v4, 0);
}

- (void)onDeassertWithCompletion:(id)a3
{
  id v9 = (void (**)(id, void))a3;
  uint64_t v4 = +[_NFHardwareManager sharedHardwareManager];
  uint64_t v5 = (void *)v4;
  if (v4) {
    v6 = *(void **)(v4 + 408);
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  [v7 queueResume];

  if (self) {
    clientInfo = self->_clientInfo;
  }
  else {
    clientInfo = 0;
  }
  sub_100180404((uint64_t)v5, clientInfo);
  if (v9) {
    v9[2](v9, 0);
  }
}

- (void).cxx_destruct
{
}

@end