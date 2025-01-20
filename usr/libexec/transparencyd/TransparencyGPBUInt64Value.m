@interface TransparencyGPBUInt64Value
+ (id)descriptor;
@end

@implementation TransparencyGPBUInt64Value

+ (id)descriptor
{
  id result = (id)qword_10032EC10;
  if (!qword_10032EC10)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBUInt64Value messageName:@"UInt64Value" fileDescription:off_100323D98 fields:&off_100323DF0 fieldCount:1 storageSize:16 flags:v3];
    qword_10032EC10 = (uint64_t)result;
  }
  return result;
}

@end