@interface SCUIReportMessage
- (NSArray)attachmentIdentifiers;
- (NSDate)date;
- (NSString)body;
- (NSString)senderAccountID;
- (NSString)senderDisplayName;
- (SCUIReportMessage)initWithDate:(id)a3 senderAccountID:(id)a4 senderDisplayName:(id)a5 body:(id)a6 attachmentIdentifiers:(id)a7;
@end

@implementation SCUIReportMessage

- (SCUIReportMessage)initWithDate:(id)a3 senderAccountID:(id)a4 senderDisplayName:(id)a5 body:(id)a6 attachmentIdentifiers:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)SCUIReportMessage;
  v17 = [(SCUIReportMessage *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    date = v17->_date;
    v17->_date = (NSDate *)v18;

    uint64_t v20 = [v13 copy];
    senderAccountID = v17->_senderAccountID;
    v17->_senderAccountID = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    senderDisplayName = v17->_senderDisplayName;
    v17->_senderDisplayName = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    body = v17->_body;
    v17->_body = (NSString *)v24;

    uint64_t v26 = [v16 copy];
    attachmentIdentifiers = v17->_attachmentIdentifiers;
    v17->_attachmentIdentifiers = (NSArray *)v26;
  }
  return v17;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)senderAccountID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)senderDisplayName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)body
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)attachmentIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentIdentifiers, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_senderDisplayName, 0);
  objc_storeStrong((id *)&self->_senderAccountID, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end