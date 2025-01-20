@interface SUSUIFakeSUAutoInstallOperation
- (BOOL)isCanceled;
- (BOOL)isExpired;
- (id)forecast;
- (id)id;
- (void)cancel;
@end

@implementation SUSUIFakeSUAutoInstallOperation

- (id)forecast
{
  v2 = objc_alloc_init(SUSUIFakeSUAutoInstallForecast);

  return v2;
}

- (id)id
{
  if (!self->_uuid)
  {
    v2 = (NSUUID *)(id)[MEMORY[0x263F08C38] UUID];
    uuid = self->_uuid;
    self->_uuid = v2;
  }
  v4 = self->_uuid;

  return v4;
}

- (BOOL)isExpired
{
  return 0;
}

- (void)cancel
{
  self->_cancelled = 1;
}

- (BOOL)isCanceled
{
  return self->_cancelled;
}

- (void).cxx_destruct
{
}

@end