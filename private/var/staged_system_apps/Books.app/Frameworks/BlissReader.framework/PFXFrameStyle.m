@interface PFXFrameStyle
+ (double)mapContentPaddingFromStyleProperties:(id)a3 contentState:(id)a4;
+ (double)mapRadiusFromStyleProperties:(id)a3 contentState:(id)a4;
@end

@implementation PFXFrameStyle

+ (double)mapContentPaddingFromStyleProperties:(id)a3 contentState:(id)a4
{
  id v5 = [a3 valueForProperty:"padding"];

  +[PFXStyleUtilities pointLengthInArray:v5 readerState:a4];
  return result;
}

+ (double)mapRadiusFromStyleProperties:(id)a3 contentState:(id)a4
{
  id v5 = [a3 valueForProperty:"border-radius"];

  +[PFXStyleUtilities pointLengthInArray:v5 readerState:a4];
  return result;
}

@end