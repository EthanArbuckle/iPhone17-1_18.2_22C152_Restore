@interface ApplicationDownloadProgress
- (ApplicationHandle)applicationHandle;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)completedUnitCount;
- (int64_t)totalUnitCount;
- (void)setApplicationHandle:(id)a3;
- (void)setCompletedUnitCount:(int64_t)a3;
- (void)setTotalUnitCount:(int64_t)a3;
@end

@implementation ApplicationDownloadProgress

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(DownloadHandle *)self->_applicationHandle copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  v5[2] = self->_completedUnitCount;
  v5[3] = self->_totalUnitCount;
  return v5;
}

- (ApplicationHandle)applicationHandle
{
  return self->_applicationHandle;
}

- (void)setApplicationHandle:(id)a3
{
}

- (int64_t)completedUnitCount
{
  return self->_completedUnitCount;
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  self->_completedUnitCount = a3;
}

- (int64_t)totalUnitCount
{
  return self->_totalUnitCount;
}

- (void)setTotalUnitCount:(int64_t)a3
{
  self->_totalUnitCount = a3;
}

- (void).cxx_destruct
{
}

@end