@interface PKSecureElementApplet
+ (BOOL)supportsSecureCoding;
+ (id)secureElementAppletWithInternalApplet:(id)a3;
- (BOOL)containsSubKeys;
- (BOOL)isLocked;
- (NSString)identifier;
- (NSString)packageIdentifier;
- (PKSecureElementApplet)initWithCoder:(id)a3;
- (PKSecureElementApplet)initWithIdentifier:(id)a3 lifecycleState:(unint64_t)a4;
- (PKSecureElementApplet)initWithIdentifier:(id)a3 packageIdentifier:(id)a4 lifecycleState:(unint64_t)a5;
- (PKSecureElementApplet)initWithIdentifier:(id)a3 packageIdentifier:(id)a4 lifecycleState:(unint64_t)a5 locked:(BOOL)a6 containsSubKeys:(BOOL)a7;
- (id)jsonDictionaryRepresentation;
- (unint64_t)lifecycleState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKSecureElementApplet

+ (id)secureElementAppletWithInternalApplet:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 identifier];
  v6 = [v4 packageIdentifier];
  int v7 = [v4 lifecycleState];
  uint64_t v8 = 0;
  if (v7 <= 14)
  {
    switch(v7)
    {
      case 1:
        uint64_t v8 = 1;
        break;
      case 3:
        uint64_t v8 = 3;
        break;
      case 7:
        uint64_t v8 = 7;
        break;
    }
  }
  else if (v7 > 128)
  {
    if (v7 == 129)
    {
      uint64_t v8 = 129;
    }
    else if (v7 == 130)
    {
      uint64_t v8 = 130;
    }
  }
  else if (v7 == 15)
  {
    uint64_t v8 = 15;
  }
  else if (v7 == 23)
  {
    uint64_t v8 = 23;
  }
  if ([v5 length])
  {
    v9 = objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:packageIdentifier:lifecycleState:locked:containsSubKeys:", v5, v6, v8, objc_msgSend(v4, "isGPLocked"), objc_msgSend(v4, "containsSubKeys"));
  }
  else
  {
    v10 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "INVALID APPLET RECEIVED FROM NEARFIELD! Applet does not contain an identifier: %@", (uint8_t *)&v12, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (PKSecureElementApplet)initWithIdentifier:(id)a3 lifecycleState:(unint64_t)a4
{
  return [(PKSecureElementApplet *)self initWithIdentifier:a3 packageIdentifier:0 lifecycleState:a4];
}

- (PKSecureElementApplet)initWithIdentifier:(id)a3 packageIdentifier:(id)a4 lifecycleState:(unint64_t)a5
{
  return [(PKSecureElementApplet *)self initWithIdentifier:a3 packageIdentifier:a4 lifecycleState:a5 locked:0 containsSubKeys:0];
}

- (PKSecureElementApplet)initWithIdentifier:(id)a3 packageIdentifier:(id)a4 lifecycleState:(unint64_t)a5 locked:(BOOL)a6 containsSubKeys:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKSecureElementApplet;
  uint64_t v14 = [(PKSecureElementApplet *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    uint64_t v17 = [v13 copy];
    packageIdentifier = v14->_packageIdentifier;
    v14->_packageIdentifier = (NSString *)v17;

    v14->_lifecycleState = a5;
    v14->_locked = a6;
    v14->_containsSubKeys = a7;
  }

  return v14;
}

- (id)jsonDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_identifier forKey:@"appletAid"];
  [v3 setObject:self->_packageIdentifier forKey:@"packageAid"];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_lifecycleState];
  [v3 setObject:v4 forKey:@"lifeCycleState"];

  v5 = (void *)[v3 copy];
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSecureElementApplet)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKSecureElementApplet;
  v5 = [(PKSecureElementApplet *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"packageIdentifier"];
    packageIdentifier = v5->_packageIdentifier;
    v5->_packageIdentifier = (NSString *)v8;

    v5->_lifecycleState = [v4 decodeIntegerForKey:@"lifecycleState"];
    v5->_locked = [v4 decodeBoolForKey:@"locked"];
    v5->_containsSubKeys = [v4 decodeBoolForKey:@"containsSubKeys"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_packageIdentifier forKey:@"packageIdentifier"];
  [v5 encodeInteger:self->_lifecycleState forKey:@"lifecycleState"];
  [v5 encodeBool:self->_locked forKey:@"locked"];
  [v5 encodeBool:self->_containsSubKeys forKey:@"containsSubKeys"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)packageIdentifier
{
  return self->_packageIdentifier;
}

- (unint64_t)lifecycleState
{
  return self->_lifecycleState;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (BOOL)containsSubKeys
{
  return self->_containsSubKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end