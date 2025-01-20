@interface MFMessageInfo
+ (int64_t)newGenerationNumber;
- (BOOL)deleted;
- (BOOL)flagged;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKnownToHaveAttachments;
- (BOOL)isVIP;
- (BOOL)read;
- (BOOL)uidIsLibraryID;
- (MFMessageInfo)init;
- (MFMessageInfo)initWithUid:(unsigned int)a3 mailboxID:(unsigned int)a4 messageID:(int64_t)a5 dateReceivedInterval:(unsigned int)a6 dateSentInterval:(unsigned int)a7 conversationHash:(int64_t)a8 read:(BOOL)a9 knownToHaveAttachments:(BOOL)a10 flagged:(BOOL)a11 isVIP:(BOOL)a12;
- (NSString)description;
- (id)_flagDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)conversationHash;
- (int64_t)generationCompare:(id)a3;
- (int64_t)generationNumber;
- (int64_t)messageIDHash;
- (unint64_t)hash;
- (unsigned)dateReceivedInterval;
- (unsigned)dateSentInterval;
- (unsigned)mailboxID;
- (unsigned)sortDateReceivedInterval;
- (unsigned)sortUid;
- (unsigned)uid;
- (void)hash;
- (void)setConversationHash:(int64_t)a3;
- (void)setDateReceivedInterval:(unsigned int)a3;
- (void)setDateSentInterval:(unsigned int)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setFlagged:(BOOL)a3;
- (void)setIsVIP:(BOOL)a3;
- (void)setKnownToHaveAttachments:(BOOL)a3;
- (void)setMailboxID:(unsigned int)a3;
- (void)setMessageIDHash:(int64_t)a3;
- (void)setRead:(BOOL)a3;
- (void)setSortDateReceivedInterval:(unsigned int)a3;
- (void)setSortUid:(unsigned int)a3;
- (void)setUid:(unsigned int)a3;
- (void)setUidIsLibraryID:(BOOL)a3;
@end

@implementation MFMessageInfo

- (BOOL)read
{
  return (*((unsigned __int8 *)self + 8) >> 1) & 1;
}

- (void)setRead:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFD | v3;
}

- (BOOL)flagged
{
  return *((unsigned char *)self + 8) & 1;
}

- (void)setFlagged:(BOOL)a3
{
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFE | a3;
}

- (BOOL)deleted
{
  return (*((unsigned __int8 *)self + 8) >> 2) & 1;
}

- (void)setDeleted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFB | v3;
}

- (BOOL)uidIsLibraryID
{
  return (*((unsigned __int8 *)self + 8) >> 3) & 1;
}

- (void)setUidIsLibraryID:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xF7 | v3;
}

- (BOOL)isKnownToHaveAttachments
{
  return (*((unsigned __int8 *)self + 8) >> 4) & 1;
}

- (void)setKnownToHaveAttachments:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xEF | v3;
}

- (BOOL)isVIP
{
  return (*((unsigned __int8 *)self + 8) >> 5) & 1;
}

- (void)setIsVIP:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xDF | v3;
}

+ (int64_t)newGenerationNumber
{
  return atomic_fetch_add_explicit(&__globalGenerationNumber, 1uLL, memory_order_relaxed) + 1;
}

- (MFMessageInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)MFMessageInfo;
  result = [(MFMessageInfo *)&v3 init];
  if (result) {
    result->_generationNumber = atomic_fetch_add_explicit(&__globalGenerationNumber, 1uLL, memory_order_relaxed) + 1;
  }
  return result;
}

- (MFMessageInfo)initWithUid:(unsigned int)a3 mailboxID:(unsigned int)a4 messageID:(int64_t)a5 dateReceivedInterval:(unsigned int)a6 dateSentInterval:(unsigned int)a7 conversationHash:(int64_t)a8 read:(BOOL)a9 knownToHaveAttachments:(BOOL)a10 flagged:(BOOL)a11 isVIP:(BOOL)a12
{
  result = [(MFMessageInfo *)self init];
  if (result)
  {
    result->_uid = a3;
    result->_dateReceivedInterval = a6;
    result->_sortUid = a3;
    result->_sortDateReceivedInterval = a6;
    result->_dateSentInterval = a7;
    result->_mailboxID = a4;
    result->_conversationHash = a8;
    result->_messageIDHash = a5;
    if (a9) {
      char v19 = 2;
    }
    else {
      char v19 = 0;
    }
    if (a10) {
      char v20 = 16;
    }
    else {
      char v20 = 0;
    }
    if (a12) {
      char v21 = 32;
    }
    else {
      char v21 = 0;
    }
    *((unsigned char *)result + 8) = v20 | v19 | a11 | v21 | *((unsigned char *)result + 8) & 0xCC;
  }
  return result;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
  self->_sortUid = a3;
}

- (void)setDateReceivedInterval:(unsigned int)a3
{
  self->_dateReceivedInterval = a3;
  self->_sortDateReceivedInterval = a3;
}

- (int64_t)generationCompare:(id)a3
{
  int64_t v3 = *((void *)a3 + 6);
  int64_t generationNumber = self->_generationNumber;
  BOOL v5 = v3 <= generationNumber;
  int64_t v6 = v3 < generationNumber;
  if (v5) {
    return v6;
  }
  else {
    return -1;
  }
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && (unsigned int uid = self->_uid) != 0
      && *((_DWORD *)a3 + 5) == uid
      && *((_DWORD *)a3 + 4) == self->_mailboxID;
}

- (unint64_t)hash
{
  unint64_t result = self->_uid;
  if (!result) {
    -[MFMessageInfo hash]();
  }
  return result;
}

- (NSString)description
{
  uint64_t sortUid = self->_sortUid;
  if (self->_uid == sortUid) {
    v4 = &stru_1F265CF90;
  }
  else {
    v4 = (__CFString *)[NSString stringWithFormat:@", sortUid=%u", sortUid];
  }
  if (self->_dateReceivedInterval == self->_sortDateReceivedInterval) {
    BOOL v5 = &stru_1F265CF90;
  }
  else {
    BOOL v5 = (__CFString *)[NSString stringWithFormat:@", sortReceived=%u", self->_sortDateReceivedInterval];
  }
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F60F40]) initWithHash:self->_conversationHash];
  id v7 = (id)[objc_alloc(MEMORY[0x1E4F60F40]) initWithHash:self->_messageIDHash];
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; uid=%u; mailboxID=%U; conversation=%@; messageID=%@; received=%u%@%@; %@;>",
                       objc_opt_class(),
                       self,
                       self->_uid,
                       self->_mailboxID,
                       objc_msgSend(v6, "ef_publicDescription"),
                       objc_msgSend(v7, "ef_publicDescription"),
                       self->_dateReceivedInterval,
                       v4,
                       v5,
                       [(MFMessageInfo *)self _flagDescription]);
}

- (id)_flagDescription
{
  int64_t v3 = NSString;
  [(MFMessageInfo *)self read];
  uint64_t v4 = [v3 stringWithFormat:@"read=%@", NSStringFromBOOL()];
  if ([(MFMessageInfo *)self flagged]) {
    BOOL v5 = @", flagged=YES";
  }
  else {
    BOOL v5 = &stru_1F265CF90;
  }
  if ([(MFMessageInfo *)self isVIP]) {
    id v6 = @", isVIP=YES";
  }
  else {
    id v6 = &stru_1F265CF90;
  }
  BOOL v7 = [(MFMessageInfo *)self isKnownToHaveAttachments];
  v8 = @", hasAttachments=YES";
  if (!v7) {
    v8 = &stru_1F265CF90;
  }
  return (id)[NSString stringWithFormat:@"flags={ %@%@%@%@ }", v4, v5, v6, v8];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  char v5 = *((unsigned char *)self + 8);
  BYTE3(v8) = (v5 & 0x20) != 0;
  BYTE2(v8) = v5 & 1;
  BYTE1(v8) = (v5 & 0x10) != 0;
  LOBYTE(v8) = (v5 & 2) != 0;
  id v6 = objc_msgSend(v4, "initWithUid:mailboxID:messageID:dateReceivedInterval:dateSentInterval:conversationHash:read:knownToHaveAttachments:flagged:isVIP:", self->_uid, self->_mailboxID, self->_messageIDHash, self->_dateReceivedInterval, self->_dateSentInterval, self->_conversationHash, v8);
  objc_msgSend(v6, "setUidIsLibraryID:", -[MFMessageInfo uidIsLibraryID](self, "uidIsLibraryID"));
  return v6;
}

- (unsigned)dateSentInterval
{
  return self->_dateSentInterval;
}

- (void)setDateSentInterval:(unsigned int)a3
{
  self->_dateSentInterval = a3;
}

- (int64_t)conversationHash
{
  return self->_conversationHash;
}

- (void)setConversationHash:(int64_t)a3
{
  self->_conversationHash = a3;
}

- (unsigned)mailboxID
{
  return self->_mailboxID;
}

- (void)setMailboxID:(unsigned int)a3
{
  self->_mailboxID = a3;
}

- (int64_t)generationNumber
{
  return self->_generationNumber;
}

- (unsigned)uid
{
  return self->_uid;
}

- (unsigned)dateReceivedInterval
{
  return self->_dateReceivedInterval;
}

- (int64_t)messageIDHash
{
  return self->_messageIDHash;
}

- (void)setMessageIDHash:(int64_t)a3
{
  self->_messageIDHash = a3;
}

- (unsigned)sortUid
{
  return self->_sortUid;
}

- (void)setSortUid:(unsigned int)a3
{
  self->_uint64_t sortUid = a3;
}

- (unsigned)sortDateReceivedInterval
{
  return self->_sortDateReceivedInterval;
}

- (void)setSortDateReceivedInterval:(unsigned int)a3
{
  self->_sortDateReceivedInterval = a3;
}

- (void)hash
{
}

@end