@interface MCDBrowserIdentifiers
+ (id)sharedInstance;
+ (id)symbolImageForIdentifier:(id)a3;
- (BOOL)_identifiersDidChange;
- (BOOL)shouldShowCellForIdentifier:(id)a3;
- (NSArray)cellIdentifiers;
- (NSArray)orderedIdentifiers;
- (NSSet)activeIdentifiers;
- (double)maxImageWidth;
- (void)_updateCellIdentifiersOrdering;
- (void)setActiveIdentifiers:(id)a3;
- (void)setCellIdentifiers:(id)a3;
- (void)setOrderedIdentifiers:(id)a3;
@end

@implementation MCDBrowserIdentifiers

+ (id)sharedInstance
{
  if (qword_1010D6CD0 != -1) {
    dispatch_once(&qword_1010D6CD0, &stru_100FC38B8);
  }
  v2 = (void *)qword_1010D6CC8;

  return v2;
}

- (BOOL)_identifiersDidChange
{
  v3 = +[NSUserDefaults standardUserDefaults];
  v4 = [v3 libraryMenuOrderedIdentifiers];

  if (![(NSArray *)v4 count])
  {
    uint64_t v5 = sub_10008C930();

    v4 = (NSArray *)v5;
  }
  v6 = +[NSUserDefaults standardUserDefaults];
  v7 = [v6 libraryMenuSelectedIdentifiers];

  if (![(NSSet *)v7 count])
  {
    v8 = sub_10008C930();
    uint64_t v9 = +[NSSet setWithArray:v8];

    v7 = (NSSet *)v9;
  }
  if ([(NSArray *)v4 isEqualToArray:self->_orderedIdentifiers]) {
    unsigned int v10 = ![(NSSet *)v7 isEqualToSet:self->_activeIdentifiers];
  }
  else {
    LOBYTE(v10) = 1;
  }
  orderedIdentifiers = self->_orderedIdentifiers;
  self->_orderedIdentifiers = v4;
  v12 = v4;

  activeIdentifiers = self->_activeIdentifiers;
  self->_activeIdentifiers = v7;

  return v10;
}

- (BOOL)shouldShowCellForIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  v4 = sub_10008CAAC();
  uint64_t v5 = [v4 allKeys];
  unsigned __int8 v6 = [v5 containsObject:v3];

  return v6;
}

+ (id)symbolImageForIdentifier:(id)a3
{
  uint64_t v3 = qword_1010D6CE0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1010D6CE0, &stru_100FC38D8);
  }
  uint64_t v5 = [(id)qword_1010D6CD8 objectForKeyedSubscript:v4];

  return v5;
}

- (void)_updateCellIdentifiersOrdering
{
  uint64_t v3 = +[NSMutableArray array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = self->_orderedIdentifiers;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if ([(NSSet *)self->_activeIdentifiers containsObject:v9]) {
          [v3 addObject:v9];
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  unsigned int v10 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v3;
  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v17 + 1) + 8 * (void)j);
        if (-[MCDBrowserIdentifiers shouldShowCellForIdentifier:](self, "shouldShowCellForIdentifier:", v16, (void)v17))
        {
          [v10 addObject:v16];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  [(MCDBrowserIdentifiers *)self setCellIdentifiers:v10];
}

- (NSArray)cellIdentifiers
{
  return self->_cellIdentifiers;
}

- (void)setCellIdentifiers:(id)a3
{
}

- (NSArray)orderedIdentifiers
{
  return self->_orderedIdentifiers;
}

- (void)setOrderedIdentifiers:(id)a3
{
}

- (NSSet)activeIdentifiers
{
  return self->_activeIdentifiers;
}

- (void)setActiveIdentifiers:(id)a3
{
}

- (double)maxImageWidth
{
  return self->_maxImageWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeIdentifiers, 0);
  objc_storeStrong((id *)&self->_orderedIdentifiers, 0);

  objc_storeStrong((id *)&self->_cellIdentifiers, 0);
}

@end