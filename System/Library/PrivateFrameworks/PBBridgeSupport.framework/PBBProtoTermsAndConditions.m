@interface PBBProtoTermsAndConditions
- (BOOL)hasAgreeDialogText;
- (BOOL)hasAgreeDialogTitle;
- (BOOL)hasAgreeLabel;
- (BOOL)hasCancelLabel;
- (BOOL)hasDisagreeLabel;
- (BOOL)hasLicense;
- (BOOL)hasLicenseLabel;
- (BOOL)hasMultiterms;
- (BOOL)hasServerTerms;
- (BOOL)hasUserAgent;
- (BOOL)hasWarranty;
- (BOOL)hasWarrantyLabel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)license;
- (NSData)multiterms;
- (NSData)serverTerms;
- (NSData)warranty;
- (NSString)agreeDialogText;
- (NSString)agreeDialogTitle;
- (NSString)agreeLabel;
- (NSString)cancelLabel;
- (NSString)disagreeLabel;
- (NSString)licenseLabel;
- (NSString)userAgent;
- (NSString)warrantyLabel;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAgreeDialogText:(id)a3;
- (void)setAgreeDialogTitle:(id)a3;
- (void)setAgreeLabel:(id)a3;
- (void)setCancelLabel:(id)a3;
- (void)setDisagreeLabel:(id)a3;
- (void)setLicense:(id)a3;
- (void)setLicenseLabel:(id)a3;
- (void)setMultiterms:(id)a3;
- (void)setServerTerms:(id)a3;
- (void)setUserAgent:(id)a3;
- (void)setWarranty:(id)a3;
- (void)setWarrantyLabel:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoTermsAndConditions

- (BOOL)hasLicense
{
  return self->_license != 0;
}

- (BOOL)hasMultiterms
{
  return self->_multiterms != 0;
}

- (BOOL)hasWarranty
{
  return self->_warranty != 0;
}

- (BOOL)hasLicenseLabel
{
  return self->_licenseLabel != 0;
}

- (BOOL)hasWarrantyLabel
{
  return self->_warrantyLabel != 0;
}

- (BOOL)hasAgreeDialogTitle
{
  return self->_agreeDialogTitle != 0;
}

- (BOOL)hasAgreeDialogText
{
  return self->_agreeDialogText != 0;
}

- (BOOL)hasAgreeLabel
{
  return self->_agreeLabel != 0;
}

- (BOOL)hasCancelLabel
{
  return self->_cancelLabel != 0;
}

- (BOOL)hasDisagreeLabel
{
  return self->_disagreeLabel != 0;
}

- (BOOL)hasServerTerms
{
  return self->_serverTerms != 0;
}

- (BOOL)hasUserAgent
{
  return self->_userAgent != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoTermsAndConditions;
  v4 = [(PBBProtoTermsAndConditions *)&v8 description];
  v5 = [(PBBProtoTermsAndConditions *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  license = self->_license;
  if (license) {
    [v3 setObject:license forKey:@"license"];
  }
  multiterms = self->_multiterms;
  if (multiterms) {
    [v4 setObject:multiterms forKey:@"multiterms"];
  }
  warranty = self->_warranty;
  if (warranty) {
    [v4 setObject:warranty forKey:@"warranty"];
  }
  licenseLabel = self->_licenseLabel;
  if (licenseLabel) {
    [v4 setObject:licenseLabel forKey:@"licenseLabel"];
  }
  warrantyLabel = self->_warrantyLabel;
  if (warrantyLabel) {
    [v4 setObject:warrantyLabel forKey:@"warrantyLabel"];
  }
  agreeDialogTitle = self->_agreeDialogTitle;
  if (agreeDialogTitle) {
    [v4 setObject:agreeDialogTitle forKey:@"agreeDialogTitle"];
  }
  agreeDialogText = self->_agreeDialogText;
  if (agreeDialogText) {
    [v4 setObject:agreeDialogText forKey:@"agreeDialogText"];
  }
  agreeLabel = self->_agreeLabel;
  if (agreeLabel) {
    [v4 setObject:agreeLabel forKey:@"agreeLabel"];
  }
  cancelLabel = self->_cancelLabel;
  if (cancelLabel) {
    [v4 setObject:cancelLabel forKey:@"cancelLabel"];
  }
  disagreeLabel = self->_disagreeLabel;
  if (disagreeLabel) {
    [v4 setObject:disagreeLabel forKey:@"disagreeLabel"];
  }
  serverTerms = self->_serverTerms;
  if (serverTerms) {
    [v4 setObject:serverTerms forKey:@"serverTerms"];
  }
  userAgent = self->_userAgent;
  if (userAgent) {
    [v4 setObject:userAgent forKey:@"userAgent"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoTermsAndConditionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_license)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_multiterms)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_warranty)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_licenseLabel)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_warrantyLabel)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_agreeDialogTitle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_agreeDialogText)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_agreeLabel)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_cancelLabel)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_disagreeLabel)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_serverTerms)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_userAgent)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_license)
  {
    objc_msgSend(v4, "setLicense:");
    id v4 = v5;
  }
  if (self->_multiterms)
  {
    objc_msgSend(v5, "setMultiterms:");
    id v4 = v5;
  }
  if (self->_warranty)
  {
    objc_msgSend(v5, "setWarranty:");
    id v4 = v5;
  }
  if (self->_licenseLabel)
  {
    objc_msgSend(v5, "setLicenseLabel:");
    id v4 = v5;
  }
  if (self->_warrantyLabel)
  {
    objc_msgSend(v5, "setWarrantyLabel:");
    id v4 = v5;
  }
  if (self->_agreeDialogTitle)
  {
    objc_msgSend(v5, "setAgreeDialogTitle:");
    id v4 = v5;
  }
  if (self->_agreeDialogText)
  {
    objc_msgSend(v5, "setAgreeDialogText:");
    id v4 = v5;
  }
  if (self->_agreeLabel)
  {
    objc_msgSend(v5, "setAgreeLabel:");
    id v4 = v5;
  }
  if (self->_cancelLabel)
  {
    objc_msgSend(v5, "setCancelLabel:");
    id v4 = v5;
  }
  if (self->_disagreeLabel)
  {
    objc_msgSend(v5, "setDisagreeLabel:");
    id v4 = v5;
  }
  if (self->_serverTerms)
  {
    objc_msgSend(v5, "setServerTerms:");
    id v4 = v5;
  }
  if (self->_userAgent)
  {
    objc_msgSend(v5, "setUserAgent:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_license copyWithZone:a3];
  v7 = (void *)v5[6];
  v5[6] = v6;

  uint64_t v8 = [(NSData *)self->_multiterms copyWithZone:a3];
  v9 = (void *)v5[8];
  v5[8] = v8;

  uint64_t v10 = [(NSData *)self->_warranty copyWithZone:a3];
  v11 = (void *)v5[11];
  v5[11] = v10;

  uint64_t v12 = [(NSString *)self->_licenseLabel copyWithZone:a3];
  v13 = (void *)v5[7];
  v5[7] = v12;

  uint64_t v14 = [(NSString *)self->_warrantyLabel copyWithZone:a3];
  v15 = (void *)v5[12];
  v5[12] = v14;

  uint64_t v16 = [(NSString *)self->_agreeDialogTitle copyWithZone:a3];
  v17 = (void *)v5[2];
  v5[2] = v16;

  uint64_t v18 = [(NSString *)self->_agreeDialogText copyWithZone:a3];
  v19 = (void *)v5[1];
  v5[1] = v18;

  uint64_t v20 = [(NSString *)self->_agreeLabel copyWithZone:a3];
  v21 = (void *)v5[3];
  v5[3] = v20;

  uint64_t v22 = [(NSString *)self->_cancelLabel copyWithZone:a3];
  v23 = (void *)v5[4];
  v5[4] = v22;

  uint64_t v24 = [(NSString *)self->_disagreeLabel copyWithZone:a3];
  v25 = (void *)v5[5];
  v5[5] = v24;

  uint64_t v26 = [(NSData *)self->_serverTerms copyWithZone:a3];
  v27 = (void *)v5[9];
  v5[9] = v26;

  uint64_t v28 = [(NSString *)self->_userAgent copyWithZone:a3];
  v29 = (void *)v5[10];
  v5[10] = v28;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  license = self->_license;
  if ((unint64_t)license | v4[6])
  {
    if (!-[NSData isEqual:](license, "isEqual:")) {
      goto LABEL_26;
    }
  }
  multiterms = self->_multiterms;
  if ((unint64_t)multiterms | v4[8] && !-[NSData isEqual:](multiterms, "isEqual:")) {
    goto LABEL_26;
  }
  warranty = self->_warranty;
  if ((unint64_t)warranty | v4[11] && !-[NSData isEqual:](warranty, "isEqual:")) {
    goto LABEL_26;
  }
  licenseLabel = self->_licenseLabel;
  if ((unint64_t)licenseLabel | v4[7] && !-[NSString isEqual:](licenseLabel, "isEqual:")) {
    goto LABEL_26;
  }
  if (((warrantyLabel = self->_warrantyLabel, !((unint64_t)warrantyLabel | v4[12]))
     || -[NSString isEqual:](warrantyLabel, "isEqual:"))
    && ((agreeDialogTitle = self->_agreeDialogTitle, !((unint64_t)agreeDialogTitle | v4[2]))
     || -[NSString isEqual:](agreeDialogTitle, "isEqual:"))
    && ((agreeDialogText = self->_agreeDialogText, !((unint64_t)agreeDialogText | v4[1]))
     || -[NSString isEqual:](agreeDialogText, "isEqual:"))
    && ((agreeLabel = self->_agreeLabel, !((unint64_t)agreeLabel | v4[3]))
     || -[NSString isEqual:](agreeLabel, "isEqual:"))
    && ((cancelLabel = self->_cancelLabel, !((unint64_t)cancelLabel | v4[4]))
     || -[NSString isEqual:](cancelLabel, "isEqual:"))
    && ((disagreeLabel = self->_disagreeLabel, !((unint64_t)disagreeLabel | v4[5]))
     || -[NSString isEqual:](disagreeLabel, "isEqual:"))
    && ((serverTerms = self->_serverTerms, !((unint64_t)serverTerms | v4[9]))
     || -[NSData isEqual:](serverTerms, "isEqual:")))
  {
    userAgent = self->_userAgent;
    if ((unint64_t)userAgent | v4[10]) {
      char v17 = -[NSString isEqual:](userAgent, "isEqual:");
    }
    else {
      char v17 = 1;
    }
  }
  else
  {
LABEL_26:
    char v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_license hash];
  uint64_t v4 = [(NSData *)self->_multiterms hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_warranty hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_licenseLabel hash];
  NSUInteger v7 = [(NSString *)self->_warrantyLabel hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_agreeDialogTitle hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_agreeDialogText hash];
  NSUInteger v10 = [(NSString *)self->_agreeLabel hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_cancelLabel hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_disagreeLabel hash];
  uint64_t v13 = v9 ^ v12 ^ [(NSData *)self->_serverTerms hash];
  return v13 ^ [(NSString *)self->_userAgent hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[6]) {
    -[PBBProtoTermsAndConditions setLicense:](self, "setLicense:");
  }
  if (v4[8]) {
    -[PBBProtoTermsAndConditions setMultiterms:](self, "setMultiterms:");
  }
  if (v4[11]) {
    -[PBBProtoTermsAndConditions setWarranty:](self, "setWarranty:");
  }
  if (v4[7]) {
    -[PBBProtoTermsAndConditions setLicenseLabel:](self, "setLicenseLabel:");
  }
  if (v4[12]) {
    -[PBBProtoTermsAndConditions setWarrantyLabel:](self, "setWarrantyLabel:");
  }
  if (v4[2]) {
    -[PBBProtoTermsAndConditions setAgreeDialogTitle:](self, "setAgreeDialogTitle:");
  }
  if (v4[1]) {
    -[PBBProtoTermsAndConditions setAgreeDialogText:](self, "setAgreeDialogText:");
  }
  if (v4[3]) {
    -[PBBProtoTermsAndConditions setAgreeLabel:](self, "setAgreeLabel:");
  }
  if (v4[4]) {
    -[PBBProtoTermsAndConditions setCancelLabel:](self, "setCancelLabel:");
  }
  if (v4[5]) {
    -[PBBProtoTermsAndConditions setDisagreeLabel:](self, "setDisagreeLabel:");
  }
  if (v4[9]) {
    -[PBBProtoTermsAndConditions setServerTerms:](self, "setServerTerms:");
  }
  if (v4[10]) {
    -[PBBProtoTermsAndConditions setUserAgent:](self, "setUserAgent:");
  }
}

- (NSData)license
{
  return self->_license;
}

- (void)setLicense:(id)a3
{
}

- (NSData)multiterms
{
  return self->_multiterms;
}

- (void)setMultiterms:(id)a3
{
}

- (NSData)warranty
{
  return self->_warranty;
}

- (void)setWarranty:(id)a3
{
}

- (NSString)licenseLabel
{
  return self->_licenseLabel;
}

- (void)setLicenseLabel:(id)a3
{
}

- (NSString)warrantyLabel
{
  return self->_warrantyLabel;
}

- (void)setWarrantyLabel:(id)a3
{
}

- (NSString)agreeDialogTitle
{
  return self->_agreeDialogTitle;
}

- (void)setAgreeDialogTitle:(id)a3
{
}

- (NSString)agreeDialogText
{
  return self->_agreeDialogText;
}

- (void)setAgreeDialogText:(id)a3
{
}

- (NSString)agreeLabel
{
  return self->_agreeLabel;
}

- (void)setAgreeLabel:(id)a3
{
}

- (NSString)cancelLabel
{
  return self->_cancelLabel;
}

- (void)setCancelLabel:(id)a3
{
}

- (NSString)disagreeLabel
{
  return self->_disagreeLabel;
}

- (void)setDisagreeLabel:(id)a3
{
}

- (NSData)serverTerms
{
  return self->_serverTerms;
}

- (void)setServerTerms:(id)a3
{
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warrantyLabel, 0);
  objc_storeStrong((id *)&self->_warranty, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_serverTerms, 0);
  objc_storeStrong((id *)&self->_multiterms, 0);
  objc_storeStrong((id *)&self->_licenseLabel, 0);
  objc_storeStrong((id *)&self->_license, 0);
  objc_storeStrong((id *)&self->_disagreeLabel, 0);
  objc_storeStrong((id *)&self->_cancelLabel, 0);
  objc_storeStrong((id *)&self->_agreeLabel, 0);
  objc_storeStrong((id *)&self->_agreeDialogTitle, 0);
  objc_storeStrong((id *)&self->_agreeDialogText, 0);
}

@end