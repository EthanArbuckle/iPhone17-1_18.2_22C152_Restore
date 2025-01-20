@interface PKCloudStoreZoneInvitation
+ (BOOL)supportsSecureCoding;
+ (id)cloudStoreZoneInvitationWithProtobuf:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCloudStoreZoneInvitation:(id)a3;
- (NSData)shareInvitationToken;
- (NSDate)dateCreated;
- (NSString)containerIdentifier;
- (NSString)zoneName;
- (NSURL)shareURL;
- (PKCloudStoreZoneInvitation)initWithCoder:(id)a3;
- (id)description;
- (id)protobuf;
- (void)encodeWithCoder:(id)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setShareInvitationToken:(id)a3;
- (void)setShareURL:(id)a3;
- (void)setZoneName:(id)a3;
@end

@implementation PKCloudStoreZoneInvitation

+ (id)cloudStoreZoneInvitationWithProtobuf:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PKCloudStoreZoneInvitation);
  v5 = (void *)MEMORY[0x1E4F1CB10];
  v6 = [v3 shareURL];
  v7 = [v5 URLWithString:v6];
  [(PKCloudStoreZoneInvitation *)v4 setShareURL:v7];

  v8 = [v3 shareInvitationToken];
  [(PKCloudStoreZoneInvitation *)v4 setShareInvitationToken:v8];

  v9 = [v3 containerIdentifier];
  [(PKCloudStoreZoneInvitation *)v4 setContainerIdentifier:v9];

  v10 = [v3 zoneName];
  [(PKCloudStoreZoneInvitation *)v4 setZoneName:v10];

  v11 = (void *)MEMORY[0x1E4F1C9C8];
  [v3 dateCreated];
  double v13 = v12;

  v14 = [v11 dateWithTimeIntervalSinceReferenceDate:v13];
  [(PKCloudStoreZoneInvitation *)v4 setDateCreated:v14];

  return v4;
}

- (id)protobuf
{
  id v3 = objc_alloc_init(PKProtobufCloudStoreZoneInvitation);
  v4 = [(PKCloudStoreZoneInvitation *)self shareURL];
  v5 = [v4 absoluteString];
  [(PKProtobufCloudStoreZoneInvitation *)v3 setShareURL:v5];

  v6 = [(PKCloudStoreZoneInvitation *)self shareInvitationToken];
  [(PKProtobufCloudStoreZoneInvitation *)v3 setShareInvitationToken:v6];

  v7 = [(PKCloudStoreZoneInvitation *)self containerIdentifier];
  [(PKProtobufCloudStoreZoneInvitation *)v3 setContainerIdentifier:v7];

  v8 = [(PKCloudStoreZoneInvitation *)self zoneName];
  [(PKProtobufCloudStoreZoneInvitation *)v3 setZoneName:v8];

  v9 = [(PKCloudStoreZoneInvitation *)self dateCreated];
  [v9 timeIntervalSinceReferenceDate];
  -[PKProtobufCloudStoreZoneInvitation setDateCreated:](v3, "setDateCreated:");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreZoneInvitation)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKCloudStoreZoneInvitation;
  v5 = [(PKCloudStoreZoneInvitation *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shareURL"];
    shareURL = v5->_shareURL;
    v5->_shareURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shareInvitationToken"];
    shareInvitationToken = v5->_shareInvitationToken;
    v5->_shareInvitationToken = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerIdentifier"];
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneName"];
    zoneName = v5->_zoneName;
    v5->_zoneName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateCreated"];
    dateCreated = v5->_dateCreated;
    v5->_dateCreated = (NSDate *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  shareURL = self->_shareURL;
  id v5 = a3;
  [v5 encodeObject:shareURL forKey:@"shareURL"];
  [v5 encodeObject:self->_shareInvitationToken forKey:@"shareInvitationToken"];
  [v5 encodeObject:self->_containerIdentifier forKey:@"containerIdentifier"];
  [v5 encodeObject:self->_zoneName forKey:@"zoneName"];
  [v5 encodeObject:self->_dateCreated forKey:@"dateCreated"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKCloudStoreZoneInvitation *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKCloudStoreZoneInvitation *)self isEqualToCloudStoreZoneInvitation:v5];

  return v6;
}

- (BOOL)isEqualToCloudStoreZoneInvitation:(id)a3
{
  id v4 = a3;
  shareURL = self->_shareURL;
  BOOL v6 = (NSURL *)v4[1];
  if (shareURL) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (shareURL != v6) {
      goto LABEL_26;
    }
  }
  else if ((-[NSURL isEqual:](shareURL, "isEqual:") & 1) == 0)
  {
    goto LABEL_26;
  }
  shareInvitationToken = self->_shareInvitationToken;
  v9 = (NSData *)v4[2];
  if (shareInvitationToken && v9)
  {
    if ((-[NSData isEqual:](shareInvitationToken, "isEqual:") & 1) == 0) {
      goto LABEL_26;
    }
  }
  else if (shareInvitationToken != v9)
  {
    goto LABEL_26;
  }
  containerIdentifier = self->_containerIdentifier;
  v11 = (NSString *)v4[3];
  if (containerIdentifier && v11)
  {
    if ((-[NSString isEqual:](containerIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_26;
    }
  }
  else if (containerIdentifier != v11)
  {
    goto LABEL_26;
  }
  zoneName = self->_zoneName;
  double v13 = (NSString *)v4[4];
  if (!zoneName || !v13)
  {
    if (zoneName == v13) {
      goto LABEL_22;
    }
LABEL_26:
    char v16 = 0;
    goto LABEL_27;
  }
  if ((-[NSString isEqual:](zoneName, "isEqual:") & 1) == 0) {
    goto LABEL_26;
  }
LABEL_22:
  dateCreated = self->_dateCreated;
  v15 = (NSDate *)v4[5];
  if (dateCreated && v15) {
    char v16 = -[NSDate isEqual:](dateCreated, "isEqual:");
  }
  else {
    char v16 = dateCreated == v15;
  }
LABEL_27:

  return v16;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"zoneName: %@; ", self->_zoneName];
  [v3 appendFormat:@"containerIdentifier: %@; ", self->_containerIdentifier];
  [v3 appendFormat:@"shareURL: %@ ", self->_shareURL];
  [v3 appendFormat:@"dateCreated: %@; ", self->_dateCreated];
  objc_msgSend(v3, "appendFormat:", @"shareInvitationToken: %ld bytes; ",
    [(NSData *)self->_shareInvitationToken length]);
  [v3 appendString:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
}

- (NSData)shareInvitationToken
{
  return self->_shareInvitationToken;
}

- (void)setShareInvitationToken:(id)a3
{
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_shareInvitationToken, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
}

@end