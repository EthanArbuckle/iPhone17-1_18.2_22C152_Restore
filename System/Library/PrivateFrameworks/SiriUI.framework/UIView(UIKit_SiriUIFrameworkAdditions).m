@interface UIView(UIKit_SiriUIFrameworkAdditions)
- (void)siriui_setBlendEffectEnabled:()UIKit_SiriUIFrameworkAdditions;
@end

@implementation UIView(UIKit_SiriUIFrameworkAdditions)

- (void)siriui_setBlendEffectEnabled:()UIKit_SiriUIFrameworkAdditions
{
  v5 = [a1 layer];

  if (v5)
  {
    if (a3)
    {
      id v14 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D58]];
    }
    else
    {
      id v14 = 0;
    }
    id v6 = objc_alloc(MEMORY[0x263EFF980]);
    v7 = [a1 layer];
    v8 = objc_msgSend(v6, "initWithObjects:", v7, 0);

    if ([v8 count])
    {
      uint64_t v9 = a3 ^ 1u;
      do
      {
        v10 = [v8 objectAtIndex:0];
        [v8 removeObjectAtIndex:0];
        v11 = [v10 sublayers];
        uint64_t v12 = [v11 count];

        if (v12)
        {
          v13 = [v10 sublayers];
          [v8 addObjectsFromArray:v13];
        }
        else
        {
          [v10 setCompositingFilter:v14];
          [v10 setAllowsGroupBlending:v9];
          v13 = [v10 superlayer];
          [v13 setAllowsGroupBlending:v9];
        }
      }
      while ([v8 count]);
    }
  }
}

@end