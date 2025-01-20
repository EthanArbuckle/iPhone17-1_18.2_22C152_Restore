@interface ATLogProofResponse
+ (id)descriptor;
@end

@implementation ATLogProofResponse

+ (id)descriptor
{
  id result = (id)qword_10015B300;
  if (!qword_10015B300)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:ATLogProofResponse messageName:@"ATLogProofResponse" fileDescription:&unk_100156BD0 fields:&off_100156C48 fieldCount:2 storageSize:16 flags:v3];
    qword_10015B300 = (uint64_t)result;
  }
  return result;
}

@end