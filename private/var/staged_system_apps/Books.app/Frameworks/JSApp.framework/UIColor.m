@interface UIColor
+ (id)_colorWithHexValue:(unint64_t)a3 alpha:(double)a4;
+ (id)jsa_colorWithHexString:(id)a3 alpha:(double)a4;
@end

@implementation UIColor

+ (id)jsa_colorWithHexString:(id)a3 alpha:(double)a4
{
  if (a3)
  {
    unsigned int v9 = 0;
    v5 = +[NSScanner scannerWithString:](NSScanner, "scannerWithString:");
    v6 = +[NSCharacterSet characterSetWithCharactersInString:@"#"];
    [v5 setCharactersToBeSkipped:v6];

    [v5 scanHexInt:&v9];
    v7 = +[UIColor _colorWithHexValue:v9 alpha:a4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_colorWithHexValue:(unint64_t)a3 alpha:(double)a4
{
  return +[UIColor colorWithRed:(float)((float)BYTE2(a3) / 255.0) green:(float)((float)BYTE1(a3) / 255.0) blue:(float)((float)a3 / 255.0) alpha:a4];
}

@end