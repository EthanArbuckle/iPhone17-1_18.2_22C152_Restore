@interface TMLNSObjectAccessibility
+ (void)makeAccessible:(id)a3 signalName:(id)a4;
- (void)accessibilityElementDidBecomeFocused;
- (void)accessibilityElementDidLoseFocus;
@end

@implementation TMLNSObjectAccessibility

+ (void)makeAccessible:(id)a3 signalName:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  if ((objc_msgSend_isEqualToString_(v5, v6, v7, @"accessibilityElementDidBecomeFocused") & 1) != 0
    || objc_msgSend_isEqualToString_(v5, v8, v9, @"accessibilityElementDidLoseFocus"))
  {
    objc_msgSend_subclassInstance_(TMLNSObjectAccessibility, v8, v9, v10);
  }
}

- (void)accessibilityElementDidBecomeFocused
{
  Superclass = (objc_class *)objc_msgSend_tmlSuperClass(self, a2, v2);
  v9.receiver = self;
  if (!Superclass)
  {
    Class = object_getClass(self);
    Superclass = class_getSuperclass(Class);
  }
  v9.super_class = Superclass;
  objc_msgSendSuper(&v9, a2);
  objc_msgSend_emitTMLSignal_withArguments_(self, v7, v8, @"accessibilityElementDidBecomeFocused", 0, v9.receiver);
}

- (void)accessibilityElementDidLoseFocus
{
  Superclass = (objc_class *)objc_msgSend_tmlSuperClass(self, a2, v2);
  v9.receiver = self;
  if (!Superclass)
  {
    Class = object_getClass(self);
    Superclass = class_getSuperclass(Class);
  }
  v9.super_class = Superclass;
  objc_msgSendSuper(&v9, a2);
  objc_msgSend_emitTMLSignal_withArguments_(self, v7, v8, @"accessibilityElementDidLoseFocus", 0, v9.receiver);
}

@end