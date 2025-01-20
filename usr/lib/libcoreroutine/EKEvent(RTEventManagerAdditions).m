@interface EKEvent(RTEventManagerAdditions)
+ (__CFString)participationStatusToString:()RTEventManagerAdditions;
- (id)description;
- (uint64_t)participantStatus;
@end

@implementation EKEvent(RTEventManagerAdditions)

+ (__CFString)participationStatusToString:()RTEventManagerAdditions
{
  if (a3 > 7) {
    return @"Unhandled";
  }
  else {
    return off_1E6B9C528[a3];
  }
}

- (uint64_t)participantStatus
{
  uint64_t result = [a1 participationStatus];
  if ((unint64_t)(result - 1) >= 7) {
    return 0;
  }
  return result;
}

- (id)description
{
  v15 = NSString;
  v16 = [a1 title];
  if (v16) {
    v2 = @"YES";
  }
  else {
    v2 = @"NO";
  }
  v14 = v2;
  v3 = [a1 location];
  if (v3) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  v5 = [a1 structuredLocation];
  if (v5) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v7 = [a1 startDate];
  v8 = [v7 stringFromDate];
  v9 = [a1 endDate];
  v10 = [v9 stringFromDate];
  v11 = [objc_opt_class() participationStatusToString:[a1 participationStatus]];
  v12 = [v15 stringWithFormat:@"title, %@, location, %@, structuredLocation, %@, startDate, %@, endDate, %@, participationStatus, %@", v14, v4, v6, v8, v10, v11];

  return v12;
}

@end