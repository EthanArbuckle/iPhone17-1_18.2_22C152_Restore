@interface WLKProcessInfo
+ (id)currentProcessInfo;
- (BOOL)BOOLValueForEntitlement:(id)a3;
- (BOOL)valueForEntitlement:(id)a3 containsObject:(id)a4;
- (WLKProcessInfo)init;
- (__SecTask)currentTask;
- (id)valueForEntitlement:(id)a3;
- (void)dealloc;
- (void)setCurrentTask:(__SecTask *)a3;
@end

@implementation WLKProcessInfo

+ (id)currentProcessInfo
{
  if (currentProcessInfo_onceToken != -1) {
    dispatch_once(&currentProcessInfo_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)currentProcessInfo_currentProcessInfo;

  return v2;
}

uint64_t __36__WLKProcessInfo_currentProcessInfo__block_invoke()
{
  currentProcessInfo_currentProcessInfo = objc_alloc_init(WLKProcessInfo);

  return MEMORY[0x1F41817F8]();
}

- (WLKProcessInfo)init
{
  v4.receiver = self;
  v4.super_class = (Class)WLKProcessInfo;
  v2 = [(WLKProcessInfo *)&v4 init];
  if (v2) {
    v2->_currentTask = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  }
  return v2;
}

- (void)dealloc
{
  currentTask = self->_currentTask;
  if (currentTask) {
    CFRelease(currentTask);
  }
  v4.receiver = self;
  v4.super_class = (Class)WLKProcessInfo;
  [(WLKProcessInfo *)&v4 dealloc];
}

- (id)valueForEntitlement:(id)a3
{
  objc_super v4 = (__CFString *)a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The entitlement argument must not be nil."];
  }
  v5 = [(WLKProcessInfo *)self currentTask];
  if (v5) {
    v6 = (void *)SecTaskCopyValueForEntitlement(v5, v4, 0);
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (BOOL)BOOLValueForEntitlement:(id)a3
{
  v3 = [(WLKProcessInfo *)self valueForEntitlement:a3];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)valueForEntitlement:(id)a3 containsObject:(id)a4
{
  id v6 = a4;
  v7 = [(WLKProcessInfo *)self valueForEntitlement:a3];
  if (objc_opt_respondsToSelector()) {
    char v8 = [v7 containsObject:v6];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (__SecTask)currentTask
{
  return self->_currentTask;
}

- (void)setCurrentTask:(__SecTask *)a3
{
  self->_currentTask = a3;
}

@end