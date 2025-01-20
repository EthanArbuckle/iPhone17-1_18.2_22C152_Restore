@interface REExportedTable
- (BOOL)sortable;
- (NSArray)header;
- (REExportedTable)init;
- (id)rowAtIndex:(unint64_t)a3;
- (unint64_t)rowsCount;
- (void)addRow:(id)a3;
- (void)setHeader:(id)a3;
- (void)setSortable:(BOOL)a3;
@end

@implementation REExportedTable

- (REExportedTable)init
{
  v8.receiver = self;
  v8.super_class = (Class)REExportedTable;
  v2 = [(REExportedTable *)&v8 init];
  v3 = v2;
  if (v2)
  {
    header = v2->_header;
    v2->_header = (NSArray *)MEMORY[0x263EFFA68];

    uint64_t v5 = [MEMORY[0x263EFF980] array];
    data = v3->_data;
    v3->_data = (NSMutableArray *)v5;

    v3->_sortable = 1;
  }
  return v3;
}

- (unint64_t)rowsCount
{
  return [(NSMutableArray *)self->_data count];
}

- (id)rowAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_data objectAtIndexedSubscript:a3];
}

- (void)addRow:(id)a3
{
}

- (NSArray)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (BOOL)sortable
{
  return self->_sortable;
}

- (void)setSortable:(BOOL)a3
{
  self->_sortable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end