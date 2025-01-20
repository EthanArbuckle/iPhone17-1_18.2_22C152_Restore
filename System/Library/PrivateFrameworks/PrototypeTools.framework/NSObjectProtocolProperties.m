@interface NSObjectProtocolProperties
@end

@implementation NSObjectProtocolProperties

void ___NSObjectProtocolProperties_block_invoke()
{
  unsigned int outCount = 0;
  v0 = protocol_copyPropertyList((Protocol *)&unk_1F19D1580, &outCount);
  id v1 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v2 = (void *)_NSObjectProtocolProperties___properties;
  _NSObjectProtocolProperties___properties = (uint64_t)v1;

  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      Name = property_getName(v0[i]);
      v5 = (void *)_NSObjectProtocolProperties___properties;
      v6 = _NSStringFromRuntimeString(Name);
      [v5 addObject:v6];
    }
  }
  free(v0);
}

@end