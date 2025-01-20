@interface PXPeoplePickerMockPerson
- (NSString)mockLocalIdentifier;
- (NSString)mockName;
- (PXPeoplePickerMockPerson)init;
- (PXPeoplePickerMockPerson)initWithLocalIdentifier:(id)a3 displayName:(id)a4;
- (id)description;
- (void)setMockLocalIdentifier:(id)a3;
- (void)setMockName:(id)a3;
@end

@implementation PXPeoplePickerMockPerson

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_mockName, 0);
}

- (void)setMockLocalIdentifier:(id)a3
{
}

- (NSString)mockLocalIdentifier
{
  return self->_mockLocalIdentifier;
}

- (void)setMockName:(id)a3
{
}

- (NSString)mockName
{
  return self->_mockName;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PXPeoplePickerMockPerson *)self mockName];
  v6 = [(PXPeoplePickerMockPerson *)self px_localizedName];
  v7 = [v3 stringWithFormat:@"<%@:%p, uuid:%@, displayName:%@>", v4, self, v5, v6];

  return v7;
}

- (PXPeoplePickerMockPerson)initWithLocalIdentifier:(id)a3 displayName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXPeoplePickerMockPerson.m", 27, @"Invalid parameter not satisfying: %@", @"localIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PXPeoplePickerMockPerson.m", 28, @"Invalid parameter not satisfying: %@", @"displayName" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)PXPeoplePickerMockPerson;
  v10 = [(PXPeoplePickerMockPerson *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v9 copy];
    mockName = v10->_mockName;
    v10->_mockName = (NSString *)v11;

    uint64_t v13 = [v7 copy];
    mockLocalIdentifier = v10->_mockLocalIdentifier;
    v10->_mockLocalIdentifier = (NSString *)v13;
  }
  return v10;
}

- (PXPeoplePickerMockPerson)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPeoplePickerMockPerson.m", 23, @"%s is not available as initializer", "-[PXPeoplePickerMockPerson init]");

  abort();
}

@end