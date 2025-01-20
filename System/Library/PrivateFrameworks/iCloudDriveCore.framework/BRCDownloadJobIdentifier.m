@interface BRCDownloadJobIdentifier
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDownloadJobIdentifier:(id)a3;
- (BRCDownloadJobIdentifier)initWithDBRowID:(unint64_t)a3 etag:(id)a4 kind:(int)a5;
- (NSString)description;
- (NSString)etag;
- (id)columns;
- (id)columnsValues;
- (id)matchingJobsWhereSQLClause;
- (int)kind;
- (unint64_t)hash;
- (unint64_t)itemDBRowID;
@end

@implementation BRCDownloadJobIdentifier

- (BRCDownloadJobIdentifier)initWithDBRowID:(unint64_t)a3 etag:(id)a4 kind:(int)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BRCDownloadJobIdentifier;
  v10 = [(BRCDownloadJobIdentifier *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_itemDBRowID = a3;
    objc_storeStrong((id *)&v10->_etag, a4);
    v11->_kind = a5;
  }

  return v11;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"%lld-%@-%s", self->_itemDBRowID, self->_etag, BRCPrettyPrintEnum()];
}

- (id)matchingJobsWhereSQLClause
{
  return (id)[MEMORY[0x263F8C710] formatInjection:@"throttle_id = %lld AND download_etag = %@ AND download_kind = %u", self->_itemDBRowID, self->_etag, self->_kind];
}

- (id)columns
{
  return (id)objc_msgSend(MEMORY[0x263F8C720], "rawInjection:length:", "throttle_id, download_etag, download_kind", 41);
}

- (id)columnsValues
{
  return (id)[MEMORY[0x263F8C710] formatInjection:@"%lld, %@, %u", self->_itemDBRowID, self->_etag, self->_kind];
}

- (unint64_t)hash
{
  unint64_t itemDBRowID = self->_itemDBRowID;
  return [(NSString *)self->_etag hash] ^ itemDBRowID ^ self->_kind;
}

- (BOOL)isEqualToDownloadJobIdentifier:(id)a3
{
  v4 = a3;
  v5 = v4;
  BOOL v6 = v4
    && self->_itemDBRowID == *((void *)v4 + 2)
    && [(NSString *)self->_etag isEqualToString:*((void *)v4 + 3)]
    && self->_kind == v5[2];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BRCDownloadJobIdentifier *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(BRCDownloadJobIdentifier *)self isEqualToDownloadJobIdentifier:v4];
  }

  return v5;
}

- (unint64_t)itemDBRowID
{
  return self->_itemDBRowID;
}

- (NSString)etag
{
  return self->_etag;
}

- (int)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
}

@end