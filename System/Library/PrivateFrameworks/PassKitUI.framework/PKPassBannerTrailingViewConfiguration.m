@interface PKPassBannerTrailingViewConfiguration
+ (id)createWithSymbolName:(id)a3;
+ (id)createWithSymbolName:(id)a3 overrideColor:(id)a4;
- (PKPassBannerTrailingViewConfiguration)init;
@end

@implementation PKPassBannerTrailingViewConfiguration

+ (id)createWithSymbolName:(id)a3
{
  return (id)[a1 createWithSymbolName:a3 overrideColor:0];
}

+ (id)createWithSymbolName:(id)a3 overrideColor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  self;
  if (!v5)
  {
    __break(1u);
    goto LABEL_7;
  }
  v7 = [PKPassBannerTrailingSymbolConfiguration alloc];
  if (!v7)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_5;
  }
  v14.receiver = v7;
  v14.super_class = (Class)PKPassBannerTrailingViewConfiguration;
  v8 = objc_msgSendSuper2(&v14, sel_init);
  v9 = v8;
  if (v8) {
    v8[1] = 0;
  }
LABEL_5:
  v10 = (void *)v9[2];
  v9[2] = v5;
  id v11 = v5;

  v12 = (void *)v9[3];
  v9[3] = v6;

  return v9;
}

- (PKPassBannerTrailingViewConfiguration)init
{
  return 0;
}

@end