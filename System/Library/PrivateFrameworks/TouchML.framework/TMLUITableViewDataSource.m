@interface TMLUITableViewDataSource
- (NSArray)sections;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setSections:(id)a3;
@end

@implementation TMLUITableViewDataSource

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return objc_msgSend_count(self->_sections, a2, v3, a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = objc_msgSend_objectAtIndexedSubscript_(self->_sections, a2, v4, a4);
  int64_t v8 = objc_msgSend_numberOfRows(v5, v6, v7);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  sections = self->_sections;
  id v5 = a4;
  uint64_t v8 = objc_msgSend_section(v5, v6, v7);
  v11 = objc_msgSend_objectAtIndexedSubscript_(sections, v9, v10, v8);
  uint64_t v14 = objc_msgSend_row(v5, v12, v13);

  v17 = objc_msgSend_cellForRow_(v11, v15, v16, v14);

  return v17;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = objc_msgSend_objectAtIndexedSubscript_(self->_sections, a2, v4, a4);
  uint64_t v8 = objc_msgSend_header(v5, v6, v7);

  return v8;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v5 = objc_msgSend_objectAtIndexedSubscript_(self->_sections, a2, v4, a4);
  uint64_t v8 = objc_msgSend_footer(v5, v6, v7);

  return v8;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (void).cxx_destruct
{
}

@end