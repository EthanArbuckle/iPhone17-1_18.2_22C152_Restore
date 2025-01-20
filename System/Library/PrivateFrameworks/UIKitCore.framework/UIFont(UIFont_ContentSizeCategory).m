@interface UIFont(UIFont_ContentSizeCategory)
+ (id)_normalizedContentSizeCategory:()UIFont_ContentSizeCategory default:;
+ (id)preferredContentSizeCategory;
+ (uint64_t)_preferredContentSizeCategory:()UIFont_ContentSizeCategory;
@end

@implementation UIFont(UIFont_ContentSizeCategory)

+ (id)_normalizedContentSizeCategory:()UIFont_ContentSizeCategory default:
{
  id v5 = a3;
  v6 = v5;
  if (!v5 || [v5 isEqualToString:@"_UICTContentSizeCategoryUnspecified"])
  {
    if (a4)
    {
      v7 = objc_opt_class();
    }
    else
    {
      v8 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
      uint64_t v9 = [v8 userInterfaceIdiom];

      v10 = +[UIContentSizeCategoryPreference system];
      v11 = v10;
      if (v9 == 3) {
        [v10 preferredContentSizeCategoryCarPlay];
      }
      else {
      v12 = [v10 preferredContentSizeCategory];
      }

      if (![v12 isEqualToString:@"_UICTContentSizeCategoryUnspecified"]) {
        goto LABEL_11;
      }
      v7 = objc_opt_class();
      v6 = v12;
    }
    v12 = [v7 _defaultContentSizeCategory];

LABEL_11:
    v6 = v12;
  }
  return v6;
}

+ (uint64_t)_preferredContentSizeCategory:()UIFont_ContentSizeCategory
{
  return objc_msgSend((id)UIApp, "_preferredContentSizeCategory:");
}

+ (id)preferredContentSizeCategory
{
  v0 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  uint64_t v1 = [v0 userInterfaceIdiom];

  v2 = +[UIContentSizeCategoryPreference system];
  v3 = v2;
  if (v1 == 3) {
    [v2 preferredContentSizeCategoryCarPlay];
  }
  else {
  v4 = [v2 preferredContentSizeCategory];
  }

  return v4;
}

@end