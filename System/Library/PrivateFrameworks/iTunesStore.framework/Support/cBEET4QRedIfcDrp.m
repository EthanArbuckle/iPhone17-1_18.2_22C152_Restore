@interface cBEET4QRedIfcDrp
- (NSString)emailAddress;
- (NSString)firstName;
- (NSString)fullName;
- (NSString)lastName;
- (NSString)phoneNumber;
- (cBEET4QRedIfcDrp)initWithEmailAddress:(id)a3 source:(unint64_t)a4;
- (cBEET4QRedIfcDrp)initWithFirstName:(id)a3 lastName:(id)a4 source:(unint64_t)a5;
- (cBEET4QRedIfcDrp)initWithFullName:(id)a3 source:(unint64_t)a4;
- (cBEET4QRedIfcDrp)initWithPhoneNumber:(id)a3 source:(unint64_t)a4;
- (cBEET4QRedIfcDrp)initWithSource:(unint64_t)a3;
- (unint64_t)source;
- (unint64_t)type;
- (void)setEmailAddress:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setFullName:(id)a3;
- (void)setLastName:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setSource:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation cBEET4QRedIfcDrp

- (cBEET4QRedIfcDrp)initWithSource:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)cBEET4QRedIfcDrp;
  result = [(cBEET4QRedIfcDrp *)&v5 init];
  result->_source = a3;
  return result;
}

- (cBEET4QRedIfcDrp)initWithEmailAddress:(id)a3 source:(unint64_t)a4
{
  v6 = (NSString *)a3;
  v7 = [(cBEET4QRedIfcDrp *)self initWithSource:a4];
  emailAddress = v7->_emailAddress;
  v7->_emailAddress = v6;

  return v7;
}

- (cBEET4QRedIfcDrp)initWithPhoneNumber:(id)a3 source:(unint64_t)a4
{
  v6 = (NSString *)a3;
  v7 = [(cBEET4QRedIfcDrp *)self initWithSource:a4];
  phoneNumber = v7->_phoneNumber;
  v7->_phoneNumber = v6;

  return v7;
}

- (cBEET4QRedIfcDrp)initWithFullName:(id)a3 source:(unint64_t)a4
{
  v6 = (NSString *)a3;
  v7 = [(cBEET4QRedIfcDrp *)self initWithSource:a4];
  fullName = v7->_fullName;
  v7->_fullName = v6;

  return v7;
}

- (cBEET4QRedIfcDrp)initWithFirstName:(id)a3 lastName:(id)a4 source:(unint64_t)a5
{
  v8 = (NSString *)a3;
  v9 = (NSString *)a4;
  v10 = [(cBEET4QRedIfcDrp *)self initWithSource:a5];
  firstName = v10->_firstName;
  v10->_firstName = v8;
  v12 = v8;

  lastName = v10->_lastName;
  v10->_lastName = v9;

  return v10;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);

  objc_storeStrong((id *)&self->_firstName, 0);
}

@end