@interface PSGBackupDisabledAppsInfo
- (BOOL)includePhoto;
- (NSArray)backupDisabledAppsForDisplay;
- (int64_t)backupDisabledAppCount;
- (void)setBackupDisabledAppCount:(int64_t)a3;
- (void)setBackupDisabledAppsForDisplay:(id)a3;
- (void)setIncludePhoto:(BOOL)a3;
@end

@implementation PSGBackupDisabledAppsInfo

- (NSArray)backupDisabledAppsForDisplay
{
  return self->_backupDisabledAppsForDisplay;
}

- (void)setBackupDisabledAppsForDisplay:(id)a3
{
}

- (BOOL)includePhoto
{
  return self->_includePhoto;
}

- (void)setIncludePhoto:(BOOL)a3
{
  self->_includePhoto = a3;
}

- (int64_t)backupDisabledAppCount
{
  return self->_backupDisabledAppCount;
}

- (void)setBackupDisabledAppCount:(int64_t)a3
{
  self->_backupDisabledAppCount = a3;
}

- (void).cxx_destruct
{
}

@end