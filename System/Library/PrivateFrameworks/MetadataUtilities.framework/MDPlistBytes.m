@interface MDPlistBytes
@end

@implementation MDPlistBytes

__MDPlistBytes *__37___MDPlistBytes_emptyArrayPlistBytes__block_invoke()
{
  result = +[_MDPlistBytes createArrayPlistBytesUsingBlock:&__block_literal_global_4];
  _MergedGlobals = (uint64_t)result;
  return result;
}

__MDPlistBytes *__42___MDPlistBytes_emptyDictionaryPlistBytes__block_invoke()
{
  result = +[_MDPlistBytes createDictionaryPlistBytesUsingBlock:&__block_literal_global_8];
  qword_1E95CA2F0 = (uint64_t)result;
  return result;
}

void __37___MDPlistBytes_nullObjectPlistBytes__block_invoke()
{
  v0 = [[_MDMutablePlistBytes alloc] initWithCapacity:0 useMalloc:0];
  if (!v0) {
    +[_MDPlistBytes createPlistBytes:]();
  }
  uint64_t v1 = (uint64_t)v0;
  CFRetain(v0);

  _MDPlistBytesBeginPlist(v1);
  __MDPlistBytesAddObject(v1, (const __CFString *)*MEMORY[0x1E4F1D260]);
  _MDPlistBytesEndPlist(v1);
  if (*(_WORD *)(v1 + 32))
  {
    CFRelease((CFTypeRef)v1);
    uint64_t v1 = 0;
  }
  else
  {
    *(unsigned char *)(v1 + 34) &= ~1u;
  }
  qword_1E95CA300 = v1;
}

@end