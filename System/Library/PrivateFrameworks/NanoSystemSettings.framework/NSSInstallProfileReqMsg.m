@interface NSSInstallProfileReqMsg
- (BOOL)hasProfileData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)profileData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setProfileData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSInstallProfileReqMsg

- (BOOL)hasProfileData
{
  return self->_profileData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSInstallProfileReqMsg;
  v4 = [(NSSInstallProfileReqMsg *)&v8 description];
  v5 = [(NSSInstallProfileReqMsg *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  profileData = self->_profileData;
  if (profileData) {
    [v3 setObject:profileData forKey:@"profileData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSInstallProfileReqMsgReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_profileData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  profileData = self->_profileData;
  if (profileData) {
    [a3 setProfileData:profileData];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_profileData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    profileData = self->_profileData;
    if ((unint64_t)profileData | v4[1]) {
      char v6 = -[NSData isEqual:](profileData, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSData *)self->_profileData hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NSSInstallProfileReqMsg setProfileData:](self, "setProfileData:");
  }
}

- (NSData)profileData
{
  return self->_profileData;
}

- (void)setProfileData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end