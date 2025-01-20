@interface RCShareMemoHelper
+ (id)customActivitiesForShareableCompositions:(id)a3;
+ (id)customActivityTypes;
+ (id)shareableCompositionsFromCompositions:(id)a3;
+ (id)unsupportedActivityTypes;
@end

@implementation RCShareMemoHelper

+ (id)unsupportedActivityTypes
{
  if (qword_10026A868 != -1) {
    dispatch_once(&qword_10026A868, &stru_100223158);
  }
  v2 = (void *)qword_10026A860;

  return v2;
}

+ (id)customActivitiesForShareableCompositions:(id)a3
{
  id v3 = a3;
  v4 = [(RCUIActivity *)[RCCopyTranscriptActivity alloc] initWithShareableCompositions:v3];
  v5 = [(RCUIActivity *)[RCDuplicateActivity alloc] initWithShareableCompositions:v3];
  v6 = [(RCUIActivity *)[RCFavoriteActionActivity alloc] initWithShareableCompositions:v3];
  v7 = [(RCUIActivity *)[RCMoveToFolderActivity alloc] initWithShareableCompositions:v3];

  if ([(RCCopyTranscriptActivity *)v4 shouldShowTranscriptionActivity])
  {
    v15 = v4;
    v16 = v5;
    v17 = v6;
    v18 = v7;
    v8 = &v15;
    uint64_t v9 = 4;
  }
  else
  {
    v12 = v5;
    v13 = v6;
    v14 = v7;
    v8 = &v12;
    uint64_t v9 = 3;
  }
  v10 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, v9, v12, v13, v14, v15, v16, v17, v18);

  return v10;
}

+ (id)customActivityTypes
{
  v4[0] = @"RCActivityTypeCopyTranscript";
  v4[1] = @"RCActivityTypeDuplicate";
  v4[2] = @"RCActivityTypeFavorite";
  v4[3] = @"RCActivityTypeMoveToFolder";
  v2 = +[NSArray arrayWithObjects:v4 count:4];

  return v2;
}

+ (id)shareableCompositionsFromCompositions:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  id v5 = [v3 count];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v12 = [RCShareableComposition alloc];
        v13 = -[RCShareableComposition initWithComposition:](v12, "initWithComposition:", v11, (void)v16);
        v14 = v13;
        if ((unint64_t)v5 >= 2) {
          [(RCShareableComposition *)v13 setCustomSubject:&stru_100228BC8];
        }
        [v4 addObject:v14];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v4;
}

@end