@interface PLCaptureSessionState
+ (id)lockedWithSessionIdentifier:(id)a3;
+ (id)none;
+ (id)unknown;
+ (id)unlockedWithSessionIdentifier:(id)a3;
- (PLCaptureSessionState)init;
- (PLCaptureSessionState)initWithType:(unint64_t)a3;
- (id)description;
- (unint64_t)type;
@end

@implementation PLCaptureSessionState

- (unint64_t)type
{
  return self->_type;
}

- (id)description
{
  v2 = self;
  PFAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (PLCaptureSessionState)initWithType:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PLCaptureSessionState;
  v4 = [(PLCaptureSessionState *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v6 = v4;
  }

  return v5;
}

- (PLCaptureSessionState)init
{
  v2 = self;
  PFMethodNotImplementedException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)unknown
{
  pl_dispatch_once(&unknown_pl_once_token_16, &__block_literal_global_65);
  v2 = (void *)unknown_pl_once_object_16;
  return v2;
}

uint64_t __42__PLCaptureSessionState_Creation__unknown__block_invoke()
{
  unknown_pl_once_object_16 = objc_alloc_init(PLCaptureSessionStateUnknown);
  return MEMORY[0x1F41817F8]();
}

+ (id)unlockedWithSessionIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[PLCaptureSessionStateUnlocked alloc] initWithSessionIdentifier:v3];

  return v4;
}

+ (id)lockedWithSessionIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[PLCaptureSessionStateLocked alloc] initWithSessionIdentifier:v3];

  return v4;
}

+ (id)none
{
  pl_dispatch_once(&none_pl_once_token_15, &__block_literal_global_12445);
  v2 = (void *)none_pl_once_object_15;
  return v2;
}

uint64_t __39__PLCaptureSessionState_Creation__none__block_invoke()
{
  none_pl_once_object_15 = objc_alloc_init(PLCaptureSessionStateNone);
  return MEMORY[0x1F41817F8]();
}

@end