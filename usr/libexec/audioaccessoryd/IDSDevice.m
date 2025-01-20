@interface IDSDevice
- (id)cpDescription;
- (id)deviceTypeToString;
@end

@implementation IDSDevice

- (id)cpDescription
{
  v3 = [(IDSDevice *)self name];
  uint64_t v4 = [(IDSDevice *)self uniqueID];
  v5 = (void *)v4;
  if (v4) {
    CFStringRef v6 = (const __CFString *)v4;
  }
  else {
    CFStringRef v6 = @"unknown ID";
  }
  v7 = [(IDSDevice *)self nsuuid];
  v8 = +[NSString stringWithFormat:@"\"%@\" (%@), BT: (%@)", v3, v6, v7];

  return v8;
}

- (id)deviceTypeToString
{
  id v2 = [(IDSDevice *)self deviceType];
  if ((unint64_t)v2 > 8) {
    return @"NotDefined";
  }
  else {
    return (id)*((void *)&off_100235A38 + (void)v2);
  }
}

@end