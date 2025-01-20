@interface _PASPosixPipeContext
- (int)setupWithSubprocessFd:(int)a3 fileActions:(void *)a4 queue:(id)a5 group:(id)a6 readErrno:(int *)a7;
- (void)startReadWithHandler:(id)a3;
@end

@implementation _PASPosixPipeContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeHandle, 0);
  objc_storeStrong((id *)&self->_readChannel, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)startReadWithHandler:(id)a3
{
  id v4 = a3;
  [(NSFileHandle *)self->_writeHandle closeFile];
  queue = self->_queue;
  readChannel = self->_readChannel;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45___PASPosixPipeContext_startReadWithHandler___block_invoke;
  v8[3] = &unk_1E5AEB3B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_io_read(readChannel, 0, 0xFFFFFFFFFFFFFFFFLL, queue, v8);
}

- (int)setupWithSubprocessFd:(int)a3 fileActions:(void *)a4 queue:(id)a5 group:(id)a6 readErrno:(int *)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v13 = a5;
  v14 = a6;
  if (pipe(v34))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v23 = __error();
      v24 = strerror(*v23);
      int v25 = *__error();
      *(_DWORD *)buf = 136315394;
      v31 = v24;
      __int16 v32 = 1024;
      int v33 = v25;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "runCommandWithPath failed to create pipe: %s (%d)", buf, 0x12u);
    }
    int v15 = -1;
  }
  else
  {
    dispatch_fd_t v16 = v34[0];
    uint64_t v17 = v34[1];
    posix_spawn_file_actions_addclose(a4, v34[0]);
    posix_spawn_file_actions_adddup2(a4, v17, a3);
    posix_spawn_file_actions_addclose(a4, v17);
    v18 = (NSFileHandle *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v17 closeOnDealloc:1];
    writeHandle = self->_writeHandle;
    self->_writeHandle = v18;

    dispatch_group_enter(v14);
    cleanup_handler[0] = MEMORY[0x1E4F143A8];
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = __80___PASPosixPipeContext_setupWithSubprocessFd_fileActions_queue_group_readErrno___block_invoke;
    cleanup_handler[3] = &unk_1E5AEB388;
    dispatch_fd_t v29 = v16;
    v28 = a7;
    v27 = v14;
    v20 = (OS_dispatch_io *)dispatch_io_create(0, v16, v13, cleanup_handler);
    readChannel = self->_readChannel;
    self->_readChannel = v20;

    dispatch_io_set_high_water((dispatch_io_t)self->_readChannel, 0x8000uLL);
    objc_storeStrong((id *)&self->_queue, a5);

    int v15 = 0;
  }

  return v15;
}

@end