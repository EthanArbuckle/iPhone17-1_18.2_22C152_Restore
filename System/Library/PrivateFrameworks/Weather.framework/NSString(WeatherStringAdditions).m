@interface NSString(WeatherStringAdditions)
- (double)sizeWithDegreeWithFont:()WeatherStringAdditions degreeFont:degreeOffset:;
- (void)drawAtPoint:()WeatherStringAdditions forWidth:withFont:fontColor:shadowColor:;
- (void)drawWithDegreeAtPoint:()WeatherStringAdditions font:degreeFont:degreeOffset:;
@end

@implementation NSString(WeatherStringAdditions)

- (void)drawAtPoint:()WeatherStringAdditions forWidth:withFont:fontColor:shadowColor:
{
  id v14 = a1;
  id v15 = a7;
  id v17 = a6;
  [a8 setFill];
  double v16 = a4;
  objc_msgSend(v14, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", v17, 4, a2, a3 + 1.0, v16);
  [v15 setFill];

  objc_msgSend(v14, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", v17, 4, a2, a3, v16);
}

- (void)drawWithDegreeAtPoint:()WeatherStringAdditions font:degreeFont:degreeOffset:
{
  id v21 = a8;
  id v14 = NSString;
  id v15 = a7;
  double v16 = objc_msgSend(v14, "stringWithFormat:", @"%C", (unsigned __int16)WeatherDegreeChar);
  LODWORD(v14) = IsNumberRTL();
  objc_msgSend(a1, "_legacy_sizeWithFont:", v15);
  double v18 = v17;
  objc_msgSend(v16, "_legacy_sizeWithFont:", v21);
  double v20 = v19;
  if (v14)
  {
    objc_msgSend(a1, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", v15, 2, a4 + a2 + v19, a3, v18);
  }
  else
  {
    objc_msgSend(a1, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", v15, 2, a2, a3, v18);

    a2 = a4 + a2 + v18;
  }
  objc_msgSend(v16, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", v21, 2, a2, a3 + a5, v20);
}

- (double)sizeWithDegreeWithFont:()WeatherStringAdditions degreeFont:degreeOffset:
{
  v8 = NSString;
  id v9 = a5;
  id v10 = a4;
  v11 = objc_msgSend(v8, "stringWithFormat:", @"%C", (unsigned __int16)WeatherDegreeChar);
  objc_msgSend(a1, "_legacy_sizeWithFont:", v10);
  double v13 = v12;

  objc_msgSend(v11, "_legacy_sizeWithFont:", v9);
  double v15 = v14;

  return v13 + a2 + v15;
}

@end