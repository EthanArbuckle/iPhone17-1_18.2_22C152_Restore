@interface UARPTLVPersonalizationFTABSubfileLongnameOS
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (NSString)longname;
- (UARPTLVPersonalizationFTABSubfileLongnameOS)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setLongname:(id)a3;
@end

@implementation UARPTLVPersonalizationFTABSubfileLongnameOS

- (UARPTLVPersonalizationFTABSubfileLongnameOS)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationFTABSubfileLongnameOS;
  return [(UARPMetaDataTLVStringOS *)&v3 init];
}

- (void)setLongname:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [v4 copy];
  longname = v5->_longname;
  v5->_longname = (NSString *)v6;

  objc_sync_exit(v5);
}

- (id)description
{
  id v3 = +[UARPTLVPersonalizationFTABSubfileLongnameOS metaDataTableEntry];
  id v4 = NSString;
  id v5 = (id)[v3 objectForKeyedSubscript:@"Name"];
  id v6 = (id)[v4 stringWithFormat:@"<%@: %@>", v5, self->_longname];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563374;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationFTABSubfileLongnameOS tlvType];
  longname = self->_longname;
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationFTABSubfileLongnameOS;
  id v5 = [(UARPMetaDataTLVStringOS *)&v7 generateTLV:v3 tlvValue:longname];

  return v5;
}

- (id)tlvValue
{
  longname = self->_longname;
  v5.receiver = self;
  v5.super_class = (Class)UARPTLVPersonalizationFTABSubfileLongnameOS;
  id v3 = [(UARPMetaDataTLVStringOS *)&v5 tlvValue:longname];

  return v3;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = @"Personalization FTAB Payload Longname";
  v5[0] = @"Name";
  v5[1] = @"Value";
  id v2 = [NSNumber numberWithUnsignedInt:+[UARPTLVPersonalizationFTABSubfileLongnameOS tlvType](UARPTLVPersonalizationFTABSubfileLongnameOS, "tlvType")];
  v6[1] = v2;
  id v3 = (id)[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_opt_new();
    [v4 setLongname:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  id v4 = strndup((const char *)a4, a3);
  objc_super v5 = objc_opt_new();
  id v6 = (id)[NSString stringWithUTF8String:v4];
  [v5 setLongname:v6];

  free(v4);

  return v5;
}

- (NSString)longname
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
}

@end