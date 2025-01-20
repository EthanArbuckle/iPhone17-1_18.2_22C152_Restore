@interface SUCoreUpdateDownloaderParam
- (NSError)error;
- (NSString)note;
- (SUCoreProgress)progress;
- (SUCoreUpdateDownloaderParam)init;
- (SUCoreUpdateDownloaderParam)initWithError:(id)a3;
- (SUCoreUpdateDownloaderParam)initWithNote:(id)a3;
- (SUCoreUpdateDownloaderParam)initWithProgress:(id)a3;
- (id)description;
@end

@implementation SUCoreUpdateDownloaderParam

- (SUCoreUpdateDownloaderParam)initWithProgress:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCoreUpdateDownloaderParam;
  v6 = [(SUCoreUpdateDownloaderParam *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_progress, a3);
    v7->_type = 1;
  }

  return v7;
}

- (SUCoreUpdateDownloaderParam)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCoreUpdateDownloaderParam;
  v6 = [(SUCoreUpdateDownloaderParam *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    v7->_type = 2;
  }

  return v7;
}

- (SUCoreUpdateDownloaderParam)initWithNote:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCoreUpdateDownloaderParam;
  v6 = [(SUCoreUpdateDownloaderParam *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_note, a3);
    v7->_type = 3;
  }

  return v7;
}

- (SUCoreUpdateDownloaderParam)init
{
  v3.receiver = self;
  v3.super_class = (Class)SUCoreUpdateDownloaderParam;
  result = [(SUCoreUpdateDownloaderParam *)&v3 init];
  if (result) {
    result->_type = 0;
  }
  return result;
}

- (id)description
{
  uint64_t type = self->_type;
  switch(type)
  {
    case 3:
      v7 = NSString;
      v4 = [(SUCoreUpdateDownloaderParam *)self note];
      [v7 stringWithFormat:@"\n[>>>\n    note: %@\n<<<]", v4];
      v6 = LABEL_7:;
      goto LABEL_8;
    case 2:
      v8 = NSString;
      v4 = [(SUCoreUpdateDownloaderParam *)self error];
      [v8 stringWithFormat:@"\n[>>>\n    error: %@\n<<<]", v4];
      goto LABEL_7;
    case 1:
      objc_super v3 = NSString;
      v4 = [(SUCoreUpdateDownloaderParam *)self progress];
      id v5 = [v4 summary];
      v6 = [v3 stringWithFormat:@"\n[>>>\n    progress: %@\n<<<]", v5];

LABEL_8:
      goto LABEL_10;
  }
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"NO_INFO[%d]", type);
LABEL_10:

  return v6;
}

- (SUCoreProgress)progress
{
  return self->_progress;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)note
{
  return self->_note;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_progress, 0);
}

@end