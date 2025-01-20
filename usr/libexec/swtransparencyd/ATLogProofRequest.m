@interface ATLogProofRequest
+ (id)descriptor;
@end

@implementation ATLogProofRequest

+ (id)descriptor
{
  id result = (id)qword_10015B2F8;
  if (!qword_10015B2F8)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:ATLogProofRequest messageName:@"ATLogProofRequest" fileDescription:&unk_100156BD0 fields:&off_100156C08 fieldCount:2 storageSize:16 flags:v3];
    qword_10015B2F8 = (uint64_t)result;
  }
  return result;
}

@end