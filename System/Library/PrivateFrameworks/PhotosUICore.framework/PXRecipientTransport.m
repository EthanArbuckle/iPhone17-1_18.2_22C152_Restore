@interface PXRecipientTransport
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (NSString)address;
- (PXRecipientTransport)init;
- (PXRecipientTransport)initWithAddress:(id)a3 addressKind:(int64_t)a4;
- (id)description;
- (int64_t)addressKind;
- (unint64_t)hash;
@end

@implementation PXRecipientTransport

- (void).cxx_destruct
{
}

- (int64_t)addressKind
{
  return self->_addressKind;
}

- (NSString)address
{
  return self->_address;
}

- (id)description
{
  unint64_t v3 = [(PXRecipientTransport *)self addressKind];
  if (v3 > 2) {
    v4 = 0;
  }
  else {
    v4 = off_1E5DB3360[v3];
  }
  v5 = NSString;
  v6 = [(PXRecipientTransport *)self address];
  v7 = [v5 stringWithFormat:@"address %@ addressKind %@", v6, v4];

  return v7;
}

- (unint64_t)hash
{
  v2 = [(PXRecipientTransport *)self address];
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
    id v6 = [(PXRecipientTransport *)self address];
    id v7 = [v5 address];
    if (v6 == v7)
    {
    }
    else
    {
      v8 = v7;
      char v9 = [v6 isEqualToString:v7];

      if ((v9 & 1) == 0)
      {
        BOOL v10 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    int64_t v11 = [(PXRecipientTransport *)self addressKind];
    BOOL v10 = v11 == [v5 addressKind];
    goto LABEL_8;
  }
  BOOL v10 = 0;
LABEL_9:

  return v10;
}

- (PXRecipientTransport)initWithAddress:(id)a3 addressKind:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXRecipient.m", 38, @"Invalid parameter not satisfying: %@", @"address" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PXRecipientTransport;
  v8 = [(PXRecipientTransport *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    address = v8->_address;
    v8->_address = (NSString *)v9;

    v8->_addressKind = a4;
  }

  return v8;
}

- (PXRecipientTransport)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXRecipient.m", 30, @"%s is not available as initializer", "-[PXRecipientTransport init]");

  abort();
}

+ (id)new
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXRecipient.m", 34, @"%s is not available as initializer", "+[PXRecipientTransport new]");

  abort();
}

@end