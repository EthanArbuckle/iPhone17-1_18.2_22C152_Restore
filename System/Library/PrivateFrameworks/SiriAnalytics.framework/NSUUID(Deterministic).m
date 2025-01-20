@interface NSUUID(Deterministic)
+ (id)sa_deterministicUUIDv5ForNamespace:()Deterministic name:;
+ (id)sa_deterministicUUIDv5ForNamespaceUUID:()Deterministic sourceUUID:;
- (id)sa_uuidBytes;
@end

@implementation NSUUID(Deterministic)

- (id)sa_uuidBytes
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  v3[1] = 0;
  [a1 getUUIDBytes:v3];
  v1 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v3 length:16];
  return v1;
}

+ (id)sa_deterministicUUIDv5ForNamespace:()Deterministic name:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  memset(&v14, 0, sizeof(v14));
  id v5 = a4;
  id v6 = a3;
  CC_SHA1_Init(&v14);
  id v7 = v6;
  v8 = (const void *)objc_msgSend(v7, "bytes", *(_OWORD *)&v14.h0, *(_OWORD *)&v14.h4, *(_OWORD *)&v14.data[1], *(_OWORD *)&v14.data[5], *(_OWORD *)&v14.data[9], *(_OWORD *)&v14.data[13]);
  CC_LONG v9 = [v7 length];

  CC_SHA1_Update(&v14, v8, v9);
  id v10 = v5;
  v11 = (const void *)[v10 bytes];
  LODWORD(v8) = [v10 length];

  CC_SHA1_Update(&v14, v11, (CC_LONG)v8);
  CC_SHA1_Final(md, &v14);
  __int16 v16 = v16 & 0xFFF | 0x5000;
  char v17 = v17 & 0x3F | 0x80;
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:md];
  return v12;
}

+ (id)sa_deterministicUUIDv5ForNamespaceUUID:()Deterministic sourceUUID:
{
  id v5 = (void *)MEMORY[0x1E4F29128];
  id v6 = a4;
  id v7 = objc_msgSend(a3, "sa_uuidBytes");
  v8 = objc_msgSend(v6, "sa_uuidBytes");

  CC_LONG v9 = objc_msgSend(v5, "sa_deterministicUUIDv5ForNamespace:name:", v7, v8);

  return v9;
}

@end