@interface NSData(NanoPassKit)
- (id)asHexString;
- (id)npkDescription;
@end

@implementation NSData(NanoPassKit)

- (id)npkDescription
{
  unint64_t v2 = [a1 length];
  v3 = (unsigned __int8 *)[a1 bytes];
  v4 = (void *)[objc_allocWithZone(MEMORY[0x263F089D8]) initWithCapacity:512];
  [v4 appendFormat:@"{length = %lu, bytes = 0x", v2];
  if (v2 < 0x19)
  {
    for (; v2; --v2)
    {
      unsigned int v8 = *v3++;
      unsigned int v7 = v8;
      if (v8 >= 0xA0) {
        char v9 = 87;
      }
      else {
        char v9 = 48;
      }
      bytes[0] = v9 + (v7 >> 4);
      unsigned int v10 = v7 & 0xF;
      if (v10 >= 0xA) {
        char v11 = 87;
      }
      else {
        char v11 = 48;
      }
      bytes[1] = v11 + v10;
      CFStringRef v12 = CFStringCreateWithBytes(0, bytes, 2, 0x600u, 0);
      [v4 appendString:v12];
      CFRelease(v12);
    }
  }
  else
  {
    unint64_t v5 = -4;
    do
    {
      v5 += 4;
      append4Bytes(v4, &v3[v5]);
    }
    while (v5 < 0xC);
    [v4 appendString:@"... "];
    unint64_t v6 = v2 - 8;
    do
    {
      append4Bytes(v4, &v3[v6]);
      v6 += 4;
    }
    while (v6 < v2);
  }
  [v4 appendString:@"}"];
  return v4;
}

- (id)asHexString
{
  unint64_t v2 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", 2 * objc_msgSend(a1, "length"));
  if ([a1 length])
  {
    unint64_t v3 = 0;
    do
    {
      id v4 = a1;
      objc_msgSend(v2, "appendFormat:", @"%02X", *(unsigned __int8 *)(objc_msgSend(v4, "bytes") + v3++));
    }
    while (v3 < [v4 length]);
  }
  return v2;
}

@end