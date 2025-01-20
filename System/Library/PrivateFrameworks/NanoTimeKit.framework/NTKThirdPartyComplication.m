@interface NTKThirdPartyComplication
+ (BOOL)supportsSecureCoding;
- (CLKComplicationDescriptor)clkComplicationDescriptor;
- (NSString)clkClientIdentifier;
- (void)_addKeysToJSONDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKThirdPartyComplication

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKThirdPartyComplication;
  id v4 = a3;
  [(NTKComplication *)&v8 encodeWithCoder:v4];
  v5 = [(NTKComplication *)self appIdentifier];
  [v4 encodeObject:v5 forKey:@"RemoteComplicationAppBundleIdentifierKey"];

  v6 = [(NTKThirdPartyComplication *)self clkClientIdentifier];
  [v4 encodeObject:v6 forKey:@"RemoteComplicationClientIdentifierKey"];

  v7 = [(NTKThirdPartyComplication *)self clkComplicationDescriptor];
  [v4 encodeObject:v7 forKey:@"RemoteComplicationComplicationDescriptorKey"];
}

- (void)_addKeysToJSONDictionary:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NTKThirdPartyComplication;
  id v4 = a3;
  [(NTKComplication *)&v9 _addKeysToJSONDictionary:v4];
  v5 = [(NTKComplication *)self appIdentifier];
  [v4 setObject:v5 forKeyedSubscript:@"app"];

  v6 = [(NTKThirdPartyComplication *)self clkClientIdentifier];
  [v4 setObject:v6 forKeyedSubscript:@"extension"];

  v7 = [(NTKThirdPartyComplication *)self clkComplicationDescriptor];
  objc_super v8 = [v7 JSONObjectRepresentation];
  [v4 setObject:v8 forKeyedSubscript:@"complication descriptor"];
}

- (NSString)clkClientIdentifier
{
  return 0;
}

- (CLKComplicationDescriptor)clkComplicationDescriptor
{
  return 0;
}

@end