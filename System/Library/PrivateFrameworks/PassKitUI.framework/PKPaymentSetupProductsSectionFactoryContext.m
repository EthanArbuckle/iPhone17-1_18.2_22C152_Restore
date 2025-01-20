@interface PKPaymentSetupProductsSectionFactoryContext
+ (id)contextWithPrimaryRegion:(id)a3 primaryCountryName:(id)a4 secondaryRegion:(id)a5 secondaryCountryName:(id)a6 location:(id)a7;
+ (id)contextWithPrimaryRegion:(id)a3 primaryCountryName:(id)a4 secondaryRegion:(id)a5 secondaryCountryName:(id)a6 location:(id)a7 tokenizerCharacterSet:(id)a8;
- (CLLocation)location;
- (NSCharacterSet)tokenizerCharacterSet;
- (NSString)primaryCountryName;
- (NSString)primaryRegion;
- (NSString)secondaryCountryName;
- (NSString)secondaryRegion;
- (PKPaymentSetupProductsSectionFactoryContext)initWithPrimaryRegion:(id)a3 primaryCountryName:(id)a4 secondaryRegion:(id)a5 secondaryCountryName:(id)a6 location:(id)a7 tokenizerCharacterSet:(id)a8;
- (id)description;
@end

@implementation PKPaymentSetupProductsSectionFactoryContext

+ (id)contextWithPrimaryRegion:(id)a3 primaryCountryName:(id)a4 secondaryRegion:(id)a5 secondaryCountryName:(id)a6 location:(id)a7
{
  return (id)[a1 contextWithPrimaryRegion:a3 primaryCountryName:a4 secondaryRegion:a5 secondaryCountryName:a6 location:a7 tokenizerCharacterSet:0];
}

+ (id)contextWithPrimaryRegion:(id)a3 primaryCountryName:(id)a4 secondaryRegion:(id)a5 secondaryCountryName:(id)a6 location:(id)a7 tokenizerCharacterSet:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = (void *)[objc_alloc((Class)a1) initWithPrimaryRegion:v19 primaryCountryName:v18 secondaryRegion:v17 secondaryCountryName:v16 location:v15 tokenizerCharacterSet:v14];

  return v20;
}

- (PKPaymentSetupProductsSectionFactoryContext)initWithPrimaryRegion:(id)a3 primaryCountryName:(id)a4 secondaryRegion:(id)a5 secondaryCountryName:(id)a6 location:(id)a7 tokenizerCharacterSet:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PKPaymentSetupProductsSectionFactoryContext;
  id v18 = [(PKPaymentSetupProductsSectionFactoryContext *)&v24 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_primaryRegion, a3);
    objc_storeStrong((id *)&v19->_primaryCountryName, a4);
    objc_storeStrong((id *)&v19->_secondaryRegion, a5);
    objc_storeStrong((id *)&v19->_secondaryCountryName, a6);
    objc_storeStrong((id *)&v19->_location, a7);
    objc_storeStrong((id *)&v19->_tokenizerCharacterSet, a8);
  }

  return v19;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"primaryRegion: '%@'; ", self->_primaryRegion];
  [v6 appendFormat:@"secondaryRegion: '%@'; ", self->_secondaryRegion];
  [v6 appendFormat:@"location: '%@'; ", self->_location];
  [v6 appendFormat:@">"];
  v7 = [NSString stringWithString:v6];

  return v7;
}

- (NSString)primaryRegion
{
  return self->_primaryRegion;
}

- (NSString)primaryCountryName
{
  return self->_primaryCountryName;
}

- (NSString)secondaryRegion
{
  return self->_secondaryRegion;
}

- (NSString)secondaryCountryName
{
  return self->_secondaryCountryName;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSCharacterSet)tokenizerCharacterSet
{
  return self->_tokenizerCharacterSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizerCharacterSet, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_secondaryCountryName, 0);
  objc_storeStrong((id *)&self->_secondaryRegion, 0);
  objc_storeStrong((id *)&self->_primaryCountryName, 0);

  objc_storeStrong((id *)&self->_primaryRegion, 0);
}

@end