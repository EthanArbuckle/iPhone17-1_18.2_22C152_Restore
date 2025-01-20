@interface RCUIActivity
- (NSArray)activityItems;
- (NSArray)recordingUUIDs;
- (NSArray)shareableCompositions;
- (RCUIActivity)initWithShareableCompositions:(id)a3;
- (void)prepareWithActivityItems:(id)a3;
- (void)setActivityItems:(id)a3;
- (void)setRecordingUUIDs:(id)a3;
- (void)setShareableCompositions:(id)a3;
@end

@implementation RCUIActivity

- (RCUIActivity)initWithShareableCompositions:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RCUIActivity;
  v5 = [(RCUIActivity *)&v8 init];
  v6 = v5;
  if (v5) {
    [(RCUIActivity *)v5 setShareableCompositions:v4];
  }

  return v6;
}

- (void)prepareWithActivityItems:(id)a3
{
}

- (NSArray)recordingUUIDs
{
  recordingUUIDs = self->_recordingUUIDs;
  if (!recordingUUIDs)
  {
    id v4 = +[NSMutableArray array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = [(RCUIActivity *)self shareableCompositions];
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v9) recordingUUID];
          [v4 addObject:v10];

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    v11 = (NSArray *)[v4 copy];
    v12 = self->_recordingUUIDs;
    self->_recordingUUIDs = v11;

    recordingUUIDs = self->_recordingUUIDs;
  }

  return recordingUUIDs;
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (void)setActivityItems:(id)a3
{
}

- (NSArray)shareableCompositions
{
  return self->_shareableCompositions;
}

- (void)setShareableCompositions:(id)a3
{
}

- (void)setRecordingUUIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingUUIDs, 0);
  objc_storeStrong((id *)&self->_shareableCompositions, 0);

  objc_storeStrong((id *)&self->_activityItems, 0);
}

@end