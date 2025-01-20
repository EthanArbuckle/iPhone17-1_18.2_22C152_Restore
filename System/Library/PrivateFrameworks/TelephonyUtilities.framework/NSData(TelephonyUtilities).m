@interface NSData(TelephonyUtilities)
+ (id)tu_dataForURLSafeBase64EncodedString:()TelephonyUtilities;
+ (id)tu_dataForUUID:()TelephonyUtilities;
+ (uint64_t)tu_dataForAuditToken:()TelephonyUtilities;
- (id)tu_URLSafeBase64EncodedString;
- (id)tu_UUID;
@end

@implementation NSData(TelephonyUtilities)

- (id)tu_URLSafeBase64EncodedString
{
  if ([a1 length])
  {
    v2 = [a1 base64EncodedStringWithOptions:0];
    v3 = [v2 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

    v4 = [v3 stringByReplacingOccurrencesOfString:@"+" withString:@"-"];

    v5 = objc_msgSend(v4, "tu_stringByStrippingBase64Padding");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (uint64_t)tu_dataForAuditToken:()TelephonyUtilities
{
  return [MEMORY[0x1E4F1C9B8] dataWithBytes:a3 length:32];
}

+ (id)tu_dataForURLSafeBase64EncodedString:()TelephonyUtilities
{
  if (a3)
  {
    v3 = (void *)[a3 copy];
    v4 = [v3 stringByReplacingOccurrencesOfString:@"_" withString:@"/"];

    v5 = [v4 stringByReplacingOccurrencesOfString:@"-" withString:@"+"];

    v6 = objc_msgSend(v5, "tu_stringByAddingBase64Padding");

    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:1];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)tu_UUID
{
  v4[2] = *MEMORY[0x1E4F143B8];
  if ([a1 length] == 16)
  {
    v4[0] = 0;
    v4[1] = 0;
    [a1 getBytes:v4 length:16];
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v4];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

+ (id)tu_dataForUUID:()TelephonyUtilities
{
  v3 = a3;
  v5[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v5[0] = 0;
    v5[1] = 0;
    [a3 getUUIDBytes:v5];
    v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v5 length:16];
  }

  return v3;
}

@end