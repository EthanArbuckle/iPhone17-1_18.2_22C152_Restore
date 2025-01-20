@interface PKBarcode
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTall;
- (BOOL)shouldRemoveQuietZone;
- (NSData)messageData;
- (NSDictionary)options;
- (NSString)altText;
- (NSString)header;
- (PKBarcode)init;
- (PKBarcode)initWithCoder:(id)a3;
- (PKBarcode)initWithPassDictionary:(id)a3 bundle:(id)a4;
- (int64_t)format;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAltText:(id)a3;
- (void)setFormat:(int64_t)a3;
- (void)setHeader:(id)a3;
- (void)setMessageData:(id)a3;
- (void)setOptions:(id)a3;
- (void)setShouldRemoveQuietZone:(BOOL)a3;
@end

@implementation PKBarcode

- (int64_t)format
{
  return self->_format;
}

- (NSString)altText
{
  return self->_altText;
}

- (BOOL)shouldRemoveQuietZone
{
  return self->_shouldRemoveQuietZone;
}

- (NSDictionary)options
{
  return self->_options;
}

- (NSData)messageData
{
  return self->_messageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altText, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_messageData, 0);
}

- (PKBarcode)initWithPassDictionary:(id)a3 bundle:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v51.receiver = self;
    v51.super_class = (Class)PKBarcode;
    self = [(PKBarcode *)&v51 init];
    if (!self)
    {
LABEL_38:
      self = self;
      v9 = self;
      goto LABEL_41;
    }
    v10 = [v6 objectForKey:@"barcodes"];
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        id v12 = 0;
LABEL_28:

        v9 = 0;
        goto LABEL_41;
      }
      v46 = v8;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v11 = v10;
      id v12 = (id)[v11 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v12)
      {
        v43 = v10;
        id v44 = v6;
        v45 = self;
        uint64_t v13 = *(void *)v48;
        while (2)
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v48 != v13) {
              objc_enumerationMutation(v11);
            }
            v15 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            v16 = [v15 PKStringForKey:@"format"];
            v17 = v16;
            if (v16)
            {
              int64_t v24 = NSNumber;
              id v18 = v16;
              v19 = [(id)v24 numberWithInt:0];
              LODWORD(v24) = _PKEnumValueFromString(v18, v19, @"PKBarcodeFormat", @"PKBarcodeFormatUnknown, PKBarcodeFormatQR, PKBarcodeFormatPDF417, PKBarcodeFormatAztec, PKBarcodeFormatCode128", v20, v21, v22, v23, 0);

              if (v24)
              {
                int64_t v24 = (int)v24;
                id v12 = v15;
                v10 = v43;
                id v6 = v44;
                goto LABEL_21;
              }
            }
          }
          id v12 = (id)[v11 countByEnumeratingWithState:&v47 objects:v52 count:16];
          if (v12) {
            continue;
          }
          break;
        }
        int64_t v24 = 0;
        id v6 = v44;
        self = v45;
        v10 = v43;
        goto LABEL_22;
      }
    }
    else
    {
      v46 = v8;
      id v12 = [v6 PKDictionaryForKey:@"barcode"];
      id v11 = [v12 PKStringForKey:@"format"];
      if (v11)
      {
        v45 = self;
        id v18 = [NSNumber numberWithInt:0];
        int64_t v24 = (int)_PKEnumValueFromString(v11, v18, @"PKBarcodeFormat", @"PKBarcodeFormatUnknown, PKBarcodeFormatQR, PKBarcodeFormatPDF417, PKBarcodeFormatAztec, PKBarcodeFormatCode128", v25, v26, v27, v28, 0);
LABEL_21:

        self = v45;
        goto LABEL_22;
      }
    }
    int64_t v24 = 0;
LABEL_22:

    if (v24)
    {
      self->_format = v24;
      v29 = [v12 objectForKey:@"message"];
      objc_opt_class();
      int isKindOfClass = objc_opt_isKindOfClass();
      v31 = [v12 objectForKey:@"messageEncoding"];
      if (v31)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & isKindOfClass & 1) == 0) {
          goto LABEL_32;
        }
        CFStringEncoding v32 = CFStringConvertIANACharSetNameToEncoding(v31);
        if (!v32) {
          goto LABEL_32;
        }
      }
      else
      {
        if ((isKindOfClass & 1) == 0)
        {
LABEL_32:
          int v35 = 0;
LABEL_33:
          v36 = [v12 objectForKey:@"altText"];
          if (v36)
          {
            objc_opt_class();
            v35 &= objc_opt_isKindOfClass();
          }
          v37 = [v12 objectForKey:@"header"];
          if (v37)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass() & v35)
            {
LABEL_37:
              v8 = v46;
              PKLocalizedPassStringForPassBundle(v36, v46, 0);
              v38 = (NSString *)objc_claimAutoreleasedReturnValue();
              altText = self->_altText;
              self->_altText = v38;

              PKLocalizedPassStringForPassBundle(v37, v46, 0);
              v40 = (NSString *)objc_claimAutoreleasedReturnValue();
              header = self->_header;
              self->_header = v40;

              goto LABEL_38;
            }
          }
          else if (v35)
          {
            goto LABEL_37;
          }

          v9 = 0;
          v8 = v46;
          goto LABEL_41;
        }
        CFStringEncoding v32 = 513;
      }
      v33 = [v29 dataUsingEncoding:CFStringConvertEncodingToNSStringEncoding(v32)];
      messageData = self->_messageData;
      self->_messageData = v33;

      int v35 = 1;
      goto LABEL_33;
    }
    v8 = v46;
    goto LABEL_28;
  }
LABEL_41:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  messageData = self->_messageData;
  id v5 = a3;
  [v5 encodeObject:messageData forKey:@"message"];
  [v5 encodeInteger:self->_format forKey:@"format"];
  [v5 encodeObject:self->_options forKey:@"options"];
  [v5 encodeObject:self->_altText forKey:@"altText"];
  [v5 encodeObject:self->_header forKey:@"header"];
}

- (PKBarcode)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKBarcode;
  id v5 = [(PKBarcode *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    messageData = v5->_messageData;
    v5->_messageData = (NSData *)v6;

    v5->_format = [v4 decodeIntegerForKey:@"format"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"options"];
    options = v5->_options;
    v5->_options = (NSDictionary *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altText"];
    altText = v5->_altText;
    v5->_altText = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"header"];
    header = v5->_header;
    v5->_header = (NSString *)v12;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (self->_format == v5[6])
    {
      options = self->_options;
      id v7 = (NSDictionary *)v5[3];
      if (options && v7)
      {
        if ((-[NSDictionary isEqual:](options, "isEqual:") & 1) == 0) {
          goto LABEL_16;
        }
      }
      else if (options != v7)
      {
        goto LABEL_16;
      }
      messageData = self->_messageData;
      uint64_t v10 = (NSData *)v5[2];
      if (messageData && v10)
      {
        if (-[NSData isEqual:](messageData, "isEqual:"))
        {
LABEL_12:
          altText = self->_altText;
          uint64_t v12 = (NSString *)v5[5];
          if (altText && v12) {
            char v8 = -[NSString isEqual:](altText, "isEqual:");
          }
          else {
            char v8 = altText == v12;
          }
          goto LABEL_17;
        }
      }
      else if (messageData == v10)
      {
        goto LABEL_12;
      }
    }
LABEL_16:
    char v8 = 0;
LABEL_17:

    goto LABEL_18;
  }
  char v8 = 0;
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  return [(NSData *)self->_messageData hash];
}

- (PKBarcode)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKBarcode;
  result = [(PKBarcode *)&v3 init];
  if (result) {
    result->_format = 0;
  }
  return result;
}

- (BOOL)isTall
{
  return (self->_format & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (void)setMessageData:(id)a3
{
}

- (void)setOptions:(id)a3
{
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (void)setAltText:(id)a3
{
}

- (void)setFormat:(int64_t)a3
{
  self->_format = a3;
}

- (void)setShouldRemoveQuietZone:(BOOL)a3
{
  self->_shouldRemoveQuietZone = a3;
}

@end