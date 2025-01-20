@interface UIAccessibilityCustomAction(Private)
- (id)_accessibilityAXAttributedName;
- (id)_accessibilityCustomActionIdentifier;
- (id)_accessibilityInternalCustomActionIdentifier;
- (id)_shortName;
- (id)localizedActionRotorCategory;
- (uint64_t)_accessibilityMatchesCustomActionIdentifier:()Private;
- (uint64_t)_accessibilitySetInternalCustomActionIdentifier:()Private;
- (uint64_t)_setShortName:()Private;
- (uint64_t)activationPoint;
- (uint64_t)ignoreWhenVoiceOverTouches;
- (uint64_t)setActivationPoint:()Private;
- (uint64_t)setIgnoreWhenVoiceOverTouches:()Private;
- (uint64_t)setLocalizedActionRotorCategory:()Private;
- (uint64_t)setShouldPersistActionMenu:()Private;
- (uint64_t)setShouldSuppressActionHint:()Private;
- (uint64_t)setSortPriority:()Private;
- (uint64_t)shouldPersistActionMenu;
- (uint64_t)shouldSuppressActionHint;
- (uint64_t)sortPriority;
@end

@implementation UIAccessibilityCustomAction(Private)

- (id)_shortName
{
  return objc_getAssociatedObject(a1, &__UIAccessibilityCustomAction___shortName);
}

- (uint64_t)_setShortName:()Private
{
  return __UIAccessibilitySetAssociatedObject();
}

- (id)_accessibilityInternalCustomActionIdentifier
{
  return objc_getAssociatedObject(a1, &__UIAccessibilityCustomAction___accessibilityInternalCustomActionIdentifier);
}

- (uint64_t)_accessibilitySetInternalCustomActionIdentifier:()Private
{
  return __UIAccessibilitySetAssociatedObject();
}

- (uint64_t)shouldSuppressActionHint
{
  return MEMORY[0x1F4106398](a1, &__UIAccessibilityCustomAction__shouldSuppressActionHint);
}

- (uint64_t)setShouldSuppressActionHint:()Private
{
  return MEMORY[0x1F41063D0](a1, &__UIAccessibilityCustomAction__shouldSuppressActionHint);
}

- (uint64_t)ignoreWhenVoiceOverTouches
{
  return MEMORY[0x1F4106398](a1, &__UIAccessibilityCustomAction__ignoreWhenVoiceOverTouches);
}

- (uint64_t)setIgnoreWhenVoiceOverTouches:()Private
{
  return MEMORY[0x1F41063D0](a1, &__UIAccessibilityCustomAction__ignoreWhenVoiceOverTouches);
}

- (id)localizedActionRotorCategory
{
  return objc_getAssociatedObject(a1, &__UIAccessibilityCustomAction__localizedActionRotorCategory);
}

- (uint64_t)setLocalizedActionRotorCategory:()Private
{
  return __UIAccessibilitySetAssociatedObject();
}

- (uint64_t)sortPriority
{
  return MEMORY[0x1F41063C0](a1, &__UIAccessibilityCustomAction__sortPriority);
}

- (uint64_t)setSortPriority:()Private
{
  return MEMORY[0x1F4106400](a1, &__UIAccessibilityCustomAction__sortPriority);
}

- (uint64_t)activationPoint
{
  return MEMORY[0x1F41063A0](a1, &__UIAccessibilityCustomAction__activationPoint);
}

- (uint64_t)setActivationPoint:()Private
{
  return MEMORY[0x1F41063D8](a1, &__UIAccessibilityCustomAction__activationPoint);
}

- (uint64_t)shouldPersistActionMenu
{
  return MEMORY[0x1F4106398](a1, &__UIAccessibilityCustomAction__shouldPersistActionMenu);
}

- (uint64_t)setShouldPersistActionMenu:()Private
{
  return MEMORY[0x1F41063D0](a1, &__UIAccessibilityCustomAction__shouldPersistActionMenu);
}

- (id)_accessibilityCustomActionIdentifier
{
  v2 = [a1 _accessibilityInternalCustomActionIdentifier];

  if (v2)
  {
    v3 = [a1 _accessibilityInternalCustomActionIdentifier];
  }
  else
  {
    v4 = NSString;
    v5 = [a1 _accessibilityAXAttributedName];
    v6 = [a1 target];
    v7 = NSStringFromSelector((SEL)[a1 selector]);
    v3 = [v4 stringWithFormat:@"Name:%@\nTarget:%p\nSelector:%@", v5, v6, v7];
  }

  return v3;
}

- (uint64_t)_accessibilityMatchesCustomActionIdentifier:()Private
{
  id v4 = a3;
  v5 = [a1 _accessibilityCustomActionIdentifier];
  uint64_t v6 = [v5 isEqualToString:v4];

  return v6;
}

- (id)_accessibilityAXAttributedName
{
  if (_accessibilityAXAttributedName_onceToken_0 != -1) {
    dispatch_once(&_accessibilityAXAttributedName_onceToken_0, &__block_literal_global_2);
  }
  v2 = (objc_class *)objc_opt_class();
  v3 = sel_name;
  Method InstanceMethod = class_getInstanceMethod(v2, sel_name);
  v5 = (objc_class *)objc_opt_class();
  Method v6 = class_getInstanceMethod(v5, sel_attributedName);
  BOOL v7 = InstanceMethod != (Method)_accessibilityAXAttributedName_baseNameMethod_0
    && v6 == (Method)_accessibilityAXAttributedName_baseAttributedNameMethod_0;
  if (v7) {
    v8 = sel_name;
  }
  else {
    v8 = sel_attributedName;
  }
  if (v7) {
    v3 = sel_attributedName;
  }
  v9 = (void (*)(void *, char *))[a1 impOrNullForSelector:v8];
  if (!v9 || (v9(a1, v8), (v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v11 = (void (*)(void *, char *))[a1 impOrNullForSelector:v3];
    if (v11)
    {
      v10 = v11(a1, v3);
    }
    else
    {
      v10 = 0;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F488F0]) initWithCFAttributedString:v10];

    v10 = (void *)v12;
  }

  return v10;
}

@end