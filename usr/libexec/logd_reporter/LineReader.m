@interface LineReader
- (BOOL)_readNextChunk;
- (LineReader)initWithFile:(id)a3;
- (LineReader)initWithFile:(id)a3 andReadingWindowSize:(unint64_t)a4;
- (id)nextLine;
- (void)dealloc;
@end

@implementation LineReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftovers, 0);
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

- (id)nextLine
{
  while (![(NSMutableArray *)self->_lines count])
  {
    if (![(LineReader *)self _readNextChunk])
    {
      v3 = 0;
      goto LABEL_5;
    }
  }
  v3 = [(NSMutableArray *)self->_lines objectAtIndexedSubscript:0];
  [(NSMutableArray *)self->_lines removeObjectAtIndex:0];
LABEL_5:

  return v3;
}

- (BOOL)_readNextChunk
{
  handle = self->_handle;
  unint64_t cursor = self->_cursor;
  id v40 = 0;
  unsigned __int8 v5 = [(NSFileHandle *)handle seekToOffset:cursor error:&v40];
  id v6 = v40;
  if (v5)
  {
    v7 = self->_handle;
    unint64_t window = self->_window;
    id v39 = 0;
    v9 = [(NSFileHandle *)v7 readDataUpToLength:window error:&v39];
    id v10 = v39;

    if (v9)
    {
      if (![v9 length])
      {
        BOOL v25 = 0;
        goto LABEL_17;
      }
      self->_cursor += (unint64_t)[v9 length];
      v11 = [objc_alloc((Class)NSString) initWithData:v9 encoding:4];
      v12 = v11;
      if (v11 && [v11 length])
      {
        v13 = [v12 componentsSeparatedByString:@"\n"];
        v14 = (NSMutableArray *)[v13 mutableCopy];
        lines = self->_lines;
        self->_lines = v14;

        if (self->_leftovers)
        {
          v16 = [(NSMutableArray *)self->_lines objectAtIndexedSubscript:0];

          if (v16)
          {
            leftovers = self->_leftovers;
            v18 = [(NSMutableArray *)self->_lines objectAtIndexedSubscript:0];
            v19 = [(NSString *)leftovers stringByAppendingString:v18];
            [(NSMutableArray *)self->_lines setObject:v19 atIndexedSubscript:0];
          }
          else
          {
            v18 = +[NSString stringWithString:self->_leftovers];
            [(NSMutableArray *)self->_lines setObject:v18 atIndexedSubscript:0];
          }
        }
        unint64_t v33 = self->_cursor;
        unint64_t end = self->_end;
        v35 = [(NSMutableArray *)self->_lines lastObject];
        v36 = v35;
        if (v33 >= end)
        {
          id v38 = [v35 length];

          if (v38)
          {
LABEL_24:
            BOOL v25 = 1;
            goto LABEL_15;
          }
        }
        else
        {
          v37 = self->_leftovers;
          self->_leftovers = (NSString *)v35;
        }
        [(NSMutableArray *)self->_lines removeLastObject];
        goto LABEL_24;
      }
    }
    else
    {
      v12 = sub_1000024EC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = [(NSString *)self->_path description];
        id v27 = [v26 UTF8String];
        unint64_t v29 = self->_window;
        unint64_t v28 = self->_cursor;
        id v30 = [v10 description];
        id v31 = [v30 UTF8String];
        *(_DWORD *)buf = 136446978;
        id v42 = v27;
        __int16 v43 = 2048;
        unint64_t v44 = v28;
        __int16 v45 = 2048;
        unint64_t v46 = v29;
        __int16 v47 = 2082;
        id v48 = v31;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Error while reading data chunk, file: %{public}s, offset: %llu, window: %lu, error: %{public}s", buf, 0x2Au);
      }
    }
    BOOL v25 = 0;
LABEL_15:

    goto LABEL_17;
  }
  v9 = sub_1000024EC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = [(NSString *)self->_path description];
    id v21 = [v20 UTF8String];
    unint64_t v22 = self->_cursor;
    id v23 = [v6 description];
    id v24 = [v23 UTF8String];
    *(_DWORD *)buf = 136446722;
    id v42 = v21;
    __int16 v43 = 2048;
    unint64_t v44 = v22;
    __int16 v45 = 2082;
    unint64_t v46 = (unint64_t)v24;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error seeking while reading file, file: %{public}s, offset: %llu, error: %{public}s", buf, 0x20u);
  }
  BOOL v25 = 0;
  id v10 = v6;
LABEL_17:

  return v25;
}

- (void)dealloc
{
  [(NSFileHandle *)self->_handle closeFile];
  v3.receiver = self;
  v3.super_class = (Class)LineReader;
  [(LineReader *)&v3 dealloc];
}

- (LineReader)initWithFile:(id)a3
{
  return [(LineReader *)self initWithFile:a3 andReadingWindowSize:4096];
}

- (LineReader)initWithFile:(id)a3 andReadingWindowSize:(unint64_t)a4
{
  id v7 = a3;
  v32.receiver = self;
  v32.super_class = (Class)LineReader;
  v8 = [(LineReader *)&v32 init];
  v9 = v8;
  if (v8)
  {
    p_path = (id *)&v8->_path;
    objc_storeStrong((id *)&v8->_path, a3);
    v11 = +[NSURL fileURLWithPath:v9->_path];
    id v31 = 0;
    uint64_t v12 = +[NSFileHandle fileHandleForReadingFromURL:v11 error:&v31];
    id v13 = v31;
    handle = v9->_handle;
    v9->_handle = (NSFileHandle *)v12;

    if (v9->_handle)
    {
      v9->_unint64_t window = a4;
      v9->_unint64_t cursor = 0;

      v15 = v9->_handle;
      id v30 = 0;
      unsigned __int8 v16 = [(NSFileHandle *)v15 seekToEndReturningOffset:&v9->_end error:&v30];
      id v13 = v30;
      if (v16)
      {
        uint64_t v17 = objc_opt_new();
        lines = v9->_lines;
        v9->_lines = (NSMutableArray *)v17;

        leftovers = v9->_leftovers;
        v9->_leftovers = (NSString *)&stru_100008438;

        id v20 = v9;
LABEL_12:

        goto LABEL_13;
      }
      id v21 = sub_1000024EC();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = [*p_path description];
        id v27 = [v22 UTF8String];
        id v24 = [v13 description];
        id v28 = [v24 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v34 = v27;
        __int16 v35 = 2082;
        id v36 = v28;
        id v26 = "Error trying to determine end of file, file: %{public}s, error: %{public}s";
        goto LABEL_10;
      }
    }
    else
    {
      id v21 = sub_1000024EC();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = [*p_path description];
        id v23 = [v22 UTF8String];
        id v24 = [v13 description];
        id v25 = [v24 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v34 = v23;
        __int16 v35 = 2082;
        id v36 = v25;
        id v26 = "Error getting filehandle, file: %{public}s, error: %{public}s";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v26, buf, 0x16u);
      }
    }

    id v20 = 0;
    goto LABEL_12;
  }
  id v20 = 0;
LABEL_13:

  return v20;
}

@end