@interface CRLAccessibilityElement
- (CRLAccessibilityElement)initWithAccessibilityParent:(id)a3;
- (id)description;
@end

@implementation CRLAccessibilityElement

- (CRLAccessibilityElement)initWithAccessibilityParent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLAccessibilityElement;
  return [(CRLAccessibilityElement *)&v4 initWithAccessibilityContainer:a3];
}

- (id)description
{
  v3 = [(CRLAccessibilityElement *)self accessibilityValue];
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(CRLAccessibilityElement *)self accessibilityLabel];
  if (v3) {
    CFStringRef v7 = @"; value = \"";
  }
  else {
    CFStringRef v7 = &stru_101538650;
  }
  if (v3) {
    CFStringRef v8 = v3;
  }
  else {
    CFStringRef v8 = &stru_101538650;
  }
  if (v3) {
    CFStringRef v9 = @"\"";
  }
  else {
    CFStringRef v9 = &stru_101538650;
  }
  [(CRLAccessibilityElement *)self accessibilityFrame];
  v10 = NSStringFromCGRect(v14);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; label = \"%@\"%@%@%@; frame = %@>",
    v5,
    self,
    v6,
    v7,
    v8,
    v9,
  v11 = v10);

  return v11;
}

@end