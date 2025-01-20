@interface RETrainingSimulator
- (BOOL)performCommand:(id)a3 withOptions:(id)a4;
- (BOOL)runActionOfElementWithDescription1:(id)a3;
- (NSString)relevanceEngineName;
- (NSString)targetProcessName;
- (RETrainingSimulator)initWithTargetProcess:(id)a3 relevanceEngine:(id)a4;
- (id)allElementIdentifiers;
- (id)allElements;
- (id)availableRelevanceEngines;
- (id)encodedObjectAtPath:(id)a3;
- (id)storedDiagnosticLogsURL;
- (void)createElementFromDescription:(id)a3;
- (void)trainingSimulationClientWasInterrupted:(id)a3;
- (void)trainingSimulationClientWasInvalidated:(id)a3;
@end

@implementation RETrainingSimulator

- (RETrainingSimulator)initWithTargetProcess:(id)a3 relevanceEngine:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RETrainingSimulator;
  v9 = [(RETrainingSimulator *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_targetProcessName, a3);
    objc_storeStrong((id *)&v10->_relevanceEngineName, a4);
    v11 = [[RETrainingSimulationClient alloc] initWithTargetProcessName:v7 delegate:v10];
    client = v10->_client;
    v10->_client = v11;
  }
  return v10;
}

- (void)trainingSimulationClientWasInterrupted:(id)a3
{
  v3 = RELogForDomain(10);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[RETrainingSimulator trainingSimulationClientWasInterrupted:](v3);
  }
}

- (void)trainingSimulationClientWasInvalidated:(id)a3
{
  v3 = RELogForDomain(10);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[RETrainingSimulator trainingSimulationClientWasInvalidated:](v3);
  }
}

- (void)createElementFromDescription:(id)a3
{
}

- (BOOL)performCommand:(id)a3 withOptions:(id)a4
{
  return [(RETrainingSimulationClient *)self->_client relevanceEngine:self->_relevanceEngineName performCommand:a3 withOptions:a4];
}

- (id)allElementIdentifiers
{
  return [(RETrainingSimulationClient *)self->_client fetchAllElementIdentifiersInRelevanceEngine:self->_relevanceEngineName];
}

- (id)allElements
{
  return [(RETrainingSimulationClient *)self->_client fetchAllElementsInRelevanceEngine:self->_relevanceEngineName];
}

- (id)availableRelevanceEngines
{
  return [(RETrainingSimulationClient *)self->_client availableRelevanceEngines];
}

- (BOOL)runActionOfElementWithDescription1:(id)a3
{
  return [(RETrainingSimulationClient *)self->_client relevanceEngine:self->_relevanceEngineName runActionOfElementWithDescription1:a3];
}

- (id)storedDiagnosticLogsURL
{
  return [(RETrainingSimulationClient *)self->_client diagnosticLogFileForRelevanceEngine:self->_relevanceEngineName];
}

- (id)encodedObjectAtPath:(id)a3
{
  return [(RETrainingSimulationClient *)self->_client relevanceEngine:self->_relevanceEngineName encodedObjectAtPath:a3];
}

- (NSString)targetProcessName
{
  return self->_targetProcessName;
}

- (NSString)relevanceEngineName
{
  return self->_relevanceEngineName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevanceEngineName, 0);
  objc_storeStrong((id *)&self->_targetProcessName, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)trainingSimulationClientWasInterrupted:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E6E6000, log, OS_LOG_TYPE_ERROR, "Connect to relevance engine was interrupted", v1, 2u);
}

- (void)trainingSimulationClientWasInvalidated:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E6E6000, log, OS_LOG_TYPE_ERROR, "Connect to relevance engine was invalidated", v1, 2u);
}

@end