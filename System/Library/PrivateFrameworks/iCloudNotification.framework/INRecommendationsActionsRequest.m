@interface INRecommendationsActionsRequest
- (INRecommendationsActionsRequest)initWithAccount:(id)a3 configuration:(id)a4 params:(id)a5;
- (INRecommendationsActionsRequest)initWithAccountForActionCancelledStatus:(id)a3 configuration:(id)a4 recommendations:(id)a5 context:(id)a6;
- (INRecommendationsActionsRequest)initWithAccountForActionCompletedStatus:(id)a3 configuration:(id)a4 recommendations:(id)a5 storageRecovered:(id)a6 context:(id)a7;
- (INRecommendationsActionsRequest)initWithAccountForDismissStatus:(id)a3 configuration:(id)a4 recommendations:(id)a5 context:(id)a6;
- (INRecommendationsActionsRequest)initWithAccountForDisplayStatus:(id)a3 configuration:(id)a4 recommendations:(id)a5 context:(id)a6;
- (id)_bodyParameters;
- (id)urlRequest;
- (id)urlString;
@end

@implementation INRecommendationsActionsRequest

- (INRecommendationsActionsRequest)initWithAccountForActionCancelledStatus:(id)a3 configuration:(id)a4 recommendations:(id)a5 context:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  objc_storeStrong((id *)&self->_recommendationStatus, @"canceled");
  [v14 setObject:@"canceled" forKeyedSubscript:@"action"];
  [v14 setObject:v11 forKeyedSubscript:@"recommendations"];

  [v14 setObject:v10 forKeyedSubscript:@"context"];
  id v15 = [v14 copy];
  v16 = [(INRecommendationsActionsRequest *)self initWithAccount:v13 configuration:v12 params:v15];

  return v16;
}

- (INRecommendationsActionsRequest)initWithAccountForDismissStatus:(id)a3 configuration:(id)a4 recommendations:(id)a5 context:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  objc_storeStrong((id *)&self->_recommendationStatus, @"dismissed");
  [v14 setObject:@"dismissed" forKeyedSubscript:@"action"];
  [v14 setObject:v11 forKeyedSubscript:@"recommendations"];

  [v14 setObject:v10 forKeyedSubscript:@"context"];
  id v15 = [v14 copy];
  v16 = [(INRecommendationsActionsRequest *)self initWithAccount:v13 configuration:v12 params:v15];

  return v16;
}

- (INRecommendationsActionsRequest)initWithAccountForDisplayStatus:(id)a3 configuration:(id)a4 recommendations:(id)a5 context:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  objc_storeStrong((id *)&self->_recommendationStatus, @"displayed");
  [v14 setObject:@"displayed" forKeyedSubscript:@"action"];
  [v14 setObject:v11 forKeyedSubscript:@"recommendations"];

  [v14 setObject:v10 forKeyedSubscript:@"context"];
  id v15 = [v14 copy];
  v16 = [(INRecommendationsActionsRequest *)self initWithAccount:v13 configuration:v12 params:v15];

  return v16;
}

- (INRecommendationsActionsRequest)initWithAccountForActionCompletedStatus:(id)a3 configuration:(id)a4 recommendations:(id)a5 storageRecovered:(id)a6 context:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc_init((Class)NSMutableDictionary);
  objc_storeStrong((id *)&self->_recommendationStatus, @"completed");
  [v15 setObject:@"completed" forKeyedSubscript:@"action"];
  [v15 setObject:v12 forKeyedSubscript:@"recommendations"];

  [v15 setObject:v11 forKeyedSubscript:@"context"];
  id v16 = [v15 copy];
  v17 = [(INRecommendationsActionsRequest *)self initWithAccount:v14 configuration:v13 params:v16];

  return v17;
}

- (INRecommendationsActionsRequest)initWithAccount:(id)a3 configuration:(id)a4 params:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)INRecommendationsActionsRequest;
  id v12 = [(INRecommendationsActionsRequest *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_ruleConfiguration, a4);
    objc_storeStrong((id *)&v13->_account, a3);
    objc_storeStrong((id *)&v13->_params, a5);
  }

  return v13;
}

- (id)urlString
{
  v3 = [(ACAccount *)self->_account aa_personID];

  if (v3)
  {
    recommendationStatus = self->_recommendationStatus;
    if (!recommendationStatus)
    {
      v5 = [(NSDictionary *)self->_params objectForKeyedSubscript:@"action"];
      v6 = self->_recommendationStatus;
      self->_recommendationStatus = v5;

      recommendationStatus = self->_recommendationStatus;
    }
    if ([(NSString *)recommendationStatus isEqualToString:@"displayed"])
    {
      v7 = [(CERuleConfiguration *)self->_ruleConfiguration displayURL];
    }
    else if ([(NSString *)self->_recommendationStatus isEqualToString:@"dismissed"])
    {
      v7 = [(CERuleConfiguration *)self->_ruleConfiguration dismissURL];
    }
    else
    {
      if (![(NSString *)self->_recommendationStatus isEqualToString:@"completed"]
        && ![(NSString *)self->_recommendationStatus isEqualToString:@"canceled"])
      {
        id v9 = 0;
LABEL_15:
        v8 = _INLogSystem();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          sub_100028BF0();
        }
        goto LABEL_17;
      }
      v7 = [(CERuleConfiguration *)self->_ruleConfiguration actionURL];
    }
    id v10 = v7;
    id v9 = [v7 absoluteString];

    goto LABEL_15;
  }
  v8 = _INLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100028BAC(v8);
  }
  id v9 = 0;
LABEL_17:

  return v9;
}

- (id)_bodyParameters
{
  id v2 = [(NSDictionary *)self->_params copy];
  return v2;
}

- (id)urlRequest
{
  v3 = [(INRecommendationsActionsRequest *)self _bodyParameters];
  if (v3 && self->_account)
  {
    v14.receiver = self;
    v14.super_class = (Class)INRecommendationsActionsRequest;
    v4 = [(INRecommendationsActionsRequest *)&v14 urlRequest];
    id v5 = [v4 mutableCopy];

    v6 = _INLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100028DF0(self, v6);
    }

    id v13 = 0;
    v7 = +[NSJSONSerialization dataWithJSONObject:v3 options:0 error:&v13];
    v8 = v13;
    if (v8)
    {
      id v9 = _INLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100028D6C();
      }
    }
    else
    {
      [v5 setHTTPBody:v7];
    }
    id v10 = [objc_alloc((Class)NSString) initWithData:v7 encoding:4];
    id v11 = _INLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100028CF8();
    }

    objc_msgSend(v5, "ind_addQuotaHeadersForAccount:", self->_account);
    [v5 setHTTPMethod:@"POST"];
  }
  else
  {
    v8 = _INLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100028C64(self, v8);
    }
    id v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_recommendations, 0);
  objc_storeStrong((id *)&self->_storageRecovered, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_ruleConfiguration, 0);
  objc_storeStrong((id *)&self->_recommendationStatus, 0);
}

@end