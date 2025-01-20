@interface APPBElement
- (APPBAdAction)action;
- (APPBAsset)asset;
- (APPBButton)ctaButton;
- (APPBStyle)style;
- (BOOL)hasAccessCaption;
- (BOOL)hasAction;
- (BOOL)hasActionURL;
- (BOOL)hasAsset;
- (BOOL)hasCaption;
- (BOOL)hasCtaButton;
- (BOOL)hasElementID;
- (BOOL)hasStyle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)accessCaption;
- (NSString)actionURL;
- (NSString)caption;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)elementID;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccessCaption:(id)a3;
- (void)setAction:(id)a3;
- (void)setActionURL:(id)a3;
- (void)setAsset:(id)a3;
- (void)setCaption:(id)a3;
- (void)setCtaButton:(id)a3;
- (void)setElementID:(int)a3;
- (void)setHasElementID:(BOOL)a3;
- (void)setStyle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBElement

- (void)setElementID:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_elementID = a3;
}

- (void)setHasElementID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasElementID
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasAsset
{
  return self->_asset != 0;
}

- (BOOL)hasCaption
{
  return self->_caption != 0;
}

- (BOOL)hasAccessCaption
{
  return self->_accessCaption != 0;
}

- (BOOL)hasCtaButton
{
  return self->_ctaButton != 0;
}

- (BOOL)hasActionURL
{
  return self->_actionURL != 0;
}

- (BOOL)hasStyle
{
  return self->_style != 0;
}

- (BOOL)hasAction
{
  return self->_action != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBElement;
  v3 = [(APPBElement *)&v7 description];
  v4 = [(APPBElement *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithInt:self->_elementID];
    [v3 setObject:v4 forKey:@"elementID"];
  }
  asset = self->_asset;
  if (asset)
  {
    v6 = [(APPBAsset *)asset dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"asset"];
  }
  caption = self->_caption;
  if (caption) {
    [v3 setObject:caption forKey:@"caption"];
  }
  accessCaption = self->_accessCaption;
  if (accessCaption) {
    [v3 setObject:accessCaption forKey:@"accessCaption"];
  }
  ctaButton = self->_ctaButton;
  if (ctaButton)
  {
    v10 = [(APPBButton *)ctaButton dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"ctaButton"];
  }
  actionURL = self->_actionURL;
  if (actionURL) {
    [v3 setObject:actionURL forKey:@"actionURL"];
  }
  style = self->_style;
  if (style)
  {
    v13 = [(APPBStyle *)style dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"style"];
  }
  action = self->_action;
  if (action)
  {
    v15 = [(APPBAdAction *)action dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"action"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBElementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_asset)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_caption)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_accessCaption)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_ctaButton)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_actionURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_style)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_action)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[14] = self->_elementID;
    *((unsigned char *)v4 + 72) |= 1u;
  }
  id v5 = v4;
  if (self->_asset)
  {
    [v4 setAsset:];
    id v4 = v5;
  }
  if (self->_caption)
  {
    [v5 setCaption:];
    id v4 = v5;
  }
  if (self->_accessCaption)
  {
    [v5 setAccessCaption:];
    id v4 = v5;
  }
  if (self->_ctaButton)
  {
    [v5 setCtaButton:];
    id v4 = v5;
  }
  if (self->_actionURL)
  {
    [v5 setActionURL:];
    id v4 = v5;
  }
  if (self->_style)
  {
    [v5 setStyle:];
    id v4 = v5;
  }
  if (self->_action)
  {
    [v5 setAction:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 14) = self->_elementID;
    *((unsigned char *)v5 + 72) |= 1u;
  }
  id v7 = [(APPBAsset *)self->_asset copyWithZone:a3];
  v8 = (void *)v6[4];
  v6[4] = v7;

  id v9 = [(NSString *)self->_caption copyWithZone:a3];
  v10 = (void *)v6[5];
  v6[5] = v9;

  id v11 = [(NSString *)self->_accessCaption copyWithZone:a3];
  v12 = (void *)v6[1];
  v6[1] = v11;

  id v13 = [(APPBButton *)self->_ctaButton copyWithZone:a3];
  v14 = (void *)v6[6];
  v6[6] = v13;

  id v15 = [(NSString *)self->_actionURL copyWithZone:a3];
  v16 = (void *)v6[3];
  v6[3] = v15;

  id v17 = [(APPBStyle *)self->_style copyWithZone:a3];
  v18 = (void *)v6[8];
  v6[8] = v17;

  id v19 = [(APPBAdAction *)self->_action copyWithZone:a3];
  v20 = (void *)v6[2];
  v6[2] = v19;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_elementID != *((_DWORD *)v4 + 14)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_21:
    unsigned __int8 v12 = 0;
    goto LABEL_22;
  }
  asset = self->_asset;
  if ((unint64_t)asset | *((void *)v4 + 4) && !-[APPBAsset isEqual:](asset, "isEqual:")) {
    goto LABEL_21;
  }
  caption = self->_caption;
  if ((unint64_t)caption | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](caption, "isEqual:")) {
      goto LABEL_21;
    }
  }
  accessCaption = self->_accessCaption;
  if ((unint64_t)accessCaption | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](accessCaption, "isEqual:")) {
      goto LABEL_21;
    }
  }
  ctaButton = self->_ctaButton;
  if ((unint64_t)ctaButton | *((void *)v4 + 6))
  {
    if (!-[APPBButton isEqual:](ctaButton, "isEqual:")) {
      goto LABEL_21;
    }
  }
  actionURL = self->_actionURL;
  if ((unint64_t)actionURL | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](actionURL, "isEqual:")) {
      goto LABEL_21;
    }
  }
  style = self->_style;
  if ((unint64_t)style | *((void *)v4 + 8))
  {
    if (!-[APPBStyle isEqual:](style, "isEqual:")) {
      goto LABEL_21;
    }
  }
  action = self->_action;
  if ((unint64_t)action | *((void *)v4 + 2)) {
    unsigned __int8 v12 = -[APPBAdAction isEqual:](action, "isEqual:");
  }
  else {
    unsigned __int8 v12 = 1;
  }
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_elementID;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(APPBAsset *)self->_asset hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_caption hash];
  unint64_t v6 = v4 ^ v5 ^ [(NSString *)self->_accessCaption hash];
  unint64_t v7 = [(APPBButton *)self->_ctaButton hash];
  unint64_t v8 = v7 ^ [(NSString *)self->_actionURL hash];
  unint64_t v9 = v6 ^ v8 ^ [(APPBStyle *)self->_style hash];
  return v9 ^ [(APPBAdAction *)self->_action hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = v4;
  if (*((unsigned char *)v4 + 72))
  {
    self->_elementID = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 1u;
  }
  asset = self->_asset;
  uint64_t v7 = v5[4];
  v14 = v5;
  if (asset)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[APPBAsset mergeFrom:](asset, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[APPBElement setAsset:](self, "setAsset:");
  }
  NSUInteger v5 = v14;
LABEL_9:
  if (v5[5])
  {
    -[APPBElement setCaption:](self, "setCaption:");
    NSUInteger v5 = v14;
  }
  if (v5[1])
  {
    -[APPBElement setAccessCaption:](self, "setAccessCaption:");
    NSUInteger v5 = v14;
  }
  ctaButton = self->_ctaButton;
  uint64_t v9 = v5[6];
  if (ctaButton)
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[APPBButton mergeFrom:](ctaButton, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[APPBElement setCtaButton:](self, "setCtaButton:");
  }
  NSUInteger v5 = v14;
LABEL_19:
  if (v5[3])
  {
    -[APPBElement setActionURL:](self, "setActionURL:");
    NSUInteger v5 = v14;
  }
  style = self->_style;
  uint64_t v11 = v5[8];
  if (style)
  {
    if (!v11) {
      goto LABEL_27;
    }
    -[APPBStyle mergeFrom:](style, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_27;
    }
    -[APPBElement setStyle:](self, "setStyle:");
  }
  NSUInteger v5 = v14;
LABEL_27:
  action = self->_action;
  uint64_t v13 = v5[2];
  if (action)
  {
    if (v13) {
      -[APPBAdAction mergeFrom:](action, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[APPBElement setAction:](self, "setAction:");
  }

  _objc_release_x1();
}

- (int)elementID
{
  return self->_elementID;
}

- (APPBAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setCaption:(id)a3
{
}

- (NSString)accessCaption
{
  return self->_accessCaption;
}

- (void)setAccessCaption:(id)a3
{
}

- (APPBButton)ctaButton
{
  return self->_ctaButton;
}

- (void)setCtaButton:(id)a3
{
}

- (NSString)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
}

- (APPBStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (APPBAdAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_ctaButton, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_action, 0);

  objc_storeStrong((id *)&self->_accessCaption, 0);
}

@end