@interface DiagnosticExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation DiagnosticExtension

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  v3 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Seymour/seymour_b.sqlite"];
  v4 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Seymour/seymour_c.sqlite"];
  v5 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Seymour/AirPlayKit/"];
  [v5 setDisplayName:@"AirPlayKit Logs"];
  [v5 setShouldCompress:&__kCFBooleanTrue];
  [v5 setDeleteOnAttach:&__kCFBooleanTrue];
  v6 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Seymour/Blackbeard/"];
  [v6 setDisplayName:@"Blackbeard Journals"];
  [v6 setShouldCompress:&__kCFBooleanTrue];
  [v6 setDeleteOnAttach:&__kCFBooleanTrue];
  v7 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Seymour/Personalization/"];
  [v7 setDisplayName:@"Personalization Logs"];
  [v7 setShouldCompress:&__kCFBooleanTrue];
  v10[0] = v3;
  v10[1] = v4;
  v10[2] = v5;
  v10[3] = v6;
  v10[4] = v7;
  v8 = +[NSArray arrayWithObjects:v10 count:5];

  return v8;
}

@end