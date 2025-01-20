@interface FRSubscribedTagRanker
- (FCTagRanking)tagRanker;
- (FRSubscribedTagRanker)init;
- (FRSubscribedTagRanker)initWithTagRanker:(id)a3;
- (id)rankTagIDsDescending:(id)a3;
- (id)scoresForTagIDs:(id)a3;
- (void)prepareForUseWithCompletionHandler:(id)a3;
@end

@implementation FRSubscribedTagRanker

- (FRSubscribedTagRanker)initWithTagRanker:(id)a3
{
  id v5 = a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100074800();
  }
  v9.receiver = self;
  v9.super_class = (Class)FRSubscribedTagRanker;
  v6 = [(FRSubscribedTagRanker *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tagRanker, a3);
  }

  return v7;
}

- (FRSubscribedTagRanker)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRSubscribedTagRanker init]";
    __int16 v7 = 2080;
    v8 = "FRSubscribedTagRanker.m";
    __int16 v9 = 1024;
    int v10 = 21;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRSubscribedTagRanker init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (id)rankTagIDsDescending:(id)a3
{
  id v4 = a3;
  id v5 = [(FRSubscribedTagRanker *)self tagRanker];
  v6 = [v5 rankTagIDsDescending:v4];

  return v6;
}

- (id)scoresForTagIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(FRSubscribedTagRanker *)self tagRanker];
  v6 = [v5 scoresForTagIDs:v4];

  return v6;
}

- (void)prepareForUseWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(FRSubscribedTagRanker *)self tagRanker];
  [v5 prepareForUseWithCompletionHandler:v4];
}

- (FCTagRanking)tagRanker
{
  return self->_tagRanker;
}

- (void).cxx_destruct
{
}

@end