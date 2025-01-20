@interface CNContact(TUSearchResultsAdditions)
- (__CFString)isoCountryCode;
- (id)handles;
- (uint64_t)displayName;
- (uint64_t)mostRecentCallType;
- (uint64_t)mostRecentCallWasMissed;
@end

@implementation CNContact(TUSearchResultsAdditions)

- (uint64_t)displayName
{
  return [MEMORY[0x1E4F1B910] stringFromContact:a1 style:0];
}

- (__CFString)isoCountryCode
{
  return &stru_1EECEA668;
}

- (id)handles
{
  v2 = [a1 phoneNumberStrings];
  v3 = [a1 emailAddressStrings];
  v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

- (uint64_t)mostRecentCallType
{
  return 3;
}

- (uint64_t)mostRecentCallWasMissed
{
  return 0;
}

@end