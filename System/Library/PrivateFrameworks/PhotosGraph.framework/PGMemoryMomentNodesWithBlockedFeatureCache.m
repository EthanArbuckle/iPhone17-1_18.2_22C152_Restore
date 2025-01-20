@interface PGMemoryMomentNodesWithBlockedFeatureCache
- (PGGraphMomentNodeCollection)momentNodesWithBlockedFeature;
- (PGMemoryMomentNodesWithBlockedFeatureCache)initWithUserFeedbackCalculator:(id)a3;
- (PGMemoryMomentNodesWithBlockedFeatureCache)initWithUserFeedbackCalculator:(id)a3 loggingConnection:(id)a4;
- (id)momentNodesWithBlockedFeatureInGraph:(id)a3 progressReporter:(id)a4;
- (void)prefetchMomentNodesWithBlockedFeatureIfNeededInGraph:(id)a3 progressReporter:(id)a4;
@end

@implementation PGMemoryMomentNodesWithBlockedFeatureCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodesWithBlockedFeature, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_userFeedbackCalculator, 0);
}

- (PGGraphMomentNodeCollection)momentNodesWithBlockedFeature
{
  return self->_momentNodesWithBlockedFeature;
}

- (id)momentNodesWithBlockedFeatureInGraph:(id)a3 progressReporter:(id)a4
{
  [(PGMemoryMomentNodesWithBlockedFeatureCache *)self prefetchMomentNodesWithBlockedFeatureIfNeededInGraph:a3 progressReporter:a4];
  momentNodesWithBlockedFeature = self->_momentNodesWithBlockedFeature;
  return momentNodesWithBlockedFeature;
}

- (void)prefetchMomentNodesWithBlockedFeatureIfNeededInGraph:(id)a3 progressReporter:(id)a4
{
  if (!self->_momentNodesWithBlockedFeature)
  {
    v5 = +[PGMemoryFeatureBlocking momentNodesWithBlockedFeatureInGraph:a3 userFeedbackCalculator:self->_userFeedbackCalculator loggingConnection:self->_loggingConnection progressReporter:a4];
    momentNodesWithBlockedFeature = self->_momentNodesWithBlockedFeature;
    self->_momentNodesWithBlockedFeature = v5;
  }
}

- (PGMemoryMomentNodesWithBlockedFeatureCache)initWithUserFeedbackCalculator:(id)a3
{
  return [(PGMemoryMomentNodesWithBlockedFeatureCache *)self initWithUserFeedbackCalculator:a3 loggingConnection:MEMORY[0x1E4F14500]];
}

- (PGMemoryMomentNodesWithBlockedFeatureCache)initWithUserFeedbackCalculator:(id)a3 loggingConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGMemoryMomentNodesWithBlockedFeatureCache;
  v9 = [(PGMemoryMomentNodesWithBlockedFeatureCache *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userFeedbackCalculator, a3);
    objc_storeStrong((id *)&v10->_loggingConnection, a4);
  }

  return v10;
}

@end