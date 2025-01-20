@interface TPSGradientStop
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSNumber)location;
- (NSString)colorString;
- (TPSGradientStop)initWithCoder:(id)a3;
- (TPSGradientStop)initWithColorString:(id)a3;
- (TPSGradientStop)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setColorString:(id)a3;
- (void)setLocation:(id)a3;
@end

@implementation TPSGradientStop

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSGradientStop;
  id v4 = a3;
  [(TPSSerializableObject *)&v7 encodeWithCoder:v4];
  v5 = [(TPSGradientStop *)self location];
  [v4 encodeObject:v5 forKey:@"stop"];

  v6 = [(TPSGradientStop *)self colorString];
  [v4 encodeObject:v6 forKey:@"color"];
}

- (NSString)colorString
{
  return self->_colorString;
}

- (NSNumber)location
{
  return self->_location;
}

- (TPSGradientStop)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSGradientStop;
  v5 = [(TPSSerializableObject *)&v11 initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 TPSSafeNumberForKey:@"stop"];
    location = v5->_location;
    v5->_location = (NSNumber *)v6;

    uint64_t v8 = [v4 TPSSafeStringForKey:@"color"];
    colorString = v5->_colorString;
    v5->_colorString = (NSString *)v8;
  }
  return v5;
}

- (TPSGradientStop)initWithColorString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSGradientStop;
  uint64_t v6 = [(TPSGradientStop *)&v9 init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_colorString, a3);
  }

  return v7;
}

- (TPSGradientStop)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSGradientStop;
  id v5 = [(TPSSerializableObject *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stop"];
    location = v5->_location;
    v5->_location = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"color"];
    colorString = v5->_colorString;
    v5->_colorString = (NSString *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TPSGradientStop;
  id v4 = [(TPSSerializableObject *)&v8 copyWithZone:a3];
  id v5 = [(TPSGradientStop *)self location];
  [v4 setLocation:v5];

  uint64_t v6 = [(TPSGradientStop *)self colorString];
  [v4 setColorString:v6];

  return v4;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v10.receiver = self;
  v10.super_class = (Class)TPSGradientStop;
  id v4 = [(TPSSerializableObject *)&v10 debugDescription];
  id v5 = (void *)[v3 initWithString:v4];

  uint64_t v6 = [(TPSGradientStop *)self location];
  [v5 appendFormat:@"\n  %@ = %@", @"stop", v6];

  objc_super v7 = [(TPSGradientStop *)self colorString];

  if (v7)
  {
    objc_super v8 = [(TPSGradientStop *)self colorString];
    [v5 appendFormat:@"\n  %@ = %@", @"color", v8];
  }
  return v5;
}

id __30__TPSGradientStop_na_identity__block_invoke()
{
  if (TPSGradientStopColorStringKey_block_invoke_na_once_token_0 != -1) {
    dispatch_once(&TPSGradientStopColorStringKey_block_invoke_na_once_token_0, &__block_literal_global_22);
  }
  v0 = (void *)TPSGradientStopColorStringKey_block_invoke_na_once_object_0;
  return v0;
}

uint64_t __30__TPSGradientStop_na_identity__block_invoke_2()
{
  uint64_t v0 = __30__TPSGradientStop_na_identity__block_invoke_3();
  uint64_t v1 = TPSGradientStopColorStringKey_block_invoke_na_once_object_0;
  TPSGradientStopColorStringKey_block_invoke_na_once_object_0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __30__TPSGradientStop_na_identity__block_invoke_3()
{
  uint64_t v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_29];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_32];
  id v3 = [v0 build];

  return v3;
}

uint64_t __30__TPSGradientStop_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 location];
}

uint64_t __30__TPSGradientStop_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 colorString];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  id v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (void)setLocation:(id)a3
{
}

- (void)setColorString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorString, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end