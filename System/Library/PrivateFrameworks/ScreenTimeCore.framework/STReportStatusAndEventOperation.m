@interface STReportStatusAndEventOperation
- (BOOL)isAsynchronous;
- (NSDictionary)eventsDict;
- (NSDictionary)statusDict;
- (STReportStatusAndEventOperation)initWithEvents:(id)a3;
- (STReportStatusAndEventOperation)initWithStatus:(id)a3;
- (id)payloadHandler;
- (void)main;
- (void)setEventsDict:(id)a3;
- (void)setPayloadHandler:(id)a3;
- (void)setStatusDict:(id)a3;
@end

@implementation STReportStatusAndEventOperation

- (STReportStatusAndEventOperation)initWithStatus:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STReportStatusAndEventOperation;
  v5 = [(STOperation *)&v9 init];
  if (v5)
  {
    v6 = (NSDictionary *)[v4 copy];
    statusDict = v5->_statusDict;
    v5->_statusDict = v6;
  }
  return v5;
}

- (STReportStatusAndEventOperation)initWithEvents:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STReportStatusAndEventOperation;
  v5 = [(STOperation *)&v9 init];
  if (v5)
  {
    v6 = (NSDictionary *)[v4 copy];
    eventsDict = v5->_eventsDict;
    v5->_eventsDict = v6;
  }
  return v5;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  v3 = [(STReportStatusAndEventOperation *)self statusDict];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = [(STReportStatusAndEventOperation *)self statusDict];
    v6 = [v5 objectForKeyedSubscript:DMFDeclarationStatusMessagesKey];

    uint64_t v15 = 0;
    v7 = (id *)&v15;
    uint64_t v8 = +[STTransportRequestPayload statusPayloadWithMessages:v6 error:&v15];
  }
  else
  {
    objc_super v9 = [(STReportStatusAndEventOperation *)self eventsDict];
    v6 = [v9 objectForKeyedSubscript:DMFDeclarationStatusMessagesKey];

    uint64_t v14 = 0;
    v7 = (id *)&v14;
    uint64_t v8 = +[STTransportRequestPayload eventsPayloadWithMessages:v6 error:&v14];
  }
  v10 = (void *)v8;
  id v11 = *v7;

  if (v10)
  {
    uint64_t v12 = [(STReportStatusAndEventOperation *)self payloadHandler];
    v13 = (void *)v12;
    if (v12) {
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v10);
    }
    [(STReportStatusAndEventOperation *)self endOperationWithResultObject:0];
  }
  else
  {
    [(STReportStatusAndEventOperation *)self endOperationWithError:v11];
  }
}

- (id)payloadHandler
{
  return self->_payloadHandler;
}

- (void)setPayloadHandler:(id)a3
{
}

- (NSDictionary)statusDict
{
  return self->_statusDict;
}

- (void)setStatusDict:(id)a3
{
}

- (NSDictionary)eventsDict
{
  return self->_eventsDict;
}

- (void)setEventsDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsDict, 0);
  objc_storeStrong((id *)&self->_statusDict, 0);
  objc_storeStrong(&self->_payloadHandler, 0);
}

@end