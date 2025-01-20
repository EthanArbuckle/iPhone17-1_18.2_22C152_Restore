@interface CLEmergencyADRIDSBatchQueryDelegate
- (CLEmergencyADRIDSBatchQueryDelegate)initWithADRPointer:(void *)a3;
- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6;
- (void)fADR;
- (void)setFADR:(void *)a3;
@end

@implementation CLEmergencyADRIDSBatchQueryDelegate

- (CLEmergencyADRIDSBatchQueryDelegate)initWithADRPointer:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLEmergencyADRIDSBatchQueryDelegate;
  v4 = [(CLEmergencyADRIDSBatchQueryDelegate *)&v6 init];
  [(CLEmergencyADRIDSBatchQueryDelegate *)v4 setFADR:a3];
  return v4;
}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  v9 = [(CLEmergencyADRIDSBatchQueryDelegate *)self fADR];

  sub_101394484((uint64_t)v9, a4, a5, (uint64_t)a6);
}

- (void)fADR
{
  return self->_fADR;
}

- (void)setFADR:(void *)a3
{
  self->_fADR = a3;
}

@end