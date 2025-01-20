@interface KTDeviceInfo
- (id)modelID;
- (id)osVersion;
- (id)serialNumber;
@end

@implementation KTDeviceInfo

- (id)modelID
{
  if (qword_10032F120 != -1) {
    dispatch_once(&qword_10032F120, &stru_1002C6E78);
  }
  v2 = (void *)qword_10032F118;

  return v2;
}

- (id)osVersion
{
  long long v13 = 0u;
  memset(v12, 0, sizeof(v12));
  size_t v9 = 256;
  int v2 = sysctlbyname("kern.osrelease", v12, &v9, 0, 0);
  long long v11 = 0u;
  memset(v10, 0, sizeof(v10));
  size_t v8 = 256;
  if (sysctlbyname("kern.osversion", v10, &v8, 0, 0) | v2
    || (HIBYTE(v13) = 0,
        HIBYTE(v11) = 0,
        +[NSString stringWithFormat:@"%s (%s)", v12, v10],
        (v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v3 = +[NSProcessInfo processInfo];
    v4 = [v3 operatingSystemVersionString];

    v5 = [v4 stringByReplacingOccurrencesOfString:@"Version" withString:&stru_1002CE4C0];
  }
  v6 = +[NSString stringWithFormat:@"%@", v5];

  return v6;
}

- (id)serialNumber
{
  int v2 = (void *)MGCopyAnswerWithError();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    int v2 = 0;
  }

  return v2;
}

@end