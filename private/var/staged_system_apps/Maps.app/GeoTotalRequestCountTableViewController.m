@interface GeoTotalRequestCountTableViewController
- (GeoTotalRequestCountTableViewController)initWithDictionary:(id)a3;
- (NSDictionary)info;
- (NSDictionary)sectionDict;
- (NSOrderedSet)orderedSectionKeys;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)getRequestCountForType:(id)a3 andApp:(id)a4;
- (void)dataPreProcessing;
- (void)didReceiveMemoryWarning;
- (void)setInfo:(id)a3;
- (void)setOrderedSectionKeys:(id)a3;
- (void)setSectionDict:(id)a3;
- (void)viewDidLoad;
@end

@implementation GeoTotalRequestCountTableViewController

- (GeoTotalRequestCountTableViewController)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GeoTotalRequestCountTableViewController;
  v5 = [(GeoTotalRequestCountTableViewController *)&v9 initWithStyle:1];
  if (v5)
  {
    v6 = (NSDictionary *)[v4 copy];
    info = v5->_info;
    v5->_info = v6;

    [(GeoTotalRequestCountTableViewController *)v5 dataPreProcessing];
  }

  return v5;
}

- (void)dataPreProcessing
{
  v3 = +[NSMutableOrderedSet orderedSet];
  id v4 = +[NSMutableDictionary dictionary];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(GeoTotalRequestCountTableViewController *)self info];
  id v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v8);
        v10 = [(GeoTotalRequestCountTableViewController *)self info];
        v11 = [v10 objectForKeyedSubscript:v9];

        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10072CF70;
        v18[3] = &unk_1012F6BA0;
        v18[4] = self;
        v18[5] = v9;
        id v19 = v4;
        id v20 = v3;
        id v21 = v11;
        id v12 = v11;
        [v12 enumerateRequestTypes:v18];

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  v13 = (NSDictionary *)[v4 copy];
  sectionDict = self->_sectionDict;
  self->_sectionDict = v13;

  v15 = (NSOrderedSet *)[v3 copy];
  orderedSectionKeys = self->_orderedSectionKeys;
  self->_orderedSectionKeys = v15;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)GeoTotalRequestCountTableViewController;
  [(GeoTotalRequestCountTableViewController *)&v2 viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)GeoTotalRequestCountTableViewController;
  [(GeoTotalRequestCountTableViewController *)&v2 didReceiveMemoryWarning];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(GeoTotalRequestCountTableViewController *)self orderedSectionKeys];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = [(GeoTotalRequestCountTableViewController *)self orderedSectionKeys];
  uint64_t v7 = [v6 objectAtIndexedSubscript:a4];

  v8 = [(GeoTotalRequestCountTableViewController *)self sectionDict];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  v10 = [v9 objectForKeyedSubscript:@"xmitB"];
  v11 = +[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", [v10 unsignedIntegerValue], 3);

  id v12 = [v9 objectForKeyedSubscript:@"recvB"];
  v13 = +[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", [v12 unsignedIntegerValue], 3);

  v14 = +[NSString stringWithFormat:@"%@\n(xmit:%@ / recv:%@)", v7, v11, v13];

  return v14;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = [(GeoTotalRequestCountTableViewController *)self orderedSectionKeys];
  uint64_t v7 = [v6 objectAtIndexedSubscript:a4];

  v8 = [(GeoTotalRequestCountTableViewController *)self sectionDict];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  v10 = [v9 objectForKeyedSubscript:@"apps"];
  id v11 = [v10 count];

  return (int64_t)v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(GeoTotalRequestCountTableViewController *)self orderedSectionKeys];
  uint64_t v9 = [v8 objectAtIndexedSubscript:[v6 section]];

  v10 = [(GeoTotalRequestCountTableViewController *)self sectionDict];
  id v11 = [v10 objectForKeyedSubscript:v9];

  id v12 = [v11 objectForKeyedSubscript:@"apps"];
  id v13 = [v6 row];

  v14 = [v12 objectAtIndexedSubscript:v13];

  id v15 = [v7 dequeueReusableCellWithIdentifier:@"reuseIdentifier"];

  if (!v15) {
    id v15 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:@"reuseIdentifier"];
  }
  [v15 setSelectionStyle:0];
  v16 = [v14 objectForKeyedSubscript:@"name"];
  v17 = [v15 textLabel];
  [v17 setText:v16];

  v18 = [v14 objectForKeyedSubscript:@"count"];
  id v19 = [v14 objectForKeyedSubscript:@"xmitB"];
  id v20 = [v14 objectForKeyedSubscript:@"recvB"];
  id v21 = +[NSString stringWithFormat:@"%@ requests : (xmit:%@ / recv:%@)", v18, v19, v20];
  long long v22 = [v15 detailTextLabel];
  [v22 setText:v21];

  return v15;
}

- (unint64_t)getRequestCountForType:(id)a3 andApp:(id)a4
{
  id v6 = a4;
  id v7 = [(GeoTotalRequestCountTableViewController *)self info];
  v8 = [v7 valueForKey:v6];

  int v9 = 0;
  unint64_t v10 = 0;
  do
  {
    unsigned int v11 = v9;
    v10 += (unint64_t)[v8 numberOfRequestsForType:a3 result:v9++];
  }
  while (v11 < 4);

  return v10;
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (NSDictionary)sectionDict
{
  return self->_sectionDict;
}

- (void)setSectionDict:(id)a3
{
}

- (NSOrderedSet)orderedSectionKeys
{
  return self->_orderedSectionKeys;
}

- (void)setOrderedSectionKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedSectionKeys, 0);
  objc_storeStrong((id *)&self->_sectionDict, 0);

  objc_storeStrong((id *)&self->_info, 0);
}

@end