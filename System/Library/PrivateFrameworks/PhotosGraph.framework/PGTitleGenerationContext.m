@interface PGTitleGenerationContext
- (CLSHolidayCalendarEventService)holidayService;
- (CLSServiceManager)serviceManager;
- (PGGraph)graph;
- (PGGraphLocationHelper)locationHelper;
- (PGGraphPublicEventCategoryNodeCollection)appleEventsCategoryNodes;
- (PGTitleGenerationContext)initWithGraph:(id)a3 serviceManager:(id)a4;
- (id)initForTestingWithGraph:(id)a3;
- (id)initLegacyForMemoriesWithServiceManager:(id)a3;
- (void)setGraph:(id)a3;
@end

@implementation PGTitleGenerationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_appleEventsCategoryNodes, 0);
  objc_storeStrong((id *)&self->_holidayService, 0);
  objc_storeStrong((id *)&self->_locationHelper, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

- (CLSServiceManager)serviceManager
{
  return (CLSServiceManager *)objc_getProperty(self, a2, 40, 1);
}

- (CLSHolidayCalendarEventService)holidayService
{
  return (CLSHolidayCalendarEventService *)objc_getProperty(self, a2, 24, 1);
}

- (PGGraphLocationHelper)locationHelper
{
  return (PGGraphLocationHelper *)objc_getProperty(self, a2, 16, 1);
}

- (void)setGraph:(id)a3
{
}

- (PGGraph)graph
{
  return self->_graph;
}

- (PGGraphPublicEventCategoryNodeCollection)appleEventsCategoryNodes
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_appleEventsCategoryNodes)
  {
    v3 = [MEMORY[0x1E4F76D68] appleEvents];
    uint64_t v4 = +[PGGraphPublicEventCategoryNodeCollection publicEventCategoryNodesForCategory:v3 inGraph:v2->_graph];
    appleEventsCategoryNodes = v2->_appleEventsCategoryNodes;
    v2->_appleEventsCategoryNodes = (PGGraphPublicEventCategoryNodeCollection *)v4;
  }
  objc_sync_exit(v2);

  v6 = v2->_appleEventsCategoryNodes;
  return v6;
}

- (id)initLegacyForMemoriesWithServiceManager:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PGTitleGenerationContext;
  v6 = [(PGTitleGenerationContext *)&v14 init];
  if (v6)
  {
    uint64_t v7 = +[PGGraphLocationHelper inefficientLocationHelper];
    locationHelper = v6->_locationHelper;
    v6->_locationHelper = (PGGraphLocationHelper *)v7;

    id v9 = objc_alloc(MEMORY[0x1E4F76CB8]);
    v10 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v11 = [v9 initWithLocale:v10];
    holidayService = v6->_holidayService;
    v6->_holidayService = (CLSHolidayCalendarEventService *)v11;

    if (!v5) {
      __assert_rtn("-[PGTitleGenerationContext initLegacyForMemoriesWithServiceManager:]", "PGTitleGenerationContext.m", 57, "serviceManager != nil");
    }
    objc_storeStrong((id *)&v6->_serviceManager, a3);
  }

  return v6;
}

- (id)initForTestingWithGraph:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PGTitleGenerationContext;
  v6 = [(PGTitleGenerationContext *)&v15 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graph, a3);
    v8 = [[PGGraphLocationHelper alloc] initWithGraph:v5];
    locationHelper = v7->_locationHelper;
    v7->_locationHelper = v8;

    id v10 = objc_alloc(MEMORY[0x1E4F76CB8]);
    uint64_t v11 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v12 = [v10 initWithLocale:v11];
    holidayService = v7->_holidayService;
    v7->_holidayService = (CLSHolidayCalendarEventService *)v12;
  }
  return v7;
}

- (PGTitleGenerationContext)initWithGraph:(id)a3 serviceManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PGTitleGenerationContext;
  id v9 = [(PGTitleGenerationContext *)&v18 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_graph, a3);
    uint64_t v11 = [[PGGraphLocationHelper alloc] initWithGraph:v7];
    locationHelper = v10->_locationHelper;
    v10->_locationHelper = v11;

    id v13 = objc_alloc(MEMORY[0x1E4F76CB8]);
    objc_super v14 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v15 = [v13 initWithLocale:v14];
    holidayService = v10->_holidayService;
    v10->_holidayService = (CLSHolidayCalendarEventService *)v15;

    objc_storeStrong((id *)&v10->_serviceManager, a4);
  }

  return v10;
}

@end