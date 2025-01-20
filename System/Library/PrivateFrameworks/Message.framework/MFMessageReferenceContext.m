@interface MFMessageReferenceContext
- (ECEmailAddressConvertible)bcc;
- (ECEmailAddressConvertible)cc;
- (ECEmailAddressConvertible)sender;
- (ECEmailAddressConvertible)to;
- (ECSubject)subject;
- (EFMutableInt64Set)references;
- (MFMailMessage)message;
- (NSArray)bccList;
- (NSArray)ccList;
- (NSArray)senderList;
- (NSArray)toList;
- (NSMutableDictionary)messageIDsBySubject;
- (NSSet)participants;
- (double)dateSentInterval;
- (int64_t)conversationIDHash;
- (int64_t)libraryID;
- (int64_t)mailboxID;
- (int64_t)messageIDHash;
- (unint64_t)conversationFlagsRef;
- (void)setBcc:(id)a3;
- (void)setBccList:(id)a3;
- (void)setCc:(id)a3;
- (void)setCcList:(id)a3;
- (void)setConversationFlagsRef:(unint64_t *)a3;
- (void)setConversationIDHash:(int64_t)a3;
- (void)setDateSentInterval:(double)a3;
- (void)setLibraryID:(int64_t)a3;
- (void)setMailboxID:(int64_t)a3;
- (void)setMessage:(id)a3;
- (void)setMessageIDHash:(int64_t)a3;
- (void)setMessageIDsBySubject:(id)a3;
- (void)setReferences:(id)a3;
- (void)setSender:(id)a3;
- (void)setSenderList:(id)a3;
- (void)setSubject:(id)a3;
- (void)setTo:(id)a3;
- (void)setToList:(id)a3;
@end

@implementation MFMessageReferenceContext

- (ECEmailAddressConvertible)sender
{
  sender = self->_sender;
  if (sender)
  {
    v3 = sender;
  }
  else
  {
    MFDatabaseEncodedStringForAddressList(self->_senderList);
    v3 = (ECEmailAddressConvertible *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setSender:(id)a3
{
  v4 = (ECEmailAddressConvertible *)a3;
  if (self->_sender != v4)
  {
    v8 = v4;
    v5 = (ECEmailAddressConvertible *)[(ECEmailAddressConvertible *)v4 copyWithZone:0];
    sender = self->_sender;
    self->_sender = v5;

    senderList = self->_senderList;
    self->_senderList = 0;

    v4 = v8;
  }
}

- (NSArray)senderList
{
  senderList = self->_senderList;
  if (senderList)
  {
    v3 = senderList;
  }
  else
  {
    v4 = [(ECEmailAddressConvertible *)self->_sender stringValue];
    MFAddressListFromDatabaseEncodedString(v4);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setSenderList:(id)a3
{
  v4 = (NSArray *)a3;
  if (self->_senderList != v4)
  {
    v8 = v4;
    v5 = (NSArray *)[(NSArray *)v4 copy];
    senderList = self->_senderList;
    self->_senderList = v5;

    sender = self->_sender;
    self->_sender = 0;

    v4 = v8;
  }
}

- (ECEmailAddressConvertible)to
{
  to = self->_to;
  if (to)
  {
    v3 = to;
  }
  else
  {
    MFDatabaseEncodedStringForAddressList(self->_toList);
    v3 = (ECEmailAddressConvertible *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setTo:(id)a3
{
  v4 = (ECEmailAddressConvertible *)a3;
  if (self->_to != v4)
  {
    v8 = v4;
    v5 = (ECEmailAddressConvertible *)[(ECEmailAddressConvertible *)v4 copyWithZone:0];
    to = self->_to;
    self->_to = v5;

    toList = self->_toList;
    self->_toList = 0;

    v4 = v8;
  }
}

- (NSArray)toList
{
  toList = self->_toList;
  if (toList)
  {
    v3 = toList;
  }
  else
  {
    v4 = [(ECEmailAddressConvertible *)self->_to stringValue];
    MFAddressListFromDatabaseEncodedString(v4);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setToList:(id)a3
{
  v4 = (NSArray *)a3;
  if (self->_toList != v4)
  {
    v8 = v4;
    v5 = (NSArray *)[(NSArray *)v4 copy];
    toList = self->_toList;
    self->_toList = v5;

    to = self->_to;
    self->_to = 0;

    v4 = v8;
  }
}

- (ECEmailAddressConvertible)cc
{
  cc = self->_cc;
  if (cc)
  {
    v3 = cc;
  }
  else
  {
    MFDatabaseEncodedStringForAddressList(self->_ccList);
    v3 = (ECEmailAddressConvertible *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setCc:(id)a3
{
  v4 = (ECEmailAddressConvertible *)a3;
  if (self->_cc != v4)
  {
    v8 = v4;
    v5 = (ECEmailAddressConvertible *)[(ECEmailAddressConvertible *)v4 copyWithZone:0];
    cc = self->_cc;
    self->_cc = v5;

    ccList = self->_ccList;
    self->_ccList = 0;

    v4 = v8;
  }
}

- (NSArray)ccList
{
  ccList = self->_ccList;
  if (ccList)
  {
    v3 = ccList;
  }
  else
  {
    v4 = [(ECEmailAddressConvertible *)self->_cc stringValue];
    MFAddressListFromDatabaseEncodedString(v4);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setCcList:(id)a3
{
  v4 = (NSArray *)a3;
  if (self->_ccList != v4)
  {
    v8 = v4;
    v5 = (NSArray *)[(NSArray *)v4 copy];
    ccList = self->_ccList;
    self->_ccList = v5;

    cc = self->_cc;
    self->_cc = 0;

    v4 = v8;
  }
}

- (ECEmailAddressConvertible)bcc
{
  bcc = self->_bcc;
  if (bcc)
  {
    v3 = bcc;
  }
  else
  {
    MFDatabaseEncodedStringForAddressList(self->_bccList);
    v3 = (ECEmailAddressConvertible *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setBcc:(id)a3
{
  v4 = (ECEmailAddressConvertible *)a3;
  if (self->_bcc != v4)
  {
    v8 = v4;
    v5 = (ECEmailAddressConvertible *)[(ECEmailAddressConvertible *)v4 copy];
    bcc = self->_bcc;
    self->_bcc = v5;

    bccList = self->_bccList;
    self->_bccList = 0;

    v4 = v8;
  }
}

- (NSArray)bccList
{
  bccList = self->_bccList;
  if (bccList)
  {
    v3 = bccList;
  }
  else
  {
    v4 = [(ECEmailAddressConvertible *)self->_bcc stringValue];
    MFAddressListFromDatabaseEncodedString(v4);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setBccList:(id)a3
{
  v4 = (NSArray *)a3;
  if (self->_bccList != v4)
  {
    v8 = v4;
    v5 = (NSArray *)[(NSArray *)v4 copy];
    bccList = self->_bccList;
    self->_bccList = v5;

    bcc = self->_bcc;
    self->_bcc = 0;

    v4 = v8;
  }
}

- (NSSet)participants
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__MFMessageReferenceContext_participants__block_invoke;
  aBlock[3] = &unk_1E5D3F320;
  id v4 = v3;
  id v13 = v4;
  v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  v6 = [(MFMessageReferenceContext *)self senderList];
  v5[2](v5, v6);

  v7 = [(MFMessageReferenceContext *)self toList];
  v5[2](v5, v7);

  v8 = [(MFMessageReferenceContext *)self ccList];
  v5[2](v5, v8);

  v9 = [(MFMessageReferenceContext *)self bccList];
  v5[2](v5, v9);

  v10 = (NSSet *)v4;
  return v10;
}

void __41__MFMessageReferenceContext_participants__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__MFMessageReferenceContext_participants__block_invoke_2;
  v3[3] = &unk_1E5D402F0;
  id v4 = *(id *)(a1 + 32);
  [a2 enumerateObjectsUsingBlock:v3];
}

void __41__MFMessageReferenceContext_participants__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v10 = v3;
  v5 = [v10 emailAddressValue];
  v6 = [v5 simpleAddress];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v10 stringValue];
  }
  v9 = v8;

  [v4 addObject:v9];
}

- (MFMailMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (int64_t)libraryID
{
  return self->_libraryID;
}

- (void)setLibraryID:(int64_t)a3
{
  self->_libraryID = a3;
}

- (int64_t)messageIDHash
{
  return self->_messageIDHash;
}

- (void)setMessageIDHash:(int64_t)a3
{
  self->_messageIDHash = a3;
}

- (ECSubject)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (EFMutableInt64Set)references
{
  return self->_references;
}

- (void)setReferences:(id)a3
{
}

- (NSMutableDictionary)messageIDsBySubject
{
  return self->_messageIDsBySubject;
}

- (void)setMessageIDsBySubject:(id)a3
{
}

- (int64_t)mailboxID
{
  return self->_mailboxID;
}

- (void)setMailboxID:(int64_t)a3
{
  self->_mailboxID = a3;
}

- (int64_t)conversationIDHash
{
  return self->_conversationIDHash;
}

- (void)setConversationIDHash:(int64_t)a3
{
  self->_conversationIDHash = a3;
}

- (unint64_t)conversationFlagsRef
{
  return self->_conversationFlagsRef;
}

- (void)setConversationFlagsRef:(unint64_t *)a3
{
  self->_conversationFlagsRef = a3;
}

- (double)dateSentInterval
{
  return self->_dateSentInterval;
}

- (void)setDateSentInterval:(double)a3
{
  self->_dateSentInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIDsBySubject, 0);
  objc_storeStrong((id *)&self->_references, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_bccList, 0);
  objc_storeStrong((id *)&self->_bcc, 0);
  objc_storeStrong((id *)&self->_ccList, 0);
  objc_storeStrong((id *)&self->_cc, 0);
  objc_storeStrong((id *)&self->_toList, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_senderList, 0);
  objc_storeStrong((id *)&self->_sender, 0);
}

@end