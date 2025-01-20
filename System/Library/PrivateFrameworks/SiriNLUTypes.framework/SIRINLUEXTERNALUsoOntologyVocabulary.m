@interface SIRINLUEXTERNALUsoOntologyVocabulary
+ (Class)elementNamesType;
- (BOOL)hasUsoVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)elementNames;
- (SIRINLUEXTERNALSemVer)usoVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)elementNamesAtIndex:(unint64_t)a3;
- (unint64_t)elementNamesCount;
- (unint64_t)hash;
- (void)addElementNames:(id)a3;
- (void)clearElementNames;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setElementNames:(id)a3;
- (void)setUsoVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALUsoOntologyVocabulary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usoVersion, 0);
  objc_storeStrong((id *)&self->_elementNames, 0);
}

- (void)setElementNames:(id)a3
{
}

- (NSMutableArray)elementNames
{
  return self->_elementNames;
}

- (void)setUsoVersion:(id)a3
{
}

- (SIRINLUEXTERNALSemVer)usoVersion
{
  return self->_usoVersion;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  usoVersion = self->_usoVersion;
  uint64_t v6 = *((void *)v4 + 2);
  if (usoVersion)
  {
    if (v6) {
      -[SIRINLUEXTERNALSemVer mergeFrom:](usoVersion, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALUsoOntologyVocabulary setUsoVersion:](self, "setUsoVersion:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[SIRINLUEXTERNALUsoOntologyVocabulary addElementNames:](self, "addElementNames:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALSemVer *)self->_usoVersion hash];
  return [(NSMutableArray *)self->_elementNames hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((usoVersion = self->_usoVersion, !((unint64_t)usoVersion | v4[2]))
     || -[SIRINLUEXTERNALSemVer isEqual:](usoVersion, "isEqual:")))
  {
    elementNames = self->_elementNames;
    if ((unint64_t)elementNames | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](elementNames, "isEqual:");
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
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALSemVer *)self->_usoVersion copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_elementNames;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addElementNames:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_usoVersion) {
    objc_msgSend(v8, "setUsoVersion:");
  }
  if ([(SIRINLUEXTERNALUsoOntologyVocabulary *)self elementNamesCount])
  {
    [v8 clearElementNames];
    unint64_t v4 = [(SIRINLUEXTERNALUsoOntologyVocabulary *)self elementNamesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        char v7 = [(SIRINLUEXTERNALUsoOntologyVocabulary *)self elementNamesAtIndex:i];
        [v8 addElementNames:v7];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_usoVersion) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_elementNames;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUsoOntologyVocabularyReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  usoVersion = self->_usoVersion;
  if (usoVersion)
  {
    unint64_t v5 = [(SIRINLUEXTERNALSemVer *)usoVersion dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"uso_version"];
  }
  elementNames = self->_elementNames;
  if (elementNames) {
    [v3 setObject:elementNames forKey:@"element_names"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALUsoOntologyVocabulary;
  id v4 = [(SIRINLUEXTERNALUsoOntologyVocabulary *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALUsoOntologyVocabulary *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)elementNamesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_elementNames objectAtIndex:a3];
}

- (unint64_t)elementNamesCount
{
  return [(NSMutableArray *)self->_elementNames count];
}

- (void)addElementNames:(id)a3
{
  id v4 = a3;
  elementNames = self->_elementNames;
  id v8 = v4;
  if (!elementNames)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_elementNames;
    self->_elementNames = v6;

    id v4 = v8;
    elementNames = self->_elementNames;
  }
  [(NSMutableArray *)elementNames addObject:v4];
}

- (void)clearElementNames
{
}

- (BOOL)hasUsoVersion
{
  return self->_usoVersion != 0;
}

+ (Class)elementNamesType
{
  return (Class)objc_opt_class();
}

@end