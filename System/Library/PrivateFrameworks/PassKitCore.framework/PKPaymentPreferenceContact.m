@interface PKPaymentPreferenceContact
- (BOOL)preferenceObject:(id)a3 representsContact:(id)a4;
- (BOOL)showPhoneticName;
- (BOOL)supportsDeletion;
- (NSOrderedSet)contactKeys;
- (NSString)addExistingTitle;
- (NSString)addNewTitle;
- (NSString)contactKey;
- (NSString)editExistingTitle;
- (PKPaymentOptionsRecents)paymentOptionsRecents;
- (PKPaymentPreferenceContact)initWithTitle:(id)a3 preferences:(id)a4 selectedIndex:(unint64_t)a5 readOnly:(BOOL)a6;
- (id)_removeDuplicateContacts:(id)a3;
- (id)errorsForPreference:(id)a3;
- (int64_t)indexOfContact:(id)a3;
- (unint64_t)type;
- (void)_mergeContacts:(id)a3;
- (void)_updateSelectedIndex;
- (void)addHideMyEmailPreference:(BOOL)a3;
- (void)mergeRecentsAndMeCard;
- (void)setAddExistingTitle:(id)a3;
- (void)setAddNewTitle:(id)a3;
- (void)setContactKey:(id)a3;
- (void)setContactKeys:(id)a3;
- (void)setEditExistingTitle:(id)a3;
- (void)setErrors:(id)a3 forPreference:(id)a4;
- (void)setPaymentOptionsRecents:(id)a3;
- (void)setShowPhoneticName:(BOOL)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKPaymentPreferenceContact

- (PKPaymentPreferenceContact)initWithTitle:(id)a3 preferences:(id)a4 selectedIndex:(unint64_t)a5 readOnly:(BOOL)a6
{
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentPreferenceContact;
  v6 = [(PKPaymentPreference *)&v9 initWithTitle:a3 preferences:a4 selectedIndex:a5 readOnly:a6];
  if (v6)
  {
    v7 = +[PKPaymentOptionsRecents defaultInstance];
    [(PKPaymentPreferenceContact *)v6 setPaymentOptionsRecents:v7];
  }
  return v6;
}

- (void)setContactKey:(id)a3
{
  id v4 = a3;
  contactKeys = self->_contactKeys;
  id v15 = v4;
  if (contactKeys)
  {
    uint64_t v6 = [(NSOrderedSet *)contactKeys indexOfObject:v4];
    if (!v6) {
      goto LABEL_9;
    }
    uint64_t v7 = v6;
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = [MEMORY[0x1E4F1C978] arrayWithObject:v15];
      objc_super v9 = [(NSOrderedSet *)self->_contactKeys array];
      v10 = [v8 arrayByAddingObjectsFromArray:v9];

      v11 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v10];
    }
    else
    {
      v10 = (void *)[(NSOrderedSet *)self->_contactKeys mutableCopy];
      v13 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v7];
      [v10 moveObjectsAtIndexes:v13 toIndex:0];

      v11 = (NSOrderedSet *)[v10 copy];
    }
    v14 = self->_contactKeys;
    self->_contactKeys = v11;
  }
  else
  {
    v12 = [MEMORY[0x1E4F1CAA0] orderedSetWithObject:v4];
    v10 = self->_contactKeys;
    self->_contactKeys = v12;
  }

LABEL_9:
}

- (NSString)contactKey
{
  return (NSString *)[(NSOrderedSet *)self->_contactKeys firstObject];
}

- (id)_removeDuplicateContacts:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v3;
  uint64_t v37 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v37)
  {
    uint64_t v35 = *(void *)v40;
    uint64_t v34 = *MEMORY[0x1E4F1AEE0];
    uint64_t v32 = *MEMORY[0x1E4F1ADC8];
    uint64_t v31 = *MEMORY[0x1E4F1AF10];
    uint64_t v30 = *MEMORY[0x1E4F1ADE0];
    uint64_t v29 = *MEMORY[0x1E4F1ADF0];
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v40 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __55__PKPaymentPreferenceContact__removeDuplicateContacts___block_invoke;
        v38[3] = &unk_1E56DD550;
        v38[4] = self;
        v38[5] = v6;
        uint64_t v7 = objc_msgSend(v4, "indexOfObjectPassingTest:", v38, v29);
        v8 = [(PKPaymentPreferenceContact *)self contactKeys];
        if (![v8 count]) {
          goto LABEL_18;
        }
        if (![v8 containsObject:v34]) {
          goto LABEL_33;
        }
        objc_super v9 = [v6 phoneNumbers];
        v10 = [v9 firstObject];
        v11 = [v10 value];
        v12 = [v11 stringValue];
        uint64_t v13 = [v12 length];

        if (v13)
        {
LABEL_33:
          if (![v8 containsObject:v32]) {
            goto LABEL_34;
          }
          v14 = [v6 emailAddresses];
          id v15 = [v14 firstObject];
          v16 = [v15 value];
          uint64_t v17 = [v16 length];

          if (v17)
          {
LABEL_34:
            if (![v8 containsObject:v31]) {
              goto LABEL_35;
            }
            v18 = [v6 postalAddresses];
            v19 = [v18 firstObject];
            v20 = [v19 value];

            if (v20)
            {
LABEL_35:
              if (([v8 containsObject:v30] & 1) != 0
                || [v8 containsObject:v29])
              {
                v21 = [v6 familyName];
                if ([v21 length])
                {
                }
                else
                {
                  v22 = [v6 givenName];
                  uint64_t v23 = [v22 length];

                  if (!v23) {
                    goto LABEL_26;
                  }
                }
              }
LABEL_18:
              if (v7 == 0x7FFFFFFFFFFFFFFFLL)
              {
                [v4 addObject:v6];
                goto LABEL_26;
              }
              v24 = [v4 objectAtIndex:v7];
              if ([v24 contactSource] == 3)
              {
                [v4 removeObjectAtIndex:v7];
                [v4 addObject:v6];
                v25 = +[PKPaymentOptionsRecents defaultInstance];
                v26 = [v24 recentContact];
                [v25 deleteRecent:v26];

                goto LABEL_24;
              }
              if ([v6 contactSource] == 3)
              {
                v25 = [v6 recentContact];
                [v24 setRecentContact:v25];
LABEL_24:
              }
            }
          }
        }
LABEL_26:
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v37);
  }

  v27 = (void *)[v4 copy];
  return v27;
}

uint64_t __55__PKPaymentPreferenceContact__removeDuplicateContacts___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) preferenceObject:a2 representsContact:*(void *)(a1 + 40)];
}

- (BOOL)supportsDeletion
{
  return 1;
}

- (void)mergeRecentsAndMeCard
{
  if (![(PKPaymentPreference *)self isReadOnly])
  {
    id v3 = [(PKPaymentPreference *)self preferences];
    id v8 = (id)[v3 mutableCopy];

    id v4 = [(PKPaymentPreferenceContact *)self paymentOptionsRecents];
    v5 = [v4 recentsForPreference:self];
    [v8 addObjectsFromArray:v5];

    uint64_t v6 = [(PKPaymentPreferenceContact *)self paymentOptionsRecents];
    uint64_t v7 = [v6 meCardEntriesForPreference:self];
    [v8 addObjectsFromArray:v7];

    [(PKPaymentPreferenceContact *)self _mergeContacts:v8];
  }
}

- (void)_mergeContacts:(id)a3
{
  id v7 = a3;
  if (![(PKPaymentPreference *)self isReadOnly])
  {
    id v4 = [(PKPaymentPreference *)self preferences];
    v5 = (void *)[v4 mutableCopy];

    [v5 addObjectsFromArray:v7];
    [v5 sortUsingComparator:&__block_literal_global_24];
    uint64_t v6 = [(PKPaymentPreferenceContact *)self _removeDuplicateContacts:v5];

    [(PKPaymentPreference *)self setPreferences:v6];
    [(PKPaymentPreferenceContact *)self _updateSelectedIndex];
  }
}

uint64_t __45__PKPaymentPreferenceContact__mergeContacts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 recentFromContactInformation];
  uint64_t v6 = [v4 recentFromContactInformation];

  if (v5) {
    return v5 & (v6 ^ 1);
  }
  else {
    return v6 << 63 >> 63;
  }
}

- (void)_updateSelectedIndex
{
  id v3 = [(PKPaymentPreference *)self preferences];
  uint64_t v4 = [v3 count];

  uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    if ([(PKPaymentPreference *)self selectedIndex] != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v6 = [(PKPaymentPreference *)self selectedIndex];
      id v7 = [(PKPaymentPreference *)self preferences];
      unint64_t v8 = [v7 count];

      if (v6 < v8) {
        return;
      }
    }
    uint64_t v5 = 0;
  }
  [(PKPaymentPreference *)self setSelectedIndex:v5];
}

- (int64_t)indexOfContact:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPaymentPreference *)self preferences];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__PKPaymentPreferenceContact_indexOfContact___block_invoke;
  v9[3] = &unk_1E56DD550;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  int64_t v7 = [v5 indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __45__PKPaymentPreferenceContact_indexOfContact___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) preferenceObject:a2 representsContact:*(void *)(a1 + 40)];
}

- (void)setErrors:(id)a3 forPreference:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKPaymentPreference *)self errors];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__PKPaymentPreferenceContact_setErrors_forPreference___block_invoke;
  v15[3] = &unk_1E56DD528;
  id v9 = v6;
  id v16 = v9;
  id v10 = [v8 keysOfEntriesPassingTest:v15];
  v11 = [v10 anyObject];

  v12 = [(PKPaymentPreference *)self errors];
  uint64_t v13 = v12;
  if (v11) {
    id v14 = v11;
  }
  else {
    id v14 = v9;
  }
  [v12 setObject:v7 forKey:v14];
}

uint64_t __54__PKPaymentPreferenceContact_setErrors_forPreference___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqualIgnoringIdentifiers:a2];
}

- (id)errorsForPreference:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPaymentPreference *)self errors];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__PKPaymentPreferenceContact_errorsForPreference___block_invoke;
  v12[3] = &unk_1E56DD528;
  id v13 = v4;
  id v6 = v4;
  id v7 = [v5 keysOfEntriesPassingTest:v12];
  unint64_t v8 = [v7 anyObject];

  if (v8)
  {
    id v9 = [(PKPaymentPreference *)self errors];
    id v10 = [v9 objectForKey:v8];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __50__PKPaymentPreferenceContact_errorsForPreference___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqualIgnoringIdentifiers:a2];
}

- (BOOL)preferenceObject:(id)a3 representsContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    contactKeys = self->_contactKeys;
    id v9 = v6;
    id v10 = [(NSOrderedSet *)contactKeys array];
    char v11 = [v9 representsContact:v7 forContactKeys:v10];
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (void)setPaymentOptionsRecents:(id)a3
{
}

- (PKPaymentOptionsRecents)paymentOptionsRecents
{
  return (PKPaymentOptionsRecents *)objc_getAssociatedObject(self, sel_paymentOptionsRecents);
}

- (void)addHideMyEmailPreference:(BOOL)a3
{
  BOOL v3 = a3;
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  id v6 = (void *)MEMORY[0x1E4F1BA20];
  uint64_t v7 = *MEMORY[0x1E4F1B6F8];
  unint64_t v8 = PKLocalizedHideMyEmailString(&cfstr_HmeSettingsRow.isa, 0);
  id v9 = [v6 labeledValueWithLabel:v7 value:v8];
  v14[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v5 setEmailAddresses:v10];

  [v5 setIsHideMyEmail:1];
  char v11 = [(PKPaymentPreference *)self preferences];
  v12 = [v11 arrayByAddingObject:v5];
  [(PKPaymentPreference *)self setPreferences:v12];

  if (v3)
  {
    id v13 = [(PKPaymentPreference *)self preferences];
    -[PKPaymentPreference setSelectedIndex:](self, "setSelectedIndex:", [v13 count] - 1);
  }
}

- (NSOrderedSet)contactKeys
{
  return self->_contactKeys;
}

- (void)setContactKeys:(id)a3
{
}

- (NSString)addNewTitle
{
  return self->_addNewTitle;
}

- (void)setAddNewTitle:(id)a3
{
}

- (NSString)addExistingTitle
{
  return self->_addExistingTitle;
}

- (void)setAddExistingTitle:(id)a3
{
}

- (NSString)editExistingTitle
{
  return self->_editExistingTitle;
}

- (void)setEditExistingTitle:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)showPhoneticName
{
  return self->_showPhoneticName;
}

- (void)setShowPhoneticName:(BOOL)a3
{
  self->_showPhoneticName = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editExistingTitle, 0);
  objc_storeStrong((id *)&self->_addExistingTitle, 0);
  objc_storeStrong((id *)&self->_addNewTitle, 0);
  objc_storeStrong((id *)&self->_contactKeys, 0);
}

@end