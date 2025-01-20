@interface ICTextViewAccessibility
+ (id)icaxEmphasisStyleNameFromAttributes:(id)a3;
@end

@implementation ICTextViewAccessibility

+ (id)icaxEmphasisStyleNameFromAttributes:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F5AB10]];

  if (v4)
  {
    v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F815A8]];
    ICEmphasisColorTypeForNSTextHighlightColorScheme();

    v6 = NSStringForEmphasisColorType();
    if ([v6 length])
    {
      v7 = [MEMORY[0x263F5AE80] localizedFrameworkStringForKey:@"Emphasis %@" value:@"Emphasis %@" table:0 allowSiri:1];
      v8 = objc_msgSend(NSString, "localizedStringWithFormat:", v7, v6);
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end