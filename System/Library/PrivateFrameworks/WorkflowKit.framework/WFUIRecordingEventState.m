@interface WFUIRecordingEventState
+ (Class)processingValueClass;
- (BOOL)isEqual:(id)a3;
- (NSArray)containedVariables;
- (WFPropertyListObject)serializedRepresentation;
- (WFUIRUserEvent)event;
- (WFUIRecordingEventState)initWithEvent:(id)a3;
- (WFUIRecordingEventState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (unint64_t)hash;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFUIRecordingEventState

- (void).cxx_destruct
{
}

- (WFUIRUserEvent)event
{
  return self->_event;
}

- (WFPropertyListObject)serializedRepresentation
{
  v2 = [(WFUIRecordingEventState *)self event];
  v3 = [v2 serializedRepresentation];

  return (WFPropertyListObject *)v3;
}

- (WFUIRecordingEventState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v6 = a3;
  v7 = [[WFUIRUserEvent alloc] initWithSerializedRepresentation:v6];

  if (v7) {
    v8 = (WFUIRecordingEventState *)[objc_alloc((Class)objc_opt_class()) initWithEvent:v7];
  }
  else {
    v8 = 0;
  }

  return v8;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v7 = a5;
  id v8 = [(WFUIRecordingEventState *)self event];
  (*((void (**)(id, id, void))a5 + 2))(v7, v8, 0);
}

- (NSArray)containedVariables
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (unint64_t)hash
{
  v2 = [(WFUIRecordingEventState *)self event];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFUIRecordingEventState *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WFUIRecordingEventState *)v4 event];
      id v6 = [(WFUIRecordingEventState *)self event];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (WFUIRecordingEventState)initWithEvent:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFUIRecordingEventParameter.m", 18, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFUIRecordingEventState;
  id v6 = [(WFUIRecordingEventState *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    event = v6->_event;
    v6->_event = (WFUIRUserEvent *)v7;

    v9 = v6;
  }

  return v6;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end