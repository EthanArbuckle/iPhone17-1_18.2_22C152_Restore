@interface WebFrame(WebInternal)
+ (uint64_t)_createFrameWithPage:()WebInternal frameName:frameView:ownerElement:;
+ (void)_createFrameWithPage:()WebInternal frameName:frameView:ownerElement:;
@end

@implementation WebFrame(WebInternal)

+ (void)_createFrameWithPage:()WebInternal frameName:frameView:ownerElement:
{
  v3 = *(const void **)(a1 + 8);
  result = (void *)WTF::fastMalloc((WTF *)0x20);
  v5 = result;
  void *result = &unk_1F3C7A3E0;
  result[1] = 0;
  result[2] = v3;
  if (v3) {
    result = CFRetain(v3);
  }
  v5[3] = 0;
  *a2 = v5;
  return result;
}

+ (uint64_t)_createFrameWithPage:()WebInternal frameName:frameView:ownerElement:
{
  v3 = (const void *)*((void *)this + 1);
  *(void *)this = &unk_1F3C7AC18;
  *((void *)this + 1) = 0;
  if (v3) {
    CFRelease(v3);
  }
  return WTF::fastFree(this, a2);
}

@end