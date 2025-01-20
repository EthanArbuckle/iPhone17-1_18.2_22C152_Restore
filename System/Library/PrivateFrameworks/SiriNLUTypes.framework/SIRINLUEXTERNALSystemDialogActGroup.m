@interface SIRINLUEXTERNALSystemDialogActGroup
+ (Class)childActsType;
- (BOOL)hasSystemDialogAct;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)childActs;
- (SIRINLUEXTERNALSystemDialogAct)systemDialogAct;
- (id)childActsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)childActsCount;
- (unint64_t)hash;
- (void)addChildActs:(id)a3;
- (void)clearChildActs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChildActs:(id)a3;
- (void)setSystemDialogAct:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALSystemDialogActGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemDialogAct, 0);
  objc_storeStrong((id *)&self->_childActs, 0);
}

- (void)setChildActs:(id)a3
{
}

- (NSMutableArray)childActs
{
  return self->_childActs;
}

- (void)setSystemDialogAct:(id)a3
{
}

- (SIRINLUEXTERNALSystemDialogAct)systemDialogAct
{
  return self->_systemDialogAct;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  systemDialogAct = self->_systemDialogAct;
  uint64_t v6 = *((void *)v4 + 2);
  if (systemDialogAct)
  {
    if (v6) {
      -[SIRINLUEXTERNALSystemDialogAct mergeFrom:](systemDialogAct, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALSystemDialogActGroup setSystemDialogAct:](self, "setSystemDialogAct:");
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
        -[SIRINLUEXTERNALSystemDialogActGroup addChildActs:](self, "addChildActs:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALSystemDialogAct *)self->_systemDialogAct hash];
  return [(NSMutableArray *)self->_childActs hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((systemDialogAct = self->_systemDialogAct, !((unint64_t)systemDialogAct | v4[2]))
     || -[SIRINLUEXTERNALSystemDialogAct isEqual:](systemDialogAct, "isEqual:")))
  {
    childActs = self->_childActs;
    if ((unint64_t)childActs | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](childActs, "isEqual:");
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
  id v6 = [(SIRINLUEXTERNALSystemDialogAct *)self->_systemDialogAct copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_childActs;
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
        [v5 addChildActs:v13];

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
  if (self->_systemDialogAct) {
    objc_msgSend(v8, "setSystemDialogAct:");
  }
  if ([(SIRINLUEXTERNALSystemDialogActGroup *)self childActsCount])
  {
    [v8 clearChildActs];
    unint64_t v4 = [(SIRINLUEXTERNALSystemDialogActGroup *)self childActsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        char v7 = [(SIRINLUEXTERNALSystemDialogActGroup *)self childActsAtIndex:i];
        [v8 addChildActs:v7];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_systemDialogAct) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_childActs;
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
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALSystemDialogActGroupReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  systemDialogAct = self->_systemDialogAct;
  if (systemDialogAct)
  {
    unint64_t v5 = [(SIRINLUEXTERNALSystemDialogAct *)systemDialogAct dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"system_dialog_act"];
  }
  if ([(NSMutableArray *)self->_childActs count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_childActs, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = self->_childActs;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"child_acts"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALSystemDialogActGroup;
  id v4 = [(SIRINLUEXTERNALSystemDialogActGroup *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALSystemDialogActGroup *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)childActsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_childActs objectAtIndex:a3];
}

- (unint64_t)childActsCount
{
  return [(NSMutableArray *)self->_childActs count];
}

- (void)addChildActs:(id)a3
{
  id v4 = a3;
  childActs = self->_childActs;
  id v8 = v4;
  if (!childActs)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_childActs;
    self->_childActs = v6;

    id v4 = v8;
    childActs = self->_childActs;
  }
  [(NSMutableArray *)childActs addObject:v4];
}

- (void)clearChildActs
{
}

- (BOOL)hasSystemDialogAct
{
  return self->_systemDialogAct != 0;
}

+ (Class)childActsType
{
  return (Class)objc_opt_class();
}

@end