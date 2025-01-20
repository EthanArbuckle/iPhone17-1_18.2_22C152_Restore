@interface CRLMovieItemAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxTargetClassName;
- (BOOL)crlaxIsAudioOnly;
- (NSString)crlaxDurationDescription;
- (double)crlaxDuration;
- (id)crlaxTypeDescription;
@end

@implementation CRLMovieItemAccessibility

+ (id)crlaxTargetClassName
{
  return @"Freeform.CRLMovieItem";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)crlaxIsAudioOnly
{
  v2 = [(CRLMovieItemAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isAudioOnly];

  return v3;
}

- (double)crlaxDuration
{
  unsigned __int8 v3 = [(CRLMovieItemAccessibility *)self crlaxTarget];
  [v3 endTime];
  double v5 = v4;
  v6 = [(CRLMovieItemAccessibility *)self crlaxTarget];
  [v6 startTime];
  double v8 = v5 - v7;

  return v8;
}

- (NSString)crlaxDurationDescription
{
  [(CRLMovieItemAccessibility *)self crlaxDuration];

  return (NSString *)CRLAccessibilityStringForTimeInterval(1, v2);
}

- (id)crlaxTypeDescription
{
  unsigned int v2 = [(CRLMovieItemAccessibility *)self crlaxIsAudioOnly];
  unsigned __int8 v3 = +[NSBundle mainBundle];
  double v4 = v3;
  if (v2) {
    CFStringRef v5 = @"Audio";
  }
  else {
    CFStringRef v5 = @"Movie";
  }
  v6 = [v3 localizedStringForKey:v5 value:0 table:0];

  return v6;
}

@end