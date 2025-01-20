@interface BKLibraryManagedObjectContext
- (BKLibraryManager)libraryManager;
- (int)saveContext;
- (int)sessionContextType;
- (void)saveLibrary;
- (void)setLibraryManager:(id)a3;
- (void)setSaveContext:(int)a3;
- (void)setSessionContextType:(int)a3;
@end

@implementation BKLibraryManagedObjectContext

- (void)saveLibrary
{
  if ([(BKLibraryManagedObjectContext *)self sessionContextType] == 5) {
    [(BKLibraryManagedObjectContext *)self setSaveContext:2];
  }
  id v3 = [(BKLibraryManagedObjectContext *)self libraryManager];
  [v3 saveManagedObjectContext:self];
}

- (BKLibraryManager)libraryManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryManager);

  return (BKLibraryManager *)WeakRetained;
}

- (void)setLibraryManager:(id)a3
{
}

- (int)sessionContextType
{
  return self->_sessionContextType;
}

- (void)setSessionContextType:(int)a3
{
  self->_sessionContextType = a3;
}

- (int)saveContext
{
  return self->_saveContext;
}

- (void)setSaveContext:(int)a3
{
  self->_saveContext = a3;
}

- (void).cxx_destruct
{
}

@end