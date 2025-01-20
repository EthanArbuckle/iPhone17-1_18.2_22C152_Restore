@interface PSDisplay
+ (BOOL)supportsSecureCoding;
+ (id)builtinDisplay;
+ (id)displayWithHardwareIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (PSDisplay)initWithCoder:(id)a3;
- (id)_initWithHardwareIdentifier:(id)a3;
- (id)description;
- (id)hardwareIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PSDisplay

+ (id)builtinDisplay
{
  if (builtinDisplay_onceToken != -1) {
    dispatch_once(&builtinDisplay_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)builtinDisplay___builtin;
  return v2;
}

void __27__PSDisplay_builtinDisplay__block_invoke()
{
  id v0 = [[PSDisplay alloc] _initWithHardwareIdentifier:0];
  v1 = (void *)builtinDisplay___builtin;
  builtinDisplay___builtin = (uint64_t)v0;

  *(unsigned char *)(builtinDisplay___builtin + 8) = 1;
}

+ (id)displayWithHardwareIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [[PSDisplay alloc] _initWithHardwareIdentifier:v3];
  }
  else
  {
    id v4 = +[PSDisplay builtinDisplay];
  }
  v5 = v4;

  return v5;
}

- (id)_initWithHardwareIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSDisplay;
  v5 = [(PSDisplay *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    hardwareIdentifier = v5->_hardwareIdentifier;
    v5->_hardwareIdentifier = (NSString *)v6;
  }
  return v5;
}

- (id)hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PSDisplay)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hardwareIdentifier"];

  uint64_t v6 = +[PSDisplay displayWithHardwareIdentifier:v5];

  return v6;
}

- (unint64_t)hash
{
  if (self->_builtin) {
    uint64_t v2 = 102301;
  }
  else {
    uint64_t v2 = 96953;
  }
  return v2 ^ [(NSString *)self->_hardwareIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PSDisplay *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class() && self->_builtin == v4->_builtin) {
      char v6 = BSEqualStrings();
    }
    else {
      char v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  hardwareIdentifier = self->_hardwareIdentifier;
  if (hardwareIdentifier)
  {
    id v3 = hardwareIdentifier;
  }
  else if (self->_builtin)
  {
    id v3 = @"builtin";
  }
  else
  {
    id v3 = @"unknown";
  }
  return v3;
}

- (void).cxx_destruct
{
}

@end