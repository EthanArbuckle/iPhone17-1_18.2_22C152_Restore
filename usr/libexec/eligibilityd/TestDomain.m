@interface TestDomain
+ (BOOL)supportsSecureCoding;
- (BOOL)computeWithError:(id *)a3;
- (TestDomain)init;
- (TestDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (id)expectedCountryCode;
- (unint64_t)domain;
- (void)updateParameters;
@end

@implementation TestDomain

- (BOOL)computeWithError:(id *)a3
{
  BOOL v4 = [(EligibilityDomain *)self computeAnswerFromStatusWithError:a3];
  if (v4)
  {
    v5 = [(TestDomain *)self expectedCountryCode];
    unint64_t v6 = [(EligibilityDomain *)self answer];
    if (v5)
    {
      unint64_t v7 = v6;
      if (v6 != 4)
      {
        v8 = sub_10000CF70(v6);
        v9 = +[NSString stringWithFormat:@"os_eligibility has returned an eligibility result of %@ for you being in region - %@. If this is not expected, please file a bug.", v8, v5];

        v10 = sub_10000CF70(v7);
        v11 = +[NSString stringWithFormat:@"Expected eligibility didn't match: %@", v10];

        v12 = +[InputManager sharedInstance];
        v13 = [v12 objectForInputValue:1];
        v14 = [v12 objectForInputValue:2];
        v15 = sub_10000CF70(v7);
        v16 = +[NSString stringWithFormat:@"The TEST domain reported = %@ even though it was expecting a country code of: %@.\nThe current state of the device is:\nLocated Country = %@\nBilling Country = %@\n", v15, v5, v13, v14];

        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100024C38;
        v21[3] = &unk_100039098;
        v22 = @"OS Eligibility has changed";
        id v23 = v9;
        id v24 = v11;
        id v25 = v16;
        id v17 = v16;
        id v18 = v11;
        id v19 = v9;
        sub_100018B7C(&_dispatch_main_q, v21);
      }
    }
  }
  return v4;
}

- (void)updateParameters
{
  uint64_t v3 = [(TestDomain *)self expectedCountryCode];
  if (v3)
  {
    BOOL v4 = +[NSSet setWithObject:v3];
    [(EligibilityDomain *)self setLocatedCountriesOfInterest:v4];
    [(EligibilityDomain *)self setBillingCountriesOfInterest:v4];
  }

  _objc_release_x1();
}

- (id)expectedCountryCode
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.eligibilityd"];
  uint64_t v3 = [v2 stringForKey:@"ExpectedCountryCode"];

  return v3;
}

- (TestDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TestDomain;
  uint64_t v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  BOOL v4 = v3;
  if (v3) {
    [(TestDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (TestDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)TestDomain;
  id v2 = [(EligibilityDomain *)&v5 init];
  uint64_t v3 = v2;
  if (v2) {
    [(TestDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.test";
}

- (unint64_t)domain
{
  return 120;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end