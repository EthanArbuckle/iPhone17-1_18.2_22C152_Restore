@interface PKCreditAccountRates
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDecimalNumber)aprForPurchases;
- (PKCreditAccountRates)initWithCoder:(id)a3;
- (PKCreditAccountRates)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedAPRForPurchasesPercentageString;
- (id)jsonDictionaryRepresentation;
- (id)jsonString;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAprForPurchases:(id)a3;
@end

@implementation PKCreditAccountRates

- (PKCreditAccountRates)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKCreditAccountRates;
  v5 = [(PKCreditAccountRates *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKDecimalNumberFromStringForKey:@"aprForPurchase"];
    aprForPurchases = v5->_aprForPurchases;
    v5->_aprForPurchases = (NSDecimalNumber *)v6;
  }
  return v5;
}

- (id)formattedAPRForPurchasesPercentageString
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v3 setNumberStyle:3];
  if (([(NSDecimalNumber *)self->_aprForPurchases pk_isIntegralNumber] & 1) == 0) {
    [v3 setMinimumFractionDigits:2];
  }
  id v4 = [v3 stringFromNumber:self->_aprForPurchases];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditAccountRates)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKCreditAccountRates;
  v5 = [(PKCreditAccountRates *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"aprForPurchase"];
    aprForPurchases = v5->_aprForPurchases;
    v5->_aprForPurchases = (NSDecimalNumber *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(NSDecimalNumber *)self->_aprForPurchases stringValue];
  [v3 appendFormat:@"aprForPurchases: '%@'; ", v4];

  [v3 appendFormat:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    aprForPurchases = self->_aprForPurchases;
    uint64_t v6 = (NSDecimalNumber *)v4[1];
    if (aprForPurchases && v6) {
      char v7 = -[NSDecimalNumber isEqual:](aprForPurchases, "isEqual:");
    }
    else {
      char v7 = aprForPurchases == v6;
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
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_aprForPurchases];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[PKCreditAccountRates allocWithZone:](PKCreditAccountRates, "allocWithZone:") init];
  uint64_t v6 = [(NSDecimalNumber *)self->_aprForPurchases copyWithZone:a3];
  aprForPurchases = v5->_aprForPurchases;
  v5->_aprForPurchases = (NSDecimalNumber *)v6;

  return v5;
}

- (id)jsonDictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v4 = [(NSDecimalNumber *)self->_aprForPurchases stringValue];
  [v3 setObject:v4 forKeyedSubscript:@"aprForPurchase"];

  v5 = (void *)[v3 copy];
  return v5;
}

- (id)jsonString
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28D90];
  id v3 = [(PKCreditAccountRates *)self jsonDictionaryRepresentation];
  id v9 = 0;
  unint64_t v4 = [v2 dataWithJSONObject:v3 options:2 error:&v9];
  id v5 = v9;

  if (v5)
  {
    uint64_t v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Error forming json dictionary for CloudKit with error: %@", buf, 0xCu);
    }

    char v7 = 0;
  }
  else
  {
    char v7 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
  }

  return v7;
}

- (NSDecimalNumber)aprForPurchases
{
  return self->_aprForPurchases;
}

- (void)setAprForPurchases:(id)a3
{
}

- (void).cxx_destruct
{
}

@end