@interface UARPTLVPersonalizationRequiredBackDeploy
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationRequiredBackDeploy)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)isRequired;
- (void)setIsRequired:(unsigned int)a3;
@end

@implementation UARPTLVPersonalizationRequiredBackDeploy

- (UARPTLVPersonalizationRequiredBackDeploy)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationRequiredBackDeploy;
  return [(UARPMetaDataTLV32BackDeploy *)&v3 init];
}

- (void)setIsRequired:(unsigned int)a3
{
  v4 = self;
  objc_sync_enter(v4);
  *(&v4->super.super._tlvLength + 1) = a3;
  objc_sync_exit(v4);
}

- (id)description
{
  id v3 = +[UARPTLVPersonalizationRequiredBackDeploy metaDataTableEntry];
  id v4 = [v3 objectForKeyedSubscript:@"Name"];
  v5 = v4;
  if (*(&self->super.super._tlvLength + 1)) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  v7 = +[NSString stringWithFormat:@"<%@: %@>", v4, v6];

  return v7;
}

+ (unsigned)tlvType
{
  return -2001563392;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationRequiredBackDeploy tlvType];
  uint64_t v4 = *(&self->super.super._tlvLength + 1);
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationRequiredBackDeploy;
  id v5 = [(UARPMetaDataTLV32BackDeploy *)&v7 generateTLV:v3 tlvValue:v4];

  return v5;
}

- (id)tlvValue
{
  uint64_t v2 = *(&self->super.super._tlvLength + 1);
  v5.receiver = self;
  v5.super_class = (Class)UARPTLVPersonalizationRequiredBackDeploy;
  id v3 = [(UARPMetaDataTLV32BackDeploy *)&v5 tlvValue:v2];

  return v3;
}

+ (id)metaDataTableEntry
{
  v6[0] = @"Personalization Required";
  v5[0] = @"Name";
  v5[1] = @"Value";
  uint64_t v2 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationRequiredBackDeploy tlvType]);
  v6[1] = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    objc_super v5 = objc_opt_new();
    id v6 = [v4 unsignedLongValue];

    [v5 setIsRequired:v6];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 4)
  {
    objc_super v5 = objc_opt_new();
    [v5 setIsRequired:uarpNtohl(*(_DWORD *)a4)];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (unsigned)isRequired
{
  return *(&self->super.super._tlvLength + 1);
}

@end