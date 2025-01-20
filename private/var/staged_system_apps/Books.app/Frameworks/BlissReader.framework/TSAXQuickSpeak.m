@interface TSAXQuickSpeak
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isSpeaking;
@end

@implementation TSAXQuickSpeak

+ (id)tsaxTargetClassName
{
  return @"AXQuickSpeak";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isSpeaking
{
  if ([+[TSAccessibility sharedInstance] shouldFakeQuickSpeakAlwaysSpeaking])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSAXQuickSpeak;
  return [(TSAXQuickSpeak *)&v4 isSpeaking];
}

@end