@interface MBRestoreVerificationSummary
- (BOOL)verifierWasRun;
- (MBRestoreVerificationSummary)initWithDomainsNotVerifiedCount:(unint64_t)a3 domainsPassingVerificationCount:(unint64_t)a4 domainsFailingVerificationCount:(unint64_t)a5 domainsSkippedVerificationCount:(unint64_t)a6;
- (NSString)statusToReport;
- (unint64_t)domainsFailingVerificationCount;
- (unint64_t)domainsNotVerifiedCount;
- (unint64_t)domainsPassingVerificationCount;
- (unint64_t)domainsSkippedVerificationCount;
@end

@implementation MBRestoreVerificationSummary

- (MBRestoreVerificationSummary)initWithDomainsNotVerifiedCount:(unint64_t)a3 domainsPassingVerificationCount:(unint64_t)a4 domainsFailingVerificationCount:(unint64_t)a5 domainsSkippedVerificationCount:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)MBRestoreVerificationSummary;
  result = [(MBRestoreVerificationSummary *)&v11 init];
  if (result)
  {
    result->_domainsNotVerifiedCount = a3;
    result->_domainsPassingVerificationCount = a4;
    result->_domainsFailingVerificationCount = a5;
    result->_domainsSkippedVerificationCount = a6;
  }
  return result;
}

- (BOOL)verifierWasRun
{
  return self->_domainsPassingVerificationCount + self->_domainsFailingVerificationCount != 0;
}

- (NSString)statusToReport
{
  if (![(MBRestoreVerificationSummary *)self verifierWasRun]) {
    return 0;
  }
  if (self->_domainsFailingVerificationCount) {
    return (NSString *)@"FAIL";
  }
  return (NSString *)@"PASS";
}

- (unint64_t)domainsNotVerifiedCount
{
  return self->_domainsNotVerifiedCount;
}

- (unint64_t)domainsPassingVerificationCount
{
  return self->_domainsPassingVerificationCount;
}

- (unint64_t)domainsFailingVerificationCount
{
  return self->_domainsFailingVerificationCount;
}

- (unint64_t)domainsSkippedVerificationCount
{
  return self->_domainsSkippedVerificationCount;
}

@end