@interface PXComposeRecipientValidationQuery
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (NSString)address;
- (PXComposeRecipient)composeRecipient;
- (PXComposeRecipientValidationQuery)init;
- (PXComposeRecipientValidationQuery)initWithComposeRecipient:(id)a3 address:(id)a4 addressKind:(int64_t)a5;
- (id)description;
- (int64_t)addressKind;
- (int64_t)validationType;
- (unint64_t)hash;
- (void)setValidationType:(int64_t)a3;
@end

@implementation PXComposeRecipientValidationQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_composeRecipient, 0);
}

- (void)setValidationType:(int64_t)a3
{
  self->_validationType = a3;
}

- (int64_t)validationType
{
  return self->_validationType;
}

- (int64_t)addressKind
{
  return self->_addressKind;
}

- (NSString)address
{
  return self->_address;
}

- (PXComposeRecipient)composeRecipient
{
  return self->_composeRecipient;
}

- (id)description
{
  v3 = NSString;
  v4 = [(PXComposeRecipientValidationQuery *)self address];
  v5 = [v3 stringWithFormat:@"address %@ addressKind %ld", v4, -[PXComposeRecipientValidationQuery addressKind](self, "addressKind")];

  return v5;
}

- (unint64_t)hash
{
  v2 = [(PXComposeRecipientValidationQuery *)self address];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(PXComposeRecipientValidationQuery *)self address];
    v7 = [v5 address];
    if (v6 == v7) {
      char v8 = 1;
    }
    else {
      char v8 = [v6 isEqualToString:v7];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (PXComposeRecipientValidationQuery)initWithComposeRecipient:(id)a3 address:(id)a4 addressKind:(int64_t)a5
{
  id v10 = a3;
  id v11 = a4;
  if (v11)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXComposeRecipientValidationManager.m", 52, @"Invalid parameter not satisfying: %@", @"address" object file lineNumber description];

    if (a5) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"PXComposeRecipientValidationManager.m", 53, @"Invalid parameter not satisfying: %@", @"addressKind != PXRecipientKindUnknown" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)PXComposeRecipientValidationQuery;
  v12 = [(PXComposeRecipientValidationQuery *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_composeRecipient, a3);
    uint64_t v14 = [v11 copy];
    address = v13->_address;
    v13->_address = (NSString *)v14;

    v13->_addressKind = a5;
  }

  return v13;
}

- (PXComposeRecipientValidationQuery)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXComposeRecipientValidationManager.m", 44, @"%s is not available as initializer", "-[PXComposeRecipientValidationQuery init]");

  abort();
}

+ (id)new
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXComposeRecipientValidationManager.m", 48, @"%s is not available as initializer", "+[PXComposeRecipientValidationQuery new]");

  abort();
}

@end