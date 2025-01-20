@interface PKAddressEditorViewController
- (BOOL)_canChangeCountry;
- (BOOL)countryIsEditable;
- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground;
- (BOOL)readOnly;
- (BOOL)requirementsMet;
- (CNMutablePostalAddress)inputAddress;
- (CNMutablePostalAddress)originalAddress;
- (CNPostalAddressFormattingSpecification)addressFormatter;
- (MKLocalSearchCompleter)searchCompleter;
- (NSArray)editingFields;
- (NSArray)errors;
- (NSArray)highlightedFieldKeys;
- (NSArray)requiredFieldKeys;
- (NSArray)suggestions;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)inputLabel;
- (NSString)originalCountry;
- (NSString)originalFamilyName;
- (NSString)originalGivenName;
- (NSString)originalPhoneticFamilyName;
- (NSString)originalPhoneticGivenName;
- (NSString)phoneticFamilyName;
- (NSString)phoneticGivenName;
- (PKAddressEditorViewController)initWithContact:(id)a3 requiredKeys:(id)a4 highlightedKeys:(id)a5 errors:(id)a6 style:(int64_t)a7;
- (PKAddressEditorViewController)initWithContact:(id)a3 style:(int64_t)a4;
- (PKAddressEditorViewControllerDelegate)delegate;
- (PKAddressTextField)countryTextField;
- (PKAddressTextField)currentlySelectedField;
- (PKAddressTextField)familyNameTextField;
- (PKAddressTextField)firstTextFieldForName;
- (PKAddressTextField)givenNameTextField;
- (PKAddressTextField)phoneticFamilyNameTextField;
- (PKAddressTextField)phoneticGivenNameTextField;
- (PKAddressTextField)previouslySelectedField;
- (PKAddressTextField)street1TextField;
- (PKAddressTextField)street2TextField;
- (PKContactFormatValidator)contactFormatValidator;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_fieldIndexForNameComponent:(unint64_t)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)style;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_nameComponentForFieldIndex:(unint64_t)a3;
- (void)_checkFormatOfAddressTextField:(id)a3;
- (void)_presentCountryPickerIfEditable;
- (void)_presentPickerForAddressTextField:(id)a3;
- (void)_updateUniqueAddressField:(id)a3 withNewString:(id)a4;
- (void)_updateWithPostalAddress:(id)a3;
- (void)_validateAddressRequirements;
- (void)addressTextField:(id)a3 didEndEditing:(id)a4;
- (void)addressTextField:(id)a3 textDidChange:(id)a4;
- (void)assignErrorToField:(id)a3;
- (void)cancel;
- (void)completer:(id)a3 didFailWithError:(id)a4;
- (void)completerDidUpdateResults:(id)a3;
- (void)countryPicker:(id)a3 didPickCountryCode:(id)a4;
- (void)donePressed;
- (void)recomputeEditingFields;
- (void)setAddressFormatter:(id)a3;
- (void)setContactFormatValidator:(id)a3;
- (void)setCountryIsEditable:(BOOL)a3;
- (void)setCountryTextField:(id)a3;
- (void)setCurrentlySelectedField:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditingFields:(id)a3;
- (void)setErrors:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setFamilyNameTextField:(id)a3;
- (void)setFirstTextFieldForName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setGivenNameTextField:(id)a3;
- (void)setHighlightedFieldKeys:(id)a3;
- (void)setInputAddress:(id)a3;
- (void)setInputLabel:(id)a3;
- (void)setOriginalAddress:(id)a3;
- (void)setOriginalCountry:(id)a3;
- (void)setOriginalFamilyName:(id)a3;
- (void)setOriginalGivenName:(id)a3;
- (void)setOriginalPhoneticFamilyName:(id)a3;
- (void)setOriginalPhoneticGivenName:(id)a3;
- (void)setPhoneticFamilyName:(id)a3;
- (void)setPhoneticFamilyNameTextField:(id)a3;
- (void)setPhoneticGivenName:(id)a3;
- (void)setPhoneticGivenNameTextField:(id)a3;
- (void)setPreviouslySelectedField:(id)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setRequiredFieldKeys:(id)a3;
- (void)setRequirementsMet:(BOOL)a3;
- (void)setSearchCompleter:(id)a3;
- (void)setStreet1TextField:(id)a3;
- (void)setStreet2TextField:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSuggestions:(id)a3;
- (void)textDidChange:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation PKAddressEditorViewController

- (PKAddressEditorViewController)initWithContact:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  v7 = [(PKAddressEditorViewController *)self initWithStyle:0];
  if (v7)
  {
    if (v6)
    {
      uint64_t v8 = [v6 givenName];
      originalGivenName = v7->_originalGivenName;
      v7->_originalGivenName = (NSString *)v8;

      uint64_t v10 = [v6 familyName];
      originalFamilyName = v7->_originalFamilyName;
      v7->_originalFamilyName = (NSString *)v10;

      uint64_t v12 = [(NSString *)v7->_originalGivenName copy];
      givenName = v7->_givenName;
      v7->_givenName = (NSString *)v12;

      uint64_t v14 = [(NSString *)v7->_originalFamilyName copy];
      familyName = v7->_familyName;
      v7->_familyName = (NSString *)v14;

      v16 = [v6 nameComponents];
      v17 = [v16 phoneticRepresentation];
      uint64_t v18 = [v17 givenName];
      originalPhoneticGivenName = v7->_originalPhoneticGivenName;
      v7->_originalPhoneticGivenName = (NSString *)v18;

      v20 = [v6 nameComponents];
      v21 = [v20 phoneticRepresentation];
      uint64_t v22 = [v21 familyName];
      originalPhoneticFamilyName = v7->_originalPhoneticFamilyName;
      v7->_originalPhoneticFamilyName = (NSString *)v22;

      uint64_t v24 = [(NSString *)v7->_originalPhoneticGivenName copy];
      phoneticGivenName = v7->_phoneticGivenName;
      v7->_phoneticGivenName = (NSString *)v24;

      uint64_t v26 = [(NSString *)v7->_originalPhoneticFamilyName copy];
      phoneticFamilyName = v7->_phoneticFamilyName;
      v7->_phoneticFamilyName = (NSString *)v26;

      v28 = (void *)MEMORY[0x1E4F1B910];
      id v29 = objc_alloc_init(MEMORY[0x1E4F1B8F8]);
      v7->_displayGivenNameFirst = [v28 nameOrderForContact:v29] == 1;
    }
    v30 = [v6 postalAddresses];
    uint64_t v31 = [v30 count];

    if (v31)
    {
      v32 = [v6 postalAddresses];
      v33 = [v32 firstObject];

      v34 = [v6 postalAddresses];
      v35 = [v34 firstObject];
      v36 = [v35 value];
      uint64_t v37 = [v36 mutableCopy];
      originalAddress = v7->_originalAddress;
      v7->_originalAddress = (CNMutablePostalAddress *)v37;

      v39 = [v33 value];
      uint64_t v40 = [v39 mutableCopy];
      inputAddress = v7->_inputAddress;
      v7->_inputAddress = (CNMutablePostalAddress *)v40;

      uint64_t v42 = [v33 label];
      inputLabel = v7->_inputLabel;
      v7->_inputLabel = (NSString *)v42;
    }
    else
    {
      v44 = (CNMutablePostalAddress *)objc_alloc_init(MEMORY[0x1E4F1BA58]);
      v45 = v7->_inputAddress;
      v7->_inputAddress = v44;
    }
    if (![(NSString *)v7->_inputLabel length]) {
      objc_storeStrong((id *)&v7->_inputLabel, (id)*MEMORY[0x1E4F1B6F8]);
    }
    v46 = [MEMORY[0x1E4F1CA20] currentLocale];
    v47 = [(CNMutablePostalAddress *)v7->_inputAddress ISOCountryCode];
    uint64_t v48 = [v47 length];

    if (v48 == 2) {
      [(CNMutablePostalAddress *)v7->_inputAddress ISOCountryCode];
    }
    else {
    v49 = PKCurrentRegion();
    }
    v50 = [v46 displayNameForKey:*MEMORY[0x1E4F1C400] value:v49];
    v51 = v7->_originalAddress;
    if (v51)
    {
      uint64_t v52 = [(CNMutablePostalAddress *)v51 country];
      originalCountry = v7->_originalCountry;
      v7->_originalCountry = (NSString *)v52;

      v54 = v7->_originalAddress;
      v55 = (void *)[v50 copy];
      [(CNMutablePostalAddress *)v54 setCountry:v55];

      v56 = v7->_originalAddress;
      v57 = (void *)[v49 copy];
      [(CNMutablePostalAddress *)v56 setISOCountryCode:v57];
    }
    [(CNMutablePostalAddress *)v7->_inputAddress setCountry:v50];
    [(CNMutablePostalAddress *)v7->_inputAddress setISOCountryCode:v49];
    v58 = (MKLocalSearchCompleter *)objc_alloc_init(MEMORY[0x1E4F30EE0]);
    searchCompleter = v7->_searchCompleter;
    v7->_searchCompleter = v58;

    [(MKLocalSearchCompleter *)v7->_searchCompleter setDelegate:v7];
    [(MKLocalSearchCompleter *)v7->_searchCompleter setResultTypes:2];
    uint64_t v60 = [(NSString *)v7->_givenName length];
    BOOL v61 = 1;
    if (!v60) {
      BOOL v61 = [(NSString *)v7->_familyName length] != 0;
    }
    v7->_preselectedNameField = v61;
    highlightedFieldKeys = v7->_highlightedFieldKeys;
    v63 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v7->_highlightedFieldKeys = (NSArray *)MEMORY[0x1E4F1CBF0];

    requiredFieldKeys = v7->_requiredFieldKeys;
    v7->_requiredFieldKeys = v63;

    v7->_style = a4;
    v7->_countryIsEditable = 1;
    v7->_isEditingBlankField = 0;
    id v65 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v66 = PKLocalizedString(&cfstr_Done.isa);
    v67 = (void *)[v65 initWithTitle:v66 style:2 target:v7 action:sel_donePressed];

    v68 = [(PKAddressEditorViewController *)v7 navigationItem];
    [v68 setRightBarButtonItem:v67];

    [(PKAddressEditorViewController *)v7 recomputeEditingFields];
  }

  return v7;
}

- (PKAddressEditorViewController)initWithContact:(id)a3 requiredKeys:(id)a4 highlightedKeys:(id)a5 errors:(id)a6 style:(int64_t)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [(PKAddressEditorViewController *)self initWithContact:a3 style:a7];
  if (v15)
  {
    uint64_t v16 = [v13 copy];
    highlightedFieldKeys = v15->_highlightedFieldKeys;
    v15->_highlightedFieldKeys = (NSArray *)v16;

    uint64_t v18 = [v12 copy];
    requiredFieldKeys = v15->_requiredFieldKeys;
    v15->_requiredFieldKeys = (NSArray *)v18;

    v15->_displayPhoneticName = [(NSArray *)v15->_requiredFieldKeys containsObject:*MEMORY[0x1E4F87128]];
    uint64_t v20 = [v14 copy];
    errors = v15->_errors;
    v15->_errors = (NSArray *)v20;

    [(PKAddressEditorViewController *)v15 recomputeEditingFields];
  }

  return v15;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PKAddressEditorViewController;
  [(PKAddressEditorViewController *)&v5 viewDidLoad];
  v3 = [(PKAddressEditorViewController *)self tableView];
  [v3 setContentInsetAdjustmentBehavior:0];
  [v3 setKeyboardDismissMode:1];
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  [v3 setRowHeight:*MEMORY[0x1E4FB2F28]];
  [v3 setEstimatedRowHeight:44.0];
  [v3 setAccessibilityIdentifier:*MEMORY[0x1E4F85200]];
  [(PKAddressEditorViewController *)self _validateAddressRequirements];
}

- (void)willMoveToParentViewController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKAddressEditorViewController;
  [(PKAddressEditorViewController *)&v9 willMoveToParentViewController:a3];
  v4 = [(PKAddressEditorViewController *)self navigationController];
  objc_super v5 = [v4 viewControllers];
  uint64_t v6 = [v5 count];

  if (v6 == 1)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel];
    [v7 setAccessibilityIdentifier:*MEMORY[0x1E4F85488]];
    uint64_t v8 = [(PKAddressEditorViewController *)self navigationItem];
    [v8 setLeftBarButtonItem:v7 animated:1];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKAddressEditorViewController;
  [(PKAddressEditorViewController *)&v7 viewWillAppear:a3];
  v4 = [(PKAddressEditorViewController *)self tableView];
  [v4 beginUpdates];

  objc_super v5 = [(PKAddressEditorViewController *)self tableView];
  [v5 endUpdates];

  uint64_t v6 = [(PKAddressEditorViewController *)self tableView];
  [v6 contentSize];
  -[PKAddressEditorViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKAddressEditorViewController;
  [(PKAddressEditorViewController *)&v6 viewDidAppear:a3];
  if (self->_presentedCountrySelector)
  {
    self->_presentedCountrySelector = 0;
    previouslySelectedField = self->_previouslySelectedField;
    if (previouslySelectedField)
    {
      objc_super v5 = previouslySelectedField;
    }
    else
    {
      objc_super v5 = self->_firstTextFieldForName;
      if (!v5) {
        return;
      }
    }
    [(PKAddressTextField *)v5 becomeFirstResponder];
    [(PKAddressTextField *)v5 resignFirstResponder];
  }
  else if (!self->_preselectedNameField && !self->_readOnly)
  {
    [(PKAddressTextField *)self->_firstTextFieldForName becomeFirstResponder];
    self->_preselectedNameField = 1;
  }
}

- (void)donePressed
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (self->_requirementsMet)
  {
    v3 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:self->_inputLabel value:self->_inputAddress];
    id v4 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    if ([(NSString *)self->_givenName length]) {
      givenName = self->_givenName;
    }
    else {
      givenName = 0;
    }
    [v4 setGivenName:givenName];
    if ([(NSString *)self->_familyName length]) {
      familyName = self->_familyName;
    }
    else {
      familyName = 0;
    }
    [v4 setFamilyName:familyName];
    if ([(NSString *)self->_phoneticGivenName length]
      || [(NSString *)self->_phoneticFamilyName length])
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F28F30]);
      if ([(NSString *)self->_phoneticGivenName length]) {
        phoneticGivenName = self->_phoneticGivenName;
      }
      else {
        phoneticGivenName = 0;
      }
      [v7 setGivenName:phoneticGivenName];
      if ([(NSString *)self->_phoneticFamilyName length]) {
        phoneticFamilyName = self->_phoneticFamilyName;
      }
      else {
        phoneticFamilyName = 0;
      }
      [v7 setFamilyName:phoneticFamilyName];
    }
    else
    {
      id v7 = 0;
    }
    [v4 setPhoneticRepresentation:v7];
    uint64_t v10 = (void *)MEMORY[0x1E4F1B8F8];
    v14[0] = v3;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    id v12 = [v10 pkContactWithNameComponents:v4 postalAddresses:v11 emailAddresses:0 phoneNumbers:0];

    id v13 = [(PKAddressEditorViewController *)self delegate];
    [v13 addressEditorViewController:self selectedContact:v12];
  }
}

- (void)cancel
{
  id v3 = [(PKAddressEditorViewController *)self delegate];
  [v3 addressEditorViewControllerDidCancel:self];
}

- (void)recomputeEditingFields
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1BA88];
  id v4 = [(CNMutablePostalAddress *)self->_inputAddress ISOCountryCode];
  objc_super v5 = [v4 lowercaseString];
  objc_super v6 = [v3 specificationForCountry:v5];
  addressFormatter = self->_addressFormatter;
  self->_addressFormatter = v6;

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = *MEMORY[0x1E4F87118];
  if (![(NSArray *)self->_requiredFieldKeys containsObject:*MEMORY[0x1E4F87118]]
    && !self->_displayPhoneticName)
  {
    goto LABEL_27;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F850E0]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F850E0]);
  if (!self->_displayPhoneticName)
  {
    id v12 = 0;
    goto LABEL_7;
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F850E0]);
  if (!self->_displayPhoneticName)
  {
LABEL_7:
    id v13 = 0;
    goto LABEL_8;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F850E0]);
LABEL_8:
  [v10 setKey:v9];
  objc_msgSend(v10, "setIndex:", -[PKAddressEditorViewController _fieldIndexForNameComponent:](self, "_fieldIndexForNameComponent:", 0));
  [(PKAddressEditorViewController *)self assignErrorToField:v10];
  [v11 setKey:v9];
  objc_msgSend(v11, "setIndex:", -[PKAddressEditorViewController _fieldIndexForNameComponent:](self, "_fieldIndexForNameComponent:", 1));
  [(PKAddressEditorViewController *)self assignErrorToField:v11];
  if (self->_displayPhoneticName)
  {
    uint64_t v14 = *MEMORY[0x1E4F87128];
    [v12 setKey:*MEMORY[0x1E4F87128]];
    objc_msgSend(v12, "setIndex:", -[PKAddressEditorViewController _fieldIndexForNameComponent:](self, "_fieldIndexForNameComponent:", 2));
    [(PKAddressEditorViewController *)self assignErrorToField:v12];
    [v13 setKey:v14];
    objc_msgSend(v13, "setIndex:", -[PKAddressEditorViewController _fieldIndexForNameComponent:](self, "_fieldIndexForNameComponent:", 3));
    [(PKAddressEditorViewController *)self assignErrorToField:v13];
  }
  if (self->_displayGivenNameFirst) {
    id v15 = v10;
  }
  else {
    id v15 = v11;
  }
  [v8 safelyAddObject:v15];
  if (self->_displayPhoneticName)
  {
    if (self->_displayGivenNameFirst) {
      id v16 = v12;
    }
    else {
      id v16 = v13;
    }
    [v8 safelyAddObject:v16];
  }
  if (self->_displayGivenNameFirst) {
    id v17 = v11;
  }
  else {
    id v17 = v10;
  }
  [v8 safelyAddObject:v17];
  if (self->_displayPhoneticName)
  {
    if (self->_displayGivenNameFirst) {
      id v18 = v13;
    }
    else {
      id v18 = v12;
    }
    [v8 safelyAddObject:v18];
  }

LABEL_27:
  v19 = (CNMutablePostalAddress *)objc_alloc_init(MEMORY[0x1E4F1BA58]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = [(CNPostalAddressFormattingSpecification *)self->_addressFormatter editingFieldArrangement];
  uint64_t v42 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v42)
  {
    uint64_t v41 = *(void *)v52;
    uint64_t v46 = *MEMORY[0x1E4F1B7C8];
    uint64_t v20 = *MEMORY[0x1E4F1B7A0];
    v21 = (void *)*MEMORY[0x1E4F1B7A8];
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v52 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v43 = v22;
        v23 = *(void **)(*((void *)&v51 + 1) + 8 * v22);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v44 = v23;
        uint64_t v24 = [v44 countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v45 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v48 != v45) {
                objc_enumerationMutation(v44);
              }
              v27 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              id v28 = objc_alloc_init(MEMORY[0x1E4F850E0]);
              [v28 setKey:v27];
              [v28 setIndex:0];
              id v29 = v8;
              [v8 addObject:v28];
              [(PKAddressEditorViewController *)self assignErrorToField:v28];
              if ([v27 isEqualToString:v46])
              {
                id v30 = objc_alloc_init(MEMORY[0x1E4F850E0]);
                [v30 setKey:v46];
                [v30 setIndex:1];
                [v29 addObject:v30];
                [(PKAddressEditorViewController *)self assignErrorToField:v30];
              }
              if (([v27 isEqualToString:v20] & 1) != 0
                || [v27 isEqualToString:v21])
              {
                uint64_t v31 = [(CNMutablePostalAddress *)self->_inputAddress valueForKey:v20];
                [(CNMutablePostalAddress *)v19 setValue:v31 forKey:v20];

                v32 = [(CNMutablePostalAddress *)self->_inputAddress valueForKey:v21];
                v33 = v19;
                v34 = v32;
                v35 = v21;
              }
              else
              {
                v32 = [(CNMutablePostalAddress *)self->_inputAddress valueForKey:v27];
                v33 = v19;
                v34 = v32;
                v35 = v27;
              }
              [(CNMutablePostalAddress *)v33 setValue:v34 forKey:v35];

              id v8 = v29;
            }
            uint64_t v25 = [v44 countByEnumeratingWithState:&v47 objects:v55 count:16];
          }
          while (v25);
        }

        uint64_t v22 = v43 + 1;
      }
      while (v43 + 1 != v42);
      uint64_t v42 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v42);
  }

  inputAddress = self->_inputAddress;
  self->_inputAddress = v19;
  uint64_t v37 = v19;

  v38 = (NSArray *)[v8 copy];
  editingFields = self->_editingFields;
  self->_editingFields = v38;
}

- (void)assignErrorToField:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [v4 key];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v36 = self;
  id obj = self->_errors;
  uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (!v6) {
    goto LABEL_42;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v46;
  uint64_t v9 = *MEMORY[0x1E4F879E0];
  uint64_t v41 = *MEMORY[0x1E4F879F0];
  uint64_t v39 = *MEMORY[0x1E4F879D8];
  uint64_t v40 = *MEMORY[0x1E4F879D0];
  uint64_t v10 = *MEMORY[0x1E4F1B7A8];
  uint64_t v37 = v4;
  v38 = (void *)*MEMORY[0x1E4F1B7A0];
  uint64_t v43 = v5;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v46 != v8) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(void **)(*((void *)&v45 + 1) + 8 * i);
      id v13 = objc_msgSend(v12, "domain", v36);
      if (![v13 isEqualToString:v9]) {
        goto LABEL_18;
      }
      if ([v12 code] == 1)
      {

LABEL_11:
        id v16 = [v12 userInfo];
        id v13 = [v16 objectForKey:v41];

        id v17 = [v12 userInfo];
        id v18 = [v17 objectForKey:v40];

        v19 = [v12 userInfo];
        uint64_t v20 = [v19 PKBoolForKey:v39];

        if ([v13 isEqualToString:v10])
        {
          v21 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19F450000, v21, OS_LOG_TYPE_DEFAULT, "Error for ISO Country Code was supplied, displaying as Country", buf, 2u);
          }

          id v22 = v38;
          id v13 = v22;
        }
        objc_super v5 = v43;
        if (([v13 isEqualToString:v43] & 1) != 0
          || ([v18 isEqualToString:v43] & 1) != 0)
        {
          id v4 = v37;
          [v37 setError:v12];
          uint64_t v23 = *MEMORY[0x1E4F87118];
          if (([v43 isEqualToString:*MEMORY[0x1E4F87118]] & 1) != 0
            || [v43 isEqualToString:*MEMORY[0x1E4F87128]])
          {
            uint64_t v24 = -[PKAddressEditorViewController _nameComponentForFieldIndex:](v36, "_nameComponentForFieldIndex:", [v37 index]);
            if ([v43 isEqualToString:v23])
            {
              if (v24)
              {
                if (v24 == 1)
                {
                  uint64_t v25 = &OBJC_IVAR___PKAddressEditorViewController__originalFamilyName;
                  goto LABEL_39;
                }
LABEL_32:
                id v26 = 0;
LABEL_40:
                [v4 setInvalidText:v26];
LABEL_41:

                [v4 setFormatIsInvalid:v20];
                goto LABEL_42;
              }
              uint64_t v25 = &OBJC_IVAR___PKAddressEditorViewController__originalGivenName;
            }
            else
            {
              if (![v43 isEqualToString:*MEMORY[0x1E4F87128]]) {
                goto LABEL_32;
              }
              if (v24 == 2)
              {
                uint64_t v25 = &OBJC_IVAR___PKAddressEditorViewController__originalPhoneticGivenName;
              }
              else
              {
                if (v24 != 3) {
                  goto LABEL_32;
                }
                uint64_t v25 = &OBJC_IVAR___PKAddressEditorViewController__originalPhoneticFamilyName;
              }
            }
LABEL_39:
            id v26 = *(id *)((char *)&v36->super.super.super.super.isa + *v25);
            goto LABEL_40;
          }
          originalAddress = v36->_originalAddress;
          id v28 = [v37 key];
          id v26 = [(CNMutablePostalAddress *)originalAddress valueForKey:v28];

          if (!v26 || ![v26 length] || (objc_msgSend(v26, "isEqualToString:", @"\n") & 1) != 0)
          {
            [v37 setInvalidText:&stru_1EF1B5B50];
            objc_super v5 = v43;
            goto LABEL_41;
          }
          id v29 = [v37 key];
          int v30 = [v29 isEqualToString:*MEMORY[0x1E4F1B7C8]];

          if (!v30)
          {
            objc_super v5 = v43;
            goto LABEL_40;
          }
          uint64_t v31 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
          v32 = [v26 componentsSeparatedByCharactersInSet:v31];

          if (![v37 index] && objc_msgSend(v32, "count"))
          {
            v35 = [v32 firstObject];
            goto LABEL_53;
          }
          if ([v37 index] == 1 && (unint64_t)objc_msgSend(v32, "count") >= 2)
          {
            v33 = [v32 firstObject];
            v34 = objc_msgSend(v32, "pk_arrayByRemovingObject:", v33);

            v35 = [v34 componentsJoinedByString:@"\n"];
            v32 = v34;
            id v4 = v37;
LABEL_53:

            objc_super v5 = v43;
            if ([v4 index] == 1 && (!v35 || !objc_msgSend(v35, "length"))) {
LABEL_56:
            }
              uint64_t v20 = 0;
          }
          else
          {

            v35 = 0;
            objc_super v5 = v43;
            if ([v37 index] == 1) {
              goto LABEL_56;
            }
          }

          id v26 = v35;
          goto LABEL_40;
        }

LABEL_18:
        continue;
      }
      uint64_t v14 = [v12 code];

      BOOL v15 = v14 == 2;
      objc_super v5 = v43;
      if (v15) {
        goto LABEL_11;
      }
    }
    uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    id v4 = v37;
    if (v7) {
      continue;
    }
    break;
  }
LABEL_42:
}

- (void)setContactFormatValidator:(id)a3
{
  objc_super v5 = (PKContactFormatValidator *)a3;
  if (self->_contactFormatValidator != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_contactFormatValidator, a3);
    objc_super v5 = v6;
  }
}

- (void)_updateWithPostalAddress:(id)a3
{
  objc_storeStrong((id *)&self->_inputAddress, a3);
  id v5 = a3;
  uint64_t v6 = [(PKAddressEditorViewController *)self tableView];
  [v6 beginUpdates];

  uint64_t v7 = [(PKAddressEditorViewController *)self tableView];
  uint64_t v8 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];

  [v7 reloadSections:v8 withRowAnimation:100];
  id v9 = [(PKAddressEditorViewController *)self tableView];
  [v9 endUpdates];
}

- (void)_presentCountryPickerIfEditable
{
  if ([(PKAddressEditorViewController *)self _canChangeCountry] && !self->_presentedCountrySelector)
  {
    self->_presentedCountrySelector = 1;
    id v4 = [[PKCountryPickerViewController alloc] initWithStyle:self->_style];
    [(PKCountryPickerViewController *)v4 setDelegate:self];
    id v3 = [(PKAddressEditorViewController *)self navigationController];
    [v3 pushViewController:v4 animated:1];
  }
}

- (void)_presentPickerForAddressTextField:(id)a3
{
  id v4 = a3;
  id v5 = [v4 contactFieldConfiguration];
  if ([v5 type] == 2)
  {
    id v6 = v5;
    uint64_t v7 = [v4 text];
    uint64_t v8 = [v6 pickerItems];
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    uint64_t v24 = __Block_byref_object_copy__62;
    uint64_t v25 = __Block_byref_object_dispose__62;
    id v26 = 0;
    if (v7)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __67__PKAddressEditorViewController__presentPickerForAddressTextField___block_invoke;
      v18[3] = &unk_1E59DEE10;
      id v19 = v7;
      uint64_t v20 = &v21;
      [v8 enumerateObjectsUsingBlock:v18];
    }
    id v9 = objc_msgSend(v6, "pickerItems", v8);
    uint64_t v10 = v22[5];
    uint64_t v11 = [v4 isInvalid] ^ 1;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__PKAddressEditorViewController__presentPickerForAddressTextField___block_invoke_2;
    v15[3] = &unk_1E59DEE38;
    id v16 = v4;
    id v17 = self;
    id v12 = +[PKAddressFieldPickerViewHosting loadViewControllerWithAllowedValues:v9 selectedValue:v10 isValid:v11 onCommit:v15];

    id v13 = [(PKAddressEditorViewController *)self navigationController];
    [v13 pushViewController:v12 animated:1];

    _Block_object_dispose(&v21, 8);
  }
}

void __67__PKAddressEditorViewController__presentPickerForAddressTextField___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isValueAccepted:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __67__PKAddressEditorViewController__presentPickerForAddressTextField___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = [a2 submissionValue];
  [*(id *)(a1 + 32) setText:v9];
  id v3 = *(void **)(*(void *)(a1 + 40) + 1080);
  id v4 = [*(id *)(a1 + 32) addressField];
  id v5 = [v4 key];
  [v3 setValue:v9 forKey:v5];

  [*(id *)(a1 + 40) addressTextField:*(void *)(a1 + 32) textDidChange:v9];
  id v6 = [*(id *)(a1 + 40) tableView];
  [v6 reloadData];

  id v7 = [*(id *)(a1 + 40) navigationController];
  id v8 = (id)[v7 popViewControllerAnimated:1];
}

- (unint64_t)_nameComponentForFieldIndex:(unint64_t)a3
{
  unint64_t result = 0;
  BOOL displayPhoneticName = self->_displayPhoneticName;
  BOOL displayGivenNameFirst = self->_displayGivenNameFirst;
  uint64_t v7 = !displayGivenNameFirst && displayPhoneticName + 1;
  uint64_t v8 = displayGivenNameFirst && displayPhoneticName + 1;
  if (v7 != a3)
  {
    if (v8 == a3) {
      unint64_t result = 1;
    }
    else {
      unint64_t result = 4;
    }
    if (displayPhoneticName && v8 != a3)
    {
      if (v7 + 1 == a3)
      {
        return 2;
      }
      else if (v8 + 1 == a3)
      {
        return 3;
      }
      else
      {
        return 4;
      }
    }
  }
  return result;
}

- (int64_t)_fieldIndexForNameComponent:(unint64_t)a3
{
  BOOL displayPhoneticName = self->_displayPhoneticName;
  int64_t v4 = !self->_displayGivenNameFirst && displayPhoneticName + 1;
  int64_t v5 = self->_displayGivenNameFirst && displayPhoneticName + 1;
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 2) {
    uint64_t v6 = v4 + 1;
  }
  if (a3 == 3) {
    uint64_t v6 = v5 + 1;
  }
  if (self->_displayPhoneticName) {
    int64_t v7 = v6;
  }
  else {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a3 == 1) {
    int64_t v7 = v5;
  }
  if (a3) {
    return v7;
  }
  else {
    return v4;
  }
}

- (void)_validateAddressRequirements
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v3 = self->_requiredFieldKeys;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v54 objects:v60 count:16];
  int64_t v5 = (uint64_t *)MEMORY[0x1E4F87118];
  uint64_t v6 = (uint64_t *)MEMORY[0x1E4F87128];
  if (!v4)
  {
    uint64_t v16 = 1;
    goto LABEL_21;
  }
  uint64_t v7 = v4;
  uint64_t v8 = *(void *)v55;
  uint64_t v9 = *MEMORY[0x1E4F87118];
  uint64_t v10 = *MEMORY[0x1E4F87128];
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v55 != v8) {
        objc_enumerationMutation(v3);
      }
      id v12 = *(void **)(*((void *)&v54 + 1) + 8 * i);
      if ([v12 isEqualToString:v9])
      {
        if ([(NSString *)self->_givenName length]) {
          continue;
        }
        uint64_t v13 = 1056;
LABEL_12:
        if (![*(id *)((char *)&self->super.super.super.super.isa + v13) length]) {
          goto LABEL_18;
        }
        continue;
      }
      if ([v12 isEqualToString:v10])
      {
        if ([(NSString *)self->_phoneticGivenName length]) {
          continue;
        }
        uint64_t v13 = 1072;
        goto LABEL_12;
      }
      id v14 = [(CNMutablePostalAddress *)self->_inputAddress valueForKey:v12];
      uint64_t v15 = [v14 length];

      if (!v15)
      {
LABEL_18:
        uint64_t v16 = 0;
        goto LABEL_19;
      }
    }
    uint64_t v7 = [(NSArray *)v3 countByEnumeratingWithState:&v54 objects:v60 count:16];
    if (v7) {
      continue;
    }
    break;
  }
  uint64_t v16 = 1;
LABEL_19:
  uint64_t v6 = (uint64_t *)MEMORY[0x1E4F87128];
  int64_t v5 = (uint64_t *)MEMORY[0x1E4F87118];
LABEL_21:

  uint64_t v17 = 1080;
  id v18 = [(CNMutablePostalAddress *)self->_inputAddress ISOCountryCode];
  id v19 = PKContactFormatRequiredPostalAddressKeysForCountryCode();

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v20 = v19;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v51;
LABEL_23:
    uint64_t v24 = 0;
    while (1)
    {
      if (*(void *)v51 != v23) {
        objc_enumerationMutation(v20);
      }
      uint64_t v25 = [(CNMutablePostalAddress *)self->_inputAddress valueForKey:*(void *)(*((void *)&v50 + 1) + 8 * v24)];
      uint64_t v16 = [v25 length];

      if (!v16) {
        break;
      }
      if (v22 == ++v24)
      {
        uint64_t v22 = [v20 countByEnumeratingWithState:&v50 objects:v59 count:16];
        if (v22) {
          goto LABEL_23;
        }
        uint64_t v16 = 1;
        break;
      }
    }
  }
  uint64_t v42 = v20;

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v26 = self->_editingFields;
  uint64_t v45 = [(NSArray *)v26 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (!v45) {
    goto LABEL_51;
  }
  uint64_t v27 = *(void *)v47;
  uint64_t v28 = *v5;
  uint64_t v43 = *v5;
  uint64_t v44 = *v6;
  while (2)
  {
    uint64_t v29 = 0;
    while (2)
    {
      if (*(void *)v47 != v27) {
        objc_enumerationMutation(v26);
      }
      if ((v16 & 1) == 0)
      {
        uint64_t v16 = 0;
        goto LABEL_51;
      }
      int v30 = *(void **)(*((void *)&v46 + 1) + 8 * v29);
      uint64_t v31 = objc_msgSend(v30, "key", v42);
      v32 = [v30 error];

      if (!v32) {
        goto LABEL_46;
      }
      if ([v31 isEqualToString:v28])
      {
        if ([(NSString *)self->_originalGivenName isEqualToString:self->_givenName])
        {
          v33 = &OBJC_IVAR___PKAddressEditorViewController__originalFamilyName;
          goto LABEL_43;
        }
        goto LABEL_46;
      }
      if ([v31 isEqualToString:v44])
      {
        if ([(NSString *)self->_originalPhoneticGivenName isEqualToString:self->_phoneticGivenName])
        {
          v33 = &OBJC_IVAR___PKAddressEditorViewController__originalPhoneticFamilyName;
LABEL_43:
          if ([*(id *)((char *)&self->super.super.super.super.isa + *v33) isEqualToString:*(Class *)((char *)&self->super.super.super.super.isa + v33[2])])goto LABEL_44; {
        }
          }
LABEL_46:
        uint64_t v16 = [v30 formatIsInvalid] ^ 1;
      }
      else
      {
        v34 = [*(id *)((char *)&self->super.super.super.super.isa + v17) valueForKey:v31];
        [v30 invalidText];
        uint64_t v35 = v27;
        v36 = v26;
        v38 = uint64_t v37 = v17;
        char v39 = [v34 isEqualToString:v38];

        uint64_t v17 = v37;
        id v26 = v36;
        uint64_t v27 = v35;
        uint64_t v28 = v43;

        if ((v39 & 1) == 0) {
          goto LABEL_46;
        }
LABEL_44:
        uint64_t v16 = 0;
      }

      if (v45 != ++v29) {
        continue;
      }
      break;
    }
    uint64_t v45 = [(NSArray *)v26 countByEnumeratingWithState:&v46 objects:v58 count:16];
    if (v45) {
      continue;
    }
    break;
  }
LABEL_51:

  self->_requirementsMet = v16;
  uint64_t v40 = [(PKAddressEditorViewController *)self navigationItem];
  uint64_t v41 = [v40 rightBarButtonItem];
  [v41 setEnabled:v16];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v110[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"field"];
  if (!v7) {
    uint64_t v7 = [[PKAddressEditorTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"field"];
  }
  uint64_t v8 = [(PKAddressEditorTableViewCell *)v7 stackView];
  uint64_t v9 = -[NSArray objectAtIndex:](self->_editingFields, "objectAtIndex:", [v6 row]);
  uint64_t v10 = [v9 key];
  uint64_t v11 = [v6 row];

  uint64_t v12 = [(CNMutablePostalAddress *)self->_inputAddress ISOCountryCode];
  uint64_t v13 = *MEMORY[0x1E4F87118];
  v105 = (void *)v12;
  uint64_t v102 = *MEMORY[0x1E4F87118];
  if ([v10 isEqualToString:*MEMORY[0x1E4F87118]])
  {
    if (v11 != [(PKAddressEditorViewController *)self _fieldIndexForNameComponent:0])
    {
      if (v11 == [(PKAddressEditorViewController *)self _fieldIndexForNameComponent:1])
      {
        uint64_t v14 = [(PKContactFormatValidator *)self->_contactFormatValidator contactFieldConfigurationForFamilyNameForCountryCode:v12];
LABEL_10:
        uint64_t v15 = (void *)v14;
LABEL_15:
        v108 = 0;
        goto LABEL_16;
      }
      goto LABEL_38;
    }
    goto LABEL_9;
  }
  if ([v10 isEqualToString:*MEMORY[0x1E4F87128]])
  {
    if (v11 != [(PKAddressEditorViewController *)self _fieldIndexForNameComponent:2])
    {
      if (v11 == [(PKAddressEditorViewController *)self _fieldIndexForNameComponent:3])
      {
        uint64_t v14 = [(PKContactFormatValidator *)self->_contactFormatValidator contactFieldConfigurationForPhoneticFamilyNameForCountryCode:v12];
        goto LABEL_10;
      }
LABEL_38:
      v108 = 0;
      uint64_t v15 = 0;
      goto LABEL_16;
    }
LABEL_9:
    uint64_t v14 = [(PKContactFormatValidator *)self->_contactFormatValidator contactFieldConfigurationForGivenNameForCountryCode:v12];
    goto LABEL_10;
  }
  uint64_t v15 = [(PKContactFormatValidator *)self->_contactFormatValidator contactFieldConfigurationForPostalField:v10 forCountryCode:v12];
  uint64_t v16 = [(CNMutablePostalAddress *)self->_inputAddress valueForKey:v10];
  uint64_t v17 = v16;
  if (!v16
    || (v108 = v16, uint64_t v18 = [v16 length], v17 = v108, !v18)
    || (v19 = [v108 isEqualToString:@"\n"], uint64_t v17 = v108, (v19 & 1) != 0))
  {

    goto LABEL_15;
  }
  if ([v10 isEqualToString:*MEMORY[0x1E4F1B7C8]])
  {
    uint64_t v44 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    uint64_t v45 = [v108 componentsSeparatedByCharactersInSet:v44];

    if ([v9 index] || !objc_msgSend(v45, "count"))
    {
      if ([v9 index] == 1 && (unint64_t)objc_msgSend(v45, "count") >= 2)
      {
        long long v46 = [v45 firstObject];
        objc_msgSend(v45, "pk_arrayByRemovingObject:", v46);
        long long v48 = v47 = v15;

        uint64_t v49 = [v48 componentsJoinedByString:@"\n"];
        uint64_t v45 = v48;
        uint64_t v15 = v47;
      }
      else
      {
        uint64_t v49 = 0;
      }
    }
    else
    {
      uint64_t v49 = [v45 firstObject];
    }

    v108 = (void *)v49;
    uint64_t v13 = v102;
  }
LABEL_16:
  id v20 = [v9 key];
  uint64_t v101 = *MEMORY[0x1E4F1B7A0];
  v106 = v10;
  if (objc_msgSend(v20, "isEqualToString:")) {
    BOOL v103 = [(PKAddressEditorViewController *)self _canChangeCountry];
  }
  else {
    BOOL v103 = 0;
  }

  uint64_t v107 = [v15 type];
  uint64_t v21 = [PKAddressTextField alloc];
  uint64_t v22 = -[PKAddressTextField initWithFrame:style:](v21, "initWithFrame:style:", self->_style, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(PKAddressTextField *)v22 setDelegate:self];
  [(PKAddressTextField *)v22 setAddressDelegate:self];
  [(PKAddressTextField *)v22 setAutocapitalizationType:1];
  [(PKAddressTextField *)v22 setAddressField:v9];
  [(PKAddressTextField *)v22 setContactFieldConfiguration:v15];
  [(PKAddressTextField *)v22 setEnabled:!self->_readOnly];
  uint64_t v23 = [MEMORY[0x1E4FB1618] clearColor];
  [(PKAddressTextField *)v22 setBackgroundColor:v23];

  [(PKAddressTextField *)v22 setAutocorrectionType:1];
  [(PKAddressTextField *)v22 addTarget:self action:sel_textDidChange_ forControlEvents:0x20000];
  uint64_t v24 = [v9 key];
  int v25 = [v24 isEqualToString:v13];

  v104 = v15;
  if (v25)
  {
    if (v11 == [(PKAddressEditorViewController *)self _fieldIndexForNameComponent:0])
    {
      id v26 = &OBJC_IVAR___PKAddressEditorViewController__givenName;
      uint64_t v27 = &OBJC_IVAR___PKAddressEditorViewController__givenNameTextField;
      uint64_t v28 = (void *)MEMORY[0x1E4FB2F88];
      uint64_t v29 = @"IN_APP_PAYMENT_OPTIONS_ENTER_NEW_GIVENNAME_TITLE";
    }
    else
    {
      if (v11 != [(PKAddressEditorViewController *)self _fieldIndexForNameComponent:1])goto LABEL_28; {
      id v26 = &OBJC_IVAR___PKAddressEditorViewController__familyName;
      }
      uint64_t v27 = &OBJC_IVAR___PKAddressEditorViewController__familyNameTextField;
      uint64_t v28 = (void *)MEMORY[0x1E4FB2F78];
      uint64_t v29 = @"IN_APP_PAYMENT_OPTIONS_ENTER_NEW_FAMILYNAME_TITLE";
    }
    v34 = PKLocalizedPaymentString(&v29->isa);
    [(PKAddressTextField *)v22 setPlaceholder:v34];

    [(PKAddressTextField *)v22 setTextContentType:*v28];
    [(PKAddressTextField *)v22 setText:*(Class *)((char *)&self->super.super.super.super.isa + *v26)];
    objc_storeWeak((id *)((char *)&self->super.super.super.super.isa + *v27), v22);
LABEL_28:
    if (!v11) {
      objc_storeStrong((id *)&self->_firstTextFieldForName, v22);
    }
    goto LABEL_71;
  }
  int v30 = [v9 key];
  int v31 = [v30 isEqualToString:*MEMORY[0x1E4F87128]];

  if (v31)
  {
    if (v11 == [(PKAddressEditorViewController *)self _fieldIndexForNameComponent:2])
    {
      v32 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_35.isa);
      [(PKAddressTextField *)v22 setPlaceholder:v32];

      v33 = &OBJC_IVAR___PKAddressEditorViewController__phoneticGivenName;
    }
    else
    {
      if (v11 != [(PKAddressEditorViewController *)self _fieldIndexForNameComponent:3])goto LABEL_71; {
      uint64_t v40 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_36.isa);
      }
      [(PKAddressTextField *)v22 setPlaceholder:v40];

      v33 = &OBJC_IVAR___PKAddressEditorViewController__phoneticFamilyName;
    }
    [(PKAddressTextField *)v22 setText:*(Class *)((char *)&self->super.super.super.super.isa + *v33)];
    objc_storeWeak((id *)((char *)&self->super.super.super.super.isa + v33[26]), v22);
  }
  else
  {
    addressFormatter = self->_addressFormatter;
    v36 = [v9 key];
    uint64_t v37 = [(CNPostalAddressFormattingSpecification *)addressFormatter localizedPlaceholderForKey:v36];
    [(PKAddressTextField *)v22 setPlaceholder:v37];

    [(PKAddressTextField *)v22 setText:v108];
    int v38 = v107 == 2 || v103;
    if (v38 == 1)
    {
      if (self->_style == 2)
      {
        char v39 = PKBridgeTableViewCellAccessoryColor();
      }
      else
      {
        char v39 = 0;
      }
      id v41 = objc_alloc(MEMORY[0x1E4FB1838]);
      uint64_t v42 = PKUISmallChevronImage();
      uint64_t v43 = (void *)[v41 initWithImage:v42];

      if (v39)
      {
        [v43 setTintColor:v39];
      }
      else
      {
        long long v50 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
        [v43 setTintColor:v50];
      }
      [(PKAddressTextField *)v22 setRightViewMode:3];
      [(PKAddressTextField *)v22 setRightView:v43];
      if (v103) {
        objc_storeWeak((id *)&self->_countryTextField, v22);
      }
    }
    long long v51 = [v9 key];
    int v52 = [v51 isEqualToString:*MEMORY[0x1E4F1B7C8]];

    if (v52)
    {
      if ([v9 index])
      {
        [(PKAddressTextField *)v22 setTextContentType:*MEMORY[0x1E4FB2FC8]];
        objc_storeWeak((id *)&self->_street2TextField, v22);
        long long v53 = PKLocalizedPaymentString(&cfstr_StreetAddressS.isa);
        [(PKAddressTextField *)v22 setPlaceholder:v53];
      }
      else
      {
        [(PKAddressTextField *)v22 setTextContentType:*MEMORY[0x1E4FB2FC0]];
        objc_storeWeak((id *)&self->_street1TextField, v22);
      }
    }
    highlightedFieldKeys = self->_highlightedFieldKeys;
    long long v55 = [v9 key];
    if ([(NSArray *)highlightedFieldKeys containsObject:v55])
    {
      uint64_t v56 = [v9 index];

      if (!v56)
      {
        uint64_t v109 = *MEMORY[0x1E4FB0700];
        long long v57 = objc_msgSend(MEMORY[0x1E4FB1618], "pkui_osloErrorColor");
        v58 = [v57 colorWithAlphaComponent:0.7];
        v110[0] = v58;
        v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:&v109 count:1];

        id v60 = objc_alloc(MEMORY[0x1E4F28B18]);
        uint64_t v61 = [(PKAddressTextField *)v22 placeholder];
        v62 = (void *)[v60 initWithString:v61 attributes:v59];

        [(PKAddressTextField *)v22 setAttributedPlaceholder:v62];
      }
    }
    else
    {
    }
    v63 = [v9 key];
    int v64 = [v63 isEqualToString:*MEMORY[0x1E4F1B7D8]];

    if (v64)
    {
      id v65 = (void *)MEMORY[0x1E4FB2FD0];
    }
    else
    {
      v66 = [v9 key];
      int v67 = [v66 isEqualToString:*MEMORY[0x1E4F1B798]];

      if (v67)
      {
        id v65 = (void *)MEMORY[0x1E4FB2F50];
      }
      else
      {
        v68 = [v9 key];
        int v69 = [v68 isEqualToString:*MEMORY[0x1E4F1B7C0]];

        if (v69)
        {
          id v65 = (void *)MEMORY[0x1E4FB2F58];
        }
        else
        {
          v70 = [v9 key];
          int v71 = [v70 isEqualToString:*MEMORY[0x1E4F1B7B0]];

          if (!v71) {
            goto LABEL_71;
          }
          id v65 = (void *)MEMORY[0x1E4FB2FB8];
        }
      }
    }
    [(PKAddressTextField *)v22 setTextContentType:*v65];
  }
LABEL_71:
  uint64_t v72 = [v9 invalidText];
  if (!v72) {
    goto LABEL_78;
  }
  v73 = (void *)v72;
  v74 = [v9 invalidText];
  v75 = [(PKAddressTextField *)v22 text];
  if (([v74 isEqualToString:v75] & 1) == 0)
  {
    v79 = [v9 invalidText];
    if ([v79 length])
    {
    }
    else
    {
      v100 = v8;
      uint64_t v92 = [(PKAddressTextField *)v22 text];
      if (!v92)
      {

        goto LABEL_73;
      }
      v93 = (void *)v92;
      v94 = [(PKAddressTextField *)v22 text];
      uint64_t v99 = [v94 length];

      uint64_t v8 = v100;
      if (!v99) {
        goto LABEL_74;
      }
    }
LABEL_78:
    [(PKAddressTextField *)v22 setIsInvalid:0 showErrorGlyph:0];
    int v80 = v107 == 2 || v103;
    if (v80 != 1) {
      goto LABEL_99;
    }
    [(PKAddressTextField *)v22 setRightViewMode:3];
    goto LABEL_97;
  }
LABEL_73:

LABEL_74:
  uint64_t v76 = [v9 index];
  v77 = [v9 key];
  if ([v77 isEqualToString:v102])
  {
    uint64_t v78 = 1;
  }
  else
  {
    v81 = [v9 key];
    unsigned int v82 = [v81 isEqualToString:*MEMORY[0x1E4F87128]];

    if (v76) {
      uint64_t v78 = v82;
    }
    else {
      uint64_t v78 = 1;
    }
  }

  [(PKAddressTextField *)v22 setIsInvalid:1 showErrorGlyph:v78];
  v83 = [v9 key];
  if ([v83 isEqualToString:v101])
  {
  }
  else
  {
    v84 = [v9 key];
    int v85 = [v84 isEqualToString:*MEMORY[0x1E4F1B7A8]];

    if (!v85) {
      goto LABEL_97;
    }
  }
  originalCountry = self->_originalCountry;
  if (originalCountry
    && ([(CNMutablePostalAddress *)self->_inputAddress country],
        v87 = objc_claimAutoreleasedReturnValue(),
        BOOL v88 = [(NSString *)originalCountry isEqualToString:v87],
        v87,
        !v88))
  {
    v89 = v22;
    uint64_t v90 = 1;
    uint64_t v91 = v78;
  }
  else
  {
    v89 = v22;
    uint64_t v90 = 0;
    uint64_t v91 = 0;
  }
  [(PKAddressTextField *)v89 setIsInvalid:v90 showErrorGlyph:v91];
LABEL_97:
  if (v107 == 2)
  {
    [(PKAddressTextField *)v22 setSecureTextEntry:1];
    [(PKAddressTextField *)v22 setDisplaySecureTextUsingPlainText:1];
  }
LABEL_99:
  [v8 addArrangedSubview:v22];
  if (self->_style == 2)
  {
    v95 = PKBridgeAppearanceGetAppearanceSpecifier();
    PKAppearanceApplyToContainer(v95, v22);

    v96 = PKBridgeAppearanceGetAppearanceSpecifier();
    PKAppearanceApplyToContainer(v96, v7);
  }
  v97 = [v9 key];
  [(PKAddressEditorTableViewCell *)v7 setAccessibilityIdentifier:v97];

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_editingFields count];
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
  id v3 = [(PKAddressEditorViewController *)self tableView];
  [v3 reloadData];
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (BOOL)_canChangeCountry
{
  return !self->_readOnly && self->_countryIsEditable;
}

- (void)textDidChange:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v5 text];
    [(PKAddressEditorViewController *)self addressTextField:v5 textDidChange:v4];
  }
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_countryTextField);

  if (WeakRetained == v9)
  {
    [v9 resignFirstResponder];
    [(PKAddressEditorViewController *)self _presentCountryPickerIfEditable];
  }
  else
  {
    id v6 = [v9 contactFieldConfiguration];
    uint64_t v7 = [v6 type];

    if (v7 == 2)
    {
      [v9 resignFirstResponder];
      [(PKAddressEditorViewController *)self _presentPickerForAddressTextField:v9];
    }
    else
    {
      objc_storeStrong((id *)&self->_currentlySelectedField, a3);
      uint64_t v8 = [(PKAddressTextField *)self->_currentlySelectedField text];
      self->_isEditingBlankField = [v8 length] == 0;
    }
  }
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_countryTextField);

  id v5 = v11;
  if (WeakRetained != v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v11;
    }
    else {
      id v6 = 0;
    }
    uint64_t v7 = [v6 contactFieldConfiguration];
    uint64_t v8 = [v7 type];

    if (v8 != 2)
    {
      objc_storeStrong((id *)&self->_previouslySelectedField, self->_currentlySelectedField);
      currentlySelectedField = self->_currentlySelectedField;
      self->_currentlySelectedField = 0;

      self->_isEditingBlankField = 0;
      if (v6)
      {
        uint64_t v10 = [v6 text];
        [(PKAddressEditorViewController *)self addressTextField:v6 didEndEditing:v10];
      }
    }

    id v5 = v11;
  }
}

- (void)addressTextField:(id)a3 textDidChange:(id)a4
{
  id v24 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 addressField];
  uint64_t v8 = [v7 key];
  [(PKAddressEditorViewController *)self _updateUniqueAddressField:v7 withNewString:v24];
  if ([v8 isEqualToString:*MEMORY[0x1E4F1B7C8]])
  {
    searchCompleter = self->_searchCompleter;
    uint64_t v10 = [(CNMutablePostalAddress *)self->_inputAddress street];
    [(MKLocalSearchCompleter *)searchCompleter setQueryFragment:v10];
  }
  id v11 = [v7 invalidText];
  uint64_t v12 = [v11 isEqualToString:v24];

  uint64_t v13 = [v7 index];
  if (![v8 isEqualToString:*MEMORY[0x1E4F87118]])
  {
    if (![v8 isEqualToString:*MEMORY[0x1E4F87128]])
    {
      [v6 setIsInvalid:v12 showErrorGlyph:v12];
      goto LABEL_33;
    }
    if (v13 == [(PKAddressEditorViewController *)self _fieldIndexForNameComponent:2])
    {
      if ((v12 & 1) == 0)
      {
        uint64_t v18 = 0;
        goto LABEL_31;
      }
      uint64_t v15 = &OBJC_IVAR___PKAddressEditorViewController__originalPhoneticFamilyName;
    }
    else
    {
      int64_t v20 = [(PKAddressEditorViewController *)self _fieldIndexForNameComponent:3];
      BOOL v21 = v13 == v20;
      if (v13 == v20) {
        uint64_t v18 = 0;
      }
      else {
        uint64_t v18 = v12;
      }
      if (!v21 || ((v12 ^ 1) & 1) != 0) {
        goto LABEL_31;
      }
      uint64_t v15 = &OBJC_IVAR___PKAddressEditorViewController__originalPhoneticGivenName;
    }
    uint64_t v18 = [*(id *)((char *)&self->super.super.super.super.isa + *v15) isEqualToString:*(Class *)((char *)&self->super.super.super.super.isa + v15[2])];
LABEL_31:
    char v19 = &OBJC_IVAR___PKAddressEditorViewController__phoneticGivenNameTextField;
    goto LABEL_32;
  }
  if (v13 == [(PKAddressEditorViewController *)self _fieldIndexForNameComponent:0])
  {
    if ((v12 & 1) == 0)
    {
      uint64_t v18 = 0;
      goto LABEL_21;
    }
    uint64_t v14 = &OBJC_IVAR___PKAddressEditorViewController__originalFamilyName;
  }
  else
  {
    int64_t v16 = [(PKAddressEditorViewController *)self _fieldIndexForNameComponent:1];
    BOOL v17 = v13 == v16;
    if (v13 == v16) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = v12;
    }
    if (!v17 || ((v12 ^ 1) & 1) != 0) {
      goto LABEL_21;
    }
    uint64_t v14 = &OBJC_IVAR___PKAddressEditorViewController__originalGivenName;
  }
  uint64_t v18 = [*(id *)((char *)&self->super.super.super.super.isa + *v14) isEqualToString:*(Class *)((char *)&self->super.super.super.super.isa + v14[2])];
LABEL_21:
  char v19 = &OBJC_IVAR___PKAddressEditorViewController__givenNameTextField;
LABEL_32:
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.isa + *v19));
  [WeakRetained setIsInvalid:v18 showErrorGlyph:v18];

  id v23 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.isa + v19[1]));
  [v23 setIsInvalid:v18 showErrorGlyph:v18];

LABEL_33:
  [(PKAddressEditorViewController *)self _checkFormatOfAddressTextField:v6];

  [(PKAddressEditorViewController *)self _validateAddressRequirements];
}

- (void)addressTextField:(id)a3 didEndEditing:(id)a4
{
  -[PKAddressEditorViewController _checkFormatOfAddressTextField:](self, "_checkFormatOfAddressTextField:", a3, a4);

  [(PKAddressEditorViewController *)self _validateAddressRequirements];
}

- (void)_checkFormatOfAddressTextField:(id)a3
{
  id v29 = a3;
  uint64_t v4 = [v29 addressField];
  id v5 = [v4 key];
  id v6 = [(CNMutablePostalAddress *)self->_inputAddress ISOCountryCode];
  if ([v5 isEqualToString:*MEMORY[0x1E4F87118]])
  {
    unint64_t v7 = -[PKAddressEditorViewController _nameComponentForFieldIndex:](self, "_nameComponentForFieldIndex:", [v4 index]);
    if (v7 == 1)
    {
      contactFormatValidator = self->_contactFormatValidator;
      if (contactFormatValidator)
      {
        int v9 = [(PKContactFormatValidator *)contactFormatValidator isFamilyName:self->_familyName validFormatForCountryCode:v6];
        goto LABEL_25;
      }
    }
    else if (!v7)
    {
      uint64_t v8 = self->_contactFormatValidator;
      if (v8)
      {
        int v9 = [(PKContactFormatValidator *)v8 isGivenName:self->_givenName validFormatForCountryCode:v6];
LABEL_25:
        uint64_t v14 = (PKContactFormatValidator *)(v9 ^ 1u);
        goto LABEL_27;
      }
    }
    goto LABEL_26;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F87128]])
  {
    unint64_t v10 = -[PKAddressEditorViewController _nameComponentForFieldIndex:](self, "_nameComponentForFieldIndex:", [v4 index]);
    if (v10 == 3)
    {
      uint64_t v28 = self->_contactFormatValidator;
      if (v28)
      {
        int v9 = [(PKContactFormatValidator *)v28 isPhoneticFamilyName:self->_phoneticFamilyName validFormatForCountryCode:v6];
        goto LABEL_25;
      }
    }
    else if (v10 == 2)
    {
      id v11 = self->_contactFormatValidator;
      if (v11)
      {
        int v9 = [(PKContactFormatValidator *)v11 isPhoneticGivenName:self->_phoneticGivenName validFormatForCountryCode:v6];
        goto LABEL_25;
      }
    }
LABEL_26:
    uint64_t v14 = 0;
LABEL_27:
    [v4 setFormatIsInvalid:v14];
    if (!self->_isEditingBlankField) {
      [v29 setIsInvalid:v14 showErrorGlyph:v14];
    }
    goto LABEL_29;
  }
  uint64_t v12 = *MEMORY[0x1E4F1B7C8];
  int v13 = [v5 isEqualToString:*MEMORY[0x1E4F1B7C8]];
  uint64_t v14 = self->_contactFormatValidator;
  if (!v13)
  {
    if (v14)
    {
      uint64_t v27 = [(CNMutablePostalAddress *)self->_inputAddress valueForKey:v5];
      uint64_t v14 = (PKContactFormatValidator *)([(PKContactFormatValidator *)v14 isPostalAddressFieldEntry:v27 validForPostalFieldKey:v5 forCountryCode:v6] ^ 1);
    }
    goto LABEL_27;
  }
  if (v14)
  {
    uint64_t v15 = [(CNMutablePostalAddress *)self->_inputAddress street];
    uint64_t v14 = (PKContactFormatValidator *)([(PKContactFormatValidator *)v14 isPostalAddressFieldEntry:v15 validForPostalFieldKey:v12 forCountryCode:v6] ^ 1);
  }
  p_street2TextField = &self->_street2TextField;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_street2TextField);
  uint64_t v18 = [WeakRetained text];
  if ([v18 length]) {
    uint64_t v19 = v14;
  }
  else {
    uint64_t v19 = 0;
  }

  id v20 = objc_loadWeakRetained((id *)&self->_street1TextField);
  BOOL v21 = [v20 addressField];
  [v21 setFormatIsInvalid:v14];

  id v22 = objc_loadWeakRetained((id *)&self->_street2TextField);
  id v23 = [v22 addressField];
  [v23 setFormatIsInvalid:v19];

  if (!self->_isEditingBlankField)
  {
    id v24 = objc_loadWeakRetained((id *)&self->_street1TextField);
    [v24 setIsInvalid:v14 showErrorGlyph:v14];

    id v25 = objc_loadWeakRetained((id *)p_street2TextField);
    [v25 setIsInvalid:v19 showErrorGlyph:v19];
  }
LABEL_29:
}

- (void)_updateUniqueAddressField:(id)a3 withNewString:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 key];
  if ([v8 isEqualToString:*MEMORY[0x1E4F87118]])
  {
    unint64_t v9 = -[PKAddressEditorViewController _nameComponentForFieldIndex:](self, "_nameComponentForFieldIndex:", [v6 index]);
    if (v9 == 1)
    {
      uint64_t v10 = 1056;
      goto LABEL_15;
    }
    if (!v9)
    {
      uint64_t v10 = 1048;
LABEL_15:
      objc_storeStrong((id *)((char *)&self->super.super.super.super.isa + v10), a4);
    }
  }
  else if ([v8 isEqualToString:*MEMORY[0x1E4F87128]])
  {
    unint64_t v11 = -[PKAddressEditorViewController _nameComponentForFieldIndex:](self, "_nameComponentForFieldIndex:", [v6 index]);
    if (v11 == 3)
    {
      uint64_t v10 = 1072;
      goto LABEL_15;
    }
    if (v11 == 2)
    {
      uint64_t v10 = 1064;
      goto LABEL_15;
    }
  }
  else
  {
    int v12 = [v8 isEqualToString:*MEMORY[0x1E4F1B7C8]];
    inputAddress = self->_inputAddress;
    if (v12)
    {
      uint64_t v14 = [(CNMutablePostalAddress *)inputAddress street];
      uint64_t v15 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      int64_t v16 = [v14 componentsSeparatedByCharactersInSet:v15];
      BOOL v17 = (void *)[v16 mutableCopy];

      if ([v6 index] == 1)
      {
        uint64_t v18 = [v17 count] - 1;
        v21[0] = v7;
        uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
        objc_msgSend(v17, "replaceObjectsInRange:withObjectsFromArray:", 1, v18, v19);
      }
      else
      {
        [v17 replaceObjectAtIndex:0 withObject:v7];
      }
      id v20 = [v17 componentsJoinedByString:@"\n"];
      [(CNMutablePostalAddress *)self->_inputAddress setStreet:v20];
    }
    else
    {
      [(CNMutablePostalAddress *)inputAddress setValue:v7 forKey:v8];
    }
  }
}

- (void)completerDidUpdateResults:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v20 = [(PKAddressTextField *)self->_currentlySelectedField inputDelegate];
  BOOL v21 = v4;
  id v5 = [v4 results];
  id v6 = objc_msgSend(v5, "pk_objectsPassingTest:", &__block_literal_global_230);

  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v14 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [v13 mapItem];
          int64_t v16 = [v15 description];
          *(_DWORD *)buf = 138412290;
          uint64_t v27 = v16;
          _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Search completion item map item: %@", buf, 0xCu);
        }
        BOOL v17 = (void *)MEMORY[0x1E4FB1DC8];
        uint64_t v18 = [v13 title];
        uint64_t v19 = [v17 textSuggestionWithInputText:v18];

        [v7 addObject:v19];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v10);
  }

  [v20 setSuggestions:v7];
}

BOOL __59__PKAddressEditorViewController_completerDidUpdateResults___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  if (a3 >= 3) {
    *a4 = 1;
  }
  return [a2 _type] == 2;
}

- (void)completer:(id)a3 didFailWithError:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Failed completion", (uint8_t *)&v9, 2u);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 localizedDescription];
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)countryPicker:(id)a3 didPickCountryCode:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v7 = PKLocalizedStringForCountryCode();

  uint64_t v8 = 1080;
  [(CNMutablePostalAddress *)self->_inputAddress setCountry:v7];
  [(CNMutablePostalAddress *)self->_inputAddress setISOCountryCode:v5];
  [(PKAddressEditorViewController *)self recomputeEditingFields];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v43 = self;
  id obj = self->_editingFields;
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v51;
    uint64_t v12 = *MEMORY[0x1E4F1B7A0];
    uint64_t v13 = *MEMORY[0x1E4F1B7A8];
    uint64_t v40 = v7;
    id v41 = v5;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v51 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = v8;
        int64_t v16 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        BOOL v17 = [v16 key];
        if ([v17 isEqualToString:v12])
        {

LABEL_12:
          uint64_t v45 = [MEMORY[0x1E4F1CA20] currentLocale];
          [MEMORY[0x1E4F1CA20] ISOCountryCodes];
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id v44 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = [v44 countByEnumeratingWithState:&v46 objects:v54 count:16];
          BOOL v21 = v43;
          if (v20)
          {
            uint64_t v22 = v20;
            uint64_t v23 = *(void *)v47;
            uint64_t v24 = *MEMORY[0x1E4F1C400];
            while (2)
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v47 != v23) {
                  objc_enumerationMutation(v44);
                }
                uint64_t v26 = *(void *)(*((void *)&v46 + 1) + 8 * j);
                uint64_t v27 = [v45 displayNameForKey:v24 value:v26];
                uint64_t v28 = [*(id *)((char *)&v21->super.super.super.super.isa + v15) country];
                if ([v28 compare:v27 options:129])
                {
                }
                else
                {
                  uint64_t v29 = [*(id *)((char *)&v21->super.super.super.super.isa + v15) ISOCountryCode];
                  uint64_t v30 = [v29 compare:v26 options:129];

                  BOOL v21 = v43;
                  if (!v30)
                  {
                    [v16 setFormatIsInvalid:0];
                    int v31 = [v16 error];
                    v32 = [(PKAddressEditorViewController *)v43 errors];
                    v33 = objc_msgSend(v32, "pk_arrayByRemovingObject:", v31);
                    [(PKAddressEditorViewController *)v43 setErrors:v33];

                    [v16 setError:0];
                    uint64_t v34 = [*(id *)((char *)&v43->super.super.super.super.isa + v15) country];
                    originalCountry = v43->_originalCountry;
                    v43->_originalCountry = (NSString *)v34;

                    goto LABEL_24;
                  }
                }
              }
              uint64_t v22 = [v44 countByEnumeratingWithState:&v46 objects:v54 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }
LABEL_24:

          id v7 = v40;
          id v5 = v41;
          goto LABEL_25;
        }
        uint64_t v18 = [v16 key];
        int v19 = [v18 isEqualToString:v13];

        if (v19) {
          goto LABEL_12;
        }
        uint64_t v8 = v15;
      }
      uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v50 objects:v55 count:16];
      id v7 = v40;
      id v5 = v41;
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_25:

  [(PKAddressEditorViewController *)v43 _validateAddressRequirements];
  previouslySelectedField = v43->_previouslySelectedField;
  v43->_previouslySelectedField = 0;

  uint64_t v37 = [(PKAddressEditorViewController *)v43 tableView];
  [v37 reloadData];

  int v38 = [(PKAddressEditorViewController *)v43 navigationController];
  id v39 = (id)[v38 popViewControllerAnimated:1];
}

- (PKAddressEditorViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKAddressEditorViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (BOOL)countryIsEditable
{
  return self->_countryIsEditable;
}

- (void)setCountryIsEditable:(BOOL)a3
{
  self->_countryIsEditable = a3;
}

- (PKContactFormatValidator)contactFormatValidator
{
  return self->_contactFormatValidator;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
}

- (NSString)phoneticGivenName
{
  return self->_phoneticGivenName;
}

- (void)setPhoneticGivenName:(id)a3
{
}

- (NSString)phoneticFamilyName
{
  return self->_phoneticFamilyName;
}

- (void)setPhoneticFamilyName:(id)a3
{
}

- (CNMutablePostalAddress)inputAddress
{
  return self->_inputAddress;
}

- (void)setInputAddress:(id)a3
{
}

- (NSString)inputLabel
{
  return self->_inputLabel;
}

- (void)setInputLabel:(id)a3
{
}

- (NSString)originalGivenName
{
  return self->_originalGivenName;
}

- (void)setOriginalGivenName:(id)a3
{
}

- (NSString)originalFamilyName
{
  return self->_originalFamilyName;
}

- (void)setOriginalFamilyName:(id)a3
{
}

- (NSString)originalPhoneticGivenName
{
  return self->_originalPhoneticGivenName;
}

- (void)setOriginalPhoneticGivenName:(id)a3
{
}

- (NSString)originalPhoneticFamilyName
{
  return self->_originalPhoneticFamilyName;
}

- (void)setOriginalPhoneticFamilyName:(id)a3
{
}

- (NSString)originalCountry
{
  return self->_originalCountry;
}

- (void)setOriginalCountry:(id)a3
{
}

- (CNMutablePostalAddress)originalAddress
{
  return self->_originalAddress;
}

- (void)setOriginalAddress:(id)a3
{
}

- (CNPostalAddressFormattingSpecification)addressFormatter
{
  return self->_addressFormatter;
}

- (void)setAddressFormatter:(id)a3
{
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
}

- (MKLocalSearchCompleter)searchCompleter
{
  return self->_searchCompleter;
}

- (void)setSearchCompleter:(id)a3
{
}

- (PKAddressTextField)currentlySelectedField
{
  return self->_currentlySelectedField;
}

- (void)setCurrentlySelectedField:(id)a3
{
}

- (PKAddressTextField)previouslySelectedField
{
  return self->_previouslySelectedField;
}

- (void)setPreviouslySelectedField:(id)a3
{
}

- (PKAddressTextField)firstTextFieldForName
{
  return self->_firstTextFieldForName;
}

- (void)setFirstTextFieldForName:(id)a3
{
}

- (NSArray)editingFields
{
  return self->_editingFields;
}

- (void)setEditingFields:(id)a3
{
}

- (NSArray)highlightedFieldKeys
{
  return self->_highlightedFieldKeys;
}

- (void)setHighlightedFieldKeys:(id)a3
{
}

- (NSArray)requiredFieldKeys
{
  return self->_requiredFieldKeys;
}

- (void)setRequiredFieldKeys:(id)a3
{
}

- (NSArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (PKAddressTextField)givenNameTextField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_givenNameTextField);

  return (PKAddressTextField *)WeakRetained;
}

- (void)setGivenNameTextField:(id)a3
{
}

- (PKAddressTextField)familyNameTextField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_familyNameTextField);

  return (PKAddressTextField *)WeakRetained;
}

- (void)setFamilyNameTextField:(id)a3
{
}

- (PKAddressTextField)phoneticGivenNameTextField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_phoneticGivenNameTextField);

  return (PKAddressTextField *)WeakRetained;
}

- (void)setPhoneticGivenNameTextField:(id)a3
{
}

- (PKAddressTextField)phoneticFamilyNameTextField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_phoneticFamilyNameTextField);

  return (PKAddressTextField *)WeakRetained;
}

- (void)setPhoneticFamilyNameTextField:(id)a3
{
}

- (PKAddressTextField)street1TextField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_street1TextField);

  return (PKAddressTextField *)WeakRetained;
}

- (void)setStreet1TextField:(id)a3
{
}

- (PKAddressTextField)street2TextField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_street2TextField);

  return (PKAddressTextField *)WeakRetained;
}

- (void)setStreet2TextField:(id)a3
{
}

- (PKAddressTextField)countryTextField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_countryTextField);

  return (PKAddressTextField *)WeakRetained;
}

- (void)setCountryTextField:(id)a3
{
}

- (BOOL)requirementsMet
{
  return self->_requirementsMet;
}

- (void)setRequirementsMet:(BOOL)a3
{
  self->_requirementsMet = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_countryTextField);
  objc_destroyWeak((id *)&self->_street2TextField);
  objc_destroyWeak((id *)&self->_street1TextField);
  objc_destroyWeak((id *)&self->_phoneticFamilyNameTextField);
  objc_destroyWeak((id *)&self->_phoneticGivenNameTextField);
  objc_destroyWeak((id *)&self->_familyNameTextField);
  objc_destroyWeak((id *)&self->_givenNameTextField);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_requiredFieldKeys, 0);
  objc_storeStrong((id *)&self->_highlightedFieldKeys, 0);
  objc_storeStrong((id *)&self->_editingFields, 0);
  objc_storeStrong((id *)&self->_firstTextFieldForName, 0);
  objc_storeStrong((id *)&self->_previouslySelectedField, 0);
  objc_storeStrong((id *)&self->_currentlySelectedField, 0);
  objc_storeStrong((id *)&self->_searchCompleter, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_addressFormatter, 0);
  objc_storeStrong((id *)&self->_originalAddress, 0);
  objc_storeStrong((id *)&self->_originalCountry, 0);
  objc_storeStrong((id *)&self->_originalPhoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_originalPhoneticGivenName, 0);
  objc_storeStrong((id *)&self->_originalFamilyName, 0);
  objc_storeStrong((id *)&self->_originalGivenName, 0);
  objc_storeStrong((id *)&self->_inputLabel, 0);
  objc_storeStrong((id *)&self->_inputAddress, 0);
  objc_storeStrong((id *)&self->_phoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_phoneticGivenName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_contactFormatValidator, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end