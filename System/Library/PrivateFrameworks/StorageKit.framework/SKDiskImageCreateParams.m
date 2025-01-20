@interface SKDiskImageCreateParams
- (BOOL)stdinPassPhrase;
- (NSString)volumeName;
- (NSURL)source;
- (SKDiskImageCreateParams)initWithDisk:(id)a3;
- (SKDiskImageCreateParams)initWithDisk:(id)a3 format:(int64_t)a4;
- (SKDiskImageCreateParams)initWithDiskImage:(id)a3;
- (SKDiskImageCreateParams)initWithDiskImage:(id)a3 format:(int64_t)a4;
- (SKDiskImageCreateParams)initWithFormat:(int64_t)a3 sourceURL:(id)a4;
- (SKDiskImageCreateParams)initWithNumBlocks:(unint64_t)a3 volumeName:(id)a4;
- (SKDiskImageCreateParams)initWithNumBlocks:(unint64_t)a3 volumeName:(id)a4 format:(int64_t)a5;
- (id)description;
- (id)diConvertParamsWithOutputURL:(id)a3 error:(id *)a4;
- (id)diCreateParamsWithURL:(id)a3 error:(id *)a4;
- (id)redactedDescription;
- (int64_t)encryption;
- (int64_t)format;
- (unint64_t)numBlocks;
- (void)setEncryption:(int64_t)a3;
- (void)setFormat:(int64_t)a3;
- (void)setNumBlocks:(unint64_t)a3;
- (void)setSource:(id)a3;
- (void)setStdinPassPhrase:(BOOL)a3;
- (void)setVolumeName:(id)a3;
@end

@implementation SKDiskImageCreateParams

- (SKDiskImageCreateParams)initWithNumBlocks:(unint64_t)a3 volumeName:(id)a4
{
  return [(SKDiskImageCreateParams *)self initWithNumBlocks:a3 volumeName:a4 format:1];
}

- (SKDiskImageCreateParams)initWithNumBlocks:(unint64_t)a3 volumeName:(id)a4 format:(int64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SKDiskImageCreateParams;
  v10 = [(SKDiskImageCreateParams *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_format = a5;
    v10->_numBlocks = a3;
    objc_storeStrong((id *)&v10->_volumeName, a4);
    v11->_stdinPassPhrase = 0;
    v11->_encryption = 0;
  }

  return v11;
}

- (SKDiskImageCreateParams)initWithFormat:(int64_t)a3 sourceURL:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SKDiskImageCreateParams;
  v8 = [(SKDiskImageCreateParams *)&v12 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_source, a4);
    v9->_format = a3;
    v9->_numBlocks = 0;
    volumeName = v9->_volumeName;
    v9->_volumeName = 0;

    v9->_stdinPassPhrase = 0;
    v9->_encryption = 0;
  }

  return v9;
}

- (SKDiskImageCreateParams)initWithDisk:(id)a3
{
  return [(SKDiskImageCreateParams *)self initWithDisk:a3 format:4];
}

- (SKDiskImageCreateParams)initWithDisk:(id)a3 format:(int64_t)a4
{
  v6 = NSURL;
  id v7 = NSString;
  v8 = [a3 diskIdentifier];
  id v9 = [v7 stringWithFormat:@"/dev/%@", v8];
  v10 = [v6 fileURLWithPath:v9];
  v11 = [(SKDiskImageCreateParams *)self initWithFormat:a4 sourceURL:v10];

  return v11;
}

- (SKDiskImageCreateParams)initWithDiskImage:(id)a3
{
  return [(SKDiskImageCreateParams *)self initWithDiskImage:a3 format:4];
}

- (SKDiskImageCreateParams)initWithDiskImage:(id)a3 format:(int64_t)a4
{
  v6 = [a3 imageURL];
  id v7 = [(SKDiskImageCreateParams *)self initWithFormat:a4 sourceURL:v6];

  return v7;
}

- (id)redactedDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: { source: %@, format: %d, numBlocks: %lld }>", v5, self->_source, self->_format, self->_numBlocks];

  return v6;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: { source: %@, format: %d, numBlocks: %lld, volumeName: %@ }>", v5, self->_source, self->_format, self->_numBlocks, self->_volumeName];

  return v6;
}

- (id)diCreateParamsWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(SKDiskImageCreateParams *)self format];
  if (v7 == 1)
  {
    v8 = (Class *)0x263F3A3E8;
    goto LABEL_5;
  }
  if (v7 == 6)
  {
    v8 = (Class *)0x263F3A3F0;
LABEL_5:
    id v9 = objc_msgSend(objc_alloc(*v8), "initWithURL:numBlocks:error:", v6, -[SKDiskImageCreateParams numBlocks](self, "numBlocks"), a4);
    BOOL v10 = [(SKDiskImageCreateParams *)self stdinPassPhrase];
    uint64_t v11 = [v9 readPassphraseFlags];
    if (v10) {
      uint64_t v12 = v11 | 8;
    }
    else {
      uint64_t v12 = v11;
    }
    [v9 setReadPassphraseFlags:v12];
    int64_t v13 = [(SKDiskImageCreateParams *)self encryption];
    if (v13 == 2) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = v13 == 1;
    }
    [v9 setEncryptionMethod:v14];
    goto LABEL_13;
  }
  id v9 = +[SKError nilWithSKErrorCode:250 error:a4];
LABEL_13:

  return v9;
}

- (id)diConvertParamsWithOutputURL:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int64_t v7 = [v6 URLByResolvingSymlinksInPath];
  v8 = [v7 absoluteString];
  id v9 = [(SKDiskImageCreateParams *)self source];
  BOOL v10 = [v9 URLByResolvingSymlinksInPath];
  uint64_t v11 = [v10 absoluteString];
  int v12 = [v8 isEqualToString:v11];

  if (v12)
  {
    int64_t v13 = SKGetOSLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(SKDiskImageCreateParams *)self source];
      int v29 = 136315394;
      v30 = "-[SKDiskImageCreateParams diConvertParamsWithOutputURL:error:]";
      __int16 v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_23F40C000, v13, OS_LOG_TYPE_DEFAULT, "%s: Creating image in place %@", (uint8_t *)&v29, 0x16u);
    }
    id v15 = objc_alloc(MEMORY[0x263F3A3E0]);
    v16 = [(SKDiskImageCreateParams *)self source];
    uint64_t v17 = [v15 initForInplaceWithURL:v16 error:a4];
  }
  else
  {
    id v18 = objc_alloc(MEMORY[0x263F3A3E0]);
    v16 = [(SKDiskImageCreateParams *)self source];
    uint64_t v17 = [v18 initWithInputURL:v16 outputURL:v6 error:a4];
  }
  v19 = (void *)v17;

  if (v19)
  {
    unint64_t v20 = [(SKDiskImageCreateParams *)self format] - 1;
    if (v20 >= 6)
    {
      id v26 = +[SKError nilWithSKErrorCode:250 error:a4];
    }
    else
    {
      [v19 setOutputFormat:qword_23F43C798[v20]];
      BOOL v21 = [(SKDiskImageCreateParams *)self stdinPassPhrase];
      uint64_t v22 = [v19 readPassphraseFlags];
      if (v21) {
        uint64_t v23 = v22 | 8;
      }
      else {
        uint64_t v23 = v22;
      }
      [v19 setReadPassphraseFlags:v23];
      int64_t v24 = [(SKDiskImageCreateParams *)self encryption];
      if (v24 == 2) {
        uint64_t v25 = 2;
      }
      else {
        uint64_t v25 = v24 == 1;
      }
      [v19 setEncryptionMethod:v25];
      id v26 = v19;
    }
    v27 = v26;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (int64_t)encryption
{
  return self->_encryption;
}

- (void)setEncryption:(int64_t)a3
{
  self->_encryption = a3;
}

- (BOOL)stdinPassPhrase
{
  return self->_stdinPassPhrase;
}

- (void)setStdinPassPhrase:(BOOL)a3
{
  self->_stdinPassPhrase = a3;
}

- (int64_t)format
{
  return self->_format;
}

- (void)setFormat:(int64_t)a3
{
  self->_format = a3;
}

- (unint64_t)numBlocks
{
  return self->_numBlocks;
}

- (void)setNumBlocks:(unint64_t)a3
{
  self->_numBlocks = a3;
}

- (NSString)volumeName
{
  return self->_volumeName;
}

- (void)setVolumeName:(id)a3
{
}

- (NSURL)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_volumeName, 0);
}

@end