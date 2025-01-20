@interface TRIFetchOnDemandFactorsTaskGuardedData
- (id)description;
@end

@implementation TRIFetchOnDemandFactorsTaskGuardedData

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@,status:%i,retry:%@,error:%@>", objc_opt_class(), self->overallStatus, self->earliestRetryDate, self->fetchError];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->downloadableFactorNames, 0);
  objc_storeStrong((id *)&self->fetchError, 0);
  objc_storeStrong((id *)&self->earliestRetryDate, 0);
  objc_storeStrong((id *)&self->fetchOperations, 0);
}

@end