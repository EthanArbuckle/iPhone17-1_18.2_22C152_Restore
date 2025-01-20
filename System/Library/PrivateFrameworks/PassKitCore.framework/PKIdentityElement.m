@interface PKIdentityElement
+ (PKIdentityElement)addressElement;
+ (PKIdentityElement)ageElement;
+ (PKIdentityElement)ageThresholdElementWithAge:(NSInteger)age;
+ (PKIdentityElement)dateOfBirthElement;
+ (PKIdentityElement)documentDHSComplianceStatusElement;
+ (PKIdentityElement)documentExpirationDateElement;
+ (PKIdentityElement)documentIssueDateElement;
+ (PKIdentityElement)documentNumberElement;
+ (PKIdentityElement)drivingPrivilegesElement;
+ (PKIdentityElement)familyNameElement;
+ (PKIdentityElement)givenNameElement;
+ (PKIdentityElement)issuingAuthorityElement;
+ (PKIdentityElement)portraitElement;
+ (PKIdentityElement)sexElement;
- (DIIdentityElement)wrapped;
- (PKIdentityElement)initWithDIIdentityElement:(id)a3;
- (id)asDIIdentityElement;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setWrapped:(id)a3;
@end

@implementation PKIdentityElement

- (PKIdentityElement)initWithDIIdentityElement:(id)a3
{
  v4 = (DIIdentityElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PKIdentityElement;
  v5 = [(PKIdentityElement *)&v8 init];
  wrapped = v5->_wrapped;
  v5->_wrapped = v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [PKIdentityElement alloc];
  v6 = (void *)[(DIIdentityElement *)self->_wrapped copyWithZone:a3];
  v7 = [(PKIdentityElement *)v5 initWithDIIdentityElement:v6];

  return v7;
}

- (id)description
{
  return (id)[(DIIdentityElement *)self->_wrapped description];
}

+ (PKIdentityElement)givenNameElement
{
  v2 = [PKIdentityElement alloc];
  v3 = [MEMORY[0x1E4F5C1B8] givenNameElement];
  v4 = [(PKIdentityElement *)v2 initWithDIIdentityElement:v3];

  return v4;
}

+ (PKIdentityElement)familyNameElement
{
  v2 = [PKIdentityElement alloc];
  v3 = [MEMORY[0x1E4F5C1B8] familyNameElement];
  v4 = [(PKIdentityElement *)v2 initWithDIIdentityElement:v3];

  return v4;
}

+ (PKIdentityElement)portraitElement
{
  v2 = [PKIdentityElement alloc];
  v3 = [MEMORY[0x1E4F5C1B8] portraitElement];
  v4 = [(PKIdentityElement *)v2 initWithDIIdentityElement:v3];

  return v4;
}

+ (PKIdentityElement)addressElement
{
  v2 = [PKIdentityElement alloc];
  v3 = [MEMORY[0x1E4F5C1B8] addressElement];
  v4 = [(PKIdentityElement *)v2 initWithDIIdentityElement:v3];

  return v4;
}

+ (PKIdentityElement)issuingAuthorityElement
{
  v2 = [PKIdentityElement alloc];
  v3 = [MEMORY[0x1E4F5C1B8] issuingAuthorityElement];
  v4 = [(PKIdentityElement *)v2 initWithDIIdentityElement:v3];

  return v4;
}

+ (PKIdentityElement)ageElement
{
  v2 = [PKIdentityElement alloc];
  v3 = [MEMORY[0x1E4F5C1B8] ageElement];
  v4 = [(PKIdentityElement *)v2 initWithDIIdentityElement:v3];

  return v4;
}

+ (PKIdentityElement)dateOfBirthElement
{
  v2 = [PKIdentityElement alloc];
  v3 = [MEMORY[0x1E4F5C1B8] dateOfBirthElement];
  v4 = [(PKIdentityElement *)v2 initWithDIIdentityElement:v3];

  return v4;
}

+ (PKIdentityElement)sexElement
{
  v2 = [PKIdentityElement alloc];
  v3 = [MEMORY[0x1E4F5C1B8] sexElement];
  v4 = [(PKIdentityElement *)v2 initWithDIIdentityElement:v3];

  return v4;
}

+ (PKIdentityElement)documentIssueDateElement
{
  v2 = [PKIdentityElement alloc];
  v3 = [MEMORY[0x1E4F5C1B8] documentIssueDateElement];
  v4 = [(PKIdentityElement *)v2 initWithDIIdentityElement:v3];

  return v4;
}

+ (PKIdentityElement)documentExpirationDateElement
{
  v2 = [PKIdentityElement alloc];
  v3 = [MEMORY[0x1E4F5C1B8] documentExpirationDateElement];
  v4 = [(PKIdentityElement *)v2 initWithDIIdentityElement:v3];

  return v4;
}

+ (PKIdentityElement)documentDHSComplianceStatusElement
{
  v2 = [PKIdentityElement alloc];
  v3 = [MEMORY[0x1E4F5C1B8] documentDHSComplianceStatusElement];
  v4 = [(PKIdentityElement *)v2 initWithDIIdentityElement:v3];

  return v4;
}

+ (PKIdentityElement)documentNumberElement
{
  v2 = [PKIdentityElement alloc];
  v3 = [MEMORY[0x1E4F5C1B8] documentNumberElement];
  v4 = [(PKIdentityElement *)v2 initWithDIIdentityElement:v3];

  return v4;
}

+ (PKIdentityElement)drivingPrivilegesElement
{
  v2 = [PKIdentityElement alloc];
  v3 = [MEMORY[0x1E4F5C1B8] drivingPrivilegesElement];
  v4 = [(PKIdentityElement *)v2 initWithDIIdentityElement:v3];

  return v4;
}

+ (PKIdentityElement)ageThresholdElementWithAge:(NSInteger)age
{
  v4 = [PKIdentityElement alloc];
  v5 = [MEMORY[0x1E4F5C1B8] ageThresholdElementWithAge:age];
  v6 = [(PKIdentityElement *)v4 initWithDIIdentityElement:v5];

  return v6;
}

- (id)asDIIdentityElement
{
  return self->_wrapped;
}

- (DIIdentityElement)wrapped
{
  return self->_wrapped;
}

- (void)setWrapped:(id)a3
{
}

- (void).cxx_destruct
{
}

@end