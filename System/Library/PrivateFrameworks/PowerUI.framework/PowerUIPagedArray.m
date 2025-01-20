@interface PowerUIPagedArray
- (BOOL)isIndexInMemory:(int64_t)a3;
- (NSMutableDictionary)chunks;
- (OS_os_log)log;
- (PowerUIPagedArray)initWithChunkSize:(int64_t)a3 chunkGetter:(id)a4;
- (id)chunkArrayForIndex:(int64_t)a3;
- (id)description;
- (id)getChunkHandler;
- (id)keyForChunkIndex:(int64_t)a3;
- (id)objectAtIndex:(int64_t)a3;
- (id)retrieveElementFromMemoryAtIndex:(int64_t)a3;
- (int64_t)chunkSize;
- (int64_t)countDynamic;
- (int64_t)currentChunkIndex;
- (int64_t)endChunkIndex;
- (int64_t)highestIndexInMemory;
- (int64_t)numberOfQueries;
- (void)loadChunk:(int64_t)a3;
- (void)setCurrentChunkIndex:(int64_t)a3;
- (void)setEndChunkIndex:(int64_t)a3;
- (void)setHighestIndexInMemory:(int64_t)a3;
- (void)setLog:(id)a3;
- (void)setNumberOfQueries:(int64_t)a3;
@end

@implementation PowerUIPagedArray

- (PowerUIPagedArray)initWithChunkSize:(int64_t)a3 chunkGetter:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PowerUIPagedArray;
  v7 = [(PowerUIPagedArray *)&v16 init];
  v8 = v7;
  if (v7)
  {
    v7->_chunkSize = a3;
    uint64_t v9 = MEMORY[0x223C80C20](v6);
    id getChunkHandler = v8->_getChunkHandler;
    v8->_id getChunkHandler = (id)v9;

    os_log_t v11 = os_log_create("com.apple.powerui.smartcharging", "utilities.pagedarray");
    log = v8->_log;
    v8->_log = (OS_os_log *)v11;

    *(_OWORD *)&v8->_endChunkIndex = xmmword_2214312A0;
    *(_OWORD *)&v8->_highestIndexInMemory = xmmword_2214312B0;
    uint64_t v13 = objc_opt_new();
    chunks = v8->_chunks;
    v8->_chunks = (NSMutableDictionary *)v13;

    [(PowerUIPagedArray *)v8 loadChunk:0];
  }

  return v8;
}

- (id)objectAtIndex:(int64_t)a3
{
  v5 = (void *)MEMORY[0x223C80A30](self, a2);
  if ([(PowerUIPagedArray *)self isIndexInMemory:a3])
  {
    id v6 = [(PowerUIPagedArray *)self retrieveElementFromMemoryAtIndex:a3];
    int64_t v7 = a3 / self->_chunkSize;
    self->_currentChunkIndex = v7;
    int64_t v8 = v7 + 1;
    int64_t endChunkIndex = self->_endChunkIndex;
    v10 = [(PowerUIPagedArray *)self chunkArrayForIndex:v7 + 1];

    if (v8 < endChunkIndex && v10 == 0) {
      [(PowerUIPagedArray *)self loadChunk:v8];
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)loadChunk:(int64_t)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x223C80A30](self, a2);
  chunks = self->_chunks;
  int64_t v7 = [(PowerUIPagedArray *)self keyForChunkIndex:a3 - 3];
  [(NSMutableDictionary *)chunks removeObjectForKey:v7];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int64_t chunkSize = self->_chunkSize;
    int64_t numberOfQueries = self->_numberOfQueries;
    int v26 = 134218496;
    int64_t v27 = a3;
    __int16 v28 = 2048;
    int64_t v29 = chunkSize;
    __int16 v30 = 2048;
    int64_t v31 = numberOfQueries;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Querying for chunk at %lu of size %lu, total queries so far %lu", (uint8_t *)&v26, 0x20u);
  }
  os_log_t v11 = (*((void (**)(void))self->_getChunkHandler + 2))();
  v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = NSNumber;
    v14 = v12;
    v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
    int v26 = 138412290;
    int64_t v27 = (int64_t)v15;
    _os_log_impl(&dword_22135E000, v14, OS_LOG_TYPE_DEFAULT, "Received chunk of size %@", (uint8_t *)&v26, 0xCu);
  }
  if ([v11 count])
  {
    ++self->_numberOfQueries;
    objc_super v16 = self->_chunks;
    v17 = [(PowerUIPagedArray *)self keyForChunkIndex:a3];
    [(NSMutableDictionary *)v16 setObject:v11 forKeyedSubscript:v17];

    int64_t v18 = self->_chunkSize;
    int64_t v19 = [v11 count] + v18 * a3 - 1;
    if (self->_highestIndexInMemory < v19) {
      self->_highestIndexInMemory = v19;
    }
  }
  if ([v11 count] != self->_chunkSize)
  {
    self->_int64_t endChunkIndex = a3;
    v20 = self->_log;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = NSNumber;
      int64_t endChunkIndex = self->_endChunkIndex;
      v23 = v20;
      v24 = [v21 numberWithLong:endChunkIndex];
      v25 = objc_msgSend(NSNumber, "numberWithLong:", -[PowerUIPagedArray countDynamic](self, "countDynamic"));
      int v26 = 138412546;
      int64_t v27 = (int64_t)v24;
      __int16 v28 = 2112;
      int64_t v29 = (int64_t)v25;
      _os_log_impl(&dword_22135E000, v23, OS_LOG_TYPE_DEFAULT, "Marking chunk as end of stream, chunk: %@, countDynamic: %@", (uint8_t *)&v26, 0x16u);
    }
  }
}

- (BOOL)isIndexInMemory:(int64_t)a3
{
  return a3 >= 0 && self->_highestIndexInMemory >= a3;
}

- (int64_t)countDynamic
{
  return self->_highestIndexInMemory + 1;
}

- (id)keyForChunkIndex:(int64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
}

- (id)chunkArrayForIndex:(int64_t)a3
{
  chunks = self->_chunks;
  v4 = [(PowerUIPagedArray *)self keyForChunkIndex:a3];
  v5 = [(NSMutableDictionary *)chunks objectForKey:v4];

  return v5;
}

- (id)retrieveElementFromMemoryAtIndex:(int64_t)a3
{
  int64_t chunkSize = self->_chunkSize;
  int64_t v4 = a3 % chunkSize;
  v5 = [(PowerUIPagedArray *)self chunkArrayForIndex:a3 / chunkSize];
  id v6 = [v5 objectAtIndex:v4];

  return v6;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"\nCache Index: %lu\nHighest Index: %lu\nQueries: %lu\nCache: %@", self->_currentChunkIndex, self->_highestIndexInMemory, self->_numberOfQueries, self->_chunks];
}

- (NSMutableDictionary)chunks
{
  return self->_chunks;
}

- (id)getChunkHandler
{
  return self->_getChunkHandler;
}

- (int64_t)chunkSize
{
  return self->_chunkSize;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (int64_t)endChunkIndex
{
  return self->_endChunkIndex;
}

- (void)setEndChunkIndex:(int64_t)a3
{
  self->_int64_t endChunkIndex = a3;
}

- (int64_t)currentChunkIndex
{
  return self->_currentChunkIndex;
}

- (void)setCurrentChunkIndex:(int64_t)a3
{
  self->_currentChunkIndex = a3;
}

- (int64_t)highestIndexInMemory
{
  return self->_highestIndexInMemory;
}

- (void)setHighestIndexInMemory:(int64_t)a3
{
  self->_highestIndexInMemory = a3;
}

- (int64_t)numberOfQueries
{
  return self->_numberOfQueries;
}

- (void)setNumberOfQueries:(int64_t)a3
{
  self->_int64_t numberOfQueries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong(&self->_getChunkHandler, 0);
  objc_storeStrong((id *)&self->_chunks, 0);
}

@end