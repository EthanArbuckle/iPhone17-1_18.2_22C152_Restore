@interface PCSServiceItemGetByIndex
@end

@implementation PCSServiceItemGetByIndex

CFNumberRef __PCSServiceItemGetByIndex_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFNumberRef result = *(const __CFNumber **)(a3 + 32);
  if (result)
  {
    int valuePtr = 0;
    CFNumberRef result = (const __CFNumber *)CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    int v6 = valuePtr;
  }
  else
  {
    int v6 = 0;
  }
  if (v6 == *(_DWORD *)(a1 + 40)) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
  return result;
}

@end