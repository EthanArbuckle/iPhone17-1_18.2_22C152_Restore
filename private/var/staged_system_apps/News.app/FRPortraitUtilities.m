@interface FRPortraitUtilities
+ (id)candidatePortraitSignalsWithPortraitResults:(id)a3 disbabledTagIDs:(id)a4 globalThreshold:(double)a5 multiplierProvider:(id)a6 logBlock:(id)a7;
+ (void)submitPortraitFeedbackForExplicitEngagementWithArticleID:(id)a3 topicIDs:(id)a4;
+ (void)submitPortraitFeedbackForExplicitRejectionWithArticleID:(id)a3 topicIDs:(id)a4;
+ (void)submitPortraitFeedbackForImplicitEngagementWithArticleID:(id)a3 topicIDs:(id)a4 portraitAutofavoriteCandidates:(id)a5;
+ (void)submitPortraitFeedbackForImplicitRejectionWithArticleID:(id)a3 topicIDs:(id)a4 portraitAutofavoriteCandidates:(id)a5;
@end

@implementation FRPortraitUtilities

+ (id)candidatePortraitSignalsWithPortraitResults:(id)a3 disbabledTagIDs:(id)a4 globalThreshold:(double)a5 multiplierProvider:(id)a6 logBlock:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  if (!a6) {
    a6 = &stru_1000C5F60;
  }
  v13 = (Block_layout *)a7;
  id v14 = objc_retainBlock(a6);
  if (v13) {
    v15 = v13;
  }
  else {
    v15 = &stru_1000C5F80;
  }
  v16 = objc_retainBlock(v15);

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000263FC;
  v23[3] = &unk_1000C5FD0;
  double v28 = a5;
  id v24 = v11;
  id v25 = v12;
  v26 = v16;
  id v27 = v14;
  id v17 = v14;
  id v18 = v12;
  v19 = v16;
  id v20 = v11;
  v21 = +[NSSet fc_set:v23];

  return v21;
}

+ (void)submitPortraitFeedbackForExplicitEngagementWithArticleID:(id)a3 topicIDs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    if ([v6 count])
    {
      v8 = FRPortraitLog;
      if (os_log_type_enabled((os_log_t)FRPortraitLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v19 = v5;
        __int16 v20 = 2114;
        v21 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Consider submitting portrait feedback for explicit engagement with articleID: %{public}@ and topicIDs: %{public}@", buf, 0x16u);
      }
      v9 = +[PPTopicStore defaultStore];
      [v9 setClientIdentifier:@"news"];
      id v10 = [objc_alloc((Class)PPMappedFeedback) initWithExplicitlyEngagedStrings:v7 explicitlyRejectedStrings:0 implicitlyEngagedStrings:0 implicitlyRejectedStrings:0 mappingId:@"news-topics"];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100026A88;
      v11[3] = &unk_1000C5FF8;
      id v12 = v5;
      id v13 = v7;
      [v9 registerFeedback:v10 completion:v11];
    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000269E0;
      v14[3] = &unk_1000C5680;
      id v15 = v5;
      sub_1000269E0((uint64_t)v14);
      v9 = v15;
    }
  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100026938;
    v16[3] = &unk_1000C5680;
    id v17 = v5;
    sub_100026938((uint64_t)v16);
    v9 = v17;
  }
}

+ (void)submitPortraitFeedbackForExplicitRejectionWithArticleID:(id)a3 topicIDs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    if ([v6 count])
    {
      v8 = FRPortraitLog;
      if (os_log_type_enabled((os_log_t)FRPortraitLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v19 = v5;
        __int16 v20 = 2114;
        v21 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Consider submitting portrait feedback for explicit rejection with articleID: %{public}@ and topicIDs: %{public}@", buf, 0x16u);
      }
      v9 = +[PPTopicStore defaultStore];
      [v9 setClientIdentifier:@"news"];
      id v10 = [objc_alloc((Class)PPMappedFeedback) initWithExplicitlyEngagedStrings:0 explicitlyRejectedStrings:v7 implicitlyEngagedStrings:0 implicitlyRejectedStrings:0 mappingId:@"news-topics"];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100026F2C;
      v11[3] = &unk_1000C5FF8;
      id v12 = v5;
      id v13 = v7;
      [v9 registerFeedback:v10 completion:v11];
    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100026E84;
      v14[3] = &unk_1000C5680;
      id v15 = v5;
      sub_100026E84((uint64_t)v14);
      v9 = v15;
    }
  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100026DDC;
    v16[3] = &unk_1000C5680;
    id v17 = v5;
    sub_100026DDC((uint64_t)v16);
    v9 = v17;
  }
}

+ (void)submitPortraitFeedbackForImplicitEngagementWithArticleID:(id)a3 topicIDs:(id)a4 portraitAutofavoriteCandidates:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100027238;
    v16[3] = &unk_1000C5680;
    id v17 = v7;
    sub_100027238((uint64_t)v16);
    id v11 = v17;
LABEL_7:

    goto LABEL_8;
  }
  if ([v8 count])
  {
    id v10 = FRPortraitLog;
    if (os_log_type_enabled((os_log_t)FRPortraitLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v19 = v7;
      __int16 v20 = 2114;
      id v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Consider submitting portrait feedback for implicit engagement with articleID: %{public}@ and topicIDs: %{public}@", buf, 0x16u);
    }
    id v11 = +[PPTopicStore defaultStore];
    [v11 setClientIdentifier:@"news"];
    id v12 = [objc_alloc((Class)PPMappedFeedback) initWithExplicitlyEngagedStrings:0 explicitlyRejectedStrings:0 implicitlyEngagedStrings:v8 implicitlyRejectedStrings:0 mappingId:@"news-topics"];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000272E0;
    v13[3] = &unk_1000C5FF8;
    id v14 = v7;
    id v15 = v8;
    [v11 registerFeedback:v12 completion:v13];

    goto LABEL_7;
  }
LABEL_8:
}

+ (void)submitPortraitFeedbackForImplicitRejectionWithArticleID:(id)a3 topicIDs:(id)a4 portraitAutofavoriteCandidates:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000275EC;
    v16[3] = &unk_1000C5680;
    id v17 = v7;
    sub_1000275EC((uint64_t)v16);
    id v11 = v17;
LABEL_7:

    goto LABEL_8;
  }
  if ([v8 count])
  {
    id v10 = FRPortraitLog;
    if (os_log_type_enabled((os_log_t)FRPortraitLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v19 = v7;
      __int16 v20 = 2114;
      id v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Consider submitting portrait feedback for implicit rejection with articleID: %{public}@ and topicIDs: %{public}@", buf, 0x16u);
    }
    id v11 = +[PPTopicStore defaultStore];
    [v11 setClientIdentifier:@"news"];
    id v12 = [objc_alloc((Class)PPMappedFeedback) initWithExplicitlyEngagedStrings:0 explicitlyRejectedStrings:0 implicitlyEngagedStrings:0 implicitlyRejectedStrings:v8 mappingId:@"news-topics"];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100027694;
    v13[3] = &unk_1000C5FF8;
    id v14 = v7;
    id v15 = v8;
    [v11 registerFeedback:v12 completion:v13];

    goto LABEL_7;
  }
LABEL_8:
}

@end