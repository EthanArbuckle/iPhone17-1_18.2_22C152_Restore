@interface NSData(UCNSDataExtras)
- (id)transformV1ToV2Encoding;
- (id)transformV1ToV3Encoding;
- (id)transformV2ToV1Encoding;
- (id)transformV3ToV1Encoding;
@end

@implementation NSData(UCNSDataExtras)

- (id)transformV2ToV1Encoding
{
  if ([a1 length] == 4)
  {
    id v2 = a1;
    __int16 v3 = *(unsigned __int8 *)[v2 bytes] << 6;
    v7[0] = HIBYTE(v3);
    v7[1] = v3;
    id v4 = (id)[MEMORY[0x263EFF990] dataWithBytes:v7 length:2];
    [v4 increaseLengthBy:13];
    id v5 = (id)objc_msgSend(v2, "subdataWithRange:", 1, 3);
    [v4 appendData:v5];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)transformV3ToV1Encoding
{
  if ([a1 length] == 19)
  {
    __int16 v4 = 0;
    id v2 = (id)[MEMORY[0x263EFF990] dataWithBytes:&v4 length:2];
    [v2 appendData:a1];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)transformV1ToV2Encoding
{
  if ([a1 length] == 18)
  {
    id v2 = a1;
    __int16 v3 = (unsigned __int8 *)[v2 bytes];
    HIDWORD(v4) = *v3;
    LODWORD(v4) = v3[1] << 24;
    char v8 = v4 >> 30;
    id v5 = (id)[MEMORY[0x263EFF990] dataWithBytes:&v8 length:1];
    id v6 = (id)objc_msgSend(v2, "subdataWithRange:", objc_msgSend(v2, "length") - 3, 3);
    [v5 appendData:v6];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)transformV1ToV3Encoding
{
  if ([a1 length] == 21) {
    id v2 = (id)objc_msgSend(a1, "subdataWithRange:", 2, objc_msgSend(a1, "length") - 2);
  }
  else {
    id v2 = 0;
  }
  return v2;
}

@end