@interface NSDistributedNotificationCenter(VideosUI)
+ (uint64_t)vui_wasSentByDifferentProcess:()VideosUI;
- (void)vui_postNotificationName:()VideosUI object:userInfo:;
@end

@implementation NSDistributedNotificationCenter(VideosUI)

- (void)vui_postNotificationName:()VideosUI object:userInfo:
{
  if (a5)
  {
    id v9 = a4;
    id v10 = a3;
    id v11 = (id)[a5 mutableCopy];
  }
  else
  {
    v12 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v13 = a4;
    id v14 = a3;
    id v11 = objc_alloc_init(v12);
  }
  id v18 = v11;
  v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:getpid()];
  [v18 setObject:v15 forKeyedSubscript:@"sendingPID"];

  [a1 postNotificationName:a3 object:a4 userInfo:v18 deliverImmediately:1];
  id v16 = a3;
  v17 = (const char *)[v16 cStringUsingEncoding:4];

  notify_post(v17);
}

+ (uint64_t)vui_wasSentByDifferentProcess:()VideosUI
{
  v3 = (void *)MEMORY[0x1E4F28ED0];
  id v4 = a3;
  v5 = [v3 numberWithUnsignedInteger:getpid()];
  v6 = [v4 objectForKeyedSubscript:@"sendingPID"];

  uint64_t v7 = [v5 isEqualToNumber:v6] ^ 1;
  return v7;
}

@end