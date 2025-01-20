@interface KeyInSlot
+ (BOOL)supportsSecureCoding;
- (KeyInSlot)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation KeyInSlot

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KeyInSlot)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)KeyInSlot;
  v5 = [(NFTrustObject *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = sub_100032934();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"keyUniqueIdentifier"];
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v7;

    v5->_numQuery = (int)[v4 decodeIntForKey:@"numQuery"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  if (self)
  {
    [a3 encodeObject:self->_keyIdentifier forKey:@"keyUniqueIdentifier"];
    unint64_t numQuery = self->_numQuery;
  }
  else
  {
    [a3 encodeObject:0 forKey:@"keyUniqueIdentifier"];
    unint64_t numQuery = 0;
  }
  [a3 encodeInteger:numQuery forKey:@"numQuery"];
}

- (void).cxx_destruct
{
}

@end