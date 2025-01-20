@interface CSDMessagingEncryptedConversationMessage
- (BOOL)hasConversationMessageBytes;
- (BOOL)hasPublicKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)conversationMessageBytes;
- (NSData)publicKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConversationMessageBytes:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingEncryptedConversationMessage

- (BOOL)hasPublicKey
{
  return self->_publicKey != 0;
}

- (BOOL)hasConversationMessageBytes
{
  return self->_conversationMessageBytes != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingEncryptedConversationMessage;
  v3 = [(CSDMessagingEncryptedConversationMessage *)&v7 description];
  v4 = [(CSDMessagingEncryptedConversationMessage *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  publicKey = self->_publicKey;
  if (publicKey) {
    [v3 setObject:publicKey forKey:@"publicKey"];
  }
  conversationMessageBytes = self->_conversationMessageBytes;
  if (conversationMessageBytes) {
    [v4 setObject:conversationMessageBytes forKey:@"conversationMessageBytes"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000B390((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_publicKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_conversationMessageBytes)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_publicKey)
  {
    objc_msgSend(v4, "setPublicKey:");
    id v4 = v5;
  }
  if (self->_conversationMessageBytes)
  {
    objc_msgSend(v5, "setConversationMessageBytes:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_publicKey copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSData *)self->_conversationMessageBytes copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((publicKey = self->_publicKey, !((unint64_t)publicKey | v4[2]))
     || -[NSData isEqual:](publicKey, "isEqual:")))
  {
    conversationMessageBytes = self->_conversationMessageBytes;
    if ((unint64_t)conversationMessageBytes | v4[1]) {
      unsigned __int8 v7 = -[NSData isEqual:](conversationMessageBytes, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_publicKey hash];
  return (unint64_t)[(NSData *)self->_conversationMessageBytes hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[CSDMessagingEncryptedConversationMessage setPublicKey:](self, "setPublicKey:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[CSDMessagingEncryptedConversationMessage setConversationMessageBytes:](self, "setConversationMessageBytes:");
    id v4 = v5;
  }
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (NSData)conversationMessageBytes
{
  return self->_conversationMessageBytes;
}

- (void)setConversationMessageBytes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKey, 0);

  objc_storeStrong((id *)&self->_conversationMessageBytes, 0);
}

@end