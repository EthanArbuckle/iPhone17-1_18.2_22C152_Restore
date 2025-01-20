@interface _ICLLCurrentItemTransitionAction
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLCurrentItemTransitionAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionItemId, 0);

  objc_storeStrong((id *)&self->_previousItemId, 0);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_transitionItemId hash];
  return [(NSString *)self->_previousItemId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((transitionItemId = self->_transitionItemId, !((unint64_t)transitionItemId | v4[2]))
     || -[NSString isEqual:](transitionItemId, "isEqual:")))
  {
    previousItemId = self->_previousItemId;
    if ((unint64_t)previousItemId | v4[1]) {
      char v7 = -[NSString isEqual:](previousItemId, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_transitionItemId copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_previousItemId copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_transitionItemId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_previousItemId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLCurrentItemTransitionActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  transitionItemId = self->_transitionItemId;
  if (transitionItemId) {
    [v3 setObject:transitionItemId forKey:@"transitionItemId"];
  }
  previousItemId = self->_previousItemId;
  if (previousItemId) {
    [v4 setObject:previousItemId forKey:@"previousItemId"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLCurrentItemTransitionAction;
  id v4 = [(_ICLLCurrentItemTransitionAction *)&v8 description];
  id v5 = [(_ICLLCurrentItemTransitionAction *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end