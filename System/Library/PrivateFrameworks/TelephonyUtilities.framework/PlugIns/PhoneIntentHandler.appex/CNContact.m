@interface CNContact
- (BOOL)tu_labeledValue:(id)a3 matchesPersonHandleLabel:(id)a4;
- (id)tu_emailAddressesMatchingPersonHandleLabel:(id)a3;
- (id)tu_personHandleMatchingHandle:(id)a3 isoCountryCodes:(id)a4;
- (id)tu_phoneNumbersMatchingPersonHandleLabel:(id)a3;
@end

@implementation CNContact

- (id)tu_phoneNumbersMatchingPersonHandleLabel:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = [(CNContact *)self phoneNumbers];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (![v4 length]
          || [(CNContact *)self tu_labeledValue:v11 matchesPersonHandleLabel:v4])
        {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [v5 copy];

  return v12;
}

- (id)tu_emailAddressesMatchingPersonHandleLabel:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = [(CNContact *)self emailAddresses];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (![v4 length]
          || [(CNContact *)self tu_labeledValue:v11 matchesPersonHandleLabel:v4])
        {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [v5 copy];

  return v12;
}

- (BOOL)tu_labeledValue:(id)a3 matchesPersonHandleLabel:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = INPersonHandleLabelForCNLabeledValue();
  if ([v7 length] && !objc_msgSend(v7, "caseInsensitiveCompare:", v6))
  {
    BOOL v10 = 1;
  }
  else
  {
    id v8 = [v5 label];
    if ([v8 length] && !objc_msgSend(v8, "caseInsensitiveCompare:", v6))
    {
      BOOL v10 = 1;
    }
    else
    {
      uint64_t v9 = +[CNLabeledValue localizedStringForLabel:v8];
      BOOL v10 = [v9 length] && !objc_msgSend(v9, "caseInsensitiveCompare:", v6);
    }
  }

  return v10;
}

- (id)tu_personHandleMatchingHandle:(id)a3 isoCountryCodes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = &_s10Foundation17KeyPathComparatorV_5orderACyxGs0bC0Cyxqd__G_AA9SortOrderOtcSLRd__lufC_ptr;
  id v9 = objc_alloc((Class)INPersonHandle);
  BOOL v10 = objc_msgSend(v9, "tu_initUnlabledPersonHandleWithTUHandle:isoCountryCodes:", v6, v7);

  if ([v10 type] == (id)2)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v11 = [(CNContact *)self phoneNumbers];
    id v12 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v12)
    {
      id v29 = v7;
      v30 = v10;
      uint64_t v13 = *(void *)v36;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(v11);
          }
          long long v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v16 = objc_alloc((Class)TUHandle);
          long long v17 = [v15 value];
          v18 = [v17 stringValue];
          id v19 = [v16 initWithType:2 value:v18];

          if (TUHandlesAreCanonicallyEqual())
          {
            id v7 = v29;
            goto LABEL_22;
          }
        }
        id v12 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v12) {
          continue;
        }
        break;
      }
      id v7 = v29;
LABEL_23:
      BOOL v10 = v30;
      id v8 = &_s10Foundation17KeyPathComparatorV_5orderACyxGs0bC0Cyxqd__G_AA9SortOrderOtcSLRd__lufC_ptr;
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  if ([v10 type] == (id)1)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v11 = [(CNContact *)self emailAddresses];
    id v12 = [v11 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v12)
    {
      v30 = v10;
      uint64_t v20 = *(void *)v32;
      while (2)
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v11);
          }
          v22 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
          id v23 = objc_alloc((Class)TUHandle);
          v24 = [v22 value];
          id v19 = [v23 initWithType:3 value:v24];

          if (TUHandlesAreCanonicallyEqual())
          {
LABEL_22:
            INPersonHandleLabelForCNLabeledValue();
            id v12 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_23;
          }
        }
        id v12 = [v11 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v12) {
          continue;
        }
        goto LABEL_23;
      }
    }
LABEL_24:

    goto LABEL_26;
  }
  id v12 = 0;
LABEL_26:
  id v25 = objc_alloc((Class)v8[285]);
  v26 = [v10 value];
  id v27 = objc_msgSend(v25, "initWithValue:type:label:", v26, objc_msgSend(v10, "type"), v12);

  return v27;
}

@end