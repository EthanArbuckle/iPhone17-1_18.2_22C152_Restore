@interface TCCDBinCompatPolicyOverride
- (TCCDBinCompatPolicyOverride)init;
- (id)allowedParser:(id)a3;
- (void)loadAndParse;
@end

@implementation TCCDBinCompatPolicyOverride

- (TCCDBinCompatPolicyOverride)init
{
  v9.receiver = self;
  v9.super_class = (Class)TCCDBinCompatPolicyOverride;
  v2 = [(TCCDPolicyOverride *)&v9 init];
  if (v2)
  {
    if (os_variant_allows_internal_security_policies())
    {
      v3 = +[NSFileManager defaultManager];
      unsigned int v4 = [v3 fileExistsAtPath:@"/Library/Apple/Library/Bundles/TCC_Compatibility.bundle/Contents/Resources/AllowApplicationsList.plist"];

      if (v4) {
        CFStringRef v5 = @"/Library/Apple/Library/Bundles/TCC_Compatibility.bundle/Contents/Resources/AllowApplicationsList.plist";
      }
      else {
        CFStringRef v5 = @"/System/Library/Sandbox/TCC_Compatibility.bundle/Contents/Resources/AllowApplicationsList.plist";
      }
      v6 = +[TCCDPolicyOverride useString:v5 orReadFromDefaults:@"binCompatOverridePath"];
      [(TCCDPolicyOverride *)v2 setPlistFilePath:v6];
    }
    v7 = v2;
  }

  return v2;
}

- (id)allowedParser:(id)a3
{
  if (a3) {
    return a3;
  }
  else {
    return &__kCFBooleanTrue;
  }
}

- (void)loadAndParse
{
  v4.receiver = self;
  v4.super_class = (Class)TCCDBinCompatPolicyOverride;
  [(TCCDPolicyOverride *)&v4 loadAndParse];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003584C;
  block[3] = &unk_100094E78;
  block[4] = self;
  if (qword_1000AC618 != -1) {
    dispatch_once(&qword_1000AC618, block);
  }
}

@end