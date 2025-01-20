@interface TSAccessibilityElement
- (id)description;
- (void)accessibilityElementDidBecomeFocused;
- (void)accessibilityElementDidLoseFocus;
@end

@implementation TSAccessibilityElement

- (id)description
{
  CFStringRef v3 = (const __CFString *)[(TSAccessibilityElement *)self accessibilityValue];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(TSAccessibilityElement *)self accessibilityLabel];
  BOOL v7 = v3 == 0;
  if (v3) {
    CFStringRef v8 = @"; value = \"";
  }
  else {
    CFStringRef v8 = &stru_46D7E8;
  }
  if (!v3) {
    CFStringRef v3 = &stru_46D7E8;
  }
  if (v7) {
    CFStringRef v9 = &stru_46D7E8;
  }
  else {
    CFStringRef v9 = @"\"";
  }
  [(TSAccessibilityElement *)self accessibilityFrame];
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; label = \"%@\"%@%@%@; frame = %@>",
           v5,
           self,
           v6,
           v8,
           v3,
           v9,
           NSStringFromCGRect(v11));
}

- (void)accessibilityElementDidBecomeFocused
{
  v3.receiver = self;
  v3.super_class = (Class)TSAccessibilityElement;
  [(TSAccessibilityElement *)&v3 accessibilityElementDidBecomeFocused];
  [+[TSAccessibility sharedInstance] _setCurrentlyFocusedElement:self];
}

- (void)accessibilityElementDidLoseFocus
{
  v2.receiver = self;
  v2.super_class = (Class)TSAccessibilityElement;
  [(TSAccessibilityElement *)&v2 accessibilityElementDidLoseFocus];
  [+[TSAccessibility sharedInstance] _setCurrentlyFocusedElement:0];
}

@end