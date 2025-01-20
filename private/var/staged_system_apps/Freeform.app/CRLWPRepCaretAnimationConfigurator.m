@interface CRLWPRepCaretAnimationConfigurator
+ (BOOL)caretShouldFade;
+ (double)animationCycleForHide:(BOOL)a3;
+ (double)animationDurationForHide:(BOOL)a3;
+ (void)initialize;
@end

@implementation CRLWPRepCaretAnimationConfigurator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if (*(double *)&qword_10166E988 < -99999.0)
    {
      v2 = +[NSUserDefaults standardUserDefaults];
      id v3 = [v2 integerForKey:@"NSTextInsertionPointBlinkPeriod"];

      if (v3) {
        double v4 = (double)(uint64_t)v3 / 1000.0;
      }
      else {
        double v4 = 0.56;
      }
      qword_10166E988 = *(void *)&v4;
    }
    if (*(double *)&qword_10166E990 < -99999.0)
    {
      v5 = +[NSUserDefaults standardUserDefaults];
      id v6 = [v5 integerForKey:@"NSTextInsertionPointBlinkPeriodOn"];

      if (v6) {
        double v7 = (double)(uint64_t)v6 / 1000.0;
      }
      else {
        double v7 = 0.5;
      }
      qword_10166E990 = *(void *)&v7;
    }
    if (*(double *)&qword_10166E998 < -99999.0)
    {
      v8 = +[NSUserDefaults standardUserDefaults];
      id v9 = [v8 integerForKey:@"NSTextInsertionPointBlinkPeriodOff"];

      if (v9) {
        double v10 = (double)(uint64_t)v9 / 1000.0;
      }
      else {
        double v10 = 0.5;
      }
      qword_10166E998 = *(void *)&v10;
    }
  }
}

+ (BOOL)caretShouldFade
{
  return 1;
}

+ (double)animationDurationForHide:(BOOL)a3
{
  double result = 0.15;
  if (a3) {
    return 0.25;
  }
  return result;
}

+ (double)animationCycleForHide:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v4 = [a1 caretShouldFade];
  v5 = &qword_10166E998;
  if (!v3) {
    v5 = &qword_10166E990;
  }
  if (!v4) {
    v5 = &qword_10166E988;
  }
  return *(double *)v5;
}

@end