@interface PBMessageStreamReader
- (Class)classOfNextMessage;
- (PBMessageStreamReader)initWithStream:(id)a3;
- (id)nextMessage;
- (unint64_t)position;
- (void)setClassOfNextMessage:(Class)a3;
@end

@implementation PBMessageStreamReader

- (void).cxx_destruct
{
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setClassOfNextMessage:(Class)a3
{
  self->_classOfNextMessage = a3;
}

- (Class)classOfNextMessage
{
  return self->_classOfNextMessage;
}

- (id)nextMessage
{
  unint64_t v3 = 0;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v18[0] = 0;
  while ([(NSInputStream *)self->_stream read:v18 maxLength:1] == 1)
  {
    int v4 = v18[0];
    v18[v3 + 1] = v18[0];
    unint64_t v5 = v3 + 1;
    if (v4 < 0 && v3++ < 9) {
      continue;
    }
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    while (v5 != v8)
    {
      v9 |= (unint64_t)(v18[v8 + 1] & 0x7F) << v7;
      if ((v18[v8 + 1] & 0x80) == 0)
      {
        v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v9];
        v13 = v12;
        if (v12
          && [v12 length] == v9
          && (stream = self->_stream,
              id v15 = v13,
              -[NSInputStream read:maxLength:](stream, "read:maxLength:", [v15 mutableBytes], v9) == v9))
        {
          self->_position += v9 + v5;
          v16 = [[PBDataReader alloc] initWithData:v15];
          if ([(PBMessageStreamReader *)self classOfNextMessage])
          {
            id v17 = objc_alloc_init([(PBMessageStreamReader *)self classOfNextMessage]);
            v10 = v17;
            if (v17) {
              [v17 readFrom:v16];
            }
          }
          else
          {
            v10 = 0;
          }
        }
        else
        {
          v10 = 0;
        }

        return v10;
      }
      ++v8;
      v7 += 7;
      if (v7 == 70) {
        return 0;
      }
    }
    return 0;
  }
  return 0;
}

- (PBMessageStreamReader)initWithStream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBMessageStreamReader;
  v6 = [(PBMessageStreamReader *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_stream, a3);
  }

  return v7;
}

@end