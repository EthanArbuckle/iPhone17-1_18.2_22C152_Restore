@interface MTConfigAMSMetricsDelegate
- (AMSBagProtocol)bag;
- (MTConfigAMSMetricsDelegate)initWithAMSBag:(id)a3;
- (id)sources;
- (void)setBag:(id)a3;
@end

@implementation MTConfigAMSMetricsDelegate

- (void).cxx_destruct
{
}

- (MTConfigAMSMetricsDelegate)initWithAMSBag:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTConfigAMSMetricsDelegate;
  v5 = [(MTConfigAMSMetricsDelegate *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(MTConfigAMSMetricsDelegate *)v5 setBag:v4];
    [MEMORY[0x263F27B38] registerBagKeySetForMetricsConfiguration:v4];
  }

  return v6;
}

- (void)setBag:(id)a3
{
}

- (id)sources
{
  v2 = [(MTConfigAMSMetricsDelegate *)self bag];
  v3 = [v2 dictionaryForKey:@"metrics"];

  if (v3)
  {
    v10 = objc_opt_new();
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __37__MTConfigAMSMetricsDelegate_sources__block_invoke;
    v15[3] = &unk_26430FCF0;
    id v11 = v10;
    id v16 = v11;
    [v3 valueWithCompletion:v15];
  }
  else
  {
    v12 = MTConfigurationError(103, @"AMSBag doesn't have metrics key in the registered keyset.", v4, v5, v6, v7, v8, v9, v14);
    id v11 = +[MTPromise promiseWithError:v12];
  }

  return v11;
}

void __37__MTConfigAMSMetricsDelegate_sources__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v6 = a2;
  if (a4)
  {
    [*(id *)(a1 + 32) finishWithError:a4];
  }
  else
  {
    uint64_t v7 = +[MTReflectUtil objectAsDictionary:v6];
    uint64_t v8 = [v7 copy];

    uint64_t v9 = *(void **)(a1 + 32);
    v11[0] = v8;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    [v9 finishWithResult:v10];

    id v6 = (id)v8;
  }
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

@end