@interface _RETrainingProxy
- (NSString)serviceName;
- (RETrainingSimulationServer)server;
- (_RETrainingProxy)initWithServiceName:(id)a3;
- (void)availableRelevanceEngines:(id)a3;
- (void)fetchAllElementIdentifiersInRelevanceEngine:(id)a3 completion:(id)a4;
- (void)fetchAllElementsInRelevanceEngine:(id)a3 completion:(id)a4;
- (void)gatherDiagnosticLogsForRelevanceEngine:(id)a3 completion:(id)a4;
- (void)relevanceEngine:(id)a3 createElementFromDescription:(id)a4 completion:(id)a5;
- (void)relevanceEngine:(id)a3 encodedObjectAtPath:(id)a4 completion:(id)a5;
- (void)relevanceEngine:(id)a3 performCommand:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (void)relevanceEngine:(id)a3 runActionOfElementWithDescription1:(id)a4 completion:(id)a5;
@end

@implementation _RETrainingProxy

- (_RETrainingProxy)initWithServiceName:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_RETrainingProxy;
  v6 = [(_RETrainingProxy *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceName, a3);
    v8 = [[RETrainingSimulationClient alloc] initWithServiceName:v5 delegate:v7];
    client = v7->_client;
    v7->_client = v8;

    uint64_t v10 = +[RETrainingSimulationServer sharedServer];
    server = v7->_server;
    v7->_server = (RETrainingSimulationServer *)v10;

    [(RETrainingSimulationServer *)v7->_server addObserver:v7];
  }

  return v7;
}

- (void)availableRelevanceEngines:(id)a3
{
  client = self->_client;
  v4 = (void (**)(id, id, void))a3;
  id v5 = [(RETrainingSimulationClient *)client availableRelevanceEngines];
  v4[2](v4, v5, 0);
}

- (void)fetchAllElementIdentifiersInRelevanceEngine:(id)a3 completion:(id)a4
{
  client = self->_client;
  v6 = (void (**)(id, id, void))a4;
  id v7 = [(RETrainingSimulationClient *)client fetchAllElementIdentifiersInRelevanceEngine:a3];
  v6[2](v6, v7, 0);
}

- (void)fetchAllElementsInRelevanceEngine:(id)a3 completion:(id)a4
{
  client = self->_client;
  v6 = (void (**)(id, id, void))a4;
  id v7 = [(RETrainingSimulationClient *)client fetchAllElementsInRelevanceEngine:a3];
  v6[2](v6, v7, 0);
}

- (void)gatherDiagnosticLogsForRelevanceEngine:(id)a3 completion:(id)a4
{
  client = self->_client;
  v6 = (void (**)(id, void *, id))a4;
  id v7 = [(RETrainingSimulationClient *)client diagnosticLogFileForRelevanceEngine:a3];
  id v10 = 0;
  v8 = [v7 bookmarkDataWithOptions:0 includingResourceValuesForKeys:0 relativeToURL:0 error:&v10];
  id v9 = v10;
  v6[2](v6, v8, v9);
}

- (void)relevanceEngine:(id)a3 createElementFromDescription:(id)a4 completion:(id)a5
{
  client = self->_client;
  v8 = (void (**)(id, void))a5;
  [(RETrainingSimulationClient *)client relevanceEngine:a3 createElementFromDescription:a4];
  v8[2](v8, 0);
}

- (void)relevanceEngine:(id)a3 encodedObjectAtPath:(id)a4 completion:(id)a5
{
  client = self->_client;
  v8 = (void (**)(id, id))a5;
  id v9 = [(RETrainingSimulationClient *)client relevanceEngine:a3 encodedObjectAtPath:a4];
  v8[2](v8, v9);
}

- (void)relevanceEngine:(id)a3 performCommand:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  client = self->_client;
  id v10 = (void (**)(id, void))a6;
  [(RETrainingSimulationClient *)client relevanceEngine:a3 performCommand:a4 withOptions:a5];
  v10[2](v10, 0);
}

- (void)relevanceEngine:(id)a3 runActionOfElementWithDescription1:(id)a4 completion:(id)a5
{
  client = self->_client;
  v8 = (void (**)(id, uint64_t, void))a5;
  v8[2](v8, [(RETrainingSimulationClient *)client relevanceEngine:a3 runActionOfElementWithDescription1:a4], 0);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (RETrainingSimulationServer)server
{
  return self->_server;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end