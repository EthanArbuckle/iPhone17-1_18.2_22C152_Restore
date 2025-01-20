@interface NTPBTodayBannerConfig
- (BOOL)hasActionButtonText;
- (BOOL)hasActionURL;
- (BOOL)hasBackgroundMethod;
- (BOOL)hasBody;
- (BOOL)hasDaysVisibleToNewSubscribers;
- (BOOL)hasGradientBackgroundPair;
- (BOOL)hasIdentifier;
- (BOOL)hasImageMethod;
- (BOOL)hasImageURL;
- (BOOL)hasIsEnabled;
- (BOOL)hasNumberOfAppearancesToHide;
- (BOOL)hasNumberOfTapsToHide;
- (BOOL)hasSolidBackgroundColorPair;
- (BOOL)hasTitle;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)actionButtonText;
- (NSString)actionURL;
- (NSString)body;
- (NSString)identifier;
- (NSString)imageURL;
- (NSString)title;
- (NTPBColorGradientPair)gradientBackgroundPair;
- (NTPBColorPair)solidBackgroundColorPair;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)backgroundMethod;
- (int)imageMethod;
- (unint64_t)daysVisibleToNewSubscribers;
- (unint64_t)hash;
- (unint64_t)numberOfAppearancesToHide;
- (unint64_t)numberOfTapsToHide;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActionButtonText:(id)a3;
- (void)setActionURL:(id)a3;
- (void)setBackgroundMethod:(int)a3;
- (void)setBody:(id)a3;
- (void)setDaysVisibleToNewSubscribers:(unint64_t)a3;
- (void)setGradientBackgroundPair:(id)a3;
- (void)setHasBackgroundMethod:(BOOL)a3;
- (void)setHasDaysVisibleToNewSubscribers:(BOOL)a3;
- (void)setHasImageMethod:(BOOL)a3;
- (void)setHasIsEnabled:(BOOL)a3;
- (void)setHasNumberOfAppearancesToHide:(BOOL)a3;
- (void)setHasNumberOfTapsToHide:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageMethod:(int)a3;
- (void)setImageURL:(id)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setNumberOfAppearancesToHide:(unint64_t)a3;
- (void)setNumberOfTapsToHide:(unint64_t)a3;
- (void)setSolidBackgroundColorPair:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTodayBannerConfig

- (void)dealloc
{
  [(NTPBTodayBannerConfig *)self setIdentifier:0];
  [(NTPBTodayBannerConfig *)self setTitle:0];
  [(NTPBTodayBannerConfig *)self setBody:0];
  [(NTPBTodayBannerConfig *)self setActionURL:0];
  [(NTPBTodayBannerConfig *)self setActionButtonText:0];
  [(NTPBTodayBannerConfig *)self setImageURL:0];
  [(NTPBTodayBannerConfig *)self setSolidBackgroundColorPair:0];
  [(NTPBTodayBannerConfig *)self setGradientBackgroundPair:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodayBannerConfig;
  [(NTPBTodayBannerConfig *)&v3 dealloc];
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasBody
{
  return self->_body != 0;
}

- (BOOL)hasActionURL
{
  return self->_actionURL != 0;
}

- (BOOL)hasActionButtonText
{
  return self->_actionButtonText != 0;
}

- (int)imageMethod
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_imageMethod;
  }
  else {
    return 1;
  }
}

- (void)setImageMethod:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_imageMethod = a3;
}

- (void)setHasImageMethod:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasImageMethod
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasImageURL
{
  return self->_imageURL != 0;
}

- (int)backgroundMethod
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_backgroundMethod;
  }
  else {
    return 1;
  }
}

- (void)setBackgroundMethod:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_backgroundMethod = a3;
}

- (void)setHasBackgroundMethod:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBackgroundMethod
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasSolidBackgroundColorPair
{
  return self->_solidBackgroundColorPair != 0;
}

- (BOOL)hasGradientBackgroundPair
{
  return self->_gradientBackgroundPair != 0;
}

- (void)setNumberOfAppearancesToHide:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numberOfAppearancesToHide = a3;
}

- (void)setHasNumberOfAppearancesToHide:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumberOfAppearancesToHide
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumberOfTapsToHide:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numberOfTapsToHide = a3;
}

- (void)setHasNumberOfTapsToHide:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumberOfTapsToHide
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDaysVisibleToNewSubscribers:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_daysVisibleToNewSubscribers = a3;
}

- (void)setHasDaysVisibleToNewSubscribers:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDaysVisibleToNewSubscribers
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isEnabled = a3;
}

- (void)setHasIsEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsEnabled
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodayBannerConfig;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBTodayBannerConfig description](&v3, sel_description), -[NTPBTodayBannerConfig dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  body = self->_body;
  if (body) {
    [v4 setObject:body forKey:@"body"];
  }
  actionURL = self->_actionURL;
  if (actionURL) {
    [v4 setObject:actionURL forKey:@"action_URL"];
  }
  actionButtonText = self->_actionButtonText;
  if (actionButtonText) {
    [v4 setObject:actionButtonText forKey:@"action_button_text"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_imageMethod), @"image_method");
  }
  imageURL = self->_imageURL;
  if (imageURL) {
    [v4 setObject:imageURL forKey:@"imageURL"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_backgroundMethod), @"background_method");
  }
  solidBackgroundColorPair = self->_solidBackgroundColorPair;
  if (solidBackgroundColorPair) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBColorPair dictionaryRepresentation](solidBackgroundColorPair, "dictionaryRepresentation"), @"solidBackgroundColorPair");
  }
  gradientBackgroundPair = self->_gradientBackgroundPair;
  if (gradientBackgroundPair) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBColorGradientPair dictionaryRepresentation](gradientBackgroundPair, "dictionaryRepresentation"), @"gradientBackgroundPair");
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_numberOfAppearancesToHide), @"numberOfAppearancesToHide");
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_23:
      if ((has & 1) == 0) {
        goto LABEL_24;
      }
LABEL_29:
      objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_daysVisibleToNewSubscribers), @"daysVisibleToNewSubscribers");
      if ((*(unsigned char *)&self->_has & 0x20) == 0) {
        return v4;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_numberOfTapsToHide), @"numberOfTapsToHide");
  char has = (char)self->_has;
  if (has) {
    goto LABEL_29;
  }
LABEL_24:
  if ((has & 0x20) != 0) {
LABEL_25:
  }
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isEnabled), @"isEnabled");
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodayBannerConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_body) {
    PBDataWriterWriteStringField();
  }
  if (self->_actionURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_actionButtonText) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_imageURL) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_solidBackgroundColorPair) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_gradientBackgroundPair) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_23:
      if ((has & 1) == 0) {
        goto LABEL_24;
      }
LABEL_28:
      PBDataWriterWriteUint64Field();
      if ((*(unsigned char *)&self->_has & 0x20) == 0) {
        return;
      }
      goto LABEL_29;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if (has) {
    goto LABEL_28;
  }
LABEL_24:
  if ((has & 0x20) == 0) {
    return;
  }
LABEL_29:

  PBDataWriterWriteBOOLField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 72) = [(NSString *)self->_identifier copyWithZone:a3];
  *(void *)(v5 + 104) = [(NSString *)self->_title copyWithZone:a3];

  *(void *)(v5 + 56) = [(NSString *)self->_body copyWithZone:a3];
  *(void *)(v5 + 40) = [(NSString *)self->_actionURL copyWithZone:a3];

  *(void *)(v5 + 32) = [(NSString *)self->_actionButtonText copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_imageMethod;
    *(unsigned char *)(v5 + 116) |= 0x10u;
  }

  *(void *)(v5 + 88) = [(NSString *)self->_imageURL copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_backgroundMethod;
    *(unsigned char *)(v5 + 116) |= 8u;
  }

  *(void *)(v5 + 96) = [(NTPBColorPair *)self->_solidBackgroundColorPair copyWithZone:a3];
  *(void *)(v5 + 64) = [(NTPBColorGradientPair *)self->_gradientBackgroundPair copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_numberOfAppearancesToHide;
    *(unsigned char *)(v5 + 116) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_8;
      }
LABEL_13:
      *(void *)(v5 + 8) = self->_daysVisibleToNewSubscribers;
      *(unsigned char *)(v5 + 116) |= 1u;
      if ((*(unsigned char *)&self->_has & 0x20) == 0) {
        return (id)v5;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *(void *)(v5 + 24) = self->_numberOfTapsToHide;
  *(unsigned char *)(v5 + 116) |= 4u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_13;
  }
LABEL_8:
  if ((has & 0x20) != 0)
  {
LABEL_9:
    *(unsigned char *)(v5 + 112) = self->_isEnabled;
    *(unsigned char *)(v5 + 116) |= 0x20u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    identifier = self->_identifier;
    if (!((unint64_t)identifier | *((void *)a3 + 9))
      || (int v5 = -[NSString isEqual:](identifier, "isEqual:")) != 0)
    {
      title = self->_title;
      if (!((unint64_t)title | *((void *)a3 + 13)) || (int v5 = -[NSString isEqual:](title, "isEqual:")) != 0)
      {
        body = self->_body;
        if (!((unint64_t)body | *((void *)a3 + 7)) || (int v5 = -[NSString isEqual:](body, "isEqual:")) != 0)
        {
          actionURL = self->_actionURL;
          if (!((unint64_t)actionURL | *((void *)a3 + 5))
            || (int v5 = -[NSString isEqual:](actionURL, "isEqual:")) != 0)
          {
            actionButtonText = self->_actionButtonText;
            if (!((unint64_t)actionButtonText | *((void *)a3 + 4))
              || (int v5 = -[NSString isEqual:](actionButtonText, "isEqual:")) != 0)
            {
              char has = (char)self->_has;
              if ((has & 0x10) != 0)
              {
                if ((*((unsigned char *)a3 + 116) & 0x10) == 0 || self->_imageMethod != *((_DWORD *)a3 + 20)) {
                  goto LABEL_46;
                }
              }
              else if ((*((unsigned char *)a3 + 116) & 0x10) != 0)
              {
                goto LABEL_46;
              }
              imageURL = self->_imageURL;
              if ((unint64_t)imageURL | *((void *)a3 + 11))
              {
                int v5 = -[NSString isEqual:](imageURL, "isEqual:");
                if (!v5) {
                  return v5;
                }
                char has = (char)self->_has;
              }
              if ((has & 8) != 0)
              {
                if ((*((unsigned char *)a3 + 116) & 8) == 0 || self->_backgroundMethod != *((_DWORD *)a3 + 12)) {
                  goto LABEL_46;
                }
              }
              else if ((*((unsigned char *)a3 + 116) & 8) != 0)
              {
                goto LABEL_46;
              }
              solidBackgroundColorPair = self->_solidBackgroundColorPair;
              if (!((unint64_t)solidBackgroundColorPair | *((void *)a3 + 12))
                || (int v5 = -[NTPBColorPair isEqual:](solidBackgroundColorPair, "isEqual:")) != 0)
              {
                gradientBackgroundPair = self->_gradientBackgroundPair;
                if (!((unint64_t)gradientBackgroundPair | *((void *)a3 + 8))
                  || (int v5 = -[NTPBColorGradientPair isEqual:](gradientBackgroundPair, "isEqual:")) != 0)
                {
                  if ((*(unsigned char *)&self->_has & 2) != 0)
                  {
                    if ((*((unsigned char *)a3 + 116) & 2) == 0 || self->_numberOfAppearancesToHide != *((void *)a3 + 2)) {
                      goto LABEL_46;
                    }
                  }
                  else if ((*((unsigned char *)a3 + 116) & 2) != 0)
                  {
                    goto LABEL_46;
                  }
                  if ((*(unsigned char *)&self->_has & 4) != 0)
                  {
                    if ((*((unsigned char *)a3 + 116) & 4) == 0 || self->_numberOfTapsToHide != *((void *)a3 + 3)) {
                      goto LABEL_46;
                    }
                  }
                  else if ((*((unsigned char *)a3 + 116) & 4) != 0)
                  {
                    goto LABEL_46;
                  }
                  if (*(unsigned char *)&self->_has)
                  {
                    if ((*((unsigned char *)a3 + 116) & 1) == 0 || self->_daysVisibleToNewSubscribers != *((void *)a3 + 1)) {
                      goto LABEL_46;
                    }
                  }
                  else if (*((unsigned char *)a3 + 116))
                  {
                    goto LABEL_46;
                  }
                  LOBYTE(v5) = (*((unsigned char *)a3 + 116) & 0x20) == 0;
                  if ((*(unsigned char *)&self->_has & 0x20) != 0)
                  {
                    if ((*((unsigned char *)a3 + 116) & 0x20) == 0)
                    {
LABEL_46:
                      LOBYTE(v5) = 0;
                      return v5;
                    }
                    if (self->_isEnabled)
                    {
                      if (!*((unsigned char *)a3 + 112)) {
                        goto LABEL_46;
                      }
                    }
                    else if (*((unsigned char *)a3 + 112))
                    {
                      goto LABEL_46;
                    }
                    LOBYTE(v5) = 1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v17 = [(NSString *)self->_identifier hash];
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_body hash];
  NSUInteger v5 = [(NSString *)self->_actionURL hash];
  NSUInteger v6 = [(NSString *)self->_actionButtonText hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v7 = 2654435761 * self->_imageMethod;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_imageURL hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v9 = 2654435761 * self->_backgroundMethod;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = [(NTPBColorPair *)self->_solidBackgroundColorPair hash];
  unint64_t v11 = [(NTPBColorGradientPair *)self->_gradientBackgroundPair hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v12 = 2654435761u * self->_numberOfAppearancesToHide;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_9:
      unint64_t v13 = 2654435761u * self->_numberOfTapsToHide;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_10;
      }
LABEL_14:
      unint64_t v14 = 0;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_11;
      }
LABEL_15:
      uint64_t v15 = 0;
      return v3 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
    }
  }
  else
  {
    unint64_t v12 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_9;
    }
  }
  unint64_t v13 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_14;
  }
LABEL_10:
  unint64_t v14 = 2654435761u * self->_daysVisibleToNewSubscribers;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_15;
  }
LABEL_11:
  uint64_t v15 = 2654435761 * self->_isEnabled;
  return v3 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 9)) {
    -[NTPBTodayBannerConfig setIdentifier:](self, "setIdentifier:");
  }
  if (*((void *)a3 + 13)) {
    -[NTPBTodayBannerConfig setTitle:](self, "setTitle:");
  }
  if (*((void *)a3 + 7)) {
    -[NTPBTodayBannerConfig setBody:](self, "setBody:");
  }
  if (*((void *)a3 + 5)) {
    -[NTPBTodayBannerConfig setActionURL:](self, "setActionURL:");
  }
  if (*((void *)a3 + 4)) {
    -[NTPBTodayBannerConfig setActionButtonText:](self, "setActionButtonText:");
  }
  if ((*((unsigned char *)a3 + 116) & 0x10) != 0)
  {
    self->_imageMethod = *((_DWORD *)a3 + 20);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)a3 + 11)) {
    -[NTPBTodayBannerConfig setImageURL:](self, "setImageURL:");
  }
  if ((*((unsigned char *)a3 + 116) & 8) != 0)
  {
    self->_backgroundMethod = *((_DWORD *)a3 + 12);
    *(unsigned char *)&self->_has |= 8u;
  }
  solidBackgroundColorPair = self->_solidBackgroundColorPair;
  uint64_t v6 = *((void *)a3 + 12);
  if (solidBackgroundColorPair)
  {
    if (v6) {
      -[NTPBColorPair mergeFrom:](solidBackgroundColorPair, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBTodayBannerConfig setSolidBackgroundColorPair:](self, "setSolidBackgroundColorPair:");
  }
  gradientBackgroundPair = self->_gradientBackgroundPair;
  uint64_t v8 = *((void *)a3 + 8);
  if (gradientBackgroundPair)
  {
    if (v8) {
      -[NTPBColorGradientPair mergeFrom:](gradientBackgroundPair, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBTodayBannerConfig setGradientBackgroundPair:](self, "setGradientBackgroundPair:");
  }
  char v9 = *((unsigned char *)a3 + 116);
  if ((v9 & 2) != 0)
  {
    self->_numberOfAppearancesToHide = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v9 = *((unsigned char *)a3 + 116);
    if ((v9 & 4) == 0)
    {
LABEL_29:
      if ((v9 & 1) == 0) {
        goto LABEL_30;
      }
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)a3 + 116) & 4) == 0)
  {
    goto LABEL_29;
  }
  self->_numberOfTapsToHide = *((void *)a3 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v9 = *((unsigned char *)a3 + 116);
  if ((v9 & 1) == 0)
  {
LABEL_30:
    if ((v9 & 0x20) == 0) {
      return;
    }
    goto LABEL_31;
  }
LABEL_35:
  self->_daysVisibleToNewSubscribers = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 116) & 0x20) == 0) {
    return;
  }
LABEL_31:
  self->_isEnabled = *((unsigned char *)a3 + 112);
  *(unsigned char *)&self->_has |= 0x20u;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSString)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
}

- (NSString)actionButtonText
{
  return self->_actionButtonText;
}

- (void)setActionButtonText:(id)a3
{
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (NTPBColorPair)solidBackgroundColorPair
{
  return self->_solidBackgroundColorPair;
}

- (void)setSolidBackgroundColorPair:(id)a3
{
}

- (NTPBColorGradientPair)gradientBackgroundPair
{
  return self->_gradientBackgroundPair;
}

- (void)setGradientBackgroundPair:(id)a3
{
}

- (unint64_t)numberOfAppearancesToHide
{
  return self->_numberOfAppearancesToHide;
}

- (unint64_t)numberOfTapsToHide
{
  return self->_numberOfTapsToHide;
}

- (unint64_t)daysVisibleToNewSubscribers
{
  return self->_daysVisibleToNewSubscribers;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

@end