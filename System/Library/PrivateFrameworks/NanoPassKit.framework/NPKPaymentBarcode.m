@interface NPKPaymentBarcode
- (BOOL)isEqual:(id)a3;
- (NPKPaymentBarcode)initWithBarcodeIdentifier:(id)a3 decryptedBarcodeCredential:(id)a4 error:(id)a5;
- (NSArray)barcodes;
- (NSData)decryptedBarcodeCredential;
- (NSString)barcodeIdentifier;
- (id)description;
- (unint64_t)state;
- (void)setBarcodeIdentifier:(id)a3;
- (void)setBarcodes:(id)a3;
- (void)setDecryptedBarcodeCredential:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation NPKPaymentBarcode

- (NPKPaymentBarcode)initWithBarcodeIdentifier:(id)a3 decryptedBarcodeCredential:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)NPKPaymentBarcode;
  v12 = [(NPKPaymentBarcode *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_barcodeIdentifier, a3);
    objc_storeStrong((id *)&v13->_decryptedBarcodeCredential, a4);
    if (v10)
    {
      uint64_t v14 = 1;
    }
    else if (v11)
    {
      v15 = [v11 userInfo];
      v16 = [v15 objectForKey:*MEMORY[0x263F08608]];

      v17 = [v16 domain];
      uint64_t v18 = [v16 code];
      if (([v17 isEqualToString:*MEMORY[0x263F08570]] & (((v18 + 1009) & 0xFFFFFFFFFFFFFFF7) == 0)) != 0) {
        uint64_t v14 = 2;
      }
      else {
        uint64_t v14 = 3;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
    v13->_state = v14;
  }

  return v13;
}

- (NSArray)barcodes
{
  v15[2] = *MEMORY[0x263EF8340];
  if (!self->_barcodes)
  {
    if ([(NPKPaymentBarcode *)self state] == 1)
    {
      id v3 = objc_alloc_init(MEMORY[0x263F5BDC0]);
      v4 = [(NPKPaymentBarcode *)self decryptedBarcodeCredential];
      [v3 setMessageData:v4];

      [v3 setFormat:1];
      id v5 = objc_alloc_init(MEMORY[0x263F5BDC0]);
      v6 = [(NPKPaymentBarcode *)self decryptedBarcodeCredential];
      [v5 setMessageData:v6];

      [v5 setFormat:4];
      v7 = NSString;
      id v8 = [(NPKPaymentBarcode *)self decryptedBarcodeCredential];
      id v9 = objc_msgSend(v7, "stringWithUTF8String:", objc_msgSend(v8, "bytes"));
      [v5 setAltText:v9];

      v15[0] = v3;
      v15[1] = v5;
      id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
      barcodes = self->_barcodes;
      self->_barcodes = v10;
    }
    else
    {
      v12 = self->_barcodes;
      self->_barcodes = (NSArray *)MEMORY[0x263EFFA68];
    }
  }
  v13 = self->_barcodes;
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NPKPaymentBarcode *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(NPKPaymentBarcode *)self barcodeIdentifier];
      v7 = [(NPKPaymentBarcode *)v5 barcodeIdentifier];
      if (NPKIsEqual(v6, v7))
      {
        id v8 = [(NPKPaymentBarcode *)self decryptedBarcodeCredential];
        id v9 = [(NPKPaymentBarcode *)v5 decryptedBarcodeCredential];
        if (NPKIsEqual(v8, v9))
        {
          unint64_t v10 = [(NPKPaymentBarcode *)self state];
          BOOL v11 = v10 == [(NPKPaymentBarcode *)v5 state];
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(NPKPaymentBarcode *)self barcodeIdentifier];
  v7 = [v3 stringWithFormat:@"<%@: %p - barcodeIdentifier: %@>", v5, self, v6];

  return v7;
}

- (NSString)barcodeIdentifier
{
  return self->_barcodeIdentifier;
}

- (void)setBarcodeIdentifier:(id)a3
{
}

- (void)setBarcodes:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSData)decryptedBarcodeCredential
{
  return self->_decryptedBarcodeCredential;
}

- (void)setDecryptedBarcodeCredential:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decryptedBarcodeCredential, 0);
  objc_storeStrong((id *)&self->_barcodes, 0);
  objc_storeStrong((id *)&self->_barcodeIdentifier, 0);
}

@end