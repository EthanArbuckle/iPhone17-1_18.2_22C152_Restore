@interface CRTestContext
- (BOOL)doRetry;
- (CRTestContext)init;
- (NSArray)partSPC;
- (NSMutableArray)patchItems;
- (NSNumber)lastRunTestId;
- (NSNumber)lastTestStatusCode;
- (NSString)PrCL;
- (NSString)rik;
- (NSString)serialNumber;
- (int64_t)lastRunTestIndex;
- (void)setDoRetry:(BOOL)a3;
- (void)setLastRunTestId:(id)a3;
- (void)setLastRunTestIndex:(int64_t)a3;
- (void)setLastTestStatusCode:(id)a3;
- (void)setPartSPC:(id)a3;
- (void)setPatchItems:(id)a3;
- (void)setPrCL:(id)a3;
- (void)setRik:(id)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation CRTestContext

- (CRTestContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRTestContext;
  v2 = [(CRTestContext *)&v6 init];
  if (v2)
  {
    v3 = (void *)MGCopyAnswer();
    [(CRTestContext *)v2 setSerialNumber:v3];

    [(CRTestContext *)v2 setLastRunTestId:0];
    [(CRTestContext *)v2 setLastRunTestIndex:0];
    [(CRTestContext *)v2 setLastTestStatusCode:&off_100060828];
    v4 = objc_opt_new();
    [(CRTestContext *)v2 setPatchItems:v4];

    [(CRTestContext *)v2 setPrCL:0];
    [(CRTestContext *)v2 setDoRetry:0];
  }
  return v2;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSArray)partSPC
{
  return self->_partSPC;
}

- (void)setPartSPC:(id)a3
{
}

- (NSString)rik
{
  return self->_rik;
}

- (void)setRik:(id)a3
{
}

- (NSMutableArray)patchItems
{
  return self->_patchItems;
}

- (void)setPatchItems:(id)a3
{
}

- (NSString)PrCL
{
  return self->_PrCL;
}

- (void)setPrCL:(id)a3
{
}

- (NSNumber)lastRunTestId
{
  return self->_lastRunTestId;
}

- (void)setLastRunTestId:(id)a3
{
}

- (int64_t)lastRunTestIndex
{
  return self->_lastRunTestIndex;
}

- (void)setLastRunTestIndex:(int64_t)a3
{
  self->_lastRunTestIndex = a3;
}

- (NSNumber)lastTestStatusCode
{
  return self->_lastTestStatusCode;
}

- (void)setLastTestStatusCode:(id)a3
{
}

- (BOOL)doRetry
{
  return self->_doRetry;
}

- (void)setDoRetry:(BOOL)a3
{
  self->_doRetry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTestStatusCode, 0);
  objc_storeStrong((id *)&self->_lastRunTestId, 0);
  objc_storeStrong((id *)&self->_PrCL, 0);
  objc_storeStrong((id *)&self->_patchItems, 0);
  objc_storeStrong((id *)&self->_rik, 0);
  objc_storeStrong((id *)&self->_partSPC, 0);

  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end