@interface NRGIconCatalog
- (BOOL)readonly;
- (NRGIconCatalog)init;
- (NRGIconCatalog)initWithURL:(id)a3 readonly:(BOOL)a4;
- (NSString)path;
- (NSURL)url;
- (id)readIcon;
- (void)close;
- (void)readIcons:(id)a3;
- (void)remove;
- (void)writeIcon:(id)a3;
@end

@implementation NRGIconCatalog

- (NRGIconCatalog)init
{
  v3 = +[NSFileManager defaultManager];
  v4 = [v3 temporaryDirectory];

  v5 = +[NSUUID UUID];
  v6 = +[NSString stringWithFormat:@"%@.nrg", v5];

  id v7 = v4;
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s/%@", [v7 fileSystemRepresentation], v6);
  v9 = +[NSURL fileURLWithPath:v8];
  v10 = [(NRGIconCatalog *)self initWithURL:v9 readonly:0];

  return v10;
}

- (NRGIconCatalog)initWithURL:(id)a3 readonly:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NRGIconCatalog;
  v8 = [(NRGIconCatalog *)&v20 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_13;
  }
  objc_storeStrong((id *)&v8->_url, a3);
  uint64_t v10 = +[NSString stringWithCString:[(NSURL *)v9->_url fileSystemRepresentation] encoding:4];
  path = v9->_path;
  v9->_path = (NSString *)v10;

  v9->_readonly = v4;
  url = v9->_url;
  if (v4)
  {
    v13 = +[NSInputStream inputStreamWithURL:url];
    if (v13)
    {
      objc_storeStrong((id *)&v9->_stream, v13);
      v14 = (PBMessageStreamReader *)[objc_alloc((Class)PBMessageStreamReader) initWithStream:v13];
      pbReader = v9->_pbReader;
      v9->_pbReader = v14;
LABEL_7:
    }
  }
  else
  {
    v13 = +[NSOutputStream outputStreamWithURL:url append:0];
    if (v13)
    {
      objc_storeStrong((id *)&v9->_stream, v13);
      v16 = (PBMessageStreamWriter *)[objc_alloc((Class)PBMessageStreamWriter) initWithOutputStream:v13];
      pbReader = v9->_pbWriter;
      v9->_pbWriter = v16;
      goto LABEL_7;
    }
  }

  stream = v9->_stream;
  if (!stream)
  {
    v18 = nrg_daemon_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100014728(&v9->_path, v4, v18);
    }

    stream = v9->_stream;
  }
  [(NSStream *)stream open];
LABEL_13:

  return v9;
}

- (void)writeIcon:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(NRGPBDataHeader);
  v6 = [v4 iconData];
  id v7 = [v6 checksumData];
  [(NRGPBDataHeader *)v5 setChecksumData:v7];

  if (![(PBMessageStreamWriter *)self->_pbWriter writeMessage:v5]
    || ([(PBMessageStreamWriter *)self->_pbWriter writeMessage:v4] & 1) == 0)
  {
    v8 = nrg_daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000147BC((uint64_t)v4, (uint64_t)self, v8);
    }
  }
}

- (id)readIcon
{
  [(PBMessageStreamReader *)self->_pbReader setClassOfNextMessage:objc_opt_class()];
  id v3 = [(PBMessageStreamReader *)self->_pbReader nextMessage];
  if (v3)
  {
    [(PBMessageStreamReader *)self->_pbReader setClassOfNextMessage:objc_opt_class()];
    id v4 = [(PBMessageStreamReader *)self->_pbReader nextMessage];
    v5 = [v4 iconData];
    v6 = [v3 checksumData];
    unsigned __int8 v7 = [v5 matchesChecksumData:v6];

    if (v7) {
      goto LABEL_7;
    }
    v8 = nrg_daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100014838(v8);
    }
  }
  id v4 = 0;
LABEL_7:

  return v4;
}

- (void)readIcons:(id)a3
{
  v8 = (void (**)(void))a3;
  uint64_t v4 = [(NRGIconCatalog *)self readIcon];
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      if (v8) {
        v8[2]();
      }
      uint64_t v7 = [(NRGIconCatalog *)self readIcon];

      v5 = (void *)v7;
    }
    while (v7);
  }
}

- (void)close
{
}

- (void)remove
{
  [(NRGIconCatalog *)self close];
  id v3 = +[NSFileManager defaultManager];
  path = self->_path;
  p_path = &self->_path;
  id v8 = 0;
  [v3 removeItemAtPath:path error:&v8];
  id v6 = v8;

  if (v6)
  {
    uint64_t v7 = nrg_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10001487C(p_path, (uint64_t)v6, v7);
    }
  }
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)path
{
  return self->_path;
}

- (BOOL)readonly
{
  return self->_readonly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_pbWriter, 0);
  objc_storeStrong((id *)&self->_pbReader, 0);

  objc_storeStrong((id *)&self->_stream, 0);
}

@end