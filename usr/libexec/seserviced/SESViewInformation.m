@interface SESViewInformation
+ (id)withViewName:(id)a3 currentTLK:(id)a4 tlkShares:(id)a5 previousTLKs:(id)a6;
- (NSArray)previousTLKs;
- (NSArray)tlkShares;
- (NSDictionary)dumpState;
- (NSString)description;
- (NSString)viewName;
- (SESTLKRecord)currentTLK;
@end

@implementation SESViewInformation

+ (id)withViewName:(id)a3 currentTLK:(id)a4 tlkShares:(id)a5 previousTLKs:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = objc_opt_new();
  v15 = (id *)v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 8), a3);
    objc_storeStrong(v15 + 2, a4);
    objc_storeStrong(v15 + 3, a5);
    objc_storeStrong(v15 + 4, a6);
  }

  return v15;
}

- (NSString)viewName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (SESTLKRecord)currentTLK
{
  return (SESTLKRecord *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)tlkShares
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)previousTLKs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousTLKs, 0);
  objc_storeStrong((id *)&self->_tlkShares, 0);
  objc_storeStrong((id *)&self->_currentTLK, 0);

  objc_storeStrong((id *)&self->_viewName, 0);
}

- (NSString)description
{
  return (NSString *)sub_10023FA38(self, (uint64_t)a2, (void (*)(void))SESViewInformation.description.getter);
}

- (NSDictionary)dumpState
{
  v2 = self;
  v3 = (void *)sub_10023DAC8();

  return (NSDictionary *)v3;
}

@end