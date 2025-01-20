@interface CSDMessagingConversationActivityContext
+ (id)activityContextWithTUActivityContext:(id)a3;
- (BOOL)hasActionDescription;
- (BOOL)hasCompletedDescription;
- (BOOL)hasContextIdentifier;
- (BOOL)hasOngoingDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)actionDescription;
- (NSString)completedDescription;
- (NSString)contextIdentifier;
- (NSString)ongoingDescription;
- (TUConversationActivityContext)tuConversationActivityContext;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionDescription:(id)a3;
- (void)setCompletedDescription:(id)a3;
- (void)setContextIdentifier:(id)a3;
- (void)setOngoingDescription:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationActivityContext

+ (id)activityContextWithTUActivityContext:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(CSDMessagingConversationActivityContext);
    v5 = [v3 identifier];
    [(CSDMessagingConversationActivityContext *)v4 setContextIdentifier:v5];

    v6 = [v3 actionDescription];
    [(CSDMessagingConversationActivityContext *)v4 setActionDescription:v6];

    v7 = [v3 ongoingDescription];
    [(CSDMessagingConversationActivityContext *)v4 setOngoingDescription:v7];

    v8 = [v3 completedDescription];

    [(CSDMessagingConversationActivityContext *)v4 setCompletedDescription:v8];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (TUConversationActivityContext)tuConversationActivityContext
{
  if (![(CSDMessagingConversationActivityContext *)self hasContextIdentifier]
    || ([(CSDMessagingConversationActivityContext *)self contextIdentifier],
        id v3 = objc_claimAutoreleasedReturnValue(),
        +[CPGroupActivityDescription activityContextWithDescriptionIdentifier:v3], id v4 = (id)objc_claimAutoreleasedReturnValue(), v3, !v4))
  {
    if ([(CSDMessagingConversationActivityContext *)self hasContextIdentifier]
      && [(CSDMessagingConversationActivityContext *)self hasActionDescription]
      && [(CSDMessagingConversationActivityContext *)self hasOngoingDescription]
      && [(CSDMessagingConversationActivityContext *)self hasCompletedDescription])
    {
      id v5 = objc_alloc((Class)TUConversationActivityContext);
      v6 = [(CSDMessagingConversationActivityContext *)self contextIdentifier];
      v7 = [(CSDMessagingConversationActivityContext *)self actionDescription];
      v8 = [(CSDMessagingConversationActivityContext *)self ongoingDescription];
      v9 = [(CSDMessagingConversationActivityContext *)self completedDescription];
      id v4 = [v5 initWithContextIdentifier:v6 actionDescription:v7 ongoingDescription:v8 completedDescription:v9];
    }
    else
    {
      id v4 = 0;
    }
  }

  return (TUConversationActivityContext *)v4;
}

- (BOOL)hasContextIdentifier
{
  return self->_contextIdentifier != 0;
}

- (BOOL)hasActionDescription
{
  return self->_actionDescription != 0;
}

- (BOOL)hasOngoingDescription
{
  return self->_ongoingDescription != 0;
}

- (BOOL)hasCompletedDescription
{
  return self->_completedDescription != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingConversationActivityContext;
  id v3 = [(CSDMessagingConversationActivityContext *)&v7 description];
  id v4 = [(CSDMessagingConversationActivityContext *)self dictionaryRepresentation];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  contextIdentifier = self->_contextIdentifier;
  if (contextIdentifier) {
    [v3 setObject:contextIdentifier forKey:@"contextIdentifier"];
  }
  actionDescription = self->_actionDescription;
  if (actionDescription) {
    [v4 setObject:actionDescription forKey:@"actionDescription"];
  }
  ongoingDescription = self->_ongoingDescription;
  if (ongoingDescription) {
    [v4 setObject:ongoingDescription forKey:@"ongoingDescription"];
  }
  completedDescription = self->_completedDescription;
  if (completedDescription) {
    [v4 setObject:completedDescription forKey:@"completedDescription"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10007FB6C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_contextIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_actionDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_ongoingDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_completedDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_contextIdentifier)
  {
    objc_msgSend(v4, "setContextIdentifier:");
    id v4 = v5;
  }
  if (self->_actionDescription)
  {
    objc_msgSend(v5, "setActionDescription:");
    id v4 = v5;
  }
  if (self->_ongoingDescription)
  {
    objc_msgSend(v5, "setOngoingDescription:");
    id v4 = v5;
  }
  if (self->_completedDescription)
  {
    objc_msgSend(v5, "setCompletedDescription:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_contextIdentifier copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(NSString *)self->_actionDescription copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(NSString *)self->_ongoingDescription copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = [(NSString *)self->_completedDescription copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((contextIdentifier = self->_contextIdentifier, !((unint64_t)contextIdentifier | v4[3]))
     || -[NSString isEqual:](contextIdentifier, "isEqual:"))
    && ((actionDescription = self->_actionDescription, !((unint64_t)actionDescription | v4[1]))
     || -[NSString isEqual:](actionDescription, "isEqual:"))
    && ((ongoingDescription = self->_ongoingDescription, !((unint64_t)ongoingDescription | v4[4]))
     || -[NSString isEqual:](ongoingDescription, "isEqual:")))
  {
    completedDescription = self->_completedDescription;
    if ((unint64_t)completedDescription | v4[2]) {
      unsigned __int8 v9 = -[NSString isEqual:](completedDescription, "isEqual:");
    }
    else {
      unsigned __int8 v9 = 1;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_contextIdentifier hash];
  unint64_t v4 = [(NSString *)self->_actionDescription hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_ongoingDescription hash];
  return v4 ^ v5 ^ [(NSString *)self->_completedDescription hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[3]) {
    -[CSDMessagingConversationActivityContext setContextIdentifier:](self, "setContextIdentifier:");
  }
  if (v4[1]) {
    -[CSDMessagingConversationActivityContext setActionDescription:](self, "setActionDescription:");
  }
  if (v4[4]) {
    -[CSDMessagingConversationActivityContext setOngoingDescription:](self, "setOngoingDescription:");
  }
  if (v4[2]) {
    -[CSDMessagingConversationActivityContext setCompletedDescription:](self, "setCompletedDescription:");
  }
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void)setContextIdentifier:(id)a3
{
}

- (NSString)actionDescription
{
  return self->_actionDescription;
}

- (void)setActionDescription:(id)a3
{
}

- (NSString)ongoingDescription
{
  return self->_ongoingDescription;
}

- (void)setOngoingDescription:(id)a3
{
}

- (NSString)completedDescription
{
  return self->_completedDescription;
}

- (void)setCompletedDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ongoingDescription, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_completedDescription, 0);

  objc_storeStrong((id *)&self->_actionDescription, 0);
}

@end