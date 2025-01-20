@interface PSUIMBManagerWrapper
- (BOOL)isBackupOnCellularEnabledWithError:(id *)a3;
- (BOOL)setBackupOnCellularEnabled:(BOOL)a3 error:(id *)a4;
- (PSUIMBManagerWrapper)init;
- (unint64_t)backupOnCellularSupportWithAccount:(id)a3 error:(id *)a4;
@end

@implementation PSUIMBManagerWrapper

- (PSUIMBManagerWrapper)init
{
  v6.receiver = self;
  v6.super_class = (Class)PSUIMBManagerWrapper;
  v2 = [(PSUIMBManagerWrapper *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    backupManager = v2->_backupManager;
    v2->_backupManager = (MBManager *)v3;
  }
  return v2;
}

- (unint64_t)backupOnCellularSupportWithAccount:(id)a3 error:(id *)a4
{
  return [(MBManager *)self->_backupManager backupOnCellularSupportWithAccount:a3 error:a4];
}

- (BOOL)isBackupOnCellularEnabledWithError:(id *)a3
{
  return [(MBManager *)self->_backupManager isBackupOnCellularEnabledWithError:a3];
}

- (BOOL)setBackupOnCellularEnabled:(BOOL)a3 error:(id *)a4
{
  return [(MBManager *)self->_backupManager setBackupOnCellularEnabled:a3 error:a4];
}

- (void).cxx_destruct
{
}

@end