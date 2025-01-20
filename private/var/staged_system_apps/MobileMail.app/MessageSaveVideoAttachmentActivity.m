@interface MessageSaveVideoAttachmentActivity
- (id)activityTitle;
@end

@implementation MessageSaveVideoAttachmentActivity

- (id)activityTitle
{
  v3 = [(MessageSaveToCameraRollActivity *)self delegate];
  unsigned int v4 = [v3 canSaveAllAttachmentsInContext:[self context]];

  if (v4)
  {
    v5 = +[NSBundle mainBundle];
    v6 = [v5 localizedStringForKey:@"SAVE_VIDEO" value:&stru_100619928 table:@"Main"];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MessageSaveVideoAttachmentActivity;
    v6 = [(MessageSaveVideoAttachmentActivity *)&v8 activityTitle];
  }

  return v6;
}

@end