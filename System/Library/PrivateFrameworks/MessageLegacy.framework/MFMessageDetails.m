@interface MFMessageDetails
- (BOOL)deleted;
- (BOOL)flagged;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKnownToHaveAttachments;
- (BOOL)isLibraryMessage;
- (BOOL)read;
- (BOOL)senderVIP;
- (MFMailboxUid)mailbox;
- (NSString)description;
- (NSString)externalID;
- (id)copyMessageInfo;
- (id)messageID;
- (id)remoteID;
- (int64_t)conversationHash;
- (int64_t)messageIDHash;
- (unint64_t)hash;
- (unint64_t)messageFlags;
- (unsigned)dateReceivedInterval;
- (unsigned)dateSentInterval;
- (unsigned)libraryID;
- (unsigned)mailboxID;
- (unsigned)uid;
- (void)dealloc;
@end

@implementation MFMessageDetails

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFMessageDetails;
  [(MFMessageDetails *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@:%p libraryID=%u uid=%u flags=0x%x>", NSStringFromClass(v4), self, self->libraryID, self->uid, self->messageFlags];
}

- (BOOL)isEqual:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    unsigned int libraryID = self->libraryID;
    return libraryID == [a3 libraryID];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MFMessageDetails;
    return [(MFMessageDetails *)&v7 isEqual:a3];
  }
}

- (BOOL)isLibraryMessage
{
  return 1;
}

- (unint64_t)hash
{
  return (0x4F1BBCD880000000 * (unint64_t)self->libraryID) >> 32;
}

- (id)remoteID
{
  return (id)EFStringWithInt();
}

- (id)messageID
{
  return (id)EFStringWithInt();
}

- (MFMailboxUid)mailbox
{
  return (MFMailboxUid *)[(MFMessageLibrary *)self->library mailboxUidForMessage:self];
}

- (BOOL)deleted
{
  return (LOBYTE(self->messageFlags) >> 1) & 1;
}

- (BOOL)read
{
  return self->messageFlags & 1;
}

- (BOOL)isKnownToHaveAttachments
{
  int messageFlags = self->messageFlags;
  return (unsigned __int16)messageFlags >> 10 && (unsigned __int16)messageFlags >> 10 != 63;
}

- (BOOL)flagged
{
  return (LOBYTE(self->messageFlags) >> 4) & 1;
}

- (BOOL)senderVIP
{
  return BYTE3(self->messageFlags) & 1;
}

- (id)copyMessageInfo
{
  v15 = [MFMessageInfo alloc];
  uint64_t libraryID = self->libraryID;
  uint64_t mailboxID = self->mailboxID;
  uint64_t dateReceived = self->dateReceived;
  uint64_t dateSent = self->dateSent;
  int64_t conversationHash = self->conversationHash;
  int64_t messageIDHash = self->messageIDHash;
  BOOL v9 = [(MFMessageDetails *)self read];
  BOOL v10 = [(MFMessageDetails *)self isKnownToHaveAttachments];
  BOOL v11 = [(MFMessageDetails *)self flagged];
  BYTE3(v14) = [(MFMessageDetails *)self senderVIP];
  BYTE2(v14) = v11;
  BYTE1(v14) = v10;
  LOBYTE(v14) = v9;
  v12 = -[MFMessageInfo initWithUid:mailboxID:messageID:dateReceivedInterval:dateSentInterval:conversationHash:read:knownToHaveAttachments:flagged:isVIP:](v15, "initWithUid:mailboxID:messageID:dateReceivedInterval:dateSentInterval:conversationHash:read:knownToHaveAttachments:flagged:isVIP:", libraryID, mailboxID, messageIDHash, dateReceived, dateSent, conversationHash, v14);
  [(MFMessageInfo *)v12 setUidIsLibraryID:1];
  return v12;
}

- (unsigned)uid
{
  return self->uid;
}

- (unsigned)libraryID
{
  return self->libraryID;
}

- (unsigned)mailboxID
{
  return self->mailboxID;
}

- (int64_t)messageIDHash
{
  return self->messageIDHash;
}

- (unint64_t)messageFlags
{
  return self->messageFlags;
}

- (unsigned)dateReceivedInterval
{
  return self->dateReceived;
}

- (unsigned)dateSentInterval
{
  return self->dateSent;
}

- (int64_t)conversationHash
{
  return self->conversationHash;
}

- (NSString)externalID
{
  return self->externalID;
}

@end