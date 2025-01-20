@interface AllRefinementsViewModelSectionToggles
- (AllRefinementsViewModelSectionToggles)initWithToggles:(id)a3 displayName:(id)a4;
- (BOOL)compare:(id)a3;
- (NSArray)toggles;
- (NSString)displayName;
- (NSUUID)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)type;
- (void)resetToDefault;
@end

@implementation AllRefinementsViewModelSectionToggles

- (AllRefinementsViewModelSectionToggles)initWithToggles:(id)a3 displayName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AllRefinementsViewModelSectionToggles;
  v9 = [(AllRefinementsViewModelSectionToggles *)&v13 init];
  if (v9)
  {
    v10 = (NSUUID *)objc_alloc_init((Class)NSUUID);
    identifier = v9->_identifier;
    v9->_identifier = v10;

    v9->_type = 0;
    objc_storeStrong((id *)&v9->_toggles, a3);
    objc_storeStrong((id *)&v9->_displayName, a4);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)NSMutableArray);
  v5 = [(AllRefinementsViewModelSectionToggles *)self toggles];
  id v6 = [v4 initWithArray:v5 copyItems:1];

  id v7 = [AllRefinementsViewModelSectionToggles alloc];
  id v8 = [(AllRefinementsViewModelSectionToggles *)self displayName];
  v9 = [(AllRefinementsViewModelSectionToggles *)v7 initWithToggles:v6 displayName:v8];

  return v9;
}

- (BOOL)compare:(id)a3
{
  id v4 = a3;
  v5 = [v4 toggles];
  id v6 = [v5 count];
  id v7 = [(AllRefinementsViewModelSectionToggles *)self toggles];
  id v8 = [v7 count];

  if (v6 == v8)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 1;
    v9 = [(AllRefinementsViewModelSectionToggles *)self toggles];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100B29D08;
    v12[3] = &unk_101318520;
    id v13 = v4;
    v14 = &v15;
    [v9 enumerateObjectsUsingBlock:v12];

    BOOL v10 = *((unsigned char *)v16 + 24) != 0;
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)resetToDefault
{
  id v2 = [(AllRefinementsViewModelSectionToggles *)self toggles];
  [v2 enumerateObjectsUsingBlock:&stru_101318560];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSArray)toggles
{
  return self->_toggles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggles, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end