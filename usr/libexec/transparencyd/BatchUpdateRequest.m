@interface BatchUpdateRequest
+ (id)descriptor;
@end

@implementation BatchUpdateRequest

+ (id)descriptor
{
  id v2 = (id)qword_10032EC98;
  if (!qword_10032EC98)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:BatchUpdateRequest messageName:@"BatchUpdateRequest" fileDescription:&unk_100324200 fields:&off_100324180 fieldCount:4 storageSize:32 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028AF3C];
    qword_10032EC98 = (uint64_t)v2;
  }
  return v2;
}

@end