@interface ICChecklistsFilterTypeSelection
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToICChecklistsFilterTypeSelection:(id)a3;
- (ICChecklistsFilterTypeSelection)initWithSelectionType:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filterName;
- (id)rawFilterValue;
- (int64_t)filterType;
- (unint64_t)hash;
- (unint64_t)selectionType;
@end

@implementation ICChecklistsFilterTypeSelection

- (ICChecklistsFilterTypeSelection)initWithSelectionType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICChecklistsFilterTypeSelection;
  result = [(ICChecklistsFilterTypeSelection *)&v5 init];
  if (result) {
    result->_selectionType = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[ICChecklistsFilterTypeSelection allocWithZone:a3];
  unint64_t v5 = [(ICChecklistsFilterTypeSelection *)self selectionType];
  return [(ICChecklistsFilterTypeSelection *)v4 initWithSelectionType:v5];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ICChecklistsFilterTypeSelection *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ICChecklistsFilterTypeSelection *)self isEqualToICChecklistsFilterTypeSelection:v5];

  return v6;
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (!result)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[ICChecklistsFilterTypeSelection selectionType](self, "selectionType"));
    uint64_t v5 = [v4 hash];
    self->_hash = ICHashWithHashKeys(v5, v6, v7, v8, v9, v10, v11, v12, 0);

    return self->_hash;
  }
  return result;
}

- (int64_t)filterType
{
  return 5;
}

- (id)filterName
{
  return (id)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Checklists" value:@"Checklists" table:0 allowSiri:1];
}

- (id)rawFilterValue
{
  unint64_t v2 = [(ICChecklistsFilterTypeSelection *)self selectionType];
  if (v2 - 1 > 2) {
    return @"Any";
  }
  else {
    return off_1E64A5BF0[v2 - 1];
  }
}

- (BOOL)isEqualToICChecklistsFilterTypeSelection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICChecklistsFilterTypeSelection *)self selectionType];
  uint64_t v6 = [v4 selectionType];

  return v5 == v6;
}

- (unint64_t)selectionType
{
  return self->_selectionType;
}

@end