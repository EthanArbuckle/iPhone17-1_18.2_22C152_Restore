@interface PKFelicaAppletHistoryRecord
+ (BOOL)supportsSecureCoding;
- (NSNumber)amountType;
- (NSNumber)sectorCombination;
- (NSNumber)transactionType;
- (NSString)transactionID;
- (PKFelicaAppletHistoryRecord)init;
- (PKFelicaAppletHistoryRecord)initWithCoder:(id)a3;
- (PKFelicaAppletHistoryRecord)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAmountType:(id)a3;
- (void)setSectorCombination:(id)a3;
- (void)setTransactionID:(id)a3;
- (void)setTransactionType:(id)a3;
@end

@implementation PKFelicaAppletHistoryRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFelicaAppletHistoryRecord)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKFelicaAppletHistoryRecord;
  return [(PKTransitAppletHistoryRecord *)&v3 initWithDictionary:0];
}

- (PKFelicaAppletHistoryRecord)initWithDictionary:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PKFelicaAppletHistoryRecord;
  v5 = [(PKTransitAppletHistoryRecord *)&v36 initWithDictionary:0];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"NFHistorySequenceNumber"];
    [(PKTransitAppletHistoryRecord *)v5 setHistorySequenceNumber:v6];

    v7 = [v4 objectForKeyedSubscript:@"NFTransactionID"];
    uint64_t v8 = [v7 copy];
    transactionID = v5->_transactionID;
    v5->_transactionID = (NSString *)v8;

    v10 = [v4 objectForKeyedSubscript:@"NFTransactionType"];
    uint64_t v11 = [v10 copy];
    transactionType = v5->_transactionType;
    v5->_transactionType = (NSNumber *)v11;

    v13 = [v4 objectForKeyedSubscript:@"NFSectorCombination"];
    uint64_t v14 = [v13 copy];
    sectorCombination = v5->_sectorCombination;
    v5->_sectorCombination = (NSNumber *)v14;

    v16 = [v4 objectForKeyedSubscript:@"NFAmountType"];
    uint64_t v17 = [v16 copy];
    amountType = v5->_amountType;
    v5->_amountType = (NSNumber *)v17;

    v19 = [v4 objectForKeyedSubscript:@"NFAmount"];
    v20 = [v4 objectForKeyedSubscript:@"NFBalance"];
    if ([(NSNumber *)v5->_amountType integerValue] == 2)
    {
      v21 = (void *)MEMORY[0x1E4F28C28];
      if (v19)
      {
        [v19 decimalValue];
      }
      else
      {
        uint64_t v33 = 0;
        uint64_t v34 = 0;
        LODWORD(v35) = 0;
      }
      v24 = [v21 decimalNumberWithDecimal:&v33];
      [(PKTransitAppletHistoryRecord *)v5 setAmount:v24];

      v25 = (void *)MEMORY[0x1E4F28C28];
      if (v20)
      {
        [v20 decimalValue];
      }
      else
      {
        uint64_t v30 = 0;
        uint64_t v31 = 0;
        LODWORD(v32) = 0;
      }
      uint64_t v23 = [v25 decimalNumberWithDecimal:&v30];
    }
    else
    {
      v22 = PKDecimalAmountFromAmount(v19, @"JPY");
      [(PKTransitAppletHistoryRecord *)v5 setAmount:v22];

      uint64_t v23 = PKDecimalAmountFromAmount(v20, @"JPY");
    }
    v26 = (void *)v23;
    -[PKTransitAppletHistoryRecord setBalance:](v5, "setBalance:", v23, v30, v31, v32, v33, v34, v35);

    v27 = [v4 objectForKeyedSubscript:@"NFStartStationData"];
    [(PKTransitAppletHistoryRecord *)v5 setStartStation:v27];

    v28 = [v4 objectForKeyedSubscript:@"NFEndStationData"];
    [(PKTransitAppletHistoryRecord *)v5 setEndStation:v28];
  }
  return v5;
}

- (PKFelicaAppletHistoryRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKFelicaAppletHistoryRecord;
  v5 = [(PKTransitAppletHistoryRecord *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionID"];
    transactionID = v5->_transactionID;
    v5->_transactionID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"felicaTransactionType"];
    transactionType = v5->_transactionType;
    v5->_transactionType = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sectorCombination"];
    sectorCombination = v5->_sectorCombination;
    v5->_sectorCombination = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amountType"];
    amountType = v5->_amountType;
    v5->_amountType = (NSNumber *)v12;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PKFelicaAppletHistoryRecord;
  v5 = -[PKTransitAppletHistoryRecord copyWithZone:](&v15, sel_copyWithZone_);
  uint64_t v6 = [(NSString *)self->_transactionID copyWithZone:a3];
  v7 = (void *)v5[21];
  v5[21] = v6;

  uint64_t v8 = [(NSNumber *)self->_transactionType copyWithZone:a3];
  v9 = (void *)v5[18];
  v5[18] = v8;

  uint64_t v10 = [(NSNumber *)self->_sectorCombination copyWithZone:a3];
  uint64_t v11 = (void *)v5[19];
  v5[19] = v10;

  uint64_t v12 = [(NSNumber *)self->_amountType copyWithZone:a3];
  v13 = (void *)v5[20];
  v5[20] = v12;

  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKFelicaAppletHistoryRecord;
  [(PKTransitAppletHistoryRecord *)&v2 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKFelicaAppletHistoryRecord;
  id v4 = a3;
  [(PKTransitAppletHistoryRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_transactionID, @"transactionID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_transactionType forKey:@"felicaTransactionType"];
  [v4 encodeObject:self->_sectorCombination forKey:@"sectorCombination"];
  [v4 encodeObject:self->_amountType forKey:@"amountType"];
}

- (NSNumber)transactionType
{
  return self->_transactionType;
}

- (void)setTransactionType:(id)a3
{
}

- (NSNumber)sectorCombination
{
  return self->_sectorCombination;
}

- (void)setSectorCombination:(id)a3
{
}

- (NSNumber)amountType
{
  return self->_amountType;
}

- (void)setAmountType:(id)a3
{
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_amountType, 0);
  objc_storeStrong((id *)&self->_sectorCombination, 0);
  objc_storeStrong((id *)&self->_transactionType, 0);
}

@end