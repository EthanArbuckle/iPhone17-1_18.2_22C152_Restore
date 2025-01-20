@interface TransparencyGPBApi
+ (id)descriptor;
@end

@implementation TransparencyGPBApi

+ (id)descriptor
{
  id result = (id)qword_1000A75A0;
  if (!qword_1000A75A0)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBApi messageName:@"Api" fileDescription:off_1000A6468 fields:&off_1000A6388 fieldCount:7 storageSize:56 flags:v3];
    qword_1000A75A0 = (uint64_t)result;
  }
  return result;
}

@end