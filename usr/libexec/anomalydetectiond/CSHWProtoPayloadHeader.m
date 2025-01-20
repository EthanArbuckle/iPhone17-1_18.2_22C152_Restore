@interface CSHWProtoPayloadHeader
+ (id)descriptor;
@end

@implementation CSHWProtoPayloadHeader

+ (id)descriptor
{
  id v2 = (id)qword_1003DD780;
  if (!qword_1003DD780)
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    LODWORD(v6) = 12;
    id v2 = +[GPBDescriptor allocDescriptorForClass:v3 rootClass:v4 file:sub_1002E9B88() fields:&off_1003DD228 fieldCount:8 storageSize:72 flags:v6];
    [v2 setupExtraTextInfo:&unk_10033F5FE];
    qword_1003DD780 = (uint64_t)v2;
  }
  return v2;
}

@end