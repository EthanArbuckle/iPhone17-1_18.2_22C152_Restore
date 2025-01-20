@interface _ICLLReactionAction
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLReactionAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reactionId, 0);
  objc_storeStrong((id *)&self->_reaction, 0);

  objc_storeStrong((id *)&self->_itemId, 0);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_reactionId hash];
  NSUInteger v4 = [(NSString *)self->_reaction hash] ^ v3;
  return v4 ^ [(NSString *)self->_itemId hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((reactionId = self->_reactionId, !((unint64_t)reactionId | v4[3]))
     || -[NSString isEqual:](reactionId, "isEqual:"))
    && ((reaction = self->_reaction, !((unint64_t)reaction | v4[2]))
     || -[NSString isEqual:](reaction, "isEqual:")))
  {
    itemId = self->_itemId;
    if ((unint64_t)itemId | v4[1]) {
      char v8 = -[NSString isEqual:](itemId, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_reactionId copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_reaction copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_itemId copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_reactionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_reaction)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_itemId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLReactionActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  reactionId = self->_reactionId;
  if (reactionId) {
    [v3 setObject:reactionId forKey:@"reactionId"];
  }
  reaction = self->_reaction;
  if (reaction) {
    [v4 setObject:reaction forKey:@"reaction"];
  }
  itemId = self->_itemId;
  if (itemId) {
    [v4 setObject:itemId forKey:@"itemId"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLReactionAction;
  id v4 = [(_ICLLReactionAction *)&v8 description];
  id v5 = [(_ICLLReactionAction *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end