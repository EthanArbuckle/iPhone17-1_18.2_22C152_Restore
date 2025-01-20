@interface WFContactField
- (BOOL)allowsTextEntry;
- (BOOL)isEditable;
- (BOOL)shouldEndEditing;
- (BOOL)text:(id)a3 containsMatchesForProperties:(id)a4;
- (BOOL)text:(id)a3 containsMatchesForProperty:(int)a4;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (NSArray)entries;
- (NSSet)supportedPersonProperties;
- (NSString)placeholder;
- (NSString)textContentType;
- (UIButton)plusButton;
- (WFContactField)initWithFrame:(CGRect)a3;
- (WFContactFieldDelegate)delegate;
- (WFContactPickerCoordinator)contactPicker;
- (WFContactTextView)textView;
- (WFTextScrollView)scrollView;
- (_NSRange)selectedRange;
- (id)containingViewController;
- (id)typingAttributes;
- (id)updateBlock;
- (int64_t)autocapitalizationType;
- (int64_t)autocorrectionType;
- (int64_t)keyboardAppearance;
- (int64_t)keyboardType;
- (int64_t)textAlignment;
- (int64_t)tokenizeFreeTextFromRange:(_NSRange)a3 freeTextModificationBlock:(id *)a4;
- (unint64_t)numberOfValuesForProperties:(id)a3 inContact:(id)a4;
- (void)chooseMultivalueIndexIfNecessaryForContact:(id)a3 sender:(id)a4;
- (void)deleteFreeText:(id)a3 replacementRange:(_NSRange)a4 newValue:(id)a5;
- (void)insertContact:(id)a3;
- (void)layoutSubviews;
- (void)presentContactSelectionActionSheetForText:(id)a3 attributedText:(id)a4 replacementRange:(_NSRange)a5;
- (void)selectContact;
- (void)setAllowsTextEntry:(BOOL)a3;
- (void)setAutocapitalizationType:(int64_t)a3;
- (void)setAutocorrectionType:(int64_t)a3;
- (void)setContactPicker:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)setEntries:(id)a3;
- (void)setKeyboardAppearance:(int64_t)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setPlaceholder:(id)a3;
- (void)setPlusButton:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setSelectedRange:(_NSRange)a3;
- (void)setShouldEndEditing:(BOOL)a3;
- (void)setSupportedPersonProperties:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextContentType:(id)a3;
- (void)setTextView:(id)a3;
- (void)setUpdateBlock:(id)a3;
- (void)showContactPicker;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)tintColorDidChange;
- (void)tokenizeFreeText:(id)a3 replacementRange:(_NSRange)a4 newValue:(id)a5;
- (void)updateContactsFromTextField:(BOOL)a3;
- (void)updateEditableState;
@end

@implementation WFContactField

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactPicker, 0);
  objc_destroyWeak((id *)&self->_plusButton);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_textView);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setContactPicker:(id)a3
{
}

- (WFContactPickerCoordinator)contactPicker
{
  return self->_contactPicker;
}

- (void)setShouldEndEditing:(BOOL)a3
{
  self->_shouldEndEditing = a3;
}

- (BOOL)shouldEndEditing
{
  return self->_shouldEndEditing;
}

- (void)setSelectedRange:(_NSRange)a3
{
  self->_selectedRange = a3;
}

- (_NSRange)selectedRange
{
  p_selectedRange = &self->_selectedRange;
  NSUInteger location = self->_selectedRange.location;
  NSUInteger length = p_selectedRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setPlusButton:(id)a3
{
}

- (UIButton)plusButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_plusButton);
  return (UIButton *)WeakRetained;
}

- (void)setScrollView:(id)a3
{
}

- (WFTextScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (WFTextScrollView *)WeakRetained;
}

- (void)setTextView:(id)a3
{
}

- (WFContactTextView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  return (WFContactTextView *)WeakRetained;
}

- (void)setUpdateBlock:(id)a3
{
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (BOOL)allowsTextEntry
{
  return self->_allowsTextEntry;
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  self->_autocapitalizationType = a3;
}

- (int64_t)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (void)setAutocorrectionType:(int64_t)a3
{
  self->_autocorrectionType = a3;
}

- (int64_t)autocorrectionType
{
  return self->_autocorrectionType;
}

- (NSArray)entries
{
  return self->_entries;
}

- (void)setDelegate:(id)a3
{
}

- (WFContactFieldDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFContactFieldDelegate *)WeakRetained;
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)WFContactField;
  [(WFContactField *)&v5 tintColorDidChange];
  v3 = [(WFContactField *)self typingAttributes];
  v4 = [(WFContactField *)self textView];
  [v4 setTypingAttributes:v3];
}

- (id)typingAttributes
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = *MEMORY[0x263F814F0];
  v3 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  v8[0] = v3;
  v7[1] = *MEMORY[0x263F81500];
  v4 = [(WFContactField *)self tintColor];
  v8[1] = v4;
  objc_super v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)textViewDidChange:(id)a3
{
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  v11 = [MEMORY[0x263F08708] newlineCharacterSet];
  uint64_t v12 = [v10 rangeOfCharacterFromSet:v11 options:0];

  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v36 = 0;
    int64_t v22 = -[WFContactField tokenizeFreeTextFromRange:freeTextModificationBlock:](self, "tokenizeFreeTextFromRange:freeTextModificationBlock:", location, length, &v36);
    id v23 = v36;
    v24 = v23;
    if (v22 == 1)
    {
      if (v23) {
        (*((void (**)(id))v23 + 2))(v23);
      }
    }
    else
    {
      [v9 resignFirstResponder];
    }

    goto LABEL_13;
  }
  [v9 selectedRange];
  v13 = (uint64_t *)MEMORY[0x263F814A0];
  if (v14 || [v10 length]) {
    goto LABEL_4;
  }
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  LOBYTE(v32) = 0;
  v26 = [v9 attributedText];
  uint64_t v27 = *v13;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __67__WFContactField_textView_shouldChangeTextInRange_replacementText___block_invoke;
  v35[3] = &unk_264BFD6F0;
  v35[4] = &v29;
  objc_msgSend(v26, "enumerateAttribute:inRange:options:usingBlock:", v27, location, length, 0, v35);

  if (*((unsigned char *)v30 + 24))
  {
    objc_msgSend(v9, "setSelectedRange:", location, length);
    _Block_object_dispose(&v29, 8);
LABEL_13:
    BOOL v21 = 0;
    goto LABEL_16;
  }
  _Block_object_dispose(&v29, 8);
LABEL_4:
  v15 = [(WFContactField *)self textView];
  v16 = [v15 attributedText];
  uint64_t v17 = [v16 length];

  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3010000000;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  v32 = &unk_234BA41F7;
  v18 = [(WFContactField *)self textView];
  v19 = [v18 attributedText];
  uint64_t v20 = *v13;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __67__WFContactField_textView_shouldChangeTextInRange_replacementText___block_invoke_2;
  v28[3] = &unk_264BFD6F0;
  v28[4] = &v29;
  objc_msgSend(v19, "enumerateAttribute:inRange:options:usingBlock:", v20, 0, v17, 0, v28);

  BOOL v21 = ![v10 length]
     || [(WFContactField *)self allowsTextEntry] && location >= v30[5] + v30[4];
  _Block_object_dispose(&v29, 8);
LABEL_16:

  return v21;
}

uint64_t __67__WFContactField_textView_shouldChangeTextInRange_replacementText___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2 != 0;
  *a5 = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  return result;
}

uint64_t __67__WFContactField_textView_shouldChangeTextInRange_replacementText___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
    if ((unint64_t)(a3 + a4) > *(void *)(v4 + 40) + *(void *)(v4 + 32))
    {
      *(void *)(v4 + 32) = a3;
      *(void *)(v4 + 40) = a4;
    }
  }
  return result;
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(WFContactField *)self textView];
  [v5 updateTextAttachments];

  uint64_t v6 = [v4 selectedRange];
  uint64_t v8 = v7;

  -[WFContactField setSelectedRange:](self, "setSelectedRange:", v6, v8);
}

- (void)textViewDidEndEditing:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = [(WFContactField *)self textView];
  uint64_t v5 = [v4 selectedRange];
  id v12 = 0;
  int64_t v7 = -[WFContactField tokenizeFreeTextFromRange:freeTextModificationBlock:](self, "tokenizeFreeTextFromRange:freeTextModificationBlock:", v5, v6, &v12);
  uint64_t v8 = (void (**)(void))v12;

  id v9 = [MEMORY[0x263F08A00] defaultCenter];
  v13 = @"WFContactFieldTokenizationResultNotificationTokenizationResultKey";
  id v10 = [NSNumber numberWithInteger:v7];
  v14[0] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  [v9 postNotificationName:@"WFContactFieldTokenizationResultNotification" object:self userInfo:v11];

  if (v8) {
    v8[2](v8);
  }
}

- (unint64_t)numberOfValuesForProperties:(id)a3 inContact:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v5);
        }
        id v12 = objc_msgSend(v6, "valueForPropertyID:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "intValue"));
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v13 = [v12 count];
        }
        else {
          uint64_t v13 = v12 != 0;
        }
        v9 += v13;
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)text:(id)a3 containsMatchesForProperties:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (-[WFContactField text:containsMatchesForProperty:](self, "text:containsMatchesForProperty:", v6, objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "intValue", (void)v14)))
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)text:(id)a3 containsMatchesForProperty:(int)a4
{
  id v5 = a3;
  switch(a4)
  {
    case 3:
      char v6 = [MEMORY[0x263F33928] stringContainsPhoneNumbers:v5];
      break;
    case 22:
      char v6 = [MEMORY[0x263F339D8] stringContainsURLs:v5];
      break;
    case 4:
      char v6 = [MEMORY[0x263F33860] stringContainsEmailAddresses:v5];
      break;
    default:
      BOOL v7 = 0;
      goto LABEL_9;
  }
  BOOL v7 = v6;
LABEL_9:

  return v7;
}

- (void)chooseMultivalueIndexIfNecessaryForContact:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WFContactField *)self supportedPersonProperties];
  uint64_t v9 = [(WFContactField *)self numberOfValuesForProperties:v8 inContact:v6];

  if (v9 > 1)
  {
    uint64_t v10 = (WFContactPickerCoordinator *)objc_opt_new();
    contactPicker = self->_contactPicker;
    self->_contactPicker = v10;

    BOOL v12 = [(WFContactField *)self supportedPersonProperties];
    [(WFContactPickerCoordinator *)self->_contactPicker setSupportedPersonProperties:v12];

    uint64_t v13 = [(WFContactField *)self containingViewController];
    [(WFContactPickerCoordinator *)self->_contactPicker setPresentingViewController:v13];

    long long v14 = (void *)MEMORY[0x263F87988];
    long long v15 = [(WFContactField *)self plusButton];
    long long v16 = [(WFContactField *)self plusButton];
    [v16 bounds];
    long long v17 = objc_msgSend(v14, "sourceWithView:rect:", v15);
    [(WFContactPickerCoordinator *)self->_contactPicker setPresentationSource:v17];

    objc_initWeak(&location, self);
    long long v18 = self->_contactPicker;
    uint64_t v19 = [v6 contact];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __68__WFContactField_chooseMultivalueIndexIfNecessaryForContact_sender___block_invoke;
    v20[3] = &unk_264BFDB78;
    objc_copyWeak(&v21, &location);
    [(WFContactPickerCoordinator *)v18 presentHandlePickerForContact:v19 completionHandler:v20];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    [(WFContactField *)self insertContact:v6];
  }
}

void __68__WFContactField_chooseMultivalueIndexIfNecessaryForContact_sender___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4) {
    [WeakRetained insertContact:v4];
  }
  [WeakRetained setContactPicker:0];
}

- (void)presentContactSelectionActionSheetForText:(id)a3 attributedText:(id)a4 replacementRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v64 = a4;
  uint64_t v10 = [(WFContactField *)self supportedPersonProperties];
  v11 = [MEMORY[0x263F33748] requiredKeysToFetch];
  BOOL v12 = [MEMORY[0x263EFEBF8] descriptorForRequiredKeys];
  uint64_t v13 = [v11 arrayByAddingObject:v12];

  long long v14 = v9;
  long long v15 = (void *)v13;
  long long v16 = objc_opt_new();
  long long v17 = [v16 contactsWithName:v9 keysToFetch:v13];
  v85[0] = MEMORY[0x263EF8330];
  v85[1] = 3221225472;
  v85[2] = __92__WFContactField_presentContactSelectionActionSheetForText_attributedText_replacementRange___block_invoke;
  v85[3] = &unk_264BFD740;
  v85[4] = self;
  id v18 = v10;
  id v86 = v18;
  uint64_t v19 = objc_msgSend(v17, "if_objectsPassingTest:", v85);

  v60 = v15;
  if ([v18 containsObject:&unk_26E7C1750]
    && ([v18 containsObject:&unk_26E7C1768] & 1) != 0)
  {
    NSUInteger v20 = location;
    NSUInteger v21 = length;
    int64_t v22 = @"a phone number or email address";
LABEL_8:
    uint64_t v23 = WFLocalizedString(v22);
    goto LABEL_9;
  }
  NSUInteger v20 = location;
  if ([v18 containsObject:&unk_26E7C1750])
  {
    NSUInteger v21 = length;
    int64_t v22 = @"an email address";
    goto LABEL_8;
  }
  NSUInteger v21 = length;
  if ([v18 containsObject:&unk_26E7C1768])
  {
    int64_t v22 = @"a phone number";
    goto LABEL_8;
  }
  uint64_t v23 = 0;
LABEL_9:
  v24 = [MEMORY[0x263F336E8] alertWithPreferredStyle:1];
  v25 = (void *)MEMORY[0x263F87988];
  v26 = [(WFContactField *)self plusButton];
  uint64_t v27 = [v25 sourceWithView:v26];
  [v24 setPresentationSource:v27];

  v28 = NSString;
  uint64_t v29 = WFLocalizedString(@"“%1$@” doesn’t look like %2$@. Did you mean to add a contact?");
  v57 = (void *)v23;
  v30 = objc_msgSend(v28, "localizedStringWithFormat:", v29, v14, v23);
  [v24 setMessage:v30];

  unint64_t v31 = 0x263F33000uLL;
  v32 = [MEMORY[0x263F336F0] cancelButtonWithHandler:0];
  [v24 addButton:v32];

  v58 = v19;
  v59 = v18;
  v56 = self;
  if ([v19 count])
  {
    v62 = v24;
    v63 = v14;
    NSUInteger v33 = v21;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id obj = v19;
    uint64_t v34 = [obj countByEnumeratingWithState:&v81 objects:v87 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v82 != v36) {
            objc_enumerationMutation(obj);
          }
          v38 = *(void **)(*((void *)&v81 + 1) + 8 * i);
          v39 = (void *)MEMORY[0x263F33978];
          v40 = [v38 formattedName];
          v75[0] = MEMORY[0x263EF8330];
          v75[1] = 3221225472;
          v75[2] = __92__WFContactField_presentContactSelectionActionSheetForText_attributedText_replacementRange___block_invoke_230;
          v75[3] = &unk_264BFD768;
          v75[4] = self;
          id v76 = v64;
          NSUInteger v79 = v20;
          NSUInteger v80 = v33;
          id v77 = v63;
          v78 = v38;
          v41 = [v39 buttonWithTitle:v40 style:0 handler:v75];
          [v62 addButton:v41];
        }
        uint64_t v35 = [obj countByEnumeratingWithState:&v81 objects:v87 count:16];
      }
      while (v35);
    }

    NSUInteger v21 = v33;
    long long v14 = v63;
    v42 = v64;
    v43 = v62;
    unint64_t v31 = 0x263F33000;
  }
  else
  {
    v44 = (void *)MEMORY[0x263F336F0];
    v45 = WFLocalizedString(@"Search Contacts");
    v70[0] = MEMORY[0x263EF8330];
    v70[1] = 3221225472;
    v70[2] = __92__WFContactField_presentContactSelectionActionSheetForText_attributedText_replacementRange___block_invoke_2;
    v70[3] = &unk_264BFD718;
    v70[4] = self;
    v42 = v64;
    id v71 = v64;
    NSUInteger v73 = v20;
    NSUInteger v74 = v21;
    id v72 = v14;
    v46 = [v44 buttonWithTitle:v45 style:0 handler:v70];
    [v24 addButton:v46];

    v43 = v24;
  }
  v47 = *(void **)(v31 + 1776);
  v48 = NSString;
  v49 = WFLocalizedString(@"Use “%@” Anyway");
  v50 = objc_msgSend(v48, "localizedStringWithFormat:", v49, v14);
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __92__WFContactField_presentContactSelectionActionSheetForText_attributedText_replacementRange___block_invoke_3;
  v65[3] = &unk_264BFD718;
  v65[4] = v56;
  id v66 = v42;
  NSUInteger v68 = v20;
  NSUInteger v69 = v21;
  id v67 = v14;
  id v51 = v14;
  id v52 = v42;
  v53 = [v47 buttonWithTitle:v50 style:0 handler:v65];
  [v43 addButton:v53];

  v54 = [(WFContactField *)v56 containingViewController];
  v55 = WFUserInterfaceFromViewController();
  [v55 presentAlert:v43];
}

BOOL __92__WFContactField_presentContactSelectionActionSheetForText_attributedText_replacementRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) numberOfValuesForProperties:*(void *)(a1 + 40) inContact:a2] != 0;
}

void __92__WFContactField_presentContactSelectionActionSheetForText_attributedText_replacementRange___block_invoke_230(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "deleteFreeText:replacementRange:newValue:", *(void *)(a1 + 40), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  id v4 = [v2 plusButton];
  [v2 chooseMultivalueIndexIfNecessaryForContact:v3 sender:v4];
}

uint64_t __92__WFContactField_presentContactSelectionActionSheetForText_attributedText_replacementRange___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) showContactPicker];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  return objc_msgSend(v2, "deleteFreeText:replacementRange:newValue:", v3, v4, v6, v5);
}

uint64_t __92__WFContactField_presentContactSelectionActionSheetForText_attributedText_replacementRange___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tokenizeFreeText:replacementRange:newValue:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 48));
}

- (void)tokenizeFreeText:(id)a3 replacementRange:(_NSRange)a4 newValue:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  id v10 = a3;
  uint64_t v19 = [(WFValueTextAttachment *)[WFContactTextAttachment alloc] initWithData:0 ofType:0];
  [(WFValueTextAttachment *)v19 setStringValue:v9];

  v11 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v19];
  objc_msgSend(v10, "replaceCharactersInRange:withAttributedString:", location, length, v11);

  BOOL v12 = [(WFContactField *)self textView];
  uint64_t v13 = [v12 typingAttributes];
  objc_msgSend(v10, "addAttributes:range:", v13, 0, objc_msgSend(v10, "length"));

  long long v14 = [(WFContactField *)self textView];
  [v14 setAttributedText:v10];

  long long v15 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v16 = *MEMORY[0x263F83BE8];
  long long v17 = [(WFContactField *)self textView];
  [v15 postNotificationName:v16 object:v17];

  id v18 = [(WFContactField *)self textView];
  [v18 updateTextAttachments];

  [(WFContactField *)self updateContactsFromTextField:0];
}

- (void)deleteFreeText:(id)a3 replacementRange:(_NSRange)a4 newValue:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  objc_msgSend(v8, "deleteCharactersInRange:", location, length);
  id v9 = [(WFContactField *)self textView];
  [v9 setAttributedText:v8];

  id v10 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v11 = *MEMORY[0x263F83BE8];
  BOOL v12 = [(WFContactField *)self textView];
  [v10 postNotificationName:v11 object:v12];

  uint64_t v13 = [(WFContactField *)self textView];
  [v13 updateTextAttachments];

  [(WFContactField *)self updateContactsFromTextField:0];
}

- (int64_t)tokenizeFreeTextFromRange:(_NSRange)a3 freeTextModificationBlock:(id *)a4
{
  uint64_t v6 = [(WFContactField *)self textView];
  id v7 = [v6 attributedText];
  uint64_t v8 = [v7 length];

  uint64_t v30 = 0;
  unint64_t v31 = &v30;
  uint64_t v32 = 0x3010000000;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  NSUInteger v33 = &unk_234BA41F7;
  id v9 = [(WFContactField *)self textView];
  id v10 = [v9 attributedText];
  uint64_t v11 = *MEMORY[0x263F814A0];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __70__WFContactField_tokenizeFreeTextFromRange_freeTextModificationBlock___block_invoke;
  v29[3] = &unk_264BFD6F0;
  v29[4] = &v30;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v8, 0, v29);

  BOOL v12 = [(WFContactField *)self textView];
  uint64_t v13 = [v12 attributedText];
  long long v14 = (void *)[v13 mutableCopy];

  uint64_t v16 = v31[4];
  uint64_t v15 = v31[5];
  uint64_t v17 = v15 + v16;
  uint64_t v18 = v8 - (v15 + v16);
  if (v8 != v15 + v16)
  {
    NSUInteger v20 = objc_msgSend(v14, "attributedSubstringFromRange:", v15 + v16, v8 - (v15 + v16));
    NSUInteger v21 = [v20 string];

    int64_t v22 = [(WFContactField *)self supportedPersonProperties];
    if (([(WFContactField *)self allowsTextEntry]
       || ([MEMORY[0x263F82670] currentDevice],
           uint64_t v23 = objc_claimAutoreleasedReturnValue(),
           uint64_t v24 = [v23 userInterfaceIdiom],
           v23,
           v24 == 1))
      && ![(WFContactField *)self text:v21 containsMatchesForProperties:v22])
    {
      if (!a4)
      {
        int64_t v19 = 2;
        goto LABEL_13;
      }
      v25 = (id *)v28;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __70__WFContactField_tokenizeFreeTextFromRange_freeTextModificationBlock___block_invoke_2;
      v28[3] = &unk_264BFD718;
      v28[4] = self;
      void v28[5] = v21;
      v28[6] = v14;
      v28[7] = v17;
      v28[8] = v18;
      int64_t v19 = 2;
    }
    else
    {
      if (!a4)
      {
        int64_t v19 = 1;
        goto LABEL_13;
      }
      v25 = (id *)v27;
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __70__WFContactField_tokenizeFreeTextFromRange_freeTextModificationBlock___block_invoke_3;
      v27[3] = &unk_264BFD718;
      v27[4] = self;
      v27[5] = v14;
      v27[7] = v17;
      v27[8] = v18;
      v27[6] = v21;
      int64_t v19 = 1;
    }
    *a4 = _Block_copy(v25);

LABEL_13:
    goto LABEL_14;
  }
  int64_t v19 = 0;
LABEL_14:

  _Block_object_dispose(&v30, 8);
  return v19;
}

uint64_t __70__WFContactField_tokenizeFreeTextFromRange_freeTextModificationBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
    if ((unint64_t)(a3 + a4) > *(void *)(v4 + 40) + *(void *)(v4 + 32))
    {
      *(void *)(v4 + 32) = a3;
      *(void *)(v4 + 40) = a4;
    }
  }
  return result;
}

uint64_t __70__WFContactField_tokenizeFreeTextFromRange_freeTextModificationBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentContactSelectionActionSheetForText:attributedText:replacementRange:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
}

uint64_t __70__WFContactField_tokenizeFreeTextFromRange_freeTextModificationBlock___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tokenizeFreeText:replacementRange:newValue:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 48));
}

- (void)insertContact:(id)a3
{
  id v4 = a3;
  int64_t v22 = [(WFValueTextAttachment *)[WFContactTextAttachment alloc] initWithData:0 ofType:0];
  [(WFContactTextAttachment *)v22 setValue:v4];

  uint64_t v5 = [(WFContactField *)self textView];
  uint64_t v6 = [v5 textStorage];
  id v7 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v22];
  objc_msgSend(v6, "insertAttributedString:atIndex:", v7, -[WFContactField selectedRange](self, "selectedRange"));

  uint64_t v8 = [(WFContactField *)self textView];
  id v9 = [v8 textStorage];
  id v10 = [(WFContactField *)self textView];
  uint64_t v11 = [v10 typingAttributes];
  objc_msgSend(v9, "addAttributes:range:", v11, -[WFContactField selectedRange](self, "selectedRange"), 1);

  uint64_t v12 = [(WFContactField *)self selectedRange] + 1;
  uint64_t v13 = [(WFContactField *)self textView];
  objc_msgSend(v13, "setSelectedRange:", v12, 0);

  long long v14 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v15 = *MEMORY[0x263F83BE8];
  uint64_t v16 = [(WFContactField *)self textView];
  [v14 postNotificationName:v15 object:v16];

  uint64_t v17 = [(WFContactField *)self scrollView];
  uint64_t v18 = [(WFContactField *)self textView];
  int64_t v19 = [(WFContactField *)self textView];
  NSUInteger v20 = [v19 selectedTextRange];
  NSUInteger v21 = [v20 end];
  [v18 caretRectForPosition:v21];
  objc_msgSend(v17, "scrollRectToVisible:animated:", 0);

  [(WFContactField *)self updateContactsFromTextField:0];
}

- (void)showContactPicker
{
  uint64_t v3 = (WFContactPickerCoordinator *)objc_opt_new();
  contactPicker = self->_contactPicker;
  self->_contactPicker = v3;

  uint64_t v5 = [(WFContactField *)self supportedPersonProperties];
  [(WFContactPickerCoordinator *)self->_contactPicker setSupportedPersonProperties:v5];

  uint64_t v6 = [(WFContactField *)self containingViewController];
  [(WFContactPickerCoordinator *)self->_contactPicker setPresentingViewController:v6];

  id v7 = (void *)MEMORY[0x263F87988];
  uint64_t v8 = [(WFContactField *)self plusButton];
  id v9 = [(WFContactField *)self plusButton];
  [v9 bounds];
  id v10 = objc_msgSend(v7, "sourceWithView:rect:", v8);
  [(WFContactPickerCoordinator *)self->_contactPicker setPresentationSource:v10];

  objc_initWeak(&location, self);
  uint64_t v11 = self->_contactPicker;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __35__WFContactField_showContactPicker__block_invoke;
  v12[3] = &unk_264BFDB78;
  objc_copyWeak(&v13, &location);
  [(WFContactPickerCoordinator *)v11 presentContactPickerWithCompletionHandler:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __35__WFContactField_showContactPicker__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4) {
    [WeakRetained insertContact:v4];
  }
  [WeakRetained setContactPicker:0];
}

- (void)selectContact
{
  uint64_t v3 = [(WFContactField *)self textView];
  uint64_t v4 = [v3 selectedRange];
  id v8 = 0;
  int64_t v6 = -[WFContactField tokenizeFreeTextFromRange:freeTextModificationBlock:](self, "tokenizeFreeTextFromRange:freeTextModificationBlock:", v4, v5, &v8);
  id v7 = (void (**)(void))v8;

  if (v7) {
    v7[2](v7);
  }
  if (v6 != 2) {
    [(WFContactField *)self showContactPicker];
  }
}

- (id)containingViewController
{
  uint64_t v3 = [(WFContactField *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(WFContactField *)self delegate];
    int64_t v6 = [v5 viewControllerContainingContactField:self];
  }
  else
  {
    int64_t v6 = 0;
  }
  return v6;
}

- (void)updateContactsFromTextField:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(WFContactField *)self textView];
  uint64_t v6 = [v5 attributedText];
  WFContactEntriesFromAttributedString((void *)v6);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = [(WFContactField *)self entries];
  LOBYTE(v6) = [v11 isEqualToArray:v7];

  if ((v6 & 1) == 0)
  {
    if (v3)
    {
      id v8 = (NSArray *)[v11 copy];
      entries = self->_entries;
      self->_entries = v8;
    }
    else
    {
      [(WFContactField *)self setEntries:v11];
    }
    updateBlock = (void (**)(id, NSArray *))self->_updateBlock;
    if (updateBlock) {
      updateBlock[2](updateBlock, self->_entries);
    }
  }
  [(WFContactField *)self updateEditableState];
}

- (void)updateEditableState
{
  if ([(WFContactField *)self isEditable])
  {
    if ([(WFContactField *)self allowsTextEntry])
    {
      BOOL v3 = 1;
    }
    else
    {
      char v4 = [(WFContactField *)self entries];
      BOOL v3 = [v4 count] != 0;
    }
  }
  else
  {
    BOOL v3 = 0;
  }
  uint64_t v5 = [(WFContactField *)self textView];
  [v5 setEditable:v3];

  uint64_t v6 = [(WFContactField *)self textView];
  [v6 setSelectable:v3];

  BOOL v7 = [(WFContactField *)self isEditable];
  id v8 = [(WFContactField *)self plusButton];
  [v8 setEnabled:v7];

  id v9 = [(WFContactField *)self scrollView];
  [v9 setUserInteractionEnabled:v3];
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
  [(WFContactField *)self updateEditableState];
}

- (void)setAllowsTextEntry:(BOOL)a3
{
  BOOL v3 = a3;
  self->_allowsTextEntry = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  [WeakRetained setAllowsTextEntry:v3];

  [(WFContactField *)self updateEditableState];
}

- (void)setSupportedPersonProperties:(id)a3
{
  id v4 = a3;
  id v5 = [(WFContactField *)self textView];
  [v5 setSupportedPersonProperties:v4];
}

- (NSSet)supportedPersonProperties
{
  v2 = [(WFContactField *)self textView];
  BOOL v3 = [v2 supportedPersonProperties];

  return (NSSet *)v3;
}

- (void)setTextContentType:(id)a3
{
  id v4 = a3;
  id v5 = [(WFContactField *)self textView];
  [v5 setTextContentType:v4];
}

- (NSString)textContentType
{
  v2 = [(WFContactField *)self textView];
  BOOL v3 = [v2 textContentType];

  return (NSString *)v3;
}

- (void)setTextAlignment:(int64_t)a3
{
  id v4 = [(WFContactField *)self textView];
  [v4 setTextAlignment:a3];
}

- (int64_t)textAlignment
{
  v2 = [(WFContactField *)self textView];
  int64_t v3 = [v2 textAlignment];

  return v3;
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  id v4 = [(WFContactField *)self textView];
  [v4 setKeyboardAppearance:a3];
}

- (int64_t)keyboardAppearance
{
  v2 = [(WFContactField *)self textView];
  int64_t v3 = [v2 keyboardAppearance];

  return v3;
}

- (void)setKeyboardType:(int64_t)a3
{
  id v4 = [(WFContactField *)self textView];
  [v4 setKeyboardType:a3];
}

- (int64_t)keyboardType
{
  v2 = [(WFContactField *)self textView];
  int64_t v3 = [v2 keyboardType];

  return v3;
}

- (void)setPlaceholder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFContactField *)self textView];
  [v5 setPlaceholder:v4];
}

- (NSString)placeholder
{
  v2 = [(WFContactField *)self textView];
  int64_t v3 = [v2 placeholder];

  return (NSString *)v3;
}

- (void)setEntries:(id)a3
{
  uint64_t v4 = [a3 copy];
  id v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (void *)v4;
  }
  else {
    uint64_t v6 = (void *)MEMORY[0x263EFFA68];
  }
  objc_storeStrong((id *)&self->_entries, v6);

  entries = self->_entries;
  id v8 = [(WFContactField *)self textView];
  id v9 = [v8 typingAttributes];
  id v10 = WFAttributedStringFromContactEntries(entries, v9, 1);
  id v11 = [(WFContactField *)self textView];
  [v11 setAttributedText:v10];

  uint64_t v12 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v13 = *MEMORY[0x263F83BE8];
  long long v14 = [(WFContactField *)self textView];
  [v12 postNotificationName:v13 object:v14];

  uint64_t v15 = [(WFContactField *)self textView];
  [v15 updateTextAttachments];

  [(WFContactField *)self updateEditableState];
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)WFContactField;
  [(WFContactField *)&v16 layoutSubviews];
  int64_t v3 = [MEMORY[0x263F33718] sharedContext];
  int v4 = [v3 shouldReverseLayoutDirection];

  double v5 = 0.0;
  if (v4) {
    double v6 = 35.0;
  }
  else {
    double v6 = 0.0;
  }
  [(WFContactField *)self bounds];
  double v8 = v7 + -35.0;
  [(WFContactField *)self bounds];
  double v10 = v9;
  id v11 = [(WFContactField *)self scrollView];
  objc_msgSend(v11, "setFrame:", v6, 0.0, v8, v10);

  if ((v4 & 1) == 0)
  {
    id v11 = [(WFContactField *)self scrollView];
    [v11 bounds];
    double v5 = v12 + 5.0;
  }
  [(WFContactField *)self bounds];
  double v14 = v13;
  uint64_t v15 = [(WFContactField *)self plusButton];
  objc_msgSend(v15, "setFrame:", v5, 0.0, 30.0, v14);

  if ((v4 & 1) == 0) {
}
  }

- (WFContactField)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)WFContactField;
  int64_t v3 = -[WFContactField initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    int v4 = objc_alloc_init(WFContactTextView);
    double v5 = [(WFContactField *)v3 typingAttributes];
    [(WFContactTextView *)v4 setTypingAttributes:v5];

    double v6 = [MEMORY[0x263F825C8] clearColor];
    [(WFContactTextView *)v4 setBackgroundColor:v6];

    [(WFContactTextView *)v4 setAutocapitalizationType:[(WFContactField *)v3 autocapitalizationType]];
    double v7 = [(WFContactTextView *)v4 textContainer];
    [v7 setLineFragmentPadding:0.0];

    entries = v3->_entries;
    v3->_entries = (NSArray *)MEMORY[0x263EFFA68];

    [(WFContactField *)v3 setTextView:v4];
    double v9 = (void *)[objc_alloc(MEMORY[0x263F879D0]) initWithTextView:v4];
    [v9 setTextViewDelegate:v3];
    [(WFContactField *)v3 addSubview:v9];
    [(WFContactField *)v3 setScrollView:v9];
    double v10 = [MEMORY[0x263F824E8] buttonWithType:1];
    id v11 = WFLocalizedString(@"Add Contact");
    [v10 setAccessibilityLabel:v11];

    double v12 = [MEMORY[0x263F827E8] systemImageNamed:@"plus.circle"];
    [v10 setImage:v12 forState:0];

    [v10 addTarget:v3 action:sel_selectContact forControlEvents:64];
    [(WFContactField *)v3 addSubview:v10];
    [(WFContactField *)v3 setPlusButton:v10];
    [(WFContactField *)v3 updateEditableState];
    double v13 = v3;
  }
  return v3;
}

@end