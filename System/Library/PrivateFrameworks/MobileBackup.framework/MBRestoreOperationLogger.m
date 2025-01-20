@interface MBRestoreOperationLogger
- (MBRestoreOperationLogger)initWithPath:(id)a3;
- (NSString)path;
- (__sFILE)file;
- (os_unfair_lock_s)writeLock;
- (void)close;
- (void)dealloc;
- (void)flush;
- (void)logCloneForRestorable:(id)a3 state:(unint64_t)a4 source:(id)a5 target:(id)a6;
- (void)logCreateDirectoryForRestorable:(id)a3 state:(unint64_t)a4 absolutePath:(id)a5;
- (void)logCreateZeroByteRestorable:(id)a3 state:(unint64_t)a4 absolutePath:(id)a5;
- (void)logFixUpDirectoryAttributesForRestorable:(id)a3 state:(unint64_t)a4 absolutePath:(id)a5;
- (void)logForegroundRestoreFinished;
- (void)logForegroundRestoreStart;
- (void)logLinkForRestorable:(id)a3 state:(unint64_t)a4 source:(id)a5 target:(id)a6;
- (void)logMoveForRestorable:(id)a3 state:(unint64_t)a4 source:(id)a5 target:(id)a6;
- (void)logRenameForRestorable:(id)a3 state:(unint64_t)a4 source:(id)a5 target:(id)a6;
- (void)logSetClassForRestorable:(id)a3 state:(unint64_t)a4 absolutePath:(id)a5 value:(int)a6;
- (void)logSymlinkRestorable:(id)a3 state:(unint64_t)a4 source:(id)a5 target:(id)a6;
- (void)logUnlinkForRestorable:(id)a3 state:(unint64_t)a4 absolutePath:(id)a5;
- (void)setFile:(__sFILE *)a3;
@end

@implementation MBRestoreOperationLogger

- (MBRestoreOperationLogger)initWithPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MBRestoreOperationLogger;
  v6 = [(MBRestoreOperationLogger *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, a3);
    v7->_writeLock._os_unfair_lock_opaque = 0;
    v7->_file = 0;
  }

  return v7;
}

- (void)dealloc
{
  [(MBRestoreOperationLogger *)self close];
  v3.receiver = self;
  v3.super_class = (Class)MBRestoreOperationLogger;
  [(MBRestoreOperationLogger *)&v3 dealloc];
}

- (void)logForegroundRestoreStart
{
  sub_100258944((uint64_t)self, @"fg_start", v2, v3, v4, v5, v6, v7, v8);
}

- (void)logForegroundRestoreFinished
{
  sub_100258944((uint64_t)self, @"fg_finished", v2, v3, v4, v5, v6, v7, v8);
}

- (void)logCloneForRestorable:(id)a3 state:(unint64_t)a4 source:(id)a5 target:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v20 = [a3 domain];
  v12 = [v20 name];
  v19 = MBRestorableStateToString(a4);
  sub_100258944((uint64_t)self, @"clonefile|%@|%@|%@|%@", v13, v14, v15, v16, v17, v18, (uint64_t)v12);
}

- (void)logSymlinkRestorable:(id)a3 state:(unint64_t)a4 source:(id)a5 target:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v20 = [a3 domain];
  v12 = [v20 name];
  v19 = MBRestorableStateToString(a4);
  sub_100258944((uint64_t)self, @"symlink|%@|%@|%@|%@", v13, v14, v15, v16, v17, v18, (uint64_t)v12);
}

- (void)logLinkForRestorable:(id)a3 state:(unint64_t)a4 source:(id)a5 target:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v20 = [a3 domain];
  v12 = [v20 name];
  v19 = MBRestorableStateToString(a4);
  sub_100258944((uint64_t)self, @"link|%@|%@|%@|%@", v13, v14, v15, v16, v17, v18, (uint64_t)v12);
}

- (void)logRenameForRestorable:(id)a3 state:(unint64_t)a4 source:(id)a5 target:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v20 = [a3 domain];
  v12 = [v20 name];
  v19 = MBRestorableStateToString(a4);
  sub_100258944((uint64_t)self, @"rename|%@|%@|%@|%@", v13, v14, v15, v16, v17, v18, (uint64_t)v12);
}

- (void)logMoveForRestorable:(id)a3 state:(unint64_t)a4 source:(id)a5 target:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v20 = [a3 domain];
  v12 = [v20 name];
  v19 = MBRestorableStateToString(a4);
  sub_100258944((uint64_t)self, @"move|%@|%@|%@|%@", v13, v14, v15, v16, v17, v18, (uint64_t)v12);
}

- (void)logSetClassForRestorable:(id)a3 state:(unint64_t)a4 absolutePath:(id)a5 value:(int)a6
{
  id v9 = a5;
  id v18 = [a3 domain];
  id v10 = [v18 name];
  uint64_t v17 = MBRestorableStateToString(a4);
  sub_100258944((uint64_t)self, @"setclass|%@|%@|%d|%@", v11, v12, v13, v14, v15, v16, (uint64_t)v10);
}

- (void)logCreateZeroByteRestorable:(id)a3 state:(unint64_t)a4 absolutePath:(id)a5
{
  id v8 = a5;
  id v17 = [a3 domain];
  id v9 = [v17 name];
  uint64_t v16 = MBRestorableStateToString(a4);
  sub_100258944((uint64_t)self, @"empty|%@|%@|%@", v10, v11, v12, v13, v14, v15, (uint64_t)v9);
}

- (void)logUnlinkForRestorable:(id)a3 state:(unint64_t)a4 absolutePath:(id)a5
{
  id v8 = a5;
  id v17 = [a3 domain];
  id v9 = [v17 name];
  uint64_t v16 = MBRestorableStateToString(a4);
  sub_100258944((uint64_t)self, @"unlink|%@|%@|%@", v10, v11, v12, v13, v14, v15, (uint64_t)v9);
}

- (void)logCreateDirectoryForRestorable:(id)a3 state:(unint64_t)a4 absolutePath:(id)a5
{
  id v8 = a5;
  id v17 = [a3 domain];
  id v9 = [v17 name];
  uint64_t v16 = MBRestorableStateToString(a4);
  sub_100258944((uint64_t)self, @"mkdir|%@|%@|%@", v10, v11, v12, v13, v14, v15, (uint64_t)v9);
}

- (void)logFixUpDirectoryAttributesForRestorable:(id)a3 state:(unint64_t)a4 absolutePath:(id)a5
{
  id v8 = a5;
  id v17 = [a3 domain];
  id v9 = [v17 name];
  uint64_t v16 = MBRestorableStateToString(a4);
  sub_100258944((uint64_t)self, @"futimes|%@|%@|%@", v10, v11, v12, v13, v14, v15, (uint64_t)v9);
}

- (void)flush
{
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  file = self->_file;
  if (file) {
    fflush(file);
  }
  os_unfair_lock_unlock(p_writeLock);
}

- (void)close
{
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  file = self->_file;
  if (file)
  {
    fclose(file);
    self->_file = 0;
  }
  os_unfair_lock_unlock(p_writeLock);
}

- (NSString)path
{
  return self->_path;
}

- (os_unfair_lock_s)writeLock
{
  return self->_writeLock;
}

- (__sFILE)file
{
  return self->_file;
}

- (void)setFile:(__sFILE *)a3
{
  self->_file = a3;
}

- (void).cxx_destruct
{
}

@end