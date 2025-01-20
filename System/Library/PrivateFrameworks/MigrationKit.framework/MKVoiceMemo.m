@interface MKVoiceMemo
- (MKVoiceMemo)initWithAudioPath:(id)a3 originalFilename:(id)a4 dateAdded:(id)a5 size:(unint64_t)a6;
- (NSDate)dateAdded;
- (NSString)audioPath;
- (NSString)name;
- (NSString)originalFilename;
- (NSURL)audioUrl;
- (unint64_t)size;
- (void)setAudioPath:(id)a3;
- (void)setAudioUrl:(id)a3;
- (void)setDateAdded:(id)a3;
- (void)setName:(id)a3;
- (void)setOriginalFilename:(id)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation MKVoiceMemo

- (MKVoiceMemo)initWithAudioPath:(id)a3 originalFilename:(id)a4 dateAdded:(id)a5 size:(unint64_t)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MKVoiceMemo;
  v13 = [(MKVoiceMemo *)&v25 init];
  if ([v10 length] && objc_msgSend(v11, "length"))
  {
    v14 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:0.0];
    uint64_t v15 = [v12 compare:v14];

    if (v12 && v15)
    {
      if (!v13) {
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v18 = [MEMORY[0x263EFF910] date];

      id v12 = (id)v18;
      if (!v13)
      {
LABEL_14:
        v17 = v13;
        goto LABEL_15;
      }
    }
    [(MKVoiceMemo *)v13 setAudioPath:v10];
    v19 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v10];
    [(MKVoiceMemo *)v13 setAudioUrl:v19];

    [(MKVoiceMemo *)v13 setOriginalFilename:v11];
    v20 = [v11 componentsSeparatedByString:@"."];
    if ((unint64_t)[v20 count] >= 2)
    {
      v21 = [v20 lastObject];
      v22 = objc_msgSend(v11, "substringToIndex:", objc_msgSend(v11, "length") + ~objc_msgSend(v21, "length"));
      [(MKVoiceMemo *)v13 setName:v22];

      [(MKVoiceMemo *)v13 setDateAdded:v12];
      [(MKVoiceMemo *)v13 setSize:a6];

      goto LABEL_14;
    }
    v24 = +[MKLog log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MKVoiceMemo initWithAudioPath:originalFilename:dateAdded:size:]((uint64_t)v13, (uint64_t)v11, v24);
    }
  }
  else
  {
    v16 = +[MKLog log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412803;
      v27 = v13;
      __int16 v28 = 2113;
      id v29 = v10;
      __int16 v30 = 2113;
      id v31 = v11;
      _os_log_error_impl(&dword_22BFAC000, v16, OS_LOG_TYPE_ERROR, "%@ could not initialize voice memo for audioPath=%{private}@, originalFilename=%{private}@", buf, 0x20u);
    }
  }
  v17 = 0;
LABEL_15:

  return v17;
}

- (NSString)audioPath
{
  return self->_audioPath;
}

- (void)setAudioPath:(id)a3
{
}

- (NSURL)audioUrl
{
  return self->_audioUrl;
}

- (void)setAudioUrl:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (void)setOriginalFilename:(id)a3
{
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
}

- (void)setDateAdded:(id)a3
{
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_audioUrl, 0);
  objc_storeStrong((id *)&self->_audioPath, 0);
}

- (void)initWithAudioPath:(os_log_t)log originalFilename:dateAdded:size:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412547;
  uint64_t v4 = a1;
  __int16 v5 = 2113;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_22BFAC000, log, OS_LOG_TYPE_ERROR, "%@ could not initialize voice memo for invalid originalFilename=%{private}@", (uint8_t *)&v3, 0x16u);
}

@end