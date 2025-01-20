@interface ICDeleteDecision
+ (BOOL)didShowMoveToRecentlyDeletedFolderAlert;
+ (BOOL)isHTMLFolder:(id)a3;
+ (BOOL)isHTMLNote:(id)a3;
+ (id)decisionObjectsForFolder:(id)a3;
+ (void)setDidShowMoveToRecentlyDeletedFolderAlert:(BOOL)a3;
- (BOOL)allowsRecentlyDeletedFolderAlert;
- (BOOL)containsUnsharedObjects;
- (BOOL)needsToDeleteShares;
- (BOOL)shouldContinueDecisionMaking;
- (BOOL)shouldDelete;
- (ICDeleteDecision)initWithSourceObjects:(id)a3;
- (ICDeleteDecision)initWithSourceObjects:(id)a3 allowsRecentlyDeletedFolderAlert:(BOOL)a4;
- (NSArray)guiltyObjects;
- (NSArray)htmlFolders;
- (NSArray)htmlNotes;
- (NSArray)htmlSourceObjects;
- (NSArray)modernFolders;
- (NSArray)modernNotes;
- (NSArray)modernSourceObjects;
- (id)description;
- (unint64_t)additionalStep;
- (unint64_t)type;
- (void)makeDecisionForDeletingHTMLSourceObjects;
- (void)makeDecisionForDeletingModernSourceObjects;
- (void)setAllowsRecentlyDeletedFolderAlert:(BOOL)a3;
- (void)setContainsUnsharedObjects:(BOOL)a3;
- (void)setDecisionWithType:(unint64_t)a3 additionalStep:(unint64_t)a4 guiltyObjects:(id)a5;
- (void)setDecisionWithType:(unint64_t)a3 guiltyObjects:(id)a4;
@end

@implementation ICDeleteDecision

- (ICDeleteDecision)initWithSourceObjects:(id)a3
{
  return [(ICDeleteDecision *)self initWithSourceObjects:a3 allowsRecentlyDeletedFolderAlert:1];
}

- (ICDeleteDecision)initWithSourceObjects:(id)a3 allowsRecentlyDeletedFolderAlert:(BOOL)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ICDeleteDecision;
  v7 = [(ICDeleteDecision *)&v24 init];
  v8 = v7;
  if (v7)
  {
    v7->_allowsRecentlyDeletedFolderAlert = a4;
    uint64_t v9 = [v6 ic_compactMap:&stru_100628488];
    modernNotes = v8->_modernNotes;
    v8->_modernNotes = (NSArray *)v9;

    uint64_t v11 = [v6 ic_compactMap:&stru_1006284A8];
    modernFolders = v8->_modernFolders;
    v8->_modernFolders = (NSArray *)v11;

    v13 = +[NSMutableArray array];
    [v13 addObjectsFromArray:v8->_modernNotes];
    [v13 addObjectsFromArray:v8->_modernFolders];
    v14 = (NSArray *)[v13 copy];
    modernSourceObjects = v8->_modernSourceObjects;
    v8->_modernSourceObjects = v14;

    uint64_t v16 = [v6 ic_compactMap:&stru_1006284C8];
    htmlNotes = v8->_htmlNotes;
    v8->_htmlNotes = (NSArray *)v16;

    uint64_t v18 = [v6 ic_compactMap:&stru_1006284E8];
    htmlFolders = v8->_htmlFolders;
    v8->_htmlFolders = (NSArray *)v18;

    v20 = +[NSMutableArray array];
    [v20 addObjectsFromArray:v8->_htmlNotes];
    [v20 addObjectsFromArray:v8->_htmlFolders];
    v21 = (NSArray *)[v20 copy];
    htmlSourceObjects = v8->_htmlSourceObjects;
    v8->_htmlSourceObjects = v21;

    if ([(NSArray *)v8->_modernSourceObjects count])
    {
      [(ICDeleteDecision *)v8 makeDecisionForDeletingModernSourceObjects];
      if (![(NSArray *)v8->_htmlSourceObjects count]) {
        goto LABEL_7;
      }
    }
    else if (![(NSArray *)v8->_htmlSourceObjects count])
    {
      [(ICDeleteDecision *)v8 setDecisionWithType:2 guiltyObjects:&__NSArray0__struct];
      goto LABEL_7;
    }
    [(ICDeleteDecision *)v8 makeDecisionForDeletingHTMLSourceObjects];
LABEL_7:
  }
  return v8;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)ICDeleteDecision;
  v3 = [(ICDeleteDecision *)&v11 description];
  unint64_t v4 = [(ICDeleteDecision *)self type];
  v5 = @"ICDeleteDecisionTypeAllow";
  if (v4 == 1) {
    v5 = @"ICDeleteDecisionTypeAllowWithAdditionalStep";
  }
  if (v4 == 2) {
    v5 = @"ICDeleteDecisionTypePrevent";
  }
  id v6 = v5;
  v7 = sub_1000B19E0([(ICDeleteDecision *)self additionalStep]);
  v8 = [(ICDeleteDecision *)self guiltyObjects];
  uint64_t v9 = +[NSString stringWithFormat:@"%@: type = %@, additionalStep = %@, guiltyObjects = %@", v3, v6, v7, v8];

  return v9;
}

- (BOOL)shouldDelete
{
  return (id)[(ICDeleteDecision *)self type] != (id)2;
}

- (BOOL)needsToDeleteShares
{
  unint64_t v2 = [(ICDeleteDecision *)self additionalStep];
  return (v2 > 0xD) | (0x1Eu >> v2) & 1;
}

+ (id)decisionObjectsForFolder:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  unsigned __int8 v6 = [v4 isSharedViaICloud];
  [v5 addObject:v4];
  if ((v6 & 1) == 0)
  {
    v7 = [v4 visibleNotes];
    [v5 addObjectsFromArray:v7];

    v8 = [v4 visibleNoteContainerChildrenUnsorted];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [a1 decisionObjectsForFolder:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          [v5 addObjectsFromArray:v13];
        }
        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
  id v14 = [v5 copy];

  return v14;
}

+ (BOOL)didShowMoveToRecentlyDeletedFolderAlert
{
  unint64_t v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"didShowMoveToRecentyDeletedFolderAlert"];

  return v3;
}

+ (void)setDidShowMoveToRecentlyDeletedFolderAlert:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setBool:v3 forKey:@"didShowMoveToRecentyDeletedFolderAlert"];
}

+ (BOOL)isHTMLNote:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)isHTMLFolder:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)makeDecisionForDeletingModernSourceObjects
{
  if ([(ICDeleteDecision *)self shouldContinueDecisionMaking])
  {
    id v3 = objc_alloc((Class)NSMutableSet);
    id v4 = [(ICDeleteDecision *)self modernSourceObjects];
    id v5 = [v3 initWithArray:v4];

    unsigned __int8 v6 = [(ICDeleteDecision *)self modernSourceObjects];
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_1000B250C;
    v57[3] = &unk_100628510;
    id v7 = v5;
    id v58 = v7;
    [v6 enumerateObjectsUsingBlock:v57];

    if ([v7 count])
    {
      +[NSMutableSet set];
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_1000B2590;
      v55[3] = &unk_100628538;
      id v56 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = v56;
      [v7 enumerateObjectsUsingBlock:v55];
      [v7 minusSet:v8];
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_1000B2608;
      v53[3] = &unk_100628538;
      id v54 = v7;
      [v8 enumerateObjectsUsingBlock:v53];
    }
    else
    {
      id v8 = [(ICDeleteDecision *)self modernSourceObjects];
      [(ICDeleteDecision *)self setDecisionWithType:2 guiltyObjects:v8];
    }

    id v32 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v7, "count"));
    id v38 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v7, "count"));
    id v36 = [objc_alloc((Class)NSMutableSet) initWithCapacity:[v7 count]];
    id v9 = [objc_alloc((Class)NSMutableSet) initWithCapacity:[v7 count]];
    id v10 = [objc_alloc((Class)NSMutableSet) initWithCapacity:[v7 count]];
    id v31 = [objc_alloc((Class)NSMutableSet) initWithCapacity:[v7 count]];
    id v11 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v7, "count"));
    id v12 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v7, "count"));
    id v13 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v7, "count"));
    id v14 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v7, "count"));
    id v15 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v7, "count"));
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000B26A4;
    v40[3] = &unk_100628560;
    v40[4] = self;
    id v33 = [objc_alloc((Class)NSMutableSet) initWithCapacity:[v7 count]];
    id v41 = v33;
    id v34 = v15;
    id v42 = v34;
    id v39 = v38;
    id v43 = v39;
    id v37 = v36;
    id v44 = v37;
    id v35 = v9;
    id v45 = v35;
    id v16 = v10;
    id v46 = v16;
    id v17 = v14;
    id v47 = v17;
    id v18 = v12;
    id v48 = v18;
    id v19 = v13;
    id v49 = v19;
    id v20 = v11;
    id v50 = v20;
    id v21 = v31;
    id v51 = v21;
    id v22 = v32;
    id v52 = v22;
    [v7 enumerateObjectsUsingBlock:v40];
    if ([v22 count])
    {
      v23 = v22;
LABEL_7:
      objc_super v24 = [v23 allObjects];
      [(ICDeleteDecision *)self setDecisionWithType:2 guiltyObjects:v24];
LABEL_11:

LABEL_12:
      return;
    }
    if ([v20 count])
    {
      objc_super v24 = [v20 allObjects];
      v25 = self;
      uint64_t v26 = 12;
    }
    else
    {
      if ([v17 count])
      {
        v23 = v17;
        goto LABEL_7;
      }
      if ([v39 count])
      {
        objc_super v24 = [v39 allObjects];
        v25 = self;
        uint64_t v26 = 1;
      }
      else if ([v37 count])
      {
        objc_super v24 = [v39 allObjects];
        v25 = self;
        uint64_t v26 = 2;
      }
      else if ([v35 count])
      {
        objc_super v24 = [v35 allObjects];
        v25 = self;
        uint64_t v26 = 3;
      }
      else if ([v16 count])
      {
        objc_super v24 = [v16 allObjects];
        v25 = self;
        uint64_t v26 = 4;
      }
      else if ([v18 count])
      {
        objc_super v24 = [v18 allObjects];
        v25 = self;
        uint64_t v26 = 5;
      }
      else if ([v19 count])
      {
        objc_super v24 = [v19 allObjects];
        v25 = self;
        uint64_t v26 = 6;
      }
      else
      {
        if ([v21 count])
        {
          unsigned int v27 = [v21 ic_containsObjectPassingTest:&stru_1006285A0];
          uint64_t v28 = [v21 allObjects];
          v29 = self;
          v30 = (void *)v28;
          if (v27) {
            [(ICDeleteDecision *)v29 setDecisionWithType:2 guiltyObjects:v28];
          }
          else {
            [(ICDeleteDecision *)v29 setDecisionWithType:1 additionalStep:7 guiltyObjects:v28];
          }

          goto LABEL_12;
        }
        if ([v33 count])
        {
          objc_super v24 = [v34 allObjects];
          v25 = self;
          uint64_t v26 = 10;
        }
        else
        {
          if (![v34 count])
          {
            if (+[ICDeleteDecision didShowMoveToRecentlyDeletedFolderAlert]|| ![(ICDeleteDecision *)self allowsRecentlyDeletedFolderAlert])
            {
              -[ICDeleteDecision setDecisionWithType:guiltyObjects:](self, "setDecisionWithType:guiltyObjects:", 0, &__NSArray0__struct, v31);
            }
            else
            {
              [(ICDeleteDecision *)self setDecisionWithType:1 additionalStep:11 guiltyObjects:&__NSArray0__struct];
            }
            goto LABEL_12;
          }
          objc_super v24 = [v34 allObjects];
          v25 = self;
          uint64_t v26 = 13;
        }
      }
    }
    -[ICDeleteDecision setDecisionWithType:additionalStep:guiltyObjects:](v25, "setDecisionWithType:additionalStep:guiltyObjects:", 1, v26, v24, v31);
    goto LABEL_11;
  }
}

- (void)makeDecisionForDeletingHTMLSourceObjects
{
  if ([(ICDeleteDecision *)self shouldContinueDecisionMaking])
  {
    id v3 = objc_alloc((Class)NSMutableSet);
    id v4 = [(ICDeleteDecision *)self htmlSourceObjects];
    id v5 = [v3 initWithArray:v4];

    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    unsigned __int8 v6 = [(ICDeleteDecision *)self htmlSourceObjects];
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = sub_1000B2ADC;
    id v14 = &unk_1006285C8;
    id v16 = &v17;
    id v7 = v5;
    id v15 = v7;
    [v6 enumerateObjectsUsingBlock:&v11];

    if (objc_msgSend(v7, "count", v11, v12, v13, v14))
    {
      if (!*((unsigned char *)v18 + 24))
      {
LABEL_10:

        _Block_object_dispose(&v17, 8);
        return;
      }
      id v8 = [v7 count];
      id v9 = [v7 allObjects];
      if ((unint64_t)v8 > 1) {
        uint64_t v10 = 8;
      }
      else {
        uint64_t v10 = 9;
      }
      [(ICDeleteDecision *)self setDecisionWithType:1 additionalStep:v10 guiltyObjects:v9];
    }
    else
    {
      id v9 = [v7 allObjects];
      [(ICDeleteDecision *)self setDecisionWithType:2 guiltyObjects:v9];
    }

    goto LABEL_10;
  }
}

- (void)setDecisionWithType:(unint64_t)a3 additionalStep:(unint64_t)a4 guiltyObjects:(id)a5
{
  id v9 = a5;
  if (self->_type < a3)
  {
    self->_type = a3;
    self->_additionalStep = a4;
    id v10 = v9;
    objc_storeStrong((id *)&self->_guiltyObjects, a5);
    id v9 = v10;
  }
}

- (void)setDecisionWithType:(unint64_t)a3 guiltyObjects:(id)a4
{
}

- (BOOL)shouldContinueDecisionMaking
{
  return (id)[(ICDeleteDecision *)self type] != (id)2;
}

- (NSArray)modernFolders
{
  return self->_modernFolders;
}

- (NSArray)modernNotes
{
  return self->_modernNotes;
}

- (NSArray)modernSourceObjects
{
  return self->_modernSourceObjects;
}

- (NSArray)htmlNotes
{
  return self->_htmlNotes;
}

- (NSArray)htmlFolders
{
  return self->_htmlFolders;
}

- (NSArray)htmlSourceObjects
{
  return self->_htmlSourceObjects;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)additionalStep
{
  return self->_additionalStep;
}

- (NSArray)guiltyObjects
{
  return self->_guiltyObjects;
}

- (BOOL)containsUnsharedObjects
{
  return self->_containsUnsharedObjects;
}

- (void)setContainsUnsharedObjects:(BOOL)a3
{
  self->_containsUnsharedObjects = a3;
}

- (BOOL)allowsRecentlyDeletedFolderAlert
{
  return self->_allowsRecentlyDeletedFolderAlert;
}

- (void)setAllowsRecentlyDeletedFolderAlert:(BOOL)a3
{
  self->_allowsRecentlyDeletedFolderAlert = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guiltyObjects, 0);
  objc_storeStrong((id *)&self->_htmlSourceObjects, 0);
  objc_storeStrong((id *)&self->_htmlFolders, 0);
  objc_storeStrong((id *)&self->_htmlNotes, 0);
  objc_storeStrong((id *)&self->_modernSourceObjects, 0);
  objc_storeStrong((id *)&self->_modernNotes, 0);

  objc_storeStrong((id *)&self->_modernFolders, 0);
}

@end