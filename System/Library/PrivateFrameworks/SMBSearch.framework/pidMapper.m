@interface pidMapper
- (NSMutableArray)colTableArr;
- (NSMutableArray)columnSet;
- (NSMutableArray)pidMap;
- (pidMapper)initWithCtx:(id)a3;
- (unsigned)colValueLen;
- (unsigned)rowLength;
- (void)setColTableArr:(id)a3;
- (void)setColValueLen:(unsigned int)a3;
- (void)setColumnSet:(id)a3;
- (void)setPidMap:(id)a3;
- (void)setRowLength:(unsigned int)a3;
@end

@implementation pidMapper

- (pidMapper)initWithCtx:(id)a3
{
  id v4 = a3;
  v72.receiver = self;
  v72.super_class = (Class)pidMapper;
  v5 = [(pidMapper *)&v72 init];
  if (!v5)
  {
    v16 = 0;
    v12 = 0;
    v17 = 0;
    v9 = 0;
    v13 = 0;
    goto LABEL_44;
  }
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  p_colTableArr = (id *)&v5->_colTableArr;
  colTableArr = v5->_colTableArr;
  v5->_colTableArr = v6;

  if (!v5->_colTableArr)
  {

    v16 = 0;
    v12 = 0;
    v17 = 0;
    v9 = 0;
LABEL_42:
    v13 = 0;
LABEL_43:
    v5 = 0;
    goto LABEL_44;
  }
  v9 = [[colOffsetMap alloc] initWithCtx:v4];
  if (!v9
    || (v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]),
        pidMap = v5->_pidMap,
        v5->_pidMap = v10,
        pidMap,
        !v5->_pidMap))
  {

    v16 = 0;
    v12 = 0;
LABEL_41:
    v17 = 0;
    goto LABEL_42;
  }
  v12 = [[fullPropSpec alloc] initWithPropertyNumber:0];
  if (!v12) {
    goto LABEL_40;
  }
  [(NSMutableArray *)v5->_pidMap addObject:v12];
  v13 = [[fullPropSpec alloc] initWithPropertyNumber:1];

  if (!v13) {
    goto LABEL_48;
  }
  [(NSMutableArray *)v5->_pidMap addObject:v13];
  v12 = [[fullPropSpec alloc] initWithPropertyNumber:2];

  if (!v12) {
    goto LABEL_40;
  }
  [(NSMutableArray *)v5->_pidMap addObject:v12];
  v13 = [[fullPropSpec alloc] initWithPropertyNumber:3];

  if (!v13) {
    goto LABEL_48;
  }
  [(NSMutableArray *)v5->_pidMap addObject:v13];
  v12 = [[fullPropSpec alloc] initWithPropertyNumber:22];

  if (!v12) {
    goto LABEL_40;
  }
  [(NSMutableArray *)v5->_pidMap addObject:v12];
  v13 = [[fullPropSpec alloc] initWithPropertyNumber:5];

  if (!v13) {
    goto LABEL_48;
  }
  [(NSMutableArray *)v5->_pidMap addObject:v13];
  v12 = [[fullPropSpec alloc] initWithPropertyNumber:6];

  if (!v12) {
    goto LABEL_40;
  }
  [(NSMutableArray *)v5->_pidMap addObject:v12];
  v13 = [[fullPropSpec alloc] initWithPropertyNumber:23];

  if (!v13) {
    goto LABEL_48;
  }
  [(NSMutableArray *)v5->_pidMap addObject:v13];
  v12 = [[fullPropSpec alloc] initWithPropertyNumber:21];

  if (!v12) {
    goto LABEL_40;
  }
  [(NSMutableArray *)v5->_pidMap addObject:v12];
  v13 = [[fullPropSpec alloc] initWithPropertyNumber:8];

  if (!v13)
  {
LABEL_48:

    v16 = 0;
    v12 = 0;
LABEL_49:
    v17 = 0;
    goto LABEL_43;
  }
  [(NSMutableArray *)v5->_pidMap addObject:v13];
  if ([v4 queryType] == 1)
  {
    v14 = [fullPropSpec alloc];
    uint64_t v15 = 9;
  }
  else
  {
    if ([v4 queryType] != 4) {
      goto LABEL_24;
    }
    v14 = [fullPropSpec alloc];
    uint64_t v15 = 24;
  }
  v12 = [(fullPropSpec *)v14 initWithPropertyNumber:v15];

  if (!v12)
  {
LABEL_40:

    v16 = 0;
    goto LABEL_41;
  }
  [(NSMutableArray *)v5->_pidMap addObject:v12];
  v13 = v12;
LABEL_24:
  v12 = [[fullPropSpec alloc] initWithPropertyNumber:10];

  if (!v12) {
    goto LABEL_40;
  }
  [(NSMutableArray *)v5->_pidMap addObject:v12];
  v13 = [[fullPropSpec alloc] initWithPropertyNumber:11];

  if (!v13) {
    goto LABEL_48;
  }
  [(NSMutableArray *)v5->_pidMap addObject:v13];
  v12 = [[fullPropSpec alloc] initWithPropertyNumber:12];

  if (!v12) {
    goto LABEL_40;
  }
  [(NSMutableArray *)v5->_pidMap addObject:v12];
  v13 = [[fullPropSpec alloc] initWithPropertyNumber:13];

  if (!v13) {
    goto LABEL_48;
  }
  [(NSMutableArray *)v5->_pidMap addObject:v13];
  v12 = [[fullPropSpec alloc] initWithPropertyNumber:14];

  if (!v12) {
    goto LABEL_40;
  }
  [(NSMutableArray *)v5->_pidMap addObject:v12];
  v17 = [[fullPropSpec alloc] initWithPropertyNumber:15];

  if (!v17)
  {

    v16 = 0;
    v12 = 0;
    goto LABEL_42;
  }
  [(NSMutableArray *)v5->_pidMap addObject:v17];
  v13 = [[fullPropSpec alloc] initWithPropertyNumber:16];

  if (!v13) {
    goto LABEL_48;
  }
  [(NSMutableArray *)v5->_pidMap addObject:v13];
  uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](v5->_pidMap, "count"));
  columnSet = v5->_columnSet;
  v5->_columnSet = (NSMutableArray *)v18;

  if (!v5->_columnSet)
  {
    BOOL v36 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v36) {
      -[pidMapper initWithCtx:](v36, v37, v38, v39, v40, v41, v42, v43);
    }
    goto LABEL_48;
  }
  if ([(NSMutableArray *)v5->_pidMap count])
  {
    unint64_t v20 = 0;
    do
    {
      v21 = v5->_columnSet;
      v22 = [NSNumber numberWithUnsignedInt:v20];
      [(NSMutableArray *)v21 addObject:v22];

      unint64_t v20 = (v20 + 1);
    }
    while ([(NSMutableArray *)v5->_pidMap count] > v20);
  }
  uint64_t v69 = [(NSMutableArray *)v5->_pidMap count];
  if (v69)
  {
    uint64_t v23 = 0;
    v24 = 0;
    v12 = 0;
    uint64_t v70 = v69;
    while (1)
    {
      v25 = v12;
      v26 = v24;
      v27 = v13;
      -[NSMutableArray objectAtIndex:](v5->_columnSet, "objectAtIndex:", v23, v69);
      v12 = (fullPropSpec *)objc_claimAutoreleasedReturnValue();

      v13 = [(NSMutableArray *)v5->_pidMap objectAtIndex:[(fullPropSpec *)v12 integerValue]];

      v24 = [[cTableColumn alloc] initWithPropertyNumber:[(fullPropSpec *)v13 propNumber] WspCtx:v4];
      if (!v24) {
        break;
      }
      v28 = [(colOffsetMap *)v9 statusOffsets];
      v29 = [v28 objectAtIndexedSubscript:v23];
      -[cTableColumn setStatusOffset:](v24, "setStatusOffset:", (unsigned __int16)[v29 integerValue]);

      v30 = [(colOffsetMap *)v9 lengthOffsets];
      v31 = [v30 objectAtIndexedSubscript:v23];
      -[cTableColumn setLengthOffset:](v24, "setLengthOffset:", (unsigned __int16)[v31 integerValue]);

      v32 = [(colOffsetMap *)v9 valueOffsets];
      v33 = [v32 objectAtIndexedSubscript:v23];
      -[cTableColumn setValueOffset:](v24, "setValueOffset:", (unsigned __int16)[v33 integerValue]);

      [*p_colTableArr addObject:v24];
      if (v70 == ++v23)
      {

        goto LABEL_51;
      }
    }
    BOOL v51 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v51) {
      -[pidMapper initWithCtx:].cold.4(v51, v52, v53, v54, v55, v56, v57, v58);
    }
    goto LABEL_60;
  }
  v12 = 0;
LABEL_51:
  v71 = [[cTableColumn alloc] initWithPropertyNumber:20 WspCtx:v4];
  if (!v71)
  {
    BOOL v59 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v59) {
      -[pidMapper initWithCtx:](v59, v60, v61, v62, v63, v64, v65, v66);
    }
LABEL_60:

    v16 = 0;
    goto LABEL_49;
  }
  v44 = [(colOffsetMap *)v9 statusOffsets];
  v45 = [v44 objectAtIndex:v69];
  -[cTableColumn setStatusOffset:](v71, "setStatusOffset:", (unsigned __int16)[v45 integerValue]);

  v46 = [(colOffsetMap *)v9 lengthOffsets];
  v47 = [v46 objectAtIndex:v69];
  -[cTableColumn setLengthOffset:](v71, "setLengthOffset:", (unsigned __int16)[v47 integerValue]);

  v48 = [(colOffsetMap *)v9 valueOffsets];
  v49 = [v48 objectAtIndex:v69];
  -[cTableColumn setValueOffset:](v71, "setValueOffset:", (unsigned __int16)[v49 integerValue]);

  [(cTableColumn *)v71 setLengthUsed:0];
  [*p_colTableArr addObject:v71];
  unint64_t v50 = (v69 + 1);
  if ([*p_colTableArr count] >= v50)
  {
    v67 = [(colOffsetMap *)v9 valueOffsets];
    v16 = [v67 objectAtIndex:v50];

    v5->_rowLength = [v16 unsignedIntValue];
    if ([v4 serverSupports64BitOffsets]) {
      int v68 = 24;
    }
    else {
      int v68 = 16;
    }
    v5->_colValueLen = v68;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[pidMapper initWithCtx:]((id *)&v5->_colTableArr, v50);
    }

    v16 = 0;
    v5 = 0;
  }
  v17 = (fullPropSpec *)v71;
LABEL_44:
  v34 = v5;

  return v34;
}

- (NSMutableArray)pidMap
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPidMap:(id)a3
{
}

- (NSMutableArray)columnSet
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setColumnSet:(id)a3
{
}

- (unsigned)rowLength
{
  return self->_rowLength;
}

- (void)setRowLength:(unsigned int)a3
{
  self->_rowLength = a3;
}

- (unsigned)colValueLen
{
  return self->_colValueLen;
}

- (void)setColValueLen:(unsigned int)a3
{
  self->_colValueLen = a3;
}

- (NSMutableArray)colTableArr
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setColTableArr:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colTableArr, 0);
  objc_storeStrong((id *)&self->_columnSet, 0);

  objc_storeStrong((id *)&self->_pidMap, 0);
}

- (void)initWithCtx:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(id *)a1 .cold.3(id *a1, int a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*a1 count];
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 2048;
  uint64_t v6 = v3;
  _os_log_error_impl(&dword_235F82000, &_os_log_internal, OS_LOG_TYPE_ERROR, "pidMapper:init: columns: %u exceed offsetMap size: %lu\n", (uint8_t *)v4, 0x12u);
}

- (void)initWithCtx:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end