@interface SECC2MPDeviceInfo
+ (Class)internalTestConfigType;
- (BOOL)hasIsAppleInternal;
- (BOOL)hasProcessName;
- (BOOL)hasProcessUuid;
- (BOOL)hasProcessVersion;
- (BOOL)hasProductBuild;
- (BOOL)hasProductName;
- (BOOL)hasProductType;
- (BOOL)hasProductVersion;
- (BOOL)hasUserDefaultTestName;
- (BOOL)isAppleInternal;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)internalTestConfigs;
- (NSString)processName;
- (NSString)processUuid;
- (NSString)processVersion;
- (NSString)productBuild;
- (NSString)productName;
- (NSString)productType;
- (NSString)productVersion;
- (NSString)userDefaultTestName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)internalTestConfigAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)internalTestConfigsCount;
- (void)addInternalTestConfig:(id)a3;
- (void)clearInternalTestConfigs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsAppleInternal:(BOOL)a3;
- (void)setInternalTestConfigs:(id)a3;
- (void)setIsAppleInternal:(BOOL)a3;
- (void)setProcessName:(id)a3;
- (void)setProcessUuid:(id)a3;
- (void)setProcessVersion:(id)a3;
- (void)setProductBuild:(id)a3;
- (void)setProductName:(id)a3;
- (void)setProductType:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setUserDefaultTestName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECC2MPDeviceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaultTestName, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_productBuild, 0);
  objc_storeStrong((id *)&self->_processVersion, 0);
  objc_storeStrong((id *)&self->_processUuid, 0);
  objc_storeStrong((id *)&self->_processName, 0);

  objc_storeStrong((id *)&self->_internalTestConfigs, 0);
}

- (void)setInternalTestConfigs:(id)a3
{
}

- (NSMutableArray)internalTestConfigs
{
  return self->_internalTestConfigs;
}

- (void)setUserDefaultTestName:(id)a3
{
}

- (NSString)userDefaultTestName
{
  return self->_userDefaultTestName;
}

- (void)setProcessUuid:(id)a3
{
}

- (NSString)processUuid
{
  return self->_processUuid;
}

- (void)setProcessVersion:(id)a3
{
}

- (NSString)processVersion
{
  return self->_processVersion;
}

- (void)setProcessName:(id)a3
{
}

- (NSString)processName
{
  return self->_processName;
}

- (BOOL)isAppleInternal
{
  return self->_isAppleInternal;
}

- (void)setProductBuild:(id)a3
{
}

- (NSString)productBuild
{
  return self->_productBuild;
}

- (void)setProductVersion:(id)a3
{
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductType:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductName:(id)a3
{
}

- (NSString)productName
{
  return self->_productName;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 6)) {
    -[SECC2MPDeviceInfo setProductName:](self, "setProductName:");
  }
  if (*((void *)v4 + 7)) {
    -[SECC2MPDeviceInfo setProductType:](self, "setProductType:");
  }
  if (*((void *)v4 + 8)) {
    -[SECC2MPDeviceInfo setProductVersion:](self, "setProductVersion:");
  }
  if (*((void *)v4 + 5)) {
    -[SECC2MPDeviceInfo setProductBuild:](self, "setProductBuild:");
  }
  if (*((unsigned char *)v4 + 84))
  {
    self->_isAppleInternal = *((unsigned char *)v4 + 80);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2)) {
    -[SECC2MPDeviceInfo setProcessName:](self, "setProcessName:");
  }
  if (*((void *)v4 + 4)) {
    -[SECC2MPDeviceInfo setProcessVersion:](self, "setProcessVersion:");
  }
  if (*((void *)v4 + 3)) {
    -[SECC2MPDeviceInfo setProcessUuid:](self, "setProcessUuid:");
  }
  if (*((void *)v4 + 9)) {
    -[SECC2MPDeviceInfo setUserDefaultTestName:](self, "setUserDefaultTestName:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[SECC2MPDeviceInfo addInternalTestConfig:](self, "addInternalTestConfig:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_productName hash];
  NSUInteger v4 = [(NSString *)self->_productType hash];
  NSUInteger v5 = [(NSString *)self->_productVersion hash];
  NSUInteger v6 = [(NSString *)self->_productBuild hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_isAppleInternal;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v9 = v7 ^ [(NSString *)self->_processName hash];
  unint64_t v10 = v8 ^ v9 ^ [(NSString *)self->_processVersion hash];
  NSUInteger v11 = [(NSString *)self->_processUuid hash];
  unint64_t v12 = v11 ^ [(NSString *)self->_userDefaultTestName hash];
  return v10 ^ v12 ^ (unint64_t)[(NSMutableArray *)self->_internalTestConfigs hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  productName = self->_productName;
  if ((unint64_t)productName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](productName, "isEqual:")) {
      goto LABEL_28;
    }
  }
  productType = self->_productType;
  if ((unint64_t)productType | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](productType, "isEqual:")) {
      goto LABEL_28;
    }
  }
  productVersion = self->_productVersion;
  if ((unint64_t)productVersion | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](productVersion, "isEqual:")) {
      goto LABEL_28;
    }
  }
  productBuild = self->_productBuild;
  if ((unint64_t)productBuild | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](productBuild, "isEqual:")) {
      goto LABEL_28;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 84))
    {
      if (self->_isAppleInternal)
      {
        if (!*((unsigned char *)v4 + 80)) {
          goto LABEL_28;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 80)) {
        goto LABEL_18;
      }
    }
LABEL_28:
    unsigned __int8 v14 = 0;
    goto LABEL_29;
  }
  if (*((unsigned char *)v4 + 84)) {
    goto LABEL_28;
  }
LABEL_18:
  processName = self->_processName;
  if ((unint64_t)processName | *((void *)v4 + 2)
    && !-[NSString isEqual:](processName, "isEqual:"))
  {
    goto LABEL_28;
  }
  processVersion = self->_processVersion;
  if ((unint64_t)processVersion | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](processVersion, "isEqual:")) {
      goto LABEL_28;
    }
  }
  processUuid = self->_processUuid;
  if ((unint64_t)processUuid | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](processUuid, "isEqual:")) {
      goto LABEL_28;
    }
  }
  userDefaultTestName = self->_userDefaultTestName;
  if ((unint64_t)userDefaultTestName | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](userDefaultTestName, "isEqual:")) {
      goto LABEL_28;
    }
  }
  internalTestConfigs = self->_internalTestConfigs;
  if ((unint64_t)internalTestConfigs | *((void *)v4 + 1)) {
    unsigned __int8 v14 = -[NSMutableArray isEqual:](internalTestConfigs, "isEqual:");
  }
  else {
    unsigned __int8 v14 = 1;
  }
LABEL_29:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSString *)self->_productName copyWithZone:a3];
  uint64_t v7 = (void *)v5[6];
  v5[6] = v6;

  id v8 = [(NSString *)self->_productType copyWithZone:a3];
  unint64_t v9 = (void *)v5[7];
  v5[7] = v8;

  id v10 = [(NSString *)self->_productVersion copyWithZone:a3];
  NSUInteger v11 = (void *)v5[8];
  v5[8] = v10;

  id v12 = [(NSString *)self->_productBuild copyWithZone:a3];
  long long v13 = (void *)v5[5];
  v5[5] = v12;

  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)v5 + 80) = self->_isAppleInternal;
    *((unsigned char *)v5 + 84) |= 1u;
  }
  id v14 = [(NSString *)self->_processName copyWithZone:a3];
  v15 = (void *)v5[2];
  v5[2] = v14;

  id v16 = [(NSString *)self->_processVersion copyWithZone:a3];
  v17 = (void *)v5[4];
  v5[4] = v16;

  id v18 = [(NSString *)self->_processUuid copyWithZone:a3];
  v19 = (void *)v5[3];
  v5[3] = v18;

  id v20 = [(NSString *)self->_userDefaultTestName copyWithZone:a3];
  v21 = (void *)v5[9];
  v5[9] = v20;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v22 = self->_internalTestConfigs;
  id v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      v26 = 0;
      do
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)v26) copyWithZone:a3];
        [v5 addInternalTestConfig:v27];

        v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      id v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v24);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  unint64_t v9 = v4;
  if (self->_productName)
  {
    [v4 setProductName:];
    id v4 = v9;
  }
  if (self->_productType)
  {
    [v9 setProductType:];
    id v4 = v9;
  }
  if (self->_productVersion)
  {
    [v9 setProductVersion:];
    id v4 = v9;
  }
  if (self->_productBuild)
  {
    [v9 setProductBuild:];
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[80] = self->_isAppleInternal;
    v4[84] |= 1u;
  }
  if (self->_processName) {
    [v9 setProcessName:];
  }
  if (self->_processVersion) {
    [v9 setProcessVersion:];
  }
  if (self->_processUuid) {
    [v9 setProcessUuid:];
  }
  if (self->_userDefaultTestName) {
    [v9 setUserDefaultTestName:];
  }
  if ([(SECC2MPDeviceInfo *)self internalTestConfigsCount])
  {
    [v9 clearInternalTestConfigs];
    unint64_t v5 = [(SECC2MPDeviceInfo *)self internalTestConfigsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        id v8 = [(SECC2MPDeviceInfo *)self internalTestConfigAtIndex:i];
        [v9 addInternalTestConfig:v8];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_productName) {
    PBDataWriterWriteStringField();
  }
  if (self->_productType) {
    PBDataWriterWriteStringField();
  }
  if (self->_productVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_productBuild) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_processName) {
    PBDataWriterWriteStringField();
  }
  if (self->_processVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_processUuid) {
    PBDataWriterWriteStringField();
  }
  if (self->_userDefaultTestName) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_internalTestConfigs;
  unint64_t v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      unint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001CB794(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  productName = self->_productName;
  if (productName) {
    [v3 setObject:productName forKey:@"product_name"];
  }
  productType = self->_productType;
  if (productType) {
    [v4 setObject:productType forKey:@"product_type"];
  }
  productVersion = self->_productVersion;
  if (productVersion) {
    [v4 setObject:productVersion forKey:@"product_version"];
  }
  productBuild = self->_productBuild;
  if (productBuild) {
    [v4 setObject:productBuild forKey:@"product_build"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v9 = +[NSNumber numberWithBool:self->_isAppleInternal];
    [v4 setObject:v9 forKey:@"is_apple_internal"];
  }
  processName = self->_processName;
  if (processName) {
    [v4 setObject:processName forKey:@"process_name"];
  }
  processVersion = self->_processVersion;
  if (processVersion) {
    [v4 setObject:processVersion forKey:@"process_version"];
  }
  processUuid = self->_processUuid;
  if (processUuid) {
    [v4 setObject:processUuid forKey:@"process_uuid"];
  }
  userDefaultTestName = self->_userDefaultTestName;
  if (userDefaultTestName) {
    [v4 setObject:userDefaultTestName forKey:@"user_default_test_name"];
  }
  if ([(NSMutableArray *)self->_internalTestConfigs count])
  {
    id v14 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_internalTestConfigs, "count")];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v15 = self->_internalTestConfigs;
    id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = [*(id *)(*((void *)&v22 + 1) + 8 * i) dictionaryRepresentation:v22];
          [v14 addObject:v20];
        }
        id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }

    [v4 setObject:v14 forKey:@"internal_test_config"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SECC2MPDeviceInfo;
  NSUInteger v3 = [(SECC2MPDeviceInfo *)&v7 description];
  id v4 = [(SECC2MPDeviceInfo *)self dictionaryRepresentation];
  unint64_t v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)internalTestConfigAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_internalTestConfigs objectAtIndex:a3];
}

- (unint64_t)internalTestConfigsCount
{
  return (unint64_t)[(NSMutableArray *)self->_internalTestConfigs count];
}

- (void)addInternalTestConfig:(id)a3
{
  id v4 = a3;
  internalTestConfigs = self->_internalTestConfigs;
  id v8 = v4;
  if (!internalTestConfigs)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    objc_super v7 = self->_internalTestConfigs;
    self->_internalTestConfigs = v6;

    id v4 = v8;
    internalTestConfigs = self->_internalTestConfigs;
  }
  [(NSMutableArray *)internalTestConfigs addObject:v4];
}

- (void)clearInternalTestConfigs
{
}

- (BOOL)hasUserDefaultTestName
{
  return self->_userDefaultTestName != 0;
}

- (BOOL)hasProcessUuid
{
  return self->_processUuid != 0;
}

- (BOOL)hasProcessVersion
{
  return self->_processVersion != 0;
}

- (BOOL)hasProcessName
{
  return self->_processName != 0;
}

- (BOOL)hasIsAppleInternal
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasIsAppleInternal:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setIsAppleInternal:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isAppleInternal = a3;
}

- (BOOL)hasProductBuild
{
  return self->_productBuild != 0;
}

- (BOOL)hasProductVersion
{
  return self->_productVersion != 0;
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
}

- (BOOL)hasProductName
{
  return self->_productName != 0;
}

+ (Class)internalTestConfigType
{
  return (Class)objc_opt_class();
}

@end