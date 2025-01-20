@interface KCSharingPBInternetPasswordCredential
- (BOOL)hasAccessGroup;
- (BOOL)hasAccessibility;
- (BOOL)hasAccount;
- (BOOL)hasAuthenticationType;
- (BOOL)hasClientDefined0;
- (BOOL)hasClientDefined1;
- (BOOL)hasClientDefined2;
- (BOOL)hasClientDefined3;
- (BOOL)hasComment;
- (BOOL)hasCreationDate;
- (BOOL)hasData;
- (BOOL)hasHistory;
- (BOOL)hasLabel;
- (BOOL)hasModificationDate;
- (BOOL)hasNotes;
- (BOOL)hasPath;
- (BOOL)hasPort;
- (BOOL)hasProtocol;
- (BOOL)hasSecurityDomain;
- (BOOL)hasServer;
- (BOOL)hasViewHint;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)clientDefined0;
- (NSData)clientDefined1;
- (NSData)clientDefined2;
- (NSData)clientDefined3;
- (NSData)data;
- (NSData)history;
- (NSData)notes;
- (NSString)accessGroup;
- (NSString)accessibility;
- (NSString)account;
- (NSString)authenticationType;
- (NSString)comment;
- (NSString)label;
- (NSString)path;
- (NSString)protocol;
- (NSString)securityDomain;
- (NSString)server;
- (NSString)viewHint;
- (PBUnknownFields)unknownFields;
- (double)creationDate;
- (double)modificationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)port;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setAccessGroup:(id)a3;
- (void)setAccessibility:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAuthenticationType:(id)a3;
- (void)setClientDefined0:(id)a3;
- (void)setClientDefined1:(id)a3;
- (void)setClientDefined2:(id)a3;
- (void)setClientDefined3:(id)a3;
- (void)setComment:(id)a3;
- (void)setCreationDate:(double)a3;
- (void)setData:(id)a3;
- (void)setHasCreationDate:(BOOL)a3;
- (void)setHasModificationDate:(BOOL)a3;
- (void)setHasPort:(BOOL)a3;
- (void)setHistory:(id)a3;
- (void)setLabel:(id)a3;
- (void)setModificationDate:(double)a3;
- (void)setNotes:(id)a3;
- (void)setPath:(id)a3;
- (void)setPort:(int)a3;
- (void)setProtocol:(id)a3;
- (void)setSecurityDomain:(id)a3;
- (void)setServer:(id)a3;
- (void)setViewHint:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCSharingPBInternetPasswordCredential

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewHint, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_securityDomain, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_clientDefined3, 0);
  objc_storeStrong((id *)&self->_clientDefined2, 0);
  objc_storeStrong((id *)&self->_clientDefined1, 0);
  objc_storeStrong((id *)&self->_clientDefined0, 0);
  objc_storeStrong((id *)&self->_authenticationType, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accessibility, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (void)setClientDefined3:(id)a3
{
}

- (NSData)clientDefined3
{
  return self->_clientDefined3;
}

- (void)setClientDefined2:(id)a3
{
}

- (NSData)clientDefined2
{
  return self->_clientDefined2;
}

- (void)setClientDefined1:(id)a3
{
}

- (NSData)clientDefined1
{
  return self->_clientDefined1;
}

- (void)setClientDefined0:(id)a3
{
}

- (NSData)clientDefined0
{
  return self->_clientDefined0;
}

- (void)setHistory:(id)a3
{
}

- (NSData)history
{
  return self->_history;
}

- (void)setNotes:(id)a3
{
}

- (NSData)notes
{
  return self->_notes;
}

- (void)setSecurityDomain:(id)a3
{
}

- (NSString)securityDomain
{
  return self->_securityDomain;
}

- (void)setViewHint:(id)a3
{
}

- (NSString)viewHint
{
  return self->_viewHint;
}

- (void)setAccessibility:(id)a3
{
}

- (NSString)accessibility
{
  return self->_accessibility;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setComment:(id)a3
{
}

- (NSString)comment
{
  return self->_comment;
}

- (void)setPath:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setData:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setAuthenticationType:(id)a3
{
}

- (NSString)authenticationType
{
  return self->_authenticationType;
}

- (int)port
{
  return self->_port;
}

- (void)setServer:(id)a3
{
}

- (NSString)server
{
  return self->_server;
}

- (void)setProtocol:(id)a3
{
}

- (NSString)protocol
{
  return self->_protocol;
}

- (void)setAccount:(id)a3
{
}

- (NSString)account
{
  return self->_account;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (void)setAccessGroup:(id)a3
{
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[KCSharingPBInternetPasswordCredential setAccessGroup:](self, "setAccessGroup:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 184);
  if ((v5 & 2) != 0)
  {
    self->_modificationDate = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 184);
  }
  if (v5)
  {
    self->_creationDate = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 6))
  {
    -[KCSharingPBInternetPasswordCredential setAccount:](self, "setAccount:");
    id v4 = v6;
  }
  if (*((void *)v4 + 19))
  {
    -[KCSharingPBInternetPasswordCredential setProtocol:](self, "setProtocol:");
    id v4 = v6;
  }
  if (*((void *)v4 + 21))
  {
    -[KCSharingPBInternetPasswordCredential setServer:](self, "setServer:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 184) & 4) != 0)
  {
    self->_port = *((_DWORD *)v4 + 36);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 7))
  {
    -[KCSharingPBInternetPasswordCredential setAuthenticationType:](self, "setAuthenticationType:");
    id v4 = v6;
  }
  if (*((void *)v4 + 13))
  {
    -[KCSharingPBInternetPasswordCredential setData:](self, "setData:");
    id v4 = v6;
  }
  if (*((void *)v4 + 17))
  {
    -[KCSharingPBInternetPasswordCredential setPath:](self, "setPath:");
    id v4 = v6;
  }
  if (*((void *)v4 + 12))
  {
    -[KCSharingPBInternetPasswordCredential setComment:](self, "setComment:");
    id v4 = v6;
  }
  if (*((void *)v4 + 15))
  {
    -[KCSharingPBInternetPasswordCredential setLabel:](self, "setLabel:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[KCSharingPBInternetPasswordCredential setAccessibility:](self, "setAccessibility:");
    id v4 = v6;
  }
  if (*((void *)v4 + 22))
  {
    -[KCSharingPBInternetPasswordCredential setViewHint:](self, "setViewHint:");
    id v4 = v6;
  }
  if (*((void *)v4 + 20))
  {
    -[KCSharingPBInternetPasswordCredential setSecurityDomain:](self, "setSecurityDomain:");
    id v4 = v6;
  }
  if (*((void *)v4 + 16))
  {
    -[KCSharingPBInternetPasswordCredential setNotes:](self, "setNotes:");
    id v4 = v6;
  }
  if (*((void *)v4 + 14))
  {
    -[KCSharingPBInternetPasswordCredential setHistory:](self, "setHistory:");
    id v4 = v6;
  }
  if (*((void *)v4 + 8))
  {
    -[KCSharingPBInternetPasswordCredential setClientDefined0:](self, "setClientDefined0:");
    id v4 = v6;
  }
  if (*((void *)v4 + 9))
  {
    -[KCSharingPBInternetPasswordCredential setClientDefined1:](self, "setClientDefined1:");
    id v4 = v6;
  }
  if (*((void *)v4 + 10))
  {
    -[KCSharingPBInternetPasswordCredential setClientDefined2:](self, "setClientDefined2:");
    id v4 = v6;
  }
  if (*((void *)v4 + 11))
  {
    -[KCSharingPBInternetPasswordCredential setClientDefined3:](self, "setClientDefined3:");
    id v4 = v6;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_accessGroup hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double modificationDate = self->_modificationDate;
    double v7 = -modificationDate;
    if (modificationDate >= 0.0) {
      double v7 = self->_modificationDate;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if (has)
  {
    double creationDate = self->_creationDate;
    double v12 = -creationDate;
    if (creationDate >= 0.0) {
      double v12 = self->_creationDate;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    double v15 = fmod(v13, 1.84467441e19);
    unint64_t v16 = 2654435761u * (unint64_t)v15;
    unint64_t v17 = v16 + (unint64_t)v14;
    if (v14 <= 0.0) {
      unint64_t v17 = 2654435761u * (unint64_t)v15;
    }
    unint64_t v18 = v16 - (unint64_t)fabs(v14);
    if (v14 < 0.0) {
      unint64_t v10 = v18;
    }
    else {
      unint64_t v10 = v17;
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  NSUInteger v19 = [(NSString *)self->_account hash];
  NSUInteger v20 = [(NSString *)self->_protocol hash];
  NSUInteger v21 = [(NSString *)self->_server hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v22 = 2654435761 * self->_port;
  }
  else {
    uint64_t v22 = 0;
  }
  unint64_t v23 = v5 ^ v3 ^ v10 ^ v19 ^ v20 ^ v21 ^ v22;
  NSUInteger v24 = [(NSString *)self->_authenticationType hash];
  unint64_t v25 = v24 ^ (unint64_t)[(NSData *)self->_data hash];
  unint64_t v26 = v25 ^ [(NSString *)self->_path hash];
  unint64_t v27 = v23 ^ v26 ^ [(NSString *)self->_comment hash];
  NSUInteger v28 = [(NSString *)self->_label hash];
  unint64_t v29 = v28 ^ [(NSString *)self->_accessibility hash];
  unint64_t v30 = v29 ^ [(NSString *)self->_viewHint hash];
  unint64_t v31 = v30 ^ [(NSString *)self->_securityDomain hash];
  unint64_t v32 = v27 ^ v31 ^ (unint64_t)[(NSData *)self->_notes hash];
  unint64_t v33 = (unint64_t)[(NSData *)self->_history hash];
  unint64_t v34 = v33 ^ (unint64_t)[(NSData *)self->_clientDefined0 hash];
  unint64_t v35 = v34 ^ (unint64_t)[(NSData *)self->_clientDefined1 hash];
  unint64_t v36 = v35 ^ (unint64_t)[(NSData *)self->_clientDefined2 hash];
  return v32 ^ v36 ^ (unint64_t)[(NSData *)self->_clientDefined3 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_53;
  }
  accessGroup = self->_accessGroup;
  if ((unint64_t)accessGroup | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](accessGroup, "isEqual:")) {
      goto LABEL_53;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 184) & 2) == 0 || self->_modificationDate != *((double *)v4 + 3)) {
      goto LABEL_53;
    }
  }
  else if ((*((unsigned char *)v4 + 184) & 2) != 0)
  {
LABEL_53:
    unsigned __int8 v23 = 0;
    goto LABEL_54;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 184) & 1) == 0 || self->_creationDate != *((double *)v4 + 2)) {
      goto LABEL_53;
    }
  }
  else if (*((unsigned char *)v4 + 184))
  {
    goto LABEL_53;
  }
  account = self->_account;
  if ((unint64_t)account | *((void *)v4 + 6) && !-[NSString isEqual:](account, "isEqual:")) {
    goto LABEL_53;
  }
  protocol = self->_protocol;
  if ((unint64_t)protocol | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](protocol, "isEqual:")) {
      goto LABEL_53;
    }
  }
  server = self->_server;
  if ((unint64_t)server | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](server, "isEqual:")) {
      goto LABEL_53;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 184) & 4) == 0 || self->_port != *((_DWORD *)v4 + 36)) {
      goto LABEL_53;
    }
  }
  else if ((*((unsigned char *)v4 + 184) & 4) != 0)
  {
    goto LABEL_53;
  }
  authenticationType = self->_authenticationType;
  if ((unint64_t)authenticationType | *((void *)v4 + 7)
    && !-[NSString isEqual:](authenticationType, "isEqual:"))
  {
    goto LABEL_53;
  }
  data = self->_data;
  if ((unint64_t)data | *((void *)v4 + 13))
  {
    if (!-[NSData isEqual:](data, "isEqual:")) {
      goto LABEL_53;
    }
  }
  path = self->_path;
  if ((unint64_t)path | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](path, "isEqual:")) {
      goto LABEL_53;
    }
  }
  comment = self->_comment;
  if ((unint64_t)comment | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](comment, "isEqual:")) {
      goto LABEL_53;
    }
  }
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](label, "isEqual:")) {
      goto LABEL_53;
    }
  }
  accessibility = self->_accessibility;
  if ((unint64_t)accessibility | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](accessibility, "isEqual:")) {
      goto LABEL_53;
    }
  }
  viewHint = self->_viewHint;
  if ((unint64_t)viewHint | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](viewHint, "isEqual:")) {
      goto LABEL_53;
    }
  }
  securityDomain = self->_securityDomain;
  if ((unint64_t)securityDomain | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](securityDomain, "isEqual:")) {
      goto LABEL_53;
    }
  }
  notes = self->_notes;
  if ((unint64_t)notes | *((void *)v4 + 16))
  {
    if (!-[NSData isEqual:](notes, "isEqual:")) {
      goto LABEL_53;
    }
  }
  history = self->_history;
  if ((unint64_t)history | *((void *)v4 + 14))
  {
    if (!-[NSData isEqual:](history, "isEqual:")) {
      goto LABEL_53;
    }
  }
  clientDefined0 = self->_clientDefined0;
  if ((unint64_t)clientDefined0 | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](clientDefined0, "isEqual:")) {
      goto LABEL_53;
    }
  }
  clientDefined1 = self->_clientDefined1;
  if ((unint64_t)clientDefined1 | *((void *)v4 + 9))
  {
    if (!-[NSData isEqual:](clientDefined1, "isEqual:")) {
      goto LABEL_53;
    }
  }
  clientDefined2 = self->_clientDefined2;
  if ((unint64_t)clientDefined2 | *((void *)v4 + 10))
  {
    if (!-[NSData isEqual:](clientDefined2, "isEqual:")) {
      goto LABEL_53;
    }
  }
  clientDefined3 = self->_clientDefined3;
  if ((unint64_t)clientDefined3 | *((void *)v4 + 11)) {
    unsigned __int8 v23 = -[NSData isEqual:](clientDefined3, "isEqual:");
  }
  else {
    unsigned __int8 v23 = 1;
  }
LABEL_54:

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_accessGroup copyWithZone:a3];
  double v7 = (void *)*((void *)v5 + 4);
  *((void *)v5 + 4) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v5 + 3) = *(void *)&self->_modificationDate;
    *((unsigned char *)v5 + 184) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v5 + 2) = *(void *)&self->_creationDate;
    *((unsigned char *)v5 + 184) |= 1u;
  }
  id v9 = [(NSString *)self->_account copyWithZone:a3];
  unint64_t v10 = (void *)*((void *)v5 + 6);
  *((void *)v5 + 6) = v9;

  id v11 = [(NSString *)self->_protocol copyWithZone:a3];
  double v12 = (void *)*((void *)v5 + 19);
  *((void *)v5 + 19) = v11;

  id v13 = [(NSString *)self->_server copyWithZone:a3];
  double v14 = (void *)*((void *)v5 + 21);
  *((void *)v5 + 21) = v13;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v5 + 36) = self->_port;
    *((unsigned char *)v5 + 184) |= 4u;
  }
  id v15 = [(NSString *)self->_authenticationType copyWithZone:a3];
  unint64_t v16 = (void *)*((void *)v5 + 7);
  *((void *)v5 + 7) = v15;

  id v17 = [(NSData *)self->_data copyWithZone:a3];
  unint64_t v18 = (void *)*((void *)v5 + 13);
  *((void *)v5 + 13) = v17;

  id v19 = [(NSString *)self->_path copyWithZone:a3];
  NSUInteger v20 = (void *)*((void *)v5 + 17);
  *((void *)v5 + 17) = v19;

  id v21 = [(NSString *)self->_comment copyWithZone:a3];
  uint64_t v22 = (void *)*((void *)v5 + 12);
  *((void *)v5 + 12) = v21;

  id v23 = [(NSString *)self->_label copyWithZone:a3];
  NSUInteger v24 = (void *)*((void *)v5 + 15);
  *((void *)v5 + 15) = v23;

  id v25 = [(NSString *)self->_accessibility copyWithZone:a3];
  unint64_t v26 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v25;

  id v27 = [(NSString *)self->_viewHint copyWithZone:a3];
  NSUInteger v28 = (void *)*((void *)v5 + 22);
  *((void *)v5 + 22) = v27;

  id v29 = [(NSString *)self->_securityDomain copyWithZone:a3];
  unint64_t v30 = (void *)*((void *)v5 + 20);
  *((void *)v5 + 20) = v29;

  id v31 = [(NSData *)self->_notes copyWithZone:a3];
  unint64_t v32 = (void *)*((void *)v5 + 16);
  *((void *)v5 + 16) = v31;

  id v33 = [(NSData *)self->_history copyWithZone:a3];
  unint64_t v34 = (void *)*((void *)v5 + 14);
  *((void *)v5 + 14) = v33;

  id v35 = [(NSData *)self->_clientDefined0 copyWithZone:a3];
  unint64_t v36 = (void *)*((void *)v5 + 8);
  *((void *)v5 + 8) = v35;

  id v37 = [(NSData *)self->_clientDefined1 copyWithZone:a3];
  v38 = (void *)*((void *)v5 + 9);
  *((void *)v5 + 9) = v37;

  id v39 = [(NSData *)self->_clientDefined2 copyWithZone:a3];
  v40 = (void *)*((void *)v5 + 10);
  *((void *)v5 + 10) = v39;

  id v41 = [(NSData *)self->_clientDefined3 copyWithZone:a3];
  v42 = (void *)*((void *)v5 + 11);
  *((void *)v5 + 11) = v41;

  objc_storeStrong((id *)v5 + 1, self->_unknownFields);
  return v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_accessGroup)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_account)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_protocol)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_server)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_authenticationType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_data)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_path)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_comment)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_accessibility)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_viewHint)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_securityDomain)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_notes)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_history)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_clientDefined0)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_clientDefined1)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_clientDefined2)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_clientDefined3)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (BOOL)readFrom:(id)a3
{
  return sub_10016F048((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  accessGroup = self->_accessGroup;
  if (accessGroup) {
    [v3 setObject:accessGroup forKey:@"accessGroup"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double v7 = +[NSNumber numberWithDouble:self->_modificationDate];
    [v4 setObject:v7 forKey:@"modificationDate"];

    char has = (char)self->_has;
  }
  if (has)
  {
    long double v8 = +[NSNumber numberWithDouble:self->_creationDate];
    [v4 setObject:v8 forKey:@"creationDate"];
  }
  account = self->_account;
  if (account) {
    [v4 setObject:account forKey:@"account"];
  }
  protocol = self->_protocol;
  if (protocol) {
    [v4 setObject:protocol forKey:@"protocol"];
  }
  server = self->_server;
  if (server) {
    [v4 setObject:server forKey:@"server"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    double v12 = +[NSNumber numberWithInt:self->_port];
    [v4 setObject:v12 forKey:@"port"];
  }
  authenticationType = self->_authenticationType;
  if (authenticationType) {
    [v4 setObject:authenticationType forKey:@"authenticationType"];
  }
  data = self->_data;
  if (data) {
    [v4 setObject:data forKey:@"data"];
  }
  path = self->_path;
  if (path) {
    [v4 setObject:path forKey:@"path"];
  }
  comment = self->_comment;
  if (comment) {
    [v4 setObject:comment forKey:@"comment"];
  }
  label = self->_label;
  if (label) {
    [v4 setObject:label forKey:@"label"];
  }
  accessibility = self->_accessibility;
  if (accessibility) {
    [v4 setObject:accessibility forKey:@"accessibility"];
  }
  viewHint = self->_viewHint;
  if (viewHint) {
    [v4 setObject:viewHint forKey:@"viewHint"];
  }
  securityDomain = self->_securityDomain;
  if (securityDomain) {
    [v4 setObject:securityDomain forKey:@"securityDomain"];
  }
  notes = self->_notes;
  if (notes) {
    [v4 setObject:notes forKey:@"notes"];
  }
  history = self->_history;
  if (history) {
    [v4 setObject:history forKey:@"history"];
  }
  clientDefined0 = self->_clientDefined0;
  if (clientDefined0) {
    [v4 setObject:clientDefined0 forKey:@"clientDefined0"];
  }
  clientDefined1 = self->_clientDefined1;
  if (clientDefined1) {
    [v4 setObject:clientDefined1 forKey:@"clientDefined1"];
  }
  clientDefined2 = self->_clientDefined2;
  if (clientDefined2) {
    [v4 setObject:clientDefined2 forKey:@"clientDefined2"];
  }
  clientDefined3 = self->_clientDefined3;
  if (clientDefined3) {
    [v4 setObject:clientDefined3 forKey:@"clientDefined3"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    NSUInteger v28 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v4 setObject:v28 forKey:@"Unknown Fields"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)KCSharingPBInternetPasswordCredential;
  NSUInteger v3 = [(KCSharingPBInternetPasswordCredential *)&v7 description];
  id v4 = [(KCSharingPBInternetPasswordCredential *)self dictionaryRepresentation];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasClientDefined3
{
  return self->_clientDefined3 != 0;
}

- (BOOL)hasClientDefined2
{
  return self->_clientDefined2 != 0;
}

- (BOOL)hasClientDefined1
{
  return self->_clientDefined1 != 0;
}

- (BOOL)hasClientDefined0
{
  return self->_clientDefined0 != 0;
}

- (BOOL)hasHistory
{
  return self->_history != 0;
}

- (BOOL)hasNotes
{
  return self->_notes != 0;
}

- (BOOL)hasSecurityDomain
{
  return self->_securityDomain != 0;
}

- (BOOL)hasViewHint
{
  return self->_viewHint != 0;
}

- (BOOL)hasAccessibility
{
  return self->_accessibility != 0;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (BOOL)hasComment
{
  return self->_comment != 0;
}

- (BOOL)hasPath
{
  return self->_path != 0;
}

- (BOOL)hasData
{
  return self->_data != 0;
}

- (BOOL)hasAuthenticationType
{
  return self->_authenticationType != 0;
}

- (BOOL)hasPort
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasPort:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setPort:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_port = a3;
}

- (BOOL)hasServer
{
  return self->_server != 0;
}

- (BOOL)hasProtocol
{
  return self->_protocol != 0;
}

- (BOOL)hasAccount
{
  return self->_account != 0;
}

- (BOOL)hasCreationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCreationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double creationDate = a3;
}

- (BOOL)hasModificationDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasModificationDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setModificationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double modificationDate = a3;
}

- (BOOL)hasAccessGroup
{
  return self->_accessGroup != 0;
}

@end