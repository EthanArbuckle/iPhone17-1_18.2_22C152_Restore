@interface RCPStdinEventStreamGenerator
- (BOOL)_processBuffer;
- (RCPStdinEventStreamGenerator)init;
- (id)nextEventStream;
- (void)dealloc;
@end

@implementation RCPStdinEventStreamGenerator

- (RCPStdinEventStreamGenerator)init
{
  v10.receiver = self;
  v10.super_class = (Class)RCPStdinEventStreamGenerator;
  v2 = [(RCPStdinEventStreamGenerator *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA10]) initWithFileAtPath:@"/dev/stdin"];
    stdin = v2->_stdin;
    v2->_stdin = (NSInputStream *)v3;

    uint64_t v5 = objc_opt_new();
    commandBuffer = v2->_commandBuffer;
    v2->_commandBuffer = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    stringBuffer = v2->_stringBuffer;
    v2->_stringBuffer = (NSMutableString *)v7;

    [(NSInputStream *)v2->_stdin open];
  }
  return v2;
}

- (void)dealloc
{
  [(NSInputStream *)self->_stdin close];
  v3.receiver = self;
  v3.super_class = (Class)RCPStdinEventStreamGenerator;
  [(RCPStdinEventStreamGenerator *)&v3 dealloc];
}

- (BOOL)_processBuffer
{
  if ([(NSMutableArray *)self->_commandBuffer count]) {
    return 1;
  }
  do
  {
    while (![(NSInputStream *)self->_stdin hasBytesAvailable]
         && [(NSInputStream *)self->_stdin streamStatus] == 2)
      ;
    uint64_t v4 = [(NSInputStream *)self->_stdin streamStatus];
    BOOL v3 = v4 == 2;
    if (v4 != 2) {
      break;
    }
    uint64_t v5 = malloc_type_calloc(0xFFuLL, 1uLL, 0x100004077774924uLL);
    if ([(NSInputStream *)self->_stdin hasBytesAvailable])
    {
      do
      {
        NSInteger v6 = [(NSInputStream *)self->_stdin read:v5 maxLength:255];
        if (!v6) {
          return 0;
        }
        uint64_t v7 = (void *)[[NSString alloc] initWithBytes:v5 length:v6 encoding:4];
        [(NSMutableString *)self->_stringBuffer appendString:v7];
        stringBuffer = self->_stringBuffer;
        uint64_t v9 = [(NSMutableString *)stringBuffer length];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __46__RCPStdinEventStreamGenerator__processBuffer__block_invoke;
        v11[3] = &unk_1E5D77080;
        v11[4] = self;
        -[NSMutableString enumerateSubstringsInRange:options:usingBlock:](stringBuffer, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 0, v11);
      }
      while ([(NSInputStream *)self->_stdin hasBytesAvailable]);
    }
  }
  while (![(NSMutableArray *)self->_commandBuffer count]);
  return v3;
}

void __46__RCPStdinEventStreamGenerator__processBuffer__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  if (v13 && a3 + a4 != a5 + a6)
  {
    v15 = RCPLogPlayback();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = v13;
      _os_log_impl(&dword_1A9051000, v15, OS_LOG_TYPE_DEFAULT, "Found full command: %{public}@", (uint8_t *)&v16, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 16) addObject:v13];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "deleteCharactersInRange:", a5, a6);
  }
  else
  {
    v14 = RCPLogPlayback();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = v13;
      _os_log_impl(&dword_1A9051000, v14, OS_LOG_TYPE_DEFAULT, "Found partial command: %{public}@", (uint8_t *)&v16, 0xCu);
    }

    *a7 = 1;
  }
}

- (id)nextEventStream
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(RCPStdinEventStreamGenerator *)self _processBuffer])
  {
    BOOL v3 = [(NSMutableArray *)self->_commandBuffer firstObject];
    [(NSMutableArray *)self->_commandBuffer removeObjectAtIndex:0];
    uint64_t v4 = RCPLogPlayback();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      objc_super v10 = v3;
      _os_log_impl(&dword_1A9051000, v4, OS_LOG_TYPE_DEFAULT, "Generating event stream for command: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    NSInteger v6 = [v3 componentsSeparatedByCharactersInSet:v5];

    uint64_t v7 = +[RCPSyntheticEventStream eventStreamWithCLIArguments:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringBuffer, 0);
  objc_storeStrong((id *)&self->_commandBuffer, 0);
  objc_storeStrong((id *)&self->_stdin, 0);
}

@end