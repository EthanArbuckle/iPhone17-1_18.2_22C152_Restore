@interface PBCodable(VCPBCodable)
- (uint64_t)readFrom:()VCPBCodable error:;
- (uint64_t)writeTo:()VCPBCodable error:;
@end

@implementation PBCodable(VCPBCodable)

- (uint64_t)readFrom:()VCPBCodable error:
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [a1 readFrom:v6];
  uint64_t v8 = v7;
  if (a4 && (v7 & 1) == 0)
  {
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to read protobuf message from %lu of %lu bytes", objc_msgSend(v6, "position"), objc_msgSend(v6, "length"));
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14[0] = v9;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    *a4 = [v10 errorWithDomain:@"PBRequesterErrorDomain" code:6005 userInfo:v11];
  }
  return v8;
}

- (uint64_t)writeTo:()VCPBCodable error:
{
  if (a4) {
    *a4 = 0;
  }
  return 1;
}

@end