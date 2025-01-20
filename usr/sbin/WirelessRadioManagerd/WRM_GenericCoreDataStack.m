@interface WRM_GenericCoreDataStack
- (NSManagedObjectContext)private_queue_context;
- (NSPersistentContainer)persistentContainer;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (WRM_GenericCoreDataStack)initWithModelURL:(id)a3 modelURL:(id)a4;
- (WRM_GenericCoreDataStack)initWithStoreURL:(id)a3 modelURL:(id)a4;
- (id)managedObjectModel:(id)a3;
- (void)setPersistentContainer:(id)a3;
- (void)setPersistentStoreCoordinator:(id)a3;
- (void)setPrivate_queue_context:(id)a3;
- (void)setupManagedObjectContext:(id)a3 modelURL:(id)a4;
@end

@implementation WRM_GenericCoreDataStack

- (WRM_GenericCoreDataStack)initWithModelURL:(id)a3 modelURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WRM_GenericCoreDataStack;
  v8 = [(WRM_GenericCoreDataStack *)&v18 init];
  if (v8)
  {
    id v9 = objc_alloc((Class)NSPersistentContainer);
    v10 = [(WRM_GenericCoreDataStack *)v8 managedObjectModel:v7];
    id v11 = [v9 initWithName:@"CoreDataStore" managedObjectModel:v10];
    [(WRM_GenericCoreDataStack *)v8 setPersistentContainer:v11];

    +[WCM_Logging logLevel:22 message:@"DataStoreManager: persistentContainer initiated with MOM"];
    id v12 = [objc_alloc((Class)NSPersistentStoreDescription) initWithURL:v6];
    id v19 = v12;
    v13 = +[NSArray arrayWithObjects:&v19 count:1];
    v14 = [(WRM_GenericCoreDataStack *)v8 persistentContainer];
    [v14 setPersistentStoreDescriptions:v13];

    v15 = [(WRM_GenericCoreDataStack *)v8 persistentContainer];
    [v15 loadPersistentStoresWithCompletionHandler:&stru_10020EA08];

    +[WCM_Logging logLevel:22 message:@"DataStoreManager: persistentContainer created"];
    v16 = v8;
  }

  return v8;
}

- (WRM_GenericCoreDataStack)initWithStoreURL:(id)a3 modelURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WRM_GenericCoreDataStack;
  v8 = [(WRM_GenericCoreDataStack *)&v11 init];
  id v9 = v8;
  if (v8) {
    [(WRM_GenericCoreDataStack *)v8 setupManagedObjectContext:v6 modelURL:v7];
  }

  return v9;
}

- (void)setupManagedObjectContext:(id)a3 modelURL:(id)a4
{
  id v6 = a3;
  id v7 = [(WRM_GenericCoreDataStack *)self managedObjectModel:a4];
  v8 = (NSPersistentStoreCoordinator *)[objc_alloc((Class)NSPersistentStoreCoordinator) initWithManagedObjectModel:v7];
  persistentStoreCoordinator = self->persistentStoreCoordinator;
  self->persistentStoreCoordinator = v8;

  if (self->persistentStoreCoordinator) {
    CFStringRef v10 = @"DataStoreManager: persistentStoreCoordinator initialized";
  }
  else {
    CFStringRef v10 = @"DataStoreManager: persistentStoreCoordinator is not initialized";
  }
  +[WCM_Logging logLevel:22 message:v10];
  +[WCM_Logging logLevel:22 message:@"DataStoreManager: Adding persistentStoreCoordinator"];
  objc_super v11 = self->persistentStoreCoordinator;
  id v18 = 0;
  id v12 = [(NSPersistentStoreCoordinator *)v11 addPersistentStoreWithType:NSSQLiteStoreType configuration:0 URL:v6 options:0 error:&v18];
  id v13 = v18;
  v14 = v13;
  if (v13)
  {
    v15 = [v13 description];
    +[WCM_Logging logLevel:22, @"DataStoreManager: error in creating persistent store: %@", v15 message];
  }
  else
  {
    +[WCM_Logging logLevel:22 message:@"DataStoreManager: No error in creating persistent store"];
  }
  v16 = (NSManagedObjectContext *)[objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
  private_queue_context = self->private_queue_context;
  self->private_queue_context = v16;

  [(NSManagedObjectContext *)self->private_queue_context setPersistentStoreCoordinator:self->persistentStoreCoordinator];
}

- (id)managedObjectModel:(id)a3
{
  id v3 = a3;
  +[WCM_Logging logLevel:22 message:@"CellStationManager: initializing managedObjectModel with the given model URL"];
  id v4 = [objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v3];

  +[WCM_Logging logLevel:22 message:@"CellStationManager: No error in initializing managedObjectModel"];
  if (v4) {
    CFStringRef v5 = @"CellStationManager: initialized managedObjectModel with the given model URL";
  }
  else {
    CFStringRef v5 = @"CellStationManager: mom is not initialized";
  }
  +[WCM_Logging logLevel:22 message:v5];

  return v4;
}

- (NSManagedObjectContext)private_queue_context
{
  return self->private_queue_context;
}

- (void)setPrivate_queue_context:(id)a3
{
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->persistentStoreCoordinator;
}

- (void)setPersistentStoreCoordinator:(id)a3
{
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setPersistentContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->persistentStoreCoordinator, 0);

  objc_storeStrong((id *)&self->private_queue_context, 0);
}

@end