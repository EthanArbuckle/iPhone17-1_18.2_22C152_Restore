@interface SBAnalyticsAggdSimpleEventHandler
+ (id)latchForEvent:(unint64_t)a3 aggdKey:(id)a4;
+ (id)monotonicallyIncreasingForEvent:(unint64_t)a3 aggdKey:(id)a4;
+ (id)setScalarForEvent:(unint64_t)a3 aggdKey:(id)a4 valueBlock:(id)a5;
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
- (SBAnalyticsAggdSimpleEventHandler)initWithEvent:(unint64_t)a3 emitBlock:(id)a4;
@end

@implementation SBAnalyticsAggdSimpleEventHandler

+ (id)latchForEvent:(unint64_t)a3 aggdKey:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)objc_opt_class());
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__SBAnalyticsAggdSimpleEventHandler_latchForEvent_aggdKey___block_invoke;
  v10[3] = &unk_1E6B09490;
  id v11 = v5;
  id v7 = v5;
  v8 = (void *)[v6 initWithEvent:a3 emitBlock:v10];

  return v8;
}

void __59__SBAnalyticsAggdSimpleEventHandler_latchForEvent_aggdKey___block_invoke(uint64_t a1)
{
  id v2 = +[SBAnalyticsAggdInterface sharedInstance];
  [v2 setValue:1 forScalarKey:*(void *)(a1 + 32)];
}

+ (id)monotonicallyIncreasingForEvent:(unint64_t)a3 aggdKey:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)objc_opt_class());
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__SBAnalyticsAggdSimpleEventHandler_monotonicallyIncreasingForEvent_aggdKey___block_invoke;
  v10[3] = &unk_1E6B09490;
  id v11 = v5;
  id v7 = v5;
  v8 = (void *)[v6 initWithEvent:a3 emitBlock:v10];

  return v8;
}

void __77__SBAnalyticsAggdSimpleEventHandler_monotonicallyIncreasingForEvent_aggdKey___block_invoke(uint64_t a1)
{
  id v2 = +[SBAnalyticsAggdInterface sharedInstance];
  [v2 addValue:1 forScalarKey:*(void *)(a1 + 32)];
}

+ (id)setScalarForEvent:(unint64_t)a3 aggdKey:(id)a4 valueBlock:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc((Class)objc_opt_class());
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__SBAnalyticsAggdSimpleEventHandler_setScalarForEvent_aggdKey_valueBlock___block_invoke;
  v14[3] = &unk_1E6B094B8;
  id v15 = v7;
  id v16 = v8;
  id v10 = v7;
  id v11 = v8;
  v12 = (void *)[v9 initWithEvent:a3 emitBlock:v14];

  return v12;
}

void __74__SBAnalyticsAggdSimpleEventHandler_setScalarForEvent_aggdKey_valueBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  id v3 = +[SBAnalyticsAggdInterface sharedInstance];
  [v3 setValue:v2 forScalarKey:*(void *)(a1 + 32)];
}

- (SBAnalyticsAggdSimpleEventHandler)initWithEvent:(unint64_t)a3 emitBlock:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBAnalyticsAggdSimpleEventHandler;
  id v7 = [(SBAnalyticsAggdSimpleEventHandler *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    v7->_eventType = a3;
    uint64_t v9 = [v6 copy];
    id emitBlock = v8->_emitBlock;
    v8->_id emitBlock = (id)v9;
  }
  return v8;
}

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  unint64_t eventType = self->_eventType;
  if (eventType == a3) {
    (*((void (**)(void))self->_emitBlock + 2))();
  }
  return eventType == a3;
}

- (void).cxx_destruct
{
}

@end