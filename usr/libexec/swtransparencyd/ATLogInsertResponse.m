@interface ATLogInsertResponse
+ (id)descriptor;
@end

@implementation ATLogInsertResponse

+ (id)descriptor
{
  id result = (id)qword_10015B2F0;
  if (!qword_10015B2F0)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:ATLogInsertResponse messageName:@"ATLogInsertResponse" fileDescription:&unk_100156BD0 fields:&off_100156BE8 fieldCount:1 storageSize:8 flags:v3];
    qword_10015B2F0 = (uint64_t)result;
  }
  return result;
}

@end