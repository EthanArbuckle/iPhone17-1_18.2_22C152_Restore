@interface SLDSlotTag
+ (unint64_t)cacheLimit;
- (BOOL)isValid;
- (SLDSlotTag)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)resolvedStyleForStyle:(id)a3;
- (unint64_t)authenticationMessageContextForStyle:(id)a3;
- (unint64_t)failGradeForStyle:(id)a3;
- (unint64_t)hitTestInformationMaskForStyle:(id)a3;
@end

@implementation SLDSlotTag

+ (unint64_t)cacheLimit
{
  return -1;
}

- (unint64_t)authenticationMessageContextForStyle:(id)a3
{
  return 0;
}

- (unint64_t)failGradeForStyle:(id)a3
{
  return 0;
}

- (unint64_t)hitTestInformationMaskForStyle:(id)a3
{
  return 0;
}

- (id)resolvedStyleForStyle:(id)a3
{
  v15 = (void *)MEMORY[0x1E4FB3490];
  id v3 = a3;
  uint64_t v4 = [v3 accessibilityButtonShapes];
  uint64_t v5 = [v3 accessibilityContrast];
  uint64_t v6 = [v3 displayScale];
  uint64_t v7 = [v3 layoutDirection];
  v8 = [v3 localization];
  uint64_t v9 = [v3 preferredContentSizeCategory];
  CGColorRef ConstantColor = CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E4F1DB68]);
  uint64_t v11 = [v3 userInterfaceIdiom];
  uint64_t v12 = [v3 userInterfaceStyle];

  v13 = [v15 slotStyleWithAccessibilityButtonShapes:v4 accessibilityContrast:v5 displayRange:1 displayScale:v6 layoutDirection:v7 legibilityWeight:0 localization:v8 preferredContentSizeCategory:v9 tintColor:ConstantColor userInterfaceIdiom:v11 userInterfaceStyle:v12];

  return v13;
}

- (BOOL)isValid
{
  return 1;
}

- (SLDSlotTag)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SLDSlotTag;
  return [(SLDSlotTag *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = (objc_class *)objc_opt_class();
  return objc_alloc_init(v3);
}

@end