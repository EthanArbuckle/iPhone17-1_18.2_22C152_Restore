@interface PLAnalysisCoordinatorStep
- (NSString)parentTaskID;
- (PLAnalysisCoordinatorStep)initWithLibraryServicesManager:(id)a3 parentTaskID:(id)a4;
- (PLLibraryServicesManager)libraryServicesManager;
@end

@implementation PLAnalysisCoordinatorStep

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentTaskID, 0);
  objc_storeStrong((id *)&self->_libraryServicesManager, 0);
}

- (NSString)parentTaskID
{
  return self->_parentTaskID;
}

- (PLLibraryServicesManager)libraryServicesManager
{
  return self->_libraryServicesManager;
}

- (PLAnalysisCoordinatorStep)initWithLibraryServicesManager:(id)a3 parentTaskID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLAnalysisCoordinatorStep;
  v9 = [(PLAnalysisCoordinatorStep *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_libraryServicesManager, a3);
    objc_storeStrong((id *)&v10->_parentTaskID, a4);
  }

  return v10;
}

@end