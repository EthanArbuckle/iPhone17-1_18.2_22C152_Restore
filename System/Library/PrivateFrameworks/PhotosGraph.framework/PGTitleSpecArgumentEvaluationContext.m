@interface PGTitleSpecArgumentEvaluationContext
- (CLSServiceManager)serviceManager;
- (PGGraphLocationHelper)locationHelper;
- (PGTitleSpecArgumentEvaluationContext)initWithLocationHelper:(id)a3 serviceManager:(id)a4;
@end

@implementation PGTitleSpecArgumentEvaluationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_locationHelper, 0);
}

- (CLSServiceManager)serviceManager
{
  return (CLSServiceManager *)objc_getProperty(self, a2, 16, 1);
}

- (PGGraphLocationHelper)locationHelper
{
  return (PGGraphLocationHelper *)objc_getProperty(self, a2, 8, 1);
}

- (PGTitleSpecArgumentEvaluationContext)initWithLocationHelper:(id)a3 serviceManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGTitleSpecArgumentEvaluationContext;
  v9 = [(PGTitleSpecArgumentEvaluationContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locationHelper, a3);
    objc_storeStrong((id *)&v10->_serviceManager, a4);
  }

  return v10;
}

@end