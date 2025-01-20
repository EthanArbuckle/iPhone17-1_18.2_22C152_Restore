@interface REMSmartListSectionContextChangeItem
- (BOOL)shouldUpdateSectionsOrdering;
- (NSArray)unsavedSectionIDsOrdering;
- (REMMemberships)unsavedMembershipsOfRemindersInSections;
- (REMSmartListChangeItem)smartListChangeItem;
- (REMSmartListSectionContextChangeItem)initWithSmartListChangeItem:(id)a3;
- (void)setShouldUpdateSectionsOrdering:(BOOL)a3;
- (void)setSmartListChangeItem:(id)a3;
- (void)setUnsavedMembershipsOfRemindersInSections:(id)a3;
- (void)setUnsavedSectionIDsOrdering:(id)a3;
- (void)undeleteSectionWithID:(id)a3;
@end

@implementation REMSmartListSectionContextChangeItem

- (REMSmartListSectionContextChangeItem)initWithSmartListChangeItem:(id)a3
{
  id v5 = a3;
  if (!v5) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "smartListChangeItem");
  }
  v9.receiver = self;
  v9.super_class = (Class)REMSmartListSectionContextChangeItem;
  v6 = [(REMSmartListSectionContextChangeItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_smartListChangeItem, a3);
  }

  return v7;
}

- (BOOL)shouldUpdateSectionsOrdering
{
  v2 = [(REMSmartListSectionContextChangeItem *)self smartListChangeItem];
  char v3 = [v2 shouldUpdateSectionsOrdering];

  return v3;
}

- (void)setShouldUpdateSectionsOrdering:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMSmartListSectionContextChangeItem *)self smartListChangeItem];
  [v4 setShouldUpdateSectionsOrdering:v3];
}

- (NSArray)unsavedSectionIDsOrdering
{
  v2 = [(REMSmartListSectionContextChangeItem *)self smartListChangeItem];
  BOOL v3 = [v2 unsavedSectionIDsOrdering];

  return (NSArray *)v3;
}

- (void)setUnsavedSectionIDsOrdering:(id)a3
{
  id v4 = a3;
  id v5 = [(REMSmartListSectionContextChangeItem *)self smartListChangeItem];
  [v5 setUnsavedSectionIDsOrdering:v4];
}

- (REMMemberships)unsavedMembershipsOfRemindersInSections
{
  v2 = [(REMSmartListSectionContextChangeItem *)self smartListChangeItem];
  BOOL v3 = [v2 unsavedMembershipsOfRemindersInSections];

  return (REMMemberships *)v3;
}

- (void)setUnsavedMembershipsOfRemindersInSections:(id)a3
{
  id v4 = a3;
  id v5 = [(REMSmartListSectionContextChangeItem *)self smartListChangeItem];
  [v5 setUnsavedMembershipsOfRemindersInSections:v4];
}

- (void)undeleteSectionWithID:(id)a3
{
  id v8 = a3;
  if (!v8) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "sectionID");
  }
  id v4 = [(REMSmartListSectionContextChangeItem *)self smartListChangeItem];
  id v5 = [v4 sectionIDsToUndelete];
  v6 = [v5 setByAddingObject:v8];
  v7 = [(REMSmartListSectionContextChangeItem *)self smartListChangeItem];
  [v7 setSectionIDsToUndelete:v6];
}

- (REMSmartListChangeItem)smartListChangeItem
{
  return self->_smartListChangeItem;
}

- (void)setSmartListChangeItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end