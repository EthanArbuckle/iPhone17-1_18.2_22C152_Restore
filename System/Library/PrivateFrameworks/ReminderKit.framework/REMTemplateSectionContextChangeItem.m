@interface REMTemplateSectionContextChangeItem
- (BOOL)shouldUpdateSectionsOrdering;
- (NSArray)unsavedSectionIDsOrdering;
- (REMMemberships)unsavedMembershipsOfRemindersInSections;
- (REMTemplateChangeItem)templateChangeItem;
- (REMTemplateSectionContextChangeItem)initWithTemplateChangeItem:(id)a3;
- (void)setShouldUpdateSectionsOrdering:(BOOL)a3;
- (void)setTemplateChangeItem:(id)a3;
- (void)setUnsavedMembershipsOfRemindersInSections:(id)a3;
- (void)setUnsavedSectionIDsOrdering:(id)a3;
- (void)undeleteSectionWithID:(id)a3;
@end

@implementation REMTemplateSectionContextChangeItem

- (REMTemplateSectionContextChangeItem)initWithTemplateChangeItem:(id)a3
{
  id v5 = a3;
  if (!v5) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "templateChangeItem");
  }
  v9.receiver = self;
  v9.super_class = (Class)REMTemplateSectionContextChangeItem;
  v6 = [(REMTemplateSectionContextChangeItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_templateChangeItem, a3);
  }

  return v7;
}

- (BOOL)shouldUpdateSectionsOrdering
{
  v2 = [(REMTemplateSectionContextChangeItem *)self templateChangeItem];
  char v3 = [v2 shouldUpdateSectionsOrdering];

  return v3;
}

- (void)setShouldUpdateSectionsOrdering:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMTemplateSectionContextChangeItem *)self templateChangeItem];
  [v4 setShouldUpdateSectionsOrdering:v3];
}

- (NSArray)unsavedSectionIDsOrdering
{
  v2 = [(REMTemplateSectionContextChangeItem *)self templateChangeItem];
  BOOL v3 = [v2 unsavedSectionIDsOrdering];

  return (NSArray *)v3;
}

- (void)setUnsavedSectionIDsOrdering:(id)a3
{
  id v4 = a3;
  id v5 = [(REMTemplateSectionContextChangeItem *)self templateChangeItem];
  [v5 setUnsavedSectionIDsOrdering:v4];
}

- (REMMemberships)unsavedMembershipsOfRemindersInSections
{
  v2 = [(REMTemplateSectionContextChangeItem *)self templateChangeItem];
  BOOL v3 = [v2 unsavedMembershipsOfRemindersInSections];

  return (REMMemberships *)v3;
}

- (void)setUnsavedMembershipsOfRemindersInSections:(id)a3
{
  id v4 = a3;
  id v5 = [(REMTemplateSectionContextChangeItem *)self templateChangeItem];
  [v5 setUnsavedMembershipsOfRemindersInSections:v4];
}

- (void)undeleteSectionWithID:(id)a3
{
  id v8 = a3;
  if (!v8) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "sectionID");
  }
  id v4 = [(REMTemplateSectionContextChangeItem *)self templateChangeItem];
  id v5 = [v4 sectionIDsToUndelete];
  v6 = [v5 setByAddingObject:v8];
  v7 = [(REMTemplateSectionContextChangeItem *)self templateChangeItem];
  [v7 setSectionIDsToUndelete:v6];
}

- (REMTemplateChangeItem)templateChangeItem
{
  return self->_templateChangeItem;
}

- (void)setTemplateChangeItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end