@interface PMMPredictionNotification
+ (void)postPredictionUpdate:(id)a3 consumer:(unint64_t)a4;
- (PMMPredictionNotification)initWithPredictionUpdateListener:(id)a3;
- (void)dealloc;
@end

@implementation PMMPredictionNotification

- (PMMPredictionNotification)initWithPredictionUpdateListener:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PMMPredictionNotification;
  v5 = [(PMMPredictionNotification *)&v12 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F08A00] defaultCenter];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __62__PMMPredictionNotification_initWithPredictionUpdateListener___block_invoke;
    v10[3] = &unk_2646DF9C8;
    id v11 = v4;
    uint64_t v7 = [v6 addObserverForName:@"com.apple.proactive.ProactiveMagicalMoments.PMMPredictionNotification.updatePredictions" object:0 queue:0 usingBlock:v10];
    id notificationToken = v5->_notificationToken;
    v5->_id notificationToken = (id)v7;
  }
  return v5;
}

void __62__PMMPredictionNotification_initWithPredictionUpdateListener___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 userInfo];
  id v7 = [v4 objectForKeyedSubscript:@"predictions"];

  v5 = [v3 userInfo];

  v6 = [v5 objectForKeyedSubscript:@"consumer"];
  [v6 unsignedIntegerValue];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->_notificationToken];

  v4.receiver = self;
  v4.super_class = (Class)PMMPredictionNotification;
  [(PMMPredictionNotification *)&v4 dealloc];
}

+ (void)postPredictionUpdate:(id)a3 consumer:(unint64_t)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v10 = @"consumer";
  v6 = [NSNumber numberWithUnsignedInteger:a4];
  v11[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = (void *)[v7 mutableCopy];

  if (v5) {
    [v8 setObject:v5 forKeyedSubscript:@"predictions"];
  }
  v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 postNotificationName:@"com.apple.proactive.ProactiveMagicalMoments.PMMPredictionNotification.updatePredictions" object:0 userInfo:v8];
}

- (void).cxx_destruct
{
}

@end