@interface UIKBAutoFillTestTableViewDataSource
- (UIKBAutoFillTestTableViewDataSource)init;
- (UIKBAutoFillTestTableViewDataSource)initWithCoder:(id)a3;
- (double)heightForFooterInSection:(int64_t)a3;
- (double)heightForHeaderInSection:(int64_t)a3;
- (double)heightForRowAtIndexPath:(id)a3;
- (id)cellForRowAtIndexPath:(id)a3;
- (id)titleForFooterInSection:(int64_t)a3;
- (id)titleForHeaderInSection:(int64_t)a3;
- (id)viewForFooterInSection:(int64_t)a3;
- (id)viewForHeaderInSection:(int64_t)a3;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)encodeWithCoder:(id)a3;
- (void)setCellData:(id)a3 forRowAtIndexPath:(id)a4;
- (void)setFooterData:(id)a3 forSection:(int64_t)a4;
- (void)setHeaderData:(id)a3 forSection:(int64_t)a4;
- (void)setNumberOfRows:(int64_t)a3 forSection:(int64_t)a4;
@end

@implementation UIKBAutoFillTestTableViewDataSource

- (UIKBAutoFillTestTableViewDataSource)init
{
  v13.receiver = self;
  v13.super_class = (Class)UIKBAutoFillTestTableViewDataSource;
  v2 = [(UIKBAutoFillTestTableViewDataSource *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    rowCountMap = v2->_rowCountMap;
    v2->_rowCountMap = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    visibleCellDataMap = v2->_visibleCellDataMap;
    v2->_visibleCellDataMap = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    headerDataMap = v2->_headerDataMap;
    v2->_headerDataMap = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    footerDataMap = v2->_footerDataMap;
    v2->_footerDataMap = (NSMutableDictionary *)v9;

    v11 = v2;
  }

  return v2;
}

- (UIKBAutoFillTestTableViewDataSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UIKBAutoFillTestTableViewDataSource;
  uint64_t v5 = [(UIKBAutoFillTestTableViewDataSource *)&v20 init];
  if (v5)
  {
    v6 = [v4 decodeObjectForKey:@"rowCountMap"];
    uint64_t v7 = [v6 mutableCopy];
    rowCountMap = v5->_rowCountMap;
    v5->_rowCountMap = (NSMutableDictionary *)v7;

    uint64_t v9 = [v4 decodeObjectForKey:@"visibleCellDataMap"];
    uint64_t v10 = [v9 mutableCopy];
    visibleCellDataMap = v5->_visibleCellDataMap;
    v5->_visibleCellDataMap = (NSMutableDictionary *)v10;

    v12 = [v4 decodeObjectForKey:@"headerDataMap"];
    uint64_t v13 = [v12 mutableCopy];
    headerDataMap = v5->_headerDataMap;
    v5->_headerDataMap = (NSMutableDictionary *)v13;

    v15 = [v4 decodeObjectForKey:@"footerDataMap"];
    uint64_t v16 = [v15 mutableCopy];
    footerDataMap = v5->_footerDataMap;
    v5->_footerDataMap = (NSMutableDictionary *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  rowCountMap = self->_rowCountMap;
  id v5 = a3;
  [v5 encodeObject:rowCountMap forKey:@"rowCountMap"];
  [v5 encodeObject:self->_visibleCellDataMap forKey:@"visibleCellDataMap"];
  [v5 encodeObject:self->_headerDataMap forKey:@"headerDataMap"];
  [v5 encodeObject:self->_footerDataMap forKey:@"footerDataMap"];
}

- (void)setNumberOfRows:(int64_t)a3 forSection:(int64_t)a4
{
  id v8 = [NSNumber numberWithInteger:a3];
  rowCountMap = self->_rowCountMap;
  uint64_t v7 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)rowCountMap setObject:v8 forKeyedSubscript:v7];
}

- (void)setCellData:(id)a3 forRowAtIndexPath:(id)a4
{
}

- (void)setHeaderData:(id)a3 forSection:(int64_t)a4
{
  headerDataMap = self->_headerDataMap;
  v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithInteger:a4];
  [(NSMutableDictionary *)headerDataMap setObject:v7 forKeyedSubscript:v8];
}

- (void)setFooterData:(id)a3 forSection:(int64_t)a4
{
  footerDataMap = self->_footerDataMap;
  v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithInteger:a4];
  [(NSMutableDictionary *)footerDataMap setObject:v7 forKeyedSubscript:v8];
}

- (int64_t)numberOfSections
{
  return [(NSMutableDictionary *)self->_rowCountMap count];
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  rowCountMap = self->_rowCountMap;
  id v4 = [NSNumber numberWithInteger:a3];
  id v5 = [(NSMutableDictionary *)rowCountMap objectForKeyedSubscript:v4];
  int64_t v6 = [v5 integerValue];

  return v6;
}

- (id)cellForRowAtIndexPath:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_visibleCellDataMap objectForKeyedSubscript:a3];
  id v4 = [v3 cell];

  if (!v4)
  {
    id v5 = [UITableViewCell alloc];
    int64_t v6 = NSString;
    id v7 = [MEMORY[0x1E4F29128] UUID];
    id v8 = [v7 UUIDString];
    uint64_t v9 = [v6 stringWithFormat:@"%@", v8];
    id v4 = [(UITableViewCell *)v5 initWithStyle:0 reuseIdentifier:v9];
  }
  uint64_t v10 = v4;

  return v10;
}

- (double)heightForRowAtIndexPath:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_visibleCellDataMap objectForKeyedSubscript:a3];
  [v3 height];
  if (v4 == 0.0) {
    double v5 = 44.0;
  }
  else {
    double v5 = v4;
  }

  return v5;
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  headerDataMap = self->_headerDataMap;
  double v4 = [NSNumber numberWithInteger:a3];
  double v5 = [(NSMutableDictionary *)headerDataMap objectForKeyedSubscript:v4];

  int64_t v6 = [v5 title];

  return v6;
}

- (id)titleForFooterInSection:(int64_t)a3
{
  footerDataMap = self->_footerDataMap;
  double v4 = [NSNumber numberWithInteger:a3];
  double v5 = [(NSMutableDictionary *)footerDataMap objectForKeyedSubscript:v4];

  int64_t v6 = [v5 title];

  return v6;
}

- (double)heightForHeaderInSection:(int64_t)a3
{
  headerDataMap = self->_headerDataMap;
  double v4 = [NSNumber numberWithInteger:a3];
  double v5 = [(NSMutableDictionary *)headerDataMap objectForKeyedSubscript:v4];

  [v5 height];
  double v6 = -1.0;
  if (v7 > 0.0)
  {
    [v5 height];
    double v6 = v8;
  }

  return v6;
}

- (double)heightForFooterInSection:(int64_t)a3
{
  footerDataMap = self->_footerDataMap;
  double v4 = [NSNumber numberWithInteger:a3];
  double v5 = [(NSMutableDictionary *)footerDataMap objectForKeyedSubscript:v4];

  [v5 height];
  double v6 = -1.0;
  if (v7 > 0.0)
  {
    [v5 height];
    double v6 = v8;
  }

  return v6;
}

- (id)viewForHeaderInSection:(int64_t)a3
{
  headerDataMap = self->_headerDataMap;
  double v4 = [NSNumber numberWithInteger:a3];
  double v5 = [(NSMutableDictionary *)headerDataMap objectForKeyedSubscript:v4];

  double v6 = [v5 headerFooterView];

  return v6;
}

- (id)viewForFooterInSection:(int64_t)a3
{
  footerDataMap = self->_footerDataMap;
  double v4 = [NSNumber numberWithInteger:a3];
  double v5 = [(NSMutableDictionary *)footerDataMap objectForKeyedSubscript:v4];

  double v6 = [v5 headerFooterView];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerDataMap, 0);
  objc_storeStrong((id *)&self->_headerDataMap, 0);
  objc_storeStrong((id *)&self->_visibleCellDataMap, 0);
  objc_storeStrong((id *)&self->_rowCountMap, 0);
}

@end