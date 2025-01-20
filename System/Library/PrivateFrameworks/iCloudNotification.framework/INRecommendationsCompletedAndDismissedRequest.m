@interface INRecommendationsCompletedAndDismissedRequest
+ (Class)responseClass;
- (INRecommendationsCompletedAndDismissedRequest)initWithAccount:(id)a3 configuration:(id)a4;
- (id)urlRequest;
- (id)urlString;
@end

@implementation INRecommendationsCompletedAndDismissedRequest

- (INRecommendationsCompletedAndDismissedRequest)initWithAccount:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INRecommendationsCompletedAndDismissedRequest;
  v9 = [(INRecommendationsCompletedAndDismissedRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
  }

  return v10;
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  v3 = [(ACAccount *)self->_account aa_personID];

  if (v3)
  {
    p_configuration = &self->_configuration;
    v5 = [(CERuleConfiguration *)*p_configuration completedURL];

    if (v5)
    {
      v6 = [(CERuleConfiguration *)*p_configuration completedURL];
      id v7 = [v6 absoluteString];

      goto LABEL_11;
    }
    v9 = _INLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000280F0((uint64_t *)p_configuration, v9);
    }
  }
  else
  {
    id v8 = _INLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000280AC(v8);
    }
  }
  id v7 = 0;
LABEL_11:
  return v7;
}

- (id)urlRequest
{
  v6.receiver = self;
  v6.super_class = (Class)INRecommendationsCompletedAndDismissedRequest;
  v3 = [(INRecommendationsCompletedAndDismissedRequest *)&v6 urlRequest];
  id v4 = [v3 mutableCopy];

  objc_msgSend(v4, "ind_addQuotaHeadersForAccount:", self->_account);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end