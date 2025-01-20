@interface PDAuxiliaryPassInformationManagerItemUpdate
- (BOOL)_isEqualToItem:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInvalid;
- (PKPassAuxiliaryPassInformationItem)item;
- (unint64_t)hash;
- (void)setIsInvalid:(BOOL)a3;
- (void)setItem:(id)a3;
@end

@implementation PDAuxiliaryPassInformationManagerItemUpdate

- (unint64_t)hash
{
  [(PKPassAuxiliaryPassInformationItem *)self->_item hash];
  return PKIntegerHash();
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PDAuxiliaryPassInformationManagerItemUpdate *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = [(PDAuxiliaryPassInformationManagerItemUpdate *)self _isEqualToItem:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_isEqualToItem:(id)a3
{
  return PKEqualObjects();
}

- (PKPassAuxiliaryPassInformationItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (void)setIsInvalid:(BOOL)a3
{
  self->_isInvalid = a3;
}

- (void).cxx_destruct
{
}

@end