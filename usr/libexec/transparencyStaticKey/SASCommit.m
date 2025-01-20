@interface SASCommit
+ (id)descriptor;
@end

@implementation SASCommit

+ (id)descriptor
{
  id v2 = (id)qword_1000A74E8;
  if (!qword_1000A74E8)
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    LODWORD(v6) = 12;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:v3 rootClass:v4 file:sub_10001756C() fields:&off_1000A5CB0 fieldCount:3 storageSize:32 flags:v6];
    [v2 setupExtraTextInfo:&unk_100085421];
    qword_1000A74E8 = (uint64_t)v2;
  }
  return v2;
}

@end