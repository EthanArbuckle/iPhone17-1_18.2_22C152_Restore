@interface ICAppContext
- (BOOL)hasContextOptions:(unint64_t)a3;
- (ICAppContext)initWithCloudContext:(id)a3 contextOptions:(unint64_t)a4 viewContext:(id)a5 backgroundContextCreator:(id)a6 deviceManagementRestrictionsManager:(id)a7;
- (ICCloudContext)cloudContext;
- (ICDeviceManagementRestrictionsManager)deviceManagementRestrictionsManager;
- (NSManagedObjectContext)viewContext;
- (id)backgroundContextCreator;
- (id)makeBackgroundContext;
- (unint64_t)contextOptions;
- (void)setBackgroundContextCreator:(id)a3;
- (void)setContextOptions:(unint64_t)a3;
@end

@implementation ICAppContext

- (ICAppContext)initWithCloudContext:(id)a3 contextOptions:(unint64_t)a4 viewContext:(id)a5 backgroundContextCreator:(id)a6 deviceManagementRestrictionsManager:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)ICAppContext;
  v17 = [(ICAppContext *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_cloudContext, a3);
    v18->_contextOptions = a4;
    objc_storeStrong((id *)&v18->_viewContext, a5);
    v19 = _Block_copy(v15);
    id backgroundContextCreator = v18->_backgroundContextCreator;
    v18->_id backgroundContextCreator = v19;

    objc_storeStrong((id *)&v18->_deviceManagementRestrictionsManager, a7);
  }

  return v18;
}

- (BOOL)hasContextOptions:(unint64_t)a3
{
  return (a3 & ~[(ICAppContext *)self contextOptions]) == 0;
}

- (id)makeBackgroundContext
{
  v3 = [(ICAppContext *)self backgroundContextCreator];
  if (v3)
  {
    v4 = [(ICAppContext *)self backgroundContextCreator];
    v5 = v4[2]();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (ICCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (NSManagedObjectContext)viewContext
{
  return self->_viewContext;
}

- (ICDeviceManagementRestrictionsManager)deviceManagementRestrictionsManager
{
  return self->_deviceManagementRestrictionsManager;
}

- (unint64_t)contextOptions
{
  return self->_contextOptions;
}

- (void)setContextOptions:(unint64_t)a3
{
  self->_contextOptions = a3;
}

- (id)backgroundContextCreator
{
  return self->_backgroundContextCreator;
}

- (void)setBackgroundContextCreator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backgroundContextCreator, 0);
  objc_storeStrong((id *)&self->_deviceManagementRestrictionsManager, 0);
  objc_storeStrong((id *)&self->_viewContext, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
}

@end