@interface VCPBIntentDefinition
+ (Class)filesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)files;
- (NSString)associatedBundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)filesAtIndex:(unint64_t)a3;
- (unint64_t)filesCount;
- (unint64_t)hash;
- (void)addFiles:(id)a3;
- (void)clearFiles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssociatedBundleID:(id)a3;
- (void)setFiles:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPBIntentDefinition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_associatedBundleID, 0);
}

- (void)setFiles:(id)a3
{
}

- (NSMutableArray)files
{
  return self->_files;
}

- (void)setAssociatedBundleID:(id)a3
{
}

- (NSString)associatedBundleID
{
  return self->_associatedBundleID;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[VCPBIntentDefinition setAssociatedBundleID:](self, "setAssociatedBundleID:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[VCPBIntentDefinition addFiles:](self, "addFiles:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_associatedBundleID hash];
  return [(NSMutableArray *)self->_files hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((associatedBundleID = self->_associatedBundleID, !((unint64_t)associatedBundleID | v4[1]))
     || -[NSString isEqual:](associatedBundleID, "isEqual:")))
  {
    files = self->_files;
    if ((unint64_t)files | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](files, "isEqual:");
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
  uint64_t v6 = [(NSString *)self->_associatedBundleID copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_files;
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
        [v5 addFiles:v13];

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
  [v8 setAssociatedBundleID:self->_associatedBundleID];
  if ([(VCPBIntentDefinition *)self filesCount])
  {
    [v8 clearFiles];
    unint64_t v4 = [(VCPBIntentDefinition *)self filesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        char v7 = [(VCPBIntentDefinition *)self filesAtIndex:i];
        [v8 addFiles:v7];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_associatedBundleID) {
    __assert_rtn("-[VCPBIntentDefinition writeTo:]", "VCPBIntentDefinition.m", 126, "nil != self->_associatedBundleID");
  }
  unint64_t v5 = v4;
  PBDataWriterWriteStringField();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = self->_files;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return VCPBIntentDefinitionReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  associatedBundleID = self->_associatedBundleID;
  if (associatedBundleID) {
    [v3 setObject:associatedBundleID forKey:@"associatedBundleID"];
  }
  if ([(NSMutableArray *)self->_files count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_files, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = self->_files;
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

    [v4 setObject:v6 forKey:@"files"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPBIntentDefinition;
  id v4 = [(VCPBIntentDefinition *)&v8 description];
  unint64_t v5 = [(VCPBIntentDefinition *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)filesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_files objectAtIndex:a3];
}

- (unint64_t)filesCount
{
  return [(NSMutableArray *)self->_files count];
}

- (void)addFiles:(id)a3
{
  id v4 = a3;
  files = self->_files;
  id v8 = v4;
  if (!files)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_files;
    self->_files = v6;

    id v4 = v8;
    files = self->_files;
  }
  [(NSMutableArray *)files addObject:v4];
}

- (void)clearFiles
{
}

+ (Class)filesType
{
  return (Class)objc_opt_class();
}

@end