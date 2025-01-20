@interface MGFileWatcher
- (BOOL)updateWatcher;
- (MGFileWatcher)initWithPath:(id)a3 block:(id)a4;
- (void)cancel;
- (void)dealloc;
@end

@implementation MGFileWatcher

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MGFileWatcher;
  [(MGFileWatcher *)&v3 dealloc];
}

- (BOOL)updateWatcher
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = (const char *)[self->_path fileSystemRepresentation];
  int v8 = open(v7, 0x8000);
  if (v8 == -1) {
    return 0;
  }
  int v9 = v8;
  memset(&v19, 0, sizeof(v19));
  if (fstat(v8, &v19) == -1)
  {
    close(v9);
    return 0;
  }
  unint64_t inode = self->_inode;
  BOOL v11 = v19.st_ino != inode;
  if (v19.st_ino == inode)
  {
    close(v9);
  }
  else
  {
    src = self->_src;
    if (src)
    {
      dispatch_source_cancel(src);
      dispatch_release((dispatch_object_t)self->_src);
    }
    v13 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F144A8], v9, 0x7FuLL, (dispatch_queue_t)self->_queue);
    self->_src = v13;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = sub_1A6ED8A94;
    handler[3] = &unk_1E5CB24A8;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v13, handler);
    v14 = self->_src;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1A6ED8AEC;
    v16[3] = &unk_1E5CB24C8;
    int v17 = v9;
    dispatch_source_set_cancel_handler(v14, v16);
    dispatch_resume((dispatch_object_t)self->_src);
    self->_unint64_t inode = v19.st_ino;
  }
  if (v19.st_mtimespec.tv_sec != self->_mtime.tv_sec || v19.st_mtimespec.tv_nsec != self->_mtime.tv_nsec)
  {
    self->_mtime = v19.st_mtimespec;
    return 1;
  }
  return v11;
}

- (MGFileWatcher)initWithPath:(id)a3 block:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v7 = (void *)MEMORY[0x1AD0C6360](self, a2);
  PathComponent = [a3 stringByDeletingLastPathComponent];
  int v17 = (const char *)[PathComponent fileSystemRepresentation:v13, v14, v15, v16];
  int v18 = open(v17, 0x8000);
  if (v18 == -1)
  {
    v29 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m", 47);
    if (v29) {
      v35 = v29 + 1;
    }
    else {
      v35 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MGNotifications.m";
    }
    sub_1A6ED7C4C((uint64_t)v35, 106, @"can't open parent for %@", v30, v31, v32, v33, v34, (char)a3);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = a3;
      _os_log_impl(&dword_1A6ED5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "can't open parent for %@", buf, 0xCu);
    }
    id v20 = 0;
  }
  else
  {
    int v19 = v18;
    v41.receiver = self;
    v41.super_class = (Class)MGFileWatcher;
    id v20 = [(MGFileWatcher *)&v41 init];
    if (v20)
    {
      *((void *)v20 + 1) = a3;
      *((void *)v20 + 8) = [a4 copyWithZone:v21, v22, v23, v24];
      v25 = dispatch_queue_create("com.apple.MobileGestalt.MGFileWatcher", 0);
      *((void *)v20 + 5) = v25;
      v26 = dispatch_source_create(MEMORY[0x1E4F144A8], v19, 2uLL, v25);
      *((void *)v20 + 7) = v26;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = sub_1A6ED8D70;
      handler[3] = &unk_1E5CB24A8;
      handler[4] = v20;
      dispatch_source_set_event_handler(v26, handler);
      v27 = *((void *)v20 + 7);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = sub_1A6ED8DC8;
      v38[3] = &unk_1E5CB24C8;
      int v39 = v19;
      dispatch_source_set_cancel_handler(v27, v38);
      v28 = *((void *)v20 + 5);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1A6ED8DD0;
      block[3] = &unk_1E5CB24A8;
      block[4] = v20;
      dispatch_sync(v28, block);
      dispatch_resume(*((dispatch_object_t *)v20 + 7));
    }
  }
  return (MGFileWatcher *)v20;
}

- (void)cancel
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A6ED8E4C;
  block[3] = &unk_1E5CB24A8;
  block[4] = self;
  dispatch_sync(queue, block);
}

@end