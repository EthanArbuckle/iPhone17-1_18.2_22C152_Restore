@interface SIRINLUEXTERNALLanguageVariantResult
+ (Class)multilingualVariantType;
- (BOOL)hasParser;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)multilingualVariants;
- (SIRINLUEXTERNALParser)parser;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)multilingualVariantAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)multilingualVariantsCount;
- (void)addMultilingualVariant:(id)a3;
- (void)clearMultilingualVariants;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMultilingualVariants:(id)a3;
- (void)setParser:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALLanguageVariantResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_multilingualVariants, 0);
}

- (void)setParser:(id)a3
{
}

- (SIRINLUEXTERNALParser)parser
{
  return self->_parser;
}

- (void)setMultilingualVariants:(id)a3
{
}

- (NSMutableArray)multilingualVariants
{
  return self->_multilingualVariants;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4[1];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[SIRINLUEXTERNALLanguageVariantResult addMultilingualVariant:](self, "addMultilingualVariant:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  parser = self->_parser;
  id v11 = v4[2];
  if (parser)
  {
    if (v11) {
      -[SIRINLUEXTERNALParser mergeFrom:](parser, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[SIRINLUEXTERNALLanguageVariantResult setParser:](self, "setParser:");
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_multilingualVariants hash];
  return [(SIRINLUEXTERNALParser *)self->_parser hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((multilingualVariants = self->_multilingualVariants, !((unint64_t)multilingualVariants | v4[1]))
     || -[NSMutableArray isEqual:](multilingualVariants, "isEqual:")))
  {
    parser = self->_parser;
    if ((unint64_t)parser | v4[2]) {
      char v7 = -[SIRINLUEXTERNALParser isEqual:](parser, "isEqual:");
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_multilingualVariants;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "copyWithZone:", a3, (void)v15);
        [v5 addMultilingualVariant:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v12 = [(SIRINLUEXTERNALParser *)self->_parser copyWithZone:a3];
  long long v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(SIRINLUEXTERNALLanguageVariantResult *)self multilingualVariantsCount])
  {
    [v8 clearMultilingualVariants];
    unint64_t v4 = [(SIRINLUEXTERNALLanguageVariantResult *)self multilingualVariantsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(SIRINLUEXTERNALLanguageVariantResult *)self multilingualVariantAtIndex:i];
        [v8 addMultilingualVariant:v7];
      }
    }
  }
  if (self->_parser) {
    objc_msgSend(v8, "setParser:");
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v5 = self->_multilingualVariants;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_parser) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALLanguageVariantResultReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_multilingualVariants count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_multilingualVariants, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    unint64_t v5 = self->_multilingualVariants;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"multilingual_variant"];
  }
  parser = self->_parser;
  if (parser)
  {
    long long v12 = [(SIRINLUEXTERNALParser *)parser dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"parser"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALLanguageVariantResult;
  id v4 = [(SIRINLUEXTERNALLanguageVariantResult *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALLanguageVariantResult *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasParser
{
  return self->_parser != 0;
}

- (id)multilingualVariantAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_multilingualVariants objectAtIndex:a3];
}

- (unint64_t)multilingualVariantsCount
{
  return [(NSMutableArray *)self->_multilingualVariants count];
}

- (void)addMultilingualVariant:(id)a3
{
  id v4 = a3;
  multilingualVariants = self->_multilingualVariants;
  id v8 = v4;
  if (!multilingualVariants)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_multilingualVariants;
    self->_multilingualVariants = v6;

    id v4 = v8;
    multilingualVariants = self->_multilingualVariants;
  }
  [(NSMutableArray *)multilingualVariants addObject:v4];
}

- (void)clearMultilingualVariants
{
}

+ (Class)multilingualVariantType
{
  return (Class)objc_opt_class();
}

@end