@interface TPPBPolicyDocument
+ (Class)categoriesByViewType;
+ (Class)inheritedExcludedViewsType;
+ (Class)introducersByCategoryType;
+ (Class)keyViewMappingType;
+ (Class)modelToCategoryType;
+ (Class)piggybackViewsType;
+ (Class)priorityViewsType;
+ (Class)redactionsType;
+ (Class)userControllableViewsType;
- (BOOL)hasPolicyVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)categoriesByViews;
- (NSMutableArray)inheritedExcludedViews;
- (NSMutableArray)introducersByCategorys;
- (NSMutableArray)keyViewMappings;
- (NSMutableArray)modelToCategorys;
- (NSMutableArray)piggybackViews;
- (NSMutableArray)priorityViews;
- (NSMutableArray)redactions;
- (NSMutableArray)userControllableViews;
- (id)categoriesByViewAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)inheritedExcludedViewsAtIndex:(unint64_t)a3;
- (id)introducersByCategoryAtIndex:(unint64_t)a3;
- (id)keyViewMappingAtIndex:(unint64_t)a3;
- (id)modelToCategoryAtIndex:(unint64_t)a3;
- (id)piggybackViewsAtIndex:(unint64_t)a3;
- (id)priorityViewsAtIndex:(unint64_t)a3;
- (id)redactionsAtIndex:(unint64_t)a3;
- (id)userControllableViewsAtIndex:(unint64_t)a3;
- (unint64_t)categoriesByViewsCount;
- (unint64_t)hash;
- (unint64_t)inheritedExcludedViewsCount;
- (unint64_t)introducersByCategorysCount;
- (unint64_t)keyViewMappingsCount;
- (unint64_t)modelToCategorysCount;
- (unint64_t)piggybackViewsCount;
- (unint64_t)policyVersion;
- (unint64_t)priorityViewsCount;
- (unint64_t)redactionsCount;
- (unint64_t)userControllableViewsCount;
- (void)addCategoriesByView:(id)a3;
- (void)addInheritedExcludedViews:(id)a3;
- (void)addIntroducersByCategory:(id)a3;
- (void)addKeyViewMapping:(id)a3;
- (void)addModelToCategory:(id)a3;
- (void)addPiggybackViews:(id)a3;
- (void)addPriorityViews:(id)a3;
- (void)addRedactions:(id)a3;
- (void)addUserControllableViews:(id)a3;
- (void)clearCategoriesByViews;
- (void)clearInheritedExcludedViews;
- (void)clearIntroducersByCategorys;
- (void)clearKeyViewMappings;
- (void)clearModelToCategorys;
- (void)clearPiggybackViews;
- (void)clearPriorityViews;
- (void)clearRedactions;
- (void)clearUserControllableViews;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategoriesByViews:(id)a3;
- (void)setHasPolicyVersion:(BOOL)a3;
- (void)setInheritedExcludedViews:(id)a3;
- (void)setIntroducersByCategorys:(id)a3;
- (void)setKeyViewMappings:(id)a3;
- (void)setModelToCategorys:(id)a3;
- (void)setPiggybackViews:(id)a3;
- (void)setPolicyVersion:(unint64_t)a3;
- (void)setPriorityViews:(id)a3;
- (void)setRedactions:(id)a3;
- (void)setUserControllableViews:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPolicyDocument

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userControllableViews, 0);
  objc_storeStrong((id *)&self->_redactions, 0);
  objc_storeStrong((id *)&self->_priorityViews, 0);
  objc_storeStrong((id *)&self->_piggybackViews, 0);
  objc_storeStrong((id *)&self->_modelToCategorys, 0);
  objc_storeStrong((id *)&self->_keyViewMappings, 0);
  objc_storeStrong((id *)&self->_introducersByCategorys, 0);
  objc_storeStrong((id *)&self->_inheritedExcludedViews, 0);
  objc_storeStrong((id *)&self->_categoriesByViews, 0);
}

- (void)setInheritedExcludedViews:(id)a3
{
}

- (NSMutableArray)inheritedExcludedViews
{
  return self->_inheritedExcludedViews;
}

- (void)setPriorityViews:(id)a3
{
}

- (NSMutableArray)priorityViews
{
  return self->_priorityViews;
}

- (void)setPiggybackViews:(id)a3
{
}

- (NSMutableArray)piggybackViews
{
  return self->_piggybackViews;
}

- (void)setUserControllableViews:(id)a3
{
}

- (NSMutableArray)userControllableViews
{
  return self->_userControllableViews;
}

- (void)setKeyViewMappings:(id)a3
{
}

- (NSMutableArray)keyViewMappings
{
  return self->_keyViewMappings;
}

- (void)setRedactions:(id)a3
{
}

- (NSMutableArray)redactions
{
  return self->_redactions;
}

- (void)setIntroducersByCategorys:(id)a3
{
}

- (NSMutableArray)introducersByCategorys
{
  return self->_introducersByCategorys;
}

- (void)setCategoriesByViews:(id)a3
{
}

- (NSMutableArray)categoriesByViews
{
  return self->_categoriesByViews;
}

- (void)setModelToCategorys:(id)a3
{
}

- (NSMutableArray)modelToCategorys
{
  return self->_modelToCategorys;
}

- (unint64_t)policyVersion
{
  return self->_policyVersion;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (id *)v4;
  if (*((unsigned char *)v4 + 88))
  {
    self->_policyVersion = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v6 = *((id *)v4 + 6);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v83 objects:v95 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v84;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v84 != v9) {
          objc_enumerationMutation(v6);
        }
        [(TPPBPolicyDocument *)self addModelToCategory:*(void *)(*((void *)&v83 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v83 objects:v95 count:16];
    }
    while (v8);
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v11 = v5[2];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v79 objects:v94 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v80;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v80 != v14) {
          objc_enumerationMutation(v11);
        }
        [(TPPBPolicyDocument *)self addCategoriesByView:*(void *)(*((void *)&v79 + 1) + 8 * v15++)];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v79 objects:v94 count:16];
    }
    while (v13);
  }

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v16 = v5[4];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v75 objects:v93 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v76;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v76 != v19) {
          objc_enumerationMutation(v16);
        }
        [(TPPBPolicyDocument *)self addIntroducersByCategory:*(void *)(*((void *)&v75 + 1) + 8 * v20++)];
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v75 objects:v93 count:16];
    }
    while (v18);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v21 = v5[9];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v71 objects:v92 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v72;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v72 != v24) {
          objc_enumerationMutation(v21);
        }
        [(TPPBPolicyDocument *)self addRedactions:*(void *)(*((void *)&v71 + 1) + 8 * v25++)];
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v71 objects:v92 count:16];
    }
    while (v23);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v26 = v5[5];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v67 objects:v91 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v68;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v68 != v29) {
          objc_enumerationMutation(v26);
        }
        [(TPPBPolicyDocument *)self addKeyViewMapping:*(void *)(*((void *)&v67 + 1) + 8 * v30++)];
      }
      while (v28 != v30);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v67 objects:v91 count:16];
    }
    while (v28);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v31 = v5[10];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v63 objects:v90 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v64;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v64 != v34) {
          objc_enumerationMutation(v31);
        }
        [(TPPBPolicyDocument *)self addUserControllableViews:*(void *)(*((void *)&v63 + 1) + 8 * v35++)];
      }
      while (v33 != v35);
      uint64_t v33 = [v31 countByEnumeratingWithState:&v63 objects:v90 count:16];
    }
    while (v33);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v36 = v5[7];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v59 objects:v89 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v60;
    do
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v60 != v39) {
          objc_enumerationMutation(v36);
        }
        [(TPPBPolicyDocument *)self addPiggybackViews:*(void *)(*((void *)&v59 + 1) + 8 * v40++)];
      }
      while (v38 != v40);
      uint64_t v38 = [v36 countByEnumeratingWithState:&v59 objects:v89 count:16];
    }
    while (v38);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v41 = v5[8];
  uint64_t v42 = [v41 countByEnumeratingWithState:&v55 objects:v88 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v56;
    do
    {
      uint64_t v45 = 0;
      do
      {
        if (*(void *)v56 != v44) {
          objc_enumerationMutation(v41);
        }
        [(TPPBPolicyDocument *)self addPriorityViews:*(void *)(*((void *)&v55 + 1) + 8 * v45++)];
      }
      while (v43 != v45);
      uint64_t v43 = [v41 countByEnumeratingWithState:&v55 objects:v88 count:16];
    }
    while (v43);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v46 = v5[3];
  uint64_t v47 = [v46 countByEnumeratingWithState:&v51 objects:v87 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v52;
    do
    {
      uint64_t v50 = 0;
      do
      {
        if (*(void *)v52 != v49) {
          objc_enumerationMutation(v46);
        }
        -[TPPBPolicyDocument addInheritedExcludedViews:](self, "addInheritedExcludedViews:", *(void *)(*((void *)&v51 + 1) + 8 * v50++), (void)v51);
      }
      while (v48 != v50);
      uint64_t v48 = [v46 countByEnumeratingWithState:&v51 objects:v87 count:16];
    }
    while (v48);
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_policyVersion;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_modelToCategorys hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_categoriesByViews hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_introducersByCategorys hash];
  uint64_t v7 = [(NSMutableArray *)self->_redactions hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_keyViewMappings hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSMutableArray *)self->_userControllableViews hash];
  uint64_t v10 = [(NSMutableArray *)self->_piggybackViews hash];
  uint64_t v11 = v10 ^ [(NSMutableArray *)self->_priorityViews hash];
  return v9 ^ v11 ^ [(NSMutableArray *)self->_inheritedExcludedViews hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_policyVersion != *((void *)v4 + 1)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 88))
  {
LABEL_25:
    char v14 = 0;
    goto LABEL_26;
  }
  modelToCategorys = self->_modelToCategorys;
  if ((unint64_t)modelToCategorys | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](modelToCategorys, "isEqual:"))
  {
    goto LABEL_25;
  }
  categoriesByViews = self->_categoriesByViews;
  if ((unint64_t)categoriesByViews | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](categoriesByViews, "isEqual:")) {
      goto LABEL_25;
    }
  }
  introducersByCategorys = self->_introducersByCategorys;
  if ((unint64_t)introducersByCategorys | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](introducersByCategorys, "isEqual:")) {
      goto LABEL_25;
    }
  }
  redactions = self->_redactions;
  if ((unint64_t)redactions | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](redactions, "isEqual:")) {
      goto LABEL_25;
    }
  }
  keyViewMappings = self->_keyViewMappings;
  if ((unint64_t)keyViewMappings | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](keyViewMappings, "isEqual:")) {
      goto LABEL_25;
    }
  }
  userControllableViews = self->_userControllableViews;
  if ((unint64_t)userControllableViews | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](userControllableViews, "isEqual:")) {
      goto LABEL_25;
    }
  }
  piggybackViews = self->_piggybackViews;
  if ((unint64_t)piggybackViews | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](piggybackViews, "isEqual:")) {
      goto LABEL_25;
    }
  }
  priorityViews = self->_priorityViews;
  if ((unint64_t)priorityViews | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](priorityViews, "isEqual:")) {
      goto LABEL_25;
    }
  }
  inheritedExcludedViews = self->_inheritedExcludedViews;
  if ((unint64_t)inheritedExcludedViews | *((void *)v4 + 3)) {
    char v14 = -[NSMutableArray isEqual:](inheritedExcludedViews, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_26:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_policyVersion;
    *(unsigned char *)(v5 + 88) |= 1u;
  }
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  uint64_t v7 = self->_modelToCategorys;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v94 objects:v106 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v95;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v95 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v94 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addModelToCategory:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v94 objects:v106 count:16];
    }
    while (v9);
  }

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  uint64_t v13 = self->_categoriesByViews;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v90 objects:v105 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v91;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v91 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = (void *)[*(id *)(*((void *)&v90 + 1) + 8 * v17) copyWithZone:a3];
        [v6 addCategoriesByView:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v90 objects:v105 count:16];
    }
    while (v15);
  }

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v19 = self->_introducersByCategorys;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v86 objects:v104 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v87;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v87 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = (void *)[*(id *)(*((void *)&v86 + 1) + 8 * v23) copyWithZone:a3];
        [v6 addIntroducersByCategory:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v86 objects:v104 count:16];
    }
    while (v21);
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v25 = self->_redactions;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v82 objects:v103 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v83;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v83 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = (void *)[*(id *)(*((void *)&v82 + 1) + 8 * v29) copyWithZone:a3];
        [v6 addRedactions:v30];

        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v82 objects:v103 count:16];
    }
    while (v27);
  }

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v31 = self->_keyViewMappings;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v78 objects:v102 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v79;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v79 != v34) {
          objc_enumerationMutation(v31);
        }
        id v36 = (void *)[*(id *)(*((void *)&v78 + 1) + 8 * v35) copyWithZone:a3];
        [v6 addKeyViewMapping:v36];

        ++v35;
      }
      while (v33 != v35);
      uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v78 objects:v102 count:16];
    }
    while (v33);
  }

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v37 = self->_userControllableViews;
  uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v74 objects:v101 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v75;
    do
    {
      uint64_t v41 = 0;
      do
      {
        if (*(void *)v75 != v40) {
          objc_enumerationMutation(v37);
        }
        uint64_t v42 = (void *)[*(id *)(*((void *)&v74 + 1) + 8 * v41) copyWithZone:a3];
        [v6 addUserControllableViews:v42];

        ++v41;
      }
      while (v39 != v41);
      uint64_t v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v74 objects:v101 count:16];
    }
    while (v39);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  uint64_t v43 = self->_piggybackViews;
  uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v70 objects:v100 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v71;
    do
    {
      uint64_t v47 = 0;
      do
      {
        if (*(void *)v71 != v46) {
          objc_enumerationMutation(v43);
        }
        uint64_t v48 = (void *)[*(id *)(*((void *)&v70 + 1) + 8 * v47) copyWithZone:a3];
        [v6 addPiggybackViews:v48];

        ++v47;
      }
      while (v45 != v47);
      uint64_t v45 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v70 objects:v100 count:16];
    }
    while (v45);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v49 = self->_priorityViews;
  uint64_t v50 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v66 objects:v99 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v67;
    do
    {
      uint64_t v53 = 0;
      do
      {
        if (*(void *)v67 != v52) {
          objc_enumerationMutation(v49);
        }
        long long v54 = (void *)[*(id *)(*((void *)&v66 + 1) + 8 * v53) copyWithZone:a3];
        [v6 addPriorityViews:v54];

        ++v53;
      }
      while (v51 != v53);
      uint64_t v51 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v66 objects:v99 count:16];
    }
    while (v51);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v55 = self->_inheritedExcludedViews;
  uint64_t v56 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v62 objects:v98 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v63;
    do
    {
      uint64_t v59 = 0;
      do
      {
        if (*(void *)v63 != v58) {
          objc_enumerationMutation(v55);
        }
        long long v60 = objc_msgSend(*(id *)(*((void *)&v62 + 1) + 8 * v59), "copyWithZone:", a3, (void)v62);
        [v6 addInheritedExcludedViews:v60];

        ++v59;
      }
      while (v57 != v59);
      uint64_t v57 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v62 objects:v98 count:16];
    }
    while (v57);
  }

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_policyVersion;
    *((unsigned char *)v4 + 88) |= 1u;
  }
  id v41 = v4;
  if ([(TPPBPolicyDocument *)self modelToCategorysCount])
  {
    [v41 clearModelToCategorys];
    unint64_t v5 = [(TPPBPolicyDocument *)self modelToCategorysCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(TPPBPolicyDocument *)self modelToCategoryAtIndex:i];
        [v41 addModelToCategory:v8];
      }
    }
  }
  if ([(TPPBPolicyDocument *)self categoriesByViewsCount])
  {
    [v41 clearCategoriesByViews];
    unint64_t v9 = [(TPPBPolicyDocument *)self categoriesByViewsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(TPPBPolicyDocument *)self categoriesByViewAtIndex:j];
        [v41 addCategoriesByView:v12];
      }
    }
  }
  if ([(TPPBPolicyDocument *)self introducersByCategorysCount])
  {
    [v41 clearIntroducersByCategorys];
    unint64_t v13 = [(TPPBPolicyDocument *)self introducersByCategorysCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(TPPBPolicyDocument *)self introducersByCategoryAtIndex:k];
        [v41 addIntroducersByCategory:v16];
      }
    }
  }
  if ([(TPPBPolicyDocument *)self redactionsCount])
  {
    [v41 clearRedactions];
    unint64_t v17 = [(TPPBPolicyDocument *)self redactionsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        uint64_t v20 = [(TPPBPolicyDocument *)self redactionsAtIndex:m];
        [v41 addRedactions:v20];
      }
    }
  }
  if ([(TPPBPolicyDocument *)self keyViewMappingsCount])
  {
    [v41 clearKeyViewMappings];
    unint64_t v21 = [(TPPBPolicyDocument *)self keyViewMappingsCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0; n != v22; ++n)
      {
        uint64_t v24 = [(TPPBPolicyDocument *)self keyViewMappingAtIndex:n];
        [v41 addKeyViewMapping:v24];
      }
    }
  }
  if ([(TPPBPolicyDocument *)self userControllableViewsCount])
  {
    [v41 clearUserControllableViews];
    unint64_t v25 = [(TPPBPolicyDocument *)self userControllableViewsCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (iuint64_t i = 0; ii != v26; ++ii)
      {
        uint64_t v28 = [(TPPBPolicyDocument *)self userControllableViewsAtIndex:ii];
        [v41 addUserControllableViews:v28];
      }
    }
  }
  if ([(TPPBPolicyDocument *)self piggybackViewsCount])
  {
    [v41 clearPiggybackViews];
    unint64_t v29 = [(TPPBPolicyDocument *)self piggybackViewsCount];
    if (v29)
    {
      unint64_t v30 = v29;
      for (juint64_t j = 0; jj != v30; ++jj)
      {
        uint64_t v32 = [(TPPBPolicyDocument *)self piggybackViewsAtIndex:jj];
        [v41 addPiggybackViews:v32];
      }
    }
  }
  if ([(TPPBPolicyDocument *)self priorityViewsCount])
  {
    [v41 clearPriorityViews];
    unint64_t v33 = [(TPPBPolicyDocument *)self priorityViewsCount];
    if (v33)
    {
      unint64_t v34 = v33;
      for (kuint64_t k = 0; kk != v34; ++kk)
      {
        id v36 = [(TPPBPolicyDocument *)self priorityViewsAtIndex:kk];
        [v41 addPriorityViews:v36];
      }
    }
  }
  if ([(TPPBPolicyDocument *)self inheritedExcludedViewsCount])
  {
    [v41 clearInheritedExcludedViews];
    unint64_t v37 = [(TPPBPolicyDocument *)self inheritedExcludedViewsCount];
    if (v37)
    {
      unint64_t v38 = v37;
      for (muint64_t m = 0; mm != v38; ++mm)
      {
        uint64_t v40 = [(TPPBPolicyDocument *)self inheritedExcludedViewsAtIndex:mm];
        [v41 addInheritedExcludedViews:v40];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  unint64_t v5 = self->_modelToCategorys;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v82 objects:v94 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v83;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v83 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v82 objects:v94 count:16];
    }
    while (v7);
  }

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  unint64_t v10 = self->_categoriesByViews;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v78 objects:v93 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v79;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v79 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v78 objects:v93 count:16];
    }
    while (v12);
  }

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v15 = self->_introducersByCategorys;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v74 objects:v92 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v75;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v75 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v74 objects:v92 count:16];
    }
    while (v17);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  uint64_t v20 = self->_redactions;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v70 objects:v91 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v71;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v71 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v70 objects:v91 count:16];
    }
    while (v22);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  unint64_t v25 = self->_keyViewMappings;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v66 objects:v90 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v67;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v67 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v66 objects:v90 count:16];
    }
    while (v27);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  unint64_t v30 = self->_userControllableViews;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v62 objects:v89 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v63;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v63 != v33) {
          objc_enumerationMutation(v30);
        }
        PBDataWriterWriteStringField();
        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v62 objects:v89 count:16];
    }
    while (v32);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v35 = self->_piggybackViews;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v58 objects:v88 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v59;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v59 != v38) {
          objc_enumerationMutation(v35);
        }
        PBDataWriterWriteStringField();
        ++v39;
      }
      while (v37 != v39);
      uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v58 objects:v88 count:16];
    }
    while (v37);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v40 = self->_priorityViews;
  uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v54 objects:v87 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v55;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v55 != v43) {
          objc_enumerationMutation(v40);
        }
        PBDataWriterWriteStringField();
        ++v44;
      }
      while (v42 != v44);
      uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v54 objects:v87 count:16];
    }
    while (v42);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v45 = self->_inheritedExcludedViews;
  uint64_t v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v50 objects:v86 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v51;
    do
    {
      uint64_t v49 = 0;
      do
      {
        if (*(void *)v51 != v48) {
          objc_enumerationMutation(v45);
        }
        PBDataWriterWriteStringField();
        ++v49;
      }
      while (v47 != v49);
      uint64_t v47 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v50 objects:v86 count:16];
    }
    while (v47);
  }
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPolicyDocumentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedLongLong:self->_policyVersion];
    [v3 setObject:v4 forKey:@"policyVersion"];
  }
  if ([(NSMutableArray *)self->_modelToCategorys count])
  {
    unint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_modelToCategorys, "count"));
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v6 = self->_modelToCategorys;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v62 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v61 + 1) + 8 * i) dictionaryRepresentation];
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v61 objects:v69 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"modelToCategory"];
  }
  if ([(NSMutableArray *)self->_categoriesByViews count])
  {
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_categoriesByViews, "count"));
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v13 = self->_categoriesByViews;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v57 objects:v68 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v58 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = [*(id *)(*((void *)&v57 + 1) + 8 * j) dictionaryRepresentation];
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v57 objects:v68 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"categoriesByView"];
  }
  if ([(NSMutableArray *)self->_introducersByCategorys count])
  {
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_introducersByCategorys, "count"));
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    uint64_t v20 = self->_introducersByCategorys;
    uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v53 objects:v67 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v54;
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v54 != v23) {
            objc_enumerationMutation(v20);
          }
          unint64_t v25 = [*(id *)(*((void *)&v53 + 1) + 8 * k) dictionaryRepresentation];
          [v19 addObject:v25];
        }
        uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v53 objects:v67 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKey:@"introducersByCategory"];
  }
  if ([(NSMutableArray *)self->_redactions count])
  {
    uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_redactions, "count"));
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v27 = self->_redactions;
    uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v49 objects:v66 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v50;
      do
      {
        for (uint64_t m = 0; m != v29; ++m)
        {
          if (*(void *)v50 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = [*(id *)(*((void *)&v49 + 1) + 8 * m) dictionaryRepresentation];
          [v26 addObject:v32];
        }
        uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v49 objects:v66 count:16];
      }
      while (v29);
    }

    [v3 setObject:v26 forKey:@"redactions"];
  }
  if ([(NSMutableArray *)self->_keyViewMappings count])
  {
    uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_keyViewMappings, "count"));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v34 = self->_keyViewMappings;
    uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v45 objects:v65 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v46;
      do
      {
        for (uint64_t n = 0; n != v36; ++n)
        {
          if (*(void *)v46 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * n), "dictionaryRepresentation", (void)v45);
          [v33 addObject:v39];
        }
        uint64_t v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v45 objects:v65 count:16];
      }
      while (v36);
    }

    [v3 setObject:v33 forKey:@"keyViewMapping"];
  }
  userControllableViews = self->_userControllableViews;
  if (userControllableViews) {
    [v3 setObject:userControllableViews forKey:@"user_controllable_views"];
  }
  piggybackViews = self->_piggybackViews;
  if (piggybackViews) {
    [v3 setObject:piggybackViews forKey:@"piggyback_views"];
  }
  priorityViews = self->_priorityViews;
  if (priorityViews) {
    [v3 setObject:priorityViews forKey:@"priority_views"];
  }
  inheritedExcludedViews = self->_inheritedExcludedViews;
  if (inheritedExcludedViews) {
    [v3 setObject:inheritedExcludedViews forKey:@"inherited_excluded_views"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TPPBPolicyDocument;
  id v4 = [(TPPBPolicyDocument *)&v8 description];
  unint64_t v5 = [(TPPBPolicyDocument *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)inheritedExcludedViewsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_inheritedExcludedViews objectAtIndex:a3];
}

- (unint64_t)inheritedExcludedViewsCount
{
  return [(NSMutableArray *)self->_inheritedExcludedViews count];
}

- (void)addInheritedExcludedViews:(id)a3
{
  id v4 = a3;
  inheritedExcludedViews = self->_inheritedExcludedViews;
  id v8 = v4;
  if (!inheritedExcludedViews)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_inheritedExcludedViews;
    self->_inheritedExcludedViews = v6;

    id v4 = v8;
    inheritedExcludedViews = self->_inheritedExcludedViews;
  }
  [(NSMutableArray *)inheritedExcludedViews addObject:v4];
}

- (void)clearInheritedExcludedViews
{
}

- (id)priorityViewsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_priorityViews objectAtIndex:a3];
}

- (unint64_t)priorityViewsCount
{
  return [(NSMutableArray *)self->_priorityViews count];
}

- (void)addPriorityViews:(id)a3
{
  id v4 = a3;
  priorityViews = self->_priorityViews;
  id v8 = v4;
  if (!priorityViews)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_priorityViews;
    self->_priorityViews = v6;

    id v4 = v8;
    priorityViews = self->_priorityViews;
  }
  [(NSMutableArray *)priorityViews addObject:v4];
}

- (void)clearPriorityViews
{
}

- (id)piggybackViewsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_piggybackViews objectAtIndex:a3];
}

- (unint64_t)piggybackViewsCount
{
  return [(NSMutableArray *)self->_piggybackViews count];
}

- (void)addPiggybackViews:(id)a3
{
  id v4 = a3;
  piggybackViews = self->_piggybackViews;
  id v8 = v4;
  if (!piggybackViews)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_piggybackViews;
    self->_piggybackViews = v6;

    id v4 = v8;
    piggybackViews = self->_piggybackViews;
  }
  [(NSMutableArray *)piggybackViews addObject:v4];
}

- (void)clearPiggybackViews
{
}

- (id)userControllableViewsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_userControllableViews objectAtIndex:a3];
}

- (unint64_t)userControllableViewsCount
{
  return [(NSMutableArray *)self->_userControllableViews count];
}

- (void)addUserControllableViews:(id)a3
{
  id v4 = a3;
  userControllableViews = self->_userControllableViews;
  id v8 = v4;
  if (!userControllableViews)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_userControllableViews;
    self->_userControllableViews = v6;

    id v4 = v8;
    userControllableViews = self->_userControllableViews;
  }
  [(NSMutableArray *)userControllableViews addObject:v4];
}

- (void)clearUserControllableViews
{
}

- (id)keyViewMappingAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_keyViewMappings objectAtIndex:a3];
}

- (unint64_t)keyViewMappingsCount
{
  return [(NSMutableArray *)self->_keyViewMappings count];
}

- (void)addKeyViewMapping:(id)a3
{
  id v4 = a3;
  keyViewMappings = self->_keyViewMappings;
  id v8 = v4;
  if (!keyViewMappings)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_keyViewMappings;
    self->_keyViewMappings = v6;

    id v4 = v8;
    keyViewMappings = self->_keyViewMappings;
  }
  [(NSMutableArray *)keyViewMappings addObject:v4];
}

- (void)clearKeyViewMappings
{
}

- (id)redactionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_redactions objectAtIndex:a3];
}

- (unint64_t)redactionsCount
{
  return [(NSMutableArray *)self->_redactions count];
}

- (void)addRedactions:(id)a3
{
  id v4 = a3;
  redactions = self->_redactions;
  id v8 = v4;
  if (!redactions)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_redactions;
    self->_redactions = v6;

    id v4 = v8;
    redactions = self->_redactions;
  }
  [(NSMutableArray *)redactions addObject:v4];
}

- (void)clearRedactions
{
}

- (id)introducersByCategoryAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_introducersByCategorys objectAtIndex:a3];
}

- (unint64_t)introducersByCategorysCount
{
  return [(NSMutableArray *)self->_introducersByCategorys count];
}

- (void)addIntroducersByCategory:(id)a3
{
  id v4 = a3;
  introducersByCategorys = self->_introducersByCategorys;
  id v8 = v4;
  if (!introducersByCategorys)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_introducersByCategorys;
    self->_introducersByCategorys = v6;

    id v4 = v8;
    introducersByCategorys = self->_introducersByCategorys;
  }
  [(NSMutableArray *)introducersByCategorys addObject:v4];
}

- (void)clearIntroducersByCategorys
{
}

- (id)categoriesByViewAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_categoriesByViews objectAtIndex:a3];
}

- (unint64_t)categoriesByViewsCount
{
  return [(NSMutableArray *)self->_categoriesByViews count];
}

- (void)addCategoriesByView:(id)a3
{
  id v4 = a3;
  categoriesByViews = self->_categoriesByViews;
  id v8 = v4;
  if (!categoriesByViews)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_categoriesByViews;
    self->_categoriesByViews = v6;

    id v4 = v8;
    categoriesByViews = self->_categoriesByViews;
  }
  [(NSMutableArray *)categoriesByViews addObject:v4];
}

- (void)clearCategoriesByViews
{
}

- (id)modelToCategoryAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_modelToCategorys objectAtIndex:a3];
}

- (unint64_t)modelToCategorysCount
{
  return [(NSMutableArray *)self->_modelToCategorys count];
}

- (void)addModelToCategory:(id)a3
{
  id v4 = a3;
  modelToCategorys = self->_modelToCategorys;
  id v8 = v4;
  if (!modelToCategorys)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_modelToCategorys;
    self->_modelToCategorys = v6;

    id v4 = v8;
    modelToCategorys = self->_modelToCategorys;
  }
  [(NSMutableArray *)modelToCategorys addObject:v4];
}

- (void)clearModelToCategorys
{
}

- (BOOL)hasPolicyVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasPolicyVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setPolicyVersion:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_policyVersiouint64_t n = a3;
}

+ (Class)inheritedExcludedViewsType
{
  return (Class)objc_opt_class();
}

+ (Class)priorityViewsType
{
  return (Class)objc_opt_class();
}

+ (Class)piggybackViewsType
{
  return (Class)objc_opt_class();
}

+ (Class)userControllableViewsType
{
  return (Class)objc_opt_class();
}

+ (Class)keyViewMappingType
{
  return (Class)objc_opt_class();
}

+ (Class)redactionsType
{
  return (Class)objc_opt_class();
}

+ (Class)introducersByCategoryType
{
  return (Class)objc_opt_class();
}

+ (Class)categoriesByViewType
{
  return (Class)objc_opt_class();
}

+ (Class)modelToCategoryType
{
  return (Class)objc_opt_class();
}

@end