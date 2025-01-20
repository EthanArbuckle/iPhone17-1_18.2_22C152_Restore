@interface ICIAMMessageContent
+ (Class)contentParametersType;
+ (Class)imagesType;
+ (Class)messageActionsType;
- (BOOL)hasBody;
- (BOOL)hasCardClickEvent;
- (BOOL)hasCloseClickEvent;
- (BOOL)hasIdentifier;
- (BOOL)hasPageEvent;
- (BOOL)hasSubtitle;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ICIAMMetricEvent)cardClickEvent;
- (ICIAMMetricEvent)closeClickEvent;
- (ICIAMMetricEvent)pageEvent;
- (NSMutableArray)contentParameters;
- (NSMutableArray)images;
- (NSMutableArray)messageActions;
- (NSString)body;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (id)contentParametersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)imagesAtIndex:(unint64_t)a3;
- (id)messageActionsAtIndex:(unint64_t)a3;
- (unint64_t)contentParametersCount;
- (unint64_t)hash;
- (unint64_t)imagesCount;
- (unint64_t)messageActionsCount;
- (void)addContentParameters:(id)a3;
- (void)addImages:(id)a3;
- (void)addMessageActions:(id)a3;
- (void)clearContentParameters;
- (void)clearImages;
- (void)clearMessageActions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBody:(id)a3;
- (void)setCardClickEvent:(id)a3;
- (void)setCloseClickEvent:(id)a3;
- (void)setContentParameters:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImages:(id)a3;
- (void)setMessageActions:(id)a3;
- (void)setPageEvent:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICIAMMessageContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_pageEvent, 0);
  objc_storeStrong((id *)&self->_messageActions, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contentParameters, 0);
  objc_storeStrong((id *)&self->_closeClickEvent, 0);
  objc_storeStrong((id *)&self->_cardClickEvent, 0);

  objc_storeStrong((id *)&self->_body, 0);
}

- (void)setCardClickEvent:(id)a3
{
}

- (ICIAMMetricEvent)cardClickEvent
{
  return self->_cardClickEvent;
}

- (void)setCloseClickEvent:(id)a3
{
}

- (ICIAMMetricEvent)closeClickEvent
{
  return self->_closeClickEvent;
}

- (void)setPageEvent:(id)a3
{
}

- (ICIAMMetricEvent)pageEvent
{
  return self->_pageEvent;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setContentParameters:(id)a3
{
}

- (NSMutableArray)contentParameters
{
  return self->_contentParameters;
}

- (void)setMessageActions:(id)a3
{
}

- (NSMutableArray)messageActions
{
  return self->_messageActions;
}

- (void)setImages:(id)a3
{
}

- (NSMutableArray)images
{
  return self->_images;
}

- (void)setBody:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 10)) {
    -[ICIAMMessageContent setTitle:](self, "setTitle:");
  }
  if (*((void *)v4 + 9)) {
    -[ICIAMMessageContent setSubtitle:](self, "setSubtitle:");
  }
  if (*((void *)v4 + 1)) {
    -[ICIAMMessageContent setBody:](self, "setBody:");
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = *((id *)v4 + 6);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v5);
        }
        [(ICIAMMessageContent *)self addImages:*(void *)(*((void *)&v34 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v7);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = *((id *)v4 + 7);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        [(ICIAMMessageContent *)self addMessageActions:*(void *)(*((void *)&v30 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v12);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = *((id *)v4 + 4);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        -[ICIAMMessageContent addContentParameters:](self, "addContentParameters:", *(void *)(*((void *)&v26 + 1) + 8 * k), (void)v26);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v17);
  }

  if (*((void *)v4 + 5)) {
    -[ICIAMMessageContent setIdentifier:](self, "setIdentifier:");
  }
  pageEvent = self->_pageEvent;
  uint64_t v21 = *((void *)v4 + 8);
  if (pageEvent)
  {
    if (v21) {
      -[ICIAMMetricEvent mergeFrom:](pageEvent, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[ICIAMMessageContent setPageEvent:](self, "setPageEvent:");
  }
  closeClickEvent = self->_closeClickEvent;
  uint64_t v23 = *((void *)v4 + 3);
  if (closeClickEvent)
  {
    if (v23) {
      -[ICIAMMetricEvent mergeFrom:](closeClickEvent, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[ICIAMMessageContent setCloseClickEvent:](self, "setCloseClickEvent:");
  }
  cardClickEvent = self->_cardClickEvent;
  uint64_t v25 = *((void *)v4 + 2);
  if (cardClickEvent)
  {
    if (v25) {
      -[ICIAMMetricEvent mergeFrom:](cardClickEvent, "mergeFrom:");
    }
  }
  else if (v25)
  {
    -[ICIAMMessageContent setCardClickEvent:](self, "setCardClickEvent:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_subtitle hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_body hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_images hash];
  uint64_t v7 = [(NSMutableArray *)self->_messageActions hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_contentParameters hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_identifier hash];
  unint64_t v10 = [(ICIAMMetricEvent *)self->_pageEvent hash];
  unint64_t v11 = v10 ^ [(ICIAMMetricEvent *)self->_closeClickEvent hash];
  return v9 ^ v11 ^ [(ICIAMMetricEvent *)self->_cardClickEvent hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  title = self->_title;
  if ((unint64_t)title | v4[10])
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_22;
    }
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | v4[9] && !-[NSString isEqual:](subtitle, "isEqual:")) {
    goto LABEL_22;
  }
  if (((body = self->_body, !((unint64_t)body | v4[1])) || -[NSString isEqual:](body, "isEqual:"))
    && ((images = self->_images, !((unint64_t)images | v4[6]))
     || -[NSMutableArray isEqual:](images, "isEqual:"))
    && ((messageActions = self->_messageActions, !((unint64_t)messageActions | v4[7]))
     || -[NSMutableArray isEqual:](messageActions, "isEqual:"))
    && ((contentParameters = self->_contentParameters, !((unint64_t)contentParameters | v4[4]))
     || -[NSMutableArray isEqual:](contentParameters, "isEqual:"))
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[5]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((pageEvent = self->_pageEvent, !((unint64_t)pageEvent | v4[8]))
     || -[ICIAMMetricEvent isEqual:](pageEvent, "isEqual:"))
    && ((closeClickEvent = self->_closeClickEvent, !((unint64_t)closeClickEvent | v4[3]))
     || -[ICIAMMetricEvent isEqual:](closeClickEvent, "isEqual:")))
  {
    cardClickEvent = self->_cardClickEvent;
    if ((unint64_t)cardClickEvent | v4[2]) {
      char v15 = -[ICIAMMetricEvent isEqual:](cardClickEvent, "isEqual:");
    }
    else {
      char v15 = 1;
    }
  }
  else
  {
LABEL_22:
    char v15 = 0;
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  NSUInteger v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_title copyWithZone:a3];
  uint64_t v7 = (void *)v5[10];
  v5[10] = v6;

  uint64_t v8 = [(NSString *)self->_subtitle copyWithZone:a3];
  NSUInteger v9 = (void *)v5[9];
  v5[9] = v8;

  uint64_t v10 = [(NSString *)self->_body copyWithZone:a3];
  unint64_t v11 = (void *)v5[1];
  v5[1] = v10;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v12 = self->_images;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v48;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v48 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v47 + 1) + 8 * v16) copyWithZone:a3];
        [v5 addImages:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v14);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v18 = self->_messageActions;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v44;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v44 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = (void *)[*(id *)(*((void *)&v43 + 1) + 8 * v22) copyWithZone:a3];
        [v5 addMessageActions:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v20);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v24 = self->_contentParameters;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v40;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v40 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * v28), "copyWithZone:", a3, (void)v39);
        [v5 addContentParameters:v29];

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v26);
  }

  uint64_t v30 = [(NSString *)self->_identifier copyWithZone:a3];
  long long v31 = (void *)v5[5];
  v5[5] = v30;

  id v32 = [(ICIAMMetricEvent *)self->_pageEvent copyWithZone:a3];
  long long v33 = (void *)v5[8];
  v5[8] = v32;

  id v34 = [(ICIAMMetricEvent *)self->_closeClickEvent copyWithZone:a3];
  long long v35 = (void *)v5[3];
  v5[3] = v34;

  id v36 = [(ICIAMMetricEvent *)self->_cardClickEvent copyWithZone:a3];
  long long v37 = (void *)v5[2];
  v5[2] = v36;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v17 = a3;
  if (self->_title) {
    objc_msgSend(v17, "setTitle:");
  }
  if (self->_subtitle) {
    objc_msgSend(v17, "setSubtitle:");
  }
  if (self->_body) {
    objc_msgSend(v17, "setBody:");
  }
  if ([(ICIAMMessageContent *)self imagesCount])
  {
    [v17 clearImages];
    unint64_t v4 = [(ICIAMMessageContent *)self imagesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ICIAMMessageContent *)self imagesAtIndex:i];
        [v17 addImages:v7];
      }
    }
  }
  if ([(ICIAMMessageContent *)self messageActionsCount])
  {
    [v17 clearMessageActions];
    unint64_t v8 = [(ICIAMMessageContent *)self messageActionsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        unint64_t v11 = [(ICIAMMessageContent *)self messageActionsAtIndex:j];
        [v17 addMessageActions:v11];
      }
    }
  }
  if ([(ICIAMMessageContent *)self contentParametersCount])
  {
    [v17 clearContentParameters];
    unint64_t v12 = [(ICIAMMessageContent *)self contentParametersCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(ICIAMMessageContent *)self contentParametersAtIndex:k];
        [v17 addContentParameters:v15];
      }
    }
  }
  if (self->_identifier) {
    objc_msgSend(v17, "setIdentifier:");
  }
  uint64_t v16 = v17;
  if (self->_pageEvent)
  {
    objc_msgSend(v17, "setPageEvent:");
    uint64_t v16 = v17;
  }
  if (self->_closeClickEvent)
  {
    objc_msgSend(v17, "setCloseClickEvent:");
    uint64_t v16 = v17;
  }
  if (self->_cardClickEvent)
  {
    objc_msgSend(v17, "setCardClickEvent:");
    uint64_t v16 = v17;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_subtitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_body) {
    PBDataWriterWriteStringField();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unint64_t v5 = self->_images;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = self->_messageActions;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = self->_contentParameters;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }

  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_pageEvent) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_closeClickEvent) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_cardClickEvent) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMMessageContentReadFrom((char *)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v4 setObject:subtitle forKey:@"subtitle"];
  }
  body = self->_body;
  if (body) {
    [v4 setObject:body forKey:@"body"];
  }
  if ([(NSMutableArray *)self->_images count])
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_images, "count"));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v9 = self->_images;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v46 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v45 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"images"];
  }
  if ([(NSMutableArray *)self->_messageActions count])
  {
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_messageActions, "count"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v16 = self->_messageActions;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v42 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = [*(id *)(*((void *)&v41 + 1) + 8 * j) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v18);
    }

    [v4 setObject:v15 forKey:@"messageActions"];
  }
  if ([(NSMutableArray *)self->_contentParameters count])
  {
    long long v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_contentParameters, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v23 = self->_contentParameters;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v38;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v38 != v26) {
            objc_enumerationMutation(v23);
          }
          long long v28 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * k), "dictionaryRepresentation", (void)v37);
          [v22 addObject:v28];
        }
        uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v37 objects:v49 count:16];
      }
      while (v25);
    }

    [v4 setObject:v22 forKey:@"contentParameters"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v4 setObject:identifier forKey:@"identifier"];
  }
  pageEvent = self->_pageEvent;
  if (pageEvent)
  {
    long long v31 = [(ICIAMMetricEvent *)pageEvent dictionaryRepresentation];
    [v4 setObject:v31 forKey:@"pageEvent"];
  }
  closeClickEvent = self->_closeClickEvent;
  if (closeClickEvent)
  {
    long long v33 = [(ICIAMMetricEvent *)closeClickEvent dictionaryRepresentation];
    [v4 setObject:v33 forKey:@"closeClickEvent"];
  }
  cardClickEvent = self->_cardClickEvent;
  if (cardClickEvent)
  {
    uint64_t v35 = [(ICIAMMetricEvent *)cardClickEvent dictionaryRepresentation];
    [v4 setObject:v35 forKey:@"cardClickEvent"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICIAMMessageContent;
  id v4 = [(ICIAMMessageContent *)&v8 description];
  unint64_t v5 = [(ICIAMMessageContent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCardClickEvent
{
  return self->_cardClickEvent != 0;
}

- (BOOL)hasCloseClickEvent
{
  return self->_closeClickEvent != 0;
}

- (BOOL)hasPageEvent
{
  return self->_pageEvent != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (id)contentParametersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_contentParameters objectAtIndex:a3];
}

- (unint64_t)contentParametersCount
{
  return [(NSMutableArray *)self->_contentParameters count];
}

- (void)addContentParameters:(id)a3
{
  id v4 = a3;
  contentParameters = self->_contentParameters;
  id v8 = v4;
  if (!contentParameters)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_contentParameters;
    self->_contentParameters = v6;

    id v4 = v8;
    contentParameters = self->_contentParameters;
  }
  [(NSMutableArray *)contentParameters addObject:v4];
}

- (void)clearContentParameters
{
}

- (id)messageActionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_messageActions objectAtIndex:a3];
}

- (unint64_t)messageActionsCount
{
  return [(NSMutableArray *)self->_messageActions count];
}

- (void)addMessageActions:(id)a3
{
  id v4 = a3;
  messageActions = self->_messageActions;
  id v8 = v4;
  if (!messageActions)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_messageActions;
    self->_messageActions = v6;

    id v4 = v8;
    messageActions = self->_messageActions;
  }
  [(NSMutableArray *)messageActions addObject:v4];
}

- (void)clearMessageActions
{
}

- (id)imagesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_images objectAtIndex:a3];
}

- (unint64_t)imagesCount
{
  return [(NSMutableArray *)self->_images count];
}

- (void)addImages:(id)a3
{
  id v4 = a3;
  images = self->_images;
  id v8 = v4;
  if (!images)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_images;
    self->_images = v6;

    id v4 = v8;
    images = self->_images;
  }
  [(NSMutableArray *)images addObject:v4];
}

- (void)clearImages
{
}

- (BOOL)hasBody
{
  return self->_body != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

+ (Class)contentParametersType
{
  return (Class)objc_opt_class();
}

+ (Class)messageActionsType
{
  return (Class)objc_opt_class();
}

+ (Class)imagesType
{
  return (Class)objc_opt_class();
}

@end