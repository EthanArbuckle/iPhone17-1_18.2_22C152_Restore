@interface NSObject(UIAccessibility)
- (double)accessibilityActivationPoint;
- (double)accessibilityFrame;
- (id)_internalAccessibilityAttributedHint;
- (id)_internalAccessibilityAttributedLabel;
- (id)_internalAccessibilityAttributedUserInputLabels;
- (id)_internalAccessibilityAttributedValue;
- (id)accessibilityLanguage;
- (id)accessibilityNextTextNavigationElement;
- (id)accessibilityPath;
- (id)accessibilityPreviousTextNavigationElement;
- (id)accessibilityTextInputResponder;
- (id)accessibilityTextualContext;
- (id)storedAccessibilityActivationPoint;
- (id)storedAccessibilityDirectTouchOptions;
- (id)storedAccessibilityElementsHidden;
- (id)storedAccessibilityFrame;
- (id)storedAccessibilityIdentifier;
- (id)storedAccessibilityNavigationStyle;
- (id)storedAccessibilityNextTextNavigationElement;
- (id)storedAccessibilityPreviousTextNavigationElement;
- (id)storedAccessibilityRespondsToUserInteraction;
- (id)storedAccessibilityTraits;
- (id)storedAccessibilityViewIsModal;
- (id)storedIsAccessibilityElement;
- (id)storedShouldGroupAccessibilityChildren;
- (uint64_t)_accessibilityGetBlockForAttribute:()UIAccessibility;
- (uint64_t)accessibilityContainer;
- (uint64_t)accessibilityDirectTouchOptions;
- (uint64_t)accessibilityElementsHidden;
- (uint64_t)accessibilityExpandedStatus;
- (uint64_t)accessibilityExpandedStatusBlock;
- (uint64_t)accessibilityHeaderElements;
- (uint64_t)accessibilityHint;
- (uint64_t)accessibilityLabel;
- (uint64_t)accessibilityNavigationStyle;
- (uint64_t)accessibilityRespondsToUserInteraction;
- (uint64_t)accessibilityTraits;
- (uint64_t)accessibilityValue;
- (uint64_t)accessibilityViewIsModal;
- (uint64_t)isAccessibilityElement;
- (uint64_t)setAccessibilityActivateBlock:()UIAccessibility;
- (uint64_t)setAccessibilityActivationPointBlock:()UIAccessibility;
- (uint64_t)setAccessibilityAttributedHintBlock:()UIAccessibility;
- (uint64_t)setAccessibilityAttributedLabelBlock:()UIAccessibility;
- (uint64_t)setAccessibilityAttributedUserInputLabelsBlock:()UIAccessibility;
- (uint64_t)setAccessibilityAttributedValueBlock:()UIAccessibility;
- (uint64_t)setAccessibilityContainerTypeBlock:()UIAccessibility;
- (uint64_t)setAccessibilityCustomActionsBlock:()UIAccessibility;
- (uint64_t)setAccessibilityDecrementBlock:()UIAccessibility;
- (uint64_t)setAccessibilityElementsBlock:()UIAccessibility;
- (uint64_t)setAccessibilityElementsHiddenBlock:()UIAccessibility;
- (uint64_t)setAccessibilityExpandedStatusBlock:()UIAccessibility;
- (uint64_t)setAccessibilityFrameBlock:()UIAccessibility;
- (uint64_t)setAccessibilityHeaderElementsBlock:()UIAccessibility;
- (uint64_t)setAccessibilityHint:()UIAccessibility;
- (uint64_t)setAccessibilityHintBlock:()UIAccessibility;
- (uint64_t)setAccessibilityIdentifierBlock:()UIAccessibility;
- (uint64_t)setAccessibilityIncrementBlock:()UIAccessibility;
- (uint64_t)setAccessibilityLabel:()UIAccessibility;
- (uint64_t)setAccessibilityLabelBlock:()UIAccessibility;
- (uint64_t)setAccessibilityLanguageBlock:()UIAccessibility;
- (uint64_t)setAccessibilityMagicTapBlock:()UIAccessibility;
- (uint64_t)setAccessibilityNavigationStyleBlock:()UIAccessibility;
- (uint64_t)setAccessibilityNextTextNavigationElementBlock:()UIAccessibility;
- (uint64_t)setAccessibilityPathBlock:()UIAccessibility;
- (uint64_t)setAccessibilityPerformEscapeBlock:()UIAccessibility;
- (uint64_t)setAccessibilityPreviousTextNavigationElementBlock:()UIAccessibility;
- (uint64_t)setAccessibilityRespondsToUserInteractionBlock:()UIAccessibility;
- (uint64_t)setAccessibilityShouldGroupAccessibilityChildrenBlock:()UIAccessibility;
- (uint64_t)setAccessibilityTextInputResponderBlock:()UIAccessibility;
- (uint64_t)setAccessibilityTextualContextBlock:()UIAccessibility;
- (uint64_t)setAccessibilityTraitsBlock:()UIAccessibility;
- (uint64_t)setAccessibilityUserInputLabels:()UIAccessibility;
- (uint64_t)setAccessibilityUserInputLabelsBlock:()UIAccessibility;
- (uint64_t)setAccessibilityValue:()UIAccessibility;
- (uint64_t)setAccessibilityValueBlock:()UIAccessibility;
- (uint64_t)setAccessibilityViewIsModalBlock:()UIAccessibility;
- (uint64_t)setAutomationElementsBlock:()UIAccessibility;
- (uint64_t)setIsAccessibilityElementBlock:()UIAccessibility;
- (uint64_t)shouldGroupAccessibilityChildren;
- (void)_accessibilitySetReturnBlock:()UIAccessibility forAttribute:;
- (void)_internalSetAccessibilityAttributedHint:()UIAccessibility;
- (void)_internalSetAccessibilityAttributedLabel:()UIAccessibility;
- (void)_internalSetAccessibilityAttributedUserInputLabels:()UIAccessibility;
- (void)_internalSetAccessibilityAttributedValue:()UIAccessibility;
- (void)accessibilityUserInputLabels;
- (void)setAccessibilityActivationPoint:()UIAccessibility;
- (void)setAccessibilityContainer:()UIAccessibility;
- (void)setAccessibilityDirectTouchOptions:()UIAccessibility;
- (void)setAccessibilityElementsHidden:()UIAccessibility;
- (void)setAccessibilityExpandedStatus:()UIAccessibility;
- (void)setAccessibilityFrame:()UIAccessibility;
- (void)setAccessibilityHeaderElements:()UIAccessibility;
- (void)setAccessibilityLanguage:()UIAccessibility;
- (void)setAccessibilityNavigationStyle:()UIAccessibility;
- (void)setAccessibilityNextTextNavigationElement:()UIAccessibility;
- (void)setAccessibilityPath:()UIAccessibility;
- (void)setAccessibilityPreviousTextNavigationElement:()UIAccessibility;
- (void)setAccessibilityRespondsToUserInteraction:()UIAccessibility;
- (void)setAccessibilityTextInputResponder:()UIAccessibility;
- (void)setAccessibilityTextualContext:()UIAccessibility;
- (void)setAccessibilityTraits:()UIAccessibility;
- (void)setAccessibilityViewIsModal:()UIAccessibility;
- (void)setIsAccessibilityElement:()UIAccessibility;
- (void)setShouldGroupAccessibilityChildren:()UIAccessibility;
@end

@implementation NSObject(UIAccessibility)

- (void)setIsAccessibilityElement:()UIAccessibility
{
  v2 = objc_msgSend(NSNumber, "numberWithBool:");
  objc_setAssociatedObject(a1, &AXIsElementIdentifier, v2, (void *)1);
}

- (uint64_t)accessibilityContainer
{
  id AssociatedObject = objc_getAssociatedObject(a1, &AXContainerIdentifier);
  return [AssociatedObject referencedContainer];
}

- (id)storedAccessibilityIdentifier
{
  return objc_getAssociatedObject(a1, &AXIdentifierIdentifier);
}

- (id)accessibilityLanguage
{
  return objc_getAssociatedObject(a1, &AXLanguageIdentifier);
}

- (void)_accessibilitySetReturnBlock:()UIAccessibility forAttribute:
{
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0) {
    return;
  }
  v7 = (void *)[a1 _accessibilityValueForKey:@"AccessibilityAttributeBlockStorageKey"];
  if (v7)
  {
    if (a3)
    {
LABEL_5:
      v8 = _Block_copy(a3);
      objc_msgSend(v7, "setObject:forKey:", v8, objc_msgSend(NSNumber, "numberWithInteger:", a4));
      _Block_release(v8);
      return;
    }
  }
  else
  {
    v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    [a1 _accessibilitySetValue:v7 forKey:@"AccessibilityAttributeBlockStorageKey" storageMode:0];
    if (a3) {
      goto LABEL_5;
    }
  }
  objc_msgSend(v7, "removeObjectForKey:", objc_msgSend(NSNumber, "numberWithInteger:", a4));
  if (![v7 count])
  {
    [a1 _accessibilitySetValue:0 forKey:@"AccessibilityAttributeBlockStorageKey" storageMode:1];
  }
}

- (uint64_t)_accessibilityGetBlockForAttribute:()UIAccessibility
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [a1 _accessibilityValueForKey:@"AccessibilityAttributeBlockStorageKey"];
  if (!v5) {
    return 0;
  }
  v6 = (void *)v5;
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  return [v6 objectForKey:v7];
}

- (void)_internalSetAccessibilityAttributedLabel:()UIAccessibility
{
}

- (void)_internalSetAccessibilityAttributedValue:()UIAccessibility
{
}

- (void)_internalSetAccessibilityAttributedHint:()UIAccessibility
{
}

- (uint64_t)setAccessibilityValue:()UIAccessibility
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && a3) {
    a3 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:a3];
  }
  return [a1 _internalSetAccessibilityAttributedValue:a3];
}

- (uint64_t)setAccessibilityHint:()UIAccessibility
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && a3) {
    a3 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:a3];
  }
  return [a1 _internalSetAccessibilityAttributedHint:a3];
}

- (uint64_t)accessibilityLabel
{
  v1 = (void *)[a1 _internalAccessibilityAttributedLabel];
  return [v1 string];
}

- (id)_internalAccessibilityAttributedLabel
{
  return objc_getAssociatedObject(a1, &AXLabelIdentifier);
}

- (uint64_t)accessibilityValue
{
  v1 = (void *)[a1 _internalAccessibilityAttributedValue];
  return [v1 string];
}

- (id)_internalAccessibilityAttributedValue
{
  return objc_getAssociatedObject(a1, &AXValueIdentifier);
}

- (uint64_t)accessibilityHint
{
  v1 = (void *)[a1 _internalAccessibilityAttributedHint];
  return [v1 string];
}

- (id)_internalAccessibilityAttributedHint
{
  return objc_getAssociatedObject(a1, &AXHintIdentifier);
}

- (uint64_t)accessibilityElementsHidden
{
  v1 = (void *)[a1 storedAccessibilityElementsHidden];
  return [v1 BOOLValue];
}

- (id)storedAccessibilityElementsHidden
{
  return objc_getAssociatedObject(a1, &AXElementsHiddenIdentifier);
}

- (uint64_t)setAccessibilityLabel:()UIAccessibility
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && a3) {
    a3 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:a3];
  }
  return [a1 _internalSetAccessibilityAttributedLabel:a3];
}

- (uint64_t)accessibilityTraits
{
  id AssociatedObject = objc_getAssociatedObject(a1, &AXTraitsIdentifier);
  return [AssociatedObject unsignedLongLongValue];
}

- (uint64_t)setAccessibilityElementsBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:22];
}

- (uint64_t)setAutomationElementsBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:45];
}

- (void)setAccessibilityRespondsToUserInteraction:()UIAccessibility
{
  v2 = objc_msgSend(NSNumber, "numberWithBool:");
  objc_setAssociatedObject(a1, &AXRespondsToUserInteractionIdentifier, v2, (void *)1);
}

- (void)setAccessibilityLanguage:()UIAccessibility
{
}

- (uint64_t)setAccessibilityLabelBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:1];
}

- (uint64_t)setAccessibilityCustomActionsBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:26];
}

- (void)setAccessibilityContainer:()UIAccessibility
{
  if (a3)
  {
    id AssociatedObject = (UIAccessibilityContainerReferenceHolder *)objc_getAssociatedObject(object, &AXContainerIdentifier);
    if (!AssociatedObject)
    {
      id AssociatedObject = objc_alloc_init(UIAccessibilityContainerReferenceHolder);
      objc_setAssociatedObject(object, &AXContainerIdentifier, AssociatedObject, (void *)1);
    }
    [(UIAccessibilityContainerReferenceHolder *)AssociatedObject setReferencedContainer:a3];
  }
  else
  {
    objc_setAssociatedObject(object, &AXContainerIdentifier, 0, (void *)1);
  }
}

- (void)setAccessibilityElementsHidden:()UIAccessibility
{
  v2 = objc_msgSend(NSNumber, "numberWithBool:");
  objc_setAssociatedObject(a1, &AXElementsHiddenIdentifier, v2, (void *)1);
}

- (void)setAccessibilityTraits:()UIAccessibility
{
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  objc_setAssociatedObject(a1, &AXTraitsIdentifier, v2, (void *)1);
}

- (uint64_t)isAccessibilityElement
{
  id AssociatedObject = objc_getAssociatedObject(a1, &AXIsElementIdentifier);
  return [AssociatedObject BOOLValue];
}

- (void)accessibilityUserInputLabels
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = objc_msgSend(a1, "_internalAccessibilityAttributedUserInputLabels", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "string"));
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  return v2;
}

- (id)_internalAccessibilityAttributedUserInputLabels
{
  return objc_getAssociatedObject(a1, &AXUserInputLabelsIdentifier);
}

- (void)setAccessibilityFrame:()UIAccessibility
{
  v2 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:");
  objc_setAssociatedObject(a1, &AXFrameIdentifier, v2, (void *)1);
}

- (uint64_t)setAccessibilityUserInputLabels:()UIAccessibility
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(v5, "addObject:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28B18]), "initWithString:", *(void *)(*((void *)&v11 + 1) + 8 * i)));
        }
        uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  return [a1 _internalSetAccessibilityAttributedUserInputLabels:v5];
}

- (void)_internalSetAccessibilityAttributedUserInputLabels:()UIAccessibility
{
}

- (void)setShouldGroupAccessibilityChildren:()UIAccessibility
{
  v2 = objc_msgSend(NSNumber, "numberWithBool:");
  objc_setAssociatedObject(a1, &AXShouldGroupChildren, v2, (void *)1);
}

- (void)setAccessibilityViewIsModal:()UIAccessibility
{
  v2 = objc_msgSend(NSNumber, "numberWithBool:");
  objc_setAssociatedObject(a1, &AXViewIsModalIdentifier, v2, (void *)1);
}

- (double)accessibilityActivationPoint
{
  id AssociatedObject = objc_getAssociatedObject(a1, &AXActivationPointIdentifier);
  if (AssociatedObject)
  {
    [AssociatedObject pointValue];
  }
  else
  {
    [a1 accessibilityFrame];
    CGFloat x = v10.origin.x;
    CGFloat y = v10.origin.y;
    CGFloat width = v10.size.width;
    CGFloat height = v10.size.height;
    double MidX = CGRectGetMidX(v10);
    v11.origin.CGFloat x = x;
    v11.origin.CGFloat y = y;
    v11.size.CGFloat width = width;
    v11.size.CGFloat height = height;
    CGRectGetMidY(v11);
    return MidX;
  }
  return result;
}

- (double)accessibilityFrame
{
  id AssociatedObject = objc_getAssociatedObject(a1, &AXFrameIdentifier);
  if (!AssociatedObject) {
    return *MEMORY[0x1E4F1DB28];
  }
  [AssociatedObject rectValue];
  return result;
}

- (id)accessibilityPath
{
  return objc_getAssociatedObject(a1, &AXPathIdentifier);
}

- (uint64_t)accessibilityViewIsModal
{
  v1 = (void *)[a1 storedAccessibilityViewIsModal];
  return [v1 BOOLValue];
}

- (uint64_t)shouldGroupAccessibilityChildren
{
  v1 = (void *)[a1 storedShouldGroupAccessibilityChildren];
  return [v1 BOOLValue];
}

- (uint64_t)accessibilityNavigationStyle
{
  v1 = (void *)[a1 storedAccessibilityNavigationStyle];
  return [v1 integerValue];
}

- (uint64_t)accessibilityRespondsToUserInteraction
{
  v1 = (void *)[a1 storedAccessibilityRespondsToUserInteraction];
  return [v1 BOOLValue];
}

- (id)storedShouldGroupAccessibilityChildren
{
  return objc_getAssociatedObject(a1, &AXShouldGroupChildren);
}

- (id)storedAccessibilityNavigationStyle
{
  return objc_getAssociatedObject(a1, &AXNavigationStyle);
}

- (id)storedAccessibilityViewIsModal
{
  return objc_getAssociatedObject(a1, &AXViewIsModalIdentifier);
}

- (id)storedAccessibilityTraits
{
  return objc_getAssociatedObject(a1, &AXTraitsIdentifier);
}

- (id)storedIsAccessibilityElement
{
  return objc_getAssociatedObject(a1, &AXIsElementIdentifier);
}

- (id)storedAccessibilityFrame
{
  return objc_getAssociatedObject(a1, &AXFrameIdentifier);
}

- (id)storedAccessibilityActivationPoint
{
  return objc_getAssociatedObject(a1, &AXActivationPointIdentifier);
}

- (id)storedAccessibilityRespondsToUserInteraction
{
  return objc_getAssociatedObject(a1, &AXRespondsToUserInteractionIdentifier);
}

- (id)storedAccessibilityDirectTouchOptions
{
  return objc_getAssociatedObject(a1, &AXDirectTouchOptionsIdentifier);
}

- (uint64_t)accessibilityHeaderElements
{
  id AssociatedObject = objc_getAssociatedObject(a1, &AXHeaderElementsIdentifier);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return (uint64_t)AssociatedObject;
  }
  return [AssociatedObject allObjects];
}

- (void)setAccessibilityPath:()UIAccessibility
{
}

- (void)setAccessibilityActivationPoint:()UIAccessibility
{
  v2 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:");
  objc_setAssociatedObject(a1, &AXActivationPointIdentifier, v2, (void *)1);
}

- (void)setAccessibilityNavigationStyle:()UIAccessibility
{
  v2 = objc_msgSend(NSNumber, "numberWithInteger:");
  objc_setAssociatedObject(a1, &AXNavigationStyle, v2, (void *)1);
}

- (id)accessibilityTextualContext
{
  return objc_getAssociatedObject(a1, &AXTextualContextIdentifier);
}

- (void)setAccessibilityTextualContext:()UIAccessibility
{
}

- (uint64_t)accessibilityDirectTouchOptions
{
  id AssociatedObject = objc_getAssociatedObject(a1, &AXDirectTouchOptionsIdentifier);
  return [AssociatedObject unsignedIntegerValue];
}

- (void)setAccessibilityDirectTouchOptions:()UIAccessibility
{
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  objc_setAssociatedObject(a1, &AXDirectTouchOptionsIdentifier, v2, (void *)1);
}

- (void)setAccessibilityHeaderElements:()UIAccessibility
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CGRect v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    long long v12 = (objc_class *)objc_opt_class();
    [v10 raise:v11, @"accessibilityHeaderElements must be an NSArray. Was actually: %@", NSStringFromClass(v12) format];
LABEL_12:
    uint64_t v5 = 0;
    goto LABEL_13;
  }
  uint64_t v5 = (void *)[MEMORY[0x1E4F28F50] weakObjectsPointerArray];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(a3);
        }
        [v5 addPointer:*(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
LABEL_13:
  objc_setAssociatedObject(a1, &AXHeaderElementsIdentifier, v5, (void *)1);
}

- (uint64_t)setIsAccessibilityElementBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:0];
}

- (uint64_t)setAccessibilityValueBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:3];
}

- (uint64_t)setAccessibilityHintBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:2];
}

- (uint64_t)setAccessibilityTraitsBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:4];
}

- (uint64_t)setAccessibilityIdentifierBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:21];
}

- (uint64_t)setAccessibilityHeaderElementsBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:14];
}

- (uint64_t)setAccessibilityAttributedLabelBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:34];
}

- (uint64_t)setAccessibilityAttributedHintBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:35];
}

- (uint64_t)setAccessibilityLanguageBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:9];
}

- (uint64_t)setAccessibilityTextualContextBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:36];
}

- (uint64_t)setAccessibilityUserInputLabelsBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:37];
}

- (uint64_t)setAccessibilityAttributedUserInputLabelsBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:38];
}

- (uint64_t)setAccessibilityAttributedValueBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:39];
}

- (uint64_t)setAccessibilityElementsHiddenBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:10];
}

- (uint64_t)setAccessibilityRespondsToUserInteractionBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:41];
}

- (void)setAccessibilityExpandedStatus:()UIAccessibility
{
  v2 = objc_msgSend(NSNumber, "numberWithInteger:");
  objc_setAssociatedObject(a1, &AXExpandedStatusIdentifier, v2, (void *)1);
}

- (uint64_t)accessibilityExpandedStatus
{
  id AssociatedObject = objc_getAssociatedObject(a1, &AXExpandedStatusIdentifier);
  return [AssociatedObject integerValue];
}

- (uint64_t)setAccessibilityExpandedStatusBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:48];
}

- (uint64_t)accessibilityExpandedStatusBlock
{
  return [a1 _accessibilityGetBlockForAttribute:48];
}

- (uint64_t)setAccessibilityViewIsModalBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:11];
}

- (uint64_t)setAccessibilityShouldGroupAccessibilityChildrenBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:12];
}

- (uint64_t)setAccessibilityContainerTypeBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:43];
}

- (uint64_t)setAccessibilityActivationPointBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:8];
}

- (uint64_t)setAccessibilityFrameBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:6];
}

- (uint64_t)setAccessibilityNavigationStyleBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:13];
}

- (uint64_t)setAccessibilityPathBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:7];
}

- (uint64_t)setAccessibilityActivateBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:17];
}

- (uint64_t)setAccessibilityIncrementBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:18];
}

- (uint64_t)setAccessibilityDecrementBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:19];
}

- (uint64_t)setAccessibilityPerformEscapeBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:25];
}

- (uint64_t)setAccessibilityMagicTapBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:44];
}

- (uint64_t)setAccessibilityPreviousTextNavigationElementBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:46];
}

- (uint64_t)setAccessibilityNextTextNavigationElementBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:47];
}

- (id)accessibilityPreviousTextNavigationElement
{
  return objc_getAssociatedObject(a1, &AXPreviousTextNavigationElementIdentifier);
}

- (void)setAccessibilityPreviousTextNavigationElement:()UIAccessibility
{
}

- (id)accessibilityNextTextNavigationElement
{
  return objc_getAssociatedObject(a1, &AXNextTextNavigationElementIdentifier);
}

- (void)setAccessibilityNextTextNavigationElement:()UIAccessibility
{
}

- (id)storedAccessibilityPreviousTextNavigationElement
{
  return objc_getAssociatedObject(a1, &AXPreviousTextNavigationElementIdentifier);
}

- (id)storedAccessibilityNextTextNavigationElement
{
  return objc_getAssociatedObject(a1, &AXNextTextNavigationElementIdentifier);
}

- (uint64_t)setAccessibilityTextInputResponderBlock:()UIAccessibility
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:49];
}

- (id)accessibilityTextInputResponder
{
  return objc_getAssociatedObject(a1, &AXTextInputResponderIdentifier);
}

- (void)setAccessibilityTextInputResponder:()UIAccessibility
{
}

@end