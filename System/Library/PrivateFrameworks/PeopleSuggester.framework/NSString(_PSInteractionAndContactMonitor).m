@interface NSString(_PSInteractionAndContactMonitor)
- (uint64_t)_ps_pointerSizedHash;
@end

@implementation NSString(_PSInteractionAndContactMonitor)

- (uint64_t)_ps_pointerSizedHash
{
  v0 = (void *)MEMORY[0x1A6243860]();
  if (_ps_pointerSizedHash__pasOnceToken1 != -1) {
    dispatch_once(&_ps_pointerSizedHash__pasOnceToken1, &__block_literal_global_15);
  }
  v1 = _PASRepairString();
  uint64_t v5 = 0;
  if (!objc_msgSend(v1, "_pas_fastUTF8StringPtrWithOptions:encodedLength:", 0, &v5))
  {
    id v2 = v1;
    [v2 UTF8String];
    uint64_t v5 = [v2 lengthOfBytesUsingEncoding:4];
  }
  uint64_t v3 = _PASMurmur3_x64_128();

  return v3;
}

@end