@interface BatchQueryRequest
+ (id)descriptor;
@end

@implementation BatchQueryRequest

+ (id)descriptor
{
  id result = (id)qword_10032EEA8;
  if (!qword_10032EEA8)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:BatchQueryRequest messageName:@"BatchQueryRequest" fileDescription:&unk_100325780 fields:&off_100325818 fieldCount:3 storageSize:24 flags:v3];
    qword_10032EEA8 = (uint64_t)result;
  }
  return result;
}

@end