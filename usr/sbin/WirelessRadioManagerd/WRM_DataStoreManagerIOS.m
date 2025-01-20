@interface WRM_DataStoreManagerIOS
- (BOOL)checkModelFileExists;
- (WRM_DataStoreManagerIOS)init;
- (id)modelURL;
- (id)storeURL;
- (void)checkStoreFileExists;
- (void)fetchObjectsForCellID:(id)a3 completionHandler:(id)a4;
- (void)read:(id)a3 completionHandler:(id)a4;
- (void)updateForKey:(id)a3 metricsToWrite:(id)a4 completionHandler:(id)a5;
- (void)write:(id)a3 completionHandler:(id)a4;
@end

@implementation WRM_DataStoreManagerIOS

- (WRM_DataStoreManagerIOS)init
{
  v9.receiver = self;
  v9.super_class = (Class)WRM_DataStoreManagerIOS;
  v2 = [(WRM_DataStoreManagerIOS *)&v9 init];
  +[WCM_Logging logLevel:22 message:@"DataStoreManager: init WRM_DataStoreManagerIOS"];
  if ([(WRM_DataStoreManagerIOS *)v2 checkModelFileExists])
  {
    [(WRM_DataStoreManagerIOS *)v2 checkStoreFileExists];
    v3 = [WRM_GenericCoreDataStack alloc];
    v4 = [(WRM_DataStoreManagerIOS *)v2 storeURL];
    v5 = [(WRM_DataStoreManagerIOS *)v2 modelURL];
    v6 = [(WRM_GenericCoreDataStack *)v3 initWithModelURL:v4 modelURL:v5];
    persistentStack = v2->persistentStack;
    v2->persistentStack = v6;

    +[WCM_Logging logLevel:22 message:@"DataStoreManager: Initialized persistentStack with the model and store."];
  }
  return v2;
}

- (BOOL)checkModelFileExists
{
  v3 = [(WRM_DataStoreManagerIOS *)self modelURL];
  v4 = [v3 absoluteString];
  +[WCM_Logging logLevel:22, @"DataStoreManager: The given model URL is %@", v4 message];

  v5 = [(WRM_DataStoreManagerIOS *)self modelURL];
  id v10 = 0;
  unsigned __int8 v6 = [v5 checkResourceIsReachableAndReturnError:&v10];
  id v7 = v10;

  if (v6)
  {
    +[WCM_Logging logLevel:22 message:@"DataStoreManager: model file exists at the given URL"];
  }
  else
  {
    v8 = [v7 description];
    +[WCM_Logging logLevel:22, @"DataStoreManager: model file does not exists at the given URL, %@", v8 message];
  }
  return v6;
}

- (void)checkStoreFileExists
{
  v2 = self;
  v3 = [(WRM_DataStoreManagerIOS *)self storeURL];
  v4 = [v3 absoluteString];
  +[WCM_Logging logLevel:22, @"DataStoreManager: The given store URL is %@", v4 message];

  v5 = [(WRM_DataStoreManagerIOS *)v2 storeURL];
  id v8 = 0;
  LOBYTE(v2) = [v5 checkResourceIsReachableAndReturnError:&v8];
  id v6 = v8;

  if (v2)
  {
    +[WCM_Logging logLevel:22 message:@"DataStoreManager: store file exists at the given URL"];
  }
  else
  {
    id v7 = [v6 description];
    +[WCM_Logging logLevel:22, @"DataStoreManager: store file does not exists at the given URL, %@", v7 message];
  }
}

- (void)fetchObjectsForCellID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void))v7;
  if (v6)
  {
    +[WCM_Logging logLevel:22 message:@"DataStoreManager: fetchObjects"];
    +[WCM_Logging logLevel:22 message:@"DataStoreManager: fetching objects"];
    objc_super v9 = +[NSFetchRequest fetchRequestWithEntityName:@"CoreDataStore"];
    request = self->request;
    self->request = v9;

    v11 = self->request;
    v12 = +[NSPredicate predicateWithFormat:@"%K == %@", @"cellID", v6];
    [(NSFetchRequest *)v11 setPredicate:v12];

    if (self->request)
    {
      +[WCM_Logging logLevel:22 message:@"DataStoreManager: Created fetch request"];
      v13 = [(WRM_GenericCoreDataStack *)self->persistentStack persistentContainer];
      v14 = [v13 viewContext];
      v15 = self->request;
      id v21 = 0;
      v16 = [v14 executeFetchRequest:v15 error:&v21];
      id v17 = v21;
      fetchRequestResults = self->fetchRequestResults;
      self->fetchRequestResults = v16;

      if (self->fetchRequestResults)
      {
        +[WCM_Logging logLevel:22 message:@"DataStoreManager: No Error fetching objects"];
      }
      else
      {
        v19 = [v17 localizedDescription];
        v20 = [v17 userInfo];
        +[WCM_Logging logLevel:22, @"DataStoreManager: Error fetching objects: %@\n%@", v19, v20 message];

        if (v8) {
          v8[2](v8, 0);
        }
      }
    }
    else
    {
      +[WCM_Logging logLevel:22 message:@"DataStoreManager: Error creating fetch request"];
      id v17 = 0;
      if (v8) {
        v8[2](v8, 0);
      }
    }
  }
  else if (v7)
  {
    +[WCM_Logging logLevel:22 message:@"DataStoreManager: fetchObjectsForCellID: cellID is nil"];
    v8[2](v8, 0);
  }
}

- (void)write:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[WCM_Logging logLevel:22 message:@"DataStoreManager: Write"];
  id v8 = [(WRM_GenericCoreDataStack *)self->persistentStack persistentContainer];
  objc_super v9 = [v8 viewContext];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000A1710;
  v12[3] = &unk_10020FE00;
  v12[4] = self;
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [v9 performBlockAndWait:v12];
}

- (void)updateForKey:(id)a3 metricsToWrite:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 objectForKey:v8];

  if (v11)
  {
    v12 = [(WRM_GenericCoreDataStack *)self->persistentStack persistentContainer];
    id v13 = [v12 viewContext];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000A1C70;
    v14[3] = &unk_10020FE50;
    v14[4] = self;
    id v15 = v9;
    id v16 = v8;
    id v17 = v10;
    [v13 performBlockAndWait:v14];
  }
  else
  {
    +[WCM_Logging logLevel:22, @"DataStoreManager: No object is set for key: %@ in metricsToWrite", v8 message];
    if (v10) {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

- (void)read:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    id v9 = [(WRM_GenericCoreDataStack *)self->persistentStack persistentContainer];
    id v10 = [v9 viewContext];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000A2298;
    v11[3] = &unk_10020FE00;
    v11[4] = self;
    id v12 = v6;
    id v13 = v8;
    [v10 performBlockAndWait:v11];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (id)storeURL
{
  return +[NSURL fileURLWithPath:@"/private/var/mobile/Library/Logs/WirelessRadioManager/WRM_CoreDataStore.sqlite"];
}

- (id)modelURL
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 URLForResource:@"WRM_CoreDataStore" withExtension:@"momd"];
  v4 = [v3 absoluteString];
  +[WCM_Logging logLevel:22, @"DataStoreManager: The model URL is: %@", v4 message];

  v5 = +[NSBundle mainBundle];
  id v6 = [v5 URLForResource:@"WRM_CoreDataStore" withExtension:@"momd"];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fetchRequestResults, 0);
  objc_storeStrong((id *)&self->request, 0);

  objc_storeStrong((id *)&self->persistentStack, 0);
}

@end