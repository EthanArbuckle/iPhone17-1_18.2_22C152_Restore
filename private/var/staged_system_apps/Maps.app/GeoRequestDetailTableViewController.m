@interface GeoRequestDetailTableViewController
- ($9D029EC4D0C6D751016B053EE09A76E2)typeForSection:(int64_t)a3;
- (BOOL)isValidSection:(int64_t)a3;
- (GEORequestCounterInfo)counterInfo;
- (GeoRequestDetailTableViewController)initWithGEORequestCounterInfo:(id)a3;
- (NSArray)requestTypes;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setCounterInfo:(id)a3;
- (void)setRequestTypes:(id)a3;
@end

@implementation GeoRequestDetailTableViewController

- (GeoRequestDetailTableViewController)initWithGEORequestCounterInfo:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GeoRequestDetailTableViewController;
  v6 = [(GeoRequestDetailTableViewController *)&v11 initWithStyle:1];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_counterInfo, a3);
    uint64_t v8 = [v5 requestTypes];
    requestTypes = v7->_requestTypes;
    v7->_requestTypes = (NSArray *)v8;
  }
  return v7;
}

- (BOOL)isValidSection:(int64_t)a3
{
  return (a3 & 0x8000000000000000) == 0 && [(NSArray *)self->_requestTypes count] > a3;
}

- ($9D029EC4D0C6D751016B053EE09A76E2)typeForSection:(int64_t)a3
{
  v3 = [(NSArray *)self->_requestTypes objectAtIndexedSubscript:a3];
  unsigned int v4 = [v3 intValue];
  unsigned int v5 = (v4 >> 8) & 0x7F;
  if (v5 > 0xB)
  {
    unsigned int v9 = 0;
    unint64_t v10 = 0;
  }
  else
  {
    int v6 = 1 << v5;
    if ((v6 & 0xC05) != 0) {
      unsigned int v7 = v4;
    }
    else {
      unsigned int v7 = 0;
    }
    BOOL v8 = (v6 & 0xAA) == 0;
    if ((v6 & 0xAA) != 0) {
      unsigned int v9 = v4 & 0x7F00;
    }
    else {
      unsigned int v9 = v7;
    }
    if (v8) {
      unint64_t v10 = 0;
    }
    else {
      unint64_t v10 = (unint64_t)v4 << 32;
    }
  }
  $9D029EC4D0C6D751016B053EE09A76E2 v11 = ($9D029EC4D0C6D751016B053EE09A76E2)(v10 | v9);

  return v11;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_requestTypes count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (![(GeoRequestDetailTableViewController *)self isValidSection:a4]) {
    return 0;
  }
  int v6 = [(GeoRequestDetailTableViewController *)self counterInfo];
  unsigned int v7 = [v6 nonZeroResultTypesForType:[self typeForSection:a4]];
  id v8 = [v7 count];

  return (int64_t)v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ([(GeoRequestDetailTableViewController *)self isValidSection:a4])
  {
    $9D029EC4D0C6D751016B053EE09A76E2 v6 = [(GeoRequestDetailTableViewController *)self typeForSection:a4];
    unsigned int v7 = GEODataRequestKindAsString();
    id v8 = [(GeoRequestDetailTableViewController *)self counterInfo];
    unsigned int v9 = +[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", [v8 xmitBytesForType:v6], 3);

    unint64_t v10 = [(GeoRequestDetailTableViewController *)self counterInfo];
    $9D029EC4D0C6D751016B053EE09A76E2 v11 = +[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", [v10 recvBytesForType:v6], 3);
  }
  else
  {
    unsigned int v7 = 0;
    unsigned int v9 = 0;
    $9D029EC4D0C6D751016B053EE09A76E2 v11 = 0;
  }
  v12 = +[NSString stringWithFormat:@"%@\nxmit:%@ / recv:%@", v7, v9, v11];

  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
  if (!v7) {
    id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:1 reuseIdentifier:@"reuseIdentifier"];
  }
  [v7 setSelectionStyle:0];
  if (-[GeoRequestDetailTableViewController isValidSection:](self, "isValidSection:", [v6 section]))
  {
    $9D029EC4D0C6D751016B053EE09A76E2 v8 = -[GeoRequestDetailTableViewController typeForSection:](self, "typeForSection:", [v6 section]);
    unsigned int v9 = [(GeoRequestDetailTableViewController *)self counterInfo];
    unint64_t v10 = [v9 nonZeroResultTypesForType:v8];
    $9D029EC4D0C6D751016B053EE09A76E2 v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    unsigned __int8 v12 = [v11 unsignedIntegerValue];

    v13 = GEOStringForRequestCounterInfoResult();
    v14 = [(GeoRequestDetailTableViewController *)self counterInfo];
    id v15 = [v14 numberOfRequestsForType:v8 result:v12];
  }
  else
  {
    v13 = 0;
    id v15 = 0;
  }
  v16 = [v7 textLabel];
  [v16 setText:v13];

  v17 = +[NSString stringWithFormat:@"%lu", v15];
  v18 = [v7 detailTextLabel];
  [v18 setText:v17];

  return v7;
}

- (GEORequestCounterInfo)counterInfo
{
  return self->_counterInfo;
}

- (void)setCounterInfo:(id)a3
{
}

- (NSArray)requestTypes
{
  return self->_requestTypes;
}

- (void)setRequestTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestTypes, 0);

  objc_storeStrong((id *)&self->_counterInfo, 0);
}

@end