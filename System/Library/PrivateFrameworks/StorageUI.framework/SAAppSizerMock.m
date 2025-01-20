@interface SAAppSizerMock
- (void)startObservingWithUpdateHandler:(id)a3;
- (void)stopObserving;
@end

@implementation SAAppSizerMock

- (void)startObservingWithUpdateHandler:(id)a3
{
  id v3 = a3;
  NSLog(&cfstr_SaappsizerStar.isa);
  dispatch_time_t v4 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SAAppSizerMock_startObservingWithUpdateHandler___block_invoke;
  block[3] = &unk_265528FD0;
  id v7 = v3;
  id v5 = v3;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

void __50__SAAppSizerMock_startObservingWithUpdateHandler___block_invoke(uint64_t a1)
{
  v23[8] = *MEMORY[0x263EF8340];
  id v20 = objc_alloc_init(MEMORY[0x263F78A48]);
  [v20 setFixedSize:1000000000];
  id v1 = objc_alloc_init(MEMORY[0x263F78A48]);
  [v1 setFixedSize:190000000];
  v19 = v1;
  [v1 setDataSize:794000000];
  id v2 = objc_alloc_init(MEMORY[0x263F78A48]);
  [v2 setFixedSize:250000000];
  [v2 setDataSize:6000000];
  id v18 = objc_alloc_init(MEMORY[0x263F78A48]);
  [v18 setFixedSize:17000000000];
  id v17 = objc_alloc_init(MEMORY[0x263F78A48]);
  [v17 setFixedSize:20000000000];
  id v15 = objc_alloc_init(MEMORY[0x263F78A48]);
  [v15 setFixedSize:5000000000];
  id v3 = objc_alloc_init(MEMORY[0x263F78A48]);
  [v3 setFixedSize:3000000000];
  id v12 = objc_alloc_init(MEMORY[0x263F78A48]);
  [v12 setFixedSize:200000000000];
  id v13 = objc_alloc_init(MEMORY[0x263F78A50]);
  v16 = [MEMORY[0x263EFFA08] setWithObject:@"com.apple.dt.Xcode"];
  v22[0] = v16;
  v23[0] = v20;
  v14 = [MEMORY[0x263EFFA08] setWithObject:@"com.company.app1"];
  v22[1] = v14;
  v23[1] = v1;
  dispatch_time_t v4 = [MEMORY[0x263EFFA08] setWithObject:@"com.company.app2"];
  v22[2] = v4;
  v23[2] = v2;
  id v5 = [MEMORY[0x263EFFA08] setWithObject:@"SACategoryIdentifierTrash"];
  v22[3] = v5;
  v23[3] = v18;
  v6 = [MEMORY[0x263EFFA08] setWithObject:@"SACategoryIdentifierSystem"];
  v22[4] = v6;
  v23[4] = v17;
  id v7 = [MEMORY[0x263EFFA08] setWithObject:@"SACategoryIdentifierSystemData"];
  v22[5] = v7;
  v23[5] = v15;
  v8 = [MEMORY[0x263EFFA08] setWithObject:@"SACategoryIdentifierOtherUsers"];
  v22[6] = v8;
  v23[6] = v3;
  v9 = [MEMORY[0x263EFFA08] setWithObject:@"SACategoryIdentifierDocuments"];
  v22[7] = v9;
  v23[7] = v12;
  v10 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:8];
  [v13 setAppData:v10];

  v11 = [NSNumber numberWithBool:(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))()];
  NSLog(&cfstr_SaappsizerStar_0.isa, v11);
}

- (void)stopObserving
{
}

@end