@interface RAPWorkflowLayoutManager
- (BOOL)_isCorrectionCategory:(id)a3;
- (BOOL)_isHomeCorrectionsCategory:(id)a3;
- (BOOL)_isOtherCategory:(id)a3;
- (BOOL)_isPersonalizedMapsCategory:(id)a3;
- (BOOL)_isSchoolCorrectionsCategory:(id)a3;
- (BOOL)_isWorkCorrectionsCategory:(id)a3;
- (BOOL)_shouldIncludeServerControlledField:(id)a3;
- (NSArray)addPlaceLayoutItems;
- (NSArray)correctionLayoutItems;
- (NSArray)incidentLayoutItems;
- (NSArray)otherLayoutItems;
- (RAPWorkflowLayoutManager)initWithSupportedCategories:(id)a3;
- (id)_categoryForName:(int)a3;
- (id)_mergeOriginalItems:(id)a3 withServerOverrideItems:(id)a4 withServerDisabledItemTypes:(id)a5;
- (id)addIncidentLayoutItems;
- (void)_initSubcategories;
- (void)mergeWithServerConfig:(id)a3;
- (void)mergeWithTrafficIncidentsLayout:(id)a3;
@end

@implementation RAPWorkflowLayoutManager

- (RAPWorkflowLayoutManager)initWithSupportedCategories:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPWorkflowLayoutManager;
  v5 = [(RAPWorkflowLayoutManager *)&v9 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    initialCategories = v5->_initialCategories;
    v5->_initialCategories = v6;

    [(RAPWorkflowLayoutManager *)v5 _initSubcategories];
  }

  return v5;
}

- (void)_initSubcategories
{
  p_clientHomeCategory = &self->_clientHomeCategory;
  self->_clientHomeCategory = 0;
  p_clientWorkCategory = &self->_clientWorkCategory;
  self->_clientWorkCategory = 0;
  p_clientSchoolCategory = &self->_clientSchoolCategory;
  self->_clientSchoolCategory = 0;
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  correctionLayoutItems = self->_correctionLayoutItems;
  self->_correctionLayoutItems = v3;

  v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  addPlaceLayoutItems = self->_addPlaceLayoutItems;
  self->_addPlaceLayoutItems = v5;

  v7 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
  incidentLayoutItems = self->_incidentLayoutItems;
  self->_incidentLayoutItems = v7;

  objc_super v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  otherLayoutItems = self->_otherLayoutItems;
  self->_otherLayoutItems = v9;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v11 = self->_initialCategories;
  id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v17 = objc_alloc_init(RAPLayoutItem);
        [(RAPLayoutItem *)v17 setFieldType:v16];
        unsigned __int8 v18 = [(RAPWorkflowLayoutManager *)self _isCorrectionCategory:v16];
        p_correctionLayoutItems = &self->_correctionLayoutItems;
        if ((v18 & 1) == 0)
        {
          if ([(RAPWorkflowLayoutManager *)self _isPersonalizedMapsCategory:v16])
          {
            if ([(RAPWorkflowLayoutManager *)self _isHomeCorrectionsCategory:v16]
              && (v20 = p_clientHomeCategory, !*p_clientHomeCategory)
              || (v20 = p_clientWorkCategory,
                  [(RAPWorkflowLayoutManager *)self _isWorkCorrectionsCategory:v16])
              || (unsigned int v21 = [(RAPWorkflowLayoutManager *)self _isSchoolCorrectionsCategory:v16], v20 = p_clientSchoolCategory, p_correctionLayoutItems = &self->_addPlaceLayoutItems, v21))
            {
              int64_t *v20 = (int64_t)[v16 integerValue];
              p_correctionLayoutItems = &self->_addPlaceLayoutItems;
            }
          }
          else
          {
            unsigned int v22 = [(RAPWorkflowLayoutManager *)self _isOtherCategory:v16];
            p_correctionLayoutItems = &self->_otherLayoutItems;
            if (!v22) {
              goto LABEL_15;
            }
          }
        }
        [(NSMutableArray *)*p_correctionLayoutItems addObject:v17];
LABEL_15:
      }
      id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v13);
  }
}

- (BOOL)_shouldIncludeServerControlledField:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 type];
  unsigned __int8 v6 = [v4 enabled];
  v7 = [v4 name];

  v8 = -[RAPWorkflowLayoutManager _categoryForName:](self, "_categoryForName:", [v7 workflowFieldName]);
  unsigned __int8 v9 = [v8 isEqual:&off_1013A7528];

  if (v5 == 1) {
    return v6 & (v9 ^ 1);
  }
  else {
    return 0;
  }
}

- (void)mergeWithServerConfig:(id)a3
{
  id v4 = [a3 layoutFields];
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v33 = objc_alloc_init((Class)NSMutableArray);
  id v31 = objc_alloc_init((Class)NSMutableArray);
  id v32 = objc_alloc_init((Class)NSMutableSet);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v35;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ([(RAPWorkflowLayoutManager *)self _shouldIncludeServerControlledField:v11])
        {
          id v12 = objc_alloc_init(RAPLayoutItem);
          id v13 = [v11 name];
          uint64_t v14 = -[RAPWorkflowLayoutManager _categoryForName:](self, "_categoryForName:", [v13 workflowFieldName]);
          [(RAPLayoutItem *)v12 setFieldType:v14];

          v15 = [v11 displayText];

          if (v15)
          {
            v16 = [v11 displayText];
            [(RAPLayoutItem *)v12 setDisplayText:v16];
          }
          v17 = [(RAPLayoutItem *)v12 fieldType];
          unsigned __int8 v18 = [(RAPWorkflowLayoutManager *)self _isCorrectionCategory:v17];

          v19 = v5;
          if (v18) {
            goto LABEL_12;
          }
          v20 = [(RAPLayoutItem *)v12 fieldType];
          unsigned __int8 v21 = [(RAPWorkflowLayoutManager *)self _isPersonalizedMapsCategory:v20];

          v19 = v33;
          if ((v21 & 1) != 0
            || ([(RAPLayoutItem *)v12 fieldType],
                unsigned int v22 = objc_claimAutoreleasedReturnValue(),
                unsigned int v23 = [(RAPWorkflowLayoutManager *)self _isOtherCategory:v22],
                v22,
                v19 = v31,
                v23))
          {
LABEL_12:
            [v19 addObject:v12];
          }
        }
        else
        {
          if ([v11 enabled]) {
            continue;
          }
          id v12 = [v11 name];
          v24 = [(RAPWorkflowLayoutManager *)self _categoryForName:[(RAPLayoutItem *)v12 workflowFieldName]];
          [v32 addObject:v24];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v8);
  }

  v25 = [(RAPWorkflowLayoutManager *)self _mergeOriginalItems:self->_correctionLayoutItems withServerOverrideItems:v5 withServerDisabledItemTypes:v32];
  correctionLayoutItems = self->_correctionLayoutItems;
  self->_correctionLayoutItems = v25;

  long long v27 = [(RAPWorkflowLayoutManager *)self _mergeOriginalItems:self->_addPlaceLayoutItems withServerOverrideItems:v33 withServerDisabledItemTypes:v32];
  addPlaceLayoutItems = self->_addPlaceLayoutItems;
  self->_addPlaceLayoutItems = v27;

  long long v29 = [(RAPWorkflowLayoutManager *)self _mergeOriginalItems:self->_otherLayoutItems withServerOverrideItems:v31 withServerDisabledItemTypes:v32];
  otherLayoutItems = self->_otherLayoutItems;
  self->_otherLayoutItems = v29;
}

- (id)_mergeOriginalItems:(id)a3 withServerOverrideItems:(id)a4 withServerDisabledItemTypes:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v42;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v42 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v17 = [v16 fieldType];
        [v10 setObject:v16 forKey:v17];
      }
      id v13 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v13);
  }

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1005185F0;
  v39[3] = &unk_1012EDBF0;
  id v33 = v9;
  id v40 = v33;
  unsigned __int8 v18 = +[NSPredicate predicateWithBlock:v39];
  long long v34 = v7;
  v19 = [v7 filteredArrayUsingPredicate:v18];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v20 = v19;
  id v21 = [v20 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v36;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v36 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
        long long v26 = [v25 fieldType];
        long long v27 = [v10 objectForKey:v26];

        if (v27)
        {
          long long v28 = [v27 displayText];
          id v29 = [v28 length];

          if (v29)
          {
            v30 = [v27 displayText];
            [v25 setDisplayText:v30];
          }
        }
      }
      id v22 = [v20 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v22);
  }

  id v31 = [v20 mutableCopy];

  return v31;
}

- (void)mergeWithTrafficIncidentsLayout:(id)a3
{
}

- (BOOL)_isCorrectionCategory:(id)a3
{
  id v3 = a3;
  id v4 = +[NSSet setWithArray:&off_1013AD6B0];
  unsigned __int8 v5 = [v4 containsObject:v3];

  return v5;
}

- (BOOL)_isPersonalizedMapsCategory:(id)a3
{
  id v4 = a3;
  if ([(RAPWorkflowLayoutManager *)self _isHomeCorrectionsCategory:v4]
    || [(RAPWorkflowLayoutManager *)self _isWorkCorrectionsCategory:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = [(RAPWorkflowLayoutManager *)self _isSchoolCorrectionsCategory:v4];
  }

  return v5;
}

- (BOOL)_isHomeCorrectionsCategory:(id)a3
{
  id v3 = a3;
  id v4 = +[NSSet setWithArray:&off_1013AD6C8];
  unsigned __int8 v5 = [v4 containsObject:v3];

  return v5;
}

- (BOOL)_isWorkCorrectionsCategory:(id)a3
{
  id v3 = a3;
  id v4 = +[NSSet setWithArray:&off_1013AD6E0];
  unsigned __int8 v5 = [v4 containsObject:v3];

  return v5;
}

- (BOOL)_isSchoolCorrectionsCategory:(id)a3
{
  id v3 = a3;
  id v4 = +[NSSet setWithArray:&off_1013AD6F8];
  unsigned __int8 v5 = [v4 containsObject:v3];

  return v5;
}

- (BOOL)_isOtherCategory:(id)a3
{
  id v3 = a3;
  id v4 = +[NSSet setWithArray:&off_1013AD710];
  unsigned __int8 v5 = [v4 containsObject:v3];

  return v5;
}

- (id)_categoryForName:(int)a3
{
  id v4 = &off_1013A7618;
  switch(a3)
  {
    case 0:
    case 9:
      break;
    case 1:
      id v4 = &off_1013A7540;
      break;
    case 2:
      id v4 = &off_1013A7558;
      break;
    case 3:
      id v4 = &off_1013A7570;
      break;
    case 7:
      uint64_t v5 = 16;
      goto LABEL_8;
    case 8:
      uint64_t v5 = 24;
LABEL_8:
      id v4 = +[NSNumber numberWithInteger:*(Class *)((char *)&self->super.super.isa + v5)];
      break;
    default:
      id v4 = &off_1013A7528;
      break;
  }

  return v4;
}

- (NSArray)correctionLayoutItems
{
  id v2 = [(NSMutableArray *)self->_correctionLayoutItems copy];

  return (NSArray *)v2;
}

- (NSArray)addPlaceLayoutItems
{
  id v2 = [(NSMutableArray *)self->_addPlaceLayoutItems copy];

  return (NSArray *)v2;
}

- (id)addIncidentLayoutItems
{
  id v2 = [(NSArray *)self->_incidentLayoutItems copy];

  return v2;
}

- (NSArray)otherLayoutItems
{
  id v2 = [(NSMutableArray *)self->_otherLayoutItems copy];

  return (NSArray *)v2;
}

- (NSArray)incidentLayoutItems
{
  return self->_incidentLayoutItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherLayoutItems, 0);
  objc_storeStrong((id *)&self->_incidentLayoutItems, 0);
  objc_storeStrong((id *)&self->_addPlaceLayoutItems, 0);
  objc_storeStrong((id *)&self->_correctionLayoutItems, 0);

  objc_storeStrong((id *)&self->_initialCategories, 0);
}

@end