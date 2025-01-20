@interface RERemoteTrainingContext
- (BOOL)isCurrent;
- (RERemoteTrainingContext)initWithProcessName:(id)a3;
- (void)_queue_enqueueRemoteTrainingForElement:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5;
- (void)_queue_performRemoteTraining;
- (void)_queue_setRemoteAttribute:(id)a3 forKey:(id)a4;
- (void)setAttribute:(id)a3 forKey:(id)a4;
- (void)trainWithPredictionElement:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5;
@end

@implementation RERemoteTrainingContext

- (RERemoteTrainingContext)initWithProcessName:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RERemoteTrainingContext;
  v5 = [(RETrainingContext *)&v16 init];
  v6 = v5;
  if (v5)
  {
    [(RETrainingContext *)v5 _configureForRelevanceEngine:0];
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    trainingElements = v6->_trainingElements;
    v6->_trainingElements = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x263EFF980] array];
    trainingEvents = v6->_trainingEvents;
    v6->_trainingEvents = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x263EFF980] array];
    trainingInteractions = v6->_trainingInteractions;
    v6->_trainingInteractions = (NSMutableArray *)v11;

    v13 = [[RERemoteTrainingServer alloc] initWithTargetProcessName:v4];
    trainingServer = v6->_trainingServer;
    v6->_trainingServer = v13;
  }
  return v6;
}

- (void)setAttribute:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RETrainingContext *)self attributeForKey:v7];
  if (v8 == v6)
  {
  }
  else
  {
    uint64_t v9 = v8;
    char v10 = [v6 isEqual:v8];

    if ((v10 & 1) == 0)
    {
      [(RERemoteTrainingContext *)self _willSetAttributeForRemoteTraining];
      v11.receiver = self;
      v11.super_class = (Class)RERemoteTrainingContext;
      [(RETrainingContext *)&v11 setAttribute:v6 forKey:v7];
      [(RERemoteTrainingContext *)self _queue_setRemoteAttribute:v6 forKey:v7];
    }
  }
}

- (BOOL)isCurrent
{
  return 0;
}

- (void)_queue_enqueueRemoteTrainingForElement:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5
{
  BOOL v5 = a4;
  trainingElements = self->_trainingElements;
  id v11 = a5;
  [(NSMutableArray *)trainingElements addObject:a3];
  trainingEvents = self->_trainingEvents;
  char v10 = [NSNumber numberWithBool:v5];
  [(NSMutableArray *)trainingEvents addObject:v10];

  [(NSMutableArray *)self->_trainingInteractions addObject:v11];
}

- (void)_queue_performRemoteTraining
{
  [(RERemoteTrainingContext *)self _willPerformRemoteTraining];
  if ([(NSMutableArray *)self->_trainingElements count])
  {
    objc_initWeak(&location, self);
    trainingServer = self->_trainingServer;
    trainingElements = self->_trainingElements;
    trainingEvents = self->_trainingEvents;
    trainingInteractions = self->_trainingInteractions;
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __55__RERemoteTrainingContext__queue_performRemoteTraining__block_invoke;
    objc_super v16 = &unk_2644BC638;
    objc_copyWeak(&v17, &location);
    [(RERemoteTrainingServer *)trainingServer performTrainingWithElements:trainingElements events:trainingEvents interactions:trainingInteractions completion:&v13];
    objc_msgSend(MEMORY[0x263EFF980], "array", v13, v14, v15, v16);
    id v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    id v8 = self->_trainingElements;
    self->_trainingElements = v7;

    uint64_t v9 = [MEMORY[0x263EFF980] array];
    char v10 = self->_trainingEvents;
    self->_trainingEvents = v9;

    id v11 = [MEMORY[0x263EFF980] array];
    v12 = self->_trainingInteractions;
    self->_trainingInteractions = v11;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    [(RERemoteTrainingContext *)self _didPerformRemoteTraining];
  }
}

void __55__RERemoteTrainingContext__queue_performRemoteTraining__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didPerformRemoteTraining];
}

- (void)_queue_setRemoteAttribute:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  trainingServer = self->_trainingServer;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__RERemoteTrainingContext__queue_setRemoteAttribute_forKey___block_invoke;
  v9[3] = &unk_2644BC638;
  objc_copyWeak(&v10, &location);
  [(RERemoteTrainingServer *)trainingServer updateRemoteAttribute:v6 forKey:v7 completion:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __60__RERemoteTrainingContext__queue_setRemoteAttribute_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didSetAttributeForRemoteTraining];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainingServer, 0);
  objc_storeStrong((id *)&self->_trainingInteractions, 0);
  objc_storeStrong((id *)&self->_trainingEvents, 0);
  objc_storeStrong((id *)&self->_trainingElements, 0);
}

- (void)trainWithPredictionElement:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  id v8 = a5;
  if (v10)
  {
    uint64_t v9 = (void *)MEMORY[0x223C31460]();
    [(RERemoteTrainingContext *)self _queue_enqueueRemoteTrainingForElement:v10 isPositiveEvent:v6 interaction:v8];
    [(RERemoteTrainingContext *)self _queue_performRemoteTraining];
  }
}

@end