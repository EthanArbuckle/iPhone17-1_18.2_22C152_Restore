@interface VRFPublicKey
+ (id)descriptor;
- (BOOL)needsRefresh;
- (void)setNeedsRefresh:(BOOL)a3;
@end

@implementation VRFPublicKey

+ (id)descriptor
{
  id v2 = (id)qword_10032ED90;
  if (!qword_10032ED90)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:VRFPublicKey messageName:@"VRFPublicKey" fileDescription:&unk_100324E10 fields:&off_100324E28 fieldCount:2 storageSize:16 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028B328];
    qword_10032ED90 = (uint64_t)v2;
  }
  return v2;
}

- (BOOL)needsRefresh
{
  id v2 = objc_getAssociatedObject(self, @"needsRefresh");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setNeedsRefresh:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, @"needsRefresh", v4, (void *)1);
}

@end