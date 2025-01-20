@interface NTKFaceSupportPartialUnlockAttemptEvent
- (NSDate)creationDate;
- (NSString)identifier;
- (NTKFaceSupportPartialUnlockAttemptEvent)initWithIdentifier:(id)a3 method:(unint64_t)a4;
- (id)unlockAttemptWithStatus:(unint64_t)a3 errorCode:(int64_t)a4;
- (unint64_t)method;
@end

@implementation NTKFaceSupportPartialUnlockAttemptEvent

- (NTKFaceSupportPartialUnlockAttemptEvent)initWithIdentifier:(id)a3 method:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 length];
  v8 = 0;
  if (a4 != 999999 && v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)NTKFaceSupportPartialUnlockAttemptEvent;
    v9 = [(NTKFaceSupportPartialUnlockAttemptEvent *)&v15 init];
    if (v9)
    {
      uint64_t v10 = [v6 copy];
      identifier = v9->_identifier;
      v9->_identifier = (NSString *)v10;

      v9->_method = a4;
      uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
      creationDate = v9->_creationDate;
      v9->_creationDate = (NSDate *)v12;
    }
    self = v9;
    v8 = self;
  }

  return v8;
}

- (id)unlockAttemptWithStatus:(unint64_t)a3 errorCode:(int64_t)a4
{
  if (a3 == 888888)
  {
    v4 = 0;
  }
  else
  {
    v8 = [MEMORY[0x1E4F1C9C8] date];
    v9 = [(NTKFaceSupportPartialUnlockAttemptEvent *)self creationDate];
    [v8 timeIntervalSinceDate:v9];
    double v11 = v10;

    unint64_t v12 = [(NTKFaceSupportPartialUnlockAttemptEvent *)self method];
    v13 = [(NTKFaceSupportPartialUnlockAttemptEvent *)self identifier];
    v4 = [[NTKFaceSupportUnlockAttemptEvent alloc] initWithLength:a3 status:v12 method:v13 bundleIdentifier:a4 unlockErrorCode:v11];
  }

  return v4;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)method
{
  return self->_method;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end