@interface SiriUIFontScalingUtilities
+ (double)labelLeadingForCurrentScale;
+ (id)_paragraphStyleWithLeading:(double)a3 textAlignemtn:(int64_t)a4;
+ (id)paragraphStyleForCurrentScaleWithTextAlignment:(int64_t)a3;
+ (id)tallParagraphStyleForCurrentScaleWithTextAlignment:(int64_t)a3;
@end

@implementation SiriUIFontScalingUtilities

+ (double)labelLeadingForCurrentScale
{
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  v3 = [v2 preferredContentSizeCategory];

  if ([v3 isEqualToString:*MEMORY[0x263F1D178]])
  {
    double v4 = 21.5;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F1D198]])
  {
    double v4 = 22.5;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F1D188]])
  {
    double v4 = 23.5;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F1D180]])
  {
    double v4 = 24.5;
  }
  else
  {
    double v4 = 26.0;
    if (([v3 isEqualToString:*MEMORY[0x263F1D170]] & 1) == 0)
    {
      if ([v3 isEqualToString:*MEMORY[0x263F1D168]])
      {
        double v4 = 26.5;
      }
      else if ([v3 isEqualToString:*MEMORY[0x263F1D160]])
      {
        double v4 = 27.5;
      }
      else
      {
        v5 = objc_msgSend(MEMORY[0x263F1C658], "siriui_serverUtteranceFont");
        [v5 _scaledValueForValue:49.0];
        double v7 = round(v6);

        double v4 = v7 * 0.5;
      }
    }
  }

  return v4;
}

+ (id)paragraphStyleForCurrentScaleWithTextAlignment:(int64_t)a3
{
  +[SiriUIFontScalingUtilities labelLeadingForCurrentScale];
  return (id)objc_msgSend(a1, "_paragraphStyleWithLeading:textAlignemtn:", a3);
}

+ (id)tallParagraphStyleForCurrentScaleWithTextAlignment:(int64_t)a3
{
  +[SiriUIFontScalingUtilities labelLeadingForCurrentScale];
  double v6 = ceil(v5 * 1.2);
  return (id)[a1 _paragraphStyleWithLeading:a3 textAlignemtn:v6];
}

+ (id)_paragraphStyleWithLeading:(double)a3 textAlignemtn:(int64_t)a4
{
  id v6 = objc_alloc_init(MEMORY[0x263F1C350]);
  [v6 setMinimumLineHeight:a3];
  [v6 setMaximumLineHeight:a3];
  [v6 setLineBreakMode:0];
  LODWORD(v7) = 1036831949;
  [v6 setHyphenationFactor:v7];
  [v6 setAlignment:a4];
  return v6;
}

@end