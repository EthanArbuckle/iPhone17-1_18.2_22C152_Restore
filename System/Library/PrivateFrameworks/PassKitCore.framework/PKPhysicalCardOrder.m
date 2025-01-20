@interface PKPhysicalCardOrder
+ (BOOL)supportsSecureCoding;
- (NSString)artworkIdentifier;
- (NSString)nameOnCard;
- (PKPhysicalCardOrder)initWithCoder:(id)a3;
- (unint64_t)reason;
- (void)encodeWithCoder:(id)a3;
- (void)setArtworkIdentifier:(id)a3;
- (void)setNameOnCard:(id)a3;
- (void)setReason:(unint64_t)a3;
@end

@implementation PKPhysicalCardOrder

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPhysicalCardOrder)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPhysicalCardOrder;
  v5 = [(PKPhysicalCardOrder *)&v11 init];
  if (v5)
  {
    v5->_reason = [v4 decodeIntegerForKey:@"reason"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    nameOnCard = v5->_nameOnCard;
    v5->_nameOnCard = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"artworkIdentifier"];
    artworkIdentifier = v5->_artworkIdentifier;
    v5->_artworkIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t reason = self->_reason;
  id v5 = a3;
  [v5 encodeInteger:reason forKey:@"reason"];
  [v5 encodeObject:self->_nameOnCard forKey:@"name"];
  [v5 encodeObject:self->_artworkIdentifier forKey:@"artworkIdentifier"];
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_unint64_t reason = a3;
}

- (NSString)nameOnCard
{
  return self->_nameOnCard;
}

- (void)setNameOnCard:(id)a3
{
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (void)setArtworkIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);
  objc_storeStrong((id *)&self->_nameOnCard, 0);
}

@end