@interface RCAddress
+ (BOOL)supportsSecureCoding;
+ (RCAddress)addressWith:(id)a3;
- (NSString)displayName;
- (NSString)emailAddress;
- (RCAddress)initWithAddress:(id)a3 displayName:(id)a4;
- (RCAddress)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEmailAddress:(id)a3;
@end

@implementation RCAddress

- (RCAddress)initWithAddress:(id)a3 displayName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RCAddress;
  v8 = [(RCAddress *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(RCAddress *)v8 setDisplayName:v7];
    [(RCAddress *)v9 setEmailAddress:v6];
  }

  return v9;
}

+ (RCAddress)addressWith:(id)a3
{
  v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  v5 = [v3 characterSetWithCharactersInString:@"<>"];
  id v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  if ([v6 count] == 1)
  {
    id v7 = [v6 objectAtIndex:0];
    v8 = [[RCAddress alloc] initWithAddress:v7 displayName:v7];
LABEL_5:

    goto LABEL_7;
  }
  if ((unint64_t)[v6 count] >= 2)
  {
    id v7 = [v6 objectAtIndex:0];
    v9 = [v6 objectAtIndex:1];
    v8 = [[RCAddress alloc] initWithAddress:v9 displayName:v7];

    goto LABEL_5;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)[(NSString *)self->_displayName copy];
  [v4 setDisplayName:v5];

  id v6 = (void *)[(NSString *)self->_emailAddress copy];
  [v4 setEmailAddress:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  displayName = self->_displayName;
  id v5 = a3;
  [v5 encodeObject:displayName forKey:@"_displayName"];
  [v5 encodeObject:self->_emailAddress forKey:@"_emailAddress"];
}

- (RCAddress)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(RCAddress *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_emailAddress"];
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end