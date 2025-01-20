@interface PGGraphUpdaterWrapper
- (PGGraphUpdaterWrapper)initWithGraphManager:(id)a3;
- (void)applyChangesFromGraphUpdate:(id)a3 progressReporter:(id)a4 completionHandler:(id)a5;
@end

@implementation PGGraphUpdaterWrapper

- (void).cxx_destruct
{
}

- (void)applyChangesFromGraphUpdate:(id)a3 progressReporter:(id)a4 completionHandler:(id)a5
{
}

- (PGGraphUpdaterWrapper)initWithGraphManager:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphUpdaterWrapper;
  v5 = [(PGGraphUpdaterWrapper *)&v9 init];
  if (v5)
  {
    v6 = [[PGGraphUpdater alloc] initWith:v4];
    graphUpdater = v5->_graphUpdater;
    v5->_graphUpdater = v6;
  }
  return v5;
}

@end