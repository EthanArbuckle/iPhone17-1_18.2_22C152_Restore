@interface BatchUpdateResponse
+ (id)descriptor;
@end

@implementation BatchUpdateResponse

+ (id)descriptor
{
  id v2 = (id)qword_10032ECB0;
  if (!qword_10032ECB0)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:BatchUpdateResponse messageName:@"BatchUpdateResponse" fileDescription:&unk_100324200 fields:&off_100324438 fieldCount:3 storageSize:24 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028AF6C];
    qword_10032ECB0 = (uint64_t)v2;
  }
  return v2;
}

@end