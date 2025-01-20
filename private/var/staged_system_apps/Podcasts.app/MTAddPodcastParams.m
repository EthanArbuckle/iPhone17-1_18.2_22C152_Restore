@interface MTAddPodcastParams
- (BOOL)userInitiated;
- (MTAddPodcastParams)init;
- (NSString)location;
- (NSString)url;
- (id)completion;
- (id)processingCompletion;
- (int64_t)storeCollectionId;
- (void)setCompletion:(id)a3;
- (void)setLocation:(id)a3;
- (void)setProcessingCompletion:(id)a3;
- (void)setStoreCollectionId:(int64_t)a3;
- (void)setUrl:(id)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation MTAddPodcastParams

- (MTAddPodcastParams)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTAddPodcastParams;
  v2 = [(MTAddPodcastParams *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MTAddPodcastParams *)v2 setUserInitiated:1];
  }
  return v3;
}

- (void)setUrl:(id)a3
{
  id v17 = +[NSURL URLWithString:a3];
  v4 = [v17 scheme];
  objc_super v5 = [v4 lowercaseString];
  if ([v5 isEqualToString:@"pcast"])
  {

LABEL_4:
    v8 = [v17 resourceSpecifier];
    +[NSString stringWithFormat:@"http:%@", v8];
    v12 = LABEL_9:;
    uint64_t v13 = +[NSURL URLWithString:v12];

    v14 = (void *)v13;
    goto LABEL_10;
  }
  v6 = [v4 lowercaseString];
  unsigned int v7 = [v6 isEqualToString:@"feed"];

  if (v7) {
    goto LABEL_4;
  }
  v9 = [v4 lowercaseString];
  if ([v9 isEqualToString:@"pcasts"])
  {

LABEL_8:
    v8 = [v17 resourceSpecifier];
    +[NSString stringWithFormat:@"https:%@", v8];
    goto LABEL_9;
  }
  v10 = [v4 lowercaseString];
  unsigned int v11 = [v10 isEqualToString:@"feeds"];

  if (v11) {
    goto LABEL_8;
  }
  v14 = v17;
LABEL_10:
  id v18 = v14;
  v15 = [v14 absoluteString];
  url = self->_url;
  self->_url = v15;
}

- (NSString)url
{
  return self->_url;
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (int64_t)storeCollectionId
{
  return self->_storeCollectionId;
}

- (void)setStoreCollectionId:(int64_t)a3
{
  self->_storeCollectionId = a3;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (id)processingCompletion
{
  return self->_processingCompletion;
}

- (void)setProcessingCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_processingCompletion, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end