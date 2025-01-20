@interface VUIJSOfferInterface
- (void)clearOffers:(id)a3;
- (void)fetchOffers:(BOOL)a3 :(id)a4;
@end

@implementation VUIJSOfferInterface

void __35__VUIJSOfferInterface_clearOffers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__VUIJSOfferInterface_clearOffers___block_invoke_2;
  v5[3] = &unk_1E6DF6D10;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  id v6 = *(id *)(a1 + 40);
  [v4 evaluate:v5];

  objc_destroyWeak(&v7);
}

void __36__VUIJSOfferInterface_fetchOffers::__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__VUIJSOfferInterface_fetchOffers::__block_invoke_2;
  v9[3] = &unk_1E6DF7A20;
  objc_copyWeak(&v12, (id *)(a1 + 48));
  id v10 = *(id *)(a1 + 40);
  id v8 = v5;
  id v11 = v8;
  [v7 evaluate:v9];

  objc_destroyWeak(&v12);
}

void __35__VUIJSOfferInterface_clearOffers___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained jsValueForProperty:*(void *)(a1 + 32)];
  id v3 = (id)[v2 callWithArguments:0];
  [WeakRetained setJSValue:0 forProperty:*(void *)(a1 + 32)];
}

void __36__VUIJSOfferInterface_fetchOffers::__block_invoke_2(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained jsValueForProperty:*(void *)(a1 + 32)];
  v4 = v3;
  if (*(void *)(a1 + 40))
  {
    v8[0] = *(void *)(a1 + 40);
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    id v6 = (id)[v4 callWithArguments:v5];
  }
  else
  {
    id v7 = (id)[v3 callWithArguments:0];
  }
  [WeakRetained setJSValue:0 forProperty:*(void *)(a1 + 32)];
}

- (void)clearOffers:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIJSObject *)self appContext];
  id v6 = [MEMORY[0x1E4F29128] UUID];
  id v7 = [v6 UUIDString];

  [(VUIJSObject *)self setJSValue:v4 forProperty:v7];
  objc_initWeak(&location, self);
  id v8 = [MEMORY[0x1E4FB50F8] defaultOfferManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __35__VUIJSOfferInterface_clearOffers___block_invoke;
  v11[3] = &unk_1E6DF7A70;
  id v9 = v5;
  id v12 = v9;
  objc_copyWeak(&v14, &location);
  id v10 = v7;
  id v13 = v10;
  [v8 clearOffers:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)fetchOffers:(BOOL)a3 :(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(VUIJSObject *)self appContext];
  id v8 = [MEMORY[0x1E4F29128] UUID];
  id v9 = [v8 UUIDString];

  [(VUIJSObject *)self setJSValue:v6 forProperty:v9];
  objc_initWeak(&location, self);
  id v10 = [MEMORY[0x1E4FB50F8] defaultOfferManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __36__VUIJSOfferInterface_fetchOffers::__block_invoke;
  v13[3] = &unk_1E6DF7A48;
  id v11 = v7;
  id v14 = v11;
  objc_copyWeak(&v16, &location);
  id v12 = v9;
  id v15 = v12;
  [v10 fetchOffers:v4 completion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

@end