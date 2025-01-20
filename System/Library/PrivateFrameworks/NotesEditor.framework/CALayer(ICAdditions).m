@interface CALayer(ICAdditions)
- (void)ic_animateProperty:()ICAdditions toValue:fromValue:timing:;
- (void)ic_animateProperty:()ICAdditions toValue:timing:;
@end

@implementation CALayer(ICAdditions)

- (void)ic_animateProperty:()ICAdditions toValue:timing:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [a1 valueForKey:v10];
  objc_msgSend(a1, "ic_animateProperty:toValue:fromValue:timing:", v10, v9, v11, v8);
}

- (void)ic_animateProperty:()ICAdditions toValue:fromValue:timing:
{
  id v10 = (void *)MEMORY[0x263F15760];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v17 = [v10 animation];
  [v17 setKeyPath:v14];
  [v17 setFromValue:v12];

  [v17 setToValue:v13];
  [v17 setDuration:0.2];
  v15 = [MEMORY[0x263F15808] functionWithName:v11];

  [v17 setTimingFunction:v15];
  v16 = [NSString stringWithFormat:@"%@Animation", v14];
  [a1 addAnimation:v17 forKey:v16];
  [a1 setValue:v13 forKey:v14];
}

@end