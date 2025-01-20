@interface HVNotificationStacksContentStream
- (BOOL)pruneEventsWithError:(id *)a3 predicateBlock:(id)a4;
- (HVNotificationStacksContentStream)init;
- (HVNotificationStacksContentStream)initWithStreamIdentifier:(id)a3;
- (HVNotificationStacksContentStream)initWithStreamIdentifier:(id)a3 eventClass:(Class)a4;
- (id)identifier;
- (id)publisher;
- (id)publisherFromStartTime:(double)a3;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6;
- (id)source;
- (void)pruneWithPredicateBlock:(id)a3;
@end

@implementation HVNotificationStacksContentStream

- (void).cxx_destruct
{
}

- (BOOL)pruneEventsWithError:(id *)a3 predicateBlock:(id)a4
{
  stream = self->_stream;
  id v5 = a4;
  v6 = [(BMStream *)stream pruner];
  [v6 deleteEventsPassingTest:v5];

  return 1;
}

- (void)pruneWithPredicateBlock:(id)a3
{
  stream = self->_stream;
  id v4 = a3;
  id v5 = [(BMStream *)stream pruner];
  [v5 deleteEventsPassingTest:v4];
}

- (id)publisher
{
  return (id)[(BMStream *)self->_stream DSLPublisher];
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    id v13 = objc_alloc(MEMORY[0x263EFF910]);
    [v10 doubleValue];
    v14 = objc_msgSend(v13, "initWithTimeIntervalSinceReferenceDate:");
    if (v11)
    {
LABEL_3:
      id v15 = objc_alloc(MEMORY[0x263EFF910]);
      [v11 doubleValue];
      v16 = objc_msgSend(v15, "initWithTimeIntervalSinceReferenceDate:");
      goto LABEL_6;
    }
  }
  else
  {
    v14 = 0;
    if (v11) {
      goto LABEL_3;
    }
  }
  v16 = 0;
LABEL_6:
  v17 = objc_msgSend(objc_alloc(MEMORY[0x263F2A8B0]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v14, v16, objc_msgSend(v12, "integerValue"), 0, v6);
  v18 = [(BMStream *)self->_stream publisherWithOptions:v17];

  return v18;
}

- (id)publisherFromStartTime:(double)a3
{
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceReferenceDate:a3];
  id v5 = (void *)[objc_alloc(MEMORY[0x263F2A8B0]) initWithStartDate:v4 endDate:0 maxEvents:0 lastN:0 reversed:0];
  BOOL v6 = [(BMStream *)self->_stream publisherWithOptions:v5];

  return v6;
}

- (id)identifier
{
  return (id)[(BMStream *)self->_stream identifier];
}

- (id)source
{
  return (id)[(BMStream *)self->_stream source];
}

- (HVNotificationStacksContentStream)initWithStreamIdentifier:(id)a3 eventClass:(Class)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HVNotificationStacksContentStream;
  id v4 = [(BMContentStream *)&v10 initWithStreamIdentifier:a3 eventClass:a4];
  if (v4)
  {
    id v5 = BiomeLibrary();
    BOOL v6 = [v5 ProactiveHarvesting];
    uint64_t v7 = [v6 NotificationStacks];
    stream = v4->_stream;
    v4->_stream = (BMStream *)v7;
  }
  return v4;
}

- (HVNotificationStacksContentStream)initWithStreamIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HVNotificationStacksContentStream *)self initWithStreamIdentifier:v4 eventClass:objc_opt_class()];

  return v5;
}

- (HVNotificationStacksContentStream)init
{
  v3 = BiomeLibrary();
  id v4 = [v3 ProactiveHarvesting];
  id v5 = [v4 NotificationStacks];
  BOOL v6 = [v5 identifier];
  uint64_t v7 = [(HVNotificationStacksContentStream *)self initWithStreamIdentifier:v6 eventClass:objc_opt_class()];

  return v7;
}

@end