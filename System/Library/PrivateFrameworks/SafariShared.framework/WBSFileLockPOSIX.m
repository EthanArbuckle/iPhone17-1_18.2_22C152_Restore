@interface WBSFileLockPOSIX
- (WBSFileLockPOSIX)initWithFileDescriptor:(int)a3;
- (void)dealloc;
- (void)releaseLock;
@end

@implementation WBSFileLockPOSIX

- (WBSFileLockPOSIX)initWithFileDescriptor:(int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WBSFileLockPOSIX;
  v4 = [(WBSFileLockPOSIX *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_fileDescriptor = a3;
    v6 = v4;
  }
  else
  {
    close(a3);
  }

  return v5;
}

- (void)releaseLock
{
  id v1 = a1;
  __error();
  OUTLINED_FUNCTION_1_9(&dword_1A6B5F000, v2, v3, "Failed to unlock coordination lock: %{errno}d", v4, v5, v6, v7, 0);
}

- (void)dealloc
{
  if (self->_fileDescriptor != -1) {
    [(WBSFileLockPOSIX *)self releaseLock];
  }
  v3.receiver = self;
  v3.super_class = (Class)WBSFileLockPOSIX;
  [(WBSFileLockPOSIX *)&v3 dealloc];
}

@end