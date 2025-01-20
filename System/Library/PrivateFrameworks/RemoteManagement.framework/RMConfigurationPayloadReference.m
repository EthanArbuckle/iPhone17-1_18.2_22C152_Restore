@interface RMConfigurationPayloadReference
- (id)reportDetails;
@end

@implementation RMConfigurationPayloadReference

- (id)reportDetails
{
  v15[0] = @"activation";
  v3 = [(RMConfigurationPayloadReference *)self activation];
  uint64_t v4 = [v3 identifier];
  v5 = (void *)v4;
  if (v4) {
    CFStringRef v6 = (const __CFString *)v4;
  }
  else {
    CFStringRef v6 = @"(not present)";
  }
  v16[0] = v6;
  v15[1] = @"configuration";
  v7 = [(RMConfigurationPayloadReference *)self configuration];
  uint64_t v8 = [v7 identifier];
  v9 = (void *)v8;
  if (v8) {
    CFStringRef v10 = (const __CFString *)v8;
  }
  else {
    CFStringRef v10 = @"(not present)";
  }
  v16[1] = v10;
  v15[2] = @"configurationIdentifier";
  v11 = [(RMConfigurationPayloadReference *)self configurationIdentifier];
  v16[2] = v11;
  v15[3] = @"required";
  v12 = +[NSNumber numberWithBool:[(RMConfigurationPayloadReference *)self required]];
  v16[3] = v12;
  v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];

  return v13;
}

@end