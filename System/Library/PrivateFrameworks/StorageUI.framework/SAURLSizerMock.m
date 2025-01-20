@interface SAURLSizerMock
- (void)startObservingURLs:(id)a3 withUpdateHandler:(id)a4;
- (void)stopObserving;
@end

@implementation SAURLSizerMock

- (void)startObservingURLs:(id)a3 withUpdateHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  NSLog(&cfstr_SaurlsizerStar.isa, v5);
  dispatch_time_t v7 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SAURLSizerMock_startObservingURLs_withUpdateHandler___block_invoke;
  block[3] = &unk_265528FF8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v5;
  id v9 = v6;
  dispatch_after(v7, MEMORY[0x263EF83A0], block);
}

void __55__SAURLSizerMock_startObservingURLs_withUpdateHandler___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  v2 = [NSURL fileURLWithPath:@"/Users/Shared/txt"];
  id v3 = objc_alloc_init(MEMORY[0x263F78A68]);
  [v3 setSize:1000000];
  id v4 = objc_alloc_init(MEMORY[0x263F78A70]);
  id v9 = v2;
  v10[0] = v3;
  id v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v4 setUrlInfo:v5];

  uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [NSNumber numberWithBool:v6];
  NSLog(&cfstr_SaurlsizerStar_0.isa, v7, v8);
}

- (void)stopObserving
{
}

@end