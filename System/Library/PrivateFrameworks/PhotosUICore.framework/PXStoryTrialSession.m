@interface PXStoryTrialSession
- (PXStoryTrialSession)init;
- (TRIClient)trialClient;
- (id)_levelForFactorName:(id)a3;
- (id)fileURLForFactorName:(id)a3;
- (void)setTrialClient:(id)a3;
@end

@implementation PXStoryTrialSession

- (void).cxx_destruct
{
}

- (void)setTrialClient:(id)a3
{
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (id)fileURLForFactorName:(id)a3
{
  v3 = [(PXStoryTrialSession *)self _levelForFactorName:a3];
  v4 = [v3 fileValue];
  if ([v4 hasPath])
  {
    v5 = [v4 path];
    v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_levelForFactorName:(id)a3
{
  return (id)[(TRIClient *)self->_trialClient levelForFactor:a3 withNamespaceName:@"PHOTOS_GENERAL"];
}

- (PXStoryTrialSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXStoryTrialSession;
  v2 = [(PXStoryTrialSession *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4FB0098] clientWithIdentifier:235];
    trialClient = v2->_trialClient;
    v2->_trialClient = (TRIClient *)v3;
  }
  return v2;
}

@end