@interface _TVProcessInfo
+ (id)currentProcessInfo;
- (BOOL)BOOLValueForEntitlement:(id)a3;
- (BOOL)hasPrivateEntitlement;
- (BOOL)hasiTunesAPIEntitlement;
- (BOOL)hasiTunesStoreEntitlement;
- (BOOL)valueForEntitlement:(id)a3 containsObject:(id)a4;
- (_TVProcessInfo)init;
- (__SecTask)currentTask;
- (id)valueForEntitlement:(id)a3;
- (void)dealloc;
- (void)setCurrentTask:(__SecTask *)a3;
@end

@implementation _TVProcessInfo

+ (id)currentProcessInfo
{
  if (currentProcessInfo_onceToken != -1) {
    dispatch_once(&currentProcessInfo_onceToken, &__block_literal_global_42);
  }
  v2 = (void *)currentProcessInfo_currentProcessInfo;
  return v2;
}

- (_TVProcessInfo)init
{
  v4.receiver = self;
  v4.super_class = (Class)_TVProcessInfo;
  v2 = [(_TVProcessInfo *)&v4 init];
  if (v2)
  {
    v2->_currentTask = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x263EFFB08]);
    v2->_hasPrivateEntitlement = [(_TVProcessInfo *)v2 BOOLValueForEntitlement:@"com.apple.tvmlkit.private"];
    v2->_hasiTunesAPIEntitlement = [(_TVProcessInfo *)v2 valueForEntitlement:@"com.apple.tv.api" containsObject:@"iTunes"];
    v2->_hasiTunesStoreEntitlement = [(_TVProcessInfo *)v2 BOOLValueForEntitlement:@"com.apple.itunesstored.private"];
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
  v4.super_class = (Class)_TVProcessInfo;
  [(_TVProcessInfo *)&v4 dealloc];
}

- (id)valueForEntitlement:(id)a3
{
  objc_super v4 = (__CFString *)a3;
  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The entitlement argument must not be nil."];
  }
  v5 = [(_TVProcessInfo *)self currentTask];
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
  v3 = [(_TVProcessInfo *)self valueForEntitlement:a3];
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
  v7 = [(_TVProcessInfo *)self valueForEntitlement:a3];
  if (objc_opt_respondsToSelector()) {
    char v8 = [v7 containsObject:v6];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)hasPrivateEntitlement
{
  return self->_hasPrivateEntitlement;
}

- (BOOL)hasiTunesAPIEntitlement
{
  return self->_hasiTunesAPIEntitlement;
}

- (BOOL)hasiTunesStoreEntitlement
{
  return self->_hasiTunesStoreEntitlement;
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