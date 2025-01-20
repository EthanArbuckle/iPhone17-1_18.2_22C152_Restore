@interface APPBTransparencyDetails
- (BOOL)hasTargetingExpressionId;
- (BOOL)hasTransparencyDetailsUnavailableMessage;
- (BOOL)hasTransparencyRendererPayload;
- (BOOL)hasTransparencyRendererURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)targetingExpressionId;
- (NSString)transparencyDetailsUnavailableMessage;
- (NSString)transparencyRendererPayload;
- (NSString)transparencyRendererURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTargetingExpressionId:(id)a3;
- (void)setTransparencyDetailsUnavailableMessage:(id)a3;
- (void)setTransparencyRendererPayload:(id)a3;
- (void)setTransparencyRendererURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBTransparencyDetails

- (BOOL)hasTransparencyDetailsUnavailableMessage
{
  return self->_transparencyDetailsUnavailableMessage != 0;
}

- (BOOL)hasTransparencyRendererPayload
{
  return self->_transparencyRendererPayload != 0;
}

- (BOOL)hasTransparencyRendererURL
{
  return self->_transparencyRendererURL != 0;
}

- (BOOL)hasTargetingExpressionId
{
  return self->_targetingExpressionId != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBTransparencyDetails;
  v3 = [(APPBTransparencyDetails *)&v7 description];
  v4 = [(APPBTransparencyDetails *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  transparencyDetailsUnavailableMessage = self->_transparencyDetailsUnavailableMessage;
  if (transparencyDetailsUnavailableMessage) {
    [v3 setObject:transparencyDetailsUnavailableMessage forKey:@"transparencyDetailsUnavailableMessage"];
  }
  transparencyRendererPayload = self->_transparencyRendererPayload;
  if (transparencyRendererPayload) {
    [v4 setObject:transparencyRendererPayload forKey:@"transparencyRendererPayload"];
  }
  transparencyRendererURL = self->_transparencyRendererURL;
  if (transparencyRendererURL) {
    [v4 setObject:transparencyRendererURL forKey:@"transparencyRendererURL"];
  }
  targetingExpressionId = self->_targetingExpressionId;
  if (targetingExpressionId) {
    [v4 setObject:targetingExpressionId forKey:@"targetingExpressionId"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBTransparencyDetailsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_transparencyDetailsUnavailableMessage)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_transparencyRendererPayload)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_transparencyRendererURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_targetingExpressionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_transparencyDetailsUnavailableMessage)
  {
    [v4 setTransparencyDetailsUnavailableMessage:];
    id v4 = v5;
  }
  if (self->_transparencyRendererPayload)
  {
    [v5 setTransparencyRendererPayload:];
    id v4 = v5;
  }
  if (self->_transparencyRendererURL)
  {
    [v5 setTransparencyRendererURL:];
    id v4 = v5;
  }
  if (self->_targetingExpressionId)
  {
    [v5 setTargetingExpressionId:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_transparencyDetailsUnavailableMessage copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSString *)self->_transparencyRendererPayload copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(NSString *)self->_transparencyRendererURL copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = [(NSString *)self->_targetingExpressionId copyWithZone:a3];
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((transparencyDetailsUnavailableMessage = self->_transparencyDetailsUnavailableMessage,
         !((unint64_t)transparencyDetailsUnavailableMessage | v4[2]))
     || -[NSString isEqual:](transparencyDetailsUnavailableMessage, "isEqual:"))
    && ((transparencyRendererPayload = self->_transparencyRendererPayload,
         !((unint64_t)transparencyRendererPayload | v4[3]))
     || -[NSString isEqual:](transparencyRendererPayload, "isEqual:"))
    && ((transparencyRendererURL = self->_transparencyRendererURL, !((unint64_t)transparencyRendererURL | v4[4]))
     || -[NSString isEqual:](transparencyRendererURL, "isEqual:")))
  {
    targetingExpressionId = self->_targetingExpressionId;
    if ((unint64_t)targetingExpressionId | v4[1]) {
      unsigned __int8 v9 = -[NSString isEqual:](targetingExpressionId, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_transparencyDetailsUnavailableMessage hash];
  unint64_t v4 = [(NSString *)self->_transparencyRendererPayload hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_transparencyRendererURL hash];
  return v4 ^ v5 ^ [(NSString *)self->_targetingExpressionId hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[2]) {
    -[APPBTransparencyDetails setTransparencyDetailsUnavailableMessage:](self, "setTransparencyDetailsUnavailableMessage:");
  }
  if (v4[3]) {
    -[APPBTransparencyDetails setTransparencyRendererPayload:](self, "setTransparencyRendererPayload:");
  }
  if (v4[4]) {
    -[APPBTransparencyDetails setTransparencyRendererURL:](self, "setTransparencyRendererURL:");
  }
  if (v4[1]) {
    -[APPBTransparencyDetails setTargetingExpressionId:](self, "setTargetingExpressionId:");
  }
}

- (NSString)transparencyDetailsUnavailableMessage
{
  return self->_transparencyDetailsUnavailableMessage;
}

- (void)setTransparencyDetailsUnavailableMessage:(id)a3
{
}

- (NSString)transparencyRendererPayload
{
  return self->_transparencyRendererPayload;
}

- (void)setTransparencyRendererPayload:(id)a3
{
}

- (NSString)transparencyRendererURL
{
  return self->_transparencyRendererURL;
}

- (void)setTransparencyRendererURL:(id)a3
{
}

- (NSString)targetingExpressionId
{
  return self->_targetingExpressionId;
}

- (void)setTargetingExpressionId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transparencyRendererURL, 0);
  objc_storeStrong((id *)&self->_transparencyRendererPayload, 0);
  objc_storeStrong((id *)&self->_transparencyDetailsUnavailableMessage, 0);

  objc_storeStrong((id *)&self->_targetingExpressionId, 0);
}

@end