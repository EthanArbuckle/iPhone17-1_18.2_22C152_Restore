@interface NSTimer(PhotosUI)
+ (id)pu_scheduledTimerWithTimeInterval:()PhotosUI repeats:block:;
+ (id)pu_scheduledTimerWithTimeInterval:()PhotosUI weakTarget:selector:userInfo:repeats:;
+ (id)pu_timerWithFireDate:()PhotosUI interval:repeats:block:;
+ (void)blockInvoke:()PhotosUI;
@end

@implementation NSTimer(PhotosUI)

+ (void)blockInvoke:()PhotosUI
{
  v3 = [a3 userInfo];
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }
}

+ (id)pu_scheduledTimerWithTimeInterval:()PhotosUI repeats:block:
{
  v8 = (void *)MEMORY[0x1E4F1CB00];
  v9 = (void *)[a5 copy];
  v10 = [v8 scheduledTimerWithTimeInterval:a1 target:sel_blockInvoke_ selector:v9 userInfo:a4 repeats:a2];

  return v10;
}

+ (id)pu_timerWithFireDate:()PhotosUI interval:repeats:block:
{
  v10 = (objc_class *)MEMORY[0x1E4F1CB00];
  id v11 = a6;
  id v12 = a4;
  id v13 = [v10 alloc];
  v14 = (void *)[v11 copy];

  v15 = (void *)[v13 initWithFireDate:v12 interval:a1 target:sel_blockInvoke_ selector:v14 userInfo:a5 repeats:a2];
  return v15;
}

+ (id)pu_scheduledTimerWithTimeInterval:()PhotosUI weakTarget:selector:userInfo:repeats:
{
  id v11 = a6;
  id v12 = a4;
  id v13 = objc_alloc_init(_PUTimerTarget);
  [(_PUTimerTarget *)v13 setTarget:v12];

  [(_PUTimerTarget *)v13 setSelector:a5];
  v14 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:v13 target:sel_handleTimer_ selector:v11 userInfo:a7 repeats:a1];

  return v14;
}

@end