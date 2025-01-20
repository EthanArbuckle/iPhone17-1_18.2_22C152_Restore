@interface PKAccountDailyCashDestinationsSummary
+ (BOOL)supportsSecureCoding;
- (NSArray)destinations;
- (NSString)localizedFooterText;
- (NSString)localizedTitle;
- (PKAccountDailyCashDestinationsSummary)initWithCoder:(id)a3;
- (PKAccountDailyCashDestinationsSummary)initWithDestinations:(id)a3 localizedTitle:(id)a4 localizedFooterText:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKAccountDailyCashDestinationsSummary

- (PKAccountDailyCashDestinationsSummary)initWithDestinations:(id)a3 localizedTitle:(id)a4 localizedFooterText:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountDailyCashDestinationsSummary;
  v12 = [(PKAccountDailyCashDestinationsSummary *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_destinations, a3);
    objc_storeStrong((id *)&v13->_localizedTitle, a4);
    objc_storeStrong((id *)&v13->_localizedFooterText, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountDailyCashDestinationsSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountDailyCashDestinationsSummary;
  v5 = [(PKAccountDailyCashDestinationsSummary *)&v16 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"destinations"];
    destinations = v5->_destinations;
    v5->_destinations = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedFooterText"];
    localizedFooterText = v5->_localizedFooterText;
    v5->_localizedFooterText = (NSString *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  destinations = self->_destinations;
  id v5 = a3;
  [v5 encodeObject:destinations forKey:@"destinations"];
  [v5 encodeObject:self->_localizedTitle forKey:@"localizedTitle"];
  [v5 encodeObject:self->_localizedFooterText forKey:@"localizedFooterText"];
}

- (NSArray)destinations
{
  return self->_destinations;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedFooterText
{
  return self->_localizedFooterText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedFooterText, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
}

@end