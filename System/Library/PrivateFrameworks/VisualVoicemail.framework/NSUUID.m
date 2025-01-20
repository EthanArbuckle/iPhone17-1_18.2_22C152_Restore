@interface NSUUID
+ (id)hashedUUID:(id)a3;
+ (id)vm_UUIDv5ForData:(id)a3 namespaceUUID:(id)a4;
+ (id)vm_UUIDv5ForString:(id)a3;
@end

@implementation NSUUID

+ (id)vm_UUIDv5ForString:(id)a3
{
  if (a3)
  {
    v4 = [a3 dataUsingEncoding:4];
    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"0702F1D1-3498-4A05-A546-B04037E868FF"];
    v6 = v5;
    v7 = 0;
    if (v4 && v5)
    {
      v7 = objc_msgSend(a1, "vm_UUIDv5ForData:namespaceUUID:", v4, v5);
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)vm_UUIDv5ForData:(id)a3 namespaceUUID:(id)a4
{
  id v4 = 0;
  if (a3 && a4)
  {
    data[0] = 0;
    data[1] = 0;
    id v6 = a3;
    [a4 getUUIDBytes:data];
    memset(&v11, 0, sizeof(v11));
    CC_SHA1_Init(&v11);
    CC_SHA1_Update(&v11, data, 0x10u);
    id v7 = v6;
    id v8 = [v7 bytes];
    CC_LONG v9 = [v7 length];

    CC_SHA1_Update(&v11, v8, v9);
    CC_SHA1_Final(md, &v11);
    long long v14 = *(_OWORD *)md;
    BYTE6(v14) = md[6] & 0xF | 0x50;
    BYTE8(v14) = md[8] & 0x3F | 0x80;
    id v4 = [objc_alloc((Class)objc_opt_class()) initWithUUIDBytes:&v14];
  }
  return v4;
}

+ (id)hashedUUID:(id)a3
{
  v3 = [a3 dataUsingEncoding:4];
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"0702F1D1-3498-4A05-A546-B04037E868FF"];
  data[0] = 0;
  data[1] = 0;
  [v4 getUUIDBytes:data];
  memset(&v8, 0, sizeof(v8));
  CC_SHA1_Init(&v8);
  CC_SHA1_Update(&v8, data, 0x10u);
  id v5 = v3;
  CC_SHA1_Update(&v8, [v5 bytes], (CC_LONG)objc_msgSend(v5, "length"));
  CC_SHA1_Final(md, &v8);
  long long v10 = *(_OWORD *)md;
  BYTE6(v10) = md[6] & 0xF | 0x50;
  BYTE8(v10) = md[8] & 0x3F | 0x80;
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&v10];

  return v6;
}

@end