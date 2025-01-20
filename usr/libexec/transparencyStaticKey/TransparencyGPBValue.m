@interface TransparencyGPBValue
+ (id)descriptor;
@end

@implementation TransparencyGPBValue

+ (id)descriptor
{
  id v2 = (id)qword_1000A7628;
  if (!qword_1000A7628)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBValue messageName:@"Value" fileDescription:off_1000A69C8 fields:&off_1000A69E0 fieldCount:6 storageSize:48 flags:v4];
    [v2 setupOneofs:off_1000A6AA0 count:1 firstHasIndex:0xFFFFFFFFLL];
    qword_1000A7628 = (uint64_t)v2;
  }
  return v2;
}

@end