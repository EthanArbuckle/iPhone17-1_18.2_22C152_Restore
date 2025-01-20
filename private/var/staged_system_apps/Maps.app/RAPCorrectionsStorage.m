@interface RAPCorrectionsStorage
+ (id)basePathForCorrections;
+ (id)pathForFeedbackRequestForSubmissionIdentifier:(id)a3;
- (BOOL)removeCorrectionDataForSubmissionIdentifier:(id)a3;
- (BOOL)saveCorrections:(id)a3 forSubmissionIdentifier:(id)a4;
- (id)correctionsDataForSubmissionIdentifier:(id)a3;
@end

@implementation RAPCorrectionsStorage

+ (id)basePathForCorrections
{
  v2 = +[RAPFileManager baseSubmissionFilePath];
  v3 = [v2 URLByAppendingPathComponent:@"rap_corrections" isDirectory:1];

  return v3;
}

+ (id)pathForFeedbackRequestForSubmissionIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[RAPCorrectionsStorage basePathForCorrections];
  v5 = [v4 URLByAppendingPathComponent:v3];

  return v5;
}

- (BOOL)saveCorrections:(id)a3 forSubmissionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[RAPCorrectionsStorage basePathForCorrections];
  BOOL v8 = +[RAPFileManager saveData:v6 toDirectory:v7 filename:v5];

  return v8;
}

- (BOOL)removeCorrectionDataForSubmissionIdentifier:(id)a3
{
  id v3 = +[RAPCorrectionsStorage pathForFeedbackRequestForSubmissionIdentifier:a3];
  BOOL v4 = +[RAPFileManager removeItemAtFilePath:v3];

  return v4;
}

- (id)correctionsDataForSubmissionIdentifier:(id)a3
{
  id v3 = +[RAPCorrectionsStorage pathForFeedbackRequestForSubmissionIdentifier:a3];
  BOOL v4 = +[RAPFileManager dataAtFileURL:v3];

  return v4;
}

@end