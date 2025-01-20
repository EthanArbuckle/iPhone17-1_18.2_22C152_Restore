@interface BKAccessibility
+ (BOOL)_isDisplayBacklightOff;
+ (BOOL)_objectWithinProximity;
+ (CGPoint)_displayConvertFromCAScreen:(CGPoint)a3;
+ (CGPoint)_displayConvertFromCAScreen:(CGPoint)a3 withDisplayIntegerId:(unsigned int)a4;
+ (CGPoint)_displayConvertToCAScreen:(CGPoint)a3;
+ (CGPoint)_displayConvertToCAScreen:(CGPoint)a3 withDisplayIntegerId:(unsigned int)a4;
+ (id)_authenticationMessageForLocationInCAScreenCoordinates:(CGPoint)a3 eventType:(unsigned int)a4 excludeContextIDsFromHitTest:(id)a5;
+ (id)_authenticationMessageForLocationInCAScreenCoordinates:(CGPoint)a3 eventType:(unsigned int)a4 excludeContextIDsFromHitTest:(id)a5 secureName:(unsigned int)a6;
+ (void)_accessibilityEventTapCallback;
+ (void)_accessibilityHIDEventTapCallback;
+ (void)_accessibilityProcessExternHIDEvent:(__IOHIDEvent *)a3;
+ (void)_accessibilitySetEventTapCallback:(void *)a3;
+ (void)_accessibilitySetHIDEventTapCallback:(void *)a3;
+ (void)_applyExtendedHitTestInformationForCAScreenCoordinates:(CGPoint)a3 displayUUID:(id)a4 toPathAttributes:(id)a5 secureName:(unsigned int)a6 excludeContextIDs:(id)a7;
+ (void)_setCapsLockLightOn:(BOOL)a3;
@end

@implementation BKAccessibility

+ (void)_setCapsLockLightOn:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = +[BKHIDEventProcessorRegistry sharedInstance];
  id v5 = [v4 eventProcessorOfClass:objc_opt_class()];

  [v5 setCapsLockLightOn:v3];
}

+ (BOOL)_isDisplayBacklightOff
{
  os_unfair_lock_lock(&stru_100122E80);
  float v2 = *(float *)&dword_100122E84;
  os_unfair_lock_unlock(&stru_100122E80);
  return v2 == 0.0;
}

+ (BOOL)_objectWithinProximity
{
  float v2 = +[BKHIDEventProcessorRegistry sharedInstance];
  BOOL v3 = [v2 eventProcessorOfClass:objc_opt_class()];

  LOBYTE(v2) = [v3 isObjectWithinProximity];
  return (char)v2;
}

+ (id)_authenticationMessageForLocationInCAScreenCoordinates:(CGPoint)a3 eventType:(unsigned int)a4 excludeContextIDsFromHitTest:(id)a5 secureName:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  double y = a3.y;
  double x = a3.x;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)BKSHIDEventDigitizerPathAttributes);
  [a1 _applyExtendedHitTestInformationForCAScreenCoordinates:0 displayUUID:v11 toPathAttributes:v6 secureName:v10 excludeContextIDs:x, y];

  v12 = [v11 authenticationMessage];

  return v12;
}

+ (id)_authenticationMessageForLocationInCAScreenCoordinates:(CGPoint)a3 eventType:(unsigned int)a4 excludeContextIDsFromHitTest:(id)a5
{
  return [_objc_msgSend(a1, "_authenticationMessageForLocationInCAScreenCoordinates:eventType:excludeContextIDsFromHitTest:secureName:", *(void *)&a4, a5, 0, a3.x, a3.y)];
}

+ (void)_applyExtendedHitTestInformationForCAScreenCoordinates:(CGPoint)a3 displayUUID:(id)a4 toPathAttributes:(id)a5 secureName:(unsigned int)a6 excludeContextIDs:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  double y = a3.y;
  double x = a3.x;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  v15 = +[BKHIDEventProcessorRegistry sharedInstance];
  id v16 = [v15 eventProcessorOfClass:objc_opt_class()];

  [v16 applyExtendedHitTestInformationForCAScreenCoordinates:v14 displayUUID:v13 toPathAttributes:v7 secureName:v12 excludeContextIDs:x, y];
}

+ (CGPoint)_displayConvertToCAScreen:(CGPoint)a3 withDisplayIntegerId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = +[CAWindowServer server];
  uint64_t v6 = [v5 displayWithDisplayId:v4];
  uint64_t v7 = [v6 uniqueId];
  sub_100010B54(v7);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

+ (CGPoint)_displayConvertFromCAScreen:(CGPoint)a3 withDisplayIntegerId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = +[CAWindowServer server];
  uint64_t v6 = [v5 displayWithDisplayId:v4];
  uint64_t v7 = [v6 uniqueId];
  sub_100039AD4(v7);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

+ (CGPoint)_displayConvertToCAScreen:(CGPoint)a3
{
  sub_100010B54(0);
  result.double y = v4;
  result.double x = v3;
  return result;
}

+ (CGPoint)_displayConvertFromCAScreen:(CGPoint)a3
{
  sub_100039AD4(0);
  result.double y = v4;
  result.double x = v3;
  return result;
}

+ (void)_accessibilityHIDEventTapCallback
{
  return (void *)_BKGetHIDEventTapCallback(a1, a2);
}

+ (void)_accessibilitySetHIDEventTapCallback:(void *)a3
{
}

+ (void)_accessibilityEventTapCallback
{
  return (void *)_BKGetEventTapCallback(a1, a2);
}

+ (void)_accessibilitySetEventTapCallback:(void *)a3
{
}

+ (void)_accessibilityProcessExternHIDEvent:(__IOHIDEvent *)a3
{
  id v4 = +[BKHIDSystemInterface sharedInstance];
  [v4 injectHIDEvent:a3];
}

@end