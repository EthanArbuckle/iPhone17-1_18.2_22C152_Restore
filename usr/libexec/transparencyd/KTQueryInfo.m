@interface KTQueryInfo
+ (id)descriptor;
@end

@implementation KTQueryInfo

+ (id)descriptor
{
  id v2 = (id)qword_10032F178;
  if (!qword_10032F178)
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    if (!qword_10032F180) {
      qword_10032F180 = [[TransparencyGPBFileDescriptor alloc] initWithPackage:&stru_1002CE4C0 syntax:3];
    }
    LODWORD(v6) = 12;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v3, v4, v6);
    [v2 setupExtraTextInfo:&unk_10028B498];
    qword_10032F178 = (uint64_t)v2;
  }
  return v2;
}

@end