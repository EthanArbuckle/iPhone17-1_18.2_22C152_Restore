@interface UITabBar
+ (void)load;
- (CGSize)xxx_sizeThatFits:(CGSize)a3;
@end

@implementation UITabBar

+ (void)load
{
  id v4 = +[UIDevice currentDevice];
  if ([v4 userInterfaceIdiom])
  {
  }
  else
  {
    unsigned int v3 = +[UIDevice _hasHomeButton];

    if (v3)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000E2A4;
      block[3] = &unk_100485200;
      block[4] = a1;
      if (qword_1004D3F20[0] != -1) {
        dispatch_once(qword_1004D3F20, block);
      }
    }
  }
}

- (CGSize)xxx_sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = +[UIDevice currentDevice];
  v7 = (char *)[v6 orientation];

  if ((unint64_t)(v7 - 3) > 1)
  {
    -[UITabBar xxx_sizeThatFits:](self, "xxx_sizeThatFits:", width, height);
    double width = v9;
  }
  else
  {
    double v8 = 49.0;
  }
  double v10 = width;
  result.double height = v8;
  result.double width = v10;
  return result;
}

@end