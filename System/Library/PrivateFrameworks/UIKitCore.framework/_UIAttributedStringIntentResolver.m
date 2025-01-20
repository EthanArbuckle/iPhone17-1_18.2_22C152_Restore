@interface _UIAttributedStringIntentResolver
+ (id)fontAttributeValueForInlineIntent:(int64_t)a3 suggestedBaseFont:(id)a4 suggestingTheDefaultFont:(BOOL)a5;
@end

@implementation _UIAttributedStringIntentResolver

+ (id)fontAttributeValueForInlineIntent:(int64_t)a3 suggestedBaseFont:(id)a4 suggestingTheDefaultFont:(BOOL)a5
{
  char v5 = a3;
  id v6 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v8 = v6;
  v9 = v8;
  id v10 = v8;
  if (isKindOfClass)
  {
    if ((v5 & 4) != 0) {
      uint64_t v11 = v5 & 3 | 0x400u;
    }
    else {
      uint64_t v11 = v5 & 3;
    }
    if (v11)
    {
      v12 = [v8 fontDescriptor];
      v13 = [v12 fontDescriptorWithSymbolicTraits:v11];
      v14 = v13;
      if ((v5 & 4) == 0 || ([v13 symbolicTraits] & 0x400) != 0)
      {
        uint64_t v15 = [off_1E52D39B8 fontWithDescriptor:v14 size:0.0];
      }
      else
      {
        if ((v5 & 2) == 0) {
          CTFontGetWeight();
        }
        [v9 pointSize];
        uint64_t v15 = objc_msgSend(off_1E52D39B8, "monospacedSystemFontOfSize:weight:");
      }
      id v10 = (id)v15;
    }
    else
    {
      id v10 = v8;
    }
  }
  return v10;
}

@end