@interface NTKFaceSupportUnlockAttemptEvent
- (NSDictionary)ntkfs_analyticsJSONRepresentation;
- (NSString)bundleIdentifier;
- (NSString)ntkfs_analyticsEventName;
- (NTKFaceSupportUnlockAttemptEvent)initWithLength:(double)a3 status:(unint64_t)a4 method:(unint64_t)a5 bundleIdentifier:(id)a6 unlockErrorCode:(int64_t)a7;
- (double)length;
- (int64_t)unlockErrorCode;
- (unint64_t)method;
- (unint64_t)status;
@end

@implementation NTKFaceSupportUnlockAttemptEvent

- (NTKFaceSupportUnlockAttemptEvent)initWithLength:(double)a3 status:(unint64_t)a4 method:(unint64_t)a5 bundleIdentifier:(id)a6 unlockErrorCode:(int64_t)a7
{
  id v12 = a6;
  v13 = v12;
  if (a3 > 0.0)
  {
    uint64_t v15 = [v12 length];
    v14 = 0;
    if (a5 - 5 >= 0xFFFFFFFFFFFFFFFCLL && a4 - 5 >= 0xFFFFFFFFFFFFFFFCLL && v15)
    {
      v21.receiver = self;
      v21.super_class = (Class)NTKFaceSupportUnlockAttemptEvent;
      v16 = [(NTKFaceSupportUnlockAttemptEvent *)&v21 init];
      v17 = v16;
      if (v16)
      {
        v16->_length = a3;
        v16->_status = a4;
        v16->_method = a5;
        uint64_t v18 = [v13 copy];
        bundleIdentifier = v17->_bundleIdentifier;
        v17->_bundleIdentifier = (NSString *)v18;

        v17->_unlockErrorCode = a7;
      }
      self = v17;
      v14 = self;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSString)ntkfs_analyticsEventName
{
  return (NSString *)@"com.apple.nanotimekit.facesupport.unlock_attempt";
}

- (NSDictionary)ntkfs_analyticsJSONRepresentation
{
  v16[5] = *MEMORY[0x1E4F143B8];
  [(NTKFaceSupportUnlockAttemptEvent *)self length];
  double v4 = v3;
  unint64_t v5 = [(NTKFaceSupportUnlockAttemptEvent *)self status];
  int64_t v6 = [(NTKFaceSupportUnlockAttemptEvent *)self unlockErrorCode];
  unint64_t v7 = [(NTKFaceSupportUnlockAttemptEvent *)self method];
  v8 = [(NTKFaceSupportUnlockAttemptEvent *)self bundleIdentifier];
  v15[0] = @"length";
  v9 = [NSNumber numberWithDouble:v4];
  v16[0] = v9;
  v15[1] = @"status";
  v10 = [NSNumber numberWithUnsignedInteger:v5];
  v16[1] = v10;
  v15[2] = @"unlock_error_code";
  v11 = [NSNumber numberWithInteger:v6];
  v16[2] = v11;
  v15[3] = @"method";
  id v12 = [NSNumber numberWithUnsignedInteger:v7];
  v15[4] = @"bundle_identifier";
  v16[3] = v12;
  v16[4] = v8;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:5];

  return (NSDictionary *)v13;
}

- (double)length
{
  return self->_length;
}

- (unint64_t)status
{
  return self->_status;
}

- (unint64_t)method
{
  return self->_method;
}

- (int64_t)unlockErrorCode
{
  return self->_unlockErrorCode;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
}

@end