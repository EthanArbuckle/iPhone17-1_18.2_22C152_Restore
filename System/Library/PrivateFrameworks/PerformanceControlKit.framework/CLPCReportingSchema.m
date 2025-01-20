@interface CLPCReportingSchema
- (CLPCReportingSchema)init;
- (NSArray)columns;
- (unint64_t)schemaID;
- (void)finalizeColumns;
- (void)setSchemaID:(unint64_t)a3;
- (void)stageColumn:(uint64_t)a1;
@end

@implementation CLPCReportingSchema

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->stagedColumns, 0);
}

- (NSArray)columns
{
  return self->_columns;
}

- (CLPCReportingSchema)init
{
  v10.receiver = self;
  v10.super_class = (Class)CLPCReportingSchema;
  v2 = [(CLPCReportingSchema *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_schemaID = 0;
    uint64_t v4 = [MEMORY[0x263EFF8C0] array];
    columns = v3->_columns;
    v3->_columns = (NSArray *)v4;

    uint64_t v6 = [MEMORY[0x263EFF980] array];
    stagedColumns = v3->stagedColumns;
    v3->stagedColumns = (NSMutableArray *)v6;

    v8 = v3;
  }

  return v3;
}

- (void)stageColumn:(uint64_t)a1
{
  id v3 = a2;
  if (a1) {
    [*(id *)(a1 + 8) addObject:v3];
  }
}

- (void)finalizeColumns
{
  if (a1)
  {
    uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithArray:*(void *)(a1 + 8)];
    id v3 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v2;

    uint64_t v4 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;
  }
}

- (unint64_t)schemaID
{
  return self->_schemaID;
}

- (void)setSchemaID:(unint64_t)a3
{
  self->_schemaID = a3;
}

@end