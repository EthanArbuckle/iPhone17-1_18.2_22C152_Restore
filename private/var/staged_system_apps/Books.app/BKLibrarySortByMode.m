@interface BKLibrarySortByMode
- (BOOL)allowsReordering;
- (BOOL)disabled;
- (NSArray)sortDescriptors;
- (NSPredicate)allowExplicitPredicate;
- (NSPredicate)hideExplicitPredicate;
- (NSString)entityName;
- (NSString)label;
- (NSString)sectionKeyPath;
- (NSString)sectionKeyPathForDisplay;
- (NSString)title;
- (id)description;
- (id)predicate;
- (unint64_t)sortMode;
- (void)setAllowExplicitPredicate:(id)a3;
- (void)setAllowsReordering:(BOOL)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setEntityName:(id)a3;
- (void)setHideExplicitPredicate:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSectionKeyPath:(id)a3;
- (void)setSectionKeyPathForDisplay:(id)a3;
- (void)setSortDescriptors:(id)a3;
- (void)setSortMode:(unint64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation BKLibrarySortByMode

- (id)predicate
{
  v3 = [(BKLibrarySortByMode *)self allowExplicitPredicate];
  v4 = +[BKLibraryManager defaultManager];
  unsigned __int8 v5 = [v4 isExplicitMaterialAllowed];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [(BKLibrarySortByMode *)self hideExplicitPredicate];

    v3 = (void *)v6;
  }

  return v3;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  unsigned __int8 v5 = +[NSString stringWithFormat:@"<%@ %p title=\"%@\" label=\"%@\" sortMode=%tu>", v4, self, self->_title, self->_label, self->_sortMode];

  return v5;
}

- (unint64_t)sortMode
{
  return self->_sortMode;
}

- (void)setSortMode:(unint64_t)a3
{
  self->_sortMode = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSPredicate)allowExplicitPredicate
{
  return self->_allowExplicitPredicate;
}

- (void)setAllowExplicitPredicate:(id)a3
{
}

- (NSPredicate)hideExplicitPredicate
{
  return self->_hideExplicitPredicate;
}

- (void)setHideExplicitPredicate:(id)a3
{
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
}

- (NSString)sectionKeyPath
{
  return self->_sectionKeyPath;
}

- (void)setSectionKeyPath:(id)a3
{
}

- (NSString)sectionKeyPathForDisplay
{
  return self->_sectionKeyPathForDisplay;
}

- (void)setSectionKeyPathForDisplay:(id)a3
{
}

- (NSString)entityName
{
  return self->_entityName;
}

- (void)setEntityName:(id)a3
{
}

- (BOOL)allowsReordering
{
  return self->_allowsReordering;
}

- (void)setAllowsReordering:(BOOL)a3
{
  self->_allowsReordering = a3;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_sectionKeyPathForDisplay, 0);
  objc_storeStrong((id *)&self->_sectionKeyPath, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_hideExplicitPredicate, 0);
  objc_storeStrong((id *)&self->_allowExplicitPredicate, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end