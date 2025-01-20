@interface QuickTypeWeightUpdates
- (NSData)weightUpdates;
- (NSNumber)l2Norm;
- (NSNumber)maxNorm;
- (NSString)privacyDiagnosticReport;
- (NSString)weightUpdatesDiagnosticReport;
- (void)setL2Norm:(id)a3;
- (void)setMaxNorm:(id)a3;
- (void)setPrivacyDiagnosticReport:(id)a3;
- (void)setWeightUpdates:(id)a3;
- (void)setWeightUpdatesDiagnosticReport:(id)a3;
@end

@implementation QuickTypeWeightUpdates

- (NSData)weightUpdates
{
  return self->_weightUpdates;
}

- (void)setWeightUpdates:(id)a3
{
}

- (NSNumber)l2Norm
{
  return self->_l2Norm;
}

- (void)setL2Norm:(id)a3
{
}

- (NSNumber)maxNorm
{
  return self->_maxNorm;
}

- (void)setMaxNorm:(id)a3
{
}

- (NSString)privacyDiagnosticReport
{
  return self->_privacyDiagnosticReport;
}

- (void)setPrivacyDiagnosticReport:(id)a3
{
}

- (NSString)weightUpdatesDiagnosticReport
{
  return self->_weightUpdatesDiagnosticReport;
}

- (void)setWeightUpdatesDiagnosticReport:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weightUpdatesDiagnosticReport, 0);
  objc_storeStrong((id *)&self->_privacyDiagnosticReport, 0);
  objc_storeStrong((id *)&self->_maxNorm, 0);
  objc_storeStrong((id *)&self->_l2Norm, 0);
  objc_storeStrong((id *)&self->_weightUpdates, 0);
}

@end