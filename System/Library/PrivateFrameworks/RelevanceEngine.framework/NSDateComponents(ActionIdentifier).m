@interface NSDateComponents(ActionIdentifier)
- (uint64_t)re_actionIdentifierHashValue;
@end

@implementation NSDateComponents(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  if ([a1 year] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v2 = 0;
  }
  else
  {
    v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "year"));
    uint64_t v2 = objc_msgSend(v3, "re_actionIdentifierHashValue");
  }
  if ([a1 month] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = 0;
  }
  else
  {
    v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "month"));
    uint64_t v4 = objc_msgSend(v5, "re_actionIdentifierHashValue");
  }
  if ([a1 day] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 0;
  }
  else
  {
    v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "day"));
    uint64_t v6 = objc_msgSend(v7, "re_actionIdentifierHashValue");
  }
  if ([a1 hour] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = 0;
  }
  else
  {
    v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "hour"));
    uint64_t v8 = objc_msgSend(v9, "re_actionIdentifierHashValue");
  }
  if ([a1 minute] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = 0;
  }
  else
  {
    v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "minute"));
    uint64_t v10 = objc_msgSend(v11, "re_actionIdentifierHashValue");
  }
  if ([a1 second] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = 0;
  }
  else
  {
    v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "second"));
    uint64_t v12 = objc_msgSend(v13, "re_actionIdentifierHashValue");
  }
  return v4 ^ v2 ^ v6 ^ v8 ^ v10 ^ v12;
}

@end