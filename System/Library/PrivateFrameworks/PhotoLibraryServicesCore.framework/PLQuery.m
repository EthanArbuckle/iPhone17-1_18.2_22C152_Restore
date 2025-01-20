@interface PLQuery
+ (Class)singleQueriesType;
- (BOOL)hasConjunction;
- (BOOL)hasFirst;
- (BOOL)hasSecond;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)singleQueries;
- (PLQuery)first;
- (PLQuery)second;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)logDescription;
- (id)singleQueriesAtIndex:(unint64_t)a3;
- (int)conjunction;
- (unint64_t)hash;
- (unint64_t)singleQueriesCount;
- (void)addSingleQueries:(id)a3;
- (void)clearSingleQueries;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConjunction:(int)a3;
- (void)setFirst:(id)a3;
- (void)setHasConjunction:(BOOL)a3;
- (void)setSecond:(id)a3;
- (void)setSingleQueries:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLQuery

- (BOOL)readFrom:(id)a3
{
  return PLQueryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singleQueries, 0);
  objc_storeStrong((id *)&self->_second, 0);
  objc_storeStrong((id *)&self->_first, 0);
}

- (id)logDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int v6 = [(PLQuery *)self conjunction];
  v7 = @"kPLQueryConjunction_OR";
  if (v6 == 1) {
    v7 = @"kPLQueryConjunction_AND";
  }
  if (v6 == 2) {
    v7 = @"kPLQueryConjunction_NOT";
  }
  v8 = v7;
  [v3 appendFormat:@"<%@: %p> { conjunction = %@;", v5, self, v8];

  if ([(PLQuery *)self hasFirst])
  {
    v9 = [(PLQuery *)self first];
    v10 = [v9 logDescription];
    [v3 appendFormat:@" first = %@;", v10];
  }
  if ([(PLQuery *)self hasSecond])
  {
    v11 = [(PLQuery *)self second];
    v12 = [v11 logDescription];
    [v3 appendFormat:@" second = %@;", v12];
  }
  if ([(PLQuery *)self singleQueriesCount])
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v14 = [(PLQuery *)self singleQueries];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __36__PLQuery_Utilities__logDescription__block_invoke;
    v18[3] = &unk_1E589F160;
    id v19 = v13;
    id v15 = v13;
    [v14 enumerateObjectsUsingBlock:v18];

    v16 = [v15 componentsJoinedByString:@", "];
    [v3 appendFormat:@" singles = (%@);", v16];
  }
  [v3 appendFormat:@"\n}"];
  return v3;
}

void __36__PLQuery_Utilities__logDescription__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 logDescription];
  [v2 addObject:v3];
}

- (void)setSingleQueries:(id)a3
{
}

- (NSMutableArray)singleQueries
{
  return self->_singleQueries;
}

- (void)setSecond:(id)a3
{
}

- (PLQuery)second
{
  return self->_second;
}

- (void)setFirst:(id)a3
{
}

- (PLQuery)first
{
  return self->_first;
}

- (int)conjunction
{
  return self->_conjunction;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = v4;
  if (v4[10])
  {
    self->_conjunction = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  first = self->_first;
  uint64_t v7 = *((void *)v5 + 2);
  if (first)
  {
    if (v7) {
      -[PLQuery mergeFrom:](first, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[PLQuery setFirst:](self, "setFirst:");
  }
  second = self->_second;
  uint64_t v9 = *((void *)v5 + 3);
  if (second)
  {
    if (v9) {
      -[PLQuery mergeFrom:](second, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[PLQuery setSecond:](self, "setSecond:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v5 + 4);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[PLQuery addSingleQueries:](self, "addSingleQueries:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_conjunction;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(PLQuery *)self->_first hash] ^ v3;
  unint64_t v5 = [(PLQuery *)self->_second hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_singleQueries hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_conjunction != *((_DWORD *)v4 + 2)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  first = self->_first;
  if ((unint64_t)first | *((void *)v4 + 2) && !-[PLQuery isEqual:](first, "isEqual:")) {
    goto LABEL_13;
  }
  second = self->_second;
  if ((unint64_t)second | *((void *)v4 + 3))
  {
    if (!-[PLQuery isEqual:](second, "isEqual:")) {
      goto LABEL_13;
    }
  }
  singleQueries = self->_singleQueries;
  if ((unint64_t)singleQueries | *((void *)v4 + 4)) {
    char v8 = -[NSMutableArray isEqual:](singleQueries, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  int v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_conjunction;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  id v7 = [(PLQuery *)self->_first copyWithZone:a3];
  char v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = [(PLQuery *)self->_second copyWithZone:a3];
  id v10 = (void *)v6[3];
  v6[3] = v9;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = self->_singleQueries;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v15), "copyWithZone:", a3, (void)v18);
        [v6 addSingleQueries:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_conjunction;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v9 = v4;
  if (self->_first) {
    objc_msgSend(v4, "setFirst:");
  }
  if (self->_second) {
    objc_msgSend(v9, "setSecond:");
  }
  if ([(PLQuery *)self singleQueriesCount])
  {
    [v9 clearSingleQueries];
    unint64_t v5 = [(PLQuery *)self singleQueriesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        char v8 = [(PLQuery *)self singleQueriesAtIndex:i];
        [v9 addSingleQueries:v8];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_first) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_second) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_singleQueries;
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

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_conjunction];
    [v3 setObject:v4 forKey:@"conjunction"];
  }
  first = self->_first;
  if (first)
  {
    uint64_t v6 = [(PLQuery *)first dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"first"];
  }
  second = self->_second;
  if (second)
  {
    uint64_t v8 = [(PLQuery *)second dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"second"];
  }
  if ([(NSMutableArray *)self->_singleQueries count])
  {
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_singleQueries, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v10 = self->_singleQueries;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKey:@"singleQueries"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PLQuery;
  id v4 = [(PLQuery *)&v8 description];
  unint64_t v5 = [(PLQuery *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)singleQueriesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_singleQueries objectAtIndex:a3];
}

- (unint64_t)singleQueriesCount
{
  return [(NSMutableArray *)self->_singleQueries count];
}

- (void)addSingleQueries:(id)a3
{
  id v4 = a3;
  singleQueries = self->_singleQueries;
  id v8 = v4;
  if (!singleQueries)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_singleQueries;
    self->_singleQueries = v6;

    id v4 = v8;
    singleQueries = self->_singleQueries;
  }
  [(NSMutableArray *)singleQueries addObject:v4];
}

- (void)clearSingleQueries
{
}

- (BOOL)hasSecond
{
  return self->_second != 0;
}

- (BOOL)hasFirst
{
  return self->_first != 0;
}

- (BOOL)hasConjunction
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasConjunction:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setConjunction:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_conjunction = a3;
}

+ (Class)singleQueriesType
{
  return (Class)objc_opt_class();
}

@end