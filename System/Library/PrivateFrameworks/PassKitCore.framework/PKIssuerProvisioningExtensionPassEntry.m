@interface PKIssuerProvisioningExtensionPassEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)_isEqualToEntry:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGImageRef)art;
- (NSString)identifier;
- (NSString)title;
- (PKIssuerProvisioningExtensionPassEntry)init;
- (PKIssuerProvisioningExtensionPassEntry)initWithCoder:(id)a3;
- (id)_initWithType:(int64_t)a3 identifier:(id)a4 title:(id)a5 art:(CGImage *)a6;
- (id)paymentPassEntry;
- (int64_t)type;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PKIssuerProvisioningExtensionPassEntry

- (id)paymentPassEntry
{
  if ([(PKIssuerProvisioningExtensionPassEntry *)self type] == 1) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKIssuerProvisioningExtensionPassEntry)init
{
  v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKIssuerProvisioningExtensionPassEntry: invalid initializer.", v5, 2u);
  }

  return 0;
}

- (id)_initWithType:(int64_t)a3 identifier:(id)a4 title:(id)a5 art:(CGImage *)a6
{
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v10 && v11 && a6)
  {
    v22.receiver = self;
    v22.super_class = (Class)PKIssuerProvisioningExtensionPassEntry;
    v13 = [(PKIssuerProvisioningExtensionPassEntry *)&v22 init];
    v14 = v13;
    if (v13)
    {
      v13->_type = a3;
      uint64_t v15 = [v10 copy];
      identifier = v14->_identifier;
      v14->_identifier = (NSString *)v15;

      uint64_t v17 = [v12 copy];
      title = v14->_title;
      v14->_title = (NSString *)v17;

      v14->_art = CGImageRetain(a6);
    }
    self = v14;
    v19 = self;
  }
  else
  {
    v20 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "PKIssuerProvisioningExtensionPassEntry: initializer missing required parameters.", buf, 2u);
    }

    v19 = 0;
  }

  return v19;
}

- (void)dealloc
{
  CGImageRelease(self->_art);
  v3.receiver = self;
  v3.super_class = (Class)PKIssuerProvisioningExtensionPassEntry;
  [(PKIssuerProvisioningExtensionPassEntry *)&v3 dealloc];
}

- (PKIssuerProvisioningExtensionPassEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKIssuerProvisioningExtensionPassEntry;
  v5 = [(PKIssuerProvisioningExtensionPassEntry *)&v14 init];
  v6 = v5;
  if (v5)
  {
    [(PKIssuerProvisioningExtensionPassEntry *)v5 setType:0];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v6->_title;
    v6->_title = (NSString *)v9;

    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"art"];
    v12 = v11;
    if (v11) {
      v6->_art = PKCreateCGImage(v11);
    }
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeObject:self->_identifier forKey:@"identifier"];
  [v8 encodeObject:self->_title forKey:@"title"];
  if (self->_art)
  {
    Mutable = CFDataCreateMutable(0, 0);
    if (Mutable)
    {
      v5 = Mutable;
      v6 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)[(id)*MEMORY[0x1E4F44460] identifier], 1uLL, 0);
      if (v6)
      {
        uint64_t v7 = v6;
        CGImageDestinationAddImage(v6, self->_art, 0);
        if (CGImageDestinationFinalize(v7)) {
          [v8 encodeObject:v5 forKey:@"art"];
        }
        CFRelease(v7);
      }
      CFRelease(v5);
    }
  }
}

- (unint64_t)hash
{
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_title];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKIssuerProvisioningExtensionPassEntry *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PKIssuerProvisioningExtensionPassEntry *)self _isEqualToEntry:v4];
  }

  return v5;
}

- (BOOL)_isEqualToEntry:(id)a3
{
  uint64_t v4 = a3;
  if (!v4) {
    goto LABEL_15;
  }
  identifier = self->_identifier;
  v6 = (NSString *)v4[1];
  if (identifier) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (identifier != v6) {
      goto LABEL_15;
    }
  }
  else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_15;
  }
  title = self->_title;
  uint64_t v9 = (NSString *)v4[2];
  if (!title || !v9)
  {
    if (title == v9) {
      goto LABEL_13;
    }
LABEL_15:
    BOOL v10 = 0;
    goto LABEL_16;
  }
  if ((-[NSString isEqual:](title, "isEqual:") & 1) == 0) {
    goto LABEL_15;
  }
LABEL_13:
  BOOL v10 = self->_type == v4[4];
LABEL_16:

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (CGImageRef)art
{
  return self->_art;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end