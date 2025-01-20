@interface NSObjectAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityElementsHidden;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityPerformMagicTap;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)accessibilityViewIsModal;
- (BOOL)isAccessibilityElement;
- (BOOL)shouldGroupAccessibilityChildren;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (id)_accessibilityCapturedImages;
- (id)accessibilityCustomActions;
- (id)accessibilityElementAtIndex:(int64_t)a3;
- (id)accessibilityElements;
- (id)accessibilityHeaderElements;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityLanguage;
- (id)accessibilityNextTextNavigationElement;
- (id)accessibilityPath;
- (id)accessibilityPreviousTextNavigationElement;
- (id)accessibilityTextInputResponder;
- (id)accessibilityUserDefinedActivationPoint;
- (id)accessibilityUserDefinedContainer;
- (id)accessibilityUserDefinedDragSourceDescriptors;
- (id)accessibilityUserDefinedDropPointDescriptors;
- (id)accessibilityUserDefinedFrame;
- (id)accessibilityUserDefinedHint;
- (id)accessibilityUserDefinedIdentifier;
- (id)accessibilityUserDefinedLabel;
- (id)accessibilityUserDefinedLanguage;
- (id)accessibilityUserDefinedShouldGroupChildren;
- (id)accessibilityUserDefinedTraits;
- (id)accessibilityUserDefinedValue;
- (id)accessibilityUserInputLabels;
- (id)accessibilityValue;
- (id)automationElements;
- (id)isAccessibilityUserDefinedElement;
- (id)storedAccessibilityElementsHidden;
- (id)storedAccessibilityViewIsModal;
- (id)storedShouldGroupAccessibilityChildren;
- (int64_t)accessibilityElementCount;
- (int64_t)accessibilityNavigationStyle;
- (int64_t)indexOfAccessibilityElement:(id)a3;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)accessibilityLabel;
- (void)setAccessibilityElements:(id)a3;
- (void)setAccessibilityHint:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityValue:(id)a3;
- (void)setAutomationElements:(id)a3;
@end

@implementation NSObjectAccessibility

- (void)setAccessibilityLabel:(id)a3
{
  id v4 = a3;
  if ([v4 isAXAttributedString]) {
    -[NSObjectAccessibility setAccessibilityAttributedLabel:](&v6, sel_setAccessibilityAttributedLabel_, [v4 cfAttributedString], v5.receiver, v5.super_class, self, NSObjectAccessibility);
  }
  else {
    -[NSObjectAccessibility setAccessibilityLabel:](&v5, sel_setAccessibilityLabel_, v4, self, NSObjectAccessibility, v6.receiver, v6.super_class);
  }
}

- (id)accessibilityLabel
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:1];
  id v4 = (void *)v3;
  if (v3)
  {
    objc_super v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
    goto LABEL_12;
  }
  v9.receiver = self;
  v9.super_class = (Class)NSObjectAccessibility;
  objc_super v6 = [(NSObjectAccessibility *)&v9 accessibilityAttributedLabel];
  if (!v6) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = AXRuntimeLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[NSObjectAccessibility accessibilityLabel]();
      }
    }
LABEL_10:
    objc_super v5 = 0;
    goto LABEL_11;
  }
  objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4F488F0]) initWithCFAttributedString:v6];
LABEL_11:

LABEL_12:

  return v5;
}

- (id)accessibilityLanguage
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:9];
  id v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    uint64_t v5 = [(NSObjectAccessibility *)&v8 accessibilityLanguage];
  }
  objc_super v6 = (void *)v5;

  return v6;
}

- (id)accessibilityUserDefinedLabel
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:1];
  id v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
    goto LABEL_12;
  }
  v9.receiver = self;
  v9.super_class = (Class)NSObjectAccessibility;
  objc_super v6 = [(NSObjectAccessibility *)&v9 accessibilityAttributedLabel];
  if (!v6) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = AXRuntimeLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[NSObjectAccessibility accessibilityLabel]();
      }
    }
LABEL_10:
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F488F0]) initWithCFAttributedString:v6];
LABEL_11:

LABEL_12:

  return v5;
}

- (id)accessibilityUserDefinedIdentifier
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:21];
  id v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    uint64_t v5 = [(NSObjectAccessibility *)&v8 accessibilityIdentifier];
  }
  objc_super v6 = (void *)v5;

  return v6;
}

+ (id)safeCategoryTargetClassName
{
  return @"NSObject";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityCustomActions
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:26];
  id v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    uint64_t v5 = [(NSObjectAccessibility *)&v8 accessibilityCustomActions];
  }
  objc_super v6 = (void *)v5;

  return v6;
}

- (int64_t)accessibilityElementCount
{
  uint64_t v3 = [(NSObjectAccessibility *)self _accessibilityBoolValueForKey:@"AXPerformingChildrenCount"];
  [(NSObjectAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"AXPerformingChildrenCount"];
  id v4 = [self _accessibilityElements];
  uint64_t v5 = v4;
  if (v4) {
    int64_t v6 = [v4 count];
  }
  else {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [(NSObjectAccessibility *)self _accessibilitySetBoolValue:v3 forKey:@"AXPerformingChildrenCount"];

  return v6;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  id v4 = [self _accessibilityElements];
  uint64_t v5 = v4;
  if (v4)
  {
    unint64_t v6 = [v4 count];
    v7 = 0;
    if ((a3 & 0x8000000000000000) == 0 && v6 > a3)
    {
      v7 = [v5 objectAtIndex:a3];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [self _accessibilityElements];
  unint64_t v6 = v5;
  if (v5) {
    int64_t v7 = [v5 indexOfObject:v4];
  }
  else {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (void)accessibilityIncrement
{
  v2 = [self _accessibilityGetBlockForAttribute:18];
  if (v2)
  {
    uint64_t v3 = v2;
    v2[2]();
    v2 = v3;
  }
}

- (void)accessibilityDecrement
{
  v2 = [self _accessibilityGetBlockForAttribute:19];
  if (v2)
  {
    uint64_t v3 = v2;
    v2[2]();
    v2 = v3;
  }
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:41];
  id v4 = (void *)v3;
  if (!v3)
  {
    unint64_t v6 = [(NSObjectAccessibility *)self storedAccessibilityRespondsToUserInteraction];
    int64_t v7 = v6;
    if (v6)
    {
      char v8 = [v6 BOOLValue];
    }
    else
    {
      unint64_t v9 = [(NSObjectAccessibility *)self accessibilityTraits];
      int v10 = dyld_program_sdk_at_least();
      uint64_t v11 = *MEMORY[0x1E4F48C00];
      if (!v10) {
        uint64_t v11 = 0;
      }
      if (((*MEMORY[0x1E4F48CD0] | *MEMORY[0x1E4F48C70]) & v9) == 0)
      {
        uint64_t v12 = *MEMORY[0x1E4F48BA8];
        if ((*MEMORY[0x1E4F48CE0] & v9) == 0 || (v12 & v9) != 0)
        {
          unint64_t v13 = (*MEMORY[0x1E4F48BF8] | *MEMORY[0x1E4F48CD8] | v11) & v9;
          if (((*MEMORY[0x1E4F48C40] | *MEMORY[0x1E4F48CF8] | *MEMORY[0x1E4F48C90] | *MEMORY[0x1E4F48BC0] | *MEMORY[0x1E4F48B50] | *MEMORY[0x1E4F48B60] | *MEMORY[0x1E4F48DE8] | *MEMORY[0x1E4F48C38] | *MEMORY[0x1E4F48BE0] | *MEMORY[0x1E4F48B70] | *MEMORY[0x1E4F48C30] | *MEMORY[0x1E4F48DA8] | *MEMORY[0x1E4F48CE8] | v12) & v9) != 0
            || v13 == 0)
          {
            char v5 = 1;
LABEL_18:

            goto LABEL_19;
          }
        }
      }
      char v8 = [self _accessibilityRespondsToUserInteraction];
    }
    char v5 = v8;
    goto LABEL_18;
  }
  char v5 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
LABEL_19:

  return v5;
}

- (id)accessibilityValue
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:3];
  id v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F488F0]), "initWithCFAttributedString:", -[NSObjectAccessibility accessibilityAttributedValue](&v8, sel_accessibilityAttributedValue));
  }
  unint64_t v6 = (void *)v5;

  return v6;
}

- (void)setAccessibilityValue:(id)a3
{
  id v4 = a3;
  if ([v4 isAXAttributedString]) {
    -[NSObjectAccessibility setAccessibilityAttributedValue:](&v6, sel_setAccessibilityAttributedValue_, [v4 cfAttributedString], v5.receiver, v5.super_class, self, NSObjectAccessibility);
  }
  else {
    -[NSObjectAccessibility setAccessibilityValue:](&v5, sel_setAccessibilityValue_, v4, self, NSObjectAccessibility, v6.receiver, v6.super_class);
  }
}

- (id)accessibilityUserDefinedValue
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:3];
  id v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F488F0]), "initWithCFAttributedString:", -[NSObjectAccessibility accessibilityAttributedValue](&v8, sel_accessibilityAttributedValue));
  }
  objc_super v6 = (void *)v5;

  return v6;
}

- (id)_accessibilityCapturedImages
{
  return 0;
}

- (id)accessibilityHint
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:2];
  id v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F488F0]), "initWithCFAttributedString:", -[NSObjectAccessibility accessibilityAttributedHint](&v8, sel_accessibilityAttributedHint));
  }
  objc_super v6 = (void *)v5;

  return v6;
}

- (void)setAccessibilityHint:(id)a3
{
  id v4 = a3;
  if ([v4 isAXAttributedString]) {
    -[NSObjectAccessibility setAccessibilityAttributedHint:](&v6, sel_setAccessibilityAttributedHint_, [v4 cfAttributedString], v5.receiver, v5.super_class, self, NSObjectAccessibility);
  }
  else {
    -[NSObjectAccessibility setAccessibilityHint:](&v5, sel_setAccessibilityHint_, v4, self, NSObjectAccessibility, v6.receiver, v6.super_class);
  }
}

- (id)accessibilityUserDefinedHint
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:2];
  id v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F488F0]), "initWithCFAttributedString:", -[NSObjectAccessibility accessibilityAttributedHint](&v8, sel_accessibilityAttributedHint));
  }
  objc_super v6 = (void *)v5;

  return v6;
}

- (CGRect)accessibilityFrame
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:6];
  id v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)NSObjectAccessibility;
    [(NSObjectAccessibility *)&v17 accessibilityFrame];
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;

  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)accessibilityUserDefinedFrame
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:6];
  id v4 = (void *)v3;
  if (v3)
  {
    double v5 = (void *)MEMORY[0x1E4F29238];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    objc_msgSend(v5, "valueWithRect:");
  }
  else
  {
    [(NSObjectAccessibility *)self storedAccessibilityFrame];
  double v6 = };

  return v6;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:4];
  id v4 = (void *)v3;
  if (!v3 || (id v5 = (id)(*(uint64_t (**)(uint64_t))(v3 + 16))(v3)) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)NSObjectAccessibility;
    id v5 = [(NSObjectAccessibility *)&v7 accessibilityTraits];
  }

  return (unint64_t)v5;
}

- (id)accessibilityUserDefinedTraits
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:4];
  id v4 = (void *)v3;
  if (v3) {
    [NSNumber numberWithUnsignedLongLong:(*(uint64_t (**)(uint64_t))(v3 + 16))(v3)];
  }
  else {
  id v5 = [(NSObjectAccessibility *)self storedAccessibilityTraits];
  }

  return v5;
}

- (BOOL)isAccessibilityElement
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:0];
  id v4 = (void *)v3;
  if (v3)
  {
    unsigned __int8 v5 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    unsigned __int8 v5 = [(NSObjectAccessibility *)&v8 isAccessibilityElement];
  }
  BOOL v6 = v5;

  return v6;
}

- (id)isAccessibilityUserDefinedElement
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:0];
  id v4 = (void *)v3;
  if (v3) {
    [NSNumber numberWithBool:(*(uint64_t (**)(uint64_t))(v3 + 16))(v3)];
  }
  else {
  unsigned __int8 v5 = [(NSObjectAccessibility *)self storedIsAccessibilityElement];
  }

  return v5;
}

- (id)accessibilityUserDefinedLanguage
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:9];
  id v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    uint64_t v5 = [(NSObjectAccessibility *)&v8 accessibilityLanguage];
  }
  BOOL v6 = (void *)v5;

  return v6;
}

- (id)accessibilityIdentifier
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:21];
  id v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    uint64_t v5 = [(NSObjectAccessibility *)&v8 accessibilityIdentifier];
  }
  BOOL v6 = (void *)v5;

  return v6;
}

- (BOOL)accessibilityActivate
{
  uint64_t v2 = [self _accessibilityGetBlockForAttribute:17];
  uint64_t v3 = (void *)v2;
  if (v2) {
    char v4 = (*(uint64_t (**)(uint64_t))(v2 + 16))(v2);
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (CGPoint)accessibilityActivationPoint
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:8];
  char v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)NSObjectAccessibility;
    [(NSObjectAccessibility *)&v11 accessibilityActivationPoint];
  }
  double v7 = v5;
  double v8 = v6;

  double v9 = v7;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v2 = [self _accessibilityGetBlockForAttribute:25];
  uint64_t v3 = (void *)v2;
  if (v2) {
    char v4 = (*(uint64_t (**)(uint64_t))(v2 + 16))(v2);
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)accessibilityPerformMagicTap
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:44];
  char v4 = (void *)v3;
  if (v3)
  {
    unsigned __int8 v5 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    unsigned __int8 v5 = [(NSObjectAccessibility *)&v8 accessibilityPerformMagicTap];
  }
  BOOL v6 = v5;

  return v6;
}

- (id)accessibilityUserDefinedActivationPoint
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:8];
  char v4 = (void *)v3;
  if (v3)
  {
    unsigned __int8 v5 = (void *)MEMORY[0x1E4F29238];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    objc_msgSend(v5, "valueWithCGPoint:");
  }
  else
  {
    [(NSObjectAccessibility *)self storedAccessibilityActivationPoint];
  BOOL v6 = };

  return v6;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:12];
  char v4 = (void *)v3;
  if (v3)
  {
    unsigned __int8 v5 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    unsigned __int8 v5 = [(NSObjectAccessibility *)&v8 shouldGroupAccessibilityChildren];
  }
  BOOL v6 = v5;

  return v6;
}

- (id)storedShouldGroupAccessibilityChildren
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:12];
  char v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = [NSNumber numberWithBool:(*(uint64_t (**)(uint64_t))(v3 + 16))(v3)];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    uint64_t v5 = [(NSObjectAccessibility *)&v8 storedShouldGroupAccessibilityChildren];
  }
  BOOL v6 = (void *)v5;

  return v6;
}

- (id)accessibilityUserDefinedShouldGroupChildren
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:12];
  char v4 = (void *)v3;
  if (v3) {
    [NSNumber numberWithBool:(*(uint64_t (**)(uint64_t))(v3 + 16))(v3)];
  }
  else {
  uint64_t v5 = [(NSObjectAccessibility *)self storedShouldGroupAccessibilityChildren];
  }

  return v5;
}

- (id)accessibilityPath
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:7];
  char v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    uint64_t v5 = [(NSObjectAccessibility *)&v8 accessibilityPath];
  }
  BOOL v6 = (void *)v5;

  return v6;
}

- (BOOL)accessibilityElementsHidden
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:10];
  char v4 = (void *)v3;
  if (v3)
  {
    unsigned __int8 v5 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    unsigned __int8 v5 = [(NSObjectAccessibility *)&v8 accessibilityElementsHidden];
  }
  BOOL v6 = v5;

  return v6;
}

- (id)storedAccessibilityElementsHidden
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:10];
  char v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = [NSNumber numberWithBool:(*(uint64_t (**)(uint64_t))(v3 + 16))(v3)];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    uint64_t v5 = [(NSObjectAccessibility *)&v8 storedAccessibilityElementsHidden];
  }
  BOOL v6 = (void *)v5;

  return v6;
}

- (BOOL)accessibilityViewIsModal
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:11];
  char v4 = (void *)v3;
  if (v3)
  {
    unsigned __int8 v5 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    unsigned __int8 v5 = [(NSObjectAccessibility *)&v8 accessibilityViewIsModal];
  }
  BOOL v6 = v5;

  return v6;
}

- (id)storedAccessibilityViewIsModal
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:11];
  char v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = [NSNumber numberWithBool:(*(uint64_t (**)(uint64_t))(v3 + 16))(v3)];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    uint64_t v5 = [(NSObjectAccessibility *)&v8 storedAccessibilityViewIsModal];
  }
  BOOL v6 = (void *)v5;

  return v6;
}

- (int64_t)accessibilityNavigationStyle
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:13];
  char v4 = (void *)v3;
  if (v3)
  {
    id v5 = (id)(*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    id v5 = [(NSObjectAccessibility *)&v8 accessibilityNavigationStyle];
  }
  int64_t v6 = (int64_t)v5;

  return v6;
}

- (id)accessibilityHeaderElements
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:14];
  char v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    uint64_t v5 = [&v8 accessibilityHeaderElements];
  }
  int64_t v6 = (void *)v5;

  return v6;
}

- (id)accessibilityUserDefinedContainer
{
  v4.receiver = self;
  v4.super_class = (Class)NSObjectAccessibility;
  uint64_t v2 = [(NSObjectAccessibility *)&v4 accessibilityContainer];

  return v2;
}

- (id)accessibilityElements
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:22];
  objc_super v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    uint64_t v5 = [(NSObjectAccessibility *)&v8 accessibilityElements];
  }
  int64_t v6 = (void *)v5;

  return v6;
}

- (void)setAccessibilityElements:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSObjectAccessibility;
  id v4 = a3;
  [(NSObjectAccessibility *)&v5 setAccessibilityElements:v4];
  -[NSObject _accessibilityUpdateContainerElementReferencesIfNeededForNewElements:](self, "_accessibilityUpdateContainerElementReferencesIfNeededForNewElements:", v4, v5.receiver, v5.super_class);
}

- (id)automationElements
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:45];
  id v4 = (void *)v3;
  if (v3)
  {
    objc_super v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NSObjectAccessibility;
    int64_t v6 = [(NSObjectAccessibility *)&v10 automationElements];
    double v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [self _accessibilityUserTestingChildren];
    }
    objc_super v5 = v8;
  }

  return v5;
}

- (void)setAutomationElements:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NSObjectAccessibility;
  [(NSObjectAccessibility *)&v3 setAutomationElements:a3];
}

- (id)accessibilityUserInputLabels
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:37];
  id v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    uint64_t v5 = [(NSObjectAccessibility *)&v8 accessibilityUserInputLabels];
  }
  int64_t v6 = (void *)v5;

  return v6;
}

- (id)accessibilityUserDefinedDragSourceDescriptors
{
  v4.receiver = self;
  v4.super_class = (Class)NSObjectAccessibility;
  uint64_t v2 = [(NSObjectAccessibility *)&v4 accessibilityDragSourceDescriptors];

  return v2;
}

- (id)accessibilityUserDefinedDropPointDescriptors
{
  v4.receiver = self;
  v4.super_class = (Class)NSObjectAccessibility;
  uint64_t v2 = [(NSObjectAccessibility *)&v4 accessibilityDropPointDescriptors];

  return v2;
}

- (id)accessibilityPreviousTextNavigationElement
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:46];
  objc_super v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    uint64_t v5 = [(NSObjectAccessibility *)&v8 accessibilityPreviousTextNavigationElement];
  }
  int64_t v6 = (void *)v5;

  return v6;
}

- (id)accessibilityNextTextNavigationElement
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:47];
  objc_super v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    uint64_t v5 = [(NSObjectAccessibility *)&v8 accessibilityNextTextNavigationElement];
  }
  int64_t v6 = (void *)v5;

  return v6;
}

- (id)accessibilityTextInputResponder
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:49];
  objc_super v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    uint64_t v5 = [(NSObjectAccessibility *)&v8 accessibilityTextInputResponder];
  }
  int64_t v6 = (void *)v5;

  return v6;
}

- (void)accessibilityLabel
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_19F2DB000, v0, OS_LOG_TYPE_FAULT, "axLabel has unexpected type! %@", v1, 0xCu);
}

@end