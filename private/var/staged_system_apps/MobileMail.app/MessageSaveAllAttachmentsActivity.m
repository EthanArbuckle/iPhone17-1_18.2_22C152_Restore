@interface MessageSaveAllAttachmentsActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)_beforeActivity;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
- (void)prepareWithActivityItems:(id)a3;
@end

@implementation MessageSaveAllAttachmentsActivity

- (id)activityType
{
  return MFActivityTypeSaveAllAttachments;
}

- (id)activityTitle
{
  v2 = [(MessageSaveToCameraRollActivity *)self delegate];
  v3 = [v2 localizedTitleForSaveAllAttachmentsAction];

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:MFImageGlyphSaveAll];
}

- (id)_beforeActivity
{
  return MFActivityTypeSaveToCameraRoll;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  v3 = self;
  v4 = [(MessageSaveToCameraRollActivity *)self delegate];
  LOBYTE(v3) = [v4 canSaveAllAttachmentsInContext:[self context]];

  return (char)v3;
}

- (void)prepareWithActivityItems:(id)a3
{
  v4 = [(MessageSaveToCameraRollActivity *)self delegate];
  v5 = [v4 allMediaAttachmentFutures];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v8);
        v10 = +[EFScheduler mainThreadScheduler];
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_10016C58C;
        v12[3] = &unk_10060A730;
        v12[4] = self;
        [v9 onScheduler:v10 addSuccessBlock:v12];

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)performActivity
{
}

@end