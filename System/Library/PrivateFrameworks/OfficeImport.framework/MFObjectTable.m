@interface MFObjectTable
- (MFObjectTable)init;
- (id)getObject:(unsigned int)a3;
- (int)deleteObject:(unsigned int)a3;
- (int)putObject:(id)a3 in_objectPos:(unsigned int)a4;
- (int)selectInto:(int)a3 io_DC:(id)a4;
- (int)size;
- (unsigned)insertPos;
- (unsigned)maximumSize;
- (void)clear;
- (void)setMaximumSize:(unsigned int)a3;
@end

@implementation MFObjectTable

- (MFObjectTable)init
{
  v6.receiver = self;
  v6.super_class = (Class)MFObjectTable;
  v2 = [(MFObjectTable *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    m_objects = v2->m_objects;
    v2->m_objects = (NSMutableArray *)v3;

    v2->m_maximumSize = 0;
  }
  return v2;
}

- (unsigned)insertPos
{
  unsigned int v3 = [(NSMutableArray *)self->m_objects count];
  unsigned int v4 = v3;
  if (v3)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v3;
    while (1)
    {
      v7 = [(NSMutableArray *)self->m_objects objectAtIndex:v5];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }
      if (v6 == ++v5) {
        return v4;
      }
    }
    return v5;
  }
  return v4;
}

- (int)deleteObject:(unsigned int)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = [(NSMutableArray *)self->m_objects objectAtIndex:a3];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    m_objects = self->m_objects;
    v8 = [MEMORY[0x263EFF9D0] null];
    [(NSMutableArray *)m_objects replaceObjectAtIndex:v4 withObject:v8];
  }
  return 0;
}

- (void)clear
{
}

- (int)size
{
  return [(NSMutableArray *)self->m_objects count];
}

- (int)selectInto:(int)a3 io_DC:(id)a4
{
  id v6 = a4;
  v7 = [(NSMutableArray *)self->m_objects objectAtIndex:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [v7 selectInto:v6];
  }

  return 0;
}

- (int)putObject:(id)a3 in_objectPos:(unsigned int)a4
{
  id v6 = a3;
  if (self->m_maximumSize - 1 >= a4)
  {
    if (a4 == -1) {
      a4 = [(MFObjectTable *)self insertPos];
    }
    unsigned int v8 = [(NSMutableArray *)self->m_objects count];
    int v9 = a4 - v8;
    if (a4 >= v8)
    {
      if (a4 > v8)
      {
        do
        {
          m_objects = self->m_objects;
          v11 = [MEMORY[0x263EFF9D0] null];
          [(NSMutableArray *)m_objects addObject:v11];

          --v9;
        }
        while (v9);
      }
      [(NSMutableArray *)self->m_objects addObject:v6];
    }
    else
    {
      [(NSMutableArray *)self->m_objects replaceObjectAtIndex:a4 withObject:v6];
    }
    int v7 = 0;
  }
  else
  {
    int v7 = -7;
  }

  return v7;
}

- (id)getObject:(unsigned int)a3
{
  id v5 = [(NSMutableArray *)self->m_objects objectAtIndex:a3];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v3 = v5;
    id v5 = 0;
  }
  return v5;
}

- (unsigned)maximumSize
{
  return self->m_maximumSize;
}

- (void)setMaximumSize:(unsigned int)a3
{
  self->m_maximumSize = a3;
}

- (void).cxx_destruct
{
}

@end