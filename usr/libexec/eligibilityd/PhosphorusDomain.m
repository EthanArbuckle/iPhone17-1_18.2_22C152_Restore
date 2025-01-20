@interface PhosphorusDomain
+ (BOOL)supportsSecureCoding;
- (BOOL)computeWithError:(id *)a3;
- (BOOL)shouldSaveToDisk;
- (PhosphorusDomain)init;
- (PhosphorusDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (id)status;
- (unint64_t)domain;
@end

@implementation PhosphorusDomain

- (BOOL)computeWithError:(id *)a3
{
  v5 = +[InputManager sharedInstance];
  v6 = [v5 objectForInputValue:2];
  v7 = [v6 countryCode];
  [(EligibilityDomain *)self addContextForKey:@"OS_ELIGIBILITY_CONTEXT_COUNTRY_BILLING" value:v7];

  LOBYTE(a3) = [(EligibilityDomain *)self computeAnswerFromStatusWithError:a3];
  return (char)a3;
}

- (id)status
{
  v16 = +[MobileAssetManager sharedInstance];
  v3 = [v16 phosphorusAsset];
  [v3 policies];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v21;
    v9 = &selRef_hasExternalBootDrive;
    while (2)
    {
      v10 = 0;
      v11 = v9[226];
      v12 = v7;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v10);
        [(EligibilityDomain *)self resetInputsOfInterest];
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100005F18;
        v18[3] = &unk_100038A28;
        v18[4] = self;
        id v19 = v3;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        v17.receiver = self;
        v17.super_class = (Class)PhosphorusDomain;
        v7 = [super v11];

        if ((id)[(EligibilityDomain *)self computeAnswerFromStatus:v7] == (id)4)
        {
          id v14 = v7;

          goto LABEL_13;
        }

        v10 = (char *)v10 + 1;
        v12 = v7;
      }
      while (v6 != v10);
      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      v9 = &selRef_hasExternalBootDrive;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    v7 = 0;
  }

  id v14 = v7;
LABEL_13:

  return v14;
}

- (PhosphorusDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PhosphorusDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(PhosphorusDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (PhosphorusDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)PhosphorusDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PhosphorusDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (BOOL)shouldSaveToDisk
{
  return 1;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.phosphorus";
}

- (unint64_t)domain
{
  return 16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end