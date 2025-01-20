@interface VRFPublicKey
+ (id)descriptor;
- (BOOL)needsRefresh;
- (void)setNeedsRefresh:(BOOL)a3;
@end

@implementation VRFPublicKey

- (BOOL)needsRefresh
{
  v2 = objc_getAssociatedObject(self, @"needsRefresh");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setNeedsRefresh:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, @"needsRefresh", v4, (void *)1);
}

+ (id)descriptor
{
  id v2 = (id)qword_10015B1F8;
  if (!qword_10015B1F8)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:VRFPublicKey messageName:@"VRFPublicKey" fileDescription:&unk_1001560A0 fields:&off_1001560B8 fieldCount:2 storageSize:16 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010A1E4];
    qword_10015B1F8 = (uint64_t)v2;
  }
  return v2;
}

@end