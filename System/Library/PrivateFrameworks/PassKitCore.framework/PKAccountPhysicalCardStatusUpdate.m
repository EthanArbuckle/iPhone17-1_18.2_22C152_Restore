@interface PKAccountPhysicalCardStatusUpdate
+ (BOOL)supportsSecureCoding;
+ (id)recordNamePrefix;
+ (id)recordType;
- (BOOL)isEqual:(id)a3;
- (NSArray)updatedPhysicalCards;
- (NSString)description;
- (PKAccountPhysicalCardStatusUpdate)initWithCoder:(id)a3;
- (PKAccountPhysicalCardStatusUpdate)initWithRecord:(id)a3;
- (unint64_t)hash;
- (unint64_t)reason;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithRecord:(id)a3;
- (void)setReason:(unint64_t)a3;
- (void)setUpdatedPhysicalCards:(id)a3;
@end

@implementation PKAccountPhysicalCardStatusUpdate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountPhysicalCardStatusUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountPhysicalCardStatusUpdate;
  v5 = [(PKAccountPhysicalCardStatusUpdate *)&v12 init];
  if (v5)
  {
    v5->_reason = [v4 decodeIntegerForKey:@"reason"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"physicalCards"];
    updatedPhysicalCards = v5->_updatedPhysicalCards;
    v5->_updatedPhysicalCards = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t reason = self->_reason;
  id v5 = a3;
  [v5 encodeInteger:reason forKey:@"reason"];
  [v5 encodeObject:self->_updatedPhysicalCards forKey:@"physicalCards"];
}

- (PKAccountPhysicalCardStatusUpdate)initWithRecord:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountPhysicalCardStatusUpdate;
  id v5 = [(PKAccountPhysicalCardStatusUpdate *)&v12 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"reason");
    v5->_unint64_t reason = PKAccountPhysicalCardStatusUpdateReasonFromString(v6);

    uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    v8 = objc_msgSend(v4, "pk_encryptedArrayOfClasses:forKey:", v7, @"physicalCards");
    uint64_t v9 = objc_msgSend(v8, "pk_arrayByApplyingBlock:", &__block_literal_global_220);
    updatedPhysicalCards = v5->_updatedPhysicalCards;
    v5->_updatedPhysicalCards = (NSArray *)v9;
  }
  return v5;
}

PKPhysicalCard *__52__PKAccountPhysicalCardStatusUpdate_initWithRecord___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKPhysicalCard alloc] initWithDictionary:v2];

  return v3;
}

- (void)encodeWithRecord:(id)a3
{
  id v4 = [a3 encryptedValues];
  unint64_t v5 = self->_reason - 1;
  if (v5 > 9) {
    v6 = @"unknown";
  }
  else {
    v6 = off_1E56F55B0[v5];
  }
  id v10 = v4;
  [v4 setObject:v6 forKey:@"reason"];
  uint64_t v7 = [(NSArray *)self->_updatedPhysicalCards pk_arrayByApplyingBlock:&__block_literal_global_67_0];
  v8 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v7 options:0 error:0];
  uint64_t v9 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
  [v10 setObject:v9 forKey:@"physicalCards"];
}

uint64_t __54__PKAccountPhysicalCardStatusUpdate_encodeWithRecord___block_invoke(uint64_t a1, void *a2)
{
  return [a2 jsonDictionaryRepresentation];
}

+ (id)recordType
{
  return @"PhysicalCardStatusUpdate";
}

+ (id)recordNamePrefix
{
  return @"physicalCardStatusUpdate";
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_reason == v4[1])
  {
    updatedPhysicalCards = self->_updatedPhysicalCards;
    v6 = (NSArray *)v4[2];
    if (updatedPhysicalCards && v6) {
      char v7 = -[NSArray isEqual:](updatedPhysicalCards, "isEqual:");
    }
    else {
      char v7 = updatedPhysicalCards == v6;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_updatedPhysicalCards];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_reason - v4 + 32 * v4;

  return v5;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = v3;
  unint64_t v5 = self->_reason - 1;
  if (v5 > 9) {
    v6 = @"unknown";
  }
  else {
    v6 = off_1E56F55B0[v5];
  }
  [v3 appendFormat:@"reason: '%@'; ", v6];
  char v7 = [(NSArray *)self->_updatedPhysicalCards description];
  [v4 appendFormat:@"udpatedPhysicalCards: '%@'; ", v7];

  [v4 appendFormat:@">"];
  return (NSString *)v4;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_unint64_t reason = a3;
}

- (NSArray)updatedPhysicalCards
{
  return self->_updatedPhysicalCards;
}

- (void)setUpdatedPhysicalCards:(id)a3
{
}

- (void).cxx_destruct
{
}

@end