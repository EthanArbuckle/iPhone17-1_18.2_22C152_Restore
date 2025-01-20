@interface PXSharedLibraryParticipantValidationQuery
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (NSString)address;
- (PXSharedLibraryParticipantValidationQuery)init;
- (PXSharedLibraryParticipantValidationQuery)initWithAddress:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)setIsValid:(BOOL)a3;
@end

@implementation PXSharedLibraryParticipantValidationQuery

- (void).cxx_destruct
{
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (NSString)address
{
  return self->_address;
}

- (id)description
{
  v14.receiver = self;
  v14.super_class = (Class)PXSharedLibraryParticipantValidationQuery;
  v3 = [(PXSharedLibraryParticipantValidationQuery *)&v14 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = NSString;
  v6 = [(PXSharedLibraryParticipantValidationQuery *)self address];
  v7 = [v5 stringWithFormat:@":\naddress: %@,\n", v6];
  [v4 appendString:v7];

  v8 = NSString;
  BOOL v9 = [(PXSharedLibraryParticipantValidationQuery *)self isValid];
  v10 = @"NO";
  if (v9) {
    v10 = @"YES";
  }
  v11 = v10;
  v12 = [v8 stringWithFormat:@"isValid: %@", v11];
  [v4 appendString:v12];

  return v4;
}

- (unint64_t)hash
{
  v2 = [(PXSharedLibraryParticipantValidationQuery *)self address];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(PXSharedLibraryParticipantValidationQuery *)self address];
    v7 = [v5 address];
    if (v6 == v7) {
      char v8 = 1;
    }
    else {
      char v8 = [v6 isEqualToString:v7];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (PXSharedLibraryParticipantValidationQuery)initWithAddress:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXSharedLibraryParticipantValidationQuery.m", 25, @"Invalid parameter not satisfying: %@", @"address.length > 0" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXSharedLibraryParticipantValidationQuery;
  v6 = [(PXSharedLibraryParticipantValidationQuery *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    address = v6->_address;
    v6->_address = (NSString *)v7;
  }
  return v6;
}

- (PXSharedLibraryParticipantValidationQuery)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibraryParticipantValidationQuery.m", 21, @"%s is not available as initializer", "-[PXSharedLibraryParticipantValidationQuery init]");

  abort();
}

@end