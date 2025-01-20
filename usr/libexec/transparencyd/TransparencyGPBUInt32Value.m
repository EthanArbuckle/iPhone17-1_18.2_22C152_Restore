@interface TransparencyGPBUInt32Value
+ (id)descriptor;
@end

@implementation TransparencyGPBUInt32Value

+ (id)descriptor
{
  id result = (id)qword_10032EC20;
  if (!qword_10032EC20)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBUInt32Value messageName:@"UInt32Value" fileDescription:off_100323D98 fields:&off_100323E30 fieldCount:1 storageSize:8 flags:v3];
    qword_10032EC20 = (uint64_t)result;
  }
  return result;
}

@end