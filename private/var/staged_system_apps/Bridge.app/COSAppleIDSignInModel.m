@interface COSAppleIDSignInModel
+ (id)accountForServiceType:(int64_t)a3;
+ (id)aidaServiceTypeFromAppleIDServiceType:(int64_t)a3;
- (BOOL)benefitsControllerPresented;
- (BOOL)cdpRepairRequiredOnBenefitsController;
- (BOOL)hasCombinedIDSSignInFailed;
- (BOOL)hasSignedInToFaceTime;
- (BOOL)hasSignedInToiCloud;
- (BOOL)hasSignedInToiMessage;
- (BOOL)hasSignedInToiTunesStore;
- (BOOL)hasSignedIntoAllServices;
- (BOOL)silentSignInSuccessfulForAll;
- (BOOL)waitingForAnySilentSignInToComplete;
- (COSAppleIDSignInModel)init;
- (NSMutableArray)services;
- (id)description;
- (id)stateForServiceType:(int64_t)a3;
- (void)setBenefitsControllerPresented:(BOOL)a3;
- (void)setCdpRepairRequiredOnBenefitsController:(BOOL)a3;
- (void)setHasCombinedIDSSignInFailed:(BOOL)a3;
- (void)setHasSignedInToFaceTime:(BOOL)a3;
- (void)setHasSignedInToiCloud:(BOOL)a3;
- (void)setHasSignedInToiMessage:(BOOL)a3;
- (void)setHasSignedInToiTunesStore:(BOOL)a3;
- (void)setServices:(id)a3;
@end

@implementation COSAppleIDSignInModel

- (COSAppleIDSignInModel)init
{
  v8.receiver = self;
  v8.super_class = (Class)COSAppleIDSignInModel;
  v2 = [(COSAppleIDSignInModel *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:4];
    services = v2->_services;
    v2->_services = v3;

    for (uint64_t i = 0; i != 4; ++i)
    {
      v6 = [[COSAppleIDServiceState alloc] initWithServiceType:i];
      [(NSMutableArray *)v2->_services setObject:v6 atIndexedSubscript:i];
    }
  }
  return v2;
}

- (id)stateForServiceType:(int64_t)a3
{
  return [(NSMutableArray *)self->_services objectAtIndexedSubscript:a3];
}

- (void)setHasSignedInToiCloud:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:0];
  [v4 setSignedIn:v3];
}

- (BOOL)hasSignedInToiCloud
{
  v2 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:0];
  unsigned __int8 v3 = [v2 signedIn];

  return v3;
}

- (void)setHasSignedInToiMessage:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:2];
  [v4 setSignedIn:v3];
}

- (BOOL)hasSignedInToiMessage
{
  v2 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:2];
  unsigned __int8 v3 = [v2 signedIn];

  return v3;
}

- (void)setHasSignedInToFaceTime:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:3];
  [v4 setSignedIn:v3];
}

- (BOOL)hasSignedInToFaceTime
{
  v2 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:3];
  unsigned __int8 v3 = [v2 signedIn];

  return v3;
}

- (void)setHasSignedInToiTunesStore:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:1];
  [v4 setSignedIn:v3];
}

- (BOOL)hasSignedInToiTunesStore
{
  v2 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:1];
  unsigned __int8 v3 = [v2 signedIn];

  return v3;
}

- (BOOL)hasSignedIntoAllServices
{
  unsigned __int8 v3 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:0];
  if ([v3 signedIn])
  {
    id v4 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:1];
    if ([v4 signedIn])
    {
      v5 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:2];
      if ([v5 signedIn])
      {
        v6 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:3];
        unsigned __int8 v7 = [v6 signedIn];
      }
      else
      {
        unsigned __int8 v7 = 0;
      }
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)waitingForAnySilentSignInToComplete
{
  unsigned __int8 v3 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:0];
  if ([v3 waitingForSilentSigninToComplete])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = 1;
    v5 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:1];
    if (([v5 waitingForSilentSigninToComplete] & 1) == 0)
    {
      v6 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:2];
      if ([v6 waitingForSilentSigninToComplete])
      {
        unsigned __int8 v4 = 1;
      }
      else
      {
        unsigned __int8 v7 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:3];
        unsigned __int8 v4 = [v7 waitingForSilentSigninToComplete];
      }
    }
  }
  return v4;
}

- (BOOL)silentSignInSuccessfulForAll
{
  unsigned __int8 v3 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:0];
  if ([v3 silentSignInSuccessful])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = 1;
    v5 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:1];
    if (([v5 silentSignInSuccessful] & 1) == 0)
    {
      v6 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:2];
      if ([v6 silentSignInSuccessful])
      {
        unsigned __int8 v4 = 1;
      }
      else
      {
        unsigned __int8 v7 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:3];
        unsigned __int8 v4 = [v7 silentSignInSuccessful];
      }
    }
  }
  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"hasSignedInToiCloud: %d  hasSignedInToiMessage: %d  hasSignedInToFaceTime: %d  hasSignedInToFaceTime: %d  hasSignedInToiTunesStore: %d  benefitsControllerPresented: %d  cdpRepairRequiredOnBenefitsController: %d\n" -[COSAppleIDSignInModel hasSignedInToiCloud](self, "hasSignedInToiCloud"), -[COSAppleIDSignInModel hasSignedInToiMessage](self, "hasSignedInToiMessage"), -[COSAppleIDSignInModel hasSignedInToFaceTime](self, "hasSignedInToFaceTime"), -[COSAppleIDSignInModel hasSignedInToiTunesStore](self, "hasSignedInToiTunesStore"), -[COSAppleIDSignInModel hasSignedIntoAllServices](self, "hasSignedIntoAllServices"), -[COSAppleIDSignInModel benefitsControllerPresented](self, "benefitsControllerPresented"), -[COSAppleIDSignInModel cdpRepairRequiredOnBenefitsController](self, "cdpRepairRequiredOnBenefitsController")];
  for (uint64_t i = 0; i != 4; ++i)
  {
    v5 = [(NSMutableArray *)self->_services objectAtIndexedSubscript:i];
    [v3 appendFormat:@"service: %@\n", v5];
  }

  return v3;
}

+ (id)aidaServiceTypeFromAppleIDServiceType:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = *(id *)*(&off_100245578 + a3);
  }
  return v4;
}

+ (id)accountForServiceType:(int64_t)a3
{
  id v4 = sub_100031C7C();
  v5 = [(id)objc_opt_class() aidaServiceTypeFromAppleIDServiceType:a3];
  v6 = [v4 accountForService:v5];

  return v6;
}

- (BOOL)hasCombinedIDSSignInFailed
{
  return self->_hasCombinedIDSSignInFailed;
}

- (void)setHasCombinedIDSSignInFailed:(BOOL)a3
{
  self->_hasCombinedIDSSignInFailed = a3;
}

- (BOOL)benefitsControllerPresented
{
  return self->_benefitsControllerPresented;
}

- (void)setBenefitsControllerPresented:(BOOL)a3
{
  self->_benefitsControllerPresented = a3;
}

- (BOOL)cdpRepairRequiredOnBenefitsController
{
  return self->_cdpRepairRequiredOnBenefitsController;
}

- (void)setCdpRepairRequiredOnBenefitsController:(BOOL)a3
{
  self->_cdpRepairRequiredOnBenefitsController = a3;
}

- (NSMutableArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end