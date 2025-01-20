@interface MessageSaveToCameraRollActivity
- (ContentRepresentationHandlingDelegate)delegate;
- (MessageSaveToCameraRollActivity)init;
- (MessageSaveToCameraRollActivity)initWithAttachmentHandlingDelegate:(id)a3 context:(int64_t)a4;
- (id)_beforeActivity;
- (id)activityImage;
- (id)activityType;
- (int64_t)context;
- (void)_prepareWithActivityItems:(id)a3;
- (void)setContext:(int64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MessageSaveToCameraRollActivity

- (MessageSaveToCameraRollActivity)init
{
  v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"MessageSaveToCameraRollActivity.m" lineNumber:25 description:@"Invalid initializer. Use the designated one instead."];

  return 0;
}

- (MessageSaveToCameraRollActivity)initWithAttachmentHandlingDelegate:(id)a3 context:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MessageSaveToCameraRollActivity;
  v7 = [(MessageSaveToCameraRollActivity *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(MessageSaveToCameraRollActivity *)v7 setDelegate:v6];
    [(MessageSaveToCameraRollActivity *)v8 setContext:a4];
  }

  return v8;
}

- (id)activityType
{
  return MFActivityTypeSaveToCameraRoll;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:MFImageGlyphSave];
}

- (id)_beforeActivity
{
  return UIActivityTypeAssignToContact;
}

- (void)_prepareWithActivityItems:(id)a3
{
  id v13 = a3;
  id v3 = [v13 mutableCopy];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v13;
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          uint64_t v16 = 0;
          int v10 = MFCameraRollSaveAssetWithURL();
          id v11 = 0;
          if (v10)
          {
            [v3 removeObject:v9];
          }
          else
          {
            v12 = [v9 path];
            NSLog(@"failed to ingest %@ (%@)", v12, v11);
          }
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  v15.receiver = self;
  v15.super_class = (Class)MessageSaveToCameraRollActivity;
  [(MessageSaveToCameraRollActivity *)&v15 prepareWithActivityItems:v3];
}

- (ContentRepresentationHandlingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ContentRepresentationHandlingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (void).cxx_destruct
{
}

@end