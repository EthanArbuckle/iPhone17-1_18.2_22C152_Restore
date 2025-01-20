@interface ULCoreDuetPublisher
+ (void)clearMicroLocationVisitStream;
+ (void)saveEventForDebugInitialBringUp;
+ (void)saveEventsToDuetStream:(id)a3;
@end

@implementation ULCoreDuetPublisher

+ (void)saveEventsToDuetStream:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_create("com.apple.milod.ULCoreDuetPublisher.saveEventsToDuetStream", v4);

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__ULCoreDuetPublisher_saveEventsToDuetStream___block_invoke;
    block[3] = &unk_2653F91D8;
    id v7 = v3;
    dispatch_async(v5, block);
  }
}

void __46__ULCoreDuetPublisher_saveEventsToDuetStream___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F350B8] knowledgeStore];
  uint64_t v3 = *(void *)(a1 + 32);
  id v16 = 0;
  uint64_t v4 = [v2 saveObjects:v3 error:&v16];
  id v5 = v16;

  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_15);
    }
    v11 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v12 = NSNumber;
      v13 = *(void **)(a1 + 32);
      v14 = v11;
      v15 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
      *(_DWORD *)buf = 138412290;
      v18 = v15;
      _os_log_impl(&dword_25631F000, v14, OS_LOG_TYPE_DEFAULT, "Saved %@ events", buf, 0xCu);
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_15);
    }
    id v7 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      v8 = NSNumber;
      v9 = v7;
      v10 = [v8 numberWithBool:v4];
      *(_DWORD *)buf = 138412546;
      v18 = v10;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_25631F000, v9, OS_LOG_TYPE_ERROR, "Couldnt save events, res: %@, error: %@", buf, 0x16u);
    }
  }
}

+ (void)clearMicroLocationVisitStream
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  queue = dispatch_queue_create("com.apple.milod.ULCoreDuetPublisher.clearMicroLocationVisitStream", v2);

  dispatch_async(queue, &__block_literal_global_88);
}

void __52__ULCoreDuetPublisher_clearMicroLocationVisitStream__block_invoke()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F350B8] knowledgeStore];
  v1 = [MEMORY[0x263F35148] microLocationVisitStream];
  id v9 = 0;
  uint64_t v2 = [v0 deleteAllEventsInEventStream:v1 error:&v9];
  id v3 = v9;

  if (v3)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_15);
    }
    uint64_t v4 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_ERROR, "Couldnt delete all events from microLocationVisitStream, error: %@", buf, 0xCu);
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_15);
    }
    id v5 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = NSNumber;
      id v7 = v5;
      v8 = [v6 numberWithUnsignedInteger:v2];
      *(_DWORD *)buf = 138412290;
      id v11 = v8;
      _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_DEFAULT, "Deleted: %@ events", buf, 0xCu);
    }
  }
}

+ (void)saveEventForDebugInitialBringUp
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F35088];
  uint64_t v4 = [MEMORY[0x263F35148] microLocationVisitStream];
  id v5 = [MEMORY[0x263EFF910] now];
  BOOL v6 = [MEMORY[0x263EFF910] now];
  id v7 = [v6 dateByAddingTimeInterval:1000.0];
  v8 = (void *)MEMORY[0x263F35160];
  id v9 = [MEMORY[0x263F08C38] UUID];
  v10 = [v8 withUUID:v9];
  id v11 = [v3 eventWithStream:v4 startDate:v5 endDate:v7 value:v10];

  v13[0] = v11;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [a1 saveEventsToDuetStream:v12];
}

@end