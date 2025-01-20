@interface AllRefinementsViewModelSectionMultiSelect
- (AllRefinementsViewModelSectionMultiSelect)initWithElements:(id)a3 displayName:(id)a4 maximumNumberOfSelectableElements:(unsigned int)a5 clauseType:(int64_t)a6 showEqualWidthButtonsOnFilterView:(BOOL)a7 displayNameForMultiSelected:(id)a8 multiSelectIdentifier:(id)a9;
- (BOOL)compare:(id)a3;
- (BOOL)showEqualWidthButtonsOnFilterView;
- (NSArray)elements;
- (NSString)displayName;
- (NSString)displayNameForMultiSelected;
- (NSString)multiSelectIdentifier;
- (NSUUID)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)clauseType;
- (unint64_t)type;
- (unsigned)maximumNumberOfSelectableElements;
- (void)resetToDefault;
@end

@implementation AllRefinementsViewModelSectionMultiSelect

- (AllRefinementsViewModelSectionMultiSelect)initWithElements:(id)a3 displayName:(id)a4 maximumNumberOfSelectableElements:(unsigned int)a5 clauseType:(int64_t)a6 showEqualWidthButtonsOnFilterView:(BOOL)a7 displayNameForMultiSelected:(id)a8 multiSelectIdentifier:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a8;
  id v19 = a9;
  v30.receiver = self;
  v30.super_class = (Class)AllRefinementsViewModelSectionMultiSelect;
  v20 = [(AllRefinementsViewModelSectionMultiSelect *)&v30 init];
  if (v20)
  {
    v21 = (NSUUID *)objc_alloc_init((Class)NSUUID);
    identifier = v20->_identifier;
    v20->_identifier = v21;

    v20->_type = 1;
    objc_storeStrong((id *)&v20->_elements, a3);
    v23 = (NSString *)[v17 copy];
    displayName = v20->_displayName;
    v20->_displayName = v23;

    v20->_maximumNumberOfSelectableElements = a5;
    v20->_clauseType = a6;
    v20->_showEqualWidthButtonsOnFilterView = a7;
    v25 = (NSString *)[v18 copy];
    displayNameForMultiSelected = v20->_displayNameForMultiSelected;
    v20->_displayNameForMultiSelected = v25;

    v27 = (NSString *)[v19 copy];
    multiSelectIdentifier = v20->_multiSelectIdentifier;
    v20->_multiSelectIdentifier = v27;
  }
  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)NSMutableArray);
  v5 = [(AllRefinementsViewModelSectionMultiSelect *)self elements];
  id v6 = [v4 initWithArray:v5 copyItems:1];

  v7 = [AllRefinementsViewModelSectionMultiSelect alloc];
  v8 = [(AllRefinementsViewModelSectionMultiSelect *)self displayName];
  uint64_t v9 = [(AllRefinementsViewModelSectionMultiSelect *)self maximumNumberOfSelectableElements];
  int64_t v10 = [(AllRefinementsViewModelSectionMultiSelect *)self clauseType];
  BOOL v11 = [(AllRefinementsViewModelSectionMultiSelect *)self showEqualWidthButtonsOnFilterView];
  v12 = [(AllRefinementsViewModelSectionMultiSelect *)self displayNameForMultiSelected];
  v13 = [(AllRefinementsViewModelSectionMultiSelect *)self multiSelectIdentifier];
  v14 = [(AllRefinementsViewModelSectionMultiSelect *)v7 initWithElements:v6 displayName:v8 maximumNumberOfSelectableElements:v9 clauseType:v10 showEqualWidthButtonsOnFilterView:v11 displayNameForMultiSelected:v12 multiSelectIdentifier:v13];

  return v14;
}

- (void)resetToDefault
{
}

- (BOOL)compare:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  id v6 = [v4 elements];
  id v7 = [v6 count];
  v8 = [(AllRefinementsViewModelSectionMultiSelect *)self elements];
  id v9 = [v8 count];

  if (v7 == v9)
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 1;
    elements = self->_elements;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100B2A228;
    v13[3] = &unk_1013185C8;
    id v14 = v5;
    v15 = &v16;
    [(NSArray *)elements enumerateObjectsUsingBlock:v13];
    BOOL v11 = *((unsigned char *)v17 + 24) != 0;

    _Block_object_dispose(&v16, 8);
  }
  else
  {
LABEL_4:
    BOOL v11 = 0;
  }

  return v11;
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

- (NSArray)elements
{
  return self->_elements;
}

- (unsigned)maximumNumberOfSelectableElements
{
  return self->_maximumNumberOfSelectableElements;
}

- (int64_t)clauseType
{
  return self->_clauseType;
}

- (BOOL)showEqualWidthButtonsOnFilterView
{
  return self->_showEqualWidthButtonsOnFilterView;
}

- (NSString)displayNameForMultiSelected
{
  return self->_displayNameForMultiSelected;
}

- (NSString)multiSelectIdentifier
{
  return self->_multiSelectIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiSelectIdentifier, 0);
  objc_storeStrong((id *)&self->_displayNameForMultiSelected, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end