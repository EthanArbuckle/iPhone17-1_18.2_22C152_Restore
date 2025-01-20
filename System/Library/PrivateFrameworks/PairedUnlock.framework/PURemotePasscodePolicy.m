@interface PURemotePasscodePolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isModificationAllowed;
- (PURemotePasscodePolicy)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)passcodeMinimumLength;
- (void)encodeWithCoder:(id)a3;
- (void)setModificationAllowed:(BOOL)a3;
- (void)setPasscodeMinimumLength:(unint64_t)a3;
@end

@implementation PURemotePasscodePolicy

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (int v5 = [(PURemotePasscodePolicy *)self isModificationAllowed],
        v5 == [v4 isModificationAllowed]))
  {
    unint64_t v8 = [(PURemotePasscodePolicy *)self passcodeMinimumLength];
    BOOL v6 = v8 == [v4 passcodeMinimumLength];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[PURemotePasscodePolicy isModificationAllowed](self, "isModificationAllowed"), @"isModificationAllowed");
  id v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[PURemotePasscodePolicy passcodeMinimumLength](self, "passcodeMinimumLength"), @"passcodeMinimumLength");
  BOOL v6 = [v3 build];

  return v6;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C60]);
  id v4 = (id)objc_msgSend(v3, "appendBool:", -[PURemotePasscodePolicy isModificationAllowed](self, "isModificationAllowed"));
  id v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[PURemotePasscodePolicy passcodeMinimumLength](self, "passcodeMinimumLength"));
  unint64_t v6 = [v3 hash];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PURemotePasscodePolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PURemotePasscodePolicy;
  id v5 = [(PURemotePasscodePolicy *)&v7 init];
  if (v5)
  {
    v5->_modificationAllowed = [v4 decodeBoolForKey:@"kPURemotePasscodePolicy_ModificationAllowed"];
    v5->_passcodeMinimumLength = [v4 decodeIntegerForKey:@"kPURemotePasscodePolicy_MinimumLength"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL modificationAllowed = self->_modificationAllowed;
  id v5 = a3;
  [v5 encodeBool:modificationAllowed forKey:@"kPURemotePasscodePolicy_ModificationAllowed"];
  [v5 encodeInteger:self->_passcodeMinimumLength forKey:@"kPURemotePasscodePolicy_MinimumLength"];
}

- (BOOL)isModificationAllowed
{
  return self->_modificationAllowed;
}

- (void)setModificationAllowed:(BOOL)a3
{
  self->_BOOL modificationAllowed = a3;
}

- (unint64_t)passcodeMinimumLength
{
  return self->_passcodeMinimumLength;
}

- (void)setPasscodeMinimumLength:(unint64_t)a3
{
  self->_passcodeMinimumLength = a3;
}

@end