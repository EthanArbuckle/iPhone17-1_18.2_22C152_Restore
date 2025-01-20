@interface SCUIReportSensitiveMedia
- (BOOL)isEqual:(id)a3;
- (BOOL)wasImpetusOfReport;
- (NSDate)dateReceived;
- (NSNumber)isSensitive;
- (NSString)UTIType;
- (NSString)identifier;
- (NSURL)url;
- (SCUIReportSensitiveMedia)initWithURL:(id)a3 UTIType:(id)a4 identifier:(id)a5 dateReceived:(id)a6 isSensitive:(id)a7 wasImpetusOfReport:(BOOL)a8;
- (unint64_t)hash;
@end

@implementation SCUIReportSensitiveMedia

- (SCUIReportSensitiveMedia)initWithURL:(id)a3 UTIType:(id)a4 identifier:(id)a5 dateReceived:(id)a6 isSensitive:(id)a7 wasImpetusOfReport:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v29.receiver = self;
  v29.super_class = (Class)SCUIReportSensitiveMedia;
  v20 = [(SCUIReportSensitiveMedia *)&v29 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_url, a3);
    objc_storeStrong((id *)&v21->_UTIType, a4);
    uint64_t v22 = [v18 copy];
    dateReceived = v21->_dateReceived;
    v21->_dateReceived = (NSDate *)v22;

    uint64_t v24 = [v17 copy];
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v24;

    uint64_t v26 = [v19 copy];
    isSensitive = v21->_isSensitive;
    v21->_isSensitive = (NSNumber *)v26;

    v21->_wasImpetusOfReport = a8;
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SCUIReportSensitiveMedia *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SCUIReportSensitiveMedia;
    if ([(SCUIReportSensitiveMedia *)&v14 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v6 = [(SCUIReportSensitiveMedia *)self url];
      v7 = [(SCUIReportSensitiveMedia *)v5 url];
      if ([v6 isEqual:v7])
      {
        v8 = [(SCUIReportSensitiveMedia *)self UTIType];
        v9 = [(SCUIReportSensitiveMedia *)v5 UTIType];
        if ([v8 isEqual:v9])
        {
          v10 = [(SCUIReportSensitiveMedia *)self dateReceived];
          v11 = [(SCUIReportSensitiveMedia *)v5 dateReceived];
          char v12 = [v10 isEqual:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  return [(NSURL *)self->_url hash];
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)UTIType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)dateReceived
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)isSensitive
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)wasImpetusOfReport
{
  return self->_wasImpetusOfReport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isSensitive, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_UTIType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end