@interface SRUIFMutableStack
- (id)copyWithZone:(_NSZone *)a3;
- (id)popTopObject;
- (void)popObjectsUsingBlock:(id)a3;
- (void)pushObject:(id)a3;
@end

@implementation SRUIFMutableStack

- (void)pushObject:(id)a3
{
  id v4 = a3;
  id v5 = [(SRUIFStack *)self _elements];
  [v5 addObject:v4];
}

- (id)popTopObject
{
  v3 = [(SRUIFStack *)self topObject];
  id v4 = [(SRUIFStack *)self _elements];
  [v4 removeLastObject];

  return v3;
}

- (void)popObjectsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  if (v4)
  {
    char v11 = 0;
    id v5 = [(SRUIFStack *)self _elements];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      uint64_t v7 = v6 - 1;
      do
      {
        v8 = [(SRUIFMutableStack *)self popTopObject];
        v4[2](v4, v8, &v11);

        BOOL v9 = v7-- != 0;
      }
      while (v9 && !v11);
    }
  }
  else
  {
    v10 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_FAULT)) {
      -[SRUIFMutableStack popObjectsUsingBlock:](v10);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SRUIFStack alloc];
  return [(SRUIFStack *)v4 initWithStack:self];
}

- (void)popObjectsUsingBlock:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[SRUIFMutableStack popObjectsUsingBlock:]";
  _os_log_fault_impl(&dword_225FBA000, log, OS_LOG_TYPE_FAULT, "%s nil block provided to pop stack; returning",
    (uint8_t *)&v1,
    0xCu);
}

@end