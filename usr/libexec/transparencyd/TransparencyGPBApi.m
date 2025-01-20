@interface TransparencyGPBApi
+ (id)descriptor;
@end

@implementation TransparencyGPBApi

+ (id)descriptor
{
  id result = (id)qword_10032EC48;
  if (!qword_10032EC48)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBApi messageName:@"Api" fileDescription:off_100323FE8 fields:&off_100323F08 fieldCount:7 storageSize:56 flags:v3];
    qword_10032EC48 = (uint64_t)result;
  }
  return result;
}

@end