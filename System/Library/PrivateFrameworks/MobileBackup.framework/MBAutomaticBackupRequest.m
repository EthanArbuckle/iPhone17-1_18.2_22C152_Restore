@interface MBAutomaticBackupRequest
- (BOOL)cancelled;
- (MBAutomaticBackupRequest)initWithReason:(int64_t)a3 activityType:(int)a4 options:(id)a5;
- (MBStartBackupOptions)backupOptions;
- (id)description;
- (int)activityType;
- (int64_t)reason;
- (void)setCancelled:(BOOL)a3;
@end

@implementation MBAutomaticBackupRequest

- (MBAutomaticBackupRequest)initWithReason:(int64_t)a3 activityType:(int)a4 options:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MBAutomaticBackupRequest;
  v10 = [(MBAutomaticBackupRequest *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_reason = a3;
    v10->_activityType = a4;
    objc_storeStrong((id *)&v10->_backupOptions, a5);
    v11->_cancelled = 0;
  }

  return v11;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"<%s: %p activityType:%d cancelled:%d>", class_getName(v3), self, self->_activityType, self->_cancelled];
}

- (int)activityType
{
  return self->_activityType;
}

- (int64_t)reason
{
  return self->_reason;
}

- (MBStartBackupOptions)backupOptions
{
  return self->_backupOptions;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
}

@end