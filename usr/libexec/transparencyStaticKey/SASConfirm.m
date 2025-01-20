@interface SASConfirm
+ (id)descriptor;
@end

@implementation SASConfirm

+ (id)descriptor
{
  id v2 = (id)qword_1000A7510;
  if (!qword_1000A7510)
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    LODWORD(v6) = 12;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:v3 rootClass:v4 file:sub_10001756C() fields:&off_1000A5E50 fieldCount:3 storageSize:32 flags:v6];
    [v2 setupExtraTextInfo:&unk_100085440];
    qword_1000A7510 = (uint64_t)v2;
  }
  return v2;
}

@end