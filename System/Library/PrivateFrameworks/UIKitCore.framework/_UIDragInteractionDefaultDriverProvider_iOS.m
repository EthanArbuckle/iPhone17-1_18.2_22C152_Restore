@interface _UIDragInteractionDefaultDriverProvider_iOS
- (id)createDefaultDriversForDragInteraction:(id)a3;
@end

@implementation _UIDragInteractionDefaultDriverProvider_iOS

- (id)createDefaultDriversForDragInteraction:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  [v4 addObject:v5];

  LODWORD(v5) = [v3 _allowsPointerDragBeforeLiftDelay];
  if (v5) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  v7 = [[_UIDragInteractionLongPressDriver alloc] initWithBehavior:v6];
  [v4 addObject:v7];

  v8 = (void *)[v4 copy];
  return v8;
}

@end