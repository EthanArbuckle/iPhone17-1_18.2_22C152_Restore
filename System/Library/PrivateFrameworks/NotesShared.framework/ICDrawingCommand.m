@interface ICDrawingCommand
- (BOOL)hidden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualDrawingCommand:(id)a3;
- (ICDrawingCommand)initWithArchive:(const void *)a3 version:(unsigned int)a4 sortedUUIDs:(id)a5;
- (ICDrawingCommand)initWithCommand:(id)a3 hidden:(BOOL)a4 timestamp:(TopoID)a5;
- (ICDrawingCommandData)data;
- (TopoID)timestamp;
- (id).cxx_construct;
- (id)description;
- (unint64_t)hash;
- (unsigned)saveToArchive:(void *)a3 sortedUUIDs:(id)a4 withPathData:(BOOL)a5;
@end

@implementation ICDrawingCommand

- (ICDrawingCommand)initWithCommand:(id)a3 hidden:(BOOL)a4 timestamp:(TopoID)a5
{
  unsigned int clock = a5.clock;
  replicaID = a5.replicaID;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICDrawingCommand;
  v11 = [(ICDrawingCommand *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_data, a3);
    v12->_hidden = a4;
    objc_storeStrong((id *)&v12->_timestamp.replicaID, replicaID);
    v12->_timestamp.unsigned int clock = clock;
  }

  return v12;
}

- (BOOL)isEqualDrawingCommand:(id)a3
{
  id v4 = a3;
  v5 = [(ICDrawingCommand *)self data];
  v6 = [v4 data];
  char v7 = [v5 isEqual:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(ICDrawingCommand *)self isEqualDrawingCommand:v4];

  return v5;
}

- (unint64_t)hash
{
  return [(ICDrawingCommandData *)self->_data hash];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  unsigned int v6 = [(ICDrawingCommandData *)self->_data type];
  char v7 = [(ICDrawingCommandData *)self->_data points];
  uint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  BOOL v10 = [(ICDrawingCommand *)self hidden];
  v11 = &stru_1F1F2FFF8;
  if (v10) {
    v11 = @" hidden";
  }
  v12 = [v3 stringWithFormat:@"<%@ %p type=%ld points=%ld%@>", v5, self, v6, (v8 - v9) >> 6, v11];

  return v12;
}

- (ICDrawingCommandData)data
{
  return self->_data;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (TopoID)timestamp
{
  v3 = self->_timestamp.replicaID;
  uint64_t clock = self->_timestamp.clock;
  result.uint64_t clock = clock;
  result.replicaID = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

- (ICDrawingCommand)initWithArchive:(const void *)a3 version:(unsigned int)a4 sortedUUIDs:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v8 = (drawing::Command *)a5;
  uint64_t v9 = v8;
  uint64_t v10 = *((void *)a3 + 11);
  if (!v10) {
    uint64_t v10 = *(void *)(drawing::Command::default_instance(v8) + 88);
  }
  unint64_t v11 = *(unsigned int *)(v10 + 48);
  v12 = (drawing::Command *)[(drawing::Command *)v9 count];
  if ((unint64_t)v12 >= v11)
  {
    uint64_t v14 = *((void *)a3 + 11);
    if (!v14) {
      uint64_t v14 = *(void *)(drawing::Command::default_instance(v12) + 88);
    }
    v15 = [(drawing::Command *)v9 objectAtIndexedSubscript:*(unsigned int *)(v14 + 48)];
    v16 = v15;
    uint64_t v17 = *((void *)a3 + 11);
    if (!v17) {
      uint64_t v17 = *(void *)(drawing::Command::default_instance(v15) + 88);
    }
    uint64_t v18 = *(unsigned int *)(v17 + 40);
    int v19 = *((_DWORD *)a3 + 8);
    v20 = [[ICDrawingCommandData alloc] initWithArchive:a3 version:v5 sortedUUIDs:v9];
    v21 = v16;
    v22 = v21;
    if (self)
    {
      v23 = -[ICDrawingCommand initWithCommand:hidden:timestamp:](self, "initWithCommand:hidden:timestamp:", v20, (v19 & 0x40) == 0, v21, v18);
    }
    else
    {

      v23 = 0;
    }
    self = v23;

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unsigned)saveToArchive:(void *)a3 sortedUUIDs:(id)a4 withPathData:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  *((_DWORD *)a3 + 8) |= 0x20u;
  uint64_t v9 = *((void *)a3 + 11);
  if (!v9) {
    operator new();
  }
  uint64_t v10 = (void *)[(ICDrawingCommand *)self timestamp];
  *(_DWORD *)(v9 + 32) |= 1u;
  *(_DWORD *)(v9 + 40) = v11;

  v12 = (void *)[(ICDrawingCommand *)self timestamp];
  int v13 = [v8 indexOfObject:v12];

  *((_DWORD *)a3 + 8) |= 0x20u;
  uint64_t v14 = *((void *)a3 + 11);
  if (!v14) {
    operator new();
  }
  *(_DWORD *)(v14 + 32) |= 4u;
  *(_DWORD *)(v14 + 48) = v13;
  v15 = [(ICDrawingCommand *)self data];
  objc_msgSend(v15, "saveToArchive:sortedUUIDs:withPathData:isHidden:", a3, v8, v5, -[ICDrawingCommand hidden](self, "hidden"));

  return 1;
}

@end