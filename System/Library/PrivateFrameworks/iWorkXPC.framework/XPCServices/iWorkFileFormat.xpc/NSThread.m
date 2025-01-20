@interface NSThread
+ (id)tsu_currentThreadName;
+ (id)tsu_stringForQualityOfService:(int64_t)a3;
+ (id)tsu_stringForQualityOfServiceClass:(unsigned int)a3;
- (unsigned)tsu_qualityOfServiceClass;
@end

@implementation NSThread

+ (id)tsu_currentThreadName
{
  unsigned int v2 = +[NSThread isMainThread];
  char v3 = v2;
  v4 = @"MT";
  if (v2) {
    v5 = @"MT";
  }
  else {
    v5 = 0;
  }
  v6 = v5;
  if ((v3 & 1) == 0
    && (+[NSOperationQueue currentQueue],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 name],
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v4)
    || ![(__CFString *)v4 length])
  {
    label = dispatch_queue_get_label(0);
    if (label)
    {
      uint64_t v9 = +[NSString stringWithCString:label encoding:1];

      v4 = (__CFString *)v9;
    }
    if (!v4) {
      goto LABEL_13;
    }
  }
  if (![(__CFString *)v4 length])
  {
LABEL_13:
    long long v33 = 0u;
    memset(v34, 0, 28);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v10 = pthread_self();
    pthread_getname_np(v10, (char *)&v17, 0x12CuLL);
    if ((_BYTE)v17)
    {
      uint64_t v11 = +[NSString stringWithCString:&v17 encoding:1];

      v4 = (__CFString *)v11;
    }
    if (!v4) {
      goto LABEL_23;
    }
  }
  if (!-[__CFString length](v4, "length", v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33,
          v34[0],
          *(void *)&v34[1],
          *((void *)&v34[1] + 1)))
  {
LABEL_23:
    v12 = +[NSThread currentThread];
    uint64_t v13 = [v12 name];

    v4 = (__CFString *)v13;
    if (!v13) {
      goto LABEL_17;
    }
  }
  if (![(__CFString *)v4 length])
  {
LABEL_17:
    v14 = +[NSThread currentThread];
    uint64_t v15 = [v14 description];

    v4 = (__CFString *)v15;
  }
  return v4;
}

- (unsigned)tsu_qualityOfServiceClass
{
  NSQualityOfService v2 = [(NSThread *)self qualityOfService];
  if (v2 == NSQualityOfServiceUserInteractive) {
    int v3 = 33;
  }
  else {
    int v3 = 0;
  }
  if (v2 == NSQualityOfServiceUserInitiated) {
    int v4 = 25;
  }
  else {
    int v4 = v3;
  }
  if (v2 == NSQualityOfServiceUtility) {
    unsigned int v5 = 17;
  }
  else {
    unsigned int v5 = v4;
  }
  if (v2 == NSQualityOfServiceBackground) {
    int v6 = 9;
  }
  else {
    int v6 = 0;
  }
  if (v2 == NSQualityOfServiceDefault) {
    unsigned int v7 = 21;
  }
  else {
    unsigned int v7 = v6;
  }
  if (v2 <= 16) {
    return v7;
  }
  else {
    return v5;
  }
}

+ (id)tsu_stringForQualityOfService:(int64_t)a3
{
  CFStringRef v3 = @"NSQualityOfServiceUtility";
  CFStringRef v4 = @"NSQualityOfServiceUserInitiated";
  CFStringRef v5 = @"NSQualityOfServiceUserInteractive";
  if (a3 != 33) {
    CFStringRef v5 = 0;
  }
  if (a3 != 25) {
    CFStringRef v4 = v5;
  }
  if (a3 != 17) {
    CFStringRef v3 = v4;
  }
  CFStringRef v6 = @"NSQualityOfServiceDefault";
  CFStringRef v7 = @"NSQualityOfServiceBackground";
  if (a3 != 9) {
    CFStringRef v7 = 0;
  }
  if (a3 != -1) {
    CFStringRef v6 = v7;
  }
  if (a3 <= 16) {
    return (id)v6;
  }
  else {
    return (id)v3;
  }
}

+ (id)tsu_stringForQualityOfServiceClass:(unsigned int)a3
{
  CFStringRef v3 = @"QOS_CLASS_DEFAULT";
  CFStringRef v4 = @"QOS_CLASS_USER_INITIATED";
  CFStringRef v5 = @"QOS_CLASS_USER_INTERACTIVE";
  if (a3 != 33) {
    CFStringRef v5 = 0;
  }
  if (a3 != 25) {
    CFStringRef v4 = v5;
  }
  if (a3 != 21) {
    CFStringRef v3 = v4;
  }
  CFStringRef v6 = @"QOS_CLASS_UTILITY";
  if (a3 != 17) {
    CFStringRef v6 = 0;
  }
  if (a3 == 9) {
    CFStringRef v6 = @"QOS_CLASS_BACKGROUND";
  }
  if (!a3) {
    CFStringRef v6 = @"QOS_CLASS_UNSPECIFIED";
  }
  if ((int)a3 <= 20) {
    return (id)v6;
  }
  else {
    return (id)v3;
  }
}

@end