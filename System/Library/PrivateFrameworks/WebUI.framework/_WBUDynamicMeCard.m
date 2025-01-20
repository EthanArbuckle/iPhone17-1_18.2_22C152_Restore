@interface _WBUDynamicMeCard
+ (id)_contactObjectComponentForString:(id)a3;
- (BOOL)meCardExists;
- (_WBUDynamicMeCard)init;
- (id)me;
- (id)valueForProperty:(id)a3 contact:(id)a4;
- (void)_fetchContactKeysWithHandler:(id)a3;
- (void)_meCardChanged:(id)a3;
- (void)performWhenReady:(id)a3;
@end

@implementation _WBUDynamicMeCard

- (id)me
{
  return self->_me;
}

- (_WBUDynamicMeCard)init
{
  v7.receiver = self;
  v7.super_class = (Class)_WBUDynamicMeCard;
  v2 = [(_WBUDynamicMeCard *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__meCardChanged_ name:*MEMORY[0x263EFE120] object:0];

    id v4 = objc_alloc_init(MEMORY[0x263EFEA58]);
    v2->_meCardExists = +[WBUFormDataController contactStoreHasMeCard:v4];

    v5 = v2;
  }

  return v2;
}

- (void)_meCardChanged:(id)a3
{
  me = self->_me;
  self->_me = 0;

  id v5 = objc_alloc_init(MEMORY[0x263EFEA58]);
  self->_meCardExists = +[WBUFormDataController contactStoreHasMeCard:v5];
}

- (id)valueForProperty:(id)a3 contact:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[WBSFormDataController contactKeyForString:a3];
  objc_super v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    v8 = [v5 valueForKey:v6];
  }

  return v8;
}

- (void)performWhenReady:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = v4;
  if (self->_me)
  {
    v4[2](v4);
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = (void *)[v4 copy];

    blocksPendingMeCard = self->_blocksPendingMeCard;
    if (blocksPendingMeCard)
    {
      v8 = (void *)MEMORY[0x21D4A5780](v6);
      [(NSMutableArray *)blocksPendingMeCard addObject:v8];
    }
    else
    {
      id v9 = objc_alloc(MEMORY[0x263EFF980]);
      v10 = (void *)MEMORY[0x21D4A5780](v6);
      v11 = (NSMutableArray *)objc_msgSend(v9, "initWithObjects:", v10, 0);
      v12 = self->_blocksPendingMeCard;
      self->_blocksPendingMeCard = v11;

      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __38___WBUDynamicMeCard_performWhenReady___block_invoke;
      v17[3] = &unk_2643F0310;
      v17[4] = self;
      v13 = (void *)MEMORY[0x21D4A5780](v17);
      if ([MEMORY[0x263EFEA58] authorizationStatusForEntityType:0] == 3)
      {
        [(_WBUDynamicMeCard *)self _fetchContactKeysWithHandler:v13];
      }
      else
      {
        id v14 = objc_alloc_init(MEMORY[0x263EFEA58]);
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __38___WBUDynamicMeCard_performWhenReady___block_invoke_3;
        v15[3] = &unk_2643F0338;
        v15[4] = self;
        id v16 = v13;
        [v14 requestAccessForEntityType:0 completionHandler:v15];
      }
    }
  }
}

- (void)_fetchContactKeysWithHandler:(id)a3
{
  v17[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFEA70] descriptorForRequiredKeys];
  v17[0] = v4;
  id v5 = [MEMORY[0x263EFEA20] descriptorForRequiredKeysForStyle:0];
  v17[1] = v5;
  uint64_t v6 = [MEMORY[0x263EFEA20] descriptorForRequiredKeysForStyle:1];
  v17[2] = v6;
  objc_super v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];

  id v8 = objc_alloc_init(MEMORY[0x263EFEA58]);
  id v9 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50___WBUDynamicMeCard__fetchContactKeysWithHandler___block_invoke;
  block[3] = &unk_2643F0360;
  id v14 = v8;
  id v15 = v7;
  id v16 = v3;
  id v10 = v3;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v9, block);
}

+ (id)_contactObjectComponentForString:(id)a3
{
  v17[8] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)_contactObjectComponentForString__map;
  if (!_contactObjectComponentForString__map)
  {
    uint64_t v5 = *MEMORY[0x263EFE950];
    v16[0] = @"Street";
    v16[1] = @"City";
    uint64_t v6 = *MEMORY[0x263EFE918];
    v17[0] = v5;
    v17[1] = v6;
    uint64_t v7 = *MEMORY[0x263EFE948];
    v16[2] = @"State";
    v16[3] = @"ZIP";
    uint64_t v8 = *MEMORY[0x263EFE938];
    v17[2] = v7;
    v17[3] = v8;
    uint64_t v9 = *MEMORY[0x263EFE920];
    v16[4] = @"Country";
    v16[5] = @"ISOCountry";
    uint64_t v10 = *MEMORY[0x263EFE928];
    void v17[4] = v9;
    void v17[5] = v10;
    v16[6] = @"Username";
    v16[7] = @"Service";
    uint64_t v11 = *MEMORY[0x263EFE1C8];
    v17[6] = *MEMORY[0x263EFE1D0];
    v17[7] = v11;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:8];
    v13 = (void *)_contactObjectComponentForString__map;
    _contactObjectComponentForString__map = v12;

    id v4 = (void *)_contactObjectComponentForString__map;
  }
  id v14 = [v4 objectForKey:v3];

  return v14;
}

- (BOOL)meCardExists
{
  return self->_meCardExists;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_blocksPendingMeCard, 0);
}

@end