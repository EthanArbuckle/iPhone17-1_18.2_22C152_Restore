@interface _UIDragInteractionDefaultDriverProvider_MacCatalyst
- (id)createDefaultDriversForDragInteraction:(id)a3;
@end

@implementation _UIDragInteractionDefaultDriverProvider_MacCatalyst

- (id)createDefaultDriversForDragInteraction:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = objc_opt_new();
  v5 = [v3 setWithObject:v4];

  return v5;
}

@end