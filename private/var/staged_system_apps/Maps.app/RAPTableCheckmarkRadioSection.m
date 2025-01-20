@interface RAPTableCheckmarkRadioSection
- (Class)defaultCellClass;
- (NSArray)values;
- (RAPTableCheckmarkRadioSection)initWithOwner:(id)a3 configureForValue:(id)a4 selection:(id)a5;
- (RAPTableCheckmarkRadioSection)initWithOwner:(id)a3 initialValues:(id)a4 initialSelectedValue:(id)a5 configureForValue:(id)a6 selection:(id)a7;
- (id)cellForRowAtIndex:(int64_t)a3;
- (id)dequeueCellForValue:(id)a3;
- (id)selectedValue;
- (int64_t)rowsCount;
- (void)configureCell:(id)a3 forValue:(id)a4;
- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4;
- (void)registerReuseIdentifiersForCells;
- (void)selectedValueDidChange;
- (void)setSelectedValue:(id)a3;
- (void)setValues:(id)a3;
@end

@implementation RAPTableCheckmarkRadioSection

- (RAPTableCheckmarkRadioSection)initWithOwner:(id)a3 configureForValue:(id)a4 selection:(id)a5
{
  return [(RAPTableCheckmarkRadioSection *)self initWithOwner:a3 initialValues:&__NSArray0__struct initialSelectedValue:0 configureForValue:a4 selection:a5];
}

- (RAPTableCheckmarkRadioSection)initWithOwner:(id)a3 initialValues:(id)a4 initialSelectedValue:(id)a5 configureForValue:(id)a6 selection:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)RAPTableCheckmarkRadioSection;
  v17 = [(RAPTablePartSection *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak(&v17->_owner, v12);
    [(RAPTableCheckmarkRadioSection *)v18 setValues:v13];
    id v19 = [v15 copy];
    id configure = v18->_configure;
    v18->_id configure = v19;

    id v21 = [v16 copy];
    id selection = v18->_selection;
    v18->_id selection = v21;

    [(RAPTableCheckmarkRadioSection *)v18 setSelectedValue:v14];
  }

  return v18;
}

- (Class)defaultCellClass
{
  return 0;
}

- (void)selectedValueDidChange
{
  if (self->_selection)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_owner);
    if (WeakRetained)
    {
      id v4 = WeakRetained;
      (*((void (**)(void))self->_selection + 2))();
      id WeakRetained = v4;
    }
  }
}

- (void)registerReuseIdentifiersForCells
{
  v6.receiver = self;
  v6.super_class = (Class)RAPTableCheckmarkRadioSection;
  [(RAPTablePartSection *)&v6 registerReuseIdentifiersForCells];
  v3 = [(RAPTableCheckmarkRadioSection *)self defaultCellClass];
  if (v3)
  {
    id v4 = v3;
    v5 = NSStringFromClass(v3);
    [(RAPTablePartSection *)self registerClass:v4 forNamespacedReuseIdentifier:v5];
  }
}

- (id)dequeueCellForValue:(id)a3
{
  id v4 = a3;
  v5 = [(RAPTableCheckmarkRadioSection *)self defaultCellClass];
  objc_super v6 = +[RAPCheckmarkTableViewCell reuseIdentifier];
  if (v5)
  {
    uint64_t v7 = NSStringFromClass(v5);

    v8 = [(RAPTablePartSection *)self dequeueCellWithNamespacedReuseIdentifier:v7];
    objc_super v6 = (void *)v7;
  }
  else
  {
    v8 = [[RAPCheckmarkTableViewCell alloc] initWithStyle:0 reuseIdentifier:v6];
  }
  [(RAPCheckmarkTableViewCell *)v8 setSelectionStyle:0];
  [(RAPTableCheckmarkRadioSection *)self configureCell:v8 forValue:v4];

  return v8;
}

- (void)configureCell:(id)a3 forValue:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (self->_configure)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_owner);
    if (WeakRetained) {
      (*((void (**)(void))self->_configure + 2))();
    }
  }
}

- (void)setValues:(id)a3
{
  v10 = (NSArray *)a3;
  if (self->_values != v10)
  {
    id v4 = [(RAPTableCheckmarkRadioSection *)self selectedValue];
    if (v4)
    {
      unsigned __int8 v5 = [(NSArray *)v10 containsObject:v4];
      id v6 = (NSArray *)[(NSArray *)v10 copy];
      values = self->_values;
      self->_values = v6;

      if (v5) {
        goto LABEL_7;
      }
    }
    else
    {
      id v8 = (NSArray *)[(NSArray *)v10 copy];
      v9 = self->_values;
      self->_values = v8;
    }
    [(RAPTableCheckmarkRadioSection *)self setSelectedValue:0];
LABEL_7:
    [(RAPTablePartSection *)self didChange];
  }
}

- (void)setSelectedValue:(id)a3
{
  id v27 = a3;
  if (self->_selectedValue != v27)
  {
    objc_storeStrong(&self->_selectedValue, a3);
    id v5 = [(RAPTablePartSection *)self sectionIndex];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v6 = [(RAPTablePartSection *)self tableView];
    uint64_t v7 = [v6 indexPathsForVisibleRows];

    id v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v30;
      p_vtable = MapsUIImageGEOFeatureSpec.vtable;
      do
      {
        id v12 = 0;
        id v28 = v9;
        do
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v12);
          if (objc_msgSend(v13, "section", v27) == v5)
          {
            id v14 = [(RAPTablePartSection *)self tableView];
            id v15 = [v14 cellForRowAtIndexPath:v13];

            id v16 = [v13 row];
            v17 = [(RAPTableCheckmarkRadioSection *)self values];
            if (v16 >= [v17 count])
            {
              BOOL v25 = 0;
            }
            else
            {
              [(RAPTableCheckmarkRadioSection *)self values];
              uint64_t v18 = v10;
              id v19 = self;
              id v20 = v5;
              id v21 = v7;
              v23 = v22 = p_vtable;
              id v24 = [v23 objectAtIndexedSubscript:v16];
              BOOL v25 = v24 == v27;

              p_vtable = v22;
              uint64_t v7 = v21;
              id v5 = v20;
              self = v19;
              uint64_t v10 = v18;
              id v9 = v28;
            }

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v15 setChecked:v25];
            }
            else
            {
              if (v25) {
                uint64_t v26 = 3;
              }
              else {
                uint64_t v26 = 0;
              }
              [v15 setAccessoryType:v26];
            }
          }
          id v12 = (char *)v12 + 1;
        }
        while (v9 != v12);
        id v9 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v9);
    }

    [(RAPTableCheckmarkRadioSection *)self selectedValueDidChange];
  }
}

- (int64_t)rowsCount
{
  return [(NSArray *)self->_values count];
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  id v5 = [(RAPTableCheckmarkRadioSection *)self values];
  id v6 = [v5 objectAtIndexedSubscript:a3];

  uint64_t v7 = [(RAPTableCheckmarkRadioSection *)self dequeueCellForValue:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    id v9 = [(RAPTableCheckmarkRadioSection *)self selectedValue];
    [v8 setChecked:v9 == v6];
  }
  else
  {
    uint64_t v10 = [(RAPTableCheckmarkRadioSection *)self selectedValue];

    if (v10 == v6) {
      uint64_t v11 = 3;
    }
    else {
      uint64_t v11 = 0;
    }
    [v7 setAccessoryType:v11];
  }

  return v7;
}

- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(RAPTablePartSection *)self tableView];
  [v7 deselectRowAtIndexPath:v6 animated:1];

  id v8 = [(RAPTableCheckmarkRadioSection *)self values];
  id v9 = [v8 objectAtIndexedSubscript:a3];

  [(RAPTableCheckmarkRadioSection *)self setSelectedValue:v9];
}

- (NSArray)values
{
  return self->_values;
}

- (id)selectedValue
{
  return self->_selectedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectedValue, 0);
  objc_storeStrong(&self->_selection, 0);
  objc_storeStrong(&self->_configure, 0);
  objc_destroyWeak(&self->_owner);

  objc_storeStrong((id *)&self->_values, 0);
}

@end