@interface VUIDebugMetricsArrayViewController
- (NSArray)array;
- (NSDictionary)cachedKeysOrder;
- (VUIDebugMetricsArrayViewController)init;
- (id)object;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)generateCachedKeys;
- (void)setArray:(id)a3;
- (void)setCachedKeysOrder:(id)a3;
- (void)setObject:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation VUIDebugMetricsArrayViewController

- (VUIDebugMetricsArrayViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUIDebugMetricsArrayViewController;
  return [(VUIDebugMetricsArrayViewController *)&v3 initWithStyle:1];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)VUIDebugMetricsArrayViewController;
  [(VUIDebugMetricsArrayViewController *)&v5 viewDidLoad];
  objc_super v3 = [(VUIDebugMetricsArrayViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"cell"];

  v4 = [(VUIDebugMetricsArrayViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"detail"];
}

- (void)setArray:(id)a3
{
  objc_storeStrong((id *)&self->_array, a3);
  [(VUIDebugMetricsArrayViewController *)self generateCachedKeys];
  id v4 = [(VUIDebugMetricsArrayViewController *)self tableView];
  [v4 reloadData];
}

- (void)setObject:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v8[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:v8 count:1];
  array = self->_array;
  self->_array = v6;
}

- (id)object
{
  if ([(NSArray *)self->_array count] == 1)
  {
    objc_super v3 = [(NSArray *)self->_array objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
  }
  objc_super v3 = 0;
LABEL_5:
  return v3;
}

- (void)generateCachedKeys
{
  id v10 = (id)objc_opt_new();
  NSUInteger v3 = [(NSArray *)self->_array count];
  if (v3)
  {
    NSUInteger v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      v6 = [(NSArray *)self->_array objectAtIndexedSubscript:i];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [v6 allKeys];
        v8 = [v7 sortedArrayUsingSelector:sel_compare_];

        v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:i];
        [v10 setObject:v8 forKeyedSubscript:v9];
      }
    }
  }
  [(VUIDebugMetricsArrayViewController *)self setCachedKeysOrder:v10];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  NSUInteger v4 = [(NSArray *)self->_array objectAtIndexedSubscript:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v5 = [(NSArray *)self->_array count];
  }
  else {
    int64_t v5 = 1;
  }

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5 = [(NSArray *)self->_array objectAtIndexedSubscript:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 allKeys];
    int64_t v7 = [v6 count];
  }
  else
  {
    int64_t v7 = [(NSArray *)self->_array count];
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[NSArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", [v7 section]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(VUIDebugMetricsArrayViewController *)self cachedKeysOrder];
    id v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v7, "section"));
    v11 = [v9 objectForKeyedSubscript:v10];

    v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v13 = [v8 objectForKeyedSubscript:v12];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v14 = [v6 dequeueReusableCellWithIdentifier:@"cell" forIndexPath:v7];
      v15 = [NSString stringWithFormat:@"%@", v12];
      v16 = [v14 textLabel];
      [v16 setText:v15];

      [v14 setAccessoryType:1];
    }
    else
    {
      v14 = [v6 dequeueReusableCellWithIdentifier:@"detail" forIndexPath:v7];
      v21 = [NSString stringWithFormat:@"%@", v12];
      v22 = [v14 textLabel];
      [v22 setText:v21];

      v23 = [NSString stringWithFormat:@"%@", v13];
      v24 = [v14 detailTextLabel];
      [v24 setText:v23];
    }
  }
  else
  {
    v14 = [v6 dequeueReusableCellWithIdentifier:@"cell" forIndexPath:v7];
    v17 = NSString;
    v18 = -[NSArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", [v7 row]);
    v19 = [v17 stringWithFormat:@"%@", v18];
    v20 = [v14 textLabel];
    [v20 setText:v19];

    [v14 setAccessoryType:0];
  }

  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a4;
  int64_t v5 = -[NSArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", [v13 section]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(VUIDebugMetricsArrayViewController *)self cachedKeysOrder];
    id v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v13, "section"));
    v8 = [v6 objectForKeyedSubscript:v7];
    v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v13, "row"));

    id v10 = [v5 objectForKeyedSubscript:v9];
    v11 = objc_alloc_init(VUIDebugMetricsArrayViewController);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(VUIDebugMetricsArrayViewController *)v11 setArray:v10];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_7:

        goto LABEL_8;
      }
      [(VUIDebugMetricsArrayViewController *)v11 setObject:v10];
    }
    v12 = [(VUIDebugMetricsArrayViewController *)self navigationController];
    [v12 pushViewController:v11 animated:1];

    goto LABEL_7;
  }
LABEL_8:
}

- (NSArray)array
{
  return self->_array;
}

- (NSDictionary)cachedKeysOrder
{
  return self->_cachedKeysOrder;
}

- (void)setCachedKeysOrder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedKeysOrder, 0);
  objc_storeStrong((id *)&self->_array, 0);
}

@end