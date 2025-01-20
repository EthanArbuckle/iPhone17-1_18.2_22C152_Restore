@interface TIDPReporterMock
- (BOOL)record:(id)a3;
- (BOOL)record:(id)a3 metadata:(id)a4;
- (BOOL)recordNumbersVectors:(id)a3 metadata:(id)a4;
- (BOOL)recordTokenFrequency:(id)a3 withLocale:(id)a4 withTokenType:(id)a5;
- (NSArray)recordsWritten;
- (TIDPReporterMock)init;
- (void)reset;
@end

@implementation TIDPReporterMock

- (void).cxx_destruct
{
}

- (NSArray)recordsWritten
{
  v2 = (void *)[(NSMutableArray *)self->_recordsWritten copy];

  return (NSArray *)v2;
}

- (void)reset
{
}

- (BOOL)recordTokenFrequency:(id)a3 withLocale:(id)a4 withTokenType:(id)a5
{
  v6 = (objc_class *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  v8 = objc_msgSend([v6 alloc], "initWithObjects:", v7, 0);

  [(TIDPReporterMock *)self record:v8];
  return 1;
}

- (BOOL)recordNumbersVectors:(id)a3 metadata:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [(TIDPReporterMock *)self record:*(void *)(*((void *)&v11 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return 1;
}

- (BOOL)record:(id)a3 metadata:(id)a4
{
  return 1;
}

- (BOOL)record:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NSMutableArray *)self->_recordsWritten addObject:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return 1;
}

- (TIDPReporterMock)init
{
  v7.receiver = self;
  v7.super_class = (Class)TIDPReporterMock;
  v3 = [(TIDPReporterMock *)&v7 init];
  if (v3 == self)
  {
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    recordsWritten = self->_recordsWritten;
    self->_recordsWritten = v4;
  }
  return v3;
}

@end