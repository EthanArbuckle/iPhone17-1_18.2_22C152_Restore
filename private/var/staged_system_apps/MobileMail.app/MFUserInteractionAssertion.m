@interface MFUserInteractionAssertion
+ (OS_os_log)signpostLog;
+ (id)interactionAssertionWithReason:(id)a3;
+ (id)interactionAssertionWithReason:(id)a3 timeout:(double)a4;
- (EFDeallocInvocationToken)invalidationToken;
- (MFUserInteractionAssertion)initWithReason:(id)a3 timeout:(double)a4;
- (MFUserInteractionAssertion)initWithReason:(id)a3 timeout:(double)a4 application:(id)a5;
- (NSString)description;
- (NSString)reason;
- (double)timeout;
- (int64_t)state;
- (unint64_t)signpostID;
- (void)_invalidateWithState:(int64_t)a3;
- (void)invalidate;
- (void)setInvalidationToken:(id)a3;
- (void)setReason:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation MFUserInteractionAssertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationToken, 0);

  objc_storeStrong((id *)&self->_reason, 0);
}

+ (id)interactionAssertionWithReason:(id)a3 timeout:(double)a4
{
  id v5 = a3;
  v6 = [[MFUserInteractionAssertion alloc] initWithReason:v5 timeout:a4];

  return v6;
}

- (MFUserInteractionAssertion)initWithReason:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  v7 = +[UIApplication sharedApplication];
  v8 = [(MFUserInteractionAssertion *)self initWithReason:v6 timeout:v7 application:a4];

  return v8;
}

- (MFUserInteractionAssertion)initWithReason:(id)a3 timeout:(double)a4 application:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v31.receiver = self;
  v31.super_class = (Class)MFUserInteractionAssertion;
  v10 = [(MFUserInteractionAssertion *)&v31 init];
  if (v10)
  {
    v11 = (NSString *)[v8 copy];
    reason = v10->_reason;
    v10->_reason = v11;

    v10->_double timeout = a4;
    v13 = MFLogGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "MFUserInteractionAssertion beginIgnoringInteractionEvents with reason:%{public}@", buf, 0xCu);
    }

    v14 = [(MFUserInteractionAssertion *)v10 signpostID];
    v15 = +[MFUserInteractionAssertion signpostLog];
    v16 = v15;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v8;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v14, "MFUserInteractionAssertion", "Reason=%@", buf, 0xCu);
    }

    id v17 = [objc_alloc((Class)EFDeallocInvocationToken) initWithLabel:@"MFUserInteractionAssertion Invalidation Token"];
    v18 = +[EFScheduler mainThreadScheduler];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000DF84;
    v27[3] = &unk_10060DA78;
    id v28 = v9;
    id v19 = v17;
    id v29 = v19;
    v30 = v14;
    v20 = [v18 performCancelableBlock:v27];

    if (v20) {
      [v19 addInvocable:v20];
    }
    objc_storeStrong((id *)&v10->_invalidationToken, v17);
    if (v10->_timeout != -978307200.0)
    {
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v10);
      v21 = +[EFScheduler mainThreadScheduler];
      double timeout = v10->_timeout;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100202E08;
      v25[3] = &unk_100604FE8;
      objc_copyWeak(&v26, (id *)buf);
      id v23 = [v21 afterDelay:v25 performBlock:timeout];

      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }
  }
  return v10;
}

+ (OS_os_log)signpostLog
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A198;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699E18 != -1) {
    dispatch_once(&qword_100699E18, block);
  }
  v2 = (void *)qword_100699E10;

  return (OS_os_log *)v2;
}

- (unint64_t)signpostID
{
  v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (void)invalidate
{
}

- (void)_invalidateWithState:(int64_t)a3
{
  id v5 = [(MFUserInteractionAssertion *)self invalidationToken];
  if (([v5 isInvoked] & 1) == 0)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    objc_copyWeak(v9, &location);
    id v8 = v5;
    v9[1] = (id)a3;
    id v6 = +[EFScheduler mainThreadScheduler];
    [v6 performBlock:&v7];

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

- (EFDeallocInvocationToken)invalidationToken
{
  return self->_invalidationToken;
}

+ (id)interactionAssertionWithReason:(id)a3
{
  v3 = +[MFUserInteractionAssertion interactionAssertionWithReason:a3 timeout:-978307200.0];

  return v3;
}

- (NSString)description
{
  unint64_t v3 = [(MFUserInteractionAssertion *)self state];
  if (v3 > 2) {
    CFStringRef v4 = @"unknown";
  }
  else {
    CFStringRef v4 = off_10060DA98[v3];
  }
  [(MFUserInteractionAssertion *)self timeout];
  if (v5 == -978307200.0)
  {
    uint64_t v7 = @"never";
  }
  else
  {
    [(MFUserInteractionAssertion *)self timeout];
    uint64_t v7 = +[NSString stringWithFormat:@"%.01f", v6];
  }
  uint64_t v8 = objc_opt_class();
  id v9 = [(MFUserInteractionAssertion *)self reason];
  v10 = +[NSString stringWithFormat:@"<%@: %p> reason='%@' state=%@ timeout=%@", v8, self, v9, v4, v7];

  return (NSString *)v10;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_double timeout = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setInvalidationToken:(id)a3
{
}

@end