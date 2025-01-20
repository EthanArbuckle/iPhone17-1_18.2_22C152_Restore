@interface NSObject(VideosUI)
- (void)vui_debounce:()VideosUI object:delay:;
@end

@implementation NSObject(VideosUI)

- (void)vui_debounce:()VideosUI object:delay:
{
  v8 = (void *)MEMORY[0x1E4FBA8A8];
  id v9 = a5;
  [v8 cancelPreviousPerformRequestsWithTarget:a1 selector:a4 object:v9];
  [a1 performSelector:a4 withObject:v9 afterDelay:a2];
}

@end