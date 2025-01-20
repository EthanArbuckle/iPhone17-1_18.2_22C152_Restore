@interface STKClass0SMSAlertSession
+ (BOOL)_requiresResponseProvider;
- (STKClass0SMSAlertSession)initWithLogger:(id)a3 responseProvider:(id)a4 options:(id)a5 sound:(id)a6;
- (STKClass0SMSAlertSession)initWithLogger:(id)a3 responseProvider:(id)a4 options:(id)a5 sound:(id)a6 slot:(int64_t)a7;
- (int64_t)slot;
@end

@implementation STKClass0SMSAlertSession

- (STKClass0SMSAlertSession)initWithLogger:(id)a3 responseProvider:(id)a4 options:(id)a5 sound:(id)a6
{
  v11 = (void *)MEMORY[0x263F08690];
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [v11 currentHandler];
  [v16 handleFailureInMethod:a2 object:self file:@"STKAlertSession.m" lineNumber:365 description:@"Initializer is unavailable"];

  v17 = [(STKClass0SMSAlertSession *)self initWithLogger:v15 responseProvider:v14 options:v13 sound:v12 slot:1];
  return v17;
}

- (STKClass0SMSAlertSession)initWithLogger:(id)a3 responseProvider:(id)a4 options:(id)a5 sound:(id)a6 slot:(int64_t)a7
{
  v9.receiver = self;
  v9.super_class = (Class)STKClass0SMSAlertSession;
  result = [(STKAlertSession *)&v9 initWithLogger:a3 responseProvider:a4 options:a5 sound:a6];
  if (result) {
    result->_slot = a7;
  }
  return result;
}

+ (BOOL)_requiresResponseProvider
{
  return 0;
}

- (int64_t)slot
{
  return self->_slot;
}

@end