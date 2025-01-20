@interface _PSTrialClientGuardedData
@end

@implementation _PSTrialClientGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_suggestionProxyOrder, 0);
  objc_storeStrong((id *)&self->_rankingModel, 0);
  objc_storeStrong((id *)&self->_recipe, 0);

  objc_storeStrong((id *)&self->_trialClient, 0);
}

@end