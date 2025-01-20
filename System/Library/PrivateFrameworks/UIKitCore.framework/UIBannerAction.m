@interface UIBannerAction
- (BOOL)bannerTapped;
- (BOOL)tappable;
- (UIBannerAction)initWithBannerContent:(id)a3;
- (_UIBannerContent)bannerContent;
- (id)_initWithBannerContent:(id)a3 responseHandler:(id)a4;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (int64_t)UIActionType;
@end

@implementation UIBannerAction

- (int64_t)UIActionType
{
  return 33;
}

- (UIBannerAction)initWithBannerContent:(id)a3
{
  return (UIBannerAction *)[(UIBannerAction *)self _initWithBannerContent:a3 responseHandler:0];
}

- (id)_initWithBannerContent:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v9 encodeObject:v6 forKey:@"UIBannerContentKey"];
  v10 = [v9 encodedData];
  [v8 setObject:v10 forSetting:1];

  BOOL v11 = v7 != 0;
  if (!v7) {
    id v7 = &__block_literal_global_223;
  }
  [v8 setFlag:v11 forSetting:2];
  v14.receiver = self;
  v14.super_class = (Class)UIBannerAction;
  v12 = [(UIBannerAction *)&v14 initWithInfo:v8 timeout:MEMORY[0x1E4F14428] forResponseOnQueue:v7 withHandler:0.0];

  return v12;
}

- (_UIBannerContent)bannerContent
{
  v3 = [(UIBannerAction *)self info];
  v4 = [v3 objectForSetting:1];

  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v4 error:0];
    id v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"UIBannerContentKey"];
    [v5 finishDecoding];
    id v7 = v6;
  }
  else
  {
    NSLog(&cfstr_SInvalidUibann.isa, "-[UIBannerAction bannerContent]", self);
    id v7 = 0;
  }

  return (_UIBannerContent *)v7;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  v3 = @"tappable";
  if (a3 != 2) {
    v3 = 0;
  }
  if (a3 == 1) {
    return @"contentData";
  }
  else {
    return v3;
  }
}

- (BOOL)tappable
{
  v2 = [(UIBannerAction *)self info];
  BOOL v3 = [v2 flagForSetting:2] == 1;

  return v3;
}

- (BOOL)bannerTapped
{
  int v3 = [(UIBannerAction *)self tappable];
  if (v3)
  {
    int v3 = [(UIBannerAction *)self canSendResponse];
    if (v3)
    {
      v4 = [MEMORY[0x1E4F4F678] response];
      [(UIBannerAction *)self sendResponse:v4];

      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

@end