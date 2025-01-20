@interface RAPDisclosureIndicatorSection
- (NSArray)values;
- (RAPDisclosureIndicatorSection)initWithOwner:(id)a3 initialValues:(id)a4 configureForValue:(id)a5 selection:(id)a6;
- (id)cellForRowAtIndex:(int64_t)a3;
- (int64_t)rowsCount;
- (void)configureCell:(id)a3 forValue:(id)a4;
- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4;
- (void)selected:(id)a3;
- (void)setValues:(id)a3;
@end

@implementation RAPDisclosureIndicatorSection

- (RAPDisclosureIndicatorSection)initWithOwner:(id)a3 initialValues:(id)a4 configureForValue:(id)a5 selection:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)RAPDisclosureIndicatorSection;
  v14 = [(RAPTablePartSection *)&v23 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak(&v14->_owner, v10);
    v16 = (NSArray *)[v11 copy];
    values = v15->_values;
    v15->_values = v16;

    id v18 = [v12 copy];
    id configure = v15->_configure;
    v15->_id configure = v18;

    id v20 = [v13 copy];
    id selection = v15->_selection;
    v15->_id selection = v20;
  }
  return v15;
}

- (void)setValues:(id)a3
{
  if (self->_values != a3)
  {
    v4 = (NSArray *)[a3 copy];
    values = self->_values;
    self->_values = v4;

    [(RAPTablePartSection *)self didChange];
  }
}

- (void)selected:(id)a3
{
  id v8 = a3;
  if (self->_selection)
  {
    p_owner = &self->_owner;
    id WeakRetained = objc_loadWeakRetained(&self->_owner);

    if (WeakRetained)
    {
      id selection = (void (**)(id, id, id))self->_selection;
      id v7 = objc_loadWeakRetained(p_owner);
      selection[2](selection, v7, v8);
    }
  }
}

- (int64_t)rowsCount
{
  return [(NSArray *)self->_values count];
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  v5 = [(RAPTablePartSection *)self dequeueDefaultSingleLineTableViewCell];
  [v5 setAccessoryType:1];
  v6 = [(RAPDisclosureIndicatorSection *)self values];
  id v7 = [v6 objectAtIndexedSubscript:a3];
  [(RAPDisclosureIndicatorSection *)self configureCell:v5 forValue:v7];

  return v5;
}

- (void)configureCell:(id)a3 forValue:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (self->_configure)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_owner);

    if (WeakRetained)
    {
      id configure = (void (**)(id, RAPDisclosureIndicatorSection *, id, id, id))self->_configure;
      id v9 = objc_loadWeakRetained(&self->_owner);
      configure[2](configure, self, v9, v10, v6);
    }
  }
}

- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [(RAPTablePartSection *)self tableView];
  [v7 deselectRowAtIndexPath:v6 animated:1];

  id v9 = [(RAPDisclosureIndicatorSection *)self values];
  id v8 = [v9 objectAtIndexedSubscript:a3];
  [(RAPDisclosureIndicatorSection *)self selected:v8];
}

- (NSArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong(&self->_selection, 0);
  objc_storeStrong(&self->_configure, 0);

  objc_destroyWeak(&self->_owner);
}

@end