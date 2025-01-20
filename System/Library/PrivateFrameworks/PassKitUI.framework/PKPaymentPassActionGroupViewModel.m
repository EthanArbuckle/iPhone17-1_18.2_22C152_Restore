@interface PKPaymentPassActionGroupViewModel
- (BOOL)isEqual:(id)a3;
- (BOOL)isInPreflight;
- (NSCopying)identifier;
- (PKPaymentPassActionGroup)actionGroup;
- (PKPaymentPassActionGroupViewModel)initWithActionGroup:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setIsInPreflight:(BOOL)a3;
@end

@implementation PKPaymentPassActionGroupViewModel

- (PKPaymentPassActionGroupViewModel)initWithActionGroup:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentPassActionGroupViewModel;
  v6 = [(PKPaymentPassActionGroupViewModel *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_actionGroup, a3);
    v7->_isInPreflight = 0;
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(PKPaymentPassActionGroup *)self->_actionGroup copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  *(unsigned char *)(v5 + 8) = self->_isInPreflight;
  return (id)v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  PKCombinedHash();
  unint64_t v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPaymentPassActionGroupViewModel *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        identifier = v6->_identifier;
        uint64_t v8 = self->_identifier;
        uint64_t v9 = identifier;
        if (v8 == v9)
        {
        }
        else
        {
          v10 = v9;
          if (!v8 || !v9)
          {

LABEL_14:
            BOOL v12 = 0;
            goto LABEL_15;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_14;
          }
        }
        BOOL v12 = v6->_isInPreflight == self->_isInPreflight;
LABEL_15:

        goto LABEL_16;
      }
    }
    BOOL v12 = 0;
  }
LABEL_16:

  return v12;
}

- (NSCopying)identifier
{
  return (NSCopying *)self->_identifier;
}

- (BOOL)isInPreflight
{
  return self->_isInPreflight;
}

- (void)setIsInPreflight:(BOOL)a3
{
  self->_isInPreflight = a3;
}

- (PKPaymentPassActionGroup)actionGroup
{
  return self->_actionGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionGroup, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end