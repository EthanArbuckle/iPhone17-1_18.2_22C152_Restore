@interface _UISceneHostingViewAppearanceActionHostToClient
+ (id)_actionForActionType:(uint64_t)a1;
- (id)description;
- (void)performActionForHostedWindowScene:(id)a3;
@end

@implementation _UISceneHostingViewAppearanceActionHostToClient

+ (id)_actionForActionType:(uint64_t)a1
{
  v3 = (objc_class *)self;
  id v4 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v5 = [NSNumber numberWithInteger:a2];
  [v4 setObject:v5 forSetting:0];

  v6 = (void *)[[v3 alloc] initWithInfo:v4 responder:0];
  return v6;
}

- (void)performActionForHostedWindowScene:(id)a3
{
  id v4 = [(_UISceneHostingViewAppearanceActionHostToClient *)self info];
  v5 = [v4 objectForSetting:0];
  uint64_t v6 = [v5 unsignedIntegerValue];

  switch(v6)
  {
    case 2:
      [a3 hostViewDidDisappear];
      break;
    case 1:
      [a3 hostViewWillDisappear];
      break;
    case 0:
      [a3 hostViewWillAppear];
      break;
  }
}

- (id)description
{
  v3 = [(_UISceneHostingViewAppearanceActionHostToClient *)self info];
  id v4 = [v3 objectForSetting:0];
  unint64_t v5 = [v4 unsignedIntegerValue];

  uint64_t v6 = 0;
  if (v5 <= 2) {
    uint64_t v6 = off_1E530F968[v5];
  }
  v7 = NSString;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = [v7 stringWithFormat:@"<%@;%p> Action type: %@", v9, self, v6];

  return v10;
}

@end