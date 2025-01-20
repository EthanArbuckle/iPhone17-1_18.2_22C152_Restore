@interface NSPPrivacyProxySignedConfiguration
+ (Class)certificatesType;
- (BOOL)hasAlgorithm;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)signature;
- (NSMutableArray)certificates;
- (NSPPrivacyProxyConfiguration)configuration;
- (id)algorithmAsString:(int)a3;
- (id)certificatesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAlgorithm:(id)a3;
- (int)algorithm;
- (unint64_t)certificatesCount;
- (unint64_t)hash;
- (void)addCertificates:(id)a3;
- (void)clearCertificates;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlgorithm:(int)a3;
- (void)setCertificates:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setHasAlgorithm:(BOOL)a3;
- (void)setSignature:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSPPrivacyProxySignedConfiguration

- (void)clearCertificates
{
}

- (void)addCertificates:(id)a3
{
  id v4 = a3;
  certificates = self->_certificates;
  id v8 = v4;
  if (!certificates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_certificates;
    self->_certificates = v6;

    id v4 = v8;
    certificates = self->_certificates;
  }
  [(NSMutableArray *)certificates addObject:v4];
}

- (unint64_t)certificatesCount
{
  return [(NSMutableArray *)self->_certificates count];
}

- (id)certificatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_certificates objectAtIndex:a3];
}

+ (Class)certificatesType
{
  return (Class)objc_opt_class();
}

- (int)algorithm
{
  if (*(unsigned char *)&self->_has) {
    return self->_algorithm;
  }
  else {
    return 1;
  }
}

- (void)setAlgorithm:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_algorithm = a3;
}

- (void)setHasAlgorithm:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAlgorithm
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)algorithmAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"ECDSA_SHA256";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = @"UNKNOWN";
  }
  return v4;
}

- (int)StringAsAlgorithm:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"ECDSA_SHA256"];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxySignedConfiguration;
  int v4 = [(NSPPrivacyProxySignedConfiguration *)&v8 description];
  v5 = [(NSPPrivacyProxySignedConfiguration *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  configuration = self->_configuration;
  if (configuration)
  {
    v5 = [(NSPPrivacyProxyConfiguration *)configuration dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"configuration"];
  }
  signature = self->_signature;
  if (signature) {
    [v3 setObject:signature forKey:@"signature"];
  }
  certificates = self->_certificates;
  if (certificates) {
    [v3 setObject:certificates forKey:@"certificates"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int algorithm = self->_algorithm;
    if (algorithm)
    {
      if (algorithm == 1)
      {
        v9 = @"ECDSA_SHA256";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_algorithm);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v9 = @"UNKNOWN";
    }
    [v3 setObject:v9 forKey:@"algorithm"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxySignedConfigurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_configuration) {
    __assert_rtn("-[NSPPrivacyProxySignedConfiguration writeTo:]", "NSPPrivacyProxySignedConfiguration.m", 187, "self->_configuration != nil");
  }
  v5 = v4;
  PBDataWriterWriteSubmessage();
  if (!self->_signature) {
    __assert_rtn("-[NSPPrivacyProxySignedConfiguration writeTo:]", "NSPPrivacyProxySignedConfiguration.m", 192, "nil != self->_signature");
  }
  PBDataWriterWriteDataField();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_certificates;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteDataField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setConfiguration:self->_configuration];
  [v8 setSignature:self->_signature];
  if ([(NSPPrivacyProxySignedConfiguration *)self certificatesCount])
  {
    [v8 clearCertificates];
    unint64_t v4 = [(NSPPrivacyProxySignedConfiguration *)self certificatesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NSPPrivacyProxySignedConfiguration *)self certificatesAtIndex:i];
        [v8 addCertificates:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v8 + 2) = self->_algorithm;
    *((unsigned char *)v8 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSPPrivacyProxyConfiguration *)self->_configuration copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSData *)self->_signature copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = self->_certificates;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (void)v17);
        [(id)v5 addCertificates:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_algorithm;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  configuration = self->_configuration;
  if ((unint64_t)configuration | *((void *)v4 + 3))
  {
    if (!-[NSPPrivacyProxyConfiguration isEqual:](configuration, "isEqual:")) {
      goto LABEL_12;
    }
  }
  signature = self->_signature;
  if ((unint64_t)signature | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](signature, "isEqual:")) {
      goto LABEL_12;
    }
  }
  certificates = self->_certificates;
  if ((unint64_t)certificates | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](certificates, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) != 0 && self->_algorithm == *((_DWORD *)v4 + 2))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NSPPrivacyProxyConfiguration *)self->_configuration hash];
  uint64_t v4 = [(NSData *)self->_signature hash];
  uint64_t v5 = [(NSMutableArray *)self->_certificates hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_algorithm;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  configuration = self->_configuration;
  uint64_t v6 = *((void *)v4 + 3);
  if (configuration)
  {
    if (v6) {
      -[NSPPrivacyProxyConfiguration mergeFrom:](configuration, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NSPPrivacyProxySignedConfiguration setConfiguration:](self, "setConfiguration:");
  }
  if (*((void *)v4 + 4)) {
    -[NSPPrivacyProxySignedConfiguration setSignature:](self, "setSignature:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[NSPPrivacyProxySignedConfiguration addCertificates:](self, "addCertificates:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (*((unsigned char *)v4 + 40))
  {
    self->_int algorithm = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSPPrivacyProxyConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (NSMutableArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
}

@end