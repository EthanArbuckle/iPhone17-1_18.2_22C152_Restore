@interface VUIDebugMetricsImpressionViewController
- (NSArray)array;
- (VUIDebugMetricsImpressionViewController)init;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)object;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setArray:(id)a3;
- (void)setObject:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation VUIDebugMetricsImpressionViewController

- (VUIDebugMetricsImpressionViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUIDebugMetricsImpressionViewController;
  return [(VUIDebugMetricsImpressionViewController *)&v3 initWithStyle:1];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)VUIDebugMetricsImpressionViewController;
  [(VUIDebugMetricsImpressionViewController *)&v6 viewDidLoad];
  objc_super v3 = [(VUIDebugMetricsImpressionViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"cell"];

  v4 = [(VUIDebugMetricsImpressionViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"VUIDebugImpressionTableViewCellReuseIdentifier"];

  v5 = [(VUIDebugMetricsImpressionViewController *)self tableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"detail"];
}

- (void)setArray:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (NSArray *)objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [VUIDebugMetricsImpression alloc];
          v13 = -[VUIDebugMetricsImpression initWithDictionary:](v12, "initWithDictionary:", v11, (void)v16);
          [(NSArray *)v5 addObject:v13];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  array = self->_array;
  self->_array = v5;

  v15 = [(VUIDebugMetricsImpressionViewController *)self tableView];
  [v15 reloadData];
}

- (void)setObject:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v8[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:v8 count:1];
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

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_array count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_array objectAtIndexedSubscript:a4];
  id v5 = [v4 orderedOtherKeys];
  int64_t v6 = [v5 count];

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[NSArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", [v7 section]);
  if ([v7 row])
  {
    uint64_t v9 = [v8 orderedOtherKeys];
    uint64_t v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "row") - 1);

    uint64_t v11 = [v8 objectForKeyedSubscript:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v12 = [v6 dequeueReusableCellWithIdentifier:@"cell" forIndexPath:v7];
      v13 = [v12 textLabel];
      v14 = [NSString stringWithFormat:@"%@", v10];
      [v13 setText:v14];

      [v12 setAccessoryType:1];
    }
    else
    {
      v12 = [v6 dequeueReusableCellWithIdentifier:@"detail" forIndexPath:v7];
      v25 = [v12 textLabel];
      v26 = [NSString stringWithFormat:@"%@", v10];
      [v25 setText:v26];

      v27 = [v12 detailTextLabel];
      v28 = [NSString stringWithFormat:@"%@", v11];
      [v27 setText:v28];
    }
    [v12 layoutMargins];
    double v30 = v29;
    [v12 layoutMargins];
    objc_msgSend(v12, "setLayoutMargins:", v30, 20.0);
    goto LABEL_9;
  }
  v12 = [v6 dequeueReusableCellWithIdentifier:@"VUIDebugImpressionTableViewCellReuseIdentifier" forIndexPath:v7];
  v15 = [v8 name];
  [v12 setName:v15];

  long long v16 = [v8 type];
  [v12 setType:v16];

  long long v17 = [v8 identifier];
  [v12 setIdStr:v17];

  long long v18 = [v8 idType];
  [v12 setIdType:v18];

  long long v19 = [v8 impressionId];
  [v12 setImpressionId:v19];

  v20 = [v8 impressionIndex];
  [v12 setImpressionIndex:v20];

  uint64_t v21 = [v8 parentId];

  if (v21)
  {
    v22 = [v8 parentId];
    uint64_t v23 = [v22 integerValue];

    uint64_t v10 = [(NSArray *)self->_array objectAtIndexedSubscript:v23 - 1];
    v24 = [v8 parentId];
    [v12 setImpressionParentId:v24];

    uint64_t v11 = [v10 name];
    [v12 setImpressionParentName:v11];
LABEL_9:

    goto LABEL_10;
  }
  [v12 setImpressionParentId:@"none"];
  [v12 setImpressionParentName:&stru_1F3E921E0];
LABEL_10:

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a4;
  uint64_t v5 = [v13 row];
  id v6 = v13;
  if (v5)
  {
    id v7 = -[NSArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", [v13 section]);
    uint64_t v8 = [v7 orderedOtherKeys];
    uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v13, "row") - 1);

    uint64_t v10 = [v7 objectForKeyedSubscript:v9];
    uint64_t v11 = objc_alloc_init(VUIDebugMetricsArrayViewController);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(VUIDebugMetricsArrayViewController *)v11 setArray:v10];
      v12 = [(VUIDebugMetricsImpressionViewController *)self navigationController];
      [v12 pushViewController:v11 animated:1];
    }
    id v6 = v13;
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v4 = objc_msgSend(a4, "row", a3);
  double result = 44.0;
  if (!v4) {
    return 176.0;
  }
  return result;
}

- (NSArray)array
{
  return self->_array;
}

- (void).cxx_destruct
{
}

@end