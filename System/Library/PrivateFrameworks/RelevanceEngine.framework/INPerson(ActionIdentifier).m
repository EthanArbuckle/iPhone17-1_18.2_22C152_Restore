@interface INPerson(ActionIdentifier)
- (uint64_t)re_actionIdentifierHashValue;
@end

@implementation INPerson(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  v2 = [a1 personHandle];

  if (v2)
  {
    v3 = [a1 personHandle];
  }
  else
  {
    v4 = [a1 contactIdentifier];

    if (v4) {
      [a1 contactIdentifier];
    }
    else {
    v3 = [a1 customIdentifier];
    }
  }
  v5 = v3;
  uint64_t v6 = objc_msgSend(v3, "re_actionIdentifierHashValue");

  return v6;
}

@end