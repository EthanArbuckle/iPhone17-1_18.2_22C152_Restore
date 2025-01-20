@interface CRLAXQuickSpeak
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxTargetClassName;
- (BOOL)isSpeaking;
@end

@implementation CRLAXQuickSpeak

+ (id)crlaxTargetClassName
{
  return @"AXQuickSpeak";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isSpeaking
{
  if ([+[CRLAccessibility sharedInstance] shouldFakeQuickSpeakAlwaysSpeaking])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLAXQuickSpeak;
  return [(CRLAXQuickSpeak *)&v4 isSpeaking];
}

@end