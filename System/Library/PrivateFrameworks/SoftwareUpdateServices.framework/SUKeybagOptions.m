@interface SUKeybagOptions
+ (BOOL)supportsSecureCoding;
- (LAContext)laContext;
- (NSString)passcode;
- (SUDescriptor)descriptor;
- (SUKeybagOptions)init;
- (SUKeybagOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)keybagType;
- (void)encodeWithCoder:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setKeybagType:(int)a3;
- (void)setLaContext:(id)a3;
- (void)setPasscode:(id)a3;
@end

@implementation SUKeybagOptions

- (SUKeybagOptions)init
{
  v8.receiver = self;
  v8.super_class = (Class)SUKeybagOptions;
  v2 = [(SUKeybagOptions *)&v8 init];
  v3 = v2;
  if (v2)
  {
    passcode = v2->_passcode;
    v2->_passcode = 0;

    laContext = v3->_laContext;
    v3->_laContext = 0;

    descriptor = v3->_descriptor;
    v3->_descriptor = 0;

    v3->_keybagType = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUKeybagOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUKeybagOptions;
  v5 = [(SUKeybagOptions *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passcode"];
    [(SUKeybagOptions *)v5 setPasscode:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"laContext"];
    [(SUKeybagOptions *)v5 setLaContext:v7];

    objc_super v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptor"];
    [(SUKeybagOptions *)v5 setDescriptor:v8];

    -[SUKeybagOptions setKeybagType:](v5, "setKeybagType:", [v4 decodeIntForKey:@"keybagType"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  passcode = self->_passcode;
  id v5 = a3;
  [v5 encodeObject:passcode forKey:@"passcode"];
  [v5 encodeObject:self->_laContext forKey:@"laContext"];
  [v5 encodeObject:self->_descriptor forKey:@"descriptor"];
  [v5 encodeInt:self->_keybagType forKey:@"keybagType"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setPasscode:self->_passcode];
  [v4 setLaContext:self->_laContext];
  [v4 setDescriptor:self->_descriptor];
  [v4 setKeybagType:self->_keybagType];
  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SUKeybagOptions *)self descriptor];
  uint64_t v5 = [(SUKeybagOptions *)self keybagType];
  v6 = [(SUKeybagOptions *)self passcode];
  if (v6) {
    v7 = @"<PRESENT>";
  }
  else {
    v7 = @"<NULL>";
  }
  objc_super v8 = [(SUKeybagOptions *)self laContext];
  if (v8) {
    v9 = @"<PRESENT>";
  }
  else {
    v9 = @"<NULL>";
  }
  objc_super v10 = [v3 stringWithFormat:@"\n            descriptor: %@\n            keybagType: %d\n            passcode: %@\n            LAContext:%@", v4, v5, v7, v9];

  return v10;
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
}

- (LAContext)laContext
{
  return self->_laContext;
}

- (void)setLaContext:(id)a3
{
}

- (SUDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (int)keybagType
{
  return self->_keybagType;
}

- (void)setKeybagType:(int)a3
{
  self->_keybagType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_laContext, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
}

@end