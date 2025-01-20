@interface TRITaskSupport
+ (id)sharedInstance;
- (Class)taskClassForTaskType:(int)a3;
- (id)XPCTaskAllowlist;
@end

@implementation TRITaskSupport

- (Class)taskClassForTaskType:(int)a3
{
  if (a3 - 1) <= 0x1F && ((0xFFFFF77F >> (a3 - 1)))
  {
    v4 = (objc_class *)objc_opt_class();
    if (v4)
    {
      v8 = v4;
      if (([(objc_class *)v4 conformsToProtocol:&unk_1F3481788] & 1) == 0)
      {
        v9 = [MEMORY[0x1E4F28B00] currentHandler];
        v10 = NSStringFromClass(v8);
        [v9 handleFailureInMethod:a2, self, @"TRITaskSupport.m", 159, @"taskClassForTaskType returning class %@ which is not a TRITask", v10 object file lineNumber description];
      }
      v4 = v8;
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)XPCTaskAllowlist
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__TRITaskSupport_XPCTaskAllowlist__block_invoke;
  block[3] = &unk_1E6BB82F8;
  block[4] = self;
  if (qword_1EA8D7F90 != -1) {
    dispatch_once(&qword_1EA8D7F90, block);
  }
  return (id)_MergedGlobals_32;
}

void __34__TRITaskSupport_XPCTaskAllowlist__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = 0;
  do
  {
    if (v4 <= 0x20 && ((1 << v4) & 0x1FFFFEEFELL) != 0)
    {
      uint64_t v5 = [*(id *)(a1 + 32) taskClassForTaskType:v4];
      if (v5) {
        [v3 addObject:v5];
      }
    }
    uint64_t v4 = (v4 + 1);
  }
  while (v4 != 1000);
  v6 = (void *)_MergedGlobals_32;
  _MergedGlobals_32 = (uint64_t)v3;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__TRITaskSupport_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EA8D7FA0 != -1) {
    dispatch_once(&qword_1EA8D7FA0, block);
  }
  v2 = (void *)qword_1EA8D7F98;
  return v2;
}

void __32__TRITaskSupport_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)qword_1EA8D7F98;
  qword_1EA8D7F98 = v1;
}

@end