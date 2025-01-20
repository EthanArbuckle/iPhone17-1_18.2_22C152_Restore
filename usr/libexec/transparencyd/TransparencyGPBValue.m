@interface TransparencyGPBValue
+ (id)descriptor;
@end

@implementation TransparencyGPBValue

+ (id)descriptor
{
  id v2 = (id)qword_10032EB90;
  if (!qword_10032EB90)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBValue messageName:@"Value" fileDescription:off_1003238C8 fields:&off_1003238E0 fieldCount:6 storageSize:48 flags:v4];
    [v2 setupOneofs:off_1003239A0 count:1 firstHasIndex:0xFFFFFFFFLL];
    qword_10032EB90 = (uint64_t)v2;
  }
  return v2;
}

@end