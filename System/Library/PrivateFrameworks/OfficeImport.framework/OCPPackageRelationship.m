@interface OCPPackageRelationship
- (OCPPackageRelationship)initWithXmlElement:(_xmlNode *)a3 baseLocation:(id)a4;
- (id)identifier;
- (id)targetLocation;
- (id)type;
- (int)targetMode;
- (void)readFromElement:(_xmlNode *)a3 baseLocation:(id)a4;
@end

@implementation OCPPackageRelationship

- (OCPPackageRelationship)initWithXmlElement:(_xmlNode *)a3 baseLocation:(id)a4
{
  id v6 = a4;
  self->mTargetMode = 0;
  [(OCPPackageRelationship *)self readFromElement:a3 baseLocation:v6];

  return self;
}

- (void)readFromElement:(_xmlNode *)a3 baseLocation:(id)a4
{
  id v15 = a4;
  properties = a3->properties;
  for (char i = 0; properties; properties = properties->next)
  {
    if (!properties->ns)
    {
      if (xmlStrEqual(properties->name, (const xmlChar *)"Id"))
      {
        v8 = (NSString *)objc_msgSend([NSString alloc], "tc_initWithValueOfXmlAttribute:", properties);
        mIdentifier = self->mIdentifier;
        self->mIdentifier = v8;
LABEL_11:

        continue;
      }
      if (xmlStrEqual(properties->name, (const xmlChar *)"Type"))
      {
        v10 = (NSString *)objc_msgSend([NSString alloc], "tc_initWithValueOfXmlAttribute:", properties);
        mIdentifier = self->mType;
        self->mType = v10;
        goto LABEL_11;
      }
      if (xmlStrEqual(properties->name, (const xmlChar *)"Target"))
      {
        mIdentifier = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "tc_initWithValueOfXmlAttribute:", properties);
        if (![(NSString *)mIdentifier isEqualToString:@"NULL"])
        {
          [(NSString *)mIdentifier replaceOccurrencesOfString:@"\\", @"/"", 0, 0, [(NSString *)mIdentifier length] withString options range];
          v11 = (NSURL *)[objc_alloc(NSURL) initWithString:mIdentifier relativeToURL:v15];
          mTargetLocation = self->mTargetLocation;
          self->mTargetLocation = v11;
        }
        char i = 1;
        goto LABEL_11;
      }
      if (xmlStrEqual(properties->name, (const xmlChar *)"TargetMode"))
      {
        String = xmlNodeListGetString(properties->doc, properties->children, 1);
        if (xmlStrEqual(String, (const xmlChar *)"External"))
        {
          int v14 = 1;
          goto LABEL_19;
        }
        if (xmlStrEqual(String, (const xmlChar *)"Internal"))
        {
          int v14 = 0;
LABEL_19:
          self->mTargetMode = v14;
        }
        else
        {
          +[OCPException raise:@"OCPPackageRelationshipError", @"Unexpected target mode value: %s", String format];
        }
        ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(String);
      }
    }
  }
  if (!self->mIdentifier || ((self->mType != 0) & i) == 0) {
    +[OCPException raise:@"OCPPackageRelationshipError" format:@"Could not find required relationship attributes"];
  }
}

- (id)identifier
{
  return self->mIdentifier;
}

- (id)type
{
  return self->mType;
}

- (id)targetLocation
{
  return self->mTargetLocation;
}

- (int)targetMode
{
  return self->mTargetMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTargetLocation, 0);
  objc_storeStrong((id *)&self->mType, 0);
  objc_storeStrong((id *)&self->mIdentifier, 0);
}

@end