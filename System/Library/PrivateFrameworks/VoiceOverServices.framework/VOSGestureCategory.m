@interface VOSGestureCategory
+ (BOOL)isFlickGesture:(id)a3;
+ (BOOL)isRotateGesture:(id)a3;
+ (BOOL)isScrubGesture:(id)a3;
+ (BOOL)isSplitFlickGesture:(id)a3;
+ (BOOL)isTapAndHoldGesture:(id)a3;
+ (BOOL)isTapGesture:(id)a3;
+ (NSArray)allCategories;
+ (VOSGestureCategory)backTaps;
+ (VOSGestureCategory)fiveFingerTaps;
+ (VOSGestureCategory)fourFingerFlicks;
+ (VOSGestureCategory)fourFingerTaps;
+ (VOSGestureCategory)oneFingerFlicks;
+ (VOSGestureCategory)oneFingerSplitFlicks;
+ (VOSGestureCategory)oneFingerTapAndHolds;
+ (VOSGestureCategory)oneFingerTaps;
+ (VOSGestureCategory)threeFingerDoubleTapHoldAndFlicks;
+ (VOSGestureCategory)threeFingerFlicks;
+ (VOSGestureCategory)threeFingerTapAndHolds;
+ (VOSGestureCategory)threeFingerTaps;
+ (VOSGestureCategory)twoFingerFlicks;
+ (VOSGestureCategory)twoFingerPinches;
+ (VOSGestureCategory)twoFingerRotates;
+ (VOSGestureCategory)twoFingerScrubs;
+ (VOSGestureCategory)twoFingerSplitFlicks;
+ (VOSGestureCategory)twoFingerTapAndHolds;
+ (VOSGestureCategory)twoFingerTaps;
- (BOOL)containsGesture:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)gestures;
- (NSString)localizedCategoryName;
- (VOSGestureCategory)init;
- (VOSGestureCategory)initWithGestures:(id)a3 localizedCategoryName:(id)a4;
- (unint64_t)hash;
- (void)setGestures:(id)a3;
- (void)setLocalizedCategoryName:(id)a3;
@end

@implementation VOSGestureCategory

+ (VOSGestureCategory)oneFingerTaps
{
  v11[4] = *MEMORY[0x263EF8340];
  v2 = +[VOSGesture OneFingerSingleTap];
  v11[0] = v2;
  v3 = +[VOSGesture OneFingerDoubleTap];
  v11[1] = v3;
  v4 = +[VOSGesture OneFingerTripleTap];
  v11[2] = v4;
  v5 = +[VOSGesture OneFingerQuadrupleTap];
  v11[3] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];

  v7 = [VOSGestureCategory alloc];
  v8 = VOSLocString(@"VOSGestureCategory.OneFingerTaps");
  v9 = [(VOSGestureCategory *)v7 initWithGestures:v6 localizedCategoryName:v8];

  return v9;
}

+ (VOSGestureCategory)twoFingerTaps
{
  v14[7] = *MEMORY[0x263EF8340];
  v2 = +[VOSGesture TwoFingerSingleTap];
  v3 = +[VOSGesture TwoFingerDoubleTap];
  v14[1] = v3;
  v4 = +[VOSGesture TwoFingerTripleTap];
  v14[2] = v4;
  v5 = +[VOSGesture TwoFingerQuadrupleTap];
  v14[3] = v5;
  v6 = +[VOSGesture TwoDistantFingerSingleTap];
  v14[4] = v6;
  v7 = +[VOSGesture TwoDistantFingerDoubleTap];
  v14[5] = v7;
  v8 = +[VOSGesture TwoDistantFingerTripleTap];
  v14[6] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:7];

  v10 = [VOSGestureCategory alloc];
  v11 = VOSLocString(@"VOSGestureCategory.TwoFingerTaps");
  v12 = [(VOSGestureCategory *)v10 initWithGestures:v9 localizedCategoryName:v11];

  return v12;
}

+ (VOSGestureCategory)threeFingerTaps
{
  v11[4] = *MEMORY[0x263EF8340];
  v2 = +[VOSGesture ThreeFingerSingleTap];
  v11[0] = v2;
  v3 = +[VOSGesture ThreeFingerDoubleTap];
  v11[1] = v3;
  v4 = +[VOSGesture ThreeFingerTripleTap];
  v11[2] = v4;
  v5 = +[VOSGesture ThreeFingerQuadrupleTap];
  v11[3] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];

  v7 = [VOSGestureCategory alloc];
  v8 = VOSLocString(@"VOSGestureCategory.ThreeFingerTaps");
  v9 = [(VOSGestureCategory *)v7 initWithGestures:v6 localizedCategoryName:v8];

  return v9;
}

+ (VOSGestureCategory)fourFingerTaps
{
  v11[4] = *MEMORY[0x263EF8340];
  v2 = +[VOSGesture FourFingerSingleTap];
  v11[0] = v2;
  v3 = +[VOSGesture FourFingerDoubleTap];
  v11[1] = v3;
  v4 = +[VOSGesture FourFingerTripleTap];
  v11[2] = v4;
  v5 = +[VOSGesture FourFingerQuadrupleTap];
  v11[3] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];

  v7 = [VOSGestureCategory alloc];
  v8 = VOSLocString(@"VOSGestureCategory.FourFingerTaps");
  v9 = [(VOSGestureCategory *)v7 initWithGestures:v6 localizedCategoryName:v8];

  return v9;
}

+ (VOSGestureCategory)fiveFingerTaps
{
  v11[4] = *MEMORY[0x263EF8340];
  v2 = +[VOSGesture FiveFingerSingleTap];
  v11[0] = v2;
  v3 = +[VOSGesture FiveFingerDoubleTap];
  v11[1] = v3;
  v4 = +[VOSGesture FiveFingerTripleTap];
  v11[2] = v4;
  v5 = +[VOSGesture FiveFingerQuadrupleTap];
  v11[3] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];

  v7 = [VOSGestureCategory alloc];
  v8 = VOSLocString(@"VOSGestureCategory.FiveFingerTaps");
  v9 = [(VOSGestureCategory *)v7 initWithGestures:v6 localizedCategoryName:v8];

  return v9;
}

+ (VOSGestureCategory)oneFingerFlicks
{
  v11[4] = *MEMORY[0x263EF8340];
  v2 = +[VOSGesture OneFingerFlickLeft];
  v11[0] = v2;
  v3 = +[VOSGesture OneFingerFlickRight];
  v11[1] = v3;
  v4 = +[VOSGesture OneFingerFlickUp];
  v11[2] = v4;
  v5 = +[VOSGesture OneFingerFlickDown];
  v11[3] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];

  v7 = [VOSGestureCategory alloc];
  v8 = VOSLocString(@"VOSGestureCategory.OneFingerSwipes");
  v9 = [(VOSGestureCategory *)v7 initWithGestures:v6 localizedCategoryName:v8];

  return v9;
}

+ (VOSGestureCategory)twoFingerFlicks
{
  v11[4] = *MEMORY[0x263EF8340];
  v2 = +[VOSGesture TwoFingerFlickLeft];
  v11[0] = v2;
  v3 = +[VOSGesture TwoFingerFlickRight];
  v11[1] = v3;
  v4 = +[VOSGesture TwoFingerFlickUp];
  v11[2] = v4;
  v5 = +[VOSGesture TwoFingerFlickDown];
  v11[3] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];

  v7 = [VOSGestureCategory alloc];
  v8 = VOSLocString(@"VOSGestureCategory.TwoFingerSwipes");
  v9 = [(VOSGestureCategory *)v7 initWithGestures:v6 localizedCategoryName:v8];

  return v9;
}

+ (VOSGestureCategory)threeFingerFlicks
{
  v11[4] = *MEMORY[0x263EF8340];
  v2 = +[VOSGesture ThreeFingerFlickLeft];
  v11[0] = v2;
  v3 = +[VOSGesture ThreeFingerFlickRight];
  v11[1] = v3;
  v4 = +[VOSGesture ThreeFingerFlickUp];
  v11[2] = v4;
  v5 = +[VOSGesture ThreeFingerFlickDown];
  v11[3] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];

  v7 = [VOSGestureCategory alloc];
  v8 = VOSLocString(@"VOSGestureCategory.ThreeFingerSwipes");
  v9 = [(VOSGestureCategory *)v7 initWithGestures:v6 localizedCategoryName:v8];

  return v9;
}

+ (VOSGestureCategory)fourFingerFlicks
{
  v11[4] = *MEMORY[0x263EF8340];
  v2 = +[VOSGesture FourFingerFlickLeft];
  v11[0] = v2;
  v3 = +[VOSGesture FourFingerFlickRight];
  v11[1] = v3;
  v4 = +[VOSGesture FourFingerFlickUp];
  v11[2] = v4;
  v5 = +[VOSGesture FourFingerFlickDown];
  v11[3] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];

  v7 = [VOSGestureCategory alloc];
  v8 = VOSLocString(@"VOSGestureCategory.FourFingerSwipes");
  v9 = [(VOSGestureCategory *)v7 initWithGestures:v6 localizedCategoryName:v8];

  return v9;
}

+ (VOSGestureCategory)twoFingerRotates
{
  v9[2] = *MEMORY[0x263EF8340];
  v2 = +[VOSGesture TwoFingerRotateCounterclockwise];
  v9[0] = v2;
  v3 = +[VOSGesture TwoFingerRotateClockwise];
  v9[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];

  v5 = [VOSGestureCategory alloc];
  v6 = VOSLocString(@"VOSGestureCategory.TwoFingerRotate");
  v7 = [(VOSGestureCategory *)v5 initWithGestures:v4 localizedCategoryName:v6];

  return v7;
}

+ (VOSGestureCategory)twoFingerScrubs
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = +[VOSGesture TwoFingerScrub];
  v8[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  v4 = [VOSGestureCategory alloc];
  v5 = VOSLocString(@"VOSGestureCategory.TwoFingerScrub");
  v6 = [(VOSGestureCategory *)v4 initWithGestures:v3 localizedCategoryName:v5];

  return v6;
}

+ (VOSGestureCategory)twoFingerPinches
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = +[VOSGesture TwoFingerPinch];
  v8[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  v4 = [VOSGestureCategory alloc];
  v5 = VOSLocString(@"VOSGestureCategory.TwoFingerPinch");
  v6 = [(VOSGestureCategory *)v4 initWithGestures:v3 localizedCategoryName:v5];

  return v6;
}

+ (VOSGestureCategory)oneFingerTapAndHolds
{
  v9[2] = *MEMORY[0x263EF8340];
  v2 = +[VOSGesture OneFingerSingleTapAndHold];
  v9[0] = v2;
  v3 = +[VOSGesture OneFingerDoubleTapAndHold];
  v9[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];

  v5 = [VOSGestureCategory alloc];
  v6 = VOSLocString(@"VOSGestureCategory.OneFingerTapAndHold");
  v7 = [(VOSGestureCategory *)v5 initWithGestures:v4 localizedCategoryName:v6];

  return v7;
}

+ (VOSGestureCategory)twoFingerTapAndHolds
{
  v9[2] = *MEMORY[0x263EF8340];
  v2 = +[VOSGesture TwoFingerSingleTapAndHold];
  v9[0] = v2;
  v3 = +[VOSGesture TwoFingerDoubleTapAndHold];
  v9[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];

  v5 = [VOSGestureCategory alloc];
  v6 = VOSLocString(@"VOSGestureCategory.TwoFingerTapAndHold");
  v7 = [(VOSGestureCategory *)v5 initWithGestures:v4 localizedCategoryName:v6];

  return v7;
}

+ (VOSGestureCategory)threeFingerTapAndHolds
{
  v9[2] = *MEMORY[0x263EF8340];
  v2 = +[VOSGesture ThreeFingerSingleTapAndHold];
  v9[0] = v2;
  v3 = +[VOSGesture ThreeFingerDoubleTapAndHold];
  v9[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];

  v5 = [VOSGestureCategory alloc];
  v6 = VOSLocString(@"VOSGestureCategory.ThreeFingerTapAndHold");
  v7 = [(VOSGestureCategory *)v5 initWithGestures:v4 localizedCategoryName:v6];

  return v7;
}

+ (VOSGestureCategory)threeFingerDoubleTapHoldAndFlicks
{
  v11[4] = *MEMORY[0x263EF8340];
  v2 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickUp];
  v11[0] = v2;
  v3 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickLeft];
  v11[1] = v3;
  v4 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickDown];
  v11[2] = v4;
  v5 = +[VOSGesture ThreeFingerDoubleTapHoldAndFlickRight];
  v11[3] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];

  v7 = [VOSGestureCategory alloc];
  v8 = VOSLocString(@"VOSGestureCategory.ThreeFingerDoubleTapHoldAndFlick");
  v9 = [(VOSGestureCategory *)v7 initWithGestures:v6 localizedCategoryName:v8];

  return v9;
}

+ (VOSGestureCategory)oneFingerSplitFlicks
{
  v11[4] = *MEMORY[0x263EF8340];
  v2 = +[VOSGesture OneFingerSplitFlickLeft];
  v11[0] = v2;
  v3 = +[VOSGesture OneFingerSplitFlickRight];
  v11[1] = v3;
  v4 = +[VOSGesture OneFingerSplitFlickUp];
  v11[2] = v4;
  v5 = +[VOSGesture OneFingerSplitFlickDown];
  v11[3] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];

  v7 = [VOSGestureCategory alloc];
  v8 = VOSLocString(@"VOSGestureCategory.OneFingerSplitSwipes");
  v9 = [(VOSGestureCategory *)v7 initWithGestures:v6 localizedCategoryName:v8];

  return v9;
}

+ (VOSGestureCategory)twoFingerSplitFlicks
{
  v9[2] = *MEMORY[0x263EF8340];
  v2 = +[VOSGesture TwoFingerSplitFlickLeft];
  v9[0] = v2;
  v3 = +[VOSGesture TwoFingerSplitFlickRight];
  v9[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];

  v5 = [VOSGestureCategory alloc];
  v6 = VOSLocString(@"VOSGestureCategory.TwoFingerSplitSwipes");
  v7 = [(VOSGestureCategory *)v5 initWithGestures:v4 localizedCategoryName:v6];

  return v7;
}

+ (VOSGestureCategory)backTaps
{
  v9[2] = *MEMORY[0x263EF8340];
  if (AXDeviceSupportsBackTap())
  {
    v2 = +[VOSGesture BackTapDoubleTap];
    v9[0] = v2;
    v3 = +[VOSGesture BackTapTripleTap];
    v9[1] = v3;
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  }
  else
  {
    v4 = (void *)MEMORY[0x263EFFA68];
  }
  v5 = [VOSGestureCategory alloc];
  v6 = VOSLocString(@"VOSGestureCategory.BackTap");
  v7 = [(VOSGestureCategory *)v5 initWithGestures:v4 localizedCategoryName:v6];

  return v7;
}

+ (NSArray)allCategories
{
  v24[18] = *MEMORY[0x263EF8340];
  v23 = +[VOSGestureCategory oneFingerTaps];
  v24[0] = v23;
  v22 = +[VOSGestureCategory twoFingerTaps];
  v24[1] = v22;
  v21 = +[VOSGestureCategory threeFingerTaps];
  v24[2] = v21;
  v20 = +[VOSGestureCategory fourFingerTaps];
  v24[3] = v20;
  v19 = +[VOSGestureCategory fiveFingerTaps];
  v24[4] = v19;
  v18 = +[VOSGestureCategory oneFingerFlicks];
  v24[5] = v18;
  v17 = +[VOSGestureCategory twoFingerFlicks];
  v24[6] = v17;
  v16 = +[VOSGestureCategory threeFingerFlicks];
  v24[7] = v16;
  v15 = +[VOSGestureCategory fourFingerFlicks];
  v24[8] = v15;
  v14 = +[VOSGestureCategory twoFingerRotates];
  v24[9] = v14;
  v2 = +[VOSGestureCategory twoFingerScrubs];
  v24[10] = v2;
  v3 = +[VOSGestureCategory twoFingerPinches];
  v24[11] = v3;
  v4 = +[VOSGestureCategory oneFingerTapAndHolds];
  v24[12] = v4;
  v5 = +[VOSGestureCategory twoFingerTapAndHolds];
  v24[13] = v5;
  v6 = +[VOSGestureCategory threeFingerTapAndHolds];
  v24[14] = v6;
  v7 = +[VOSGestureCategory threeFingerDoubleTapHoldAndFlicks];
  v24[15] = v7;
  v8 = +[VOSGestureCategory oneFingerSplitFlicks];
  v24[16] = v8;
  v9 = +[VOSGestureCategory twoFingerSplitFlicks];
  v24[17] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:18];

  if (AXDeviceSupportsBackTap())
  {
    v11 = +[VOSGestureCategory backTaps];
    uint64_t v12 = [v10 arrayByAddingObject:v11];

    v10 = (void *)v12;
  }

  return (NSArray *)v10;
}

- (VOSGestureCategory)initWithGestures:(id)a3 localizedCategoryName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VOSGestureCategory;
  v8 = [(VOSGestureCategory *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(VOSGestureCategory *)v8 setLocalizedCategoryName:v7];
    [(VOSGestureCategory *)v9 setGestures:v6];
  }

  return v9;
}

- (VOSGestureCategory)init
{
  v3 = [MEMORY[0x263EFF8C0] array];
  v4 = [(VOSGestureCategory *)self initWithGestures:v3 localizedCategoryName:&stru_26CC86DC0];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(VOSGestureCategory *)self gestures];
    id v7 = [v5 gestures];

    char v8 = [v6 isEqualToArray:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(VOSGestureCategory *)self gestures];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 ^= [*(id *)(*((void *)&v9 + 1) + 8 * i) hash];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)containsGesture:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(VOSGestureCategory *)self gestures];
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (BOOL)isFlickGesture:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [a1 oneFingerFlicks];
  if ([v5 containsGesture:v4])
  {
    char v6 = 1;
  }
  else
  {
    id v7 = [a1 twoFingerFlicks];
    if ([v7 containsGesture:v4])
    {
      char v6 = 1;
    }
    else
    {
      char v8 = [a1 threeFingerFlicks];
      if ([v8 containsGesture:v4])
      {
        char v6 = 1;
      }
      else
      {
        long long v9 = [a1 fourFingerFlicks];
        char v6 = [v9 containsGesture:v4];
      }
    }
  }
  return v6;
}

+ (BOOL)isTapGesture:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [a1 oneFingerTaps];
  if ([v5 containsGesture:v4])
  {
    char v6 = 1;
  }
  else
  {
    id v7 = [a1 twoFingerTaps];
    if ([v7 containsGesture:v4])
    {
      char v6 = 1;
    }
    else
    {
      char v8 = [a1 threeFingerTaps];
      if ([v8 containsGesture:v4])
      {
        char v6 = 1;
      }
      else
      {
        long long v9 = [a1 fourFingerTaps];
        if ([v9 containsGesture:v4])
        {
          char v6 = 1;
        }
        else
        {
          long long v10 = [a1 fiveFingerTaps];
          char v6 = [v10 containsGesture:v4];
        }
      }
    }
  }

  return v6;
}

+ (BOOL)isRotateGesture:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [a1 twoFingerRotates];
  char v6 = [v5 containsGesture:v4];

  return v6;
}

+ (BOOL)isScrubGesture:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [a1 twoFingerScrubs];
  char v6 = [v5 containsGesture:v4];

  return v6;
}

+ (BOOL)isTapAndHoldGesture:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [a1 oneFingerTapAndHolds];
  if ([v5 containsGesture:v4])
  {
    char v6 = 1;
  }
  else
  {
    id v7 = [a1 twoFingerTapAndHolds];
    if ([v7 containsGesture:v4])
    {
      char v6 = 1;
    }
    else
    {
      char v8 = [a1 threeFingerTapAndHolds];
      char v6 = [v8 containsGesture:v4];
    }
  }

  return v6;
}

+ (BOOL)isSplitFlickGesture:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [a1 oneFingerSplitFlicks];
  if ([v5 containsGesture:v4])
  {
    char v6 = 1;
  }
  else
  {
    id v7 = [a1 twoFingerSplitFlicks];
    char v6 = [v7 containsGesture:v4];
  }
  return v6;
}

- (NSArray)gestures
{
  return self->_gestures;
}

- (void)setGestures:(id)a3
{
}

- (NSString)localizedCategoryName
{
  return self->_localizedCategoryName;
}

- (void)setLocalizedCategoryName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedCategoryName, 0);

  objc_storeStrong((id *)&self->_gestures, 0);
}

@end