@interface SHDataStreamInput
- (BOOL)closeWithError:(id *)a3;
- (BOOL)loadDataFromURL:(id)a3 error:(id *)a4;
- (BOOL)processData:(id)a3 error:(id *)a4;
- (BOOL)readFromURL:(id)a3 error:(id *)a4;
- (SHDataStream)next;
- (void)setNext:(id)a3;
@end

@implementation SHDataStreamInput

- (BOOL)loadDataFromURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v15 = 0;
  v7 = [MEMORY[0x263F08850] defaultManager];
  v8 = [v6 path];
  int v9 = [v7 fileExistsAtPath:v8 isDirectory:&v15];
  int v10 = v15;

  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    BOOL v12 = [(SHDataStreamInput *)self readFromURL:v6 error:a4];
    v13 = [(SHDataStreamInput *)self next];
    [v13 closeWithError:0];
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:260 userInfo:0];
    BOOL v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)readFromURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x263EFF950] inputStreamWithURL:v6];
  [v7 open];
  if ([v7 hasBytesAvailable])
  {
    v17 = a4;
    v8 = 0;
    while (1)
    {
      int v9 = (void *)MEMORY[0x22A668E30]();
      int v10 = [MEMORY[0x263EFF990] dataWithCapacity:2048];
      [v10 setLength:2048];
      id v11 = v10;
      uint64_t v12 = objc_msgSend(v7, "read:maxLength:", objc_msgSend(v11, "mutableBytes"), 2048);
      BOOL v13 = v12 == 0;
      if (!v12) {
        break;
      }
      id v18 = v8;
      BOOL v14 = [(SHDataStreamInput *)self processData:v11 error:&v18];
      id v15 = v18;

      if (!v14) {
        goto LABEL_9;
      }

      v8 = v15;
      if (([v7 hasBytesAvailable] & 1) == 0)
      {
        BOOL v13 = 1;
        goto LABEL_10;
      }
    }
    id v15 = v8;
LABEL_9:

LABEL_10:
    if (v17 && v15)
    {
      id v15 = v15;
      id *v17 = v15;
    }
  }
  else
  {
    id v15 = 0;
    BOOL v13 = 1;
  }
  objc_msgSend(v7, "close", v17);

  return v13;
}

- (BOOL)closeWithError:(id *)a3
{
  v5 = [(SHDataStreamInput *)self next];
  if (v5)
  {
    id v6 = [(SHDataStreamInput *)self next];
    char v7 = [v6 closeWithError:a3];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)processData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = [(SHDataStreamInput *)self next];
  LOBYTE(a4) = [v7 processData:v6 error:a4];

  return (char)a4;
}

- (SHDataStream)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end