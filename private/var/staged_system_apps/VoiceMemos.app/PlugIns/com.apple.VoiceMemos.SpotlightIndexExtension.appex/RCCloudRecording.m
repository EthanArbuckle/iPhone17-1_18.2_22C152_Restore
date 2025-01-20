@interface RCCloudRecording
+ (id)savedRecordingURIForSearchableItemIdentifier:(id)a3;
+ (id)searchableItemIdentifierForSavedRecordingURI:(id)a3;
@end

@implementation RCCloudRecording

+ (id)savedRecordingURIForSearchableItemIdentifier:(id)a3
{
  return +[NSURL URLWithString:a3];
}

+ (id)searchableItemIdentifierForSavedRecordingURI:(id)a3
{
  return [a3 absoluteString];
}

@end