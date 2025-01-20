@interface WFExtractShortcutResult
- (NSDate)sharedDate;
- (NSString)iCloudIdentifier;
- (NSString)sourceApplicationIdentifier;
- (WFExtractShortcutResult)initWithRecord:(id)a3 fileContentType:(int64_t)a4 iCloudIdentifier:(id)a5 sourceApplicationIdentifier:(id)a6 sharedDate:(id)a7;
- (WFExtractShortcutResult)initWithRecord:(id)a3 fileContentType:(int64_t)a4 sourceApplicationIdentifier:(id)a5 sharedDate:(id)a6;
- (WFWorkflowRecord)record;
- (int64_t)fileContentType;
@end

@implementation WFExtractShortcutResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_iCloudIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedDate, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

- (NSString)sourceApplicationIdentifier
{
  return self->_sourceApplicationIdentifier;
}

- (NSString)iCloudIdentifier
{
  return self->_iCloudIdentifier;
}

- (NSDate)sharedDate
{
  return self->_sharedDate;
}

- (int64_t)fileContentType
{
  return self->_fileContentType;
}

- (WFWorkflowRecord)record
{
  return self->_record;
}

- (WFExtractShortcutResult)initWithRecord:(id)a3 fileContentType:(int64_t)a4 iCloudIdentifier:(id)a5 sourceApplicationIdentifier:(id)a6 sharedDate:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)WFExtractShortcutResult;
  v17 = [(WFExtractShortcutResult *)&v25 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_record, a3);
    v18->_fileContentType = a4;
    uint64_t v19 = [v14 copy];
    iCloudIdentifier = v18->_iCloudIdentifier;
    v18->_iCloudIdentifier = (NSString *)v19;

    uint64_t v21 = [v15 copy];
    sourceApplicationIdentifier = v18->_sourceApplicationIdentifier;
    v18->_sourceApplicationIdentifier = (NSString *)v21;

    objc_storeStrong((id *)&v18->_sharedDate, a7);
    v23 = v18;
  }

  return v18;
}

- (WFExtractShortcutResult)initWithRecord:(id)a3 fileContentType:(int64_t)a4 sourceApplicationIdentifier:(id)a5 sharedDate:(id)a6
{
  return [(WFExtractShortcutResult *)self initWithRecord:a3 fileContentType:a4 iCloudIdentifier:0 sourceApplicationIdentifier:a5 sharedDate:a6];
}

@end