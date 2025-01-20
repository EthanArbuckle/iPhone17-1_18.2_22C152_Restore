@interface TransparencyGPBApi
+ (id)descriptor;
@end

@implementation TransparencyGPBApi

+ (id)descriptor
{
  id result = (id)qword_100162210;
  if (!qword_100162210)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBApi messageName:@"Api" fileDescription:off_10015B058 fields:&off_10015AF78 fieldCount:7 storageSize:56 flags:v3];
    qword_100162210 = (uint64_t)result;
  }
  return result;
}

@end