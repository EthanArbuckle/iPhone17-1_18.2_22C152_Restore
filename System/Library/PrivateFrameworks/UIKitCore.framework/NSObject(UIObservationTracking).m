@interface NSObject(UIObservationTracking)
- (id)_ui_observationTrackingDictionary;
- (void)_ui_setObservationTrackingDictionary:()UIObservationTracking;
@end

@implementation NSObject(UIObservationTracking)

- (void)_ui_setObservationTrackingDictionary:()UIObservationTracking
{
}

- (id)_ui_observationTrackingDictionary
{
  return objc_getAssociatedObject(a1, &_UIObservationTrackingDictionaryKey);
}

@end