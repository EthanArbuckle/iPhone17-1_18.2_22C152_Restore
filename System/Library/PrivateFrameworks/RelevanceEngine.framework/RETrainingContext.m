@interface RETrainingContext
- (BOOL)_wantsAutomaticRemoteContextForwarding;
- (BOOL)isCurrent;
- (BOOL)performSimulationCommand:(id)a3 withOptions:(id)a4;
- (RERelevanceEngine)relevanceEngine;
- (RERemoteTrainingContext)remoteContext;
- (RETrainingContext)attributeContext;
- (RETrainingContext)cachedAttributeContext;
- (RETrainingContext)init;
- (id)attributeForKey:(id)a3;
- (void)_configureForRelevanceEngine:(id)a3;
- (void)_trainElement:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5;
- (void)_trainElementWithIdentifier:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5;
- (void)becomeCurrent;
- (void)dealloc;
- (void)flushTraining;
- (void)setAttribute:(id)a3 forKey:(id)a4;
- (void)setCachedAttributeContext:(id)a3;
- (void)setRemoteContext:(id)a3;
@end

@implementation RETrainingContext

- (void)_configureForRelevanceEngine:(id)a3
{
  p_relevanceEngine = &self->_relevanceEngine;
  id v8 = a3;
  id v5 = objc_storeWeak((id *)p_relevanceEngine, v8);
  remoteContext = self->_remoteContext;
  id v7 = v5;
  [(RETrainingContext *)remoteContext _configureForRelevanceEngine:v8];
}

- (RETrainingContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)RETrainingContext;
  v2 = [(RETrainingContext *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(REConcurrentDictionary);
    attributes = v2->_attributes;
    v2->_attributes = v3;
  }
  return v2;
}

- (void)becomeCurrent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
  v3 = [WeakRetained trainingManager];
  [v3 makeContextCurrent:self];
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
  [WeakRetained removeTrainingContext:self];

  v4.receiver = self;
  v4.super_class = (Class)RETrainingContext;
  [(RETrainingContext *)&v4 dealloc];
}

- (void)_trainElementWithIdentifier:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5
{
  BOOL v6 = a4;
  id v18 = a3;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
  v10 = [WeakRetained trainingManager];

  if (!v10) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Training context must be added to a relevance engine before trying to train", v11, v12, v13, v14, v15, v16, v17);
  }
  [v10 performTrainingForElementWithIdentifier:v18 isPositiveEvent:v6 interaction:v8];
  if ([(RETrainingContext *)self _wantsAutomaticRemoteContextForwarding]) {
    [(RERemoteTrainingContext *)self->_remoteContext trainWithElement:v18 isPositiveEvent:v6 interaction:v8];
  }
}

- (void)_trainElement:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5
{
  BOOL v6 = a4;
  id v18 = a3;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
  v10 = [WeakRetained trainingManager];

  if (!v10) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Training context must be added to a relevance engine before trying to train", v11, v12, v13, v14, v15, v16, v17);
  }
  [v10 performTrainingForElement:v18 isPositiveEvent:v6 interaction:v8];
  if ([(RETrainingContext *)self _wantsAutomaticRemoteContextForwarding]) {
    [(RETrainingContext *)self->_remoteContext trainWithUnmanagedElement:v18 isPositiveEvent:v6 interaction:v8];
  }
}

- (RERelevanceEngine)relevanceEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
  return (RERelevanceEngine *)WeakRetained;
}

- (BOOL)isCurrent
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
  objc_super v4 = [WeakRetained trainingManager];
  id v5 = [v4 currentTrainingContext];
  LOBYTE(v2) = v5 == v2;

  return (char)v2;
}

- (void)setAttribute:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(REConcurrentDictionary *)self->_attributes setObject:v7 forKeyedSubscript:v6];
  [(RETrainingContext *)self setCachedAttributeContext:0];
  if ([(RETrainingContext *)self _wantsAutomaticRemoteContextForwarding]) {
    [(RERemoteTrainingContext *)self->_remoteContext setAttribute:v7 forKey:v6];
  }
}

- (id)attributeForKey:(id)a3
{
  return [(REConcurrentDictionary *)self->_attributes objectForKeyedSubscript:a3];
}

- (BOOL)performSimulationCommand:(id)a3 withOptions:(id)a4
{
  return 0;
}

- (RETrainingContext)cachedAttributeContext
{
  return (RETrainingContext *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCachedAttributeContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAttributeContext, 0);
  objc_storeStrong((id *)&self->_remoteContext, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_destroyWeak((id *)&self->_relevanceEngine);
}

- (RETrainingContext)attributeContext
{
  v3 = [(RETrainingContext *)self cachedAttributeContext];
  if (!v3)
  {
    v3 = objc_alloc_init(RETrainingContext);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
    objc_storeWeak((id *)&v3->_relevanceEngine, WeakRetained);

    uint64_t v5 = [(REConcurrentDictionary *)self->_attributes copy];
    attributes = v3->_attributes;
    v3->_attributes = (REConcurrentDictionary *)v5;

    [(RETrainingContext *)self setCachedAttributeContext:v3];
  }
  return v3;
}

- (BOOL)_wantsAutomaticRemoteContextForwarding
{
  return 1;
}

- (RERemoteTrainingContext)remoteContext
{
  return self->_remoteContext;
}

- (void)flushTraining
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
  v2 = [WeakRetained trainingManager];
  [v2 flushTraining];
}

- (void)setRemoteContext:(id)a3
{
  objc_super v4 = (RERemoteTrainingContext *)a3;
  [(RETrainingContext *)self->_remoteContext _configureForRelevanceEngine:0];
  remoteContext = self->_remoteContext;
  self->_remoteContext = v4;
  id v6 = v4;

  id v7 = self->_remoteContext;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
  [(RETrainingContext *)v7 _configureForRelevanceEngine:WeakRetained];
}

@end