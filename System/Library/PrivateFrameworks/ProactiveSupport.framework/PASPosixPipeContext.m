@interface PASPosixPipeContext
@end

@implementation PASPosixPipeContext

void __45___PASPosixPipeContext_startReadWithHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  data = a3;
  v5 = (void *)MEMORY[0x1A62450A0]();
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(unsigned __int8 *)(v6 + 32);
  if (data && !*(unsigned char *)(*(void *)(a1 + 32) + 32))
  {
    if (dispatch_data_get_size(data))
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = *(unsigned __int8 *)(v6 + 32);
    }
    else
    {
      int v7 = 0;
    }
  }
  if (v7) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = a2 == 0;
  }
  if (!v8) {
    dispatch_io_close(*(dispatch_io_t *)(v6 + 16), 0);
  }
}

void __80___PASPosixPipeContext_setupWithSubprocessFd_fileActions_queue_group_readErrno___block_invoke(uint64_t a1, int a2)
{
  close(*(_DWORD *)(a1 + 48));
  v4 = *(_DWORD **)(a1 + 40);
  if (!*v4) {
    _DWORD *v4 = a2;
  }
  v5 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v5);
}

@end