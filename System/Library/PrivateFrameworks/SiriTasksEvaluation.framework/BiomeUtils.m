@interface BiomeUtils
+ (id)getEventsFromPublisher:(id)a3;
+ (id)getEventsFromStream:(id)a3 startingAt:(id)a4 until:(id)a5;
@end

@implementation BiomeUtils

+ (id)getEventsFromStream:(id)a3 startingAt:(id)a4 until:(id)a5
{
  id v7 = a5;
  v8 = (objc_class *)MEMORY[0x263EFF980];
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v8);
  [v9 timeIntervalSinceReferenceDate];
  double v13 = v12;

  v14 = [v10 publisherFromStartTime:v13];

  NSLog(&cfstr_PublisherLooks.isa, v14);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __51__BiomeUtils_getEventsFromStream_startingAt_until___block_invoke_2;
  v21[3] = &unk_2644BAD70;
  id v22 = v7;
  id v15 = v11;
  id v23 = v15;
  id v16 = v7;
  id v17 = (id)[v14 sinkWithCompletion:&__block_literal_global receiveInput:v21];
  v18 = v23;
  id v19 = v15;

  return v19;
}

void __51__BiomeUtils_getEventsFromStream_startingAt_until___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (!*(void *)(a1 + 32)
    || ([v3 timestamp],
        double v5 = v4,
        [*(id *)(a1 + 32) timeIntervalSinceReferenceDate],
        v6 = v8,
        v5 < v7))
  {
    [*(id *)(a1 + 40) addObject:v8];
    v6 = v8;
  }
}

+ (id)getEventsFromPublisher:(id)a3
{
  id v3 = a3;
  NSLog(&cfstr_PublisherLooks.isa, v3);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__BiomeUtils_getEventsFromPublisher___block_invoke_2;
  v8[3] = &unk_2644BAD98;
  id v5 = v4;
  id v9 = v5;
  id v6 = (id)[v3 sinkWithCompletion:&__block_literal_global_4 receiveInput:v8];

  return v5;
}

uint64_t __37__BiomeUtils_getEventsFromPublisher___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

@end