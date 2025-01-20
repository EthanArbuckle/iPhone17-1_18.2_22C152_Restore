@interface UISHandleBackgroundURLSessionAction
- (BOOL)isKindOfClass:(Class)a3;
- (NSString)sessionIdentifier;
- (UISHandleBackgroundURLSessionAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (UISHandleBackgroundURLSessionAction)initWithSessionIdentifier:(id)a3;
- (UISHandleBackgroundURLSessionAction)initWithSessionIdentifier:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (int64_t)UIActionType;
@end

@implementation UISHandleBackgroundURLSessionAction

- (UISHandleBackgroundURLSessionAction)initWithSessionIdentifier:(id)a3
{
  return [(UISHandleBackgroundURLSessionAction *)self initWithSessionIdentifier:a3 timeout:0 forResponseOnQueue:0 withHandler:0.0];
}

- (UISHandleBackgroundURLSessionAction)initWithSessionIdentifier:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!v10)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"UISHandleBackgroundURLSessionAction.m", 28, @"Invalid parameter not satisfying: %@", @"sessionIdentifier" object file lineNumber description];
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F62860]);
  v14 = (void *)[v10 copy];
  [v13 setObject:v14 forSetting:1];

  if (v12)
  {
    v15 = [MEMORY[0x1E4F627D0] responderWithHandler:v12];
    v16 = v15;
    if (v15) {
      [v15 setQueue:v11];
    }
  }
  else
  {
    v16 = 0;
  }
  v20.receiver = self;
  v20.super_class = (Class)UISHandleBackgroundURLSessionAction;
  v17 = [(UISHandleBackgroundURLSessionAction *)&v20 initWithInfo:v13 responder:v16];

  return v17;
}

- (UISHandleBackgroundURLSessionAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  return -[UISHandleBackgroundURLSessionAction initWithSessionIdentifier:](self, "initWithSessionIdentifier:", 0, a5, a6, a4);
}

- (NSString)sessionIdentifier
{
  v2 = [(UISHandleBackgroundURLSessionAction *)self info];
  v3 = [v2 objectForSetting:1];

  return (NSString *)v3;
}

- (int64_t)UIActionType
{
  return 5;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1) {
    return @"sessionIdentifier";
  }
  else {
    return 0;
  }
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UISHandleBackgroundURLSessionAction;
  if (-[UISHandleBackgroundURLSessionAction isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isSubclassOfClass:objc_opt_class()];
  }
}

@end