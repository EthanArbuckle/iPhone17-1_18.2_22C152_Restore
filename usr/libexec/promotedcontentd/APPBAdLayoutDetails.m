@interface APPBAdLayoutDetails
+ (Class)elementsType;
+ (Class)localizedHeadlinesType;
- (APPBButton)ctaButton;
- (APPBStyle)style;
- (BOOL)hasAccessAdCopy;
- (BOOL)hasAccessHeadline;
- (BOOL)hasActionURL;
- (BOOL)hasAdCopy;
- (BOOL)hasAdFormatType;
- (BOOL)hasCtaButton;
- (BOOL)hasHeadline;
- (BOOL)hasSponsoredBy;
- (BOOL)hasSponsoredByAssetURL;
- (BOOL)hasSponsoredByAssetURLForDarkMode;
- (BOOL)hasStyle;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)elements;
- (NSMutableArray)localizedHeadlines;
- (NSString)accessAdCopy;
- (NSString)accessHeadline;
- (NSString)actionURL;
- (NSString)adCopy;
- (NSString)headline;
- (NSString)sponsoredBy;
- (NSString)sponsoredByAssetURL;
- (NSString)sponsoredByAssetURLForDarkMode;
- (id)adFormatTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)elementsAtIndex:(unint64_t)a3;
- (id)localizedHeadlinesAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsAdFormatType:(id)a3;
- (int)StringAsType:(id)a3;
- (int)adFormatType;
- (int)type;
- (unint64_t)elementsCount;
- (unint64_t)hash;
- (unint64_t)localizedHeadlinesCount;
- (void)addElements:(id)a3;
- (void)addLocalizedHeadlines:(id)a3;
- (void)clearElements;
- (void)clearLocalizedHeadlines;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccessAdCopy:(id)a3;
- (void)setAccessHeadline:(id)a3;
- (void)setActionURL:(id)a3;
- (void)setAdCopy:(id)a3;
- (void)setAdFormatType:(int)a3;
- (void)setCtaButton:(id)a3;
- (void)setElements:(id)a3;
- (void)setHasAdFormatType:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHeadline:(id)a3;
- (void)setLocalizedHeadlines:(id)a3;
- (void)setSponsoredBy:(id)a3;
- (void)setSponsoredByAssetURL:(id)a3;
- (void)setSponsoredByAssetURLForDarkMode:(id)a3;
- (void)setStyle:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBAdLayoutDetails

- (int)type
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_type;
  }
  else {
    return 40000;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 40000) >= 9)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100234E30 + a3 - 40000);
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Banner"])
  {
    int v4 = 40000;
  }
  else if ([v3 isEqualToString:@"Video"])
  {
    int v4 = 40001;
  }
  else if ([v3 isEqualToString:@"DRTBrand"])
  {
    int v4 = 40002;
  }
  else if ([v3 isEqualToString:@"DRTNews"])
  {
    int v4 = 40003;
  }
  else if ([v3 isEqualToString:@"DRTVerizon"])
  {
    int v4 = 40004;
  }
  else if ([v3 isEqualToString:@"Native"])
  {
    int v4 = 40005;
  }
  else if ([v3 isEqualToString:@"Carousel"])
  {
    int v4 = 40006;
  }
  else if ([v3 isEqualToString:@"AMP"])
  {
    int v4 = 40007;
  }
  else if ([v3 isEqualToString:@"Sponsorship"])
  {
    int v4 = 40008;
  }
  else
  {
    int v4 = 40000;
  }

  return v4;
}

- (BOOL)hasHeadline
{
  return self->_headline != 0;
}

- (BOOL)hasAccessHeadline
{
  return self->_accessHeadline != 0;
}

- (BOOL)hasAdCopy
{
  return self->_adCopy != 0;
}

- (BOOL)hasAccessAdCopy
{
  return self->_accessAdCopy != 0;
}

- (BOOL)hasSponsoredBy
{
  return self->_sponsoredBy != 0;
}

- (void)clearElements
{
}

- (void)addElements:(id)a3
{
  id v4 = a3;
  elements = self->_elements;
  id v8 = v4;
  if (!elements)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_elements;
    self->_elements = v6;

    id v4 = v8;
    elements = self->_elements;
  }
  [(NSMutableArray *)elements addObject:v4];
}

- (unint64_t)elementsCount
{
  return (unint64_t)[(NSMutableArray *)self->_elements count];
}

- (id)elementsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_elements objectAtIndex:a3];
}

+ (Class)elementsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasStyle
{
  return self->_style != 0;
}

- (int)adFormatType
{
  if (*(unsigned char *)&self->_has) {
    return self->_adFormatType;
  }
  else {
    return 22200;
  }
}

- (void)setAdFormatType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_adFormatType = a3;
}

- (void)setHasAdFormatType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAdFormatType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)adFormatTypeAsString:(int)a3
{
  if ((a3 - 22200) >= 3)
  {
    id v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    id v3 = *(&off_100234E78 + a3 - 22200);
  }

  return v3;
}

- (int)StringAsAdFormatType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Large"])
  {
    int v4 = 22200;
  }
  else if ([v3 isEqualToString:@"Medium"])
  {
    int v4 = 22201;
  }
  else if ([v3 isEqualToString:@"Small"])
  {
    int v4 = 22202;
  }
  else
  {
    int v4 = 22200;
  }

  return v4;
}

- (BOOL)hasSponsoredByAssetURL
{
  return self->_sponsoredByAssetURL != 0;
}

- (BOOL)hasCtaButton
{
  return self->_ctaButton != 0;
}

- (BOOL)hasActionURL
{
  return self->_actionURL != 0;
}

- (BOOL)hasSponsoredByAssetURLForDarkMode
{
  return self->_sponsoredByAssetURLForDarkMode != 0;
}

- (void)clearLocalizedHeadlines
{
}

- (void)addLocalizedHeadlines:(id)a3
{
  id v4 = a3;
  localizedHeadlines = self->_localizedHeadlines;
  id v8 = v4;
  if (!localizedHeadlines)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_localizedHeadlines;
    self->_localizedHeadlines = v6;

    id v4 = v8;
    localizedHeadlines = self->_localizedHeadlines;
  }
  [(NSMutableArray *)localizedHeadlines addObject:v4];
}

- (unint64_t)localizedHeadlinesCount
{
  return (unint64_t)[(NSMutableArray *)self->_localizedHeadlines count];
}

- (id)localizedHeadlinesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_localizedHeadlines objectAtIndex:a3];
}

+ (Class)localizedHeadlinesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBAdLayoutDetails;
  id v3 = [(APPBAdLayoutDetails *)&v7 description];
  id v4 = [(APPBAdLayoutDetails *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    int v4 = self->_type - 40000;
    if (v4 >= 9)
    {
      v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    else
    {
      v5 = *(&off_100234E30 + v4);
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  headline = self->_headline;
  if (headline) {
    [v3 setObject:headline forKey:@"headline"];
  }
  accessHeadline = self->_accessHeadline;
  if (accessHeadline) {
    [v3 setObject:accessHeadline forKey:@"accessHeadline"];
  }
  adCopy = self->_adCopy;
  if (adCopy) {
    [v3 setObject:adCopy forKey:@"adCopy"];
  }
  accessAdCopy = self->_accessAdCopy;
  if (accessAdCopy) {
    [v3 setObject:accessAdCopy forKey:@"accessAdCopy"];
  }
  sponsoredBy = self->_sponsoredBy;
  if (sponsoredBy) {
    [v3 setObject:sponsoredBy forKey:@"sponsoredBy"];
  }
  if ([(NSMutableArray *)self->_elements count])
  {
    id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_elements, "count")];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v12 = self->_elements;
    id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v40;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v40 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v39 + 1) + 8 * i) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"elements"];
  }
  style = self->_style;
  if (style)
  {
    v19 = [(APPBStyle *)style dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"style"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int v20 = self->_adFormatType - 22200;
    if (v20 >= 3)
    {
      v21 = +[NSString stringWithFormat:@"(unknown: %i)", self->_adFormatType];
    }
    else
    {
      v21 = *(&off_100234E78 + v20);
    }
    [v3 setObject:v21 forKey:@"adFormatType"];
  }
  sponsoredByAssetURL = self->_sponsoredByAssetURL;
  if (sponsoredByAssetURL) {
    [v3 setObject:sponsoredByAssetURL forKey:@"sponsoredByAssetURL"];
  }
  ctaButton = self->_ctaButton;
  if (ctaButton)
  {
    v24 = [(APPBButton *)ctaButton dictionaryRepresentation];
    [v3 setObject:v24 forKey:@"ctaButton"];
  }
  actionURL = self->_actionURL;
  if (actionURL) {
    [v3 setObject:actionURL forKey:@"actionURL"];
  }
  sponsoredByAssetURLForDarkMode = self->_sponsoredByAssetURLForDarkMode;
  if (sponsoredByAssetURLForDarkMode) {
    [v3 setObject:sponsoredByAssetURLForDarkMode forKey:@"sponsoredByAssetURLForDarkMode"];
  }
  if ([(NSMutableArray *)self->_localizedHeadlines count])
  {
    id v27 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_localizedHeadlines, "count")];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v28 = self->_localizedHeadlines;
    id v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v36;
      do
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(void *)v36 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [*(id *)(*((void *)&v35 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v27 addObject:v33];
        }
        id v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v30);
    }

    [v3 setObject:v27 forKey:@"localizedHeadlines"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdLayoutDetailsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_headline) {
    PBDataWriterWriteStringField();
  }
  if (self->_accessHeadline) {
    PBDataWriterWriteStringField();
  }
  if (self->_adCopy) {
    PBDataWriterWriteStringField();
  }
  if (self->_accessAdCopy) {
    PBDataWriterWriteStringField();
  }
  if (self->_sponsoredBy) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_elements;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (self->_style) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_sponsoredByAssetURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_ctaButton) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_actionURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_sponsoredByAssetURLForDarkMode) {
    PBDataWriterWriteStringField();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_localizedHeadlines;
  id v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[28] = self->_type;
    *((unsigned char *)v4 + 116) |= 2u;
  }
  id v13 = v4;
  if (self->_headline) {
    [v4 setHeadline:];
  }
  if (self->_accessHeadline) {
    [v13 setAccessHeadline:];
  }
  if (self->_adCopy) {
    [v13 setAdCopy:];
  }
  if (self->_accessAdCopy) {
    [v13 setAccessAdCopy:];
  }
  if (self->_sponsoredBy) {
    [v13 setSponsoredBy:];
  }
  if ([(APPBAdLayoutDetails *)self elementsCount])
  {
    [v13 clearElements];
    unint64_t v5 = [(APPBAdLayoutDetails *)self elementsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(APPBAdLayoutDetails *)self elementsAtIndex:i];
        [v13 addElements:v8];
      }
    }
  }
  if (self->_style) {
    [v13 setStyle:];
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v13 + 10) = self->_adFormatType;
    *((unsigned char *)v13 + 116) |= 1u;
  }
  if (self->_sponsoredByAssetURL) {
    [v13 setSponsoredByAssetURL:];
  }
  if (self->_ctaButton) {
    [v13 setCtaButton:];
  }
  if (self->_actionURL) {
    [v13 setActionURL:];
  }
  if (self->_sponsoredByAssetURLForDarkMode) {
    [v13 setSponsoredByAssetURLForDarkMode:];
  }
  if ([(APPBAdLayoutDetails *)self localizedHeadlinesCount])
  {
    [v13 clearLocalizedHeadlines];
    unint64_t v9 = [(APPBAdLayoutDetails *)self localizedHeadlinesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        v12 = [(APPBAdLayoutDetails *)self localizedHeadlinesAtIndex:j];
        [v13 addLocalizedHeadlines:v12];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[28] = self->_type;
    *((unsigned char *)v5 + 116) |= 2u;
  }
  id v7 = [(NSString *)self->_headline copyWithZone:a3];
  uint64_t v8 = (void *)v6[8];
  v6[8] = v7;

  id v9 = [(NSString *)self->_accessHeadline copyWithZone:a3];
  unint64_t v10 = (void *)v6[2];
  v6[2] = v9;

  id v11 = [(NSString *)self->_adCopy copyWithZone:a3];
  v12 = (void *)v6[4];
  v6[4] = v11;

  id v13 = [(NSString *)self->_accessAdCopy copyWithZone:a3];
  id v14 = (void *)v6[1];
  v6[1] = v13;

  id v15 = [(NSString *)self->_sponsoredBy copyWithZone:a3];
  long long v16 = (void *)v6[10];
  v6[10] = v15;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v17 = self->_elements;
  id v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v45;
    do
    {
      long long v21 = 0;
      do
      {
        if (*(void *)v45 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = [*(id *)(*((void *)&v44 + 1) + 8 * (void)v21) copyWithZone:a3];
        [v6 addElements:v22];

        long long v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      id v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v19);
  }

  id v23 = [(APPBStyle *)self->_style copyWithZone:a3];
  v24 = (void *)v6[13];
  v6[13] = v23;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v6 + 10) = self->_adFormatType;
    *((unsigned char *)v6 + 116) |= 1u;
  }
  id v25 = [(NSString *)self->_sponsoredByAssetURL copyWithZone:a3];
  v26 = (void *)v6[11];
  v6[11] = v25;

  id v27 = [(APPBButton *)self->_ctaButton copyWithZone:a3];
  v28 = (void *)v6[6];
  v6[6] = v27;

  id v29 = [(NSString *)self->_actionURL copyWithZone:a3];
  id v30 = (void *)v6[3];
  v6[3] = v29;

  id v31 = [(NSString *)self->_sponsoredByAssetURLForDarkMode copyWithZone:a3];
  v32 = (void *)v6[12];
  v6[12] = v31;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v33 = self->_localizedHeadlines;
  id v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v41;
    do
    {
      long long v37 = 0;
      do
      {
        if (*(void *)v41 != v36) {
          objc_enumerationMutation(v33);
        }
        id v38 = [*(id *)(*((void *)&v40 + 1) + 8 * (void)v37) copyWithZone:a3];
        [v6 addLocalizedHeadlines:v38];

        long long v37 = (char *)v37 + 1;
      }
      while (v35 != v37);
      id v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v35);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 2) == 0 || self->_type != *((_DWORD *)v4 + 28)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 2) != 0)
  {
LABEL_36:
    unsigned __int8 v17 = 0;
    goto LABEL_37;
  }
  headline = self->_headline;
  if ((unint64_t)headline | *((void *)v4 + 8) && !-[NSString isEqual:](headline, "isEqual:")) {
    goto LABEL_36;
  }
  accessHeadline = self->_accessHeadline;
  if ((unint64_t)accessHeadline | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](accessHeadline, "isEqual:")) {
      goto LABEL_36;
    }
  }
  adCopy = self->_adCopy;
  if ((unint64_t)adCopy | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](adCopy, "isEqual:")) {
      goto LABEL_36;
    }
  }
  accessAdCopy = self->_accessAdCopy;
  if ((unint64_t)accessAdCopy | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](accessAdCopy, "isEqual:")) {
      goto LABEL_36;
    }
  }
  sponsoredBy = self->_sponsoredBy;
  if ((unint64_t)sponsoredBy | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](sponsoredBy, "isEqual:")) {
      goto LABEL_36;
    }
  }
  elements = self->_elements;
  if ((unint64_t)elements | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](elements, "isEqual:")) {
      goto LABEL_36;
    }
  }
  style = self->_style;
  if ((unint64_t)style | *((void *)v4 + 13))
  {
    if (!-[APPBStyle isEqual:](style, "isEqual:")) {
      goto LABEL_36;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 116) & 1) == 0 || self->_adFormatType != *((_DWORD *)v4 + 10)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 116))
  {
    goto LABEL_36;
  }
  sponsoredByAssetURL = self->_sponsoredByAssetURL;
  if ((unint64_t)sponsoredByAssetURL | *((void *)v4 + 11)
    && !-[NSString isEqual:](sponsoredByAssetURL, "isEqual:"))
  {
    goto LABEL_36;
  }
  ctaButton = self->_ctaButton;
  if ((unint64_t)ctaButton | *((void *)v4 + 6))
  {
    if (!-[APPBButton isEqual:](ctaButton, "isEqual:")) {
      goto LABEL_36;
    }
  }
  actionURL = self->_actionURL;
  if ((unint64_t)actionURL | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](actionURL, "isEqual:")) {
      goto LABEL_36;
    }
  }
  sponsoredByAssetURLForDarkMode = self->_sponsoredByAssetURLForDarkMode;
  if ((unint64_t)sponsoredByAssetURLForDarkMode | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](sponsoredByAssetURLForDarkMode, "isEqual:")) {
      goto LABEL_36;
    }
  }
  localizedHeadlines = self->_localizedHeadlines;
  if ((unint64_t)localizedHeadlines | *((void *)v4 + 9)) {
    unsigned __int8 v17 = -[NSMutableArray isEqual:](localizedHeadlines, "isEqual:");
  }
  else {
    unsigned __int8 v17 = 1;
  }
LABEL_37:

  return v17;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_headline hash];
  NSUInteger v5 = [(NSString *)self->_accessHeadline hash];
  NSUInteger v6 = [(NSString *)self->_adCopy hash];
  NSUInteger v7 = [(NSString *)self->_accessAdCopy hash];
  NSUInteger v8 = [(NSString *)self->_sponsoredBy hash];
  unint64_t v9 = (unint64_t)[(NSMutableArray *)self->_elements hash];
  unint64_t v10 = [(APPBStyle *)self->_style hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = 2654435761 * self->_adFormatType;
  }
  else {
    uint64_t v11 = 0;
  }
  NSUInteger v12 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  unint64_t v13 = v10 ^ v11 ^ [(NSString *)self->_sponsoredByAssetURL hash];
  unint64_t v14 = v12 ^ v13 ^ [(APPBButton *)self->_ctaButton hash];
  NSUInteger v15 = [(NSString *)self->_actionURL hash];
  unint64_t v16 = v15 ^ [(NSString *)self->_sponsoredByAssetURLForDarkMode hash];
  return v14 ^ v16 ^ (unint64_t)[(NSMutableArray *)self->_localizedHeadlines hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  id v5 = v4;
  if ((v4[29] & 2) != 0)
  {
    self->_type = v4[28];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 8)) {
    -[APPBAdLayoutDetails setHeadline:](self, "setHeadline:");
  }
  if (*((void *)v5 + 2)) {
    -[APPBAdLayoutDetails setAccessHeadline:](self, "setAccessHeadline:");
  }
  if (*((void *)v5 + 4)) {
    -[APPBAdLayoutDetails setAdCopy:](self, "setAdCopy:");
  }
  if (*((void *)v5 + 1)) {
    -[APPBAdLayoutDetails setAccessAdCopy:](self, "setAccessAdCopy:");
  }
  if (*((void *)v5 + 10)) {
    -[APPBAdLayoutDetails setSponsoredBy:](self, "setSponsoredBy:");
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = *((id *)v5 + 7);
  id v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        [(APPBAdLayoutDetails *)self addElements:*(void *)(*((void *)&v24 + 1) + 8 * i)];
      }
      id v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }

  style = self->_style;
  uint64_t v12 = *((void *)v5 + 13);
  if (style)
  {
    if (v12) {
      -[APPBStyle mergeFrom:](style, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[APPBAdLayoutDetails setStyle:](self, "setStyle:");
  }
  if (*((unsigned char *)v5 + 116))
  {
    self->_adFormatType = *((_DWORD *)v5 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v5 + 11)) {
    -[APPBAdLayoutDetails setSponsoredByAssetURL:](self, "setSponsoredByAssetURL:");
  }
  ctaButton = self->_ctaButton;
  uint64_t v14 = *((void *)v5 + 6);
  if (ctaButton)
  {
    if (v14) {
      -[APPBButton mergeFrom:](ctaButton, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[APPBAdLayoutDetails setCtaButton:](self, "setCtaButton:");
  }
  if (*((void *)v5 + 3)) {
    -[APPBAdLayoutDetails setActionURL:](self, "setActionURL:");
  }
  if (*((void *)v5 + 12)) {
    -[APPBAdLayoutDetails setSponsoredByAssetURLForDarkMode:](self, "setSponsoredByAssetURLForDarkMode:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = *((id *)v5 + 9);
  id v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v17; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[APPBAdLayoutDetails addLocalizedHeadlines:](self, "addLocalizedHeadlines:", *(void *)(*((void *)&v20 + 1) + 8 * (void)j), (void)v20);
      }
      id v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }
}

- (NSString)headline
{
  return self->_headline;
}

- (void)setHeadline:(id)a3
{
}

- (NSString)accessHeadline
{
  return self->_accessHeadline;
}

- (void)setAccessHeadline:(id)a3
{
}

- (NSString)adCopy
{
  return self->_adCopy;
}

- (void)setAdCopy:(id)a3
{
}

- (NSString)accessAdCopy
{
  return self->_accessAdCopy;
}

- (void)setAccessAdCopy:(id)a3
{
}

- (NSString)sponsoredBy
{
  return self->_sponsoredBy;
}

- (void)setSponsoredBy:(id)a3
{
}

- (NSMutableArray)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
}

- (APPBStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (NSString)sponsoredByAssetURL
{
  return self->_sponsoredByAssetURL;
}

- (void)setSponsoredByAssetURL:(id)a3
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

- (NSString)sponsoredByAssetURLForDarkMode
{
  return self->_sponsoredByAssetURLForDarkMode;
}

- (void)setSponsoredByAssetURLForDarkMode:(id)a3
{
}

- (NSMutableArray)localizedHeadlines
{
  return self->_localizedHeadlines;
}

- (void)setLocalizedHeadlines:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_sponsoredByAssetURLForDarkMode, 0);
  objc_storeStrong((id *)&self->_sponsoredByAssetURL, 0);
  objc_storeStrong((id *)&self->_sponsoredBy, 0);
  objc_storeStrong((id *)&self->_localizedHeadlines, 0);
  objc_storeStrong((id *)&self->_headline, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_ctaButton, 0);
  objc_storeStrong((id *)&self->_adCopy, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_accessHeadline, 0);

  objc_storeStrong((id *)&self->_accessAdCopy, 0);
}

@end