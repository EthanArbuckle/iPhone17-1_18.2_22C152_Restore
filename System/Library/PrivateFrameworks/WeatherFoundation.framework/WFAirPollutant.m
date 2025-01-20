@interface WFAirPollutant
+ (BOOL)supportsSecureCoding;
- (NSString)localizedCategoryDescription;
- (NSString)localizedDescription;
- (NSString)localizedName;
- (NSString)unit;
- (WFAirPollutant)initWithCoder:(id)a3;
- (double)amount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)categoryIndex;
- (unint64_t)index;
- (void)encodeWithCoder:(id)a3;
- (void)setAmount:(double)a3;
- (void)setCategoryIndex:(unint64_t)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setLocalizedCategoryDescription:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setUnit:(id)a3;
@end

@implementation WFAirPollutant

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFAirPollutant)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)WFAirPollutant;
  v5 = [(WFAirPollutant *)&v27 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_localizedName);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_localizedDescription);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v12;

    v14 = NSStringFromSelector(sel_amount);
    [v4 decodeDoubleForKey:v14];
    v5->_amount = v15;

    uint64_t v16 = objc_opt_class();
    v17 = NSStringFromSelector(sel_unit);
    uint64_t v18 = [v4 decodeObjectOfClass:v16 forKey:v17];
    unit = v5->_unit;
    v5->_unit = (NSString *)v18;

    uint64_t v20 = objc_opt_class();
    v21 = NSStringFromSelector(sel_localizedCategoryDescription);
    uint64_t v22 = [v4 decodeObjectOfClass:v20 forKey:v21];
    localizedCategoryDescription = v5->_localizedCategoryDescription;
    v5->_localizedCategoryDescription = (NSString *)v22;

    v24 = NSStringFromSelector(sel_categoryIndex);
    v5->_categoryIndex = [v4 decodeIntegerForKey:v24];

    v25 = NSStringFromSelector(sel_index);
    v5->_index = [v4 decodeIntegerForKey:v25];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFAirPollutant *)self localizedName];
  uint64_t v6 = NSStringFromSelector(sel_localizedName);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(WFAirPollutant *)self localizedDescription];
  uint64_t v8 = NSStringFromSelector(sel_localizedDescription);
  [v4 encodeObject:v7 forKey:v8];

  [(WFAirPollutant *)self amount];
  double v10 = v9;
  v11 = NSStringFromSelector(sel_amount);
  [v4 encodeDouble:v11 forKey:v10];

  uint64_t v12 = [(WFAirPollutant *)self unit];
  v13 = NSStringFromSelector(sel_unit);
  [v4 encodeObject:v12 forKey:v13];

  v14 = [(WFAirPollutant *)self localizedCategoryDescription];
  double v15 = NSStringFromSelector(sel_localizedCategoryDescription);
  [v4 encodeObject:v14 forKey:v15];

  unint64_t v16 = [(WFAirPollutant *)self categoryIndex];
  v17 = NSStringFromSelector(sel_categoryIndex);
  [v4 encodeInteger:v16 forKey:v17];

  unint64_t v18 = [(WFAirPollutant *)self index];
  NSStringFromSelector(sel_index);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeInteger:v18 forKey:v19];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id v4 = objc_opt_new();
  if (v4)
  {
    v5 = [(WFAirPollutant *)self localizedName];
    [v4 setLocalizedName:v5];

    uint64_t v6 = [(WFAirPollutant *)self localizedDescription];
    [v4 setLocalizedDescription:v6];

    [(WFAirPollutant *)self amount];
    objc_msgSend(v4, "setAmount:");
    v7 = [(WFAirPollutant *)self unit];
    [v4 setUnit:v7];

    uint64_t v8 = [(WFAirPollutant *)self localizedCategoryDescription];
    [v4 setLocalizedCategoryDescription:v8];

    objc_msgSend(v4, "setCategoryIndex:", -[WFAirPollutant categoryIndex](self, "categoryIndex"));
    objc_msgSend(v4, "setIndex:", -[WFAirPollutant index](self, "index"));
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(WFAirPollutant *)self localizedName];
  v5 = [(WFAirPollutant *)self localizedDescription];
  [(WFAirPollutant *)self amount];
  uint64_t v7 = v6;
  uint64_t v8 = [(WFAirPollutant *)self unit];
  double v9 = [(WFAirPollutant *)self localizedCategoryDescription];
  double v10 = [v3 stringWithFormat:@"<WFAirPollutant localizedName: %@, localizedDescription: %@, amount: %f, unit: %@, localizedCategoryDescription: %@, categoryIndex: %lu, index: %lu", v4, v5, v7, v8, v9, -[WFAirPollutant categoryIndex](self, "categoryIndex"), -[WFAirPollutant index](self, "index")];

  return v10;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (double)amount
{
  return self->_amount;
}

- (void)setAmount:(double)a3
{
  self->_amount = a3;
}

- (NSString)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
}

- (NSString)localizedCategoryDescription
{
  return self->_localizedCategoryDescription;
}

- (void)setLocalizedCategoryDescription:(id)a3
{
}

- (unint64_t)categoryIndex
{
  return self->_categoryIndex;
}

- (void)setCategoryIndex:(unint64_t)a3
{
  self->_categoryIndex = a3;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedCategoryDescription, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end