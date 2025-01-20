@interface UIOpenItemProvidersAction
- (UIOpenItemProvidersAction)initWithDragContinuationEndpoint:(id)a3;
- (UIOpenItemProvidersAction)initWithDragContinuationEndpoint:(id)a3 userInfo:(id)a4;
- (UIOpenItemProvidersAction)initWithInfo:(id)a3 responder:(id)a4;
- (id)continuationEndpoint;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)userInfo;
- (int64_t)UIActionType;
- (unint64_t)providerSource;
@end

@implementation UIOpenItemProvidersAction

- (UIOpenItemProvidersAction)initWithInfo:(id)a3 responder:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)UIOpenItemProvidersAction;
  return [(UIOpenItemProvidersAction *)&v5 initWithInfo:a3 responder:a4];
}

- (UIOpenItemProvidersAction)initWithDragContinuationEndpoint:(id)a3 userInfo:(id)a4
{
  id v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  [v9 setObject:&unk_1ED3F66F0 forSetting:1];
  [v9 setObject:v8 forSetting:2];

  if (v6) {
    [v9 setObject:v6 forSetting:3];
  }
  v12.receiver = self;
  v12.super_class = (Class)UIOpenItemProvidersAction;
  v10 = [(UIOpenItemProvidersAction *)&v12 initWithInfo:v9 responder:0];

  return v10;
}

- (UIOpenItemProvidersAction)initWithDragContinuationEndpoint:(id)a3
{
  return [(UIOpenItemProvidersAction *)self initWithDragContinuationEndpoint:a3 userInfo:0];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 0;
  }
  else {
    return off_1E5305178[a3 - 1];
  }
}

- (int64_t)UIActionType
{
  return 59;
}

- (unint64_t)providerSource
{
  v2 = [(UIOpenItemProvidersAction *)self info];
  v3 = [v2 objectForSetting:1];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (id)continuationEndpoint
{
  v2 = [(UIOpenItemProvidersAction *)self info];
  v3 = [v2 objectForSetting:2];

  return v3;
}

- (id)userInfo
{
  v2 = [(UIOpenItemProvidersAction *)self info];
  v3 = [v2 objectForSetting:3];

  return v3;
}

@end