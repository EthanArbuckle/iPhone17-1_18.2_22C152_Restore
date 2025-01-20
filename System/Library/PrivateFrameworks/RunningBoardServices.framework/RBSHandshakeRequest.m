@interface RBSHandshakeRequest
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)savedEndowments;
- (NSSet)assertionDescriptors;
- (RBSHandshakeRequest)initWithRBSXPCCoder:(id)a3;
- (unint64_t)hash;
- (unsigned)auid;
- (unsigned)euid;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)setAssertionDescriptors:(id)a3;
- (void)setAuid:(unsigned int)a3;
- (void)setEuid:(unsigned int)a3;
- (void)setSavedEndowments:(id)a3;
@end

@implementation RBSHandshakeRequest

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSHandshakeRequest)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RBSHandshakeRequest;
  v5 = [(RBSHandshakeRequest *)&v13 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeCollectionOfClass:v6 containingClass:objc_opt_class() forKey:@"_assertionDescriptors"];
    assertionDescriptors = v5->_assertionDescriptors;
    v5->_assertionDescriptors = (NSSet *)v7;

    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [v4 decodeCollectionOfClass:v9 containingClass:objc_opt_class() forKey:@"_savedEndowments"];
    savedEndowments = v5->_savedEndowments;
    v5->_savedEndowments = (NSArray *)v10;
  }
  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  assertionDescriptors = self->_assertionDescriptors;
  id v5 = a3;
  [v5 encodeObject:assertionDescriptors forKey:@"_assertionDescriptors"];
  [v5 encodeObject:self->_savedEndowments forKey:@"_savedEndowments"];
}

- (void)setEuid:(unsigned int)a3
{
  self->_euid = a3;
}

- (NSSet)assertionDescriptors
{
  assertionDescriptors = self->_assertionDescriptors;
  if (assertionDescriptors)
  {
    v3 = assertionDescriptors;
  }
  else
  {
    v3 = [MEMORY[0x1E4F1CAD0] set];
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedEndowments, 0);
  objc_storeStrong((id *)&self->_assertionDescriptors, 0);
}

- (NSArray)savedEndowments
{
  savedEndowments = self->_savedEndowments;
  if (savedEndowments)
  {
    v3 = savedEndowments;
  }
  else
  {
    v3 = [MEMORY[0x1E4F1C978] array];
  }
  return v3;
}

- (void)setSavedEndowments:(id)a3
{
}

- (void)setAssertionDescriptors:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSHandshakeRequest *)a3;
  if (self == v4) {
    goto LABEL_10;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()
    || (assertionDescriptors = self->_assertionDescriptors, assertionDescriptors != v4->_assertionDescriptors)
    && !-[NSSet isEqualToSet:](assertionDescriptors, "isEqualToSet:"))
  {
    char v6 = 0;
    goto LABEL_11;
  }
  savedEndowments = self->_savedEndowments;
  uint64_t v9 = v4->_savedEndowments;
  if (savedEndowments == v9)
  {
LABEL_10:
    char v6 = 1;
    goto LABEL_11;
  }
  char v6 = 0;
  if (savedEndowments && v9) {
    char v6 = -[NSArray isEqual:](savedEndowments, "isEqual:");
  }
LABEL_11:

  return v6;
}

- (unint64_t)hash
{
  return [(NSSet *)self->_assertionDescriptors hash];
}

- (unsigned)auid
{
  return self->_auid;
}

- (void)setAuid:(unsigned int)a3
{
  self->_auid = a3;
}

- (unsigned)euid
{
  return self->_euid;
}

@end