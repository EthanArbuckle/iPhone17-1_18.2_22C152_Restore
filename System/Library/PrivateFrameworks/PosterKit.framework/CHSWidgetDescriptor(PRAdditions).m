@interface CHSWidgetDescriptor(PRAdditions)
- (BOOL)pr_isVisibilityWidgetDefined:()PRAdditions;
- (BOOL)pr_isVisibleByDefault;
- (uint64_t)pr_shouldDisplayInGallery;
@end

@implementation CHSWidgetDescriptor(PRAdditions)

- (uint64_t)pr_shouldDisplayInGallery
{
  v2 = objc_alloc_init(PRChronoDefaultsDomain);
  if ([(PRChronoDefaultsDomain *)v2 shouldShowInternalWidgets])
  {
    uint64_t v3 = 1;
  }
  else if (objc_msgSend(a1, "pr_isVisibilityWidgetDefined:", objc_msgSend(a1, "widgetVisibility")))
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CB18]);
    v5 = [a1 extensionBundleIdentifier];
    v6 = (void *)[v4 initWithSuiteName:v5];

    uint64_t v7 = *MEMORY[0x1E4F58C10];
    v8 = [v6 objectForKey:*MEMORY[0x1E4F58C10]];

    if (v8) {
      uint64_t v9 = [v6 BOOLForKey:v7];
    }
    else {
      uint64_t v9 = objc_msgSend(a1, "pr_isVisibleByDefault");
    }
    uint64_t v3 = v9;
  }
  else
  {
    uint64_t v3 = [a1 isInternal] ^ 1;
  }

  return v3;
}

- (BOOL)pr_isVisibilityWidgetDefined:()PRAdditions
{
  return a3 > 1;
}

- (BOOL)pr_isVisibleByDefault
{
  return (([a1 widgetVisibility] - 1) & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

@end