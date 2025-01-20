@interface WiFiAwareDataSessionIssueReport
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)rtpSequenceNumberEquals:(id)a3;
- (BOOL)rtpStartTimeEquals:(id)a3;
- (NSNumber)rtpSequenceNumber;
- (NSNumber)rtpStartTime;
- (WiFiAwareDataSessionIssueReport)init;
- (WiFiAwareDataSessionIssueReport)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setRtpSequenceNumber:(id)a3;
- (void)setRtpStartTime:(id)a3;
@end

@implementation WiFiAwareDataSessionIssueReport

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwareDataSessionIssueReport *)self rtpSequenceNumber];
  [v4 encodeObject:v5 forKey:@"WiFiAwareDataSessionIssueReport.rtpSequenceNumber"];

  id v6 = [(WiFiAwareDataSessionIssueReport *)self rtpStartTime];
  [v4 encodeObject:v6 forKey:@"WiFiAwareDataSessionIssueReport.rtpStartTime"];
}

- (WiFiAwareDataSessionIssueReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwareDataSessionIssueReport *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionIssueReport.rtpSequenceNumber"];
    rtpSequenceNumber = v5->_rtpSequenceNumber;
    v5->_rtpSequenceNumber = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDataSessionIssueReport.rtpStartTime"];
    rtpStartTime = v5->_rtpStartTime;
    v5->_rtpStartTime = (NSNumber *)v8;
  }
  return v5;
}

- (WiFiAwareDataSessionIssueReport)init
{
  v7.receiver = self;
  v7.super_class = (Class)WiFiAwareDataSessionIssueReport;
  v2 = [(WiFiAwareDataSessionIssueReport *)&v7 init];
  v3 = v2;
  if (v2)
  {
    rtpSequenceNumber = v2->_rtpSequenceNumber;
    v2->_rtpSequenceNumber = 0;

    rtpStartTime = v3->_rtpStartTime;
    v3->_rtpStartTime = 0;
  }
  return v3;
}

- (BOOL)rtpSequenceNumberEquals:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwareDataSessionIssueReport *)self rtpSequenceNumber];
  uint64_t v6 = [v4 rtpSequenceNumber];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    objc_super v7 = [(WiFiAwareDataSessionIssueReport *)self rtpSequenceNumber];
    uint64_t v8 = [v4 rtpSequenceNumber];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)rtpStartTimeEquals:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwareDataSessionIssueReport *)self rtpStartTime];
  uint64_t v6 = [v4 rtpStartTime];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    objc_super v7 = [(WiFiAwareDataSessionIssueReport *)self rtpStartTime];
    uint64_t v8 = [v4 rtpStartTime];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WiFiAwareDataSessionIssueReport *)a3;
  if (self == v4)
  {
    v5 = 0;
LABEL_7:
    BOOL v6 = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v6 = 0;
    v5 = 0;
    goto LABEL_9;
  }
  v5 = v4;
  if ([(WiFiAwareDataSessionIssueReport *)self rtpSequenceNumberEquals:v5]
    && [(WiFiAwareDataSessionIssueReport *)self rtpStartTimeEquals:v5])
  {
    goto LABEL_7;
  }
  BOOL v6 = 0;
LABEL_9:

  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(WiFiAwareDataSessionIssueReport *)self rtpSequenceNumber];
  v5 = [(WiFiAwareDataSessionIssueReport *)self rtpStartTime];
  BOOL v6 = [v3 stringWithFormat:@"<WiFiAwareDataSessionIssueReport: rtpSequenceNumber:%@, rtpStartTime:%@>", v4, v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(WiFiAwareDataSessionIssueReport);
  v5 = [(WiFiAwareDataSessionIssueReport *)self rtpSequenceNumber];
  [(WiFiAwareDataSessionIssueReport *)v4 setRtpSequenceNumber:v5];

  BOOL v6 = [(WiFiAwareDataSessionIssueReport *)self rtpStartTime];
  [(WiFiAwareDataSessionIssueReport *)v4 setRtpStartTime:v6];

  return v4;
}

- (NSNumber)rtpSequenceNumber
{
  return self->_rtpSequenceNumber;
}

- (void)setRtpSequenceNumber:(id)a3
{
}

- (NSNumber)rtpStartTime
{
  return self->_rtpStartTime;
}

- (void)setRtpStartTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtpStartTime, 0);
  objc_storeStrong((id *)&self->_rtpSequenceNumber, 0);
}

@end