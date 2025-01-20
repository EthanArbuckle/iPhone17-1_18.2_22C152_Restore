@interface APPBLogAdContentErrorRequest
+ (Class)functionNamesType;
+ (Class)linesType;
+ (id)options;
- (APPBLogMetaData)metaData;
- (BOOL)hasErrorMessage;
- (BOOL)hasErrorType;
- (BOOL)hasLineNumber;
- (BOOL)hasMetaData;
- (BOOL)hasURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)functionNames;
- (NSMutableArray)lines;
- (NSString)errorMessage;
- (NSString)uRL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)errorTypeAsString:(int)a3;
- (id)functionNamesAtIndex:(unint64_t)a3;
- (id)linesAtIndex:(unint64_t)a3;
- (int)StringAsErrorType:(id)a3;
- (int)errorType;
- (int)lineNumber;
- (unint64_t)functionNamesCount;
- (unint64_t)hash;
- (unint64_t)linesCount;
- (void)addFunctionNames:(id)a3;
- (void)addLines:(id)a3;
- (void)clearFunctionNames;
- (void)clearLines;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setErrorType:(int)a3;
- (void)setFunctionNames:(id)a3;
- (void)setHasErrorType:(BOOL)a3;
- (void)setHasLineNumber:(BOOL)a3;
- (void)setLineNumber:(int)a3;
- (void)setLines:(id)a3;
- (void)setMetaData:(id)a3;
- (void)setURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBLogAdContentErrorRequest

+ (id)options
{
  if (qword_100289B00 != -1) {
    dispatch_once(&qword_100289B00, &stru_100236110);
  }
  v2 = (void *)qword_100289AF8;

  return v2;
}

- (BOOL)hasMetaData
{
  return self->_metaData != 0;
}

- (int)errorType
{
  if (*(unsigned char *)&self->_has) {
    return self->_errorType;
  }
  else {
    return 1;
  }
}

- (void)setErrorType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_errorType = a3;
}

- (void)setHasErrorType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)errorTypeAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"ParseError";
  }
  else if (a3 == 2)
  {
    v4 = @"Exception";
  }
  else
  {
    v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  return v4;
}

- (int)StringAsErrorType:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"ParseError"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"Exception"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
}

- (void)setLineNumber:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_lineNumber = a3;
}

- (void)setHasLineNumber:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLineNumber
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasURL
{
  return self->_uRL != 0;
}

- (void)clearLines
{
}

- (void)addLines:(id)a3
{
  id v4 = a3;
  lines = self->_lines;
  id v8 = v4;
  if (!lines)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_lines;
    self->_lines = v6;

    id v4 = v8;
    lines = self->_lines;
  }
  [(NSMutableArray *)lines addObject:v4];
}

- (unint64_t)linesCount
{
  return (unint64_t)[(NSMutableArray *)self->_lines count];
}

- (id)linesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_lines objectAtIndex:a3];
}

+ (Class)linesType
{
  return (Class)objc_opt_class();
}

- (void)clearFunctionNames
{
}

- (void)addFunctionNames:(id)a3
{
  id v4 = a3;
  functionNames = self->_functionNames;
  id v8 = v4;
  if (!functionNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_functionNames;
    self->_functionNames = v6;

    id v4 = v8;
    functionNames = self->_functionNames;
  }
  [(NSMutableArray *)functionNames addObject:v4];
}

- (unint64_t)functionNamesCount
{
  return (unint64_t)[(NSMutableArray *)self->_functionNames count];
}

- (id)functionNamesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_functionNames objectAtIndex:a3];
}

+ (Class)functionNamesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBLogAdContentErrorRequest;
  char v3 = [(APPBLogAdContentErrorRequest *)&v7 description];
  id v4 = [(APPBLogAdContentErrorRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  metaData = self->_metaData;
  if (metaData)
  {
    v5 = [(APPBLogMetaData *)metaData dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"metaData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int errorType = self->_errorType;
    if (errorType == 1)
    {
      objc_super v7 = @"ParseError";
    }
    else if (errorType == 2)
    {
      objc_super v7 = @"Exception";
    }
    else
    {
      objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_errorType];
    }
    [v3 setObject:v7 forKey:@"errorType"];
  }
  errorMessage = self->_errorMessage;
  if (errorMessage) {
    [v3 setObject:errorMessage forKey:@"errorMessage"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v9 = +[NSNumber numberWithInt:self->_lineNumber];
    [v3 setObject:v9 forKey:@"lineNumber"];
  }
  uRL = self->_uRL;
  if (uRL) {
    [v3 setObject:uRL forKey:@"URL"];
  }
  lines = self->_lines;
  if (lines) {
    [v3 setObject:lines forKey:@"lines"];
  }
  functionNames = self->_functionNames;
  if (functionNames) {
    [v3 setObject:functionNames forKey:@"functionNames"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBLogAdContentErrorRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_metaData) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_errorMessage) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_uRL) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_lines;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_functionNames;
  v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
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
  id v13 = v4;
  if (self->_metaData)
  {
    [v4 setMetaData:];
    id v4 = v13;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_errorType;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  if (self->_errorMessage)
  {
    [v13 setErrorMessage:];
    id v4 = v13;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_lineNumber;
    *((unsigned char *)v4 + 64) |= 2u;
  }
  if (self->_uRL) {
    [v13 setURL:];
  }
  if ([(APPBLogAdContentErrorRequest *)self linesCount])
  {
    [v13 clearLines];
    unint64_t v5 = [(APPBLogAdContentErrorRequest *)self linesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(APPBLogAdContentErrorRequest *)self linesAtIndex:i];
        [v13 addLines:v8];
      }
    }
  }
  if ([(APPBLogAdContentErrorRequest *)self functionNamesCount])
  {
    [v13 clearFunctionNames];
    unint64_t v9 = [(APPBLogAdContentErrorRequest *)self functionNamesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        v12 = [(APPBLogAdContentErrorRequest *)self functionNamesAtIndex:j];
        [v13 addFunctionNames:v12];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(APPBLogMetaData *)self->_metaData copyWithZone:a3];
  objc_super v7 = (void *)v5[6];
  v5[6] = v6;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_errorType;
    *((unsigned char *)v5 + 64) |= 1u;
  }
  id v8 = [(NSString *)self->_errorMessage copyWithZone:a3];
  unint64_t v9 = (void *)v5[1];
  v5[1] = v8;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_lineNumber;
    *((unsigned char *)v5 + 64) |= 2u;
  }
  id v10 = [(NSString *)self->_uRL copyWithZone:a3];
  v11 = (void *)v5[7];
  v5[7] = v10;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v12 = self->_lines;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      long long v16 = 0;
      do
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)v16) copyWithZone:a3];
        [v5 addLines:v17];

        long long v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v14);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v18 = self->_functionNames;
  id v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      long long v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)v22) copyWithZone:a3];
        [v5 addFunctionNames:v23];

        long long v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  metaData = self->_metaData;
  if ((unint64_t)metaData | *((void *)v4 + 6))
  {
    if (!-[APPBLogMetaData isEqual:](metaData, "isEqual:")) {
      goto LABEL_23;
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_errorType != *((_DWORD *)v4 + 4)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_23;
  }
  errorMessage = self->_errorMessage;
  if ((unint64_t)errorMessage | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](errorMessage, "isEqual:"))
    {
LABEL_23:
      unsigned __int8 v11 = 0;
      goto LABEL_24;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_lineNumber != *((_DWORD *)v4 + 8)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_23;
  }
  uRL = self->_uRL;
  if ((unint64_t)uRL | *((void *)v4 + 7) && !-[NSString isEqual:](uRL, "isEqual:")) {
    goto LABEL_23;
  }
  lines = self->_lines;
  if ((unint64_t)lines | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](lines, "isEqual:")) {
      goto LABEL_23;
    }
  }
  functionNames = self->_functionNames;
  if ((unint64_t)functionNames | *((void *)v4 + 3)) {
    unsigned __int8 v11 = -[NSMutableArray isEqual:](functionNames, "isEqual:");
  }
  else {
    unsigned __int8 v11 = 1;
  }
LABEL_24:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(APPBLogMetaData *)self->_metaData hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_errorType;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_errorMessage hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_lineNumber;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v8 = [(NSString *)self->_uRL hash];
  unint64_t v9 = v8 ^ (unint64_t)[(NSMutableArray *)self->_lines hash];
  return v7 ^ v9 ^ (unint64_t)[(NSMutableArray *)self->_functionNames hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  metaData = self->_metaData;
  uint64_t v6 = *((void *)v4 + 6);
  if (metaData)
  {
    if (v6) {
      -[APPBLogMetaData mergeFrom:](metaData, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[APPBLogAdContentErrorRequest setMetaData:](self, "setMetaData:");
  }
  if (*((unsigned char *)v4 + 64))
  {
    self->_int errorType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1)) {
    -[APPBLogAdContentErrorRequest setErrorMessage:](self, "setErrorMessage:");
  }
  if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    self->_lineNumber = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 7)) {
    -[APPBLogAdContentErrorRequest setURL:](self, "setURL:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = *((id *)v4 + 5);
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(APPBLogAdContentErrorRequest *)self addLines:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v4 + 3);
  id v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[APPBLogAdContentErrorRequest addFunctionNames:](self, "addFunctionNames:", *(void *)(*((void *)&v17 + 1) + 8 * (void)j), (void)v17);
      }
      id v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (APPBLogMetaData)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
}

- (int)lineNumber
{
  return self->_lineNumber;
}

- (NSString)uRL
{
  return self->_uRL;
}

- (void)setURL:(id)a3
{
}

- (NSMutableArray)lines
{
  return self->_lines;
}

- (void)setLines:(id)a3
{
}

- (NSMutableArray)functionNames
{
  return self->_functionNames;
}

- (void)setFunctionNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uRL, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_functionNames, 0);

  objc_storeStrong((id *)&self->_errorMessage, 0);
}

@end