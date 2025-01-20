@interface TransparencyGPBValue
+ (id)descriptor;
@end

@implementation TransparencyGPBValue

+ (id)descriptor
{
  id v2 = (id)qword_100162158;
  if (!qword_100162158)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBValue messageName:@"Value" fileDescription:off_10015A938 fields:&off_10015A950 fieldCount:6 storageSize:48 flags:v4];
    [v2 setupOneofs:off_10015AA10 count:1 firstHasIndex:0xFFFFFFFFLL];
    qword_100162158 = (uint64_t)v2;
  }
  return v2;
}

@end