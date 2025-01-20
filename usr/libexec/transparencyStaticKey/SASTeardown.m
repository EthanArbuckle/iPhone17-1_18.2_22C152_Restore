@interface SASTeardown
+ (id)descriptor;
@end

@implementation SASTeardown

+ (id)descriptor
{
  id v2 = (id)qword_1000A74F8;
  if (!qword_1000A74F8)
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    LODWORD(v6) = 12;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:v3 rootClass:v4 file:sub_10001756C() fields:&off_1000A5D30 fieldCount:2 storageSize:16 flags:v6];
    [v2 setupExtraTextInfo:&unk_10008542D];
    qword_1000A74F8 = (uint64_t)v2;
  }
  return v2;
}

@end