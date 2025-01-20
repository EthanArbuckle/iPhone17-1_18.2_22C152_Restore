@interface VUIJSMetricsInterface
- (VUIJSMetricsInterface)initWithAppContext:(id)a3;
- (void)campaignAttributionForUrl:(id)a3 :(id)a4;
- (void)recordLogEvent:(id)a3;
@end

@implementation VUIJSMetricsInterface

- (VUIJSMetricsInterface)initWithAppContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUIJSMetricsInterface;
  return [(VUIJSObject *)&v4 initWithAppContext:a3];
}

- (void)recordLogEvent:(id)a3
{
  id v3 = a3;
  id v4 = +[VUIMetricsController sharedInstance];
  [v4 recordLog:v3];
}

- (void)campaignAttributionForUrl:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
  v9 = [MEMORY[0x1E4F29128] UUID];
  v10 = [v9 UUIDString];

  [(VUIJSObject *)self setJSValue:v7 forProperty:v10];
  v11 = [(VUIJSObject *)self appContext];
  objc_initWeak(&location, v11);

  objc_initWeak(&from, self);
  v12 = objc_msgSend(MEMORY[0x1E4F4DBD8], "vui_defaultBag");
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F4DC08]) initWithURL:v8 bag:v12];
  v14 = [v13 perform];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52__VUIJSMetricsInterface_campaignAttributionForUrl::__block_invoke;
  v17[3] = &unk_1E6DFDB00;
  objc_copyWeak(&v19, &location);
  objc_copyWeak(&v20, &from);
  id v15 = v10;
  id v18 = v15;
  id v16 = (id)[v14 thenWithBlock:v17];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

uint64_t __52__VUIJSMetricsInterface_campaignAttributionForUrl::__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 redirectURL];
  v5 = [v4 absoluteString];

  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__VUIJSMetricsInterface_campaignAttributionForUrl::__block_invoke_2;
  v9[3] = &unk_1E6DF7A20;
  objc_copyWeak(&v12, a1 + 6);
  id v10 = a1[4];
  id v7 = v5;
  id v11 = v7;
  [WeakRetained evaluate:v9];

  objc_destroyWeak(&v12);
  return 0;
}

void __52__VUIJSMetricsInterface_campaignAttributionForUrl::__block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained jsValueForProperty:*(void *)(a1 + 32)];
  v6[0] = *(void *)(a1 + 40);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  id v5 = (id)[v3 callWithArguments:v4];

  [WeakRetained setJSValue:0 forProperty:*(void *)(a1 + 32)];
}

@end