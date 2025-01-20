@interface BRCPackageManifestReader
- (BRCPackageManifestReader)init;
- (BRCPackageManifestReader)initWithAsset:(id)a3;
- (BRCPackageManifestReader)initWithDeviceID:(int)a3 fileID:(unint64_t)a4;
- (BRCPackageManifestReader)initWithInputStream:(id)a3;
- (BRCPackageManifestReader)initWithURL:(id)a3;
- (Class)itemClass;
- (id)error;
- (id)nextObject;
- (void)dealloc;
- (void)done;
- (void)nextObject;
- (void)setItemClass:(Class)a3;
@end

@implementation BRCPackageManifestReader

- (Class)itemClass
{
  return (Class)[(PBMessageStreamReader *)self->_reader classOfNextMessage];
}

- (void)setItemClass:(Class)a3
{
}

- (BRCPackageManifestReader)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = [NSString stringWithUTF8String:"-[BRCPackageManifestReader init]"];
  [v3 raise:v4, @"Don't call %@.", v5 format];

  return 0;
}

- (BRCPackageManifestReader)initWithInputStream:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BRCPackageManifestReader;
  v6 = [(BRCPackageManifestReader *)&v18 init];
  v7 = v6;
  if (v6)
  {
    p_stream = (id *)&v6->_stream;
    objc_storeStrong((id *)&v6->_stream, a3);
    uint64_t v9 = [objc_alloc(MEMORY[0x263F62238]) initWithStream:*p_stream];
    reader = v7->_reader;
    v7->_reader = (PBMessageStreamReader *)v9;

    [(PBMessageStreamReader *)v7->_reader setClassOfNextMessage:objc_opt_class()];
    [v5 open];
    v11 = (void *)[(PBMessageStreamReader *)v7->_reader nextMessage];
    v12 = v11;
    if (v11 && [v11 version] == 1)
    {
      [(PBMessageStreamReader *)v7->_reader setClassOfNextMessage:objc_opt_class()];
    }
    else
    {
      v13 = brc_bread_crumbs();
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        int v16 = [v12 version];
        v17 = [*p_stream streamError];
        *(_DWORD *)buf = 138413058;
        v20 = v12;
        __int16 v21 = 1024;
        int v22 = v16;
        __int16 v23 = 2112;
        v24 = v17;
        __int16 v25 = 2112;
        v26 = v13;
        _os_log_error_impl(&dword_23FA42000, v14, (os_log_type_t)0x90u, "[ERROR] unable to read package header %@ with version %d - %@%@", buf, 0x26u);
      }
      [(BRCPackageManifestReader *)v7 done];

      v7 = 0;
    }
  }
  return v7;
}

- (BRCPackageManifestReader)initWithURL:(id)a3
{
  uint64_t v4 = [MEMORY[0x263EFF950] inputStreamWithURL:a3];
  id v5 = [(BRCPackageManifestReader *)self initWithInputStream:v4];

  return v5;
}

- (BRCPackageManifestReader)initWithAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 fileID];
  if (v5
    && (v6 = (void *)v5,
        [v4 deviceID],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    v8 = [v4 deviceID];
    uint64_t v9 = [v8 unsignedIntValue];
    v10 = [v4 fileID];
    v11 = -[BRCPackageManifestReader initWithDeviceID:fileID:](self, "initWithDeviceID:fileID:", v9, [v10 unsignedLongLongValue]);
  }
  else
  {
    v8 = [v4 fileURL];
    v11 = [(BRCPackageManifestReader *)self initWithURL:v8];
  }

  return v11;
}

- (BRCPackageManifestReader)initWithDeviceID:(int)a3 fileID:(unint64_t)a4
{
  uint64_t v5 = objc_msgSend(NSString, "br_pathWithDeviceID:fileID:", *(void *)&a3, a4);
  v6 = [MEMORY[0x263EFF950] inputStreamWithFileAtPath:v5];
  v7 = [(BRCPackageManifestReader *)self initWithInputStream:v6];

  return v7;
}

- (void)dealloc
{
  [(BRCPackageManifestReader *)self done];
  v3.receiver = self;
  v3.super_class = (Class)BRCPackageManifestReader;
  [(BRCPackageManifestReader *)&v3 dealloc];
}

- (void)done
{
  [(NSInputStream *)self->_stream close];
  reader = self->_reader;
  self->_reader = 0;

  stream = self->_stream;
  self->_stream = 0;
}

- (id)nextObject
{
  reader = self->_reader;
  if (!reader)
  {
    v10 = brc_bread_crumbs();
    v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCPackageManifestReader nextObject]();
    }

    reader = self->_reader;
  }
  id v4 = (void *)[(PBMessageStreamReader *)reader nextMessage];
  if (!v4)
  {
    if ([(NSInputStream *)self->_stream streamStatus] == 7)
    {
      uint64_t v5 = [(NSInputStream *)self->_stream streamError];
      error = self->_error;
      self->_error = v5;

      v7 = brc_bread_crumbs();
      v8 = brc_default_log();
      if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
        -[BRCPackageManifestReader nextObject]();
      }
    }
    [(BRCPackageManifestReader *)self done];
  }
  return v4;
}

- (id)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_reader, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

- (void)nextObject
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _reader%@", v2, v3, v4, v5, v6);
}

@end