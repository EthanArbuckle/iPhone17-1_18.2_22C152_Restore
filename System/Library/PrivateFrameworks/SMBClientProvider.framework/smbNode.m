@interface smbNode
+ (id)fileHandleForIno:(unint64_t)a3;
+ (unsigned)getAttrTimeout:(timespec)a3 lastModified:(timespec)a4;
- (BOOL)getMaxAccessAttr:(unsigned int *)a3;
- (BOOL)isDir;
- (BOOL)isReg;
- (BOOL)isRevoked;
- (BOOL)isRevokedLocked;
- (BOOL)isRoot;
- (BOOL)isSymlink;
- (BOOL)isViable;
- (BOOL)isZombie;
- (BOOL)reopenChangeNotify:(id)a3;
- (BOOL)reopenFileNodes;
- (BOOL)reopenFilesAfterReconnect;
- (LiveFSXattrCache)xattrCache;
- (NSLock)metaLock;
- (NSMutableDictionary)filerefCache;
- (NSString)fh;
- (NSString)name;
- (NSString)symlinkTargetStr;
- (OS_dispatch_queue)fileRefSyncQueue;
- (OS_dispatch_queue)xattrIOQueue;
- (fileRef)ReadWrite_fileRef;
- (fileRef)Read_fileRef;
- (fileRef)Write_fileRef;
- (fileRef)changeNotifyFileRef;
- (id)fileRefForRead;
- (id)fileRefForWrite;
- (id)findSharedFileRef:(unsigned int)a3;
- (id)getDirEnumerator:(int *)a3;
- (id)getNewFileRefwithMode:(unsigned int)a3;
- (id)makeSillyDeleteName;
- (id)symlinkTargetCache;
- (int)openFileRefs;
- (int)prepareForReclaimSync;
- (int)reopenDenyModeRefs;
- (int)reopenFileRef:(id)a3;
- (int)reopenSharedRefs;
- (int)wasWritten;
- (smbMount)mp;
- (smbNode)initWithName:(id)a3 andParent:(id)a4 andAttr:(smbfattr *)a5;
- (smbNode)parent;
- (smbfattr)getSmbFattr;
- (timespec)symlinkRefreshTime;
- (unint64_t)getReadDirVerifier;
- (unint64_t)inUseClientSet;
- (unint64_t)interestedClients;
- (unint64_t)np_seqno;
- (unint64_t)symlinkTargetLen;
- (unsigned)dirRefCount;
- (unsigned)np_flag;
- (void)addChangeNotify:(id)a3 NotifyHandler:(id)a4;
- (void)addNewFileRef:(id)a3;
- (void)clearChangeNotify:(BOOL)a3 completionHandler:(id)a4;
- (void)closeAllFileRefs:(id)a3;
- (void)closeFileRefInternal:(id)a3 CompletionHandler:(id)a4;
- (void)closeFileRefWithMode:(unsigned int)a3 CompletionHandler:(id)a4;
- (void)dealloc;
- (void)decDirRefCount;
- (void)fetchAttrDataWithCompletionHandler:(id)a3;
- (void)incDirRefCount;
- (void)invalidateAttrs;
- (void)lockMeta;
- (void)prepareForReclaim:(id)a3;
- (void)prepareForReconnect;
- (void)refreshAttrsWithCompletionHandler:(id)a3;
- (void)setChangeNotifyFileRef:(id)a3;
- (void)setDirRefCount:(unsigned int)a3;
- (void)setFh:(id)a3;
- (void)setFileRefSyncQueue:(id)a3;
- (void)setFilerefCache:(id)a3;
- (void)setInUseClientSet:(unint64_t)a3;
- (void)setInterestedClients:(unint64_t)a3;
- (void)setMaxAccessAttr:(unsigned int)a3;
- (void)setMp:(id)a3;
- (void)setName:(id)a3;
- (void)setOpenFileRefs:(int)a3;
- (void)setParent:(id)a3;
- (void)setReadWrite_fileRef:(id)a3;
- (void)setRead_fileRef:(id)a3;
- (void)setReparseSymLink:(id)a3;
- (void)setRevokedState:(BOOL)a3;
- (void)setWasWritten:(int)a3;
- (void)setWindowsSymLink:(id)a3;
- (void)setWrite_fileRef:(id)a3;
- (void)setXattrCache:(id)a3;
- (void)setXattrIOQueue:(id)a3;
- (void)setZombieState:(BOOL)a3;
- (void)unlockMeta;
- (void)updateFileID;
@end

@implementation smbNode

- (smbNode)initWithName:(id)a3 andParent:(id)a4 andAttr:(smbfattr *)a5
{
  id v9 = a3;
  id v10 = a4;
  v46.receiver = self;
  v46.super_class = (Class)smbNode;
  v11 = [(smbNode *)&v46 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->fa_max_access_valid = 0;
    v12->maxAccessTime.tv_sec = 0;
    v12->maxAccessTime.tv_nsec = 0;
    attrDataCache = v12->attrDataCache;
    v12->attrDataCache = 0;

    v12->_np_flag = 0;
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.SMBProvider.fileRefSyncQueue", 0);
    fileRefSyncQueue = v12->_fileRefSyncQueue;
    v12->_fileRefSyncQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.SMBProvider.xattrIOSyncQueue", 0);
    xattrIOQueue = v12->_xattrIOQueue;
    v12->_xattrIOQueue = (OS_dispatch_queue *)v16;

    v18 = (NSLock *)objc_alloc_init((Class)NSLock);
    metaLock = v12->_metaLock;
    v12->_metaLock = v18;

    symlinkTargetStr = v12->_symlinkTargetStr;
    v12->_symlinkTargetStr = 0;

    v12->_symlinkTargetLen = 0;
    *(void *)&v12->_openFileRefs = 0;
    v12->_interestedClients = 0;
    v12->_np_flag = 0;
    v12->_symlinkRefreshTime.tv_sec = 0;
    v12->_symlinkRefreshTime.tv_nsec = 0;
    Read_fileRef = v12->_Read_fileRef;
    v12->_Read_fileRef = 0;

    ReadWrite_fileRef = v12->_ReadWrite_fileRef;
    v12->_ReadWrite_fileRef = 0;

    Write_fileRef = v12->_Write_fileRef;
    v12->_Write_fileRef = 0;

    v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    filerefCache = v12->_filerefCache;
    v12->_filerefCache = v24;

    if (v12->_filerefCache)
    {
      uint64_t v26 = +[LiveFSXattrCache xattrCacheWithMaxItems:4 maxItemSize:64 andEntryLifetimeInSeconds:5];
      xattrCache = v12->_xattrCache;
      v12->_xattrCache = (LiveFSXattrCache *)v26;

      changeNotifyFileRef = v12->_changeNotifyFileRef;
      v12->_changeNotifyFileRef = 0;

      *(void *)&v12->changeNotifyArgs.change_notify_parms.ntStatus = 0;
      *(void *)&v12->changeNotifyArgs.filter = 0;
      long long v29 = *(_OWORD *)&a5->fa_valid_mask;
      long long v30 = *(_OWORD *)&a5->fa_size;
      v12->fattr.fa_atime = a5->fa_atime;
      *(_OWORD *)&v12->fattr.fa_size = v30;
      *(_OWORD *)&v12->fattr.fa_valid_mask = v29;
      timespec fa_chtime = a5->fa_chtime;
      timespec fa_mtime = a5->fa_mtime;
      timespec fa_crtime = a5->fa_crtime;
      *(_OWORD *)&v12->fattr.fa_ino = *(_OWORD *)&a5->fa_ino;
      v12->fattr.timespec fa_crtime = fa_crtime;
      v12->fattr.timespec fa_mtime = fa_mtime;
      v12->fattr.timespec fa_chtime = fa_chtime;
      long long v34 = *(_OWORD *)&a5->fa_reqtime.tv_nsec;
      long long v35 = *(_OWORD *)&a5->fa_uid;
      long long v36 = *(_OWORD *)&a5->fa_permissions;
      *(_OWORD *)&v12->fattr.fa_flags_mask = *(_OWORD *)&a5->fa_flags_mask;
      *(_OWORD *)&v12->fattr.fa_permissions = v36;
      *(_OWORD *)&v12->fattr.fa_uid = v35;
      *(_OWORD *)&v12->fattr.fa_reqtime.tv_nsec = v34;
      long long v37 = *(_OWORD *)&a5->fa_created_disp;
      long long v38 = *(_OWORD *)&a5->fa_rsrc_alloc;
      long long v39 = *(_OWORD *)&a5->fa_finder_info[8];
      *(_OWORD *)&v12->fattr.fa_finder_info[24] = *(_OWORD *)&a5->fa_finder_info[24];
      *(_OWORD *)&v12->fattr.fa_finder_info[8] = v39;
      *(_OWORD *)&v12->fattr.fa_rsrc_alloc = v38;
      *(_OWORD *)&v12->fattr.fa_created_disp = v37;
      clock_gettime(_CLOCK_REALTIME, &v12->attrTime);
      if ((v12->fattr.fa_valid_mask & 0x40) != 0)
      {
        v12->fa_max_access_valid = 1;
        v12->fa_max_access = v12->fattr.fa_max_access;
        clock_gettime(_CLOCK_REALTIME, &v12->maxAccessTime);
      }
      p_parent = (id *)&v12->_parent;
      if (v10)
      {
        objc_storeStrong(p_parent, a4);
        uint64_t v41 = [v10 mp];
        char v42 = 0;
        mp = v12->_mp;
        v12->_mp = (smbMount *)v41;
      }
      else
      {
        objc_storeStrong(p_parent, v12);
        mp = v12->_mp;
        v12->_mp = 0;
        char v42 = 1;
      }

      v12->_isRoot = v42;
      v12->_dirRefCount = 0;
      dirEnum = v12->dirEnum;
      v12->dirEnum = 0;

      [(smbNode *)v12 updateFileID];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100057A24();
      }

      v12 = 0;
    }
  }

  return v12;
}

- (void)updateFileID
{
  mp = self->_mp;
  if (mp)
  {
    id v4 = [(smbMount *)mp getNextFileID];
    self->fattr.fa_ino = (unint64_t)v4;
    self->_fh = +[smbNode fileHandleForIno:v4];
    _objc_release_x1();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100057A6C();
    }
    self->fattr.fa_ino = 0;
  }
}

- (void)lockMeta
{
}

- (void)unlockMeta
{
}

- (BOOL)isDir
{
  [(NSLock *)self->_metaLock lock];
  BOOL v3 = self->fattr.fa_vtype == 2;
  [(NSLock *)self->_metaLock unlock];
  return v3;
}

- (BOOL)isReg
{
  [(NSLock *)self->_metaLock lock];
  BOOL v3 = self->fattr.fa_vtype == 1;
  [(NSLock *)self->_metaLock unlock];
  return v3;
}

- (BOOL)isSymlink
{
  [(NSLock *)self->_metaLock lock];
  BOOL v3 = self->fattr.fa_vtype == 5;
  [(NSLock *)self->_metaLock unlock];
  return v3;
}

- (BOOL)isZombie
{
  [(NSLock *)self->_metaLock lock];
  unsigned int v3 = (self->_np_flag >> 2) & 1;
  [(NSLock *)self->_metaLock unlock];
  return v3;
}

- (void)setZombieState:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSLock *)self->_metaLock lock];
  if (v3) {
    int v5 = 4;
  }
  else {
    int v5 = 0;
  }
  self->_np_flag = self->_np_flag & 0xFFFFFFFB | v5;
  metaLock = self->_metaLock;
  [(NSLock *)metaLock unlock];
}

- (void)setRevokedState:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSLock *)self->_metaLock lock];
  if (v3) {
    int v5 = 268435464;
  }
  else {
    int v5 = 0;
  }
  self->_np_flag = self->_np_flag & 0xEFFFFFF7 | v5;
  metaLock = self->_metaLock;
  [(NSLock *)metaLock unlock];
}

- (BOOL)isViable
{
  [(NSLock *)self->_metaLock lock];
  BOOL v3 = (self->_np_flag & 0x1000000C) == 0;
  [(NSLock *)self->_metaLock unlock];
  return v3;
}

- (BOOL)isRevoked
{
  [(NSLock *)self->_metaLock lock];
  BOOL v3 = [(smbNode *)self isRevokedLocked];
  [(NSLock *)self->_metaLock unlock];
  return v3;
}

- (BOOL)isRevokedLocked
{
  return (self->_np_flag & 0x10000008) != 0;
}

- (smbfattr)getSmbFattr
{
  return &self->fattr;
}

- (void)setWindowsSymLink:(id)a3
{
  self->fattr.fa_vtype = 5;
  self->fattr.fa_valid_mask |= 1uLL;
  self->_np_flag = self->_np_flag & 0xFFFFFFFC | 1;
  objc_storeStrong((id *)&self->_symlinkTargetStr, a3);
  id v5 = a3;
  id v6 = [v5 length];

  self->_symlinkTargetLen = (unint64_t)v6;
  clock_gettime(_CLOCK_REALTIME, &self->_symlinkRefreshTime);
}

- (void)setReparseSymLink:(id)a3
{
  self->fattr.fa_vtype = 5;
  self->fattr.fa_valid_mask |= 1uLL;
  self->_np_flag = self->_np_flag & 0xFFFFFFFC | 2;
  objc_storeStrong((id *)&self->_symlinkTargetStr, a3);
  id v5 = a3;
  id v6 = [v5 length];

  self->_symlinkTargetLen = (unint64_t)v6;
  clock_gettime(_CLOCK_REALTIME, &self->_symlinkRefreshTime);
}

- (id)symlinkTargetCache
{
  v6.tv_sec = 0;
  v6.tv_nsec = 0;
  [(NSLock *)self->_metaLock lock];
  if (self->_symlinkTargetStr)
  {
    if (clock_gettime(_CLOCK_REALTIME, &v6))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100057AB4();
      }
    }
    else
    {
      unsigned int v3 = +[smbNode getAttrTimeout:lastModified:](smbNode, "getAttrTimeout:lastModified:", v6.tv_sec, v6.tv_nsec, self->fattr.fa_mtime.tv_sec, self->fattr.fa_mtime.tv_nsec);
      if (v6.tv_sec - self->_symlinkRefreshTime.tv_sec < v3)
      {
        id v4 = self->_symlinkTargetStr;
        goto LABEL_8;
      }
    }
  }
  id v4 = 0;
LABEL_8:
  [(NSLock *)self->_metaLock unlock];
  return v4;
}

- (void)incDirRefCount
{
  [(NSLock *)self->_metaLock lock];
  ++self->_dirRefCount;
  metaLock = self->_metaLock;
  [(NSLock *)metaLock unlock];
}

- (void)decDirRefCount
{
  [(NSLock *)self->_metaLock lock];
  unsigned int dirRefCount = self->_dirRefCount;
  if (dirRefCount) {
    self->_unsigned int dirRefCount = dirRefCount - 1;
  }
  else {
    NSLog(@"decDirRefCount: Warning, smbNode: %@, dirRefCount is zero, cannot decrement", self->_name);
  }
  metaLock = self->_metaLock;
  [(NSLock *)metaLock unlock];
}

- (id)findSharedFileRef:(unsigned int)a3
{
  unsigned int v4 = a3 & 3;
  if (v4 == 3)
  {
    v7 = [(smbNode *)self ReadWrite_fileRef];

    if (!v7) {
      goto LABEL_14;
    }
    timespec v6 = [(smbNode *)self ReadWrite_fileRef];
  }
  else
  {
    if (v4 != 2)
    {
      if (v4 == 1)
      {
        id v5 = [(smbNode *)self Read_fileRef];

        if (v5)
        {
          timespec v6 = [(smbNode *)self Read_fileRef];
          goto LABEL_10;
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100057B30();
      }
LABEL_14:
      id v9 = 0;
      goto LABEL_15;
    }
    v8 = [(smbNode *)self Write_fileRef];

    if (!v8) {
      goto LABEL_14;
    }
    timespec v6 = [(smbNode *)self Write_fileRef];
  }
LABEL_10:
  id v9 = v6;
  if (v6) {
    [v6 addRef];
  }
LABEL_15:
  return v9;
}

- (id)fileRefForRead
{
  unsigned int v3 = [(smbNode *)self Read_fileRef];

  if (v3)
  {
    unsigned int v4 = [(smbNode *)self Read_fileRef];
  }
  else
  {
    id v5 = [(smbNode *)self ReadWrite_fileRef];

    if (!v5)
    {
      timespec v6 = 0;
      goto LABEL_8;
    }
    unsigned int v4 = [(smbNode *)self ReadWrite_fileRef];
  }
  timespec v6 = v4;
  if (v4) {
    [v4 addRef];
  }
LABEL_8:
  return v6;
}

- (id)fileRefForWrite
{
  unsigned int v3 = [(smbNode *)self Write_fileRef];

  if (v3)
  {
    unsigned int v4 = [(smbNode *)self Write_fileRef];
  }
  else
  {
    id v5 = [(smbNode *)self ReadWrite_fileRef];

    if (!v5)
    {
      timespec v6 = 0;
      goto LABEL_8;
    }
    unsigned int v4 = [(smbNode *)self ReadWrite_fileRef];
  }
  timespec v6 = v4;
  if (v4) {
    [v4 addRef];
  }
LABEL_8:
  return v6;
}

- (id)getNewFileRefwithMode:(unsigned int)a3
{
  char v3 = a3;
  unsigned int v4 = [[fileRef alloc] initWithMode:*(void *)&a3];
  id v5 = v4;
  if (v4)
  {
    if ((v3 & 2) != 0) {
      int v6 = 131078;
    }
    else {
      int v6 = 0x20000;
    }
    uint64_t v7 = v6 & 0xFFFFFFFE | v3 & 1;
    if ((v3 & 0x20) != 0) {
      unsigned int v8 = 0;
    }
    else {
      unsigned int v8 = 7;
    }
    if ((v3 & 0x10) != 0) {
      uint64_t v9 = 5;
    }
    else {
      uint64_t v9 = v8;
    }
    [(fileRef *)v4 setShareMode:v9];
    [(fileRef *)v5 setDesiredAccess:v7];
    [(fileRef *)v5 addRef];
    id v10 = v5;
  }

  return v5;
}

- (void)addNewFileRef:(id)a3
{
  id v6 = a3;
  unint64_t v4 = (unint64_t)[v6 openMode] & 3;
  switch(v4)
  {
    case 3:
      [(smbNode *)self setReadWrite_fileRef:v6];
      break;
    case 2:
      [(smbNode *)self setWrite_fileRef:v6];
      break;
    case 1:
      [(smbNode *)self setRead_fileRef:v6];
      break;
    default:
      goto LABEL_8;
  }
  [(smbNode *)self lockMeta];
  [(smbNode *)self setOpenFileRefs:[(smbNode *)self openFileRefs] + 1];
  [(smbNode *)self unlockMeta];
  id v5 = [(smbNode *)self mp];
  [v5 increaseOpenFileCount:1];

LABEL_8:
}

- (void)closeFileRefWithMode:(unsigned int)a3 CompletionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = dispatch_group_create();
  unsigned int v8 = dispatch_queue_create("com.apple.SMBProvider.closeRefQueue", 0);
  unsigned int v9 = a3 & 3;
  if (v9 == 2)
  {
    id v14 = [(smbNode *)self Read_fileRef];

    if (v14)
    {
      v15 = [(smbNode *)self Read_fileRef];
      [(smbNode *)self setRead_fileRef:0];
      [(smbNode *)self lockMeta];
      if ([(smbNode *)self openFileRefs]) {
        [(smbNode *)self setOpenFileRefs:[(smbNode *)self openFileRefs] - 1];
      }
      [(smbNode *)self unlockMeta];
      dispatch_group_enter(v7);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10002DAA0;
      v36[3] = &unk_100089508;
      v36[4] = self;
      id v14 = v15;
      id v37 = v14;
      long long v38 = v7;
      dispatch_async(v8, v36);

      uint64_t v13 = 1;
    }
    else
    {
      uint64_t v13 = 0;
    }
    id v12 = [(smbNode *)self ReadWrite_fileRef];

    if (v12)
    {
      v20 = [(smbNode *)self ReadWrite_fileRef];
      [(smbNode *)self setReadWrite_fileRef:0];
      [(smbNode *)self lockMeta];
      if ([(smbNode *)self openFileRefs]) {
        [(smbNode *)self setOpenFileRefs:[(smbNode *)self openFileRefs] - 1];
      }
      [(smbNode *)self unlockMeta];
      dispatch_group_enter(v7);
      v19 = (id *)v35;
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10002DB38;
      v35[3] = &unk_100089508;
      v35[4] = self;
      id v16 = v20;
      id v12 = 0;
      v35[5] = v16;
      goto LABEL_41;
    }
LABEL_27:
    id v16 = 0;
    goto LABEL_28;
  }
  if (v9 == 1)
  {
    id v10 = [(smbNode *)self Write_fileRef];

    if (v10)
    {
      v11 = [(smbNode *)self Write_fileRef];
      [(smbNode *)self setWrite_fileRef:0];
      [(smbNode *)self lockMeta];
      if ([(smbNode *)self openFileRefs]) {
        [(smbNode *)self setOpenFileRefs:[(smbNode *)self openFileRefs] - 1];
      }
      [(smbNode *)self unlockMeta];
      dispatch_group_enter(v7);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002D970;
      block[3] = &unk_100089508;
      block[4] = self;
      id v12 = v11;
      id v41 = v12;
      char v42 = v7;
      dispatch_async(v8, block);

      uint64_t v13 = 1;
    }
    else
    {
      uint64_t v13 = 0;
      id v12 = 0;
    }
    id v14 = [(smbNode *)self ReadWrite_fileRef];

    if (v14)
    {
      v18 = [(smbNode *)self ReadWrite_fileRef];
      [(smbNode *)self setReadWrite_fileRef:0];
      [(smbNode *)self lockMeta];
      if ([(smbNode *)self openFileRefs]) {
        [(smbNode *)self setOpenFileRefs:[(smbNode *)self openFileRefs] - 1];
      }
      [(smbNode *)self unlockMeta];
      dispatch_group_enter(v7);
      v19 = (id *)v39;
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10002DA08;
      v39[3] = &unk_100089508;
      v39[4] = self;
      id v16 = v18;
      id v14 = 0;
      v39[5] = v16;
LABEL_41:
      ++v13;
      v19[6] = v7;
      dispatch_async(v8, v19);

LABEL_42:
      v24 = [(smbNode *)self mp];
      [v24 decreaseOpenFileCount:v13];

      goto LABEL_43;
    }
    goto LABEL_27;
  }
  id v16 = 0;
  id v12 = 0;
  if (a3)
  {
    id v14 = 0;
  }
  else
  {
    id v14 = 0;
    if (v9 != 3)
    {
      id v14 = [(smbNode *)self Read_fileRef];

      if (v14)
      {
        v17 = [(smbNode *)self Read_fileRef];
        [(smbNode *)self setRead_fileRef:0];
        [(smbNode *)self lockMeta];
        if ([(smbNode *)self openFileRefs]) {
          [(smbNode *)self setOpenFileRefs:[(smbNode *)self openFileRefs] - 1];
        }
        [(smbNode *)self unlockMeta];
        dispatch_group_enter(v7);
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10002DBD0;
        v32[3] = &unk_100089508;
        v32[4] = self;
        id v14 = v17;
        id v33 = v14;
        long long v34 = v7;
        dispatch_async(v8, v32);

        uint64_t v13 = 1;
      }
      else
      {
        uint64_t v13 = 0;
      }
      v21 = [(smbNode *)self ReadWrite_fileRef];

      if (v21)
      {
        ++v13;
        v22 = [(smbNode *)self ReadWrite_fileRef];
        [(smbNode *)self setReadWrite_fileRef:0];
        [(smbNode *)self lockMeta];
        if ([(smbNode *)self openFileRefs]) {
          [(smbNode *)self setOpenFileRefs:[(smbNode *)self openFileRefs] - 1];
        }
        [(smbNode *)self unlockMeta];
        dispatch_group_enter(v7);
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10002DC68;
        v29[3] = &unk_100089508;
        v29[4] = self;
        id v16 = v22;
        id v30 = v16;
        v31 = v7;
        dispatch_async(v8, v29);
      }
      else
      {
        id v16 = 0;
      }
      id v12 = [(smbNode *)self Write_fileRef];

      if (v12)
      {
        v23 = [(smbNode *)self Write_fileRef];
        [(smbNode *)self setWrite_fileRef:0];
        [(smbNode *)self lockMeta];
        if ([(smbNode *)self openFileRefs]) {
          [(smbNode *)self setOpenFileRefs:[(smbNode *)self openFileRefs] - 1];
        }
        [(smbNode *)self unlockMeta];
        dispatch_group_enter(v7);
        v19 = (id *)v28;
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10002DD00;
        v28[3] = &unk_100089508;
        v28[4] = self;
        id v12 = v23;
        v28[5] = v12;
        goto LABEL_41;
      }
LABEL_28:
      if (!v13) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }
  }
LABEL_43:
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10002DD98;
  v26[3] = &unk_100089E80;
  v26[4] = self;
  id v27 = v6;
  id v25 = v6;
  dispatch_group_notify(v7, v8, v26);
}

- (void)closeFileRefInternal:(id)a3 CompletionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  if ([v6 reconnState])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100057BF0(self, v6);
    }
    v7[2](v7, 0);
  }
  else
  {
    unsigned int v8 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
    _OWORD *v8 = 0u;
    v8[1] = 0u;
    v8[2] = 0u;
    v8[3] = 0u;
    unsigned int v9 = [(smbNode *)self mp];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002DF88;
    v14[3] = &unk_100089288;
    id v15 = v6;
    id v16 = v8;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10002E064;
    v10[3] = &unk_100089EA8;
    v10[4] = self;
    uint64_t v13 = v8;
    id v11 = v15;
    id v12 = v7;
    [v9 submitRequestBlock:v14 continuationBlock:v10];
  }
}

- (void)invalidateAttrs
{
  [(NSLock *)self->_metaLock lock];
  self->attrTime.tv_sec = 0;
  self->attrTime.tv_nsec = 0;
  metaLock = self->_metaLock;
  [(NSLock *)metaLock unlock];
}

- (void)refreshAttrsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_10002E448;
  v20[4] = sub_10002E458;
  id v21 = 0;
  if (clock_gettime(_CLOCK_REALTIME, &__tp))
  {
    id v5 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v6 = __error();
      sub_100057DCC(v6, buf);
    }

    uint64_t v7 = 5;
    goto LABEL_7;
  }
  unsigned int v8 = +[smbNode getAttrTimeout:lastModified:](smbNode, "getAttrTimeout:lastModified:", __tp.tv_sec, __tp.tv_nsec, self->fattr.fa_mtime.tv_sec, self->fattr.fa_mtime.tv_nsec);
  if (__tp.tv_sec - self->attrTime.tv_sec >= v8)
  {
    unsigned int v9 = [(smbNode *)self mp];
    if ([v9 connectionState] != 1)
    {
      id v10 = [(smbNode *)self mp];
      if ([v10 connectionState] != 2)
      {
        unsigned int v14 = [(smbNode *)self isRoot];

        if (v14) {
          goto LABEL_6;
        }
LABEL_13:
        attrDataCache = self->attrDataCache;
        self->attrDataCache = 0;

        *(void *)buf = 0;
        v24 = buf;
        uint64_t v25 = 0x2020000000;
        uint64_t v26 = 0;
        uint64_t v26 = malloc_type_malloc(0xF0uLL, 0x1000040D9093685uLL);
        id v12 = (_OWORD *)*((void *)v24 + 3);
        v12[2] = 0u;
        v12[3] = 0u;
        v12[4] = 0u;
        v12[5] = 0u;
        v12[6] = 0u;
        v12[7] = 0u;
        v12[8] = 0u;
        v12[9] = 0u;
        v12[10] = 0u;
        v12[11] = 0u;
        v12[12] = 0u;
        v12[13] = 0u;
        v12[14] = 0u;
        _OWORD *v12 = 0u;
        v12[1] = 0u;
        uint64_t v13 = [(smbNode *)self mp];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_10002E460;
        v19[3] = &unk_100088A90;
        v19[4] = self;
        v19[5] = buf;
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_10002E528;
        v15[3] = &unk_100089EF8;
        v17 = buf;
        v15[4] = self;
        id v16 = v4;
        v18 = v20;
        [v13 submitRequestBlock:v19 continuationBlock:v15];

        _Block_object_dispose(buf, 8);
        goto LABEL_8;
      }
    }
    goto LABEL_13;
  }
LABEL_6:
  uint64_t v7 = 0;
LABEL_7:
  (*((void (**)(id, uint64_t))v4 + 2))(v4, v7);
LABEL_8:
  _Block_object_dispose(v20, 8);
}

- (unint64_t)getReadDirVerifier
{
  uint64_t v13 = 0;
  unsigned int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  char v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  unsigned int v9 = sub_10002EE48;
  id v10 = &unk_1000886F8;
  id v12 = &v13;
  id v4 = v3;
  id v11 = v4;
  [(smbNode *)self refreshAttrsWithCompletionHandler:&v7];
  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  [(NSLock *)self->_metaLock lock];
  if (*((_DWORD *)v14 + 6)) {
    __darwin_time_t tv_sec = 0;
  }
  else {
    __darwin_time_t tv_sec = self->fattr.fa_mtime.tv_sec;
  }
  [(NSLock *)self->_metaLock unlock];

  _Block_object_dispose(&v13, 8);
  return tv_sec;
}

- (id)getDirEnumerator:(int *)a3
{
  [(NSLock *)self->_metaLock lock];
  if (self->fattr.fa_vtype == 2)
  {
    if (self->dirEnum)
    {
      int v5 = 0;
    }
    else
    {
      id v6 = [[dirEnumerator alloc] initWithNode:self];
      dirEnum = self->dirEnum;
      self->dirEnum = v6;

      if (self->dirEnum) {
        int v5 = 0;
      }
      else {
        int v5 = 12;
      }
    }
  }
  else
  {
    int v5 = 20;
  }
  [(NSLock *)self->_metaLock unlock];
  *a3 = v5;
  uint64_t v8 = self->dirEnum;
  return v8;
}

+ (unsigned)getAttrTimeout:(timespec)a3 lastModified:(timespec)a4
{
  unsigned int v4 = (LODWORD(a3.tv_sec) - LODWORD(a4.tv_sec)) / 10;
  if (a3.tv_sec - a4.tv_sec > 309) {
    unsigned int v4 = 30;
  }
  if (a3.tv_sec - a4.tv_sec >= 20) {
    return v4;
  }
  else {
    return 2;
  }
}

- (BOOL)getMaxAccessAttr:(unsigned int *)a3
{
  v7.__darwin_time_t tv_sec = 0;
  v7.tv_nsec = 0;
  [(NSLock *)self->_metaLock lock];
  if (!self->fa_max_access_valid)
  {
LABEL_5:
    BOOL v5 = 0;
    goto LABEL_6;
  }
  if (clock_gettime(_CLOCK_REALTIME, &v7))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100058014();
    }
    goto LABEL_5;
  }
  if (v7.tv_sec - self->maxAccessTime.tv_sec > 5)
  {
    BOOL v5 = 0;
    self->fa_max_access_valid = 0;
  }
  else
  {
    *a3 = self->fa_max_access;
    BOOL v5 = 1;
  }
LABEL_6:
  [(NSLock *)self->_metaLock unlock];
  return v5;
}

- (void)setMaxAccessAttr:(unsigned int)a3
{
  [(NSLock *)self->_metaLock lock];
  self->fa_max_access_valid = 1;
  self->fa_max_access = a3;
  clock_gettime(_CLOCK_REALTIME, &self->maxAccessTime);
  metaLock = self->_metaLock;
  [(NSLock *)metaLock unlock];
}

- (void)fetchAttrDataWithCompletionHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002F0D4;
  v4[3] = &unk_100089F20;
  BOOL v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(smbNode *)v5 refreshAttrsWithCompletionHandler:v4];
}

+ (id)fileHandleForIno:(unint64_t)a3
{
  unint64_t v7 = a3;
  id v3 = +[NSData dataWithBytes:&v7 length:8];
  unsigned int v4 = [v3 base64EncodedStringWithOptions:1];
  BOOL v5 = [v4 stringByReplacingOccurrencesOfString:@"/" withString:@":"];

  return v5;
}

- (id)makeSillyDeleteName
{
  id v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @".smbdeleteABC%llx", self->fattr.fa_ino);
  return v2;
}

- (void)closeAllFileRefs:(id)a3
{
  id v4 = a3;
  BOOL v5 = dispatch_group_create();
  id v6 = dispatch_queue_create("com.apple.SMBProvider.closeRefsQueue", 0);
  id v7 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v8 = [(smbNode *)self Read_fileRef];

  if (v8)
  {
    unsigned int v9 = [(smbNode *)self Read_fileRef];
    unsigned int v10 = [v9 reconnState];

    if (!v10)
    {
      id v12 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
      _OWORD *v12 = 0u;
      v12[1] = 0u;
      v12[2] = 0u;
      v12[3] = 0u;
      uint64_t v8 = +[NSValue valueWithPointer:v12];
      [v7 addObject:v8];
      dispatch_group_enter(v5);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002F798;
      block[3] = &unk_100089F70;
      block[4] = self;
      long long v38 = v12;
      id v37 = v5;
      dispatch_async(v6, block);

      uint64_t v11 = 1;
      goto LABEL_6;
    }
    uint64_t v8 = 0;
  }
  uint64_t v11 = 0;
LABEL_6:
  uint64_t v13 = [(smbNode *)self Write_fileRef];

  if (v13)
  {
    unsigned int v14 = [(smbNode *)self Write_fileRef];
    unsigned int v15 = [v14 reconnState];

    if (!v15)
    {
      int v16 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
      *int v16 = 0u;
      v16[1] = 0u;
      v16[2] = 0u;
      v16[3] = 0u;
      ++v11;
      uint64_t v17 = +[NSValue valueWithPointer:v16];

      [v7 addObject:v17];
      dispatch_group_enter(v5);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_10002F8D8;
      v33[3] = &unk_100089F70;
      v33[4] = self;
      long long v35 = v16;
      long long v34 = v5;
      dispatch_async(v6, v33);

      uint64_t v8 = (void *)v17;
    }
  }
  v18 = [(smbNode *)self ReadWrite_fileRef];

  if (v18)
  {
    v19 = [(smbNode *)self ReadWrite_fileRef];
    unsigned int v20 = [v19 reconnState];

    if (!v20)
    {
      id v21 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
      _OWORD *v21 = 0u;
      v21[1] = 0u;
      v21[2] = 0u;
      v21[3] = 0u;
      ++v11;
      uint64_t v22 = +[NSValue valueWithPointer:v21];

      [v7 addObject:v22];
      dispatch_group_enter(v5);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10002FA18;
      v30[3] = &unk_100089F70;
      v30[4] = self;
      v32 = v21;
      v31 = v5;
      dispatch_async(v6, v30);

      uint64_t v8 = (void *)v22;
    }
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10002FB58;
  v25[3] = &unk_100088D88;
  id v26 = v7;
  id v27 = self;
  id v28 = v4;
  uint64_t v29 = v11;
  id v23 = v4;
  id v24 = v7;
  dispatch_group_notify(v5, v6, v25);
}

- (void)prepareForReclaim:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10005824C(self);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002FD50;
  v6[3] = &unk_100088BF8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(smbNode *)self closeAllFileRefs:v6];
}

- (int)prepareForReclaimSync
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unsigned int v10 = sub_10002E448;
  uint64_t v11 = sub_10002E458;
  dispatch_group_t v12 = dispatch_group_create();
  id v3 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [(smbNode *)self name];
    sub_1000582D4(v4, buf);
  }

  dispatch_group_enter((dispatch_group_t)v8[5]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002FFB4;
  v6[3] = &unk_100089F98;
  v6[4] = self;
  void v6[5] = &v7;
  [(smbNode *)self closeAllFileRefs:v6];
  dispatch_group_wait((dispatch_group_t)v8[5], 0xFFFFFFFFFFFFFFFFLL);
  _Block_object_dispose(&v7, 8);

  return 0;
}

- (void)prepareForReconnect
{
  [(NSLock *)self->_metaLock lock];
  if (self->fattr.fa_vtype == 2)
  {
    dirEnum = self->dirEnum;
    if (dirEnum) {
      [(dirEnumerator *)dirEnum resetAfterReconnect];
    }
  }
  [(NSLock *)self->_metaLock unlock];
  id v4 = [(smbNode *)self Read_fileRef];

  if (v4)
  {
    id v5 = [(smbNode *)self Read_fileRef];
    id v6 = [v5 refSyncQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003029C;
    block[3] = &unk_100088838;
    block[4] = self;
    dispatch_sync(v6, block);
  }
  uint64_t v7 = [(smbNode *)self ReadWrite_fileRef];

  if (v7)
  {
    uint64_t v8 = [(smbNode *)self ReadWrite_fileRef];
    uint64_t v9 = [v8 refSyncQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100030330;
    v16[3] = &unk_100088838;
    v16[4] = self;
    dispatch_sync(v9, v16);
  }
  unsigned int v10 = [(smbNode *)self Write_fileRef];

  if (v10)
  {
    uint64_t v11 = [(smbNode *)self Write_fileRef];
    dispatch_group_t v12 = [v11 refSyncQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000303C4;
    v15[3] = &unk_100088838;
    v15[4] = self;
    dispatch_sync(v12, v15);
  }
  uint64_t v13 = [(smbNode *)self changeNotifyFileRef];
  unsigned int v14 = v13;
  if (v13 && [v13 reconnState] != 2) {
    [v14 setReconnState:1];
  }
}

- (BOOL)reopenFilesAfterReconnect
{
  return [(smbNode *)self reopenFileNodes];
}

- (BOOL)reopenFileNodes
{
  if (![(smbNode *)self isViable])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_1000584A0(self);
    }
    goto LABEL_8;
  }
  if (self->fattr.fa_vtype == 2)
  {
LABEL_8:
    LOBYTE(v4) = 0;
    return v4;
  }
  unsigned int v3 = [(smbNode *)self reopenDenyModeRefs];
  if (v3)
  {
    unsigned int v4 = v3;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100058430();
    }
  }
  else
  {
    unsigned int v4 = [(smbNode *)self reopenSharedRefs];
    if (!v4) {
      return v4;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000583C0();
    }
  }
  LOBYTE(v4) = sub_100033040(v4);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100058330(self);
  }
  [(smbNode *)self setRevokedState:1];
  return v4;
}

- (int)reopenDenyModeRefs
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  unsigned int v3 = [(smbNode *)self ReadWrite_fileRef];

  if (v3)
  {
    unsigned int v4 = [(smbNode *)self ReadWrite_fileRef];
    id v5 = [v4 refSyncQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100030790;
    block[3] = &unk_100088810;
    block[4] = self;
    void block[5] = &v17;
    dispatch_sync(v5, block);
  }
  if (!*((_DWORD *)v18 + 6))
  {
    id v6 = [(smbNode *)self Write_fileRef];

    if (v6)
    {
      uint64_t v7 = [(smbNode *)self Write_fileRef];
      uint64_t v8 = [v7 refSyncQueue];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100030900;
      v15[3] = &unk_100088810;
      v15[4] = self;
      void v15[5] = &v17;
      dispatch_sync(v8, v15);
    }
    if (!*((_DWORD *)v18 + 6))
    {
      uint64_t v9 = [(smbNode *)self Read_fileRef];

      if (v9)
      {
        unsigned int v10 = [(smbNode *)self Read_fileRef];
        uint64_t v11 = [v10 refSyncQueue];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100030A70;
        v14[3] = &unk_100088810;
        void v14[4] = self;
        v14[5] = &v17;
        dispatch_sync(v11, v14);
      }
    }
  }
  int v12 = *((_DWORD *)v18 + 6);
  _Block_object_dispose(&v17, 8);
  return v12;
}

- (int)reopenSharedRefs
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  unsigned int v3 = [(smbNode *)self ReadWrite_fileRef];

  if (v3)
  {
    unsigned int v4 = [(smbNode *)self ReadWrite_fileRef];
    id v5 = [v4 refSyncQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100030E1C;
    block[3] = &unk_100088810;
    block[4] = self;
    void block[5] = &v17;
    dispatch_sync(v5, block);
  }
  if (!*((_DWORD *)v18 + 6))
  {
    id v6 = [(smbNode *)self Write_fileRef];

    if (v6)
    {
      uint64_t v7 = [(smbNode *)self Write_fileRef];
      uint64_t v8 = [v7 refSyncQueue];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100030F8C;
      v15[3] = &unk_100088810;
      v15[4] = self;
      void v15[5] = &v17;
      dispatch_sync(v8, v15);
    }
    if (!*((_DWORD *)v18 + 6))
    {
      uint64_t v9 = [(smbNode *)self Read_fileRef];

      if (v9)
      {
        unsigned int v10 = [(smbNode *)self Read_fileRef];
        uint64_t v11 = [v10 refSyncQueue];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_1000310FC;
        v14[3] = &unk_100088810;
        void v14[4] = self;
        v14[5] = &v17;
        dispatch_sync(v11, v14);
      }
    }
  }
  int v12 = *((_DWORD *)v18 + 6);
  _Block_object_dispose(&v17, 8);
  return v12;
}

- (int)reopenFileRef:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_10002E448;
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  id v27 = sub_10002E458;
  id v28 = 0;
  id v5 = dispatch_group_create();
  id v6 = (char *)malloc_type_malloc(0x14uLL, 0x1000040A86A77D5uLL);
  *(void *)(v6 + 12) = 0;
  *(void *)(v6 + 4) = 0;
  *(_DWORD *)id v6 = 1;
  *((_DWORD *)v6 + 1) = [v4 desiredAccess];
  *((_DWORD *)v6 + 2) = [v4 shareMode];
  *(void *)(v6 + 12) = self->fattr.fa_vtype;
  dispatch_group_enter(v5);
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_1000314D8;
  unsigned int v14 = &unk_100089FC0;
  int v16 = &v19;
  uint64_t v17 = &v23;
  v18 = v6;
  uint64_t v7 = v5;
  unsigned int v15 = v7;
  +[smb_subr openFileNode:self withStream:0 withArgs:v6 CompletionHandler:&v11];
  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (v24[5])
  {
    objc_msgSend(v4, "setFidCtx:", v11, v12, v13, v14);
  }
  else
  {
    id v8 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      [(smbNode *)self name];
      objc_claimAutoreleasedReturnValue();
      sub_100058BA0();
    }
  }
  int v9 = *((_DWORD *)v20 + 6);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v9;
}

- (void)addChangeNotify:(id)a3 NotifyHandler:(id)a4
{
  id v6 = (void (**)(id, uint64_t))a3;
  id v7 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_10002E448;
  v26[4] = sub_10002E458;
  id v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  int v25 = 0;
  if (![(smbNode *)self isDir])
  {
    uint64_t v10 = 20;
LABEL_5:
    v6[2](v6, v10);
    int v9 = 0;
    goto LABEL_6;
  }
  id v8 = self->_changeNotifyFileRef;
  if (!v8)
  {
    uint64_t v11 = [[fileRef alloc] initWithMode:1];
    uint64_t v12 = v11;
    if (v11)
    {
      [(fileRef *)v11 setShareMode:7];
      [(fileRef *)v12 setDesiredAccess:1048577];
      [(fileRef *)v12 addRef];
      uint64_t v13 = (char *)malloc_type_malloc(0x14uLL, 0x1000040A86A77D5uLL);
      *(void *)(v13 + 12) = 0;
      *(void *)(v13 + 4) = 0;
      *(_DWORD *)uint64_t v13 = 1;
      *((_DWORD *)v13 + 1) = [(fileRef *)v12 desiredAccess];
      *((_DWORD *)v13 + 2) = [(fileRef *)v12 shareMode];
      *((_DWORD *)v13 + 3) = 2;
      unsigned int v14 = [(smbNode *)self mp];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000318A0;
      v23[3] = &unk_100089710;
      v23[6] = v13;
      v23[4] = self;
      v23[5] = v26;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000319F4;
      v17[3] = &unk_10008A060;
      v17[4] = self;
      uint64_t v19 = v6;
      int v9 = v12;
      v18 = v9;
      uint64_t v21 = v26;
      id v20 = v7;
      int v22 = v24;
      [v14 submitRequestBlockOnce:v23 continuationBlock:v17];

      goto LABEL_6;
    }
    id v15 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v16 = [(smbNode *)self name];
      sub_100058C04(v16, buf);
    }

    uint64_t v10 = 12;
    goto LABEL_5;
  }
  int v9 = v8;
  [(fileRef *)v8 addRef];
  v6[2](v6, 0);
LABEL_6:
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v26, 8);
}

- (void)clearChangeNotify:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void))a4;
  if ([(smbNode *)self isDir])
  {
    if (self->_changeNotifyFileRef)
    {
      id v7 = dispatch_group_create();
      id v8 = dispatch_queue_create("com.apple.SMBProvider.clearChangeNotifyQueue", 0);
      if (v4)
      {
        if ([(fileRef *)self->_changeNotifyFileRef decRef])
        {
          v6[2](v6, 0);
        }
        else
        {
          uint64_t v11 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
          _OWORD *v11 = 0u;
          v11[1] = 0u;
          v11[2] = 0u;
          v11[3] = 0u;
          uint64_t v12 = self->_changeNotifyFileRef;
          changeNotifyFileRef = self->_changeNotifyFileRef;
          self->_changeNotifyFileRef = 0;

          unsigned int v14 = [(smbNode *)self mp];
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_100032358;
          v29[3] = &unk_100089288;
          id v30 = v12;
          v31 = v11;
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_100032434;
          v26[3] = &unk_10008A088;
          v26[4] = self;
          id v28 = v11;
          id v27 = v6;
          id v15 = v12;
          [v14 submitRequestBlock:v29 continuationBlock:v26];
        }
      }
      else
      {
        int v9 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
        *int v9 = 0u;
        v9[1] = 0u;
        v9[2] = 0u;
        v9[3] = 0u;
        if ([(fileRef *)self->_changeNotifyFileRef reconnState])
        {
          uint64_t v10 = 0;
        }
        else
        {
          int v16 = self->_changeNotifyFileRef;
          uint64_t v17 = self->_changeNotifyFileRef;
          self->_changeNotifyFileRef = 0;

          dispatch_group_enter(v7);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000324C0;
          block[3] = &unk_10008A0B0;
          uint64_t v10 = v16;
          int v25 = v9;
          int v22 = v10;
          uint64_t v23 = self;
          id v24 = v7;
          dispatch_async(v8, block);
        }
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1000325F8;
        v18[3] = &unk_10008A0D8;
        id v20 = v9;
        uint64_t v19 = v6;
        dispatch_group_notify(v7, v8, v18);
      }
    }
    else
    {
      if (v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100058E48(self);
      }
      v6[2](v6, 0);
    }
  }
  else
  {
    v6[2](v6, 20);
  }
}

- (BOOL)reopenChangeNotify:(id)a3
{
  id v4 = a3;
  uint64_t v37 = 0;
  long long v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = sub_10002E448;
  id v41 = sub_10002E458;
  id v42 = 0;
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x2020000000;
  int v36 = 0;
  if (self->_changeNotifyFileRef)
  {
    id v5 = dispatch_group_create();
    id v6 = (char *)malloc_type_malloc(0x14uLL, 0x1000040A86A77D5uLL);
    *(void *)(v6 + 12) = 0;
    *(void *)(v6 + 4) = 0;
    *(_DWORD *)id v6 = 1;
    *((_DWORD *)v6 + 1) = [(fileRef *)self->_changeNotifyFileRef desiredAccess];
    *((_DWORD *)v6 + 2) = [(fileRef *)self->_changeNotifyFileRef shareMode];
    *((_DWORD *)v6 + 3) = 2;
    dispatch_group_enter(v5);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100032AD8;
    v28[3] = &unk_100089FC0;
    id v30 = &v33;
    v31 = &v37;
    v32 = v6;
    id v7 = v5;
    uint64_t v29 = v7;
    +[smb_subr openFileNode:self withStream:0 withArgs:v6 CompletionHandler:v28];
    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    if (v38[5])
    {
      -[fileRef setFidCtx:](self->_changeNotifyFileRef, "setFidCtx:");
      [(fileRef *)self->_changeNotifyFileRef setOpenMode:0];
      dispatch_group_enter(v7);
      id v8 = [(fileRef *)self->_changeNotifyFileRef fidCtx];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100032B58;
      v25[3] = &unk_1000886F8;
      id v27 = &v33;
      int v9 = v7;
      id v26 = (fileRef *)v9;
      +[smb_subr setChangeNotify:v8 Param:&self->changeNotifyArgs CompletionHandler:v25 NotifyHandler:v4];

      dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
      unsigned int v10 = *((_DWORD *)v34 + 6);
      if (v10)
      {
        char v11 = sub_100033040(v10);
        id v12 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          [(smbNode *)self name];
          objc_claimAutoreleasedReturnValue();
          sub_1000590C0();
        }

        uint64_t v13 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
        dispatch_group_enter(v9);
        unsigned int v14 = [(fileRef *)self->_changeNotifyFileRef fidCtx];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100032B6C;
        v21[3] = &unk_1000887E8;
        uint64_t v23 = &v33;
        id v24 = v13;
        int v22 = v9;
        +[smb_subr sendClose:v14 Param:v13 GetPostAttrs:0 CompletionHandler:v21];

        changeNotifyFileRef = self->_changeNotifyFileRef;
        self->_changeNotifyFileRef = 0;

        if (*((_DWORD *)v34 + 6))
        {
          id v16 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            [(smbNode *)self name];
            objc_claimAutoreleasedReturnValue();
            sub_100059060();
          }
        }
        uint64_t v17 = v22;
      }
      else
      {
        uint64_t v17 = [(smbNode *)self mp];
        [v17 increaseChangeNotifyCount:1];
        char v11 = 0;
      }

      uint64_t v19 = v26;
    }
    else
    {
      unsigned int v18 = *((_DWORD *)v34 + 6);
      if (!v18)
      {
        unsigned int v18 = 5;
        *((_DWORD *)v34 + 6) = 5;
      }
      char v11 = sub_100033040(v18);
      uint64_t v19 = self->_changeNotifyFileRef;
      self->_changeNotifyFileRef = 0;
    }
  }
  else
  {
    char v11 = 0;
  }
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v11;
}

- (void)dealloc
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100059120(self);
  }
  attrDataCache = self->attrDataCache;
  self->attrDataCache = 0;

  Read_fileRef = self->_Read_fileRef;
  self->_Read_fileRef = 0;

  Write_fileRef = self->_Write_fileRef;
  self->_Write_fileRef = 0;

  ReadWrite_fileRef = self->_ReadWrite_fileRef;
  self->_ReadWrite_fileRef = 0;

  mp = self->_mp;
  self->_mp = 0;

  parent = self->_parent;
  self->_parent = 0;

  name = self->_name;
  self->_name = 0;

  fh = self->_fh;
  self->_fh = 0;

  metaLock = self->_metaLock;
  self->_metaLock = 0;

  v12.receiver = self;
  v12.super_class = (Class)smbNode;
  [(smbNode *)&v12 dealloc];
}

- (OS_dispatch_queue)fileRefSyncQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 344, 1);
}

- (void)setFileRefSyncQueue:(id)a3
{
}

- (OS_dispatch_queue)xattrIOQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 352, 1);
}

- (void)setXattrIOQueue:(id)a3
{
}

- (NSLock)metaLock
{
  return (NSLock *)objc_getProperty(self, a2, 360, 1);
}

- (smbMount)mp
{
  return (smbMount *)objc_getProperty(self, a2, 368, 1);
}

- (void)setMp:(id)a3
{
}

- (smbNode)parent
{
  return (smbNode *)objc_getProperty(self, a2, 376, 1);
}

- (void)setParent:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 384, 1);
}

- (void)setName:(id)a3
{
}

- (BOOL)isRoot
{
  return self->_isRoot;
}

- (NSString)symlinkTargetStr
{
  return (NSString *)objc_getProperty(self, a2, 392, 1);
}

- (unint64_t)symlinkTargetLen
{
  return self->_symlinkTargetLen;
}

- (timespec)symlinkRefreshTime
{
  objc_copyStruct(v4, &self->_symlinkRefreshTime, 16, 1, 0);
  __darwin_time_t v2 = v4[0];
  uint64_t v3 = v4[1];
  result.tv_nsec = v3;
  result.__darwin_time_t tv_sec = v2;
  return result;
}

- (unsigned)np_flag
{
  return self->_np_flag;
}

- (unint64_t)np_seqno
{
  return self->_np_seqno;
}

- (NSString)fh
{
  return (NSString *)objc_getProperty(self, a2, 416, 1);
}

- (void)setFh:(id)a3
{
}

- (fileRef)Read_fileRef
{
  return (fileRef *)objc_getProperty(self, a2, 424, 1);
}

- (void)setRead_fileRef:(id)a3
{
}

- (fileRef)ReadWrite_fileRef
{
  return (fileRef *)objc_getProperty(self, a2, 432, 1);
}

- (void)setReadWrite_fileRef:(id)a3
{
}

- (fileRef)Write_fileRef
{
  return (fileRef *)objc_getProperty(self, a2, 440, 1);
}

- (void)setWrite_fileRef:(id)a3
{
}

- (NSMutableDictionary)filerefCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 448, 1);
}

- (void)setFilerefCache:(id)a3
{
}

- (LiveFSXattrCache)xattrCache
{
  return (LiveFSXattrCache *)objc_getProperty(self, a2, 456, 1);
}

- (void)setXattrCache:(id)a3
{
}

- (unint64_t)inUseClientSet
{
  return self->_inUseClientSet;
}

- (void)setInUseClientSet:(unint64_t)a3
{
  self->_inUseClientSet = a3;
}

- (unint64_t)interestedClients
{
  return self->_interestedClients;
}

- (void)setInterestedClients:(unint64_t)a3
{
  self->_interestedClients = a3;
}

- (int)openFileRefs
{
  return self->_openFileRefs;
}

- (void)setOpenFileRefs:(int)a3
{
  self->_openFileRefs = a3;
}

- (int)wasWritten
{
  return self->_wasWritten;
}

- (void)setWasWritten:(int)a3
{
  self->_wasWritten = a3;
}

- (fileRef)changeNotifyFileRef
{
  return (fileRef *)objc_getProperty(self, a2, 480, 1);
}

- (void)setChangeNotifyFileRef:(id)a3
{
}

- (unsigned)dirRefCount
{
  return self->_dirRefCount;
}

- (void)setDirRefCount:(unsigned int)a3
{
  self->_unsigned int dirRefCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeNotifyFileRef, 0);
  objc_storeStrong((id *)&self->_xattrCache, 0);
  objc_storeStrong((id *)&self->_filerefCache, 0);
  objc_storeStrong((id *)&self->_Write_fileRef, 0);
  objc_storeStrong((id *)&self->_ReadWrite_fileRef, 0);
  objc_storeStrong((id *)&self->_Read_fileRef, 0);
  objc_storeStrong((id *)&self->_fh, 0);
  objc_storeStrong((id *)&self->_symlinkTargetStr, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_mp, 0);
  objc_storeStrong((id *)&self->_metaLock, 0);
  objc_storeStrong((id *)&self->_xattrIOQueue, 0);
  objc_storeStrong((id *)&self->_fileRefSyncQueue, 0);
  objc_storeStrong((id *)&self->dirEnum, 0);
  objc_storeStrong((id *)&self->attrDataCache, 0);
}

@end