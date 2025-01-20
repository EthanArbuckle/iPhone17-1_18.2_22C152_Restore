@interface SAStackIterator
- (BOOL)hasKernelStack;
- (BOOL)hasStack;
- (BOOL)hasSwiftAsyncStack;
- (BOOL)hasUserStack;
- (void)iterateFramesWithBacktraceStyle:(unint64_t)a3 block:(id)a4;
@end

@implementation SAStackIterator

- (void)iterateFramesWithBacktraceStyle:(unint64_t)a3 block:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ((a3 & 0x1C) != 0)
  {
    int v15 = *__error();
    v16 = _sa_logt();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v29 = a3;
      _os_log_error_impl(&dword_1BF22B000, v16, OS_LOG_TYPE_ERROR, "SAStackIterator doesn't support backtrace style 0x%llx", buf, 0xCu);
    }

    *__error() = v15;
    _SASetCrashLogMessage(1082, "SAStackIterator doesn't support backtrace style 0x%llx", v17, v18, v19, v20, v21, v22, a3);
    _os_crash();
    __break(1u);
  }
  v7 = (void (**)(void, void))v6;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v8 = self->_stack;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (![v13 isKernel])
        {
          if ((a3 & 2) != 0) {
            continue;
          }
LABEL_13:
          ((void (**)(void, void *))v7)[2](v7, v13);
          continue;
        }
        if (a3) {
          goto LABEL_16;
        }
        char v14 = [v13 isExclave];
        if ((a3 & 0x20) == 0 || (v14 & 1) == 0) {
          goto LABEL_13;
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }
LABEL_16:
}

- (BOOL)hasStack
{
  return [(NSArray *)self->_stack count] != 0;
}

- (BOOL)hasUserStack
{
  if ([(NSArray *)self->_stack count])
  {
    v3 = [(NSArray *)self->_stack firstObject];
    int v4 = [v3 isKernel] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)hasSwiftAsyncStack
{
  v2 = [(NSArray *)self->_stack firstObject];
  char v3 = [v2 isSwiftAsync];

  return v3;
}

- (BOOL)hasKernelStack
{
  NSUInteger v3 = [(NSArray *)self->_stack count];
  if (v3)
  {
    int v4 = [(NSArray *)self->_stack lastObject];
    char v5 = [v4 isKernel];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void).cxx_destruct
{
}

@end