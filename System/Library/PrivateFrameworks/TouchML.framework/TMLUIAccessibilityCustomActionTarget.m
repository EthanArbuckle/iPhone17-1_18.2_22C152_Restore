@interface TMLUIAccessibilityCustomActionTarget
- (BOOL)action:(id)a3;
@end

@implementation TMLUIAccessibilityCustomActionTarget

- (BOOL)action:(id)a3
{
  id v10 = 0;
  int v4 = objc_msgSend_emitTMLSignal_withArguments_returnValue_(a3, a2, v3, @"action", 0, &v10);
  id v5 = v10;
  v8 = v5;
  if (v4) {
    LOBYTE(v4) = objc_msgSend_BOOLValue(v5, v6, v7);
  }

  return v4;
}

@end