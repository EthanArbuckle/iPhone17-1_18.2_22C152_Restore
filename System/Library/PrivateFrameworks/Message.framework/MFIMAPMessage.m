@interface MFIMAPMessage
- (BOOL)hasTemporaryUid;
- (BOOL)isMessageContentsLocallyAvailable;
- (BOOL)isPartial;
- (MFIMAPMessage)initWithFlags:(unint64_t)a3 size:(unint64_t)a4 uid:(unsigned int)a5;
- (id)_privacySafeDescription;
- (id)messageID;
- (id)remoteID;
- (id)remoteMailboxURL;
- (unint64_t)messageSize;
- (unint64_t)uniqueRemoteId;
- (unsigned)uid;
- (void)setIsPartial:(BOOL)a3;
- (void)setPreferredEncoding:(unsigned int)a3;
- (void)setUid:(unsigned int)a3;
- (void)setUniqueRemoteId:(unint64_t)a3;
@end

@implementation MFIMAPMessage

- (MFIMAPMessage)initWithFlags:(unint64_t)a3 size:(unint64_t)a4 uid:(unsigned int)a5
{
  v11.receiver = self;
  v11.super_class = (Class)MFIMAPMessage;
  v8 = [(MFIMAPMessage *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(MFMailMessage *)v8 setMessageFlags:a3];
    v9->_size = a4;
    v9->_uid = a5;
  }
  return v9;
}

- (id)_privacySafeDescription
{
  v7.receiver = self;
  v7.super_class = (Class)MFIMAPMessage;
  v3 = [(MFIMAPMessage *)&v7 _privacySafeDescription];
  v4 = [(MFIMAPMessage *)self remoteID];
  v5 = [v3 stringByAppendingFormat:@" remoteID:%@", v4];

  return v5;
}

- (unint64_t)messageSize
{
  return self->_size;
}

- (id)messageID
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__str = v2;
  long long v8 = v2;
  if ((self->super._messageFlags & 0x400000000) != 0) {
    v3 = "temp-";
  }
  else {
    v3 = "";
  }
  int v4 = snprintf(__str, 0x1FuLL, "%s%u", v3, self->_uid);
  v5 = (__CFString *)CFStringCreateWithBytes(0, (const UInt8 *)__str, v4, 0x600u, 0);
  return v5;
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (unint64_t)uniqueRemoteId
{
  return self->_uniqueRemoteId;
}

- (void)setUniqueRemoteId:(unint64_t)a3
{
  self->_uniqueRemoteId = a3;
}

- (BOOL)isPartial
{
  return (BYTE4(self->super._messageFlags) >> 2) & 1;
}

- (void)setIsPartial:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->super._messageFlags = self->super._messageFlags & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)isMessageContentsLocallyAvailable
{
  return 0;
}

- (void)setPreferredEncoding:(unsigned int)a3
{
  self->super._messageFlags = self->super._messageFlags & 0xFFFFFFF7FFFFFFFFLL | ((unint64_t)(a3 != -1) << 35);
  v3.receiver = self;
  v3.super_class = (Class)MFIMAPMessage;
  -[MFIMAPMessage setPreferredEncoding:](&v3, sel_setPreferredEncoding_);
}

- (BOOL)hasTemporaryUid
{
  return BYTE4(self->super._messageFlags) & 1;
}

- (id)remoteID
{
  long long v2 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_uid];
  objc_super v3 = [v2 stringValue];

  return v3;
}

- (id)remoteMailboxURL
{
  long long v2 = [(MFMailMessage *)self mailbox];
  objc_super v3 = [v2 URLString];

  return v3;
}

@end