@interface SVXDefaultNotificationCenterRegistrar
- (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5 object:(id)a6;
- (void)removeObserver:(id)a3;
@end

@implementation SVXDefaultNotificationCenterRegistrar

- (void)removeObserver:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A00];
  id v4 = a3;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];
}

- (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5 object:(id)a6
{
  v9 = (void *)MEMORY[0x263F08A00];
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [v9 defaultCenter];
  [v13 addObserver:v12 selector:a4 name:v11 object:v10];
}

@end