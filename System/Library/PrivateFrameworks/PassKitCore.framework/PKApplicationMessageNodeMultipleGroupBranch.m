@interface PKApplicationMessageNodeMultipleGroupBranch
- (NSString)identifier;
- (id)createSummary;
@end

@implementation PKApplicationMessageNodeMultipleGroupBranch

- (id)createSummary
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v4 = [(NSMutableArray *)self->_children reverseObjectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v51 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", *(void *)(*((void *)&v50 + 1) + 8 * i), v40);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v6);
  }

  if ([v3 count])
  {
    while (1)
    {
      objc_msgSend(v3, "lastObject", v40);
      v9 = (id *)objc_claimAutoreleasedReturnValue();
      [v3 removeLastObject];
      uint64_t v10 = [v9 type];
      if (v10 == 2)
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        if (v9) {
          v22 = (void *)[v9[5] copy];
        }
        else {
          v22 = 0;
        }
        id v15 = [v22 reverseObjectEnumerator];

        uint64_t v23 = [v15 countByEnumeratingWithState:&v46 objects:v55 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v47;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v47 != v25) {
                objc_enumerationMutation(v15);
              }
              [v3 addObject:*(void *)(*((void *)&v46 + 1) + 8 * j)];
            }
            uint64_t v24 = [v15 countByEnumeratingWithState:&v46 objects:v55 count:16];
          }
          while (v24);
        }
        goto LABEL_35;
      }
      if (v10 != 1) {
        break;
      }
      if (v9)
      {
        id v15 = v9[6];
        v12 = (id *)[v9[5] copy];
      }
      else
      {
        id v15 = 0;
        v12 = 0;
      }
      uint64_t v16 = [v12 count];
LABEL_20:

      if (v15)
      {
        v17 = [v41 objectForKeyedSubscript:v15];
        v18 = v17;
        if (v17)
        {
          v19 = NSNumber;
          uint64_t v20 = [v17 unsignedIntegerValue] + v16;
          v21 = v19;
        }
        else
        {
          [v40 addObject:v15];
          v21 = NSNumber;
          uint64_t v20 = v16;
        }
        v27 = [v21 numberWithUnsignedInteger:v20];
        [v41 setObject:v27 forKeyedSubscript:v15];

LABEL_35:
      }
LABEL_36:

      if (![v3 count]) {
        goto LABEL_43;
      }
    }
    if (v10) {
      goto LABEL_36;
    }
    if (v9)
    {
      v11 = (id *)v9[5];
      v12 = v11;
      if (v11)
      {
        v13 = (id *)v11[2];
        v14 = v13;
        if (v13)
        {
          id v15 = v13[2];
LABEL_16:

          uint64_t v16 = 1;
          goto LABEL_20;
        }
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
      v12 = 0;
    }
    id v15 = 0;
    goto LABEL_16;
  }
LABEL_43:
  id v28 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v29 = v40;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v43;
    char v33 = 1;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v43 != v32) {
          objc_enumerationMutation(v29);
        }
        v35 = *(void **)(*((void *)&v42 + 1) + 8 * k);
        if ((v33 & 1) == 0) {
          [v28 appendString:@", "];
        }
        v36 = objc_msgSend(v41, "objectForKeyedSubscript:", v35, v40);
        if ((unint64_t)[v36 unsignedIntegerValue] > 1) {
          [v35 pluralSummary];
        }
        else {
        v37 = [v35 singularSummary];
        }

        [v28 appendString:v37];
        if (v33) {
          char v33 = 0;
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v42 objects:v54 count:16];
    }
    while (v31);
  }

  v38 = (void *)[v28 copy];
  return v38;
}

uint64_t __61__PKApplicationMessageNodeMultipleGroupBranch__sortWithDate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = -[PKApplicationMessageNodeGroupBranch _primaryRegistration](a2);
  id v7 = -[PKApplicationMessageNodeGroupBranch _primaryRegistration]((uint64_t)v5);

  uint64_t v8 = PKApplicationMessageRegistrationComparison(v6, v7, *(void **)(a1 + 32));
  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end