@interface NSUUID(MSVBase64)
+ (id)msv_UUIDWithData:()MSVBase64;
+ (id)msv_uuidWithCFUUID:()MSVBase64;
+ (id)uuidWithMSVBase64UUID:()MSVBase64;
- (CFUUIDRef)msv_copyCFUUID;
- (id)MSVBase64UUIDString;
- (id)initWithMSVBase64UUIDString:()MSVBase64;
- (id)msv_UUIDData;
@end

@implementation NSUUID(MSVBase64)

- (id)msv_UUIDData
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  v3[1] = 0;
  [a1 getUUIDBytes:v3];
  v1 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v3 length:16];
  return v1;
}

+ (id)msv_UUIDWithData:()MSVBase64
{
  id v4 = a3;
  if ([v4 length] == 16) {
    v5 = objc_msgSend([a1 alloc], "initWithUUIDBytes:", objc_msgSend(v4, "bytes"));
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (CFUUIDRef)msv_copyCFUUID
{
  *(void *)&v2.byte0 = 0;
  *(void *)&v2.byte8 = 0;
  [a1 getUUIDBytes:&v2];
  return CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v2);
}

- (id)MSVBase64UUIDString
{
  v1 = objc_msgSend(a1, "msv_UUIDData");
  CFUUIDBytes v2 = [v1 base64EncodedStringWithOptions:0];
  v3 = [v2 substringToIndex:22];

  return v3;
}

- (id)initWithMSVBase64UUIDString:()MSVBase64
{
  id v4 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 stringByAppendingString:@"=="];

  v8 = (void *)[v6 initWithBase64EncodedString:v7 options:0];
  if ([v8 length] == 16)
  {
    a1 = objc_msgSend(a1, "initWithUUIDBytes:", objc_msgSend(v8, "bytes"));
    id v9 = a1;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)msv_uuidWithCFUUID:()MSVBase64
{
  CFUUIDBytes v5 = CFUUIDGetUUIDBytes(uuid);
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v5];
  return v3;
}

+ (id)uuidWithMSVBase64UUID:()MSVBase64
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMSVBase64UUIDString:v3];

  return v4;
}

@end