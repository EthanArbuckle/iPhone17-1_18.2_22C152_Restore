@interface PLCloudFeedCommentsEntry
+ (id)entityName;
- (BOOL)shouldBeRemovedFromPhotoLibrary:(id)a3;
- (NSMutableOrderedSet)mutableEntryComments;
- (NSMutableOrderedSet)mutableEntryLikeComments;
- (void)willSave;
@end

@implementation PLCloudFeedCommentsEntry

- (void)willSave
{
  v8.receiver = self;
  v8.super_class = (Class)PLCloudFeedCommentsEntry;
  [(PLCloudFeedEntry *)&v8 willSave];
  v3 = [(PLCloudFeedCommentsEntry *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(PLCloudFeedCommentsEntry *)self changedValues];
    v5 = [v4 objectForKeyedSubscript:@"entryComments"];
    if (v5)
    {
    }
    else
    {
      v6 = [v4 objectForKeyedSubscript:@"entryLikeComments"];

      if (!v6)
      {
LABEL_6:

        goto LABEL_7;
      }
    }
    v7 = [v3 delayedSaveActions];
    [v7 recordCloudFeedCommentsEntryForCommentUpdate:self];

    goto LABEL_6;
  }
LABEL_7:
}

- (BOOL)shouldBeRemovedFromPhotoLibrary:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PLCloudFeedCommentsEntry;
  if ([(PLCloudFeedEntry *)&v8 shouldBeRemovedFromPhotoLibrary:a3]) {
    return 1;
  }
  v5 = [(PLCloudFeedCommentsEntry *)self entryComments];
  if ([v5 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    v6 = [(PLCloudFeedCommentsEntry *)self entryLikeComments];
    BOOL v4 = [v6 count] == 0;
  }
  return v4;
}

- (NSMutableOrderedSet)mutableEntryComments
{
  return (NSMutableOrderedSet *)[(PLCloudFeedCommentsEntry *)self mutableOrderedSetValueForKey:@"entryComments"];
}

- (NSMutableOrderedSet)mutableEntryLikeComments
{
  return (NSMutableOrderedSet *)[(PLCloudFeedCommentsEntry *)self mutableOrderedSetValueForKey:@"entryLikeComments"];
}

+ (id)entityName
{
  return @"CloudFeedCommentsEntry";
}

@end