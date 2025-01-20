@interface MapsRingBuffer
- (MapsRingBuffer)initWithLength:(unint64_t)a3;
- (NSMutableArray)array;
- (id)_orderedObjects;
- (id)debugDescription;
- (id)firstObject;
- (id)lastObject;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)length;
- (unint64_t)mutation;
- (unint64_t)position;
- (void)push:(id)a3;
- (void)removeAllObjects;
- (void)setArray:(id)a3;
- (void)setLength:(unint64_t)a3;
- (void)setMutation:(unint64_t)a3;
- (void)setPosition:(unint64_t)a3;
@end

@implementation MapsRingBuffer

- (MapsRingBuffer)initWithLength:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MapsRingBuffer;
  v4 = [(MapsRingBuffer *)&v9 init];
  if (v4)
  {
    v5 = sub_100077568();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v11 = v4;
      __int16 v12 = 2048;
      unint64_t v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%p] Creating ring buffer with length: %lu", buf, 0x16u);
    }

    v4->_length = a3;
    uint64_t v6 = +[NSMutableArray arrayWithCapacity:a3];
    array = v4->_array;
    v4->_array = (NSMutableArray *)v6;
  }
  return v4;
}

- (void)push:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MapsRingBuffer *)self length];
  uint64_t v6 = sub_100077568();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      int v11 = 134218499;
      __int16 v12 = self;
      __int16 v13 = 2113;
      unint64_t v14 = (unint64_t)v4;
      __int16 v15 = 2048;
      unint64_t v16 = [(MapsRingBuffer *)self position];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%p] Pushing object %{private}@ at position %lu", (uint8_t *)&v11, 0x20u);
    }

    v8 = [(MapsRingBuffer *)self array];
    [v8 setObject:v4 atIndexedSubscript:[self position]];

    [(MapsRingBuffer *)self setPosition:([(MapsRingBuffer *)self position] + 1) % [(MapsRingBuffer *)self length]];
    objc_super v9 = sub_100077568();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v10 = [(MapsRingBuffer *)self position];
      int v11 = 134218240;
      __int16 v12 = self;
      __int16 v13 = 2048;
      unint64_t v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%p] Updated position: %lu", (uint8_t *)&v11, 0x16u);
    }

    [(MapsRingBuffer *)self setMutation:(char *)[(MapsRingBuffer *)self mutation] + 1];
  }
  else
  {
    if (v7)
    {
      int v11 = 134218243;
      __int16 v12 = self;
      __int16 v13 = 2113;
      unint64_t v14 = (unint64_t)v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%p] Length is 0; ignoring push of object %{private}@",
        (uint8_t *)&v11,
        0x16u);
    }
  }
}

- (void)removeAllObjects
{
  v3 = sub_100077568();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Removing all objects", v5, 2u);
  }

  id v4 = [(MapsRingBuffer *)self array];
  [v4 removeAllObjects];

  [(MapsRingBuffer *)self setPosition:0];
  [(MapsRingBuffer *)self setMutation:(char *)[(MapsRingBuffer *)self mutation] + 1];
}

- (unint64_t)count
{
  v2 = [(MapsRingBuffer *)self array];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (id)firstObject
{
  if ([(MapsRingBuffer *)self count])
  {
    unint64_t v3 = [(MapsRingBuffer *)self count];
    unint64_t v4 = [(MapsRingBuffer *)self length];
    unint64_t v5 = [(MapsRingBuffer *)self array];
    if (v3 >= v4) {
      unint64_t v6 = [(MapsRingBuffer *)self position];
    }
    else {
      unint64_t v6 = 0;
    }
    BOOL v7 = [v5 objectAtIndexedSubscript:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)lastObject
{
  if ([(MapsRingBuffer *)self count])
  {
    unint64_t v3 = [(MapsRingBuffer *)self position];
    unint64_t v4 = [(MapsRingBuffer *)self array];
    if (v3) {
      unint64_t v5 = [(MapsRingBuffer *)self position];
    }
    else {
      unint64_t v5 = [(MapsRingBuffer *)self count];
    }
    unint64_t v6 = [v4 objectAtIndexedSubscript:v5 - 1];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)debugDescription
{
  unint64_t v3 = (objc_class *)objc_opt_class();
  unint64_t v4 = NSStringFromClass(v3);
  unint64_t v5 = [(MapsRingBuffer *)self _orderedObjects];
  unint64_t v6 = +[NSString stringWithFormat:@"<%@: %p\norderedObjects:%@\nlength:%lu\ncount:%lu>", v4, self, v5, [(MapsRingBuffer *)self length], [(MapsRingBuffer *)self count]];

  return v6;
}

- (id)_orderedObjects
{
  unint64_t v3 = +[NSMutableArray array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v4 = self;
  id v5 = [(MapsRingBuffer *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i) v10];
      }
      id v6 = [(MapsRingBuffer *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t result = [(MapsRingBuffer *)self count];
  if (result)
  {
    if (a3->var0)
    {
      if (a3->var3[3] == 1 && a3->var3[0] == a3->var3[1]) {
        return 0;
      }
    }
    else
    {
      unint64_t v9 = [(MapsRingBuffer *)self count];
      if (v9 >= [(MapsRingBuffer *)self length]) {
        unint64_t v10 = [(MapsRingBuffer *)self position];
      }
      else {
        unint64_t v10 = 0;
      }
      a3->var3[0] = v10;
      a3->var3[1] = v10;
      unint64_t v11 = [(MapsRingBuffer *)self count];
      if (v11 >= [(MapsRingBuffer *)self length]) {
        unint64_t v12 = [(MapsRingBuffer *)self length];
      }
      else {
        unint64_t v12 = [(MapsRingBuffer *)self count];
      }
      a3->var3[2] = v12;
      a3->var3[3] = 0;
      a3->var2 = &self->_mutation;
      a3->var0 = 1;
    }
    long long v13 = [(MapsRingBuffer *)self array];
    *a4 = [v13 objectAtIndexedSubscript:a3->var3[0]];

    a3->var1 = a4;
    unint64_t v14 = a3->var3[0] + 1;
    a3->var3[0] = v14;
    if (v14 == a3->var3[2])
    {
      a3->var3[0] = 0;
      unint64_t result = 1;
      a3->var3[3] = 1;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (NSMutableArray)array
{
  return self->_array;
}

- (void)setArray:(id)a3
{
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (unint64_t)mutation
{
  return self->_mutation;
}

- (void)setMutation:(unint64_t)a3
{
  self->_mutation = a3;
}

- (void).cxx_destruct
{
}

@end