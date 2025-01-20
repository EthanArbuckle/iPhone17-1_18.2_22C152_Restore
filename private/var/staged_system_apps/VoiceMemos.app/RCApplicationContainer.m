@interface RCApplicationContainer
+ (id)sharedContainer;
- (RCApplicationContainer)initWithURL:(id)a3;
- (id)newChangeTrackingBackgroundModel;
@end

@implementation RCApplicationContainer

+ (id)sharedContainer
{
  if (qword_10026A848 != -1) {
    dispatch_once(&qword_10026A848, &stru_100222D08);
  }
  v2 = (void *)qword_10026A840;

  return v2;
}

- (RCApplicationContainer)initWithURL:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)RCApplicationContainer;
  v3 = [(RCApplicationContainer *)&v17 initWithURL:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(RCApplicationContainer *)v3 persistentContainer];
    v6 = [v5 persistentStoreCoordinator];
    v7 = [v6 persistentStores];
    v8 = [v7 firstObject];

    v9 = [RCRemoteChangeMerger alloc];
    v18 = v8;
    v10 = +[NSArray arrayWithObjects:&v18 count:1];
    v11 = [(RCApplicationContainer *)v4 persistentContainer];
    v12 = [v11 viewContext];
    v13 = [(RCApplicationContainer *)v4 transactionAuthor];
    v14 = [(RCRemoteChangeMerger *)v9 initWithStores:v10 viewContext:v12 transactionAuthorToIgnore:v13];
    remoteChangeMerger = v4->_remoteChangeMerger;
    v4->_remoteChangeMerger = v14;
  }
  return v4;
}

- (id)newChangeTrackingBackgroundModel
{
  v3 = +[RCApplicationContainer sharedContainer];
  id v4 = [v3 newBackgroundModel];

  v5 = [v4 context];
  [v5 setAutomaticallyMergesChangesFromParent:1];

  remoteChangeMerger = self->_remoteChangeMerger;
  if (remoteChangeMerger)
  {
    v7 = [v4 context];
    [(RCRemoteChangeMerger *)remoteChangeMerger addContextToMergeChangesInto:v7];
  }
  return v4;
}

- (void).cxx_destruct
{
}

@end