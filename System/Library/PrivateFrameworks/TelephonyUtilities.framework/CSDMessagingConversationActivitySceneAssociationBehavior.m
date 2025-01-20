@interface CSDMessagingConversationActivitySceneAssociationBehavior
- (BOOL)hasPreferredSceneSessionRole;
- (BOOL)hasShouldAssociateScene;
- (BOOL)hasTargetContentIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldAssociateScene;
- (NSString)preferredSceneSessionRole;
- (NSString)targetContentIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasShouldAssociateScene:(BOOL)a3;
- (void)setPreferredSceneSessionRole:(id)a3;
- (void)setShouldAssociateScene:(BOOL)a3;
- (void)setTargetContentIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationActivitySceneAssociationBehavior

- (BOOL)hasTargetContentIdentifier
{
  return self->_targetContentIdentifier != 0;
}

- (void)setShouldAssociateScene:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_shouldAssociateScene = a3;
}

- (void)setHasShouldAssociateScene:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasShouldAssociateScene
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasPreferredSceneSessionRole
{
  return self->_preferredSceneSessionRole != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingConversationActivitySceneAssociationBehavior;
  v3 = [(CSDMessagingConversationActivitySceneAssociationBehavior *)&v7 description];
  v4 = [(CSDMessagingConversationActivitySceneAssociationBehavior *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  targetContentIdentifier = self->_targetContentIdentifier;
  if (targetContentIdentifier) {
    [v3 setObject:targetContentIdentifier forKey:@"targetContentIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = +[NSNumber numberWithBool:self->_shouldAssociateScene];
    [v4 setObject:v6 forKey:@"shouldAssociateScene"];
  }
  preferredSceneSessionRole = self->_preferredSceneSessionRole;
  if (preferredSceneSessionRole) {
    [v4 setObject:preferredSceneSessionRole forKey:@"preferredSceneSessionRole"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000BE738((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_targetContentIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_preferredSceneSessionRole)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_targetContentIdentifier)
  {
    objc_msgSend(v4, "setTargetContentIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_shouldAssociateScene;
    v4[28] |= 1u;
  }
  if (self->_preferredSceneSessionRole)
  {
    objc_msgSend(v5, "setPreferredSceneSessionRole:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_targetContentIdentifier copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)v5 + 24) = self->_shouldAssociateScene;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  id v8 = [(NSString *)self->_preferredSceneSessionRole copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  targetContentIdentifier = self->_targetContentIdentifier;
  if ((unint64_t)targetContentIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](targetContentIdentifier, "isEqual:")) {
      goto LABEL_8;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 28))
    {
      if (self->_shouldAssociateScene)
      {
        if (*((unsigned char *)v4 + 24)) {
          goto LABEL_14;
        }
      }
      else if (!*((unsigned char *)v4 + 24))
      {
        goto LABEL_14;
      }
    }
LABEL_8:
    unsigned __int8 v6 = 0;
    goto LABEL_9;
  }
  if (*((unsigned char *)v4 + 28)) {
    goto LABEL_8;
  }
LABEL_14:
  preferredSceneSessionRole = self->_preferredSceneSessionRole;
  if ((unint64_t)preferredSceneSessionRole | *((void *)v4 + 1)) {
    unsigned __int8 v6 = -[NSString isEqual:](preferredSceneSessionRole, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_targetContentIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_shouldAssociateScene;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSString *)self->_preferredSceneSessionRole hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  id v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[CSDMessagingConversationActivitySceneAssociationBehavior setTargetContentIdentifier:](self, "setTargetContentIdentifier:");
    uint64_t v4 = v5;
  }
  if (v4[28])
  {
    self->_shouldAssociateScene = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    -[CSDMessagingConversationActivitySceneAssociationBehavior setPreferredSceneSessionRole:](self, "setPreferredSceneSessionRole:");
    uint64_t v4 = v5;
  }
}

- (NSString)targetContentIdentifier
{
  return self->_targetContentIdentifier;
}

- (void)setTargetContentIdentifier:(id)a3
{
}

- (BOOL)shouldAssociateScene
{
  return self->_shouldAssociateScene;
}

- (NSString)preferredSceneSessionRole
{
  return self->_preferredSceneSessionRole;
}

- (void)setPreferredSceneSessionRole:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContentIdentifier, 0);

  objc_storeStrong((id *)&self->_preferredSceneSessionRole, 0);
}

@end