@interface ICTodoButton(ICAccessibility_iOS)
- (BOOL)isAccessibilityElement;
- (id)_icaxNote;
- (id)_icaxParentTextView;
- (id)accessibilityAttributedLabel;
- (id)accessibilityContainer;
- (id)accessibilityCustomActions;
- (id)accessibilityCustomRotors;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityDropPointDescriptors;
- (id)accessibilityUserInputLabels;
- (id)icaxBaseAccessibilityLabel;
- (id)icaxDragSourceName;
- (id)supportedRotorTypes;
- (uint64_t)_accessibilityShouldUseViewHierarchyForFindingScrollParent;
- (uint64_t)_accessibilitySupportsActivateAction;
- (uint64_t)_icaxBeginEditingAtEndOfCorrespondingParagraph;
- (uint64_t)accessibilityActivate;
- (uint64_t)textRangeInNote;
@end

@implementation ICTodoButton(ICAccessibility_iOS)

- (BOOL)isAccessibilityElement
{
  v1 = [a1 window];
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)accessibilityContainer
{
  v6.receiver = a1;
  v6.super_class = (Class)&off_26C1CA230;
  objc_msgSendSuper2(&v6, sel_accessibilityContainer);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v2 = v1;
  if (v1)
  {
    id v3 = v1;
    while (![v3 conformsToProtocol:&unk_26C1E88C8])
    {
      uint64_t v4 = [v3 accessibilityContainer];

      id v3 = (id)v4;
      if (!v4) {
        goto LABEL_8;
      }
    }
    id v3 = v3;

    BOOL v2 = v3;
  }
  else
  {
    id v3 = 0;
  }
LABEL_8:

  return v2;
}

- (id)icaxBaseAccessibilityLabel
{
  BOOL v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Checklist item" value:&stru_26C10E100 table:0];

  objc_super v6 = [a1 icaxCorrespondingParagraphText];
  uint64_t v4 = __ICAccessibilityStringForVariables();

  return v4;
}

- (id)accessibilityAttributedLabel
{
  int v2 = [a1 isDone];
  id v3 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v4 = v3;
  if (v2) {
    v5 = @"completed";
  }
  else {
    v5 = @"incomplete";
  }
  objc_super v6 = [v3 localizedStringForKey:v5 value:&stru_26C10E100 table:0];

  v7 = [a1 icaxBaseAccessibilityLabel];
  v8 = [v7 icaxAttributedStringWithLowPitchPrefix:v6];

  return v8;
}

- (id)accessibilityUserInputLabels
{
  id v2 = objc_alloc(MEMORY[0x263EFF980]);
  id v3 = (void *)[v2 initWithArray:MEMORY[0x263EFFA68]];
  uint64_t v4 = [a1 icaxCorrespondingParagraphText];
  v5 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@" -"];
  objc_super v6 = [v4 componentsSeparatedByCharactersInSet:v5];
  if ((unint64_t)[v6 count] >= 5)
  {
    v7 = objc_msgSend(v6, "subarrayWithRange:", 0, 4);
    v8 = [v7 componentsJoinedByString:@" "];
    if (v8) {
      [v3 addObject:v8];
    }
  }
  if (v4) {
    [v3 addObject:v4];
  }
  v9 = [a1 accessibilityAttributedLabel];
  v10 = [v9 string];

  if ([v10 length]) {
    [v3 addObject:v10];
  }

  return v3;
}

- (id)icaxDragSourceName
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  id v1 = [v0 localizedStringForKey:@"Checklist item" value:&stru_26C10E100 table:0];

  return v1;
}

- (id)accessibilityDragSourceDescriptors
{
  id v1 = [a1 _icaxParentTextView];
  id v2 = [v1 accessibilityDragSourceDescriptors];

  return v2;
}

- (id)accessibilityDropPointDescriptors
{
  id v1 = [a1 _icaxParentTextView];
  id v2 = [v1 accessibilityDropPointDescriptors];

  return v2;
}

- (uint64_t)_accessibilitySupportsActivateAction
{
  id v1 = [a1 _icaxNote];
  uint64_t v2 = [v1 isEditable];

  return v2;
}

- (uint64_t)accessibilityActivate
{
  uint64_t v2 = [a1 _icaxParentTextView];
  id v3 = [a1 _icaxNote];
  uint64_t v4 = [v3 isEditable];

  if (v4)
  {
    if (([a1 accessibilityElementIsFocused] & 1) != 0
      || [v2 isFirstResponder])
    {
      int v5 = [a1 isDone];
      objc_super v6 = [MEMORY[0x263F086E0] mainBundle];
      v7 = v6;
      if (v5) {
        v8 = @"incomplete: %@";
      }
      else {
        v8 = @"completed: %@";
      }
      v9 = [v6 localizedStringForKey:v8 value:&stru_26C10E100 table:0];

      v10 = NSString;
      v11 = [a1 icaxCorrespondingParagraphText];
      v12 = objc_msgSend(v10, "localizedStringWithFormat:", v9, v11);

      [a1 sendActionsForControlEvents:64];
      ICAccessibilityPostHighPriorityAnnouncementNotification();
    }
    else if (UIAccessibilityIsSwitchControlRunning())
    {
      [a1 sendActionsForControlEvents:64];
    }
    else
    {
      [a1 _icaxBeginEditingAtEndOfCorrespondingParagraph];
    }
  }

  return v4;
}

- (id)accessibilityCustomActions
{
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  id v3 = [a1 _icaxNote];
  int v4 = [v3 isEditable];

  if (v4)
  {
    int v5 = [MEMORY[0x263F086E0] mainBundle];
    objc_super v6 = [v5 localizedStringForKey:@"Edit checklist item" value:&stru_26C10E100 table:0];

    v7 = (void *)[objc_alloc(MEMORY[0x263F823A0]) initWithName:v6 target:a1 selector:sel__icaxBeginEditingAtEndOfCorrespondingParagraph];
    [v2 addObject:v7];
  }
  v8 = (void *)[v2 copy];

  return v8;
}

- (uint64_t)_accessibilityShouldUseViewHierarchyForFindingScrollParent
{
  return 1;
}

- (id)accessibilityCustomRotors
{
  id v1 = [a1 _icaxParentTextView];
  uint64_t v2 = [v1 editorController];
  id v3 = +[ICAccessibilityCustomRotorController sharedInstance];
  [v3 setNoteEditorViewController:v2];

  int v4 = +[ICAccessibilityCustomRotorController sharedInstance];
  int v5 = [v4 sharedTextViewRotors];

  return v5;
}

- (id)_icaxParentTextView
{
  id v1 = [a1 superview];
  objc_opt_class();
  while ((objc_opt_isKindOfClass() & 1) == 0 && v1)
  {
    uint64_t v2 = v1;
    id v1 = [v1 superview];

    objc_opt_class();
  }

  return v1;
}

- (uint64_t)_icaxBeginEditingAtEndOfCorrespondingParagraph
{
  uint64_t v2 = [a1 _icaxParentTextView];
  id v3 = [a1 trackedParagraph];
  uint64_t v4 = [v3 characterRange];
  uint64_t v6 = v5;

  if ([v2 isFirstResponder]) {
    objc_msgSend(v2, "setSelectedRange:", v6 + v4 - 1, 0);
  }
  else {
    objc_msgSend(v2, "icaxBeginEditingInStorageRange:", v6 + v4 - 1, 0);
  }

  return 1;
}

- (id)_icaxNote
{
  id v1 = [a1 _icaxParentTextView];
  uint64_t v2 = [v1 editorController];
  id v3 = [v2 note];

  return v3;
}

- (id)supportedRotorTypes
{
  v2[1] = *MEMORY[0x263EF8340];
  v2[0] = @"ICAccessibilityRotorTypeChecklist";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:1];

  return v0;
}

- (uint64_t)textRangeInNote
{
  id v1 = [a1 trackedParagraph];
  uint64_t v2 = [v1 characterRange];

  return v2;
}

@end