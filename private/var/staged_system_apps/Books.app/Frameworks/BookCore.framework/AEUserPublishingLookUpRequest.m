@interface AEUserPublishingLookUpRequest
+ (BOOL)isEnabled;
+ (id)_keyProfileFromAEKeyProfile:(id)a3;
+ (id)resultsDictionaryFromLookupResult:(id)a3;
- (AEUserPublishingLookUpRequest)initWithAdamIDs:(id)a3 keyProfile:(id)a4;
- (AMSLookup)lookup;
- (AMSPromise)lookupResultPromise;
- (NSArray)itemIdentifiers;
- (id)resultWithTimeout:(double)a3 Error:(id *)a4;
- (void)cancel;
- (void)setItemIdentifiers:(id)a3;
- (void)setLookup:(id)a3;
- (void)setLookupResultPromise:(id)a3;
- (void)startWithLookupBlock:(id)a3;
@end

@implementation AEUserPublishingLookUpRequest

+ (id)_keyProfileFromAEKeyProfile:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"kAEUserPublishingLookProfileURL"])
  {
    v4 = (id *)&AMSLookupKeyProfileURL;
LABEL_7:
    v5 = (__CFString *)*v4;
    goto LABEL_8;
  }
  if ([v3 isEqualToString:@"kAEUserPublishingLookProfileProduct"])
  {
    v4 = (id *)&AMSLookupKeyProfileProduct;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"kAEUserPublishingLookProfileLockUp"])
  {
    v4 = (id *)&AMSLookupKeyProfileLockup;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"kAEUserPublishingLookProfileDescriptionLockUp"]) {
    v5 = @"description-lockup";
  }
  else {
    v5 = 0;
  }
LABEL_8:

  return v5;
}

+ (BOOL)isEnabled
{
  return NSClassFromString(@"AMSLookup") != 0;
}

+ (id)resultsDictionaryFromLookupResult:(id)a3
{
  return _[a3 valueForProperty:AMSLookupPropertyResults];
}

- (AEUserPublishingLookUpRequest)initWithAdamIDs:(id)a3 keyProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(AEUserPublishingLookUpRequest *)self init];
  if (v8)
  {
    Class v9 = NSClassFromString(@"AMSLookup");
    if (v9)
    {
      v10 = v9;
      v11 = +[BUBag defaultBag];
      v12 = +[NSBundle mainBundle];
      v13 = [v12 bundleIdentifier];

      v14 = [(id)objc_opt_class() _keyProfileFromAEKeyProfile:v7];
      v15 = (AMSLookup *)[[v10 alloc] initWithBag:v11 caller:v13 keyProfile:v14];
      lookup = v8->_lookup;
      v8->_lookup = v15;

      v17 = (NSArray *)[v6 copy];
      itemIdentifiers = v8->_itemIdentifiers;
      v8->_itemIdentifiers = v17;
    }
  }

  return v8;
}

- (void)cancel
{
  id v2 = [(AEUserPublishingLookUpRequest *)self lookupResultPromise];
  [v2 cancel];
}

- (void)startWithLookupBlock:(id)a3
{
  id v4 = a3;
  v5 = [(AEUserPublishingLookUpRequest *)self lookup];
  id v6 = [(AEUserPublishingLookUpRequest *)self itemIdentifiers];
  id v7 = [v5 performLookupWithBundleIdentifiers:0 itemIdentifiers:v6];
  [(AEUserPublishingLookUpRequest *)self setLookupResultPromise:v7];

  objc_initWeak(&location, self);
  v8 = [(AEUserPublishingLookUpRequest *)self lookupResultPromise];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_60E78;
  v10[3] = &unk_2C5E20;
  objc_copyWeak(&v12, &location);
  id v9 = v4;
  id v11 = v9;
  [v8 addFinishBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)resultWithTimeout:(double)a3 Error:(id *)a4
{
  id v7 = [(AEUserPublishingLookUpRequest *)self lookup];
  v8 = [(AEUserPublishingLookUpRequest *)self itemIdentifiers];
  id v9 = [v7 performLookupWithBundleIdentifiers:0 itemIdentifiers:v8];
  [(AEUserPublishingLookUpRequest *)self setLookupResultPromise:v9];

  v10 = [(AEUserPublishingLookUpRequest *)self lookupResultPromise];
  id v11 = [v10 resultWithTimeout:a4 error:a3];

  return v11;
}

- (AMSLookup)lookup
{
  return self->_lookup;
}

- (void)setLookup:(id)a3
{
}

- (AMSPromise)lookupResultPromise
{
  return self->_lookupResultPromise;
}

- (void)setLookupResultPromise:(id)a3
{
}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (void)setItemIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_lookupResultPromise, 0);

  objc_storeStrong((id *)&self->_lookup, 0);
}

@end