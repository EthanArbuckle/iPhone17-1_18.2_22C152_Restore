@interface PNRPhoneNumberResolutionResult
- (NSString)locationName;
- (PNRPhoneNumberResolutionResult)initWithLocationName:(id)a3 locationDataSource:(int64_t)a4;
- (int64_t)dataSource;
@end

@implementation PNRPhoneNumberResolutionResult

- (PNRPhoneNumberResolutionResult)initWithLocationName:(id)a3 locationDataSource:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PNRPhoneNumberResolutionResult;
  v8 = [(PNRPhoneNumberResolutionResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locationName, a3);
    v9->_dataSource = a4;
  }

  return v9;
}

- (NSString)locationName
{
  return self->_locationName;
}

- (int64_t)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
}

@end