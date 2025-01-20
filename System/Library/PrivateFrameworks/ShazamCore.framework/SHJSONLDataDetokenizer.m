@interface SHJSONLDataDetokenizer
- (BOOL)closeWithError:(id *)a3;
- (BOOL)processData:(id)a3 error:(id *)a4;
- (BOOL)writeDataToDelegate:(id)a3 withError:(id *)a4;
- (NSMutableData)currentData;
- (SHDataStream)next;
- (SHJSONLDataDetokenizer)init;
- (SHJSONLDataDetokenizerDelegate)delegate;
- (void)setCurrentData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNext:(id)a3;
@end

@implementation SHJSONLDataDetokenizer

- (SHJSONLDataDetokenizer)init
{
  v6.receiver = self;
  v6.super_class = (Class)SHJSONLDataDetokenizer;
  v2 = [(SHJSONLDataDetokenizer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF990] data];
    currentData = v2->_currentData;
    v2->_currentData = (NSMutableData *)v3;
  }
  return v2;
}

- (BOOL)writeDataToDelegate:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v20 = 0;
  v7 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:1 error:&v20];
  id v8 = v20;
  if (v7)
  {
    id v9 = [(SHJSONLDataDetokenizer *)self next];

    if (!v9
      || ([(SHJSONLDataDetokenizer *)self next],
          v10 = objc_claimAutoreleasedReturnValue(),
          id v19 = 0,
          int v11 = [v10 processData:v6 error:&v19],
          id v9 = v19,
          v10,
          id v12 = v9,
          v11))
    {
      v13 = [(SHJSONLDataDetokenizer *)self delegate];

      if (!v13)
      {
        BOOL v16 = 1;
        goto LABEL_12;
      }
      v14 = [(SHJSONLDataDetokenizer *)self delegate];
      id v18 = v9;
      char v15 = [v14 parsedJSONObject:v7 error:&v18];
      id v12 = v18;

      if (v15)
      {
        BOOL v16 = 1;
        id v9 = v12;
LABEL_12:

        goto LABEL_13;
      }
      id v9 = v12;
    }
    +[SHCoreError annotateError:a4 withError:v12];
    BOOL v16 = 0;
    goto LABEL_12;
  }
  if (a4)
  {
    +[SHCoreError errorWithCode:300 underlyingError:v8];
    BOOL v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_13:

  return v16;
}

- (BOOL)processData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [@"\n" dataUsingEncoding:4];
  uint64_t v8 = objc_msgSend(v6, "sh_rangeOfData:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = [(SHJSONLDataDetokenizer *)self currentData];
    [v10 appendData:v6];
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v12 = v8;
    uint64_t v13 = v8 + v9;
    v10 = objc_msgSend(v6, "subdataWithRange:", 0, v8 + v9);
    if (v12)
    {
      v14 = [(SHJSONLDataDetokenizer *)self currentData];
      [v14 appendData:v10];
    }
    char v15 = [(SHJSONLDataDetokenizer *)self currentData];
    uint64_t v16 = [v15 length];

    if (!v16) {
      goto LABEL_7;
    }
    v17 = [(SHJSONLDataDetokenizer *)self currentData];
    id v18 = [MEMORY[0x263EFF990] data];
    [(SHJSONLDataDetokenizer *)self setCurrentData:v18];

    LODWORD(v18) = [(SHJSONLDataDetokenizer *)self writeDataToDelegate:v17 withError:a4];
    if (!v18)
    {
      BOOL v11 = 0;
    }
    else
    {
LABEL_7:
      id v19 = (void *)MEMORY[0x263EFF990];
      id v20 = objc_msgSend(v6, "subdataWithRange:", v13, objc_msgSend(v6, "length") - v13);
      v21 = [v19 dataWithData:v20];

      BOOL v11 = [(SHJSONLDataDetokenizer *)self processData:v21 error:a4];
    }
  }

  return v11;
}

- (BOOL)closeWithError:(id *)a3
{
  v5 = [(SHJSONLDataDetokenizer *)self currentData];
  if ([v5 length])
  {
    id v6 = [(SHJSONLDataDetokenizer *)self currentData];
    BOOL v7 = [(SHJSONLDataDetokenizer *)self writeDataToDelegate:v6 withError:a3];

    if (!v7) {
      return 0;
    }
  }
  else
  {
  }
  uint64_t v9 = [(SHJSONLDataDetokenizer *)self next];
  char v10 = [v9 closeWithError:a3];

  return v10;
}

- (SHDataStream)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
}

- (SHJSONLDataDetokenizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SHJSONLDataDetokenizerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableData)currentData
{
  return self->_currentData;
}

- (void)setCurrentData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_next, 0);
}

@end