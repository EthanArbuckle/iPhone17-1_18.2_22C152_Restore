@interface VOSGesture
+ (BOOL)supportsSecureCoding;
+ (NSSet)allGestures;
+ (NSSet)conflictingZoomGestures;
+ (NSSet)fiveFingerGestures;
+ (NSSet)fourFingerGestures;
+ (NSSet)oneFingerGestures;
+ (NSSet)oneFingerSplitGestures;
+ (NSSet)threeFingerGestures;
+ (NSSet)twoFingerGestures;
+ (NSSet)twoFingerSplitGestures;
+ (VOSGesture)BackTapDoubleTap;
+ (VOSGesture)BackTapTripleTap;
+ (VOSGesture)FiveFingerDoubleTap;
+ (VOSGesture)FiveFingerQuadrupleTap;
+ (VOSGesture)FiveFingerSingleTap;
+ (VOSGesture)FiveFingerTripleTap;
+ (VOSGesture)FourFingerDoubleTap;
+ (VOSGesture)FourFingerFlickDown;
+ (VOSGesture)FourFingerFlickLeft;
+ (VOSGesture)FourFingerFlickRight;
+ (VOSGesture)FourFingerFlickUp;
+ (VOSGesture)FourFingerQuadrupleTap;
+ (VOSGesture)FourFingerSingleTap;
+ (VOSGesture)FourFingerTripleTap;
+ (VOSGesture)Invalid;
+ (VOSGesture)OneFingerDoubleTap;
+ (VOSGesture)OneFingerDoubleTapAndHold;
+ (VOSGesture)OneFingerFlickDown;
+ (VOSGesture)OneFingerFlickLeft;
+ (VOSGesture)OneFingerFlickRight;
+ (VOSGesture)OneFingerFlickUp;
+ (VOSGesture)OneFingerQuadrupleTap;
+ (VOSGesture)OneFingerSingleTap;
+ (VOSGesture)OneFingerSingleTapAndHold;
+ (VOSGesture)OneFingerSplitFlickDown;
+ (VOSGesture)OneFingerSplitFlickLeft;
+ (VOSGesture)OneFingerSplitFlickRight;
+ (VOSGesture)OneFingerSplitFlickUp;
+ (VOSGesture)OneFingerTripleTap;
+ (VOSGesture)ThreeFingerDoubleTap;
+ (VOSGesture)ThreeFingerDoubleTapAndHold;
+ (VOSGesture)ThreeFingerDoubleTapHoldAndFlickDown;
+ (VOSGesture)ThreeFingerDoubleTapHoldAndFlickLeft;
+ (VOSGesture)ThreeFingerDoubleTapHoldAndFlickRight;
+ (VOSGesture)ThreeFingerDoubleTapHoldAndFlickUp;
+ (VOSGesture)ThreeFingerFlickDown;
+ (VOSGesture)ThreeFingerFlickLeft;
+ (VOSGesture)ThreeFingerFlickRight;
+ (VOSGesture)ThreeFingerFlickUp;
+ (VOSGesture)ThreeFingerQuadrupleTap;
+ (VOSGesture)ThreeFingerSingleTap;
+ (VOSGesture)ThreeFingerSingleTapAndHold;
+ (VOSGesture)ThreeFingerTripleTap;
+ (VOSGesture)TwoDistantFingerDoubleTap;
+ (VOSGesture)TwoDistantFingerSingleTap;
+ (VOSGesture)TwoDistantFingerTripleTap;
+ (VOSGesture)TwoFingerDoubleTap;
+ (VOSGesture)TwoFingerDoubleTapAndHold;
+ (VOSGesture)TwoFingerFlickDown;
+ (VOSGesture)TwoFingerFlickLeft;
+ (VOSGesture)TwoFingerFlickRight;
+ (VOSGesture)TwoFingerFlickUp;
+ (VOSGesture)TwoFingerPinch;
+ (VOSGesture)TwoFingerQuadrupleTap;
+ (VOSGesture)TwoFingerRotateClockwise;
+ (VOSGesture)TwoFingerRotateCounterclockwise;
+ (VOSGesture)TwoFingerScrub;
+ (VOSGesture)TwoFingerSingleTap;
+ (VOSGesture)TwoFingerSingleTapAndHold;
+ (VOSGesture)TwoFingerSplitFlickLeft;
+ (VOSGesture)TwoFingerSplitFlickRight;
+ (VOSGesture)TwoFingerTripleTap;
+ (VOSGesture)gestureWithStringValue:(id)a3;
+ (id)_gesturesForFingerCount:(int64_t)a3;
+ (id)_splitGesturesForFingerCount:(int64_t)a3;
+ (id)horizontalMirrorGestureForGesture:(id)a3;
+ (id)rtlGestureForGesture:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)localizedName;
- (NSString)rawValue;
- (VOSGesture)initWithCoder:(id)a3;
- (id)_initWithRawValue:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VOSGesture

- (id)_initWithRawValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VOSGesture;
  v6 = [(VOSGesture *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rawValue, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (VOSGesture)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawValue"];

  v6 = [(VOSGesture *)self _initWithRawValue:v5];
  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@<%p>: %@", v5, self, self->_rawValue];

  return v6;
}

- (unint64_t)hash
{
  v2 = [(VOSGesture *)self rawValue];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (VOSGesture)OneFingerSingleTap
{
  if (OneFingerSingleTap_onceToken != -1) {
    dispatch_once(&OneFingerSingleTap_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)OneFingerSingleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __32__VOSGesture_OneFingerSingleTap__block_invoke()
{
  OneFingerSingleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"OneFingerSingleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)OneFingerDoubleTap
{
  if (OneFingerDoubleTap_onceToken != -1) {
    dispatch_once(&OneFingerDoubleTap_onceToken, &__block_literal_global_277);
  }
  v2 = (void *)OneFingerDoubleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __32__VOSGesture_OneFingerDoubleTap__block_invoke()
{
  OneFingerDoubleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"OneFingerDoubleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)OneFingerTripleTap
{
  if (OneFingerTripleTap_onceToken != -1) {
    dispatch_once(&OneFingerTripleTap_onceToken, &__block_literal_global_282);
  }
  v2 = (void *)OneFingerTripleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __32__VOSGesture_OneFingerTripleTap__block_invoke()
{
  OneFingerTripleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"OneFingerTripleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)OneFingerQuadrupleTap
{
  if (OneFingerQuadrupleTap_onceToken != -1) {
    dispatch_once(&OneFingerQuadrupleTap_onceToken, &__block_literal_global_287);
  }
  v2 = (void *)OneFingerQuadrupleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __35__VOSGesture_OneFingerQuadrupleTap__block_invoke()
{
  OneFingerQuadrupleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"OneFingerQuadrupleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)TwoFingerSingleTap
{
  if (TwoFingerSingleTap_onceToken != -1) {
    dispatch_once(&TwoFingerSingleTap_onceToken, &__block_literal_global_292);
  }
  v2 = (void *)TwoFingerSingleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __32__VOSGesture_TwoFingerSingleTap__block_invoke()
{
  TwoFingerSingleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"TwoFingerSingleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)TwoFingerDoubleTap
{
  if (TwoFingerDoubleTap_onceToken != -1) {
    dispatch_once(&TwoFingerDoubleTap_onceToken, &__block_literal_global_297);
  }
  v2 = (void *)TwoFingerDoubleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __32__VOSGesture_TwoFingerDoubleTap__block_invoke()
{
  TwoFingerDoubleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"TwoFingerDoubleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)TwoFingerTripleTap
{
  if (TwoFingerTripleTap_onceToken != -1) {
    dispatch_once(&TwoFingerTripleTap_onceToken, &__block_literal_global_302);
  }
  v2 = (void *)TwoFingerTripleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __32__VOSGesture_TwoFingerTripleTap__block_invoke()
{
  TwoFingerTripleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"TwoFingerTripleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)TwoFingerQuadrupleTap
{
  if (TwoFingerQuadrupleTap_onceToken != -1) {
    dispatch_once(&TwoFingerQuadrupleTap_onceToken, &__block_literal_global_307);
  }
  v2 = (void *)TwoFingerQuadrupleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __35__VOSGesture_TwoFingerQuadrupleTap__block_invoke()
{
  TwoFingerQuadrupleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"TwoFingerQuadrupleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)TwoDistantFingerSingleTap
{
  if (TwoDistantFingerSingleTap_onceToken != -1) {
    dispatch_once(&TwoDistantFingerSingleTap_onceToken, &__block_literal_global_312);
  }
  v2 = (void *)TwoDistantFingerSingleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __39__VOSGesture_TwoDistantFingerSingleTap__block_invoke()
{
  TwoDistantFingerSingleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"TwoDistantFingerSingleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)TwoDistantFingerDoubleTap
{
  if (TwoDistantFingerDoubleTap_onceToken != -1) {
    dispatch_once(&TwoDistantFingerDoubleTap_onceToken, &__block_literal_global_317);
  }
  v2 = (void *)TwoDistantFingerDoubleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __39__VOSGesture_TwoDistantFingerDoubleTap__block_invoke()
{
  TwoDistantFingerDoubleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"TwoDistantFingerDoubleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)TwoDistantFingerTripleTap
{
  if (TwoDistantFingerTripleTap_onceToken != -1) {
    dispatch_once(&TwoDistantFingerTripleTap_onceToken, &__block_literal_global_322);
  }
  v2 = (void *)TwoDistantFingerTripleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __39__VOSGesture_TwoDistantFingerTripleTap__block_invoke()
{
  TwoDistantFingerTripleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"TwoDistantFingerTripleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)ThreeFingerSingleTap
{
  if (ThreeFingerSingleTap_onceToken != -1) {
    dispatch_once(&ThreeFingerSingleTap_onceToken, &__block_literal_global_327);
  }
  v2 = (void *)ThreeFingerSingleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __34__VOSGesture_ThreeFingerSingleTap__block_invoke()
{
  ThreeFingerSingleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"ThreeFingerSingleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)ThreeFingerDoubleTap
{
  if (ThreeFingerDoubleTap_onceToken != -1) {
    dispatch_once(&ThreeFingerDoubleTap_onceToken, &__block_literal_global_332);
  }
  v2 = (void *)ThreeFingerDoubleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __34__VOSGesture_ThreeFingerDoubleTap__block_invoke()
{
  ThreeFingerDoubleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"ThreeFingerDoubleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)ThreeFingerTripleTap
{
  if (ThreeFingerTripleTap_onceToken != -1) {
    dispatch_once(&ThreeFingerTripleTap_onceToken, &__block_literal_global_337);
  }
  v2 = (void *)ThreeFingerTripleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __34__VOSGesture_ThreeFingerTripleTap__block_invoke()
{
  ThreeFingerTripleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"ThreeFingerTripleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)ThreeFingerQuadrupleTap
{
  if (ThreeFingerQuadrupleTap_onceToken != -1) {
    dispatch_once(&ThreeFingerQuadrupleTap_onceToken, &__block_literal_global_342);
  }
  v2 = (void *)ThreeFingerQuadrupleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __37__VOSGesture_ThreeFingerQuadrupleTap__block_invoke()
{
  ThreeFingerQuadrupleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"ThreeFingerQuadrupleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)FourFingerSingleTap
{
  if (FourFingerSingleTap_onceToken != -1) {
    dispatch_once(&FourFingerSingleTap_onceToken, &__block_literal_global_347);
  }
  v2 = (void *)FourFingerSingleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __33__VOSGesture_FourFingerSingleTap__block_invoke()
{
  FourFingerSingleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"FourFingerSingleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)FourFingerDoubleTap
{
  if (FourFingerDoubleTap_onceToken != -1) {
    dispatch_once(&FourFingerDoubleTap_onceToken, &__block_literal_global_352);
  }
  v2 = (void *)FourFingerDoubleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __33__VOSGesture_FourFingerDoubleTap__block_invoke()
{
  FourFingerDoubleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"FourFingerDoubleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)FourFingerTripleTap
{
  if (FourFingerTripleTap_onceToken != -1) {
    dispatch_once(&FourFingerTripleTap_onceToken, &__block_literal_global_357);
  }
  v2 = (void *)FourFingerTripleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __33__VOSGesture_FourFingerTripleTap__block_invoke()
{
  FourFingerTripleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"FourFingerTripleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)FourFingerQuadrupleTap
{
  if (FourFingerQuadrupleTap_onceToken != -1) {
    dispatch_once(&FourFingerQuadrupleTap_onceToken, &__block_literal_global_362);
  }
  v2 = (void *)FourFingerQuadrupleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __36__VOSGesture_FourFingerQuadrupleTap__block_invoke()
{
  FourFingerQuadrupleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"FourFingerQuadrupleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)FiveFingerSingleTap
{
  if (FiveFingerSingleTap_onceToken != -1) {
    dispatch_once(&FiveFingerSingleTap_onceToken, &__block_literal_global_367);
  }
  v2 = (void *)FiveFingerSingleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __33__VOSGesture_FiveFingerSingleTap__block_invoke()
{
  FiveFingerSingleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"FiveFingerSingleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)FiveFingerDoubleTap
{
  if (FiveFingerDoubleTap_onceToken != -1) {
    dispatch_once(&FiveFingerDoubleTap_onceToken, &__block_literal_global_372);
  }
  v2 = (void *)FiveFingerDoubleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __33__VOSGesture_FiveFingerDoubleTap__block_invoke()
{
  FiveFingerDoubleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"FiveFingerDoubleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)FiveFingerTripleTap
{
  if (FiveFingerTripleTap_onceToken != -1) {
    dispatch_once(&FiveFingerTripleTap_onceToken, &__block_literal_global_377);
  }
  v2 = (void *)FiveFingerTripleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __33__VOSGesture_FiveFingerTripleTap__block_invoke()
{
  FiveFingerTripleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"FiveFingerTripleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)FiveFingerQuadrupleTap
{
  if (FiveFingerQuadrupleTap_onceToken != -1) {
    dispatch_once(&FiveFingerQuadrupleTap_onceToken, &__block_literal_global_382);
  }
  v2 = (void *)FiveFingerQuadrupleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __36__VOSGesture_FiveFingerQuadrupleTap__block_invoke()
{
  FiveFingerQuadrupleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"FiveFingerQuadrupleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)OneFingerFlickUp
{
  if (OneFingerFlickUp_onceToken != -1) {
    dispatch_once(&OneFingerFlickUp_onceToken, &__block_literal_global_387);
  }
  v2 = (void *)OneFingerFlickUp__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __30__VOSGesture_OneFingerFlickUp__block_invoke()
{
  OneFingerFlickUp__Gesture = [[VOSGesture alloc] _initWithRawValue:@"OneFingerFlickUp"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)OneFingerFlickDown
{
  if (OneFingerFlickDown_onceToken != -1) {
    dispatch_once(&OneFingerFlickDown_onceToken, &__block_literal_global_392);
  }
  v2 = (void *)OneFingerFlickDown__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __32__VOSGesture_OneFingerFlickDown__block_invoke()
{
  OneFingerFlickDown__Gesture = [[VOSGesture alloc] _initWithRawValue:@"OneFingerFlickDown"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)OneFingerFlickLeft
{
  if (OneFingerFlickLeft_onceToken != -1) {
    dispatch_once(&OneFingerFlickLeft_onceToken, &__block_literal_global_397);
  }
  v2 = (void *)OneFingerFlickLeft__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __32__VOSGesture_OneFingerFlickLeft__block_invoke()
{
  OneFingerFlickLeft__Gesture = [[VOSGesture alloc] _initWithRawValue:@"OneFingerFlickLeft"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)OneFingerFlickRight
{
  if (OneFingerFlickRight_onceToken != -1) {
    dispatch_once(&OneFingerFlickRight_onceToken, &__block_literal_global_402);
  }
  v2 = (void *)OneFingerFlickRight__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __33__VOSGesture_OneFingerFlickRight__block_invoke()
{
  OneFingerFlickRight__Gesture = [[VOSGesture alloc] _initWithRawValue:@"OneFingerFlickRight"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)TwoFingerFlickUp
{
  if (TwoFingerFlickUp_onceToken != -1) {
    dispatch_once(&TwoFingerFlickUp_onceToken, &__block_literal_global_407);
  }
  v2 = (void *)TwoFingerFlickUp__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __30__VOSGesture_TwoFingerFlickUp__block_invoke()
{
  TwoFingerFlickUp__Gesture = [[VOSGesture alloc] _initWithRawValue:@"TwoFingerFlickUp"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)TwoFingerFlickDown
{
  if (TwoFingerFlickDown_onceToken != -1) {
    dispatch_once(&TwoFingerFlickDown_onceToken, &__block_literal_global_412);
  }
  v2 = (void *)TwoFingerFlickDown__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __32__VOSGesture_TwoFingerFlickDown__block_invoke()
{
  TwoFingerFlickDown__Gesture = [[VOSGesture alloc] _initWithRawValue:@"TwoFingerFlickDown"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)TwoFingerFlickLeft
{
  if (TwoFingerFlickLeft_onceToken != -1) {
    dispatch_once(&TwoFingerFlickLeft_onceToken, &__block_literal_global_417);
  }
  v2 = (void *)TwoFingerFlickLeft__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __32__VOSGesture_TwoFingerFlickLeft__block_invoke()
{
  TwoFingerFlickLeft__Gesture = [[VOSGesture alloc] _initWithRawValue:@"TwoFingerFlickLeft"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)TwoFingerFlickRight
{
  if (TwoFingerFlickRight_onceToken != -1) {
    dispatch_once(&TwoFingerFlickRight_onceToken, &__block_literal_global_422);
  }
  v2 = (void *)TwoFingerFlickRight__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __33__VOSGesture_TwoFingerFlickRight__block_invoke()
{
  TwoFingerFlickRight__Gesture = [[VOSGesture alloc] _initWithRawValue:@"TwoFingerFlickRight"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)ThreeFingerFlickUp
{
  if (ThreeFingerFlickUp_onceToken != -1) {
    dispatch_once(&ThreeFingerFlickUp_onceToken, &__block_literal_global_427);
  }
  v2 = (void *)ThreeFingerFlickUp__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __32__VOSGesture_ThreeFingerFlickUp__block_invoke()
{
  ThreeFingerFlickUp__Gesture = [[VOSGesture alloc] _initWithRawValue:@"ThreeFingerFlickUp"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)ThreeFingerFlickDown
{
  if (ThreeFingerFlickDown_onceToken != -1) {
    dispatch_once(&ThreeFingerFlickDown_onceToken, &__block_literal_global_432);
  }
  v2 = (void *)ThreeFingerFlickDown__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __34__VOSGesture_ThreeFingerFlickDown__block_invoke()
{
  ThreeFingerFlickDown__Gesture = [[VOSGesture alloc] _initWithRawValue:@"ThreeFingerFlickDown"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)ThreeFingerFlickLeft
{
  if (ThreeFingerFlickLeft_onceToken != -1) {
    dispatch_once(&ThreeFingerFlickLeft_onceToken, &__block_literal_global_437);
  }
  v2 = (void *)ThreeFingerFlickLeft__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __34__VOSGesture_ThreeFingerFlickLeft__block_invoke()
{
  ThreeFingerFlickLeft__Gesture = [[VOSGesture alloc] _initWithRawValue:@"ThreeFingerFlickLeft"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)ThreeFingerFlickRight
{
  if (ThreeFingerFlickRight_onceToken != -1) {
    dispatch_once(&ThreeFingerFlickRight_onceToken, &__block_literal_global_442);
  }
  v2 = (void *)ThreeFingerFlickRight__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __35__VOSGesture_ThreeFingerFlickRight__block_invoke()
{
  ThreeFingerFlickRight__Gesture = [[VOSGesture alloc] _initWithRawValue:@"ThreeFingerFlickRight"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)ThreeFingerDoubleTapHoldAndFlickUp
{
  if (ThreeFingerDoubleTapHoldAndFlickUp_onceToken != -1) {
    dispatch_once(&ThreeFingerDoubleTapHoldAndFlickUp_onceToken, &__block_literal_global_447);
  }
  v2 = (void *)ThreeFingerDoubleTapHoldAndFlickUp__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __48__VOSGesture_ThreeFingerDoubleTapHoldAndFlickUp__block_invoke()
{
  ThreeFingerDoubleTapHoldAndFlickUp__Gesture = [[VOSGesture alloc] _initWithRawValue:@"ThreeFingerDoubleTapHoldAndFlickUp"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)ThreeFingerDoubleTapHoldAndFlickDown
{
  if (ThreeFingerDoubleTapHoldAndFlickDown_onceToken != -1) {
    dispatch_once(&ThreeFingerDoubleTapHoldAndFlickDown_onceToken, &__block_literal_global_452);
  }
  v2 = (void *)ThreeFingerDoubleTapHoldAndFlickDown__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __50__VOSGesture_ThreeFingerDoubleTapHoldAndFlickDown__block_invoke()
{
  ThreeFingerDoubleTapHoldAndFlickDown__Gesture = [[VOSGesture alloc] _initWithRawValue:@"ThreeFingerDoubleTapHoldAndFlickDown"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)ThreeFingerDoubleTapHoldAndFlickLeft
{
  if (ThreeFingerDoubleTapHoldAndFlickLeft_onceToken != -1) {
    dispatch_once(&ThreeFingerDoubleTapHoldAndFlickLeft_onceToken, &__block_literal_global_457);
  }
  v2 = (void *)ThreeFingerDoubleTapHoldAndFlickLeft__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __50__VOSGesture_ThreeFingerDoubleTapHoldAndFlickLeft__block_invoke()
{
  ThreeFingerDoubleTapHoldAndFlickLeft__Gesture = [[VOSGesture alloc] _initWithRawValue:@"ThreeFingerDoubleTapHoldAndFlickLeft"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)ThreeFingerDoubleTapHoldAndFlickRight
{
  if (ThreeFingerDoubleTapHoldAndFlickRight_onceToken != -1) {
    dispatch_once(&ThreeFingerDoubleTapHoldAndFlickRight_onceToken, &__block_literal_global_462);
  }
  v2 = (void *)ThreeFingerDoubleTapHoldAndFlickRight__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __51__VOSGesture_ThreeFingerDoubleTapHoldAndFlickRight__block_invoke()
{
  ThreeFingerDoubleTapHoldAndFlickRight__Gesture = [[VOSGesture alloc] _initWithRawValue:@"ThreeFingerDoubleTapHoldAndFlickRight"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)FourFingerFlickUp
{
  if (FourFingerFlickUp_onceToken != -1) {
    dispatch_once(&FourFingerFlickUp_onceToken, &__block_literal_global_467);
  }
  v2 = (void *)FourFingerFlickUp__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __31__VOSGesture_FourFingerFlickUp__block_invoke()
{
  FourFingerFlickUp__Gesture = [[VOSGesture alloc] _initWithRawValue:@"FourFingerFlickUp"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)FourFingerFlickDown
{
  if (FourFingerFlickDown_onceToken != -1) {
    dispatch_once(&FourFingerFlickDown_onceToken, &__block_literal_global_472);
  }
  v2 = (void *)FourFingerFlickDown__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __33__VOSGesture_FourFingerFlickDown__block_invoke()
{
  FourFingerFlickDown__Gesture = [[VOSGesture alloc] _initWithRawValue:@"FourFingerFlickDown"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)FourFingerFlickLeft
{
  if (FourFingerFlickLeft_onceToken != -1) {
    dispatch_once(&FourFingerFlickLeft_onceToken, &__block_literal_global_477);
  }
  v2 = (void *)FourFingerFlickLeft__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __33__VOSGesture_FourFingerFlickLeft__block_invoke()
{
  FourFingerFlickLeft__Gesture = [[VOSGesture alloc] _initWithRawValue:@"FourFingerFlickLeft"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)FourFingerFlickRight
{
  if (FourFingerFlickRight_onceToken != -1) {
    dispatch_once(&FourFingerFlickRight_onceToken, &__block_literal_global_482);
  }
  v2 = (void *)FourFingerFlickRight__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __34__VOSGesture_FourFingerFlickRight__block_invoke()
{
  FourFingerFlickRight__Gesture = [[VOSGesture alloc] _initWithRawValue:@"FourFingerFlickRight"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)OneFingerSplitFlickUp
{
  if (OneFingerSplitFlickUp_onceToken != -1) {
    dispatch_once(&OneFingerSplitFlickUp_onceToken, &__block_literal_global_487);
  }
  v2 = (void *)OneFingerSplitFlickUp__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __35__VOSGesture_OneFingerSplitFlickUp__block_invoke()
{
  OneFingerSplitFlickUp__Gesture = [[VOSGesture alloc] _initWithRawValue:@"OneFingerSplitFlickUp"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)OneFingerSplitFlickDown
{
  if (OneFingerSplitFlickDown_onceToken != -1) {
    dispatch_once(&OneFingerSplitFlickDown_onceToken, &__block_literal_global_492);
  }
  v2 = (void *)OneFingerSplitFlickDown__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __37__VOSGesture_OneFingerSplitFlickDown__block_invoke()
{
  OneFingerSplitFlickDown__Gesture = [[VOSGesture alloc] _initWithRawValue:@"OneFingerSplitFlickDown"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)OneFingerSplitFlickLeft
{
  if (OneFingerSplitFlickLeft_onceToken != -1) {
    dispatch_once(&OneFingerSplitFlickLeft_onceToken, &__block_literal_global_497);
  }
  v2 = (void *)OneFingerSplitFlickLeft__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __37__VOSGesture_OneFingerSplitFlickLeft__block_invoke()
{
  OneFingerSplitFlickLeft__Gesture = [[VOSGesture alloc] _initWithRawValue:@"OneFingerSplitFlickLeft"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)OneFingerSplitFlickRight
{
  if (OneFingerSplitFlickRight_onceToken != -1) {
    dispatch_once(&OneFingerSplitFlickRight_onceToken, &__block_literal_global_502);
  }
  v2 = (void *)OneFingerSplitFlickRight__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __38__VOSGesture_OneFingerSplitFlickRight__block_invoke()
{
  OneFingerSplitFlickRight__Gesture = [[VOSGesture alloc] _initWithRawValue:@"OneFingerSplitFlickRight"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)TwoFingerSplitFlickLeft
{
  if (TwoFingerSplitFlickLeft_onceToken != -1) {
    dispatch_once(&TwoFingerSplitFlickLeft_onceToken, &__block_literal_global_507);
  }
  v2 = (void *)TwoFingerSplitFlickLeft__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __37__VOSGesture_TwoFingerSplitFlickLeft__block_invoke()
{
  TwoFingerSplitFlickLeft__Gesture = [[VOSGesture alloc] _initWithRawValue:@"TwoFingerSplitFlickLeft"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)TwoFingerSplitFlickRight
{
  if (TwoFingerSplitFlickRight_onceToken != -1) {
    dispatch_once(&TwoFingerSplitFlickRight_onceToken, &__block_literal_global_512);
  }
  v2 = (void *)TwoFingerSplitFlickRight__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __38__VOSGesture_TwoFingerSplitFlickRight__block_invoke()
{
  TwoFingerSplitFlickRight__Gesture = [[VOSGesture alloc] _initWithRawValue:@"TwoFingerSplitFlickRight"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)TwoFingerRotateClockwise
{
  if (TwoFingerRotateClockwise_onceToken != -1) {
    dispatch_once(&TwoFingerRotateClockwise_onceToken, &__block_literal_global_517);
  }
  v2 = (void *)TwoFingerRotateClockwise__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __38__VOSGesture_TwoFingerRotateClockwise__block_invoke()
{
  TwoFingerRotateClockwise__Gesture = [[VOSGesture alloc] _initWithRawValue:@"TwoFingerRotateClockwise"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)TwoFingerRotateCounterclockwise
{
  if (TwoFingerRotateCounterclockwise_onceToken != -1) {
    dispatch_once(&TwoFingerRotateCounterclockwise_onceToken, &__block_literal_global_522);
  }
  v2 = (void *)TwoFingerRotateCounterclockwise__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __45__VOSGesture_TwoFingerRotateCounterclockwise__block_invoke()
{
  TwoFingerRotateCounterclockwise__Gesture = [[VOSGesture alloc] _initWithRawValue:@"TwoFingerRotateCounterclockwise"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)TwoFingerPinch
{
  if (TwoFingerPinch_onceToken != -1) {
    dispatch_once(&TwoFingerPinch_onceToken, &__block_literal_global_527);
  }
  v2 = (void *)TwoFingerPinch__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __28__VOSGesture_TwoFingerPinch__block_invoke()
{
  TwoFingerPinch__Gesture = [[VOSGesture alloc] _initWithRawValue:@"TwoFingerPinch"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)TwoFingerScrub
{
  if (TwoFingerScrub_onceToken != -1) {
    dispatch_once(&TwoFingerScrub_onceToken, &__block_literal_global_532);
  }
  v2 = (void *)TwoFingerScrub__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __28__VOSGesture_TwoFingerScrub__block_invoke()
{
  TwoFingerScrub__Gesture = [[VOSGesture alloc] _initWithRawValue:@"TwoFingerScrub"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)OneFingerSingleTapAndHold
{
  if (OneFingerSingleTapAndHold_onceToken != -1) {
    dispatch_once(&OneFingerSingleTapAndHold_onceToken, &__block_literal_global_537);
  }
  v2 = (void *)OneFingerSingleTapAndHold__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __39__VOSGesture_OneFingerSingleTapAndHold__block_invoke()
{
  OneFingerSingleTapAndHold__Gesture = [[VOSGesture alloc] _initWithRawValue:@"OneFingerSingleTapAndHold"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)OneFingerDoubleTapAndHold
{
  if (OneFingerDoubleTapAndHold_onceToken != -1) {
    dispatch_once(&OneFingerDoubleTapAndHold_onceToken, &__block_literal_global_542);
  }
  v2 = (void *)OneFingerDoubleTapAndHold__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __39__VOSGesture_OneFingerDoubleTapAndHold__block_invoke()
{
  OneFingerDoubleTapAndHold__Gesture = [[VOSGesture alloc] _initWithRawValue:@"OneFingerDoubleTapAndHold"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)TwoFingerSingleTapAndHold
{
  if (TwoFingerSingleTapAndHold_onceToken != -1) {
    dispatch_once(&TwoFingerSingleTapAndHold_onceToken, &__block_literal_global_547);
  }
  v2 = (void *)TwoFingerSingleTapAndHold__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __39__VOSGesture_TwoFingerSingleTapAndHold__block_invoke()
{
  TwoFingerSingleTapAndHold__Gesture = [[VOSGesture alloc] _initWithRawValue:@"TwoFingerSingleTapAndHold"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)TwoFingerDoubleTapAndHold
{
  if (TwoFingerDoubleTapAndHold_onceToken != -1) {
    dispatch_once(&TwoFingerDoubleTapAndHold_onceToken, &__block_literal_global_552);
  }
  v2 = (void *)TwoFingerDoubleTapAndHold__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __39__VOSGesture_TwoFingerDoubleTapAndHold__block_invoke()
{
  TwoFingerDoubleTapAndHold__Gesture = [[VOSGesture alloc] _initWithRawValue:@"TwoFingerDoubleTapAndHold"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)ThreeFingerSingleTapAndHold
{
  if (ThreeFingerSingleTapAndHold_onceToken != -1) {
    dispatch_once(&ThreeFingerSingleTapAndHold_onceToken, &__block_literal_global_557);
  }
  v2 = (void *)ThreeFingerSingleTapAndHold__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __41__VOSGesture_ThreeFingerSingleTapAndHold__block_invoke()
{
  ThreeFingerSingleTapAndHold__Gesture = [[VOSGesture alloc] _initWithRawValue:@"ThreeFingerSingleTapAndHold"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)ThreeFingerDoubleTapAndHold
{
  if (ThreeFingerDoubleTapAndHold_onceToken != -1) {
    dispatch_once(&ThreeFingerDoubleTapAndHold_onceToken, &__block_literal_global_562);
  }
  v2 = (void *)ThreeFingerDoubleTapAndHold__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __41__VOSGesture_ThreeFingerDoubleTapAndHold__block_invoke()
{
  ThreeFingerDoubleTapAndHold__Gesture = [[VOSGesture alloc] _initWithRawValue:@"ThreeFingerDoubleTapAndHold"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)BackTapDoubleTap
{
  if (BackTapDoubleTap_onceToken != -1) {
    dispatch_once(&BackTapDoubleTap_onceToken, &__block_literal_global_567);
  }
  v2 = (void *)BackTapDoubleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __30__VOSGesture_BackTapDoubleTap__block_invoke()
{
  BackTapDoubleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"BackTapDoubleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)BackTapTripleTap
{
  if (BackTapTripleTap_onceToken != -1) {
    dispatch_once(&BackTapTripleTap_onceToken, &__block_literal_global_572);
  }
  v2 = (void *)BackTapTripleTap__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __30__VOSGesture_BackTapTripleTap__block_invoke()
{
  BackTapTripleTap__Gesture = [[VOSGesture alloc] _initWithRawValue:@"BackTapTripleTap"];

  return MEMORY[0x270F9A758]();
}

+ (VOSGesture)Invalid
{
  if (Invalid_onceToken != -1) {
    dispatch_once(&Invalid_onceToken, &__block_literal_global_577);
  }
  v2 = (void *)Invalid__Gesture;

  return (VOSGesture *)v2;
}

uint64_t __21__VOSGesture_Invalid__block_invoke()
{
  Invalid__Gesture = [[VOSGesture alloc] _initWithRawValue:@"Invalid"];

  return MEMORY[0x270F9A758]();
}

+ (NSSet)allGestures
{
  if (allGestures_onceToken != -1) {
    dispatch_once(&allGestures_onceToken, &__block_literal_global_582);
  }
  v2 = (void *)allGestures__AllGestures;

  return (NSSet *)v2;
}

void __25__VOSGesture_allGestures__block_invoke()
{
  v14 = (void *)MEMORY[0x263EFFA08];
  v63 = +[VOSGesture OneFingerSingleTap];
  v62 = +[VOSGesture OneFingerDoubleTap];
  v61 = +[VOSGesture OneFingerTripleTap];
  v60 = +[VOSGesture OneFingerQuadrupleTap];
  v59 = +[VOSGesture TwoFingerSingleTap];
  v58 = +[VOSGesture TwoFingerDoubleTap];
  v57 = +[VOSGesture TwoFingerTripleTap];
  v56 = +[VOSGesture TwoFingerQuadrupleTap];
  v55 = +[VOSGesture TwoDistantFingerSingleTap];
  v54 = +[VOSGesture TwoDistantFingerDoubleTap];
  v53 = +[VOSGesture TwoDistantFingerTripleTap];
  v52 = +[VOSGesture ThreeFingerSingleTap];
  v51 = +[VOSGesture ThreeFingerDoubleTap];
  v50 = +[VOSGesture ThreeFingerTripleTap];
  v49 = +[VOSGesture ThreeFingerQuadrupleTap];
  v48 = +[VOSGesture FourFingerSingleTap];
  v47 = +[VOSGesture FourFingerDoubleTap];
  v46 = +[VOSGesture FourFingerTripleTap];
  v45 = +[VOSGesture FourFingerQuadrupleTap];
  v44 = +[VOSGesture FiveFingerSingleTap];
  v43 = +[VOSGesture FiveFingerDoubleTap];
  v42 = +[VOSGesture FiveFingerTripleTap];
  v41 = +[VOSGesture FiveFingerQuadrupleTap];
  v40 = +[VOSGesture OneFingerFlickUp];
  v39 = +[VOSGesture OneFingerFlickDown];
  v38 = +[VOSGesture OneFingerFlickLeft];
  v37 = +[VOSGesture OneFingerFlickRight];
  v36 = +[VOSGesture TwoFingerFlickUp];
  v35 = +[VOSGesture TwoFingerFlickDown];
  v34 = +[VOSGesture TwoFingerFlickLeft];
  v33 = +[VOSGesture TwoFingerFlickRight];
  v29 = +[VOSGesture ThreeFingerFlickUp];
  v31 = +[VOSGesture ThreeFingerFlickDown];
  v32 = +[VOSGesture ThreeFingerFlickLeft];
  v30 = +[VOSGesture ThreeFingerFlickRight];
  v26 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickUp];
  v28 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickDown];
  v13 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickLeft];
  v27 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickRight];
  v25 = +[VOSGesture FourFingerFlickUp];
  v12 = +[VOSGesture FourFingerFlickDown];
  v24 = +[VOSGesture FourFingerFlickLeft];
  v23 = +[VOSGesture FourFingerFlickRight];
  v22 = +[VOSGesture OneFingerSplitFlickUp];
  v21 = +[VOSGesture OneFingerSplitFlickDown];
  v20 = +[VOSGesture OneFingerSplitFlickLeft];
  v19 = +[VOSGesture OneFingerSplitFlickRight];
  v18 = +[VOSGesture TwoFingerSplitFlickLeft];
  v17 = +[VOSGesture TwoFingerSplitFlickRight];
  v16 = +[VOSGesture TwoFingerRotateClockwise];
  v15 = +[VOSGesture TwoFingerRotateCounterclockwise];
  v11 = +[VOSGesture TwoFingerPinch];
  v0 = +[VOSGesture TwoFingerScrub];
  v10 = +[VOSGesture OneFingerSingleTapAndHold];
  v1 = +[VOSGesture OneFingerDoubleTapAndHold];
  v2 = +[VOSGesture TwoFingerSingleTapAndHold];
  unint64_t v3 = +[VOSGesture TwoFingerDoubleTapAndHold];
  id v4 = +[VOSGesture ThreeFingerSingleTapAndHold];
  id v5 = +[VOSGesture ThreeFingerDoubleTapAndHold];
  v6 = +[VOSGesture BackTapDoubleTap];
  v7 = +[VOSGesture BackTapTripleTap];
  objc_msgSend(v14, "setWithObjects:", v63, v62, v61, v60, v59, v58, v57, v56, v55, v54, v53, v52, v51, v50, v49, v48, v47,
    v46,
    v45,
    v44,
    v43,
    v42,
    v41,
    v40,
    v39,
    v38,
    v37,
    v36,
    v35,
    v34,
    v33,
    v29,
    v31,
    v32,
    v30,
    v26,
    v28,
    v13,
    v27,
    v25,
    v12,
    v24,
    v23,
    v22,
    v21,
    v20,
    v19,
    v18,
    v17,
    v16,
    v15,
    v11,
    v0,
    v10,
    v1,
    v2,
    v3,
    v4,
    v5,
    v6,
  uint64_t v8 = v7);
  objc_super v9 = (void *)allGestures__AllGestures;
  allGestures__AllGestures = v8;
}

+ (VOSGesture)gestureWithStringValue:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = objc_msgSend(a1, "allGestures", 0);
  v6 = (id *)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (id *)((char *)i + 1))
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_super v9 = *(id **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9[1] isEqualToString:v4])
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id *)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (VOSGesture *)v6;
}

+ (id)horizontalMirrorGestureForGesture:(id)a3
{
  id v3 = a3;
  id v4 = +[VOSGesture OneFingerFlickLeft];

  id v5 = +[VOSGesture OneFingerFlickRight];
  id v6 = v5;
  if (v4 != v3)
  {

    if (v6 == v3)
    {
      uint64_t v19 = +[VOSGesture OneFingerFlickLeft];
    }
    else
    {
      id v7 = +[VOSGesture TwoFingerFlickLeft];

      uint64_t v8 = +[VOSGesture TwoFingerFlickRight];
      id v6 = v8;
      if (v7 == v3) {
        goto LABEL_24;
      }

      if (v6 == v3)
      {
        uint64_t v19 = +[VOSGesture TwoFingerFlickLeft];
      }
      else
      {
        id v9 = +[VOSGesture ThreeFingerFlickLeft];

        v10 = +[VOSGesture ThreeFingerFlickRight];
        id v6 = v10;
        if (v9 == v3) {
          goto LABEL_24;
        }

        if (v6 == v3)
        {
          uint64_t v19 = +[VOSGesture ThreeFingerFlickLeft];
        }
        else
        {
          id v11 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickLeft];

          long long v12 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickRight];
          id v6 = v12;
          if (v11 == v3) {
            goto LABEL_24;
          }

          if (v6 == v3)
          {
            uint64_t v19 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickLeft];
          }
          else
          {
            id v13 = +[VOSGesture FourFingerFlickLeft];

            long long v14 = +[VOSGesture FourFingerFlickRight];
            id v6 = v14;
            if (v13 == v3) {
              goto LABEL_24;
            }

            if (v6 == v3)
            {
              uint64_t v19 = +[VOSGesture FourFingerFlickLeft];
            }
            else
            {
              id v15 = +[VOSGesture OneFingerSplitFlickLeft];

              uint64_t v16 = +[VOSGesture OneFingerSplitFlickRight];
              id v6 = v16;
              if (v15 == v3) {
                goto LABEL_24;
              }

              if (v6 == v3)
              {
                uint64_t v19 = +[VOSGesture OneFingerSplitFlickLeft];
              }
              else
              {
                id v17 = +[VOSGesture TwoFingerSplitFlickLeft];

                v18 = +[VOSGesture TwoFingerSplitFlickRight];
                id v6 = v18;
                if (v17 == v3) {
                  goto LABEL_24;
                }

                if (v6 != v3)
                {
                  id v6 = 0;
                  goto LABEL_24;
                }
                uint64_t v19 = +[VOSGesture TwoFingerSplitFlickLeft];
              }
            }
          }
        }
      }
    }
    id v6 = (id)v19;
  }
LABEL_24:

  return v6;
}

+ (id)rtlGestureForGesture:(id)a3
{
  id v3 = a3;
  id v4 = +[VOSGesture OneFingerFlickLeft];

  id v5 = +[VOSGesture OneFingerFlickRight];
  id v6 = v5;
  if (v4 != v3)
  {

    if (v6 == v3)
    {
      uint64_t v11 = +[VOSGesture OneFingerFlickLeft];
    }
    else
    {
      id v7 = +[VOSGesture OneFingerSplitFlickLeft];

      uint64_t v8 = +[VOSGesture OneFingerSplitFlickRight];
      id v6 = v8;
      if (v7 == v3) {
        goto LABEL_12;
      }

      if (v6 == v3)
      {
        uint64_t v11 = +[VOSGesture OneFingerSplitFlickLeft];
      }
      else
      {
        id v9 = +[VOSGesture TwoFingerSplitFlickLeft];

        v10 = +[VOSGesture TwoFingerSplitFlickRight];
        id v6 = v10;
        if (v9 == v3) {
          goto LABEL_12;
        }

        if (v6 != v3)
        {
          id v6 = 0;
          goto LABEL_12;
        }
        uint64_t v11 = +[VOSGesture TwoFingerSplitFlickLeft];
      }
    }
    id v6 = (id)v11;
  }
LABEL_12:

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v7 = 0;
  if (objc_opt_isKindOfClass())
  {
    rawValue = self->_rawValue;
    id v6 = [v4 rawValue];
    LOBYTE(rawValue) = [(NSString *)rawValue isEqualToString:v6];

    if (rawValue) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (NSString)rawValue
{
  return self->_rawValue;
}

- (NSString)localizedName
{
  v2 = [NSString stringWithFormat:@"VOSGesture.%@", self->_rawValue];
  id v3 = VOSLocString(v2);

  return (NSString *)v3;
}

+ (id)_gesturesForFingerCount:(int64_t)a3
{
  id v4 = [MEMORY[0x263EFF9C0] set];
  switch(a3)
  {
    case 0:
      id v5 = +[VOSGesture BackTapDoubleTap];
      [v4 addObject:v5];

      uint64_t v6 = +[VOSGesture BackTapTripleTap];
      goto LABEL_10;
    case 1:
      BOOL v7 = +[VOSGesture OneFingerSingleTap];
      [v4 addObject:v7];

      uint64_t v8 = +[VOSGesture OneFingerDoubleTap];
      [v4 addObject:v8];

      id v9 = +[VOSGesture OneFingerTripleTap];
      [v4 addObject:v9];

      v10 = +[VOSGesture OneFingerQuadrupleTap];
      [v4 addObject:v10];

      uint64_t v11 = +[VOSGesture OneFingerFlickUp];
      [v4 addObject:v11];

      long long v12 = +[VOSGesture OneFingerFlickDown];
      [v4 addObject:v12];

      id v13 = +[VOSGesture OneFingerFlickLeft];
      [v4 addObject:v13];

      long long v14 = +[VOSGesture OneFingerFlickRight];
      [v4 addObject:v14];

      id v15 = +[VOSGesture OneFingerSingleTapAndHold];
      [v4 addObject:v15];

      uint64_t v6 = +[VOSGesture OneFingerDoubleTapAndHold];
      goto LABEL_10;
    case 2:
      uint64_t v16 = +[VOSGesture TwoFingerSingleTap];
      [v4 addObject:v16];

      id v17 = +[VOSGesture TwoFingerDoubleTap];
      [v4 addObject:v17];

      v18 = +[VOSGesture TwoFingerTripleTap];
      [v4 addObject:v18];

      uint64_t v19 = +[VOSGesture TwoFingerQuadrupleTap];
      [v4 addObject:v19];

      v20 = +[VOSGesture TwoDistantFingerSingleTap];
      [v4 addObject:v20];

      v21 = +[VOSGesture TwoDistantFingerDoubleTap];
      [v4 addObject:v21];

      v22 = +[VOSGesture TwoDistantFingerTripleTap];
      [v4 addObject:v22];

      v23 = +[VOSGesture TwoFingerFlickUp];
      [v4 addObject:v23];

      v24 = +[VOSGesture TwoFingerFlickDown];
      [v4 addObject:v24];

      v25 = +[VOSGesture TwoFingerFlickLeft];
      [v4 addObject:v25];

      v26 = +[VOSGesture TwoFingerFlickRight];
      [v4 addObject:v26];

      v27 = +[VOSGesture TwoFingerRotateClockwise];
      [v4 addObject:v27];

      v28 = +[VOSGesture TwoFingerRotateCounterclockwise];
      [v4 addObject:v28];

      v29 = +[VOSGesture TwoFingerPinch];
      [v4 addObject:v29];

      v30 = +[VOSGesture TwoFingerScrub];
      [v4 addObject:v30];

      v31 = +[VOSGesture TwoFingerSingleTapAndHold];
      [v4 addObject:v31];

      uint64_t v6 = +[VOSGesture TwoFingerDoubleTapAndHold];
      goto LABEL_10;
    case 3:
      v32 = +[VOSGesture ThreeFingerSingleTap];
      [v4 addObject:v32];

      v33 = +[VOSGesture ThreeFingerDoubleTap];
      [v4 addObject:v33];

      v34 = +[VOSGesture ThreeFingerTripleTap];
      [v4 addObject:v34];

      v35 = +[VOSGesture ThreeFingerQuadrupleTap];
      [v4 addObject:v35];

      v36 = +[VOSGesture ThreeFingerFlickUp];
      [v4 addObject:v36];

      v37 = +[VOSGesture ThreeFingerFlickDown];
      [v4 addObject:v37];

      v38 = +[VOSGesture ThreeFingerFlickLeft];
      [v4 addObject:v38];

      v39 = +[VOSGesture ThreeFingerFlickRight];
      [v4 addObject:v39];

      v40 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickUp];
      [v4 addObject:v40];

      v41 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickDown];
      [v4 addObject:v41];

      v42 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickLeft];
      [v4 addObject:v42];

      v43 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickRight];
      [v4 addObject:v43];

      v44 = +[VOSGesture ThreeFingerSingleTapAndHold];
      [v4 addObject:v44];

      uint64_t v6 = +[VOSGesture ThreeFingerDoubleTapAndHold];
      goto LABEL_10;
    case 4:
      v45 = +[VOSGesture FourFingerSingleTap];
      [v4 addObject:v45];

      v46 = +[VOSGesture FourFingerDoubleTap];
      [v4 addObject:v46];

      v47 = +[VOSGesture FourFingerTripleTap];
      [v4 addObject:v47];

      v48 = +[VOSGesture FourFingerQuadrupleTap];
      [v4 addObject:v48];

      v49 = +[VOSGesture FourFingerFlickUp];
      [v4 addObject:v49];

      v50 = +[VOSGesture FourFingerFlickDown];
      [v4 addObject:v50];

      v51 = +[VOSGesture FourFingerFlickLeft];
      [v4 addObject:v51];

      uint64_t v6 = +[VOSGesture FourFingerFlickRight];
      goto LABEL_10;
    case 5:
      v52 = +[VOSGesture FiveFingerSingleTap];
      [v4 addObject:v52];

      v53 = +[VOSGesture FiveFingerDoubleTap];
      [v4 addObject:v53];

      v54 = +[VOSGesture FiveFingerTripleTap];
      [v4 addObject:v54];

      uint64_t v6 = +[VOSGesture FiveFingerQuadrupleTap];
      goto LABEL_10;
    case 11:
      v55 = +[VOSGesture OneFingerSplitFlickUp];
      [v4 addObject:v55];

      v56 = +[VOSGesture OneFingerSplitFlickDown];
      [v4 addObject:v56];

      v57 = +[VOSGesture OneFingerSplitFlickLeft];
      [v4 addObject:v57];

      uint64_t v6 = +[VOSGesture OneFingerSplitFlickRight];
      goto LABEL_10;
    case 12:
      v58 = +[VOSGesture TwoFingerSplitFlickLeft];
      [v4 addObject:v58];

      uint64_t v6 = +[VOSGesture TwoFingerSplitFlickRight];
LABEL_10:
      v59 = (void *)v6;
      [v4 addObject:v6];

      break;
    default:
      break;
  }

  return v4;
}

+ (id)_splitGesturesForFingerCount:(int64_t)a3
{
  id v4 = [MEMORY[0x263EFF9C0] set];
  switch(a3)
  {
    case -10:
      id v5 = +[VOSGesture BackTapDoubleTap];
      [v4 addObject:v5];

      uint64_t v6 = +[VOSGesture BackTapTripleTap];
      goto LABEL_10;
    case -9:
      BOOL v7 = +[VOSGesture OneFingerSingleTap];
      [v4 addObject:v7];

      uint64_t v8 = +[VOSGesture OneFingerDoubleTap];
      [v4 addObject:v8];

      id v9 = +[VOSGesture OneFingerTripleTap];
      [v4 addObject:v9];

      v10 = +[VOSGesture OneFingerQuadrupleTap];
      [v4 addObject:v10];

      uint64_t v11 = +[VOSGesture OneFingerFlickUp];
      [v4 addObject:v11];

      long long v12 = +[VOSGesture OneFingerFlickDown];
      [v4 addObject:v12];

      id v13 = +[VOSGesture OneFingerFlickLeft];
      [v4 addObject:v13];

      long long v14 = +[VOSGesture OneFingerFlickRight];
      [v4 addObject:v14];

      id v15 = +[VOSGesture OneFingerSingleTapAndHold];
      [v4 addObject:v15];

      uint64_t v6 = +[VOSGesture OneFingerDoubleTapAndHold];
      goto LABEL_10;
    case -8:
      uint64_t v16 = +[VOSGesture TwoFingerSingleTap];
      [v4 addObject:v16];

      id v17 = +[VOSGesture TwoFingerDoubleTap];
      [v4 addObject:v17];

      v18 = +[VOSGesture TwoFingerTripleTap];
      [v4 addObject:v18];

      uint64_t v19 = +[VOSGesture TwoFingerQuadrupleTap];
      [v4 addObject:v19];

      v20 = +[VOSGesture TwoDistantFingerSingleTap];
      [v4 addObject:v20];

      v21 = +[VOSGesture TwoDistantFingerDoubleTap];
      [v4 addObject:v21];

      v22 = +[VOSGesture TwoDistantFingerTripleTap];
      [v4 addObject:v22];

      v23 = +[VOSGesture TwoFingerFlickUp];
      [v4 addObject:v23];

      v24 = +[VOSGesture TwoFingerFlickDown];
      [v4 addObject:v24];

      v25 = +[VOSGesture TwoFingerFlickLeft];
      [v4 addObject:v25];

      v26 = +[VOSGesture TwoFingerFlickRight];
      [v4 addObject:v26];

      v27 = +[VOSGesture TwoFingerRotateClockwise];
      [v4 addObject:v27];

      v28 = +[VOSGesture TwoFingerRotateCounterclockwise];
      [v4 addObject:v28];

      v29 = +[VOSGesture TwoFingerPinch];
      [v4 addObject:v29];

      v30 = +[VOSGesture TwoFingerScrub];
      [v4 addObject:v30];

      v31 = +[VOSGesture TwoFingerSingleTapAndHold];
      [v4 addObject:v31];

      uint64_t v6 = +[VOSGesture TwoFingerDoubleTapAndHold];
      goto LABEL_10;
    case -7:
      v32 = +[VOSGesture ThreeFingerSingleTap];
      [v4 addObject:v32];

      v33 = +[VOSGesture ThreeFingerDoubleTap];
      [v4 addObject:v33];

      v34 = +[VOSGesture ThreeFingerTripleTap];
      [v4 addObject:v34];

      v35 = +[VOSGesture ThreeFingerQuadrupleTap];
      [v4 addObject:v35];

      v36 = +[VOSGesture ThreeFingerFlickUp];
      [v4 addObject:v36];

      v37 = +[VOSGesture ThreeFingerFlickDown];
      [v4 addObject:v37];

      v38 = +[VOSGesture ThreeFingerFlickLeft];
      [v4 addObject:v38];

      v39 = +[VOSGesture ThreeFingerFlickRight];
      [v4 addObject:v39];

      v40 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickUp];
      [v4 addObject:v40];

      v41 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickDown];
      [v4 addObject:v41];

      v42 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickLeft];
      [v4 addObject:v42];

      v43 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickRight];
      [v4 addObject:v43];

      v44 = +[VOSGesture ThreeFingerSingleTapAndHold];
      [v4 addObject:v44];

      uint64_t v6 = +[VOSGesture ThreeFingerDoubleTapAndHold];
      goto LABEL_10;
    case -6:
      v45 = +[VOSGesture FourFingerSingleTap];
      [v4 addObject:v45];

      v46 = +[VOSGesture FourFingerDoubleTap];
      [v4 addObject:v46];

      v47 = +[VOSGesture FourFingerTripleTap];
      [v4 addObject:v47];

      v48 = +[VOSGesture FourFingerQuadrupleTap];
      [v4 addObject:v48];

      v49 = +[VOSGesture FourFingerFlickUp];
      [v4 addObject:v49];

      v50 = +[VOSGesture FourFingerFlickDown];
      [v4 addObject:v50];

      v51 = +[VOSGesture FourFingerFlickLeft];
      [v4 addObject:v51];

      uint64_t v6 = +[VOSGesture FourFingerFlickRight];
      goto LABEL_10;
    case -5:
      v52 = +[VOSGesture FiveFingerSingleTap];
      [v4 addObject:v52];

      v53 = +[VOSGesture FiveFingerDoubleTap];
      [v4 addObject:v53];

      v54 = +[VOSGesture FiveFingerTripleTap];
      [v4 addObject:v54];

      uint64_t v6 = +[VOSGesture FiveFingerQuadrupleTap];
      goto LABEL_10;
    case 1:
      v55 = +[VOSGesture OneFingerSplitFlickUp];
      [v4 addObject:v55];

      v56 = +[VOSGesture OneFingerSplitFlickDown];
      [v4 addObject:v56];

      v57 = +[VOSGesture OneFingerSplitFlickLeft];
      [v4 addObject:v57];

      uint64_t v6 = +[VOSGesture OneFingerSplitFlickRight];
      goto LABEL_10;
    case 2:
      v58 = +[VOSGesture TwoFingerSplitFlickLeft];
      [v4 addObject:v58];

      uint64_t v6 = +[VOSGesture TwoFingerSplitFlickRight];
LABEL_10:
      v59 = (void *)v6;
      [v4 addObject:v6];

      break;
    default:
      break;
  }

  return v4;
}

+ (NSSet)oneFingerGestures
{
  if (oneFingerGestures_onceToken != -1) {
    dispatch_once(&oneFingerGestures_onceToken, &__block_literal_global_589);
  }
  v2 = (void *)oneFingerGestures__gestures;

  return (NSSet *)v2;
}

uint64_t __31__VOSGesture_oneFingerGestures__block_invoke()
{
  oneFingerGestures__gestures = +[VOSGesture _gesturesForFingerCount:1];

  return MEMORY[0x270F9A758]();
}

+ (NSSet)twoFingerGestures
{
  if (twoFingerGestures_onceToken != -1) {
    dispatch_once(&twoFingerGestures_onceToken, &__block_literal_global_591);
  }
  v2 = (void *)twoFingerGestures__gestures;

  return (NSSet *)v2;
}

uint64_t __31__VOSGesture_twoFingerGestures__block_invoke()
{
  twoFingerGestures__gestures = +[VOSGesture _gesturesForFingerCount:2];

  return MEMORY[0x270F9A758]();
}

+ (NSSet)threeFingerGestures
{
  if (threeFingerGestures_onceToken != -1) {
    dispatch_once(&threeFingerGestures_onceToken, &__block_literal_global_593);
  }
  v2 = (void *)threeFingerGestures__gestures;

  return (NSSet *)v2;
}

uint64_t __33__VOSGesture_threeFingerGestures__block_invoke()
{
  threeFingerGestures__gestures = +[VOSGesture _gesturesForFingerCount:3];

  return MEMORY[0x270F9A758]();
}

+ (NSSet)fourFingerGestures
{
  if (fourFingerGestures_onceToken != -1) {
    dispatch_once(&fourFingerGestures_onceToken, &__block_literal_global_595);
  }
  v2 = (void *)fourFingerGestures__gestures;

  return (NSSet *)v2;
}

uint64_t __32__VOSGesture_fourFingerGestures__block_invoke()
{
  fourFingerGestures__gestures = +[VOSGesture _gesturesForFingerCount:4];

  return MEMORY[0x270F9A758]();
}

+ (NSSet)fiveFingerGestures
{
  if (fiveFingerGestures_onceToken != -1) {
    dispatch_once(&fiveFingerGestures_onceToken, &__block_literal_global_597);
  }
  v2 = (void *)fiveFingerGestures__gestures;

  return (NSSet *)v2;
}

uint64_t __32__VOSGesture_fiveFingerGestures__block_invoke()
{
  fiveFingerGestures__gestures = +[VOSGesture _gesturesForFingerCount:5];

  return MEMORY[0x270F9A758]();
}

+ (NSSet)oneFingerSplitGestures
{
  if (oneFingerSplitGestures_onceToken != -1) {
    dispatch_once(&oneFingerSplitGestures_onceToken, &__block_literal_global_599);
  }
  v2 = (void *)oneFingerSplitGestures__gestures;

  return (NSSet *)v2;
}

uint64_t __36__VOSGesture_oneFingerSplitGestures__block_invoke()
{
  oneFingerSplitGestures__gestures = +[VOSGesture _splitGesturesForFingerCount:1];

  return MEMORY[0x270F9A758]();
}

+ (NSSet)twoFingerSplitGestures
{
  if (twoFingerSplitGestures_onceToken != -1) {
    dispatch_once(&twoFingerSplitGestures_onceToken, &__block_literal_global_601);
  }
  v2 = (void *)twoFingerSplitGestures__gestures;

  return (NSSet *)v2;
}

uint64_t __36__VOSGesture_twoFingerSplitGestures__block_invoke()
{
  twoFingerSplitGestures__gestures = +[VOSGesture _splitGesturesForFingerCount:2];

  return MEMORY[0x270F9A758]();
}

+ (NSSet)conflictingZoomGestures
{
  if (conflictingZoomGestures_onceToken != -1) {
    dispatch_once(&conflictingZoomGestures_onceToken, &__block_literal_global_603);
  }
  v2 = (void *)conflictingZoomGestures__gestures;

  return (NSSet *)v2;
}

void __37__VOSGesture_conflictingZoomGestures__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  id v5 = +[VOSGesture ThreeFingerDoubleTap];
  v1 = +[VOSGesture ThreeFingerTripleTap];
  v2 = +[VOSGesture ThreeFingerQuadrupleTap];
  uint64_t v3 = objc_msgSend(v0, "setWithObjects:", v5, v1, v2, 0);
  id v4 = (void *)conflictingZoomGestures__gestures;
  conflictingZoomGestures__gestures = v3;
}

- (void).cxx_destruct
{
}

@end