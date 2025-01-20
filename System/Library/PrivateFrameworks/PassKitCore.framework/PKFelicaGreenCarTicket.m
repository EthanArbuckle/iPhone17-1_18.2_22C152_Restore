@interface PKFelicaGreenCarTicket
+ (BOOL)supportsSecureCoding;
- (BOOL)isRefunded;
- (NSData)destinationStation;
- (NSData)originStation;
- (NSNumber)validityStartDate;
- (PKFelicaGreenCarTicket)init;
- (PKFelicaGreenCarTicket)initWithCoder:(id)a3;
- (PKFelicaGreenCarTicket)initWithDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKFelicaGreenCarTicket

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFelicaGreenCarTicket)init
{
  return 0;
}

- (PKFelicaGreenCarTicket)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v20.receiver = self;
    v20.super_class = (Class)PKFelicaGreenCarTicket;
    v5 = [(PKFelicaGreenCarTicket *)&v20 init];
    if (v5)
    {
      v6 = [v4 objectForKeyedSubscript:@"NFStartStationData"];
      uint64_t v7 = [v6 copy];
      originStation = v5->_originStation;
      v5->_originStation = (NSData *)v7;

      v9 = [v4 objectForKeyedSubscript:@"NFEndStationData"];
      uint64_t v10 = [v9 copy];
      destinationStation = v5->_destinationStation;
      v5->_destinationStation = (NSData *)v10;

      v12 = NSNumber;
      v13 = [v4 objectForKeyedSubscript:@"NFPurchaseDate"];
      uint64_t v14 = [v12 numberWithInteger:IntegerFromFelicaDateFormat(v13)];
      validityStartDate = v5->_validityStartDate;
      v5->_validityStartDate = (NSNumber *)v14;

      v16 = [v4 objectForKeyedSubscript:@"NFRefundMonth"];
      if ([v16 unsignedIntegerValue])
      {
        v5->_refunded = 1;
      }
      else
      {
        v18 = [v4 objectForKeyedSubscript:@"NFRefundDay"];
        v5->_refunded = [v18 unsignedIntegerValue] != 0;
      }
    }
    self = v5;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (PKFelicaGreenCarTicket)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKFelicaGreenCarTicket;
  v5 = [(PKFelicaGreenCarTicket *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originStation"];
    originStation = v5->_originStation;
    v5->_originStation = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destinationStation"];
    destinationStation = v5->_destinationStation;
    v5->_destinationStation = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"validityStartDate"];
    validityStartDate = v5->_validityStartDate;
    v5->_validityStartDate = (NSNumber *)v10;

    v5->_refunded = [v4 decodeBoolForKey:@"refunded"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  originStation = self->_originStation;
  id v5 = a3;
  [v5 encodeObject:originStation forKey:@"originStation"];
  [v5 encodeObject:self->_destinationStation forKey:@"destinationStation"];
  [v5 encodeObject:self->_validityStartDate forKey:@"validityStartDate"];
  [v5 encodeBool:self->_refunded forKey:@"refunded"];
}

- (NSData)originStation
{
  return self->_originStation;
}

- (NSData)destinationStation
{
  return self->_destinationStation;
}

- (NSNumber)validityStartDate
{
  return self->_validityStartDate;
}

- (BOOL)isRefunded
{
  return self->_refunded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validityStartDate, 0);
  objc_storeStrong((id *)&self->_destinationStation, 0);
  objc_storeStrong((id *)&self->_originStation, 0);
}

@end