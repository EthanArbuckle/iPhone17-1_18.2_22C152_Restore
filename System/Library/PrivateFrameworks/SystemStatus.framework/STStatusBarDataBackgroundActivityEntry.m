@interface STStatusBarDataBackgroundActivityEntry
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)entryWithBackgroundActivityIdentifier:(id)a3 displayStartDate:(double)a4 detailString:(id)a5;
- (NSString)backgroundActivityIdentifier;
- (NSString)detailString;
- (STStatusBarDataBackgroundActivityEntry)initWithBSXPCCoder:(id)a3;
- (STStatusBarDataBackgroundActivityEntry)initWithCoder:(id)a3;
- (double)displayStartDate;
- (id)_equalsBuilderWithObject:(id)a3;
- (id)_hashBuilder;
- (id)succinctDescriptionBuilder;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusBarDataBackgroundActivityEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailString, 0);

  objc_storeStrong((id *)&self->_backgroundActivityIdentifier, 0);
}

+ (id)entryWithBackgroundActivityIdentifier:(id)a3 displayStartDate:(double)a4 detailString:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (double *)objc_alloc_init((Class)a1);
  uint64_t v11 = [v9 copy];

  v12 = (void *)*((void *)v10 + 2);
  *((void *)v10 + 2) = v11;

  v10[3] = a4;
  uint64_t v13 = [v8 copy];

  v14 = (void *)*((void *)v10 + 4);
  *((void *)v10 + 4) = v13;

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataBackgroundActivityEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_backgroundActivityIdentifier, @"backgroundActivityIdentifier", v5.receiver, v5.super_class);
  [v4 encodeDouble:@"displayStartDate" forKey:self->_displayStartDate];
  [v4 encodeObject:self->_detailString forKey:@"detailString"];
}

- (STStatusBarDataBackgroundActivityEntry)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)STStatusBarDataBackgroundActivityEntry;
  id v3 = a3;
  id v4 = [(STStatusBarDataEntry *)&v11 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"backgroundActivityIdentifier", v11.receiver, v11.super_class);
  backgroundActivityIdentifier = v4->_backgroundActivityIdentifier;
  v4->_backgroundActivityIdentifier = (NSString *)v5;

  [v3 decodeDoubleForKey:@"displayStartDate"];
  v4->_displayStartDate = v7;
  uint64_t v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"detailString"];

  detailString = v4->_detailString;
  v4->_detailString = (NSString *)v8;

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataBackgroundActivityEntry;
  id v3 = [(STStatusBarDataEntry *)&v8 succinctDescriptionBuilder];
  id v4 = [(STStatusBarDataBackgroundActivityEntry *)self backgroundActivityIdentifier];
  uint64_t v5 = STBackgroundActivityIdentifierDescription(v4);
  [v3 appendString:v5 withName:@"backgroundActivityIdentifier"];

  v6 = [(STStatusBarDataBackgroundActivityEntry *)self detailString];
  [v3 appendString:v6 withName:@"detailString"];

  return v3;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)STStatusBarDataBackgroundActivityEntry;
  uint64_t v5 = [(STStatusBarDataEntry *)&v24 _equalsBuilderWithObject:v4];
  id v6 = v4;
  double v7 = [(STStatusBarDataBackgroundActivityEntry *)self backgroundActivityIdentifier];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __67__STStatusBarDataBackgroundActivityEntry__equalsBuilderWithObject___block_invoke;
  v22[3] = &unk_1E6B630A8;
  id v8 = v6;
  id v23 = v8;
  id v9 = (id)[v5 appendString:v7 counterpart:v22];

  [(STStatusBarDataBackgroundActivityEntry *)self displayStartDate];
  double v11 = v10;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__STStatusBarDataBackgroundActivityEntry__equalsBuilderWithObject___block_invoke_2;
  v20[3] = &unk_1E6B63DB0;
  id v12 = v8;
  id v21 = v12;
  id v13 = (id)[v5 appendDouble:v20 counterpart:v11];
  v14 = [(STStatusBarDataBackgroundActivityEntry *)self detailString];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__STStatusBarDataBackgroundActivityEntry__equalsBuilderWithObject___block_invoke_3;
  v18[3] = &unk_1E6B630A8;
  id v19 = v12;
  id v15 = v12;
  id v16 = (id)[v5 appendString:v14 counterpart:v18];

  return v5;
}

uint64_t __67__STStatusBarDataBackgroundActivityEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) backgroundActivityIdentifier];
}

uint64_t __67__STStatusBarDataBackgroundActivityEntry__equalsBuilderWithObject___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) displayStartDate];
}

uint64_t __67__STStatusBarDataBackgroundActivityEntry__equalsBuilderWithObject___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) detailString];
}

- (id)_hashBuilder
{
  v10.receiver = self;
  v10.super_class = (Class)STStatusBarDataBackgroundActivityEntry;
  id v3 = [(STStatusBarDataEntry *)&v10 _hashBuilder];
  id v4 = [(STStatusBarDataBackgroundActivityEntry *)self backgroundActivityIdentifier];
  id v5 = (id)[v3 appendString:v4];

  [(STStatusBarDataBackgroundActivityEntry *)self displayStartDate];
  id v6 = (id)objc_msgSend(v3, "appendDouble:");
  double v7 = [(STStatusBarDataBackgroundActivityEntry *)self detailString];
  id v8 = (id)[v3 appendString:v7];

  return v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataBackgroundActivityEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_backgroundActivityIdentifier, @"backgroundActivityIdentifier", v5.receiver, v5.super_class);
  [v4 encodeDouble:@"displayStartDate" forKey:self->_displayStartDate];
  [v4 encodeObject:self->_detailString forKey:@"detailString"];
}

- (STStatusBarDataBackgroundActivityEntry)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)STStatusBarDataBackgroundActivityEntry;
  objc_super v5 = [(STStatusBarDataEntry *)&v12 initWithBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeStringForKey:@"backgroundActivityIdentifier"];
    backgroundActivityIdentifier = v5->_backgroundActivityIdentifier;
    v5->_backgroundActivityIdentifier = (NSString *)v6;

    [v4 decodeDoubleForKey:@"displayStartDate"];
    v5->_displayStartDate = v8;
    uint64_t v9 = [v4 decodeStringForKey:@"detailString"];
    detailString = v5->_detailString;
    v5->_detailString = (NSString *)v9;
  }
  return v5;
}

- (NSString)backgroundActivityIdentifier
{
  return self->_backgroundActivityIdentifier;
}

- (double)displayStartDate
{
  return self->_displayStartDate;
}

- (NSString)detailString
{
  return self->_detailString;
}

@end