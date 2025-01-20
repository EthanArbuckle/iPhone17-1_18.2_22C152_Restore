@interface ATXPOICategoryEnterAndExitEvents
- (ATXPOICategoryEnterAndExitEvents)initWithCategoryEvents:(id)a3 exitEvent:(id)a4;
- (BMStoreEvent)exitEvent;
- (NSArray)categoryEnterEvents;
- (id)visitEvent;
- (id)visitEventAllowingMissingExit:(BOOL)a3;
@end

@implementation ATXPOICategoryEnterAndExitEvents

- (ATXPOICategoryEnterAndExitEvents)initWithCategoryEvents:(id)a3 exitEvent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXPOICategoryEnterAndExitEvents;
  v9 = [(ATXPOICategoryEnterAndExitEvents *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_categoryEnterEvents, a3);
    objc_storeStrong((id *)&v10->_exitEvent, a4);
  }

  return v10;
}

- (id)visitEvent
{
  return [(ATXPOICategoryEnterAndExitEvents *)self visitEventAllowingMissingExit:0];
}

- (id)visitEventAllowingMissingExit:(BOOL)a3
{
  if (!a3 && !self->_exitEvent || (categoryEnterEvents = self->_categoryEnterEvents) == 0)
  {
LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
  if (![(NSArray *)categoryEnterEvents count])
  {
    v17 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_2_cold_1(v17);
    }

    goto LABEL_11;
  }
  v5 = [(NSArray *)self->_categoryEnterEvents objectAtIndexedSubscript:0];
  v6 = [v5 eventBody];
  id v7 = [v6 timestamp];

  id v8 = v7;
  exitEvent = self->_exitEvent;
  v10 = v8;
  if (exitEvent)
  {
    v11 = [(BMStoreEvent *)exitEvent eventBody];
    v10 = [v11 timestamp];
  }
  objc_super v12 = [(NSArray *)self->_categoryEnterEvents sortedArrayUsingComparator:&__block_literal_global_21_0];
  v13 = objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_24);
  v14 = [ATXPOICategoryVisitEvent alloc];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v13];
  v16 = [(ATXPOICategoryVisitEvent *)v14 initWithPossibleCategoryNames:v15 startDate:v8 endDate:v10 hasExited:self->_exitEvent != 0];

LABEL_12:

  return v16;
}

uint64_t __66__ATXPOICategoryEnterAndExitEvents_visitEventAllowingMissingExit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 eventBody];
  uint64_t v6 = [v5 rank];

  id v7 = [v4 eventBody];

  uint64_t v8 = [v7 rank];
  v9 = [NSNumber numberWithUnsignedInteger:v6];
  v10 = [NSNumber numberWithUnsignedInteger:v8];
  uint64_t v11 = [v9 compare:v10];

  return v11;
}

id __66__ATXPOICategoryEnterAndExitEvents_visitEventAllowingMissingExit___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  v3 = [v2 poiCategory];

  return v3;
}

- (NSArray)categoryEnterEvents
{
  return self->_categoryEnterEvents;
}

- (BMStoreEvent)exitEvent
{
  return self->_exitEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitEvent, 0);

  objc_storeStrong((id *)&self->_categoryEnterEvents, 0);
}

@end