@interface REElementArchiver
- (REElementArchiver)initWithEngine:(id)a3;
- (id)_supportedClasses;
- (id)dataWithElement:(id)a3;
- (id)elementWithData:(id)a3;
@end

@implementation REElementArchiver

- (REElementArchiver)initWithEngine:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REElementArchiver;
  v6 = [(REElementArchiver *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_engine, a3);
  }

  return v7;
}

- (id)_supportedClasses
{
  if (_supportedClasses_onceToken != -1) {
    dispatch_once(&_supportedClasses_onceToken, &__block_literal_global_44);
  }
  v2 = (void *)_supportedClasses_Classes;
  return v2;
}

void __38__REElementArchiver__supportedClasses__block_invoke()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:5];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7);
  v3 = (void *)_supportedClasses_Classes;
  _supportedClasses_Classes = v2;
}

- (id)elementWithData:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F08928];
  id v5 = a3;
  uint64_t v6 = [(REElementArchiver *)self _supportedClasses];
  id v12 = 0;
  uint64_t v7 = [v4 unarchivedObjectOfClasses:v6 fromData:v5 error:&v12];

  id v8 = v12;
  if (v7)
  {
    uint64_t v9 = [(RERelevanceEngine *)self->_engine elementFromDictionary:v7];
  }
  else
  {
    v10 = RELogForDomain(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[REElementArchiver elementWithData:]((uint64_t)v8, v10);
    }

    uint64_t v9 = 0;
  }

  return v9;
}

- (id)dataWithElement:(id)a3
{
  v3 = [(RERelevanceEngine *)self->_engine dictionaryFromElement:a3];
  if (v3)
  {
    id v9 = 0;
    uint64_t v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v9];
    id v5 = v9;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      uint64_t v7 = RELogForDomain(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[REElementArchiver dataWithElement:]((uint64_t)v5, v7);
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
}

- (void)elementWithData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "Unable to decode REElement from data %@", (uint8_t *)&v2, 0xCu);
}

- (void)dataWithElement:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "Unable to encode REElement to data %@", (uint8_t *)&v2, 0xCu);
}

@end