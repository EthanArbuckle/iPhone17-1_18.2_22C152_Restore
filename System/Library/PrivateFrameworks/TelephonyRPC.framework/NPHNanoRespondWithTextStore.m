@interface NPHNanoRespondWithTextStore
- (NPHNanoRespondWithTextStore)init;
- (id)cannedRepliesForLanguage:(id)a3;
- (id)customReplies;
- (id)defaultRepliesForLanguage:(id)a3;
- (unint64_t)count;
@end

@implementation NPHNanoRespondWithTextStore

- (NPHNanoRespondWithTextStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)NPHNanoRespondWithTextStore;
  v2 = [(NPHNanoRespondWithTextStore *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilephone"];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;
  }
  return v2;
}

- (unint64_t)count
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = nph_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[NPHNanoRespondWithTextStore count]";
    _os_log_impl(&dword_234652000, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  return 3;
}

- (id)defaultRepliesForLanguage:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[NPHNanoRespondWithTextStore defaultRepliesForLanguage:]";
    _os_log_impl(&dword_234652000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  int v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"Sorry, I can’t talk right now.", &stru_26E767F58, 0 value table];
  v12[0] = v5;
  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"I’m on my way." value:&stru_26E767F58 table:0];
  v12[1] = v7;
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"Can I call you later?" value:&stru_26E767F58 table:0];
  v12[2] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:3];

  return v10;
}

- (id)customReplies
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    v10 = "-[NPHNanoRespondWithTextStore customReplies]";
    _os_log_impl(&dword_234652000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  int v4 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"TUReplyWithMessageStoreReplyArray"];
  if (!v4)
  {
    int v4 = [MEMORY[0x263EFF980] array];
  }
  unint64_t v5 = [v4 count];
  if (v5 < [(NPHNanoRespondWithTextStore *)self count])
  {
    do
    {
      [v4 addObject:&stru_26E767F58];
      unint64_t v6 = [v4 count];
    }
    while (v6 < [(NPHNanoRespondWithTextStore *)self count]);
  }
  v7 = [MEMORY[0x263EFF8C0] arrayWithArray:v4];

  return v7;
}

- (id)cannedRepliesForLanguage:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[NPHNanoRespondWithTextStore cannedRepliesForLanguage:]";
    _os_log_impl(&dword_234652000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  unint64_t v6 = (void *)MEMORY[0x263EFF980];
  v7 = [(NPHNanoRespondWithTextStore *)self defaultRepliesForLanguage:v4];

  v8 = [v6 arrayWithArray:v7];

  int v9 = [(NPHNanoRespondWithTextStore *)self customReplies];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__NPHNanoRespondWithTextStore_cannedRepliesForLanguage___block_invoke;
  v13[3] = &unk_264BF5D90;
  id v14 = v8;
  id v10 = v8;
  [v9 enumerateObjectsUsingBlock:v13];
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithArray:v10];

  return v11;
}

void __56__NPHNanoRespondWithTextStore_cannedRepliesForLanguage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (([v5 isEqualToString:&stru_26E767F58] & 1) == 0) {
    [*(id *)(a1 + 32) replaceObjectAtIndex:a3 withObject:v5];
  }
}

- (void).cxx_destruct
{
}

@end