@interface ICAccountCryptoStrategyV2
- (BOOL)hasPassphraseSet;
- (BOOL)isPassphraseCorrect:(id)a3;
- (BOOL)mergeEncryptedDataFromRecord:(id)a3;
- (BOOL)setPassphrase:(id)a3 hint:(id)a4;
@end

@implementation ICAccountCryptoStrategyV2

- (BOOL)setPassphrase:(id)a3 hint:(id)a4
{
  return 0;
}

- (BOOL)hasPassphraseSet
{
  return 0;
}

- (BOOL)isPassphraseCorrect:(id)a3
{
  return 0;
}

- (BOOL)mergeEncryptedDataFromRecord:(id)a3
{
  return 1;
}

@end