@interface PBFGenericDisplayContext
+ (id)displayContextForDisplayConfiguration:(id)a3;
+ (id)displayContextForDisplayIdentifier:(id)a3;
+ (id)displayContextForPersistenceIdentifier:(id)a3;
+ (id)displayContextForScreen:(id)a3;
+ (id)displayContextForScreen:(id)a3 traitCollection:(id)a4;
+ (id)genericDisplayContextWithDisplayContext:(id)a3;
+ (id)mainScreen;
+ (id)mainScreenDisplayContextsForKnownOrientations;
- (BOOL)geometryIsEqualTo:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDisplayContext:(id)a3;
- (CGRect)pbf_frame;
- (CGRect)pbf_referenceBounds;
- (NSString)description;
- (NSString)pbf_displayContextPersistenceIdentifier;
- (PBFGenericDisplayContext)displayContextWithUpdatedAccessibilityContrast:(int64_t)a3;
- (PBFGenericDisplayContext)displayContextWithUpdatedInterfaceOrientation:(int64_t)a3;
- (PBFGenericDisplayContext)displayContextWithUpdatedSignificantEventsCounter:(unint64_t)a3;
- (PBFGenericDisplayContext)displayContextWithUpdatedUserInterfaceStyle:(int64_t)a3;
- (PBFGenericDisplayContext)initWithBounds:(CGRect)a3 scale:(double)a4 interfaceOrientation:(int64_t)a5 sigEventsCounter:(unint64_t)a6 userInterfaceStyle:(int64_t)a7 accessibilityContrast:(int64_t)a8;
- (double)pbf_scale;
- (int64_t)pbf_accessibilityContrast;
- (int64_t)pbf_interfaceOrientation;
- (int64_t)pbf_userInterfaceStyle;
- (unint64_t)hash;
- (unint64_t)pbf_significantEventsCounter;
@end

@implementation PBFGenericDisplayContext

+ (id)mainScreen
{
  v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  v4 = [a1 displayContextForScreen:v3];

  v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  v6 = [v5 keyWindow];
  unint64_t v7 = [v6 _windowInterfaceOrientation];

  if (v7 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }
  v9 = [v4 displayContextWithUpdatedInterfaceOrientation:v8];

  return v9;
}

+ (id)mainScreenDisplayContextsForKnownOrientations
{
  v2 = [a1 mainScreen];
  v3 = objc_opt_new();
  uint64_t v4 = PBFBSInterfaceOrientationDefaultForCurrentDeviceClass();
  v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  v6 = [v5 keyWindow];
  uint64_t v7 = [v6 _windowInterfaceOrientation];

  if (v4)
  {
    uint64_t v8 = [v2 displayContextWithUpdatedInterfaceOrientation:v4];
    [v3 addObject:v8];
  }
  if (v7) {
    BOOL v9 = v7 == v4;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    v10 = [v2 displayContextWithUpdatedInterfaceOrientation:v4];
    [v3 addObject:v10];
  }
  return v3;
}

+ (id)displayContextForScreen:(id)a3
{
  uint64_t v4 = [a3 displayConfiguration];
  v5 = [a1 displayContextForDisplayConfiguration:v4];

  return v5;
}

+ (id)displayContextForScreen:(id)a3 traitCollection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, a1, @"PBFDisplayContext.m", 59, @"Invalid parameter not satisfying: %@", @"screen" object file lineNumber description];

  if (!v9)
  {
LABEL_3:
    BOOL v9 = [v7 traitCollection];
  }
LABEL_4:
  uint64_t v10 = PBFBSInterfaceOrientationDefaultForCurrentDeviceClass();
  id v11 = objc_allocWithZone((Class)a1);
  [v7 _referenceBounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [v7 scale];
  double v21 = v20;
  unint64_t v22 = PBFUserInterfaceStyleFromUIUserInterfaceStyle([v9 userInterfaceStyle]);
  v23 = objc_msgSend(v11, "initWithBounds:scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:", v10, 0, v22, PBFAccessibilityContrastFromUIAccessibilityContrast(objc_msgSend(v9, "accessibilityContrast")), v13, v15, v17, v19, v21);

  return v23;
}

+ (id)displayContextForDisplayIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"PBFDisplayContext.m", 69, @"Invalid parameter not satisfying: %@", @"displayIdentity" object file lineNumber description];
  }
  if (displayContextForDisplayIdentifier__onceToken != -1) {
    dispatch_once(&displayContextForDisplayIdentifier__onceToken, &__block_literal_global_32);
  }
  v6 = [(id)displayContextForDisplayIdentifier__monitor configurationForIdentity:v5];
  id v7 = [a1 displayContextForDisplayConfiguration:v6];

  return v7;
}

void __63__PBFGenericDisplayContext_displayContextForDisplayIdentifier___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F62970]);
  v1 = (void *)displayContextForDisplayIdentifier__monitor;
  displayContextForDisplayIdentifier__monitor = (uint64_t)v0;
}

+ (id)displayContextForDisplayConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"PBFDisplayContext.m", 79, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }
  v6 = (void *)MEMORY[0x1E4FB1BA8];
  id v7 = [v5 identity];
  id v8 = [v6 _screenWithFBSDisplayIdentity:v7];

  uint64_t v9 = PBFBSInterfaceOrientationDefaultForCurrentDeviceClass();
  uint64_t v10 = [v8 traitCollection];
  id v11 = objc_allocWithZone((Class)a1);
  [v5 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [v5 scale];
  double v21 = v20;
  unint64_t v22 = PBFUserInterfaceStyleFromUIUserInterfaceStyle([v10 userInterfaceStyle]);
  v23 = objc_msgSend(v11, "initWithBounds:scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:", v9, 0, v22, PBFAccessibilityContrastFromUIAccessibilityContrast(objc_msgSend(v10, "accessibilityContrast")), v13, v15, v17, v19, v21);

  return v23;
}

+ (id)displayContextForPersistenceIdentifier:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (displayContextForPersistenceIdentifier__onceToken != -1) {
    dispatch_once(&displayContextForPersistenceIdentifier__onceToken, &__block_literal_global_19_0);
  }
  v29 = v4;
  id v5 = objc_msgSend(v4, "componentsSeparatedByString:", @"]-", a1);
  double x = *MEMORY[0x1E4F1DB28];
  double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v10 = PBFBSInterfaceOrientationDefaultForCurrentDeviceClass();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v12)
  {
    uint64_t v14 = 0;
    double v16 = 0.0;
    uint64_t v30 = 0;
    uint64_t v31 = -1;
    goto LABEL_26;
  }
  uint64_t v13 = v12;
  uint64_t v14 = 0;
  uint64_t v15 = *(void *)v33;
  uint64_t v30 = 0;
  uint64_t v31 = -1;
  double v16 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v33 != v15) {
        objc_enumerationMutation(v11);
      }
      double v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      if ([v18 hasPrefix:@"b"])
      {
        double v19 = [v18 substringFromIndex:1];
        CGRect v39 = CGRectFromString(v19);
        double x = v39.origin.x;
        double y = v39.origin.y;
        double width = v39.size.width;
        double height = v39.size.height;
      }
      else
      {
        if ([v18 hasPrefix:@"s"])
        {
          double v20 = (void *)displayContextForPersistenceIdentifier__numberFormatter;
          double v19 = [v18 substringFromIndex:1];
          double v21 = [v20 numberFromString:v19];
          [v21 doubleValue];
          double v16 = v22;
        }
        else if ([v18 hasPrefix:@"o"])
        {
          v23 = (void *)displayContextForPersistenceIdentifier__numberFormatter;
          double v19 = [v18 substringFromIndex:1];
          double v21 = [v23 numberFromString:v19];
          uint64_t v10 = [v21 unsignedIntegerValue];
        }
        else if ([v18 hasPrefix:@"ui"])
        {
          v24 = (void *)displayContextForPersistenceIdentifier__numberFormatter;
          double v19 = [v18 substringFromIndex:2];
          double v21 = [v24 numberFromString:v19];
          uint64_t v14 = [v21 unsignedIntegerValue];
        }
        else if ([v18 hasPrefix:@"ax"])
        {
          v25 = (void *)displayContextForPersistenceIdentifier__numberFormatter;
          double v19 = [v18 substringFromIndex:2];
          double v21 = [v25 numberFromString:v19];
          uint64_t v31 = [v21 unsignedIntegerValue];
        }
        else
        {
          if (![v18 hasPrefix:@"s"]) {
            continue;
          }
          v26 = (void *)displayContextForPersistenceIdentifier__numberFormatter;
          double v19 = [v18 substringFromIndex:1];
          double v21 = [v26 numberFromString:v19];
          uint64_t v30 = [v21 unsignedIntegerValue];
        }
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
  }
  while (v13);
LABEL_26:

  v27 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBounds:scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:", v10, v30, v14, v31, x, y, width, height, v16);
  return v27;
}

void __67__PBFGenericDisplayContext_displayContextForPersistenceIdentifier___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)displayContextForPersistenceIdentifier__numberFormatter;
  displayContextForPersistenceIdentifier__numberFormatter = (uint64_t)v0;

  v2 = (void *)displayContextForPersistenceIdentifier__numberFormatter;
  id v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];
}

+ (id)genericDisplayContextWithDisplayContext:(id)a3
{
  id v4 = a3;
  id v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = v4;
  }
  else
  {
    id v8 = objc_alloc((Class)a1);
    objc_msgSend(v4, "pbf_referenceBounds");
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    objc_msgSend(v4, "pbf_scale");
    id v7 = (id)objc_msgSend(v8, "initWithBounds:scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:", objc_msgSend(v4, "pbf_interfaceOrientation"), objc_msgSend(v4, "pbf_significantEventsCounter"), objc_msgSend(v4, "pbf_userInterfaceStyle"), objc_msgSend(v4, "pbf_accessibilityContrast"), v10, v12, v14, v16, v17);
  }
  double v18 = v7;

  return v18;
}

- (PBFGenericDisplayContext)initWithBounds:(CGRect)a3 scale:(double)a4 interfaceOrientation:(int64_t)a5 sigEventsCounter:(unint64_t)a6 userInterfaceStyle:(int64_t)a7 accessibilityContrast:(int64_t)a8
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    double v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!CGRectIsEmpty(bounds)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFGenericDisplayContext initWithBounds:scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:](a2, (uint64_t)self, (uint64_t)v20);
    }
LABEL_11:
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D328C030);
  }
  if (a4 <= 0.0)
  {
    double v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"scale > 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFGenericDisplayContext initWithBounds:scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:](a2, (uint64_t)self, (uint64_t)v20);
    }
    goto LABEL_11;
  }
  v21.receiver = self;
  v21.super_class = (Class)PBFGenericDisplayContext;
  result = [(PBFGenericDisplayContext *)&v21 init];
  if (result)
  {
    result->_referenceBounds.origin.CGFloat x = x;
    result->_referenceBounds.origin.CGFloat y = y;
    result->_referenceBounds.size.CGFloat width = width;
    result->_referenceBounds.size.CGFloat height = height;
    result->_scale = a4;
    result->_significantEventsCounter = a6;
    result->_userInterfaceStyle = a7;
    result->_accessibilityContrast = a8;
    result->_cachedHash = 0x7FFFFFFFFFFFFFFFLL;
    result->_interfaceOrientation = a5;
  }
  return result;
}

- (CGRect)pbf_frame
{
  [(PBFGenericDisplayContext *)self pbf_referenceBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PBFGenericDisplayContext *)self pbf_interfaceOrientation];
  int IsLandscape = BSInterfaceOrientationIsLandscape();
  BOOL v12 = v8 < v10;
  if ((IsLandscape & v12) != 0) {
    double v13 = v8;
  }
  else {
    double v13 = v10;
  }
  if ((IsLandscape & v12) != 0) {
    double v14 = v10;
  }
  else {
    double v14 = v8;
  }
  double v15 = v4;
  double v16 = v6;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (unint64_t)hash
{
  unint64_t result = self->_cachedHash;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v4 = [MEMORY[0x1E4F4F758] builder];
    id v5 = (id)[v4 appendInteger:self->_interfaceOrientation];
    id v6 = (id)[v4 appendInteger:self->_userInterfaceStyle];
    id v7 = (id)[v4 appendInteger:self->_accessibilityContrast];
    id v8 = (id)objc_msgSend(v4, "appendCGRect:", self->_referenceBounds.origin.x, self->_referenceBounds.origin.y, self->_referenceBounds.size.width, self->_referenceBounds.size.height);
    id v9 = (id)[v4 appendDouble:self->_scale];
    self->_cachedHash = [v4 hash];

    return self->_cachedHash;
  }
  return result;
}

- (NSString)pbf_displayContextPersistenceIdentifier
{
  pbf_displayContextPersistenceIdentifier = self->_pbf_displayContextPersistenceIdentifier;
  if (!pbf_displayContextPersistenceIdentifier)
  {
    double v4 = NSString;
    id v5 = NSStringFromCGRect(self->_referenceBounds);
    id v6 = [v4 stringWithFormat:@"b[%@]-s[%f]-o[%lu]-ui[%lu]-ax[%lu]-s[%lu]", v5, *(void *)&self->_scale, self->_interfaceOrientation, self->_userInterfaceStyle, self->_accessibilityContrast, self->_significantEventsCounter];
    id v7 = self->_pbf_displayContextPersistenceIdentifier;
    self->_pbf_displayContextPersistenceIdentifier = v6;

    pbf_displayContextPersistenceIdentifier = self->_pbf_displayContextPersistenceIdentifier;
  }
  id v8 = pbf_displayContextPersistenceIdentifier;
  return v8;
}

- (PBFGenericDisplayContext)displayContextWithUpdatedSignificantEventsCounter:(unint64_t)a3
{
  if (self->_significantEventsCounter == a3) {
    double v3 = self;
  }
  else {
    double v3 = (PBFGenericDisplayContext *)objc_msgSend(objc_allocWithZone((Class)objc_opt_class()), "initWithBounds:scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:", self->_interfaceOrientation, a3, self->_userInterfaceStyle, self->_accessibilityContrast, self->_referenceBounds.origin.x, self->_referenceBounds.origin.y, self->_referenceBounds.size.width, self->_referenceBounds.size.height, self->_scale);
  }
  return v3;
}

- (PBFGenericDisplayContext)displayContextWithUpdatedUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStyle == a3) {
    double v3 = self;
  }
  else {
    double v3 = (PBFGenericDisplayContext *)objc_msgSend(objc_allocWithZone((Class)objc_opt_class()), "initWithBounds:scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:", self->_interfaceOrientation, self->_significantEventsCounter, a3, self->_accessibilityContrast, self->_referenceBounds.origin.x, self->_referenceBounds.origin.y, self->_referenceBounds.size.width, self->_referenceBounds.size.height, self->_scale);
  }
  return v3;
}

- (PBFGenericDisplayContext)displayContextWithUpdatedAccessibilityContrast:(int64_t)a3
{
  if (self->_accessibilityContrast == a3) {
    double v3 = self;
  }
  else {
    double v3 = (PBFGenericDisplayContext *)objc_msgSend(objc_allocWithZone((Class)objc_opt_class()), "initWithBounds:scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:", self->_interfaceOrientation, self->_significantEventsCounter, self->_userInterfaceStyle, a3, self->_referenceBounds.origin.x, self->_referenceBounds.origin.y, self->_referenceBounds.size.width, self->_referenceBounds.size.height, self->_scale);
  }
  return v3;
}

- (PBFGenericDisplayContext)displayContextWithUpdatedInterfaceOrientation:(int64_t)a3
{
  if (self->_interfaceOrientation == a3) {
    double v3 = self;
  }
  else {
    double v3 = (PBFGenericDisplayContext *)objc_msgSend(objc_allocWithZone((Class)objc_opt_class()), "initWithBounds:scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:", a3, self->_significantEventsCounter, self->_userInterfaceStyle, self->_accessibilityContrast, self->_referenceBounds.origin.x, self->_referenceBounds.origin.y, self->_referenceBounds.size.width, self->_referenceBounds.size.height, self->_scale);
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (PBFGenericDisplayContext *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    id v5 = self;
    if (objc_opt_isKindOfClass())
    {
    }
    else
    {
      char v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) == 0)
      {
        BOOL v6 = 0;
        goto LABEL_8;
      }
    }
    BOOL v6 = [(PBFGenericDisplayContext *)self isEqualToDisplayContext:v4];
  }
LABEL_8:

  return v6;
}

- (BOOL)isEqualToDisplayContext:(id)a3
{
  double v4 = (PBFGenericDisplayContext *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    [(PBFGenericDisplayContext *)self pbf_scale];
    [(PBFGenericDisplayContext *)v4 pbf_scale];
    if (BSFloatEqualToFloat()
      && ([(PBFGenericDisplayContext *)self pbf_referenceBounds],
          [(PBFGenericDisplayContext *)v4 pbf_referenceBounds],
          BSRectEqualToRect())
      && (int64_t v5 = [(PBFGenericDisplayContext *)self pbf_accessibilityContrast],
          v5 == [(PBFGenericDisplayContext *)v4 pbf_accessibilityContrast])
      && (int64_t v6 = [(PBFGenericDisplayContext *)self pbf_userInterfaceStyle],
          v6 == [(PBFGenericDisplayContext *)v4 pbf_userInterfaceStyle]))
    {
      int64_t v7 = [(PBFGenericDisplayContext *)self pbf_interfaceOrientation];
      BOOL v8 = v7 == [(PBFGenericDisplayContext *)v4 pbf_interfaceOrientation];
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BOOL)geometryIsEqualTo:(id)a3
{
  id v4 = a3;
  [(PBFGenericDisplayContext *)self pbf_scale];
  objc_msgSend(v4, "pbf_scale");
  if (BSFloatEqualToFloat())
  {
    [(PBFGenericDisplayContext *)self pbf_referenceBounds];
    objc_msgSend(v4, "pbf_referenceBounds");
    char v5 = BSRectEqualToRect();
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (NSString)description
{
  double v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = BSInterfaceOrientationToString(self->_interfaceOrientation);
  [v3 appendString:v4 withName:@"interfaceOrientation"];

  char v5 = NSStringFromPBFUserInterfaceStyle(self->_userInterfaceStyle);
  [v3 appendString:v5 withName:@"userInterfaceStyle"];

  [(PBFGenericDisplayContext *)self pbf_referenceBounds];
  id v6 = (id)objc_msgSend(v3, "appendRect:withName:", @"bounds");
  [(PBFGenericDisplayContext *)self pbf_frame];
  id v7 = (id)objc_msgSend(v3, "appendRect:withName:", @"frame");
  [(PBFGenericDisplayContext *)self pbf_scale];
  id v8 = (id)objc_msgSend(v3, "appendFloat:withName:", @"scale");
  id v9 = [v3 build];

  return (NSString *)v9;
}

- (CGRect)pbf_referenceBounds
{
  double x = self->_referenceBounds.origin.x;
  double y = self->_referenceBounds.origin.y;
  double width = self->_referenceBounds.size.width;
  double height = self->_referenceBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)pbf_interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (double)pbf_scale
{
  return self->_scale;
}

- (unint64_t)pbf_significantEventsCounter
{
  return self->_significantEventsCounter;
}

- (int64_t)pbf_userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (int64_t)pbf_accessibilityContrast
{
  return self->_accessibilityContrast;
}

- (void).cxx_destruct
{
}

- (void)initWithBounds:(uint64_t)a3 scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  char v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"PBFDisplayContext.m";
  __int16 v10 = 1024;
  int v11 = 132;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)initWithBounds:(uint64_t)a3 scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  char v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"PBFDisplayContext.m";
  __int16 v10 = 1024;
  int v11 = 133;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end