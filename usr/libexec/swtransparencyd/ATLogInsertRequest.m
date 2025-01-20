@interface ATLogInsertRequest
+ (id)descriptor;
@end

@implementation ATLogInsertRequest

+ (id)descriptor
{
  id v2 = (id)qword_10015B2E8;
  if (!qword_10015B2E8)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:ATLogInsertRequest messageName:@"ATLogInsertRequest" fileDescription:&unk_100156BD0 fields:&off_100156B50 fieldCount:4 storageSize:32 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010A3B0];
    qword_10015B2E8 = (uint64_t)v2;
  }
  return v2;
}

@end