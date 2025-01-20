@interface APEventSessionPersistence
- (BOOL)_isNoFileExistsError:(id)a3;
- (id)rootUrl;
@end

@implementation APEventSessionPersistence

- (id)rootUrl
{
  if (qword_10028D240 != -1) {
    dispatch_once(&qword_10028D240, &stru_100238A50);
  }
  v2 = (void *)qword_10028D238;

  return v2;
}

- (BOOL)_isNoFileExistsError:(id)a3
{
  id v3 = a3;
  if ([v3 code] == (id)2
    && ([v3 domain],
        v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 isEqualToString:NSPOSIXErrorDomain],
        v4,
        (v5 & 1) != 0))
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    v7 = [v3 underlyingErrors];
    v8 = [v7 firstObject];

    if (v8 && [v8 code] == (id)2)
    {
      v9 = [v8 domain];
      unsigned __int8 v6 = [v9 isEqualToString:NSPOSIXErrorDomain];
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }
  return v6;
}

@end