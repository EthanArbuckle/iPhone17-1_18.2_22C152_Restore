@interface SSVFamilyAccountPair
- (SSVFamilyAccountPair)initWithDownloaderAccountIdentifier:(unint64_t)a3 purchaserAccountIdentifier:(unint64_t)a4 familyIdentifier:(unint64_t)a5;
- (unint64_t)downloaderAccountIdentifier;
- (unint64_t)familyIdentifier;
- (unint64_t)purchaserAccountIdentifier;
@end

@implementation SSVFamilyAccountPair

- (SSVFamilyAccountPair)initWithDownloaderAccountIdentifier:(unint64_t)a3 purchaserAccountIdentifier:(unint64_t)a4 familyIdentifier:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SSVFamilyAccountPair;
  result = [(SSVFamilyAccountPair *)&v9 init];
  if (result)
  {
    result->_downloaderAccountIdentifier = a3;
    result->_familyIdentifier = a5;
    result->_purchaserAccountIdentifier = a4;
  }
  return result;
}

- (unint64_t)downloaderAccountIdentifier
{
  return self->_downloaderAccountIdentifier;
}

- (unint64_t)familyIdentifier
{
  return self->_familyIdentifier;
}

- (unint64_t)purchaserAccountIdentifier
{
  return self->_purchaserAccountIdentifier;
}

@end