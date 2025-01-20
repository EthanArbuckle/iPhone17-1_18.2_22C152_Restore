@interface NSSDiagnosticLogsInfoRespMsgFilesByCategory
+ (Class)filePathsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)filePaths;
- (NSString)directoryPath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)filePathsAtIndex:(unint64_t)a3;
- (id)filesTypeAsString:(int)a3;
- (int)StringAsFilesType:(id)a3;
- (int)filesType;
- (unint64_t)filePathsCount;
- (unint64_t)hash;
- (void)addFilePaths:(id)a3;
- (void)clearFilePaths;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDirectoryPath:(id)a3;
- (void)setFilePaths:(id)a3;
- (void)setFilesType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSDiagnosticLogsInfoRespMsgFilesByCategory

- (id)filesTypeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_2643FB9C0[a3 - 1];
  }
  return v3;
}

- (int)StringAsFilesType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FilesTypeDiagnosticLogs"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FilesTypeSysdiagnoseLogs"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FilesTypeScreenshots"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FilesTypeScreenCaptures"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)clearFilePaths
{
}

- (void)addFilePaths:(id)a3
{
  id v4 = a3;
  filePaths = self->_filePaths;
  id v8 = v4;
  if (!filePaths)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_filePaths;
    self->_filePaths = v6;

    id v4 = v8;
    filePaths = self->_filePaths;
  }
  [(NSMutableArray *)filePaths addObject:v4];
}

- (unint64_t)filePathsCount
{
  return [(NSMutableArray *)self->_filePaths count];
}

- (id)filePathsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_filePaths objectAtIndex:a3];
}

+ (Class)filePathsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSDiagnosticLogsInfoRespMsgFilesByCategory;
  id v4 = [(NSSDiagnosticLogsInfoRespMsgFilesByCategory *)&v8 description];
  v5 = [(NSSDiagnosticLogsInfoRespMsgFilesByCategory *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  unsigned int v4 = self->_filesType - 1;
  if (v4 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_filesType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_2643FB9C0[v4];
  }
  [v3 setObject:v5 forKey:@"filesType"];

  directoryPath = self->_directoryPath;
  if (directoryPath) {
    [v3 setObject:directoryPath forKey:@"directoryPath"];
  }
  filePaths = self->_filePaths;
  if (filePaths) {
    [v3 setObject:filePaths forKey:@"filePaths"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSSDiagnosticLogsInfoRespMsgFilesByCategoryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteStringField();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_filePaths;
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

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[6] = self->_filesType;
  id v9 = v4;
  [v4 setDirectoryPath:self->_directoryPath];
  if ([(NSSDiagnosticLogsInfoRespMsgFilesByCategory *)self filePathsCount])
  {
    [v9 clearFilePaths];
    unint64_t v5 = [(NSSDiagnosticLogsInfoRespMsgFilesByCategory *)self filePathsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NSSDiagnosticLogsInfoRespMsgFilesByCategory *)self filePathsAtIndex:i];
        [v9 addFilePaths:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_filesType;
  uint64_t v6 = [(NSString *)self->_directoryPath copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_filePaths;
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
        [(id)v5 addFilePaths:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_filesType == *((_DWORD *)v4 + 6)
    && ((directoryPath = self->_directoryPath, !((unint64_t)directoryPath | v4[1]))
     || -[NSString isEqual:](directoryPath, "isEqual:")))
  {
    filePaths = self->_filePaths;
    if ((unint64_t)filePaths | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](filePaths, "isEqual:");
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

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_filesType;
  NSUInteger v4 = [(NSString *)self->_directoryPath hash];
  return v4 ^ [(NSMutableArray *)self->_filePaths hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->_filesType = *((_DWORD *)v4 + 6);
  if (*((void *)v4 + 1)) {
    -[NSSDiagnosticLogsInfoRespMsgFilesByCategory setDirectoryPath:](self, "setDirectoryPath:");
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
        -[NSSDiagnosticLogsInfoRespMsgFilesByCategory addFilePaths:](self, "addFilePaths:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (int)filesType
{
  return self->_filesType;
}

- (void)setFilesType:(int)a3
{
  self->_filesType = a3;
}

- (NSString)directoryPath
{
  return self->_directoryPath;
}

- (void)setDirectoryPath:(id)a3
{
}

- (NSMutableArray)filePaths
{
  return self->_filePaths;
}

- (void)setFilePaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePaths, 0);
  objc_storeStrong((id *)&self->_directoryPath, 0);
}

@end