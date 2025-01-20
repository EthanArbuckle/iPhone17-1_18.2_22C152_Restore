@interface PKPayLaterFinancingPlanFundingSourceRow
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldHighlightItem;
- (Class)cellClass;
- (NSCopying)identifier;
- (PKPayLaterFinancingPlanFundingSourceRow)initWithFinancingPlanFundingSource:(id)a3 selectionHandler:(id)a4;
- (unint64_t)hash;
- (void)configureCell:(id)a3;
- (void)handleCellSelection;
@end

@implementation PKPayLaterFinancingPlanFundingSourceRow

- (PKPayLaterFinancingPlanFundingSourceRow)initWithFinancingPlanFundingSource:(id)a3 selectionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPayLaterFinancingPlanFundingSourceRow;
  v9 = [(PKPayLaterFinancingPlanFundingSourceRow *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fundingSource, a3);
    uint64_t v11 = [v8 copy];
    id selectionHandler = v10->_selectionHandler;
    v10->_id selectionHandler = (id)v11;
  }
  return v10;
}

- (NSCopying)identifier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendString:v5];

  fundingSource = self->_fundingSource;
  if (fundingSource)
  {
    id v7 = [(PKPayLaterFinancingPlanFundingSource *)fundingSource identifier];
    [v3 appendString:v7];
  }
  id v8 = (void *)[v3 copy];

  return (NSCopying *)v8;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PKPayLaterFinancingPlanFundingSourceRow *)self cellClass];
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = v5;
    if (self->_selectionHandler)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4FB1518]);
      v9[0] = v7;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
      [v6 setAccessories:v8];
    }
    else
    {
      [v5 setAccessories:0];
    }
    [v6 setFundingSource:self->_fundingSource];
  }
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_fundingSource];
  id v4 = _Block_copy(self->_selectionHandler);
  [v3 safelyAddObject:v4];

  unint64_t v5 = PKCombinedHash();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPayLaterFinancingPlanFundingSourceRow *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (PKEqualObjects())
    {
      id v7 = _Block_copy(self->_selectionHandler);
      id v8 = _Block_copy(v6[2]);
      char v9 = PKEqualObjects();
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)handleCellSelection
{
  id selectionHandler = (void (**)(void))self->_selectionHandler;
  if (selectionHandler) {
    selectionHandler[2]();
  }
}

- (BOOL)shouldHighlightItem
{
  return self->_selectionHandler != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectionHandler, 0);

  objc_storeStrong((id *)&self->_fundingSource, 0);
}

@end