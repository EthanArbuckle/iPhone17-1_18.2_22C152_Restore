@interface MISLaunchWarningQueryResult
- (BOOL)isUserOverridden;
- (MISLaunchWarningQueryResult)initWithWarningState:(int64_t)a3 withUserOverridden:(BOOL)a4 withKBURL:(id)a5;
- (NSURL)kbURL;
- (int64_t)warningState;
@end

@implementation MISLaunchWarningQueryResult

- (MISLaunchWarningQueryResult)initWithWarningState:(int64_t)a3 withUserOverridden:(BOOL)a4 withKBURL:(id)a5
{
  id v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MISLaunchWarningQueryResult;
  v10 = [(MISLaunchWarningQueryResult *)&v19 init];
  v11 = v10;
  if (v10)
  {
    v10->warningState = a3;
    v10->isUserOverridden = a4;
    if (a3)
    {
      p_kbURL = (void **)&v10->kbURL;
      objc_storeStrong((id *)&v10->kbURL, a5);
      if (!v11->kbURL)
      {
        id v13 = objc_alloc(NSURL);
        uint64_t v16 = [v13 initWithString:v14 url:v15];
        v17 = *p_kbURL;
        *p_kbURL = (void *)v16;
      }
    }
  }

  return v11;
}

- (int64_t)warningState
{
  return self->warningState;
}

- (void).cxx_destruct
{
}

- (NSURL)kbURL
{
  return self->kbURL;
}

- (BOOL)isUserOverridden
{
  return self->isUserOverridden;
}

@end