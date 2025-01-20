@interface PXPeopleSwiftUtilities
+ (id)fetchAddPeopleCandidatesIn:(id)a3;
+ (id)fetchAllSocialGroupDetailedDebugDescriptionFor:(id)a3;
+ (int64_t)currentSortOrderFor:(id)a3;
+ (int64_t)rawValueFor:(int64_t)a3;
+ (int64_t)sortOrderFor:(int64_t)a3;
+ (void)setWithSortOrder:(int64_t)a3 to:(id)a4;
@end

@implementation PXPeopleSwiftUtilities

+ (id)fetchAllSocialGroupDetailedDebugDescriptionFor:(id)a3
{
  id v3 = a3;
  sub_1A9D5CCD4(v3);

  v4 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  return v4;
}

+ (int64_t)currentSortOrderFor:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, sel_px_localDefaults);
  id v5 = objc_msgSend(v4, sel_numberForKey_, @"PXPeopleHomeSortingType");
  if (v5)
  {
    id v6 = v5;
    int64_t v7 = sub_1A9D5D280((unint64_t)objc_msgSend(v5, sel_integerValue));

    id v3 = v4;
    id v4 = v6;
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

+ (void)setWithSortOrder:(int64_t)a3 to:(id)a4
{
  id v5 = a4;
  sub_1A9D5D63C(a3, v5);
}

+ (int64_t)sortOrderFor:(int64_t)a3
{
  return sub_1A9D5D280(a3);
}

+ (int64_t)rawValueFor:(int64_t)a3
{
  return sub_1A9D5D49C(a3);
}

+ (id)fetchAddPeopleCandidatesIn:(id)a3
{
  id v3 = a3;
  id v4 = sub_1A9D5D78C(v3);
  id v6 = v5;
  v8 = v7;

  return v4;
}

@end