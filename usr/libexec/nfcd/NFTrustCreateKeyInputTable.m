@interface NFTrustCreateKeyInputTable
@end

@implementation NFTrustCreateKeyInputTable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyCounterLimit, 0);
  objc_storeStrong((id *)&self->_keyLocalValidation, 0);
  objc_storeStrong((id *)&self->_keyDiscretionaryData, 0);
  objc_storeStrong((id *)&self->_keyAlgorithm, 0);
  objc_storeStrong((id *)&self->_keyUsage, 0);

  objc_storeStrong((id *)&self->_subjectIdentifier, 0);
}

@end