@interface MOUserSafetyScanningPolicy
- (id)_interventionTypeDescription;
- (id)_policyDescription;
- (id)description;
@end

@implementation MOUserSafetyScanningPolicy

- (id)_policyDescription
{
  id v2 = [(MOUserSafetyScanningPolicy *)self policy];
  CFStringRef v3 = @"None";
  if (v2 == (id)1) {
    CFStringRef v3 = @"NudityDetection";
  }
  if (v2 == (id)2) {
    return @"CommunicationSafety";
  }
  else {
    return (id)v3;
  }
}

- (id)_interventionTypeDescription
{
  id v2 = [(MOUserSafetyScanningPolicy *)self interventionType];
  CFStringRef v3 = v2;
  if (!v2) {
    id v2 = @"n/a";
  }
  v4 = v2;

  return v4;
}

- (id)description
{
  CFStringRef v3 = [(MOUserSafetyScanningPolicy *)self _policyDescription];
  v4 = [(MOUserSafetyScanningPolicy *)self _interventionTypeDescription];
  v5 = +[NSString stringWithFormat:@"%@ (%@)", v3, v4];

  return v5;
}

@end