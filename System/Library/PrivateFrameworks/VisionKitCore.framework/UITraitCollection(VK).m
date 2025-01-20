@interface UITraitCollection(VK)
- (BOOL)vk_hasCompactHeight;
- (BOOL)vk_hasCompactWidth;
- (BOOL)vk_hasEqualSizeToTraitCollection:()VK;
- (BOOL)vk_isDark;
- (BOOL)vk_isOptimizedForMac;
- (BOOL)vk_isRTL;
- (BOOL)vk_shouldUseLargeButtons;
- (double)vk_contentSizeScaleFactor;
- (id)vk_traitCollectionClampedToNonaccessibilityContentSize;
- (id)vk_traitCollectionWithContentSize:()VK;
- (uint64_t)vk_hasCompactSize;
@end

@implementation UITraitCollection(VK)

- (BOOL)vk_shouldUseLargeButtons
{
  v1 = [a1 preferredContentSizeCategory];
  BOOL v2 = ([v1 isEqualToString:*MEMORY[0x1E4F437A8]] & 1) == 0
    && ([v1 isEqualToString:*MEMORY[0x1E4F437C8]] & 1) == 0
    && ([v1 isEqualToString:*MEMORY[0x1E4F437B8]] & 1) == 0
    && ([v1 isEqualToString:*MEMORY[0x1E4F437B0]] & 1) == 0
    && ![v1 isEqualToString:*MEMORY[0x1E4F437A0]];

  return v2;
}

- (id)vk_traitCollectionWithContentSize:()VK
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__UITraitCollection_VK__vk_traitCollectionWithContentSize___block_invoke;
  v8[3] = &unk_1E6BF2440;
  id v9 = v4;
  id v5 = v4;
  v6 = [a1 traitCollectionByModifyingTraits:v8];

  return v6;
}

- (uint64_t)vk_hasCompactSize
{
  if (objc_msgSend(a1, "vk_hasCompactWidth")) {
    return 1;
  }
  return objc_msgSend(a1, "vk_hasCompactHeight");
}

- (BOOL)vk_hasCompactHeight
{
  return [a1 verticalSizeClass] == 1;
}

- (BOOL)vk_hasCompactWidth
{
  return [a1 horizontalSizeClass] == 1;
}

- (BOOL)vk_isOptimizedForMac
{
  return [a1 userInterfaceIdiom] == 5;
}

- (BOOL)vk_isDark
{
  return [a1 userInterfaceStyle] == 2;
}

- (BOOL)vk_isRTL
{
  return [a1 layoutDirection] == 1;
}

- (BOOL)vk_hasEqualSizeToTraitCollection:()VK
{
  id v4 = a3;
  uint64_t v5 = [a1 horizontalSizeClass];
  if (v5 == [v4 horizontalSizeClass])
  {
    uint64_t v6 = [a1 verticalSizeClass];
    BOOL v7 = v6 == [v4 verticalSizeClass];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)vk_traitCollectionClampedToNonaccessibilityContentSize
{
  id v1 = a1;
  BOOL v2 = [v1 preferredContentSizeCategory];
  if (([v2 isEqualToString:*MEMORY[0x1E4F43778]] & 1) != 0
    || ([v2 isEqualToString:*MEMORY[0x1E4F43770]] & 1) != 0
    || ([v2 isEqualToString:*MEMORY[0x1E4F43768]] & 1) != 0
    || [v2 isEqualToString:*MEMORY[0x1E4F43760]])
  {
    uint64_t v3 = [v1 traitCollectionByModifyingTraits:&__block_literal_global_14];

    id v1 = (id)v3;
  }

  return v1;
}

- (double)vk_contentSizeScaleFactor
{
  id v1 = [a1 preferredContentSizeCategory];
  if (v1 == (void *)*MEMORY[0x1E4F437A8])
  {
    double v2 = 0.8;
  }
  else if (v1 == (void *)*MEMORY[0x1E4F437C8])
  {
    double v2 = 0.85;
  }
  else if (v1 == (void *)*MEMORY[0x1E4F437B8])
  {
    double v2 = 0.9;
  }
  else
  {
    double v2 = 1.0;
    if (v1 != (void *)*MEMORY[0x1E4F437B0] && v1 != (void *)*MEMORY[0x1E4F437D0])
    {
      if (v1 == (void *)*MEMORY[0x1E4F437A0])
      {
        double v2 = 1.1;
      }
      else if (v1 == (void *)*MEMORY[0x1E4F43798])
      {
        double v2 = 1.2;
      }
      else if (v1 == (void *)*MEMORY[0x1E4F43790])
      {
        double v2 = 1.35;
      }
      else if (v1 == (void *)*MEMORY[0x1E4F43780])
      {
        double v2 = 1.6;
      }
      else if (v1 == (void *)*MEMORY[0x1E4F43778])
      {
        double v2 = 1.9;
      }
      else if (v1 == (void *)*MEMORY[0x1E4F43770])
      {
        double v2 = 2.35;
      }
      else if (v1 == (void *)*MEMORY[0x1E4F43768])
      {
        double v2 = 2.75;
      }
      else if (v1 == (void *)*MEMORY[0x1E4F43760])
      {
        double v2 = 3.1;
      }
      else
      {
        double v2 = 1.0;
      }
    }
  }

  return v2;
}

@end