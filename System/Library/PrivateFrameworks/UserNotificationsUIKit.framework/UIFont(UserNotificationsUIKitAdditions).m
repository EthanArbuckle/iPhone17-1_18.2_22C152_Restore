@interface UIFont(UserNotificationsUIKitAdditions)
+ (id)unui_excessiveLineHeightChars;
+ (uint64_t)unui_exuberatedValueForValue:()UserNotificationsUIKitAdditions;
- (double)unui_drawingHeightForText:()UserNotificationsUIKitAdditions withNumberOfLines:additionalPadding:;
- (double)unui_measuringHeightForText:()UserNotificationsUIKitAdditions withNumberOfLines:;
- (uint64_t)unui_effectiveLineHeightForText:()UserNotificationsUIKitAdditions;
- (uint64_t)unui_effectiveScaledValueForValue:()UserNotificationsUIKitAdditions hasExuberatedLineHeight:;
- (uint64_t)unui_hasExuberatedLineHeight;
- (uint64_t)unui_hasExuberatedLineHeightForAttributedText:()UserNotificationsUIKitAdditions;
- (uint64_t)unui_hasExuberatedLineHeightForText:()UserNotificationsUIKitAdditions;
- (unint64_t)unui_numberOfLinesForText:()UserNotificationsUIKitAdditions inFrame:maximum:drawingContext:;
@end

@implementation UIFont(UserNotificationsUIKitAdditions)

+ (id)unui_excessiveLineHeightChars
{
  if (unui_excessiveLineHeightChars_onceToken != -1) {
    dispatch_once(&unui_excessiveLineHeightChars_onceToken, &__block_literal_global_28);
  }
  v0 = (void *)unui_excessiveLineHeightChars___excessiveLineHeightChars;

  return v0;
}

+ (uint64_t)unui_exuberatedValueForValue:()UserNotificationsUIKitAdditions
{
  return MEMORY[0x1F40DF4F0]();
}

- (uint64_t)unui_hasExuberatedLineHeight
{
  return MEMORY[0x1F40DF5E0]();
}

- (uint64_t)unui_hasExuberatedLineHeightForText:()UserNotificationsUIKitAdditions
{
  id v4 = a3;
  if ([v4 length] && objc_msgSend(a1, "unui_hasExuberatedLineHeight")) {
    uint64_t v5 = objc_msgSend(v4, "unui_containsExcessiveLineHeightCharacters");
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)unui_hasExuberatedLineHeightForAttributedText:()UserNotificationsUIKitAdditions
{
  id v4 = a3;
  if ([v4 length] && objc_msgSend(a1, "unui_hasExuberatedLineHeight")) {
    uint64_t v5 = objc_msgSend(v4, "unui_containsExcessiveLineHeightCharacters");
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)unui_effectiveScaledValueForValue:()UserNotificationsUIKitAdditions hasExuberatedLineHeight:
{
  if (a4)
  {
    v6 = objc_opt_class();
    [a1 _scaledValueForValue:a2];
    return objc_msgSend(v6, "unui_exuberatedValueForValue:");
  }
  else
  {
    return objc_msgSend(a1, "_scaledValueForValue:");
  }
}

- (uint64_t)unui_effectiveLineHeightForText:()UserNotificationsUIKitAdditions
{
  if (objc_msgSend(a1, "unui_hasExuberatedLineHeightForText:"))
  {
    v2 = objc_opt_class();
    [a1 lineHeight];
    return objc_msgSend(v2, "unui_exuberatedValueForValue:");
  }
  else
  {
    return [a1 lineHeight];
  }
}

- (unint64_t)unui_numberOfLinesForText:()UserNotificationsUIKitAdditions inFrame:maximum:drawingContext:
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v14 = a7;
  id v15 = a9;
  if ([v14 length])
  {
    if (a8 != 1)
    {
      if (!v15)
      {
        id v15 = objc_alloc_init(MEMORY[0x1E4FB0860]);
        [v15 setWantsNumberOfLineFragments:1];
      }
      uint64_t v19 = *MEMORY[0x1E4FB06F8];
      v20[0] = a1;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      objc_msgSend(v14, "boundingRectWithSize:options:attributes:context:", 1, v16, v15, a4, a5);

      if (!a8) {
        a8 = -1;
      }
      unint64_t v17 = [v15 numberOfLineFragments];
      if (a8 >= v17) {
        a8 = v17;
      }
    }
  }
  else
  {
    a8 = 0;
  }

  return a8;
}

- (double)unui_measuringHeightForText:()UserNotificationsUIKitAdditions withNumberOfLines:
{
  double v6 = (double)a4;
  objc_msgSend(a1, "unui_effectiveLineHeightForText:");
  double v8 = v7;
  unint64_t v9 = a4 - 1;
  if (!a4) {
    unint64_t v9 = 0;
  }
  double v10 = (double)v9;
  [a1 leading];
  return v11 * v10 + v6 * v8;
}

- (double)unui_drawingHeightForText:()UserNotificationsUIKitAdditions withNumberOfLines:additionalPadding:
{
  uint64_t v8 = objc_msgSend(a1, "unui_hasExuberatedLineHeightForText:");
  if (v8)
  {
    unint64_t v9 = objc_opt_class();
    [a1 lineHeight];
    objc_msgSend(v9, "unui_exuberatedValueForValue:");
  }
  else
  {
    [a1 lineHeight];
  }
  double v11 = v10;
  objc_msgSend(a1, "unui_effectiveScaledValueForValue:hasExuberatedLineHeight:", v8, a2);
  double v13 = v12;
  [a1 leading];
  return (v13 + v11 + v14) * (double)a5;
}

@end