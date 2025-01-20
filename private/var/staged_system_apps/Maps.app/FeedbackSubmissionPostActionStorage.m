@interface FeedbackSubmissionPostActionStorage
- (BOOL)removefeedbackActionForSubmissionIdentifier:(id)a3;
- (BOOL)saveFeedbackAction:(id)a3 forSubmissionIdentifier:(id)a4;
- (id)feedbackActionForSubmissionIdentifier:(id)a3;
@end

@implementation FeedbackSubmissionPostActionStorage

- (BOOL)saveFeedbackAction:(id)a3 forSubmissionIdentifier:(id)a4
{
  id v5 = a4;
  id v13 = 0;
  v6 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v13];
  id v7 = v13;
  if (v7)
  {
    v8 = sub_100109EF8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v5;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to archive feedback action for identifier:%@ withError:%@", buf, 0x16u);
    }
  }
  v9 = [v5 stringByAppendingString:@"feedback"];
  v10 = +[RAPCorrectionsStorage basePathForCorrections];
  BOOL v11 = +[RAPFileManager saveData:v6 toDirectory:v10 filename:v9];

  return v11;
}

- (BOOL)removefeedbackActionForSubmissionIdentifier:(id)a3
{
  v3 = [a3 stringByAppendingString:@"feedback"];
  v4 = +[RAPCorrectionsStorage pathForFeedbackRequestForSubmissionIdentifier:v3];
  BOOL v5 = +[RAPFileManager removeItemAtFilePath:v4];

  return v5;
}

- (id)feedbackActionForSubmissionIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [v3 stringByAppendingString:@"feedback"];
  BOOL v5 = +[RAPCorrectionsStorage pathForFeedbackRequestForSubmissionIdentifier:v4];
  v6 = +[RAPFileManager dataAtFileURL:v5];
  id v11 = 0;
  id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v11];
  id v8 = v11;
  if (v8)
  {
    v9 = sub_100109EF8();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v3;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to unarchive feedback action for identifier:%@ withError:%@", buf, 0x16u);
    }
  }

  return v7;
}

@end