@interface PDAuxiliaryRegistrationRequirementReference
- (BOOL)isReferencing:(id)a3;
- (PDAuxiliaryRegistrationRequirementReference)init;
- (PDAuxiliaryRegistrationRequirementReference)initWithDecryptionType:(unint64_t)a3;
- (PDAuxiliaryRegistrationRequirementReference)initWithSignatureType:(unint64_t)a3;
- (id)_initWithRole:(unint64_t)a3;
@end

@implementation PDAuxiliaryRegistrationRequirementReference

- (PDAuxiliaryRegistrationRequirementReference)init
{
  return 0;
}

- (PDAuxiliaryRegistrationRequirementReference)initWithSignatureType:(unint64_t)a3
{
  result = [(PDAuxiliaryRegistrationRequirementReference *)self _initWithRole:2];
  if (result) {
    result->_signatureType = a3;
  }
  return result;
}

- (PDAuxiliaryRegistrationRequirementReference)initWithDecryptionType:(unint64_t)a3
{
  result = [(PDAuxiliaryRegistrationRequirementReference *)self _initWithRole:1];
  if (result) {
    result->_decryptionType = a3;
  }
  return result;
}

- (id)_initWithRole:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDAuxiliaryRegistrationRequirementReference;
  id result = [(PDAuxiliaryRegistrationRequirementReference *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

- (BOOL)isReferencing:(id)a3
{
  id v4 = a3;
  id v5 = [v4 role];
  if (v5 == self->_role)
  {
    uint64_t v6 = 24;
    if (v5 == (id)2) {
      uint64_t v6 = 16;
    }
    id v7 = *(Class *)((char *)&self->super.isa + v6);
    BOOL v8 = v7 == [v4 type];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

@end