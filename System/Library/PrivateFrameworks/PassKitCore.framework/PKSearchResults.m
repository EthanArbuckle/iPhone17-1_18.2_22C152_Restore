@interface PKSearchResults
+ (BOOL)supportsSecureCoding;
- (NSArray)barcodePassResults;
- (NSArray)categoryResults;
- (NSArray)locationResults;
- (NSArray)merchantResults;
- (NSArray)paymentPassResults;
- (NSArray)personResults;
- (NSArray)suggestedAutocompleteTokens;
- (NSArray)transactionResults;
- (NSArray)transactionTagResults;
- (PKSearchResults)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBarcodePassResults:(id)a3;
- (void)setCategoryResults:(id)a3;
- (void)setLocationResults:(id)a3;
- (void)setMerchantResults:(id)a3;
- (void)setPaymentPassResults:(id)a3;
- (void)setPersonResults:(id)a3;
- (void)setSuggestedAutocompleteTokens:(id)a3;
- (void)setTransactionResults:(id)a3;
- (void)setTransactionTagResults:(id)a3;
@end

@implementation PKSearchResults

- (void)encodeWithCoder:(id)a3
{
  suggestedAutocompleteTokens = self->_suggestedAutocompleteTokens;
  id v5 = a3;
  [v5 encodeObject:suggestedAutocompleteTokens forKey:@"suggestedAutocompleteTokens"];
  [v5 encodeObject:self->_categoryResults forKey:@"categoryResults"];
  [v5 encodeObject:self->_merchantResults forKey:@"merchantResults"];
  [v5 encodeObject:self->_transactionResults forKey:@"transactionResults"];
  [v5 encodeObject:self->_locationResults forKey:@"locationResults"];
  [v5 encodeObject:self->_personResults forKey:@"personResults"];
  [v5 encodeObject:self->_barcodePassResults forKey:@"barcodePassResults"];
  [v5 encodeObject:self->_paymentPassResults forKey:@"paymentPassResults"];
  [v5 encodeObject:self->_transactionTagResults forKey:@"transactionTagResults"];
}

- (PKSearchResults)initWithCoder:(id)a3
{
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)PKSearchResults;
  id v5 = [(PKSearchResults *)&v61 init];
  if (v5)
  {
    v60 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v59 = objc_opt_class();
    uint64_t v58 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v60, "setWithObjects:", v59, v58, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"suggestedAutocompleteTokens"];
    suggestedAutocompleteTokens = v5->_suggestedAutocompleteTokens;
    v5->_suggestedAutocompleteTokens = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"categoryResults"];
    categoryResults = v5->_categoryResults;
    v5->_categoryResults = (NSArray *)v20;

    v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"merchantResults"];
    merchantResults = v5->_merchantResults;
    v5->_merchantResults = (NSArray *)v25;

    v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"transactionResults"];
    transactionResults = v5->_transactionResults;
    v5->_transactionResults = (NSArray *)v30;

    v32 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v33 = objc_opt_class();
    v34 = objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"locationResults"];
    locationResults = v5->_locationResults;
    v5->_locationResults = (NSArray *)v35;

    v37 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v38 = objc_opt_class();
    v39 = objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
    uint64_t v40 = [v4 decodeObjectOfClasses:v39 forKey:@"personResults"];
    personResults = v5->_personResults;
    v5->_personResults = (NSArray *)v40;

    v42 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v43 = objc_opt_class();
    v44 = objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
    uint64_t v45 = [v4 decodeObjectOfClasses:v44 forKey:@"transactionTagResults"];
    transactionTagResults = v5->_transactionTagResults;
    v5->_transactionTagResults = (NSArray *)v45;

    v47 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v48 = objc_opt_class();
    v49 = objc_msgSend(v47, "setWithObjects:", v48, objc_opt_class(), 0);
    uint64_t v50 = [v4 decodeObjectOfClasses:v49 forKey:@"barcodePassResults"];
    barcodePassResults = v5->_barcodePassResults;
    v5->_barcodePassResults = (NSArray *)v50;

    v52 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v53 = objc_opt_class();
    v54 = objc_msgSend(v52, "setWithObjects:", v53, objc_opt_class(), 0);
    uint64_t v55 = [v4 decodeObjectOfClasses:v54 forKey:@"paymentPassResults"];
    paymentPassResults = v5->_paymentPassResults;
    v5->_paymentPassResults = (NSArray *)v55;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(NSArray *)self->_suggestedAutocompleteTokens description];
  [v3 appendFormat:@"tokens: '%@'; ", v4];

  id v5 = [(NSArray *)self->_categoryResults description];
  [v3 appendFormat:@"categoryResults: '%@'; ", v5];

  uint64_t v6 = [(NSArray *)self->_merchantResults description];
  [v3 appendFormat:@"merchantResults: '%@'; ", v6];

  uint64_t v7 = [(NSArray *)self->_transactionResults description];
  [v3 appendFormat:@"transactionResults: '%@'; ", v7];

  uint64_t v8 = [(NSArray *)self->_locationResults description];
  [v3 appendFormat:@"locationResults: '%@'; ", v8];

  uint64_t v9 = [(NSArray *)self->_personResults description];
  [v3 appendFormat:@"personResults: '%@'; ", v9];

  uint64_t v10 = [(NSArray *)self->_barcodePassResults description];
  [v3 appendFormat:@"barcodePassResults: '%@'; ", v10];

  uint64_t v11 = [(NSArray *)self->_paymentPassResults description];
  [v3 appendFormat:@"paymentPassResults: '%@'; ", v11];

  uint64_t v12 = [(NSArray *)self->_transactionTagResults description];
  [v3 appendFormat:@"transactionTagResults: '%@'; ", v12];

  [v3 appendFormat:@">"];
  return v3;
}

- (NSArray)suggestedAutocompleteTokens
{
  return self->_suggestedAutocompleteTokens;
}

- (void)setSuggestedAutocompleteTokens:(id)a3
{
}

- (NSArray)paymentPassResults
{
  return self->_paymentPassResults;
}

- (void)setPaymentPassResults:(id)a3
{
}

- (NSArray)barcodePassResults
{
  return self->_barcodePassResults;
}

- (void)setBarcodePassResults:(id)a3
{
}

- (NSArray)categoryResults
{
  return self->_categoryResults;
}

- (void)setCategoryResults:(id)a3
{
}

- (NSArray)merchantResults
{
  return self->_merchantResults;
}

- (void)setMerchantResults:(id)a3
{
}

- (NSArray)transactionResults
{
  return self->_transactionResults;
}

- (void)setTransactionResults:(id)a3
{
}

- (NSArray)personResults
{
  return self->_personResults;
}

- (void)setPersonResults:(id)a3
{
}

- (NSArray)locationResults
{
  return self->_locationResults;
}

- (void)setLocationResults:(id)a3
{
}

- (NSArray)transactionTagResults
{
  return self->_transactionTagResults;
}

- (void)setTransactionTagResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionTagResults, 0);
  objc_storeStrong((id *)&self->_locationResults, 0);
  objc_storeStrong((id *)&self->_personResults, 0);
  objc_storeStrong((id *)&self->_transactionResults, 0);
  objc_storeStrong((id *)&self->_merchantResults, 0);
  objc_storeStrong((id *)&self->_categoryResults, 0);
  objc_storeStrong((id *)&self->_barcodePassResults, 0);
  objc_storeStrong((id *)&self->_paymentPassResults, 0);
  objc_storeStrong((id *)&self->_suggestedAutocompleteTokens, 0);
}

@end