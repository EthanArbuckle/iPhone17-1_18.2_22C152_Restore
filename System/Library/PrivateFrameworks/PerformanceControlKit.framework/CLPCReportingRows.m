@interface CLPCReportingRows
- (CLPCReportingRows)init;
- (CLPCReportingSchema)schema;
- (NSArray)rows;
- (void)setRows:(id)a3;
- (void)setSchema:(id)a3;
@end

@implementation CLPCReportingRows

- (CLPCReportingSchema)schema
{
  return self->_schema;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_schema, 0);
}

- (NSArray)rows
{
  return self->_rows;
}

- (void)setSchema:(id)a3
{
}

- (void)setRows:(id)a3
{
}

- (CLPCReportingRows)init
{
  v9.receiver = self;
  v9.super_class = (Class)CLPCReportingRows;
  v2 = [(CLPCReportingRows *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    schema = v2->_schema;
    v2->_schema = (CLPCReportingSchema *)v3;

    uint64_t v5 = [MEMORY[0x263EFF8C0] array];
    rows = v2->_rows;
    v2->_rows = (NSArray *)v5;

    v7 = v2;
  }

  return v2;
}

@end