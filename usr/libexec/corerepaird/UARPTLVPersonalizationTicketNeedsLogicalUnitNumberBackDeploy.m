@interface UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)ticketNeedsLogicalUnitNumber;
- (void)setTicketNeedsLogicalUnitNumber:(unsigned __int8)a3;
@end

@implementation UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy

- (UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy;
  return [(UARPMetaDataTLV8BackDeploy *)&v3 init];
}

- (void)setTicketNeedsLogicalUnitNumber:(unsigned __int8)a3
{
  v4 = self;
  objc_sync_enter(v4);
  *((unsigned char *)&v4->super.super._tlvLength + 4) = a3;
  objc_sync_exit(v4);
}

- (id)description
{
  id v3 = +[UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy metaDataTableEntry];
  id v4 = [v3 objectForKeyedSubscript:@"Name"];
  v5 = v4;
  if (*((unsigned char *)&self->super.super._tlvLength + 4)) {
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
  return -2001563354;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy tlvType];
  uint64_t v4 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy;
  id v5 = [(UARPMetaDataTLV8BackDeploy *)&v7 generateTLV:v3 tlvValue:v4];

  return v5;
}

- (id)tlvValue
{
  uint64_t v2 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v5.receiver = self;
  v5.super_class = (Class)UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy;
  id v3 = [(UARPMetaDataTLV8BackDeploy *)&v5 tlvValue:v2];

  return v3;
}

+ (id)metaDataTableEntry
{
  v6[0] = @"Personalization Ticket Needs Logical Unit Number";
  v5[0] = @"Name";
  v5[1] = @"Value";
  uint64_t v2 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy tlvType]);
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
    id v6 = [v4 unsignedCharValue];

    [v5 setTicketNeedsLogicalUnitNumber:v6];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 1)
  {
    objc_super v5 = objc_opt_new();
    [v5 setTicketNeedsLogicalUnitNumber:*(unsigned __int8 *)a4];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (unsigned)ticketNeedsLogicalUnitNumber
{
  return *((unsigned char *)&self->super.super._tlvLength + 4);
}

@end