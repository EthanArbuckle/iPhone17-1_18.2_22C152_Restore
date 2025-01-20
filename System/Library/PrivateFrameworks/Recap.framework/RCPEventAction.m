@interface RCPEventAction
+ (id)actionToSetPointerAbsoluteLocation:(CGPoint)a3 environment:(id)a4;
+ (id)actionToSetPointerCurrentAbsoluteLocation;
- (RCPEventAction)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation RCPEventAction

- (RCPEventAction)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RCPEventAction;
  return [(RCPEventAction *)&v4 init];
}

+ (id)actionToSetPointerCurrentAbsoluteLocation
{
  v3 = [MEMORY[0x1E4F4F350] sharedInstance];
  [v3 globalPointerPosition];
  double v5 = v4;
  double v7 = v6;
  v8 = +[RCPEventEnvironment currentEnvironment];
  v9 = objc_msgSend(a1, "actionToSetPointerAbsoluteLocation:environment:", v8, v5, v7);

  return v9;
}

+ (id)actionToSetPointerAbsoluteLocation:(CGPoint)a3 environment:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = a4;
  double v7 = objc_alloc_init(_RCPEventActionSetPointerLocation);
  v8 = [v6 screens];
  v9 = [v8 firstObject];

  [v9 pointSize];
  if (v10 == 0.0 || v11 == 0.0)
  {
    v18 = [NSString stringWithFormat:@"Normalization failed due to the screen width and height was unexpectedly 0 or NaN."];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[RCPEventAction actionToSetPointerAbsoluteLocation:environment:]((uint64_t)v18);
    }
    [v18 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    double v12 = x / v10;
    double v13 = y / v11;
    -[_RCPEventActionSetPointerLocation setModelPoint:](v7, "setModelPoint:", x / v10, y / v11);
    if (_CLTLogLevel >= 2)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"get model point: %g,%g -> %g,%g \n", *(void *)&x, *(void *)&y, *(void *)&v12, *(void *)&v13);
      id v14 = objc_claimAutoreleasedReturnValue();
      v15 = (const char *)[v14 UTF8String];
      v16 = (FILE **)MEMORY[0x1E4F143D8];
      fputs(v15, (FILE *)*MEMORY[0x1E4F143D8]);

      fflush(*v16);
    }

    return v7;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)MEMORY[0x1E4F28DC0];
  double v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self];
  double v5 = [v3 unarchiveObjectWithData:v4];

  return v5;
}

+ (void)actionToSetPointerAbsoluteLocation:(uint64_t)a1 environment:.cold.1(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [NSString stringWithUTF8String:"+[RCPEventAction actionToSetPointerAbsoluteLocation:environment:]"];
  int v3 = 138544130;
  double v4 = v2;
  __int16 v5 = 2114;
  id v6 = @"RCPEvent.m";
  __int16 v7 = 1024;
  int v8 = 301;
  __int16 v9 = 2114;
  uint64_t v10 = a1;
  _os_log_error_impl(&dword_1A9051000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);
}

@end