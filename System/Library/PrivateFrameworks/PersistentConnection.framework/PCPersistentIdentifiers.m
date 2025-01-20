@interface PCPersistentIdentifiers
+ (id)_processNamePrefix;
+ (id)processNameAndPidIdentifier;
+ (id)processNamePidAndStringIdentifier:(id)a3;
+ (int)pidFromMatchingIdentifer:(id)a3;
+ (unint64_t)hostUniqueIdentifier;
@end

@implementation PCPersistentIdentifiers

+ (unint64_t)hostUniqueIdentifier
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__PCPersistentIdentifiers_hostUniqueIdentifier__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (hostUniqueIdentifier_pred != -1) {
    dispatch_once(&hostUniqueIdentifier_pred, v3);
  }
  return hostUniqueIdentifier_hostIdentifier;
}

+ (id)processNamePidAndStringIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    if (([v4 canBeConvertedToEncoding:30] & 1) == 0)
    {
      v6 = [v5 dataUsingEncoding:30 allowLossyConversion:1];
      uint64_t v7 = [[NSString alloc] initWithData:v6 encoding:30];

      v5 = (void *)v7;
    }
    if ((unint64_t)[v5 length] >= 0x65)
    {
      v8 = [v5 substringToIndex:100];
      uint64_t v9 = [v8 stringByAppendingString:@"..."];

      v5 = (void *)v9;
    }
    v10 = [a1 _processNamePrefix];
    v11 = [v10 stringByAppendingFormat:@"%i,%@]", getpid(), v5];
  }
  else
  {
    v5 = [a1 _processNamePrefix];
    v11 = objc_msgSend(v5, "stringByAppendingFormat:", @"%i]", getpid());
  }

  return v11;
}

+ (id)_processNamePrefix
{
  if (_processNamePrefix_pred != -1) {
    dispatch_once(&_processNamePrefix_pred, &__block_literal_global_4);
  }
  v2 = (void *)_processNamePrefix_prefix;
  return v2;
}

unsigned __int8 *__47__PCPersistentIdentifiers_hostUniqueIdentifier__block_invoke(uint64_t a1)
{
  data[2] = *MEMORY[0x1E4F143B8];
  data[0] = 0;
  data[1] = 0;
  size_t v7 = 16;
  if (sysctlbyname("kern.boottime", data, &v7, 0, 0))
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v6 = __error();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", v5, v4, @"PCPersistentIdentifiers.m", 29, @"sysctlbyname() for \"kern.boottime\" failed: %s", strerror(*v6));
  }
  result = CC_SHA1(data, 0x10u, md);
  hostUniqueIdentifier_hostIdentifier = bswap64(*(unint64_t *)md);
  return result;
}

void __45__PCPersistentIdentifiers__processNamePrefix__block_invoke()
{
  id v0 = [NSString alloc];
  id v4 = [MEMORY[0x1E4F28F80] processInfo];
  v1 = [v4 processName];
  uint64_t v2 = [v0 initWithFormat:@"com.apple.persistentconnection[%@,", v1];
  v3 = (void *)_processNamePrefix_prefix;
  _processNamePrefix_prefix = v2;
}

+ (id)processNameAndPidIdentifier
{
  return (id)[a1 processNamePidAndStringIdentifier:0];
}

+ (int)pidFromMatchingIdentifer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _processNamePrefix];
  uint64_t v6 = [v4 rangeOfString:v5 options:8];
  uint64_t v8 = v7;

  int v9 = -1;
  if (!v6 && v8)
  {
    v10 = [v4 substringFromIndex:v8];
    int v9 = [v10 intValue];
  }
  return v9;
}

@end