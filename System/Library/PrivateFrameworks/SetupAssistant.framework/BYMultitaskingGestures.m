@interface BYMultitaskingGestures
- (BOOL)multitaskingWasCompleted;
- (BOOL)multitaskingWasTurnedOff;
- (BYMultitaskingGestures)init;
- (BYMultitaskingGestures)initWithPreferencesController:(id)a3;
- (BYPreferencesController)preferencesController;
- (void)setMultitaskingWasTurnedOff:(BOOL)a3;
- (void)setPreferencesController:(id)a3;
@end

@implementation BYMultitaskingGestures

- (BYMultitaskingGestures)init
{
  v3 = +[BYPreferencesController buddyPreferencesExcludedFromBackup];
  v4 = [(BYMultitaskingGestures *)self initWithPreferencesController:v3];

  return v4;
}

- (BYMultitaskingGestures)initWithPreferencesController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BYMultitaskingGestures;
  v6 = [(BYMultitaskingGestures *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_preferencesController, a3);
  }

  return v7;
}

- (BOOL)multitaskingWasCompleted
{
  v2 = [(BYMultitaskingGestures *)self preferencesController];
  char v3 = [v2 BOOLForKey:@"MultitaskingWasCompleted"];

  return v3;
}

- (BOOL)multitaskingWasTurnedOff
{
  v2 = [(BYMultitaskingGestures *)self preferencesController];
  char v3 = [v2 BOOLForKey:@"MultitaskingWasTurnedOff"];

  return v3;
}

- (void)setMultitaskingWasTurnedOff:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(BYMultitaskingGestures *)self preferencesController];
  [v5 setObject:MEMORY[0x1E4F1CC38] forKey:@"MultitaskingWasCompleted"];

  id v7 = [(BYMultitaskingGestures *)self preferencesController];
  v6 = [NSNumber numberWithBool:v3];
  [v7 setObject:v6 forKey:@"MultitaskingWasTurnedOff"];
}

- (BYPreferencesController)preferencesController
{
  return self->_preferencesController;
}

- (void)setPreferencesController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end