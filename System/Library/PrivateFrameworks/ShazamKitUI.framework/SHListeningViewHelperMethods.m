@interface SHListeningViewHelperMethods
+ (id)animationFromAnimation:(id)a3 withStartOffset:(double)a4 duration:(double)a5;
@end

@implementation SHListeningViewHelperMethods

+ (id)animationFromAnimation:(id)a3 withStartOffset:(double)a4 duration:(double)a5
{
  v11[1] = *MEMORY[0x263EF8340];
  double v6 = -a4;
  id v7 = a3;
  [v7 setBeginTime:v6];
  v8 = [MEMORY[0x263F15750] animation];
  v11[0] = v7;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];

  [v8 setAnimations:v9];
  [v8 setDuration:a5];
  return v8;
}

@end