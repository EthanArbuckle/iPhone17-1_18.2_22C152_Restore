@interface PHACoreDuetDatasetSample
- (NSDate)date;
- (NSString)identifier;
- (NSString)subset;
- (PHACoreDuetDatasetSample)initWithIdentifier:(id)a3 andDate:(id)a4 forSubset:(id)a5;
- (void)setDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSubset:(id)a3;
@end

@implementation PHACoreDuetDatasetSample

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subset, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setSubset:(id)a3
{
}

- (NSString)subset
{
  return self->_subset;
}

- (void)setDate:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (PHACoreDuetDatasetSample)initWithIdentifier:(id)a3 andDate:(id)a4 forSubset:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (__CFString *)a5;
  v15.receiver = self;
  v15.super_class = (Class)PHACoreDuetDatasetSample;
  v11 = [(PHACoreDuetDatasetSample *)&v15 init];
  v12 = v11;
  if (v11)
  {
    [(PHACoreDuetDatasetSample *)v11 setIdentifier:v8];
    [(PHACoreDuetDatasetSample *)v12 setDate:v9];
    if (v10) {
      v13 = v10;
    }
    else {
      v13 = &stru_1F2900940;
    }
    [(PHACoreDuetDatasetSample *)v12 setSubset:v13];
  }

  return v12;
}

@end