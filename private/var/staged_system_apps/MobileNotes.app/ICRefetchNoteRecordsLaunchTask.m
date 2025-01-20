@interface ICRefetchNoteRecordsLaunchTask
+ (NSDateFormatter)dateFormatter;
- (ICCloudContext)cloudContext;
- (ICRefetchNoteRecordsLaunchTask)initWithIdentifier:(id)a3 modifiedAfterDateString:(id)a4;
- (NSDate)modifiedAfterDate;
- (NSString)identifier;
- (NSString)modifiedAfterDateString;
- (id)relationshipKeyPathsForPrefetching;
- (id)taskIdentifier;
- (unint64_t)batchSize;
- (void)runOneTimeLaunchTask;
- (void)setCloudContext:(id)a3;
@end

@implementation ICRefetchNoteRecordsLaunchTask

- (ICRefetchNoteRecordsLaunchTask)initWithIdentifier:(id)a3 modifiedAfterDateString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ICRefetchNoteRecordsLaunchTask;
  v9 = [(ICRefetchNoteRecordsLaunchTask *)&v16 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_3;
  }
  objc_storeStrong((id *)&v9->_identifier, a3);
  objc_storeStrong((id *)&v10->_modifiedAfterDateString, a4);
  v11 = [(id)objc_opt_class() dateFormatter];
  uint64_t v12 = [v11 dateFromString:v8];
  modifiedAfterDate = v10->_modifiedAfterDate;
  v10->_modifiedAfterDate = (NSDate *)v12;

  if (!v10->_modifiedAfterDate)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICRefetchNoteRecordsLaunchTask initWithIdentifier:modifiedAfterDateString:]", 1, 0, @"Refetch records launch task doesn't have a valid modified after date");
    v14 = 0;
  }
  else
  {
LABEL_3:
    v14 = v10;
  }

  return v14;
}

+ (NSDateFormatter)dateFormatter
{
  if (qword_1006AA168 != -1) {
    dispatch_once(&qword_1006AA168, &stru_100627890);
  }
  v2 = (void *)qword_1006AA160;

  return (NSDateFormatter *)v2;
}

- (id)relationshipKeyPathsForPrefetching
{
  v2 = ICKeyPathFromSelector();
  v9[0] = v2;
  v3 = ICKeyPathFromSelector();
  v9[1] = v3;
  v4 = ICKeyPathFromSelector();
  v9[2] = v4;
  v5 = ICKeyPathFromSelector();
  v9[3] = v5;
  v6 = ICKeyPathFromSelector();
  v9[4] = v6;
  id v7 = +[NSArray arrayWithObjects:v9 count:5];

  return v7;
}

- (unint64_t)batchSize
{
  return 32;
}

- (id)taskIdentifier
{
  v2 = [(ICRefetchNoteRecordsLaunchTask *)self identifier];
  v3 = +[NSString stringWithFormat:@"ICRefetchNoteRecordsLaunchTask-%@", v2];

  return v3;
}

- (void)runOneTimeLaunchTask
{
  v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1004D7D34(self, v3);
  }

  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v4 = [(ICWorkerContextLaunchTask *)self workerContext];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008EED8;
  v8[3] = &unk_100625C78;
  v8[4] = self;
  v8[5] = &v9;
  [v4 performBlockAndWait:v8];

  v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [(ICRefetchNoteRecordsLaunchTask *)self identifier];
    id v7 = +[NSNumber numberWithUnsignedInteger:v10[3]];
    sub_1004D7CC4(v6, v7, buf, v5);
  }

  _Block_object_dispose(&v9, 8);
}

- (NSString)modifiedAfterDateString
{
  return self->_modifiedAfterDateString;
}

- (NSDate)modifiedAfterDate
{
  return self->_modifiedAfterDate;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (ICCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (void)setCloudContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_modifiedAfterDate, 0);

  objc_storeStrong((id *)&self->_modifiedAfterDateString, 0);
}

@end