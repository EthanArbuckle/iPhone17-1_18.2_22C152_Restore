@interface WANWActivityMessageSubmitter
- (WANWActivityMessageSubmitter)initWithMessageGroupType:(int64_t)a3;
- (id)submitMessage:(id)a3;
- (int64_t)groupTypeForThisSubmitter;
- (void)setGroupTypeForThisSubmitter:(int64_t)a3;
@end

@implementation WANWActivityMessageSubmitter

- (WANWActivityMessageSubmitter)initWithMessageGroupType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WANWActivityMessageSubmitter;
  v4 = [(WANWActivityMessageSubmitter *)&v8 init];
  v4->_groupTypeForThisSubmitter = a3;
  if (!qword_1000F10C0)
  {
    qword_1000F10C0 = symptom_framework_init();
    if (!qword_1000F10C0)
    {
      v6 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v10 = "-[WANWActivityMessageSubmitter initWithMessageGroupType:]";
        __int16 v11 = 1024;
        int v12 = 73;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error creating reporter", buf, 0x12u);
      }

      v7 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v10 = "-[WANWActivityMessageSubmitter initWithMessageGroupType:]";
        __int16 v11 = 1024;
        int v12 = 78;
        __int16 v13 = 2048;
        int64_t v14 = a3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error configuring groupType: %ld", buf, 0x1Cu);
      }

      return 0;
    }
  }
  return v4;
}

- (id)submitMessage:(id)a3
{
  id v4 = a3;
  v5 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [v4 key];
    *(_DWORD *)buf = 136446722;
    v44 = "-[WANWActivityMessageSubmitter submitMessage:]";
    __int16 v45 = 1024;
    int v46 = 87;
    __int16 v47 = 2112;
    v48 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Attempting to submit: %@", buf, 0x1Cu);
  }
  v7 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WANWActivityMessageSubmitter submitMessage", "", buf, 2u);
  }

  if (!symptom_new())
  {
    v30 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v44 = "-[WANWActivityMessageSubmitter submitMessage:]";
      __int16 v45 = 1024;
      int v46 = 92;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error creating symptom", buf, 0x12u);
    }

    NSErrorUserInfoKey v57 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v58 = @"WAErrorCodeSubmissionModelFailure";
    v31 = &v58;
    v32 = &v57;
    goto LABEL_34;
  }
  int v9 = symptom_set_qualifier();
  if (v9)
  {
    int v33 = v9;
    v34 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v44 = "-[WANWActivityMessageSubmitter submitMessage:]";
      __int16 v45 = 1024;
      int v46 = 94;
      __int16 v47 = 1024;
      LODWORD(v48) = v33;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error setting symptom qualifier kNWActivityQualifierWiFiFragment %d", buf, 0x18u);
    }

    NSErrorUserInfoKey v55 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v56 = @"WAErrorCodeSubmissionModelFailure";
    v31 = &v56;
    v32 = &v55;
    goto LABEL_34;
  }
  uint64_t v10 = [(WAProtobufMessageSubmitter *)self instantiateAWDProtobufAndPopulateValues:v4];
  if (!v10)
  {
    v35 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v44 = "-[WANWActivityMessageSubmitter submitMessage:]";
      __int16 v45 = 1024;
      int v46 = 98;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error creating data to send to symptom_send", buf, 0x12u);
    }

    NSErrorUserInfoKey v53 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v54 = @"WAErrorCodeSubmissionModelFailure";
    v31 = &v54;
    v32 = &v53;
LABEL_34:
    v36 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v32 count:1];
    id v13 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9007 userInfo:v36];

    goto LABEL_20;
  }
  __int16 v11 = (void *)v10;
  id v40 = 0;
  int v12 = +[NSKeyedArchiver archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v40];
  id v13 = v40;
  int64_t v14 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    id v17 = [v12 length];
    *(_DWORD *)buf = 136447234;
    v44 = "-[WANWActivityMessageSubmitter submitMessage:]";
    __int16 v45 = 1024;
    int v46 = 101;
    __int16 v47 = 2112;
    v48 = v16;
    __int16 v49 = 2048;
    id v50 = v17;
    __int16 v51 = 2112;
    id v52 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Size of %@: %zd %@", buf, 0x30u);
  }
  [v12 length];
  id v18 = v12;
  [v18 bytes];
  int v19 = symptom_set_additional_qualifier();
  v20 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    v44 = "-[WANWActivityMessageSubmitter submitMessage:]";
    __int16 v45 = 1024;
    int v46 = 117;
    __int16 v47 = 1024;
    LODWORD(v48) = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%{public}s::%d:symptom_set_additional_qualifier: %d", buf, 0x18u);
  }

  v21 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WANWActivityMessageSubmitter symptom_send", "", buf, 2u);
  }

  int v22 = symptom_send();
  v23 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WANWActivityMessageSubmitter symptom_send", "", buf, 2u);
  }

  if (v22)
  {
    v37 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v44 = "-[WANWActivityMessageSubmitter submitMessage:]";
      __int16 v45 = 1024;
      int v46 = 123;
      __int16 v47 = 1024;
      LODWORD(v48) = v22;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error symptom_send() %d", buf, 0x18u);
    }

    NSErrorUserInfoKey v41 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v42 = @"WAErrorCodeSubmissionModelFailure";
    v38 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    uint64_t v39 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9007 userInfo:v38];

    id v13 = (id)v39;
  }
  else
  {

    v24 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v25 = [v4 key];
      *(_DWORD *)buf = 136446722;
      v44 = "-[WANWActivityMessageSubmitter submitMessage:]";
      __int16 v45 = 1024;
      int v46 = 127;
      __int16 v47 = 2112;
      v48 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Submit complete: %@", buf, 0x1Cu);
    }
  }
LABEL_20:
  v26 = [(WAMessageAWDSubmitter *)self submissionDelegate];
  v27 = [v4 uuid];
  [v26 messsageWasSubmittedWithUUID:v27];

  v28 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WANWActivityMessageSubmitter submitMessage", "", buf, 2u);
  }

  return v13;
}

- (int64_t)groupTypeForThisSubmitter
{
  return self->_groupTypeForThisSubmitter;
}

- (void)setGroupTypeForThisSubmitter:(int64_t)a3
{
  self->_groupTypeForThisSubmitter = a3;
}

@end