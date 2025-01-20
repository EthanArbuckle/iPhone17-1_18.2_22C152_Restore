@interface TSWPUserDefaults
+ (BOOL)automaticallyDetectLinks;
+ (BOOL)automaticallyDetectLists;
+ (BOOL)p_UserDefaultSet:(id)a3 force:(BOOL)a4;
+ (BOOL)spellCheckingEnabled;
+ (BOOL)superscriptNumericalSuffixes;
+ (id)invisiblesColor;
+ (void)registerUserDefaults:(BOOL)a3;
+ (void)setAutomaticallyDetectLinks:(BOOL)a3;
+ (void)setAutomaticallyDetectLists:(BOOL)a3;
+ (void)setInvisiblesColor:(id)a3;
+ (void)setSpellCheckingEnabled:(BOOL)a3;
+ (void)setSuperscriptNumericalSuffixes:(BOOL)a3;
@end

@implementation TSWPUserDefaults

+ (void)registerUserDefaults:(BOOL)a3
{
  BOOL v3 = a3;
  if ((objc_msgSend(a1, "p_UserDefaultSet:force:", @"TWSPAutomaticallyDetectLinks", a3) & 1) == 0) {
    [a1 setAutomaticallyDetectLinks:1];
  }
  if ((objc_msgSend(a1, "p_UserDefaultSet:force:", @"TWSPAutomaticallyDetectLists", v3) & 1) == 0) {
    [a1 setAutomaticallyDetectLists:1];
  }
  if ((objc_msgSend(a1, "p_UserDefaultSet:force:", @"TWSPSuperscriptNumericalSuffixes", v3) & 1) == 0) {
    [a1 setSuperscriptNumericalSuffixes:0];
  }
  if ((objc_msgSend(a1, "p_UserDefaultSet:force:", @"TSWPSpellCheckingEnabled", v3) & 1) == 0)
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"NSAllowContinuousSpellChecking"))
    {
      uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "BOOLForKey:", @"NSAllowContinuousSpellChecking");
    }
    else
    {
      uint64_t v5 = 1;
    }
    [a1 setSpellCheckingEnabled:v5];
  }
  v6 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];

  [v6 synchronize];
}

+ (BOOL)p_UserDefaultSet:(id)a3 force:(BOOL)a4
{
  return !a4 && objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", a3) != 0;
}

+ (id)invisiblesColor
{
  return (id)[MEMORY[0x263F7C808] colorWithRed:0.180392161 green:0.533333361 blue:0.921568632 alpha:1.0];
}

+ (BOOL)automaticallyDetectLinks
{
  v2 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];

  return [v2 BOOLForKey:@"TWSPAutomaticallyDetectLinks"];
}

+ (BOOL)automaticallyDetectLists
{
  v2 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];

  return [v2 BOOLForKey:@"TWSPAutomaticallyDetectLists"];
}

+ (BOOL)superscriptNumericalSuffixes
{
  v2 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];

  return [v2 BOOLForKey:@"TWSPSuperscriptNumericalSuffixes"];
}

+ (BOOL)spellCheckingEnabled
{
  v2 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];

  return [v2 BOOLForKey:@"TSWPSpellCheckingEnabled"];
}

+ (void)setInvisiblesColor:(id)a3
{
  BOOL v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"+[TSWPUserDefaults setInvisiblesColor:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPUserDefaults.m"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:137 description:@"iOS does not support setting the invisibles color"];
}

+ (void)setAutomaticallyDetectLinks:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];

  [v4 setBool:v3 forKey:@"TWSPAutomaticallyDetectLinks"];
}

+ (void)setAutomaticallyDetectLists:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];

  [v4 setBool:v3 forKey:@"TWSPAutomaticallyDetectLists"];
}

+ (void)setSuperscriptNumericalSuffixes:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];

  [v4 setBool:v3 forKey:@"TWSPSuperscriptNumericalSuffixes"];
}

+ (void)setSpellCheckingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];

  [v4 setBool:v3 forKey:@"TSWPSpellCheckingEnabled"];
}

@end