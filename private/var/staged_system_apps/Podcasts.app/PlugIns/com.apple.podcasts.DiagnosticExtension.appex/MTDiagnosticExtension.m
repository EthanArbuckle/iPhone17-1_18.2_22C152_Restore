@interface MTDiagnosticExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation MTDiagnosticExtension

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  +[MTDebugDataManager setup];
  v4 = +[IMDebugDataManager writeDebugData];
  v5 = +[NSFileManager defaultManager];
  v6 = [v4 absoluteString];
  v7 = [v5 attributesOfItemAtPath:v6 error:0];

  id v8 = [v7 fileSize];
  id v9 = objc_alloc((Class)DEAttachmentItem);
  v10 = +[NSDate date];
  v11 = +[NSNumber numberWithLongLong:v8];
  id v12 = [v9 initWithPath:v4 withDisplayName:@"Podcast Database" modificationDate:v10 andFilesize:v11];

  [v12 setAttachmentType:@"com.apple.DiagnosticExtensions.other"];
  v13 = +[NSNumber numberWithBool:0];
  [v12 setShouldCompress:v13];

  v14 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter"];
  v15 = +[NSRegularExpression regularExpressionWithPattern:@"^Podcasts(.*).ips" options:1 error:0];
  v16 = [(MTDiagnosticExtension *)self filesInDir:v14 matchingPattern:v15 excludingPattern:0];
  id v20 = v12;
  v17 = +[NSArray arrayWithObjects:&v20 count:1];
  v18 = [v17 arrayByAddingObjectsFromArray:v16];

  return v18;
}

@end