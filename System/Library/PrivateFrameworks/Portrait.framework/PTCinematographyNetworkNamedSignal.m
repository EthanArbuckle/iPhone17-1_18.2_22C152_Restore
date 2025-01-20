@interface PTCinematographyNetworkNamedSignal
- (BOOL)flatten;
- (PTCinematographyNetworkNamedSignal)initWithModelDictionary:(id)a3;
- (id)_flattenArray:(id)a3;
- (void)_flattenArray:(id)a3 toMutableArray:(id)a4;
- (void)writePayload:(id)a3 toStream:(id)a4;
@end

@implementation PTCinematographyNetworkNamedSignal

- (PTCinematographyNetworkNamedSignal)initWithModelDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PTCinematographyNetworkNamedSignal;
  v5 = [(PTCinematographyNetworkSignal *)&v8 initWithModelDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"flatten"];
    v5->_flatten = [v6 BOOLValue];
  }
  return v5;
}

- (void)writePayload:(id)a3 toStream:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(PTCinematographyNetworkSignal *)self checkSignalForStream:v7])
  {
    objc_super v8 = [v6 detection];
    v9 = [v8 _namedSignals];
    v10 = [(PTCinematographyNetworkSignal *)self name];
    v11 = [v9 objectForKeyedSubscript:v10];

    if (v11)
    {
      if ([(PTCinematographyNetworkNamedSignal *)self flatten])
      {
        v12 = [(PTCinematographyNetworkNamedSignal *)self _flattenArray:v11];

        v11 = v12;
        if (!v11) {
          goto LABEL_22;
        }
      }
      else
      {
        v11 = v11;
      }
      if (![v6 isMissingDetection])
      {
        uint64_t v13 = [v11 count];
        if (v13 == [(PTCinematographyNetworkSignal *)self count])
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          v11 = v11;
          uint64_t v14 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v20;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v20 != v16) {
                  objc_enumerationMutation(v11);
                }
                objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "floatValue", (void)v19);
                objc_msgSend(v7, "writeFloat:");
              }
              uint64_t v15 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
            }
            while (v15);
          }

          goto LABEL_23;
        }
        v18 = _PTLogSystem();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[PTCinematographyNetworkNamedSignal writePayload:toStream:](self, v11, v18);
        }
      }
    }
LABEL_22:
    objc_msgSend(v7, "writeZerosWithCount:", -[PTCinematographyNetworkSignal count](self, "count"));
LABEL_23:

    goto LABEL_24;
  }
  v11 = _PTLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[PTCinematographyNetworkNamedSignal writePayload:toStream:](v11);
  }
LABEL_24:
}

- (id)_flattenArray:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  [(PTCinematographyNetworkNamedSignal *)self _flattenArray:v4 toMutableArray:v5];

  id v6 = (void *)[v5 copy];

  return v6;
}

- (void)_flattenArray:(id)a3 toMutableArray:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [(PTCinematographyNetworkNamedSignal *)self _flattenArray:v12 toMutableArray:v7];
        }
        else {
          [v7 addObject:v12];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (BOOL)flatten
{
  return self->_flatten;
}

- (void)writePayload:(NSObject *)a3 toStream:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a1 count];
  id v7 = [a1 name];
  int v8 = 134218498;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = [a2 count];
  _os_log_error_impl(&dword_1D0778000, a3, OS_LOG_TYPE_ERROR, "Expected %ld values for named signal %@, got %ld values", (uint8_t *)&v8, 0x20u);
}

- (void)writePayload:(os_log_t)log toStream:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "not enough room to write signal for network payload", v1, 2u);
}

@end