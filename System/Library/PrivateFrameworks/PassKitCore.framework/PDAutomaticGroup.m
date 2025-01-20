@interface PDAutomaticGroup
+ (id)createAutomaticGroupForPass:(id)a3 withGroupingProfile:(id)a4;
- (BOOL)addPass:(id)a3 withGroupingProfile:(id)a4;
- (BOOL)isNFCEnabled;
- (BOOL)removePass:(id)a3;
- (BOOL)updateOrderWithCatalogGroup:(id)a3;
- (NSArray)sortedPassUniqueIdentifiers;
- (NSDate)ingestedDate;
- (NSDate)maxDate;
- (NSDate)minDate;
- (NSString)groupingID;
- (NSString)passTypeID;
- (int64_t)passStyle;
- (unint64_t)passType;
- (void)setGroupingID:(id)a3;
- (void)setIngestedDate:(id)a3;
- (void)setMaxDate:(id)a3;
- (void)setMinDate:(id)a3;
- (void)setNFCEnabled:(BOOL)a3;
- (void)setPassStyle:(int64_t)a3;
- (void)setPassTypeID:(id)a3;
- (void)setSortedPassUniqueIdentifiers:(id)a3;
@end

@implementation PDAutomaticGroup

+ (id)createAutomaticGroupForPass:(id)a3 withGroupingProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(PDAutomaticGroup);
  v8 = [v6 passTypeID];
  [(PDAutomaticGroup *)v7 setPassTypeID:v8];

  -[PDAutomaticGroup setPassStyle:](v7, "setPassStyle:", [v6 passStyle]);
  v9 = [v6 ingestedDate];
  [(PDAutomaticGroup *)v7 setIngestedDate:v9];

  if ([v6 passType] != (id)1) {
    -[PDAutomaticGroup setNFCEnabled:](v7, "setNFCEnabled:", [v6 isNFCEnabled]);
  }
  v10 = [v6 groupingID];
  if (v10)
  {
    [(PDAutomaticGroup *)v7 setGroupingID:v10];
  }
  else
  {
    v11 = [v6 relevantDates];
    v12 = +[PKPassRelevantDate findDateFromDates:v11 option:0];
    v13 = +[PKPassRelevantDate findDateFromDates:v11 option:3];
    [(PDAutomaticGroup *)v7 setMinDate:v12];
    [(PDAutomaticGroup *)v7 setMaxDate:v13];
  }
  id v14 = v6;
  id v15 = [v14 passType];
  v16 = [v14 groupingID];

  if (v15 == (id)1 && v16)
  {
    uint64_t v17 = [v5 uniqueID];
    v18 = (void *)v17;
    if (v17)
    {
      uint64_t v21 = v17;
      v19 = +[NSArray arrayWithObjects:&v21 count:1];
      [(PDAutomaticGroup *)v7 setSortedPassUniqueIdentifiers:v19];
    }
  }

  return v7;
}

- (void)setPassTypeID:(id)a3
{
  v4 = (NSString *)[a3 copy];
  passTypeID = self->_passTypeID;
  self->_passTypeID = v4;

  self->_passType = PKPassTypeForPassTypeIdentifier();
}

- (BOOL)addPass:(id)a3 withGroupingProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 relevantDates];
  v9 = +[PKPassRelevantDate findDateFromDates:v8 option:0];
  v10 = PKEarlierDate();

  char v11 = PKEqualObjects();
  if ((v11 & 1) == 0) {
    objc_storeStrong((id *)&self->_minDate, v10);
  }
  v40 = v10;
  v12 = [v7 relevantDates];
  v13 = +[PKPassRelevantDate findDateFromDates:v12 option:3];
  id v14 = PKLaterDate();

  if (PKEqualObjects())
  {
    char v15 = v11 ^ 1;
  }
  else
  {
    objc_storeStrong((id *)&self->_maxDate, v14);
    char v15 = 1;
  }
  v16 = [v7 ingestedDate];
  uint64_t v17 = PKLaterDate();

  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_ingestedDate, v17);
    char v15 = 1;
  }
  if (sub_100416D24(self))
  {
    v18 = [v6 uniqueID];
    if (v18)
    {
      NSUInteger v19 = [(NSArray *)self->_sortedPassUniqueIdentifiers count];
      id v20 = objc_alloc((Class)NSMutableArray);
      if (v19)
      {
        v36 = v17;
        v37 = v14;
        id v38 = v7;
        id v39 = v6;
        id v21 = objc_msgSend(v20, "initWithCapacity:", (char *)-[NSArray count](self->_sortedPassUniqueIdentifiers, "count") + 1);
        [v21 addObject:v18];
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        v22 = self->_sortedPassUniqueIdentifiers;
        id v23 = [(NSArray *)v22 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (!v23) {
          goto LABEL_25;
        }
        id v24 = v23;
        uint64_t v25 = *(void *)v42;
        while (1)
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v42 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            id v28 = v18;
            id v29 = v27;
            if (v28 == v29)
            {

              continue;
            }
            v30 = v29;
            if (!v29)
            {

LABEL_22:
              [v21 addObject:v30];
              continue;
            }
            unsigned __int8 v31 = [v28 isEqualToString:v29];

            if ((v31 & 1) == 0) {
              goto LABEL_22;
            }
          }
          id v24 = [(NSArray *)v22 countByEnumeratingWithState:&v41 objects:v45 count:16];
          if (!v24)
          {
LABEL_25:

            id v7 = v38;
            id v6 = v39;
            uint64_t v17 = v36;
            id v14 = v37;
            goto LABEL_29;
          }
        }
      }
      id v21 = objc_msgSend(v20, "initWithObjects:", v18, 0);
LABEL_29:
      v33 = (NSArray *)[v21 copy];
      sortedPassUniqueIdentifiers = self->_sortedPassUniqueIdentifiers;
      self->_sortedPassUniqueIdentifiers = v33;

      char v15 = 1;
    }

    v10 = v40;
  }
  else
  {
    v32 = self->_sortedPassUniqueIdentifiers;
    if (v32)
    {
      self->_sortedPassUniqueIdentifiers = 0;

      char v15 = 1;
    }
  }

  return v15;
}

- (BOOL)removePass:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100416D24(self);
  sortedPassUniqueIdentifiers = self->_sortedPassUniqueIdentifiers;
  if (!v5)
  {
    if (sortedPassUniqueIdentifiers)
    {
      self->_sortedPassUniqueIdentifiers = 0;

      BOOL v9 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v9 = 0;
    goto LABEL_9;
  }
  if (!sortedPassUniqueIdentifiers) {
    goto LABEL_8;
  }
  id v7 = [v4 uniqueID];
  v8 = v7;
  BOOL v9 = v7 != 0;
  if (v7)
  {
    v10 = self->_sortedPassUniqueIdentifiers;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100416E8C;
    v14[3] = &unk_10074FDC0;
    id v15 = v7;
    char v11 = [(NSArray *)v10 pk_objectsPassingTest:v14];
    v12 = self->_sortedPassUniqueIdentifiers;
    self->_sortedPassUniqueIdentifiers = v11;
  }
LABEL_9:

  return v9;
}

- (BOOL)updateOrderWithCatalogGroup:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100416D24(self);
  sortedPassUniqueIdentifiers = self->_sortedPassUniqueIdentifiers;
  if (v5)
  {
    if (sortedPassUniqueIdentifiers)
    {
      id v7 = [objc_alloc((Class)NSMutableSet) initWithArray:self->_sortedPassUniqueIdentifiers];
      id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self->_sortedPassUniqueIdentifiers, "count"));
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      BOOL v9 = [v4 uniqueIDs];
      id v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v30;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v30 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            if ([v7 containsObject:v14])
            {
              [v8 addObject:v14];
              [v7 removeObject:v14];
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v11);
      }

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v15 = self->_sortedPassUniqueIdentifiers;
      id v16 = [(NSArray *)v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v26;
        do
        {
          for (j = 0; j != v17; j = (char *)j + 1)
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * (void)j);
            if (objc_msgSend(v7, "containsObject:", v20, (void)v25))
            {
              [v8 addObject:v20];
              [v7 removeObject:v20];
            }
          }
          id v17 = [(NSArray *)v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v17);
      }

      id v21 = (NSArray *)[v8 copy];
      v22 = self->_sortedPassUniqueIdentifiers;
      self->_sortedPassUniqueIdentifiers = v21;

      goto LABEL_24;
    }
LABEL_25:
    BOOL v23 = 0;
    goto LABEL_26;
  }
  if (!sortedPassUniqueIdentifiers) {
    goto LABEL_25;
  }
  self->_sortedPassUniqueIdentifiers = 0;

LABEL_24:
  BOOL v23 = 1;
LABEL_26:

  return v23;
}

- (NSString)passTypeID
{
  return self->_passTypeID;
}

- (NSString)groupingID
{
  return self->_groupingID;
}

- (void)setGroupingID:(id)a3
{
}

- (int64_t)passStyle
{
  return self->_passStyle;
}

- (void)setPassStyle:(int64_t)a3
{
  self->_passStyle = a3;
}

- (NSDate)minDate
{
  return self->_minDate;
}

- (void)setMinDate:(id)a3
{
}

- (NSDate)maxDate
{
  return self->_maxDate;
}

- (void)setMaxDate:(id)a3
{
}

- (NSDate)ingestedDate
{
  return self->_ingestedDate;
}

- (void)setIngestedDate:(id)a3
{
}

- (BOOL)isNFCEnabled
{
  return self->_nfcEnabled;
}

- (void)setNFCEnabled:(BOOL)a3
{
  self->_nfcEnabled = a3;
}

- (NSArray)sortedPassUniqueIdentifiers
{
  return self->_sortedPassUniqueIdentifiers;
}

- (void)setSortedPassUniqueIdentifiers:(id)a3
{
}

- (unint64_t)passType
{
  return self->_passType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedPassUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_ingestedDate, 0);
  objc_storeStrong((id *)&self->_maxDate, 0);
  objc_storeStrong((id *)&self->_minDate, 0);
  objc_storeStrong((id *)&self->_groupingID, 0);
  objc_storeStrong((id *)&self->_passTypeID, 0);
}

@end