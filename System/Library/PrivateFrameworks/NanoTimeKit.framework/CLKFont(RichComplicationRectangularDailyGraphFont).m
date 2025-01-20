@interface CLKFont(RichComplicationRectangularDailyGraphFont)
+ (id)alternatePunctuationRoundedSemiBoldSystemFontOfSize:()RichComplicationRectangularDailyGraphFont;
@end

@implementation CLKFont(RichComplicationRectangularDailyGraphFont)

+ (id)alternatePunctuationRoundedSemiBoldSystemFontOfSize:()RichComplicationRectangularDailyGraphFont
{
  if (alternatePunctuationRoundedSemiBoldSystemFontOfSize__onceToken != -1) {
    dispatch_once(&alternatePunctuationRoundedSemiBoldSystemFontOfSize__onceToken, &__block_literal_global_13);
  }
  v2 = (void *)alternatePunctuationRoundedSemiBoldSystemFontOfSize__cache;
  v3 = [NSNumber numberWithDouble:a1];
  v4 = [v2 objectForKey:v3];

  if (!v4)
  {
    v4 = [MEMORY[0x1E4F19A50] fontWithDescriptor:alternatePunctuationRoundedSemiBoldSystemFontOfSize__baseDescriptor size:a1];
    v5 = (void *)alternatePunctuationRoundedSemiBoldSystemFontOfSize__cache;
    v6 = [NSNumber numberWithDouble:a1];
    [v5 setObject:v4 forKey:v6];
  }
  return v4;
}

@end