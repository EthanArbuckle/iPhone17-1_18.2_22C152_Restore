@interface SLDCollaborationAttributionViewSlotDrawer
+ (id)resolvedStyleForStyle:(id)a3 tag:(id)a4;
- (id)drawingWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5;
- (id)resolvedStyleForStyle:(id)a3 tag:(id)a4;
- (unint64_t)authenticationMessageContextForStyle:(id)a3 tag:(id)a4;
- (unint64_t)hitTestInformationMaskForStyle:(id)a3 tag:(id)a4;
@end

@implementation SLDCollaborationAttributionViewSlotDrawer

+ (id)resolvedStyleForStyle:(id)a3 tag:(id)a4
{
  v16 = (void *)MEMORY[0x1E4FB3490];
  id v4 = a3;
  uint64_t v5 = [v4 accessibilityButtonShapes];
  uint64_t v6 = [v4 accessibilityContrast];
  uint64_t v7 = [v4 displayScale];
  uint64_t v8 = [v4 layoutDirection];
  v9 = [v4 localization];
  uint64_t v10 = [v4 preferredContentSizeCategory];
  uint64_t v11 = [v4 tintColor];
  uint64_t v12 = [v4 userInterfaceIdiom];
  uint64_t v13 = [v4 userInterfaceStyle];

  v14 = [v16 slotStyleWithAccessibilityButtonShapes:v5 accessibilityContrast:v6 displayRange:1 displayScale:v7 layoutDirection:v8 legibilityWeight:0 localization:v9 preferredContentSizeCategory:v10 tintColor:v11 userInterfaceIdiom:v12 userInterfaceStyle:v13];

  return v14;
}

- (id)resolvedStyleForStyle:(id)a3 tag:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() resolvedStyleForStyle:v6 tag:v5];

  return v7;
}

- (unint64_t)authenticationMessageContextForStyle:(id)a3 tag:(id)a4
{
  return 0;
}

- (unint64_t)hitTestInformationMaskForStyle:(id)a3 tag:(id)a4
{
  return 0;
}

- (id)drawingWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [[SLDCollaborationAttributionViewDrawing alloc] initWithStyle:v8 tag:v7 forRemote:v5];

  return v9;
}

@end