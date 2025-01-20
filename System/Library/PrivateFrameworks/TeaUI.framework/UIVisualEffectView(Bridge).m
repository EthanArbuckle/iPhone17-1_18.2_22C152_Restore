@interface UIVisualEffectView(Bridge)
- (void)ts_setGroupName:()Bridge;
@end

@implementation UIVisualEffectView(Bridge)

- (void)ts_setGroupName:()Bridge
{
  id v9 = a3;
  v4 = [a1 _groupName];

  if (!v9 || v4)
  {
    v5 = [a1 _groupName];
    if (!v9 || !v5)
    {

      goto LABEL_8;
    }
    v6 = [a1 _groupName];
    char v7 = [v6 isEqualToString:v9];

    v8 = v9;
    if (v7) {
      goto LABEL_9;
    }
  }
  [a1 _setGroupName:v9];
LABEL_8:
  v8 = v9;
LABEL_9:
}

@end