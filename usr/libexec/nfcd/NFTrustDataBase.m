@interface NFTrustDataBase
@end

@implementation NFTrustDataBase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end