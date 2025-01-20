@interface CSDMessagingAVConferenceInviteData
- (BOOL)hasCallInfoBlob;
- (BOOL)hasMediaBlob;
- (BOOL)hasSKEBlob;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingAVConferenceInviteData)initWithFaceTimeInviteDictionary:(id)a3;
- (CSDMessagingAVConferenceInviteData)initWithRelayInviteDictionary:(id)a3;
- (NSData)callInfoBlob;
- (NSData)mediaBlob;
- (NSData)sKEBlob;
- (NSDictionary)faceTimeInviteDictionary;
- (NSDictionary)relayInviteDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCallInfoBlob:(id)a3;
- (void)setMediaBlob:(id)a3;
- (void)setSKEBlob:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingAVConferenceInviteData

- (CSDMessagingAVConferenceInviteData)initWithRelayInviteDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(CSDMessagingAVConferenceInviteData *)self init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:AVConferenceInviteDataMediaBlob];
    [(CSDMessagingAVConferenceInviteData *)v5 setMediaBlob:v6];

    v7 = [v4 objectForKeyedSubscript:AVConferenceInviteDataCallInfoBlob];
    [(CSDMessagingAVConferenceInviteData *)v5 setCallInfoBlob:v7];
  }
  return v5;
}

- (CSDMessagingAVConferenceInviteData)initWithFaceTimeInviteDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(CSDMessagingAVConferenceInviteData *)self init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:AVConferenceInviteDataSKEBlob];
    [(CSDMessagingAVConferenceInviteData *)v5 setSKEBlob:v6];

    v7 = [v4 objectForKeyedSubscript:AVConferenceInviteDataMediaBlob];
    [(CSDMessagingAVConferenceInviteData *)v5 setMediaBlob:v7];

    v8 = [v4 objectForKeyedSubscript:AVConferenceInviteDataCallInfoBlob];
    [(CSDMessagingAVConferenceInviteData *)v5 setCallInfoBlob:v8];
  }
  return v5;
}

- (NSDictionary)relayInviteDictionary
{
  id v3 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  id v4 = [(CSDMessagingAVConferenceInviteData *)self mediaBlob];
  [v3 setObject:v4 forKeyedSubscript:AVConferenceInviteDataMediaBlob];

  v5 = [(CSDMessagingAVConferenceInviteData *)self callInfoBlob];
  [v3 setObject:v5 forKeyedSubscript:AVConferenceInviteDataCallInfoBlob];

  return (NSDictionary *)v3;
}

- (NSDictionary)faceTimeInviteDictionary
{
  id v3 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  id v4 = [(CSDMessagingAVConferenceInviteData *)self sKEBlob];
  [v3 setObject:v4 forKeyedSubscript:AVConferenceInviteDataSKEBlob];

  v5 = [(CSDMessagingAVConferenceInviteData *)self mediaBlob];
  [v3 setObject:v5 forKeyedSubscript:AVConferenceInviteDataMediaBlob];

  v6 = [(CSDMessagingAVConferenceInviteData *)self callInfoBlob];
  [v3 setObject:v6 forKeyedSubscript:AVConferenceInviteDataCallInfoBlob];

  return (NSDictionary *)v3;
}

- (BOOL)hasSKEBlob
{
  return self->_sKEBlob != 0;
}

- (BOOL)hasMediaBlob
{
  return self->_mediaBlob != 0;
}

- (BOOL)hasCallInfoBlob
{
  return self->_callInfoBlob != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingAVConferenceInviteData;
  id v3 = [(CSDMessagingAVConferenceInviteData *)&v7 description];
  id v4 = [(CSDMessagingAVConferenceInviteData *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  sKEBlob = self->_sKEBlob;
  if (sKEBlob) {
    [v3 setObject:sKEBlob forKey:@"SKEBlob"];
  }
  mediaBlob = self->_mediaBlob;
  if (mediaBlob) {
    [v4 setObject:mediaBlob forKey:@"mediaBlob"];
  }
  callInfoBlob = self->_callInfoBlob;
  if (callInfoBlob) {
    [v4 setObject:callInfoBlob forKey:@"callInfoBlob"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000A0AE0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sKEBlob)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_mediaBlob)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_callInfoBlob)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sKEBlob)
  {
    objc_msgSend(v4, "setSKEBlob:");
    id v4 = v5;
  }
  if (self->_mediaBlob)
  {
    objc_msgSend(v5, "setMediaBlob:");
    id v4 = v5;
  }
  if (self->_callInfoBlob)
  {
    objc_msgSend(v5, "setCallInfoBlob:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_sKEBlob copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(NSData *)self->_mediaBlob copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(NSData *)self->_callInfoBlob copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((sKEBlob = self->_sKEBlob, !((unint64_t)sKEBlob | v4[3]))
     || -[NSData isEqual:](sKEBlob, "isEqual:"))
    && ((mediaBlob = self->_mediaBlob, !((unint64_t)mediaBlob | v4[2]))
     || -[NSData isEqual:](mediaBlob, "isEqual:")))
  {
    callInfoBlob = self->_callInfoBlob;
    if ((unint64_t)callInfoBlob | v4[1]) {
      unsigned __int8 v8 = -[NSData isEqual:](callInfoBlob, "isEqual:");
    }
    else {
      unsigned __int8 v8 = 1;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_sKEBlob hash];
  unint64_t v4 = (unint64_t)[(NSData *)self->_mediaBlob hash] ^ v3;
  return v4 ^ (unint64_t)[(NSData *)self->_callInfoBlob hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[3]) {
    -[CSDMessagingAVConferenceInviteData setSKEBlob:](self, "setSKEBlob:");
  }
  if (v4[2]) {
    -[CSDMessagingAVConferenceInviteData setMediaBlob:](self, "setMediaBlob:");
  }
  if (v4[1]) {
    -[CSDMessagingAVConferenceInviteData setCallInfoBlob:](self, "setCallInfoBlob:");
  }
}

- (NSData)sKEBlob
{
  return self->_sKEBlob;
}

- (void)setSKEBlob:(id)a3
{
}

- (NSData)mediaBlob
{
  return self->_mediaBlob;
}

- (void)setMediaBlob:(id)a3
{
}

- (NSData)callInfoBlob
{
  return self->_callInfoBlob;
}

- (void)setCallInfoBlob:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sKEBlob, 0);
  objc_storeStrong((id *)&self->_mediaBlob, 0);

  objc_storeStrong((id *)&self->_callInfoBlob, 0);
}

@end