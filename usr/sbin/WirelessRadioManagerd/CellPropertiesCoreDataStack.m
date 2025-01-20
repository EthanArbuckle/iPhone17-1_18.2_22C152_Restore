@interface CellPropertiesCoreDataStack
- (CellPropertiesCoreDataStack)initWithStoreURL:(id)a3 modelURL:(id)a4;
- (NSManagedObjectContext)private_queue_context;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (id)managedObjectModel:(id)a3;
- (void)setPersistentStoreCoordinator:(id)a3;
- (void)setPrivate_queue_context:(id)a3;
- (void)setupManagedObjectContext:(id)a3 modelURL:(id)a4;
@end

@implementation CellPropertiesCoreDataStack

- (CellPropertiesCoreDataStack)initWithStoreURL:(id)a3 modelURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CellPropertiesCoreDataStack;
  v8 = [(CellPropertiesCoreDataStack *)&v11 init];
  v9 = v8;
  if (v8) {
    [(CellPropertiesCoreDataStack *)v8 setupManagedObjectContext:v6 modelURL:v7];
  }

  return v9;
}

- (void)setupManagedObjectContext:(id)a3 modelURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CellPropertiesCoreDataStack *)self managedObjectModel:v7];
  v9 = (NSPersistentStoreCoordinator *)[objc_alloc((Class)NSPersistentStoreCoordinator) initWithManagedObjectModel:v8];
  persistentStoreCoordinator = self->persistentStoreCoordinator;
  self->persistentStoreCoordinator = v9;

  if (self->persistentStoreCoordinator) {
    CFStringRef v11 = @"CellStationManager: persistentStoreCoordinator initialized";
  }
  else {
    CFStringRef v11 = @"CellStationManager: persistentStoreCoordinator is not initialized";
  }
  +[WCM_Logging logLevel:22 message:v11];
  v12 = self->persistentStoreCoordinator;
  v20 = NSReadOnlyPersistentStoreOption;
  v21 = &__kCFBooleanTrue;
  v13 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  id v19 = 0;
  id v14 = [(NSPersistentStoreCoordinator *)v12 addPersistentStoreWithType:NSSQLiteStoreType configuration:0 URL:v6 options:v13 error:&v19];
  id v15 = v19;

  if (v15)
  {
    v16 = [v15 description];
    +[WCM_Logging logLevel:22, @"CellStationManager: error in creating persistent store: %@", v16 message];
  }
  else
  {
    +[WCM_Logging logLevel:22 message:@"CellStationManager: No error in creating persistent store"];
  }
  v17 = (NSManagedObjectContext *)[objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
  private_queue_context = self->private_queue_context;
  self->private_queue_context = v17;

  [(NSManagedObjectContext *)self->private_queue_context setPersistentStoreCoordinator:self->persistentStoreCoordinator];
}

- (id)managedObjectModel:(id)a3
{
  id v3 = a3;
  +[WCM_Logging logLevel:22 message:@"CellStationManager: initializing managedObjectModel with the given model URL"];
  id v4 = [objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v3];
  +[WCM_Logging logLevel:22 message:@"CellStationManager: No error in initializing managedObjectModel"];
  if (v4) {
    +[WCM_Logging logLevel:22 message:@"CellStationManager: initialized managedObjectModel with the given model URL"];
  }
  else {
    +[WCM_Logging logLevel:22 message:@"CellStationManager: mom is not initialized"];
  }

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->persistentStoreCoordinator, 0);

  objc_storeStrong((id *)&self->private_queue_context, 0);
}

@end