@interface _SFPBRFVisualPropertyWithAction
- (BOOL)isEqual:(id)a3;
- (BOOL)is_safe_for_logging;
- (BOOL)readFrom:(id)a3;
- (NSArray)visual_elements;
- (NSData)jsonData;
- (_SFPBCommandButtonItem)commandItem;
- (_SFPBRFVisualPropertyWithAction)initWithDictionary:(id)a3;
- (_SFPBRFVisualPropertyWithAction)initWithFacade:(id)a3;
- (_SFPBRFVisualPropertyWithAction)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)visual_elementsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)visual_elementsCount;
- (void)addVisual_elements:(id)a3;
- (void)clearVisual_elements;
- (void)setCommandItem:(id)a3;
- (void)setIs_safe_for_logging:(BOOL)a3;
- (void)setVisual_elements:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFVisualPropertyWithAction

- (_SFPBRFVisualPropertyWithAction)initWithFacade:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFVisualPropertyWithAction *)self init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "visual_elements");
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v8 = objc_msgSend(v4, "visual_elements", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBRFVisualElement alloc] initWithFacade:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    [(_SFPBRFVisualPropertyWithAction *)v5 setVisual_elements:v7];
    if (objc_msgSend(v4, "hasIs_safe_for_logging")) {
      -[_SFPBRFVisualPropertyWithAction setIs_safe_for_logging:](v5, "setIs_safe_for_logging:", objc_msgSend(v4, "is_safe_for_logging"));
    }
    v14 = [v4 commandItem];

    if (v14)
    {
      v15 = [_SFPBCommandButtonItem alloc];
      v16 = [v4 commandItem];
      v17 = [(_SFPBCommandButtonItem *)v15 initWithFacade:v16];
      [(_SFPBRFVisualPropertyWithAction *)v5 setCommandItem:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandItem, 0);
  objc_storeStrong((id *)&self->_visual_elements, 0);
}

- (_SFPBCommandButtonItem)commandItem
{
  return self->_commandItem;
}

- (BOOL)is_safe_for_logging
{
  return self->_is_safe_for_logging;
}

- (NSArray)visual_elements
{
  return self->_visual_elements;
}

- (_SFPBRFVisualPropertyWithAction)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_SFPBRFVisualPropertyWithAction;
  v5 = [(_SFPBRFVisualPropertyWithAction *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"visualElements"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v21;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [_SFPBRFVisualElement alloc];
              v14 = -[_SFPBRFVisualElement initWithDictionary:](v13, "initWithDictionary:", v12, (void)v20);
              [(_SFPBRFVisualPropertyWithAction *)v5 addVisual_elements:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"isSafeForLogging", (void)v20);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFVisualPropertyWithAction setIs_safe_for_logging:](v5, "setIs_safe_for_logging:", [v15 BOOLValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"commandItem"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [[_SFPBCommandButtonItem alloc] initWithDictionary:v16];
      [(_SFPBRFVisualPropertyWithAction *)v5 setCommandItem:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (_SFPBRFVisualPropertyWithAction)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFVisualPropertyWithAction *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFVisualPropertyWithAction *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_commandItem)
  {
    id v4 = [(_SFPBRFVisualPropertyWithAction *)self commandItem];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"commandItem"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"commandItem"];
    }
  }
  if (self->_is_safe_for_logging)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRFVisualPropertyWithAction is_safe_for_logging](self, "is_safe_for_logging"));
    [v3 setObject:v7 forKeyedSubscript:@"isSafeForLogging"];
  }
  if ([(NSArray *)self->_visual_elements count])
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v9 = self->_visual_elements;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          if (v14)
          {
            [v8 addObject:v14];
          }
          else
          {
            v15 = [MEMORY[0x1E4F1CA98] null];
            [v8 addObject:v15];
          }
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"visualElements"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_visual_elements hash];
  if (self->_is_safe_for_logging) {
    uint64_t v4 = 2654435761;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(_SFPBCommandButtonItem *)self->_commandItem hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  v5 = [(_SFPBRFVisualPropertyWithAction *)self visual_elements];
  v6 = objc_msgSend(v4, "visual_elements");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_12;
  }
  uint64_t v7 = [(_SFPBRFVisualPropertyWithAction *)self visual_elements];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_SFPBRFVisualPropertyWithAction *)self visual_elements];
    uint64_t v10 = objc_msgSend(v4, "visual_elements");
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  int is_safe_for_logging = self->_is_safe_for_logging;
  if (is_safe_for_logging != objc_msgSend(v4, "is_safe_for_logging")) {
    goto LABEL_13;
  }
  v5 = [(_SFPBRFVisualPropertyWithAction *)self commandItem];
  v6 = [v4 commandItem];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v13 = [(_SFPBRFVisualPropertyWithAction *)self commandItem];
  if (!v13)
  {

LABEL_16:
    BOOL v18 = 1;
    goto LABEL_14;
  }
  v14 = (void *)v13;
  v15 = [(_SFPBRFVisualPropertyWithAction *)self commandItem];
  v16 = [v4 commandItem];
  char v17 = [v15 isEqual:v16];

  if (v17) {
    goto LABEL_16;
  }
LABEL_13:
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFVisualPropertyWithAction *)self visual_elements];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if ([(_SFPBRFVisualPropertyWithAction *)self is_safe_for_logging]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v10 = [(_SFPBRFVisualPropertyWithAction *)self commandItem];
  if (v10) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFVisualPropertyWithActionReadFrom(self, (uint64_t)a3);
}

- (void)setCommandItem:(id)a3
{
}

- (void)setIs_safe_for_logging:(BOOL)a3
{
  self->_int is_safe_for_logging = a3;
}

- (id)visual_elementsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_visual_elements objectAtIndexedSubscript:a3];
}

- (unint64_t)visual_elementsCount
{
  return [(NSArray *)self->_visual_elements count];
}

- (void)addVisual_elements:(id)a3
{
  id v4 = a3;
  visual_elements = self->_visual_elements;
  id v8 = v4;
  if (!visual_elements)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_visual_elements;
    self->_visual_elements = v6;

    id v4 = v8;
    visual_elements = self->_visual_elements;
  }
  [(NSArray *)visual_elements addObject:v4];
}

- (void)clearVisual_elements
{
}

- (void)setVisual_elements:(id)a3
{
  self->_visual_elements = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end