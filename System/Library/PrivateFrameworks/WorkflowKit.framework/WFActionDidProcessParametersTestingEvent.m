@interface WFActionDidProcessParametersTestingEvent
- (NSDictionary)processedParameters;
- (WFActionDidProcessParametersTestingEvent)initWithAction:(id)a3 processedParameters:(id)a4;
@end

@implementation WFActionDidProcessParametersTestingEvent

- (void).cxx_destruct
{
}

- (NSDictionary)processedParameters
{
  return self->_processedParameters;
}

- (WFActionDidProcessParametersTestingEvent)initWithAction:(id)a3 processedParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFActionDidProcessParametersTestingEvent.m", 16, @"Invalid parameter not satisfying: %@", @"processedParameters" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)WFActionDidProcessParametersTestingEvent;
  v9 = [(WFActionTestingEvent *)&v15 initWithAction:v7];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    processedParameters = v9->_processedParameters;
    v9->_processedParameters = (NSDictionary *)v10;

    v12 = v9;
  }

  return v9;
}

@end