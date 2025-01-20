@interface TSUDispatchData
- (OS_dispatch_data)data;
- (OS_dispatch_data)defragmentedData;
- (OS_dispatch_data)fragmentedData;
- (TSUDispatchData)init;
- (TSUDispatchData)initWithData:(id)a3;
- (unint64_t)fragmentsCount;
- (unint64_t)maxFragmentsCount;
- (unint64_t)size;
- (void)append:(id)a3;
- (void)setMaxFragmentsCount:(unint64_t)a3;
@end

@implementation TSUDispatchData

- (TSUDispatchData)init
{
  return [(TSUDispatchData *)self initWithData:MEMORY[0x263EF8388]];
}

- (TSUDispatchData)initWithData:(id)a3
{
  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)TSUDispatchData;
    v6 = [(TSUDispatchData *)&v10 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_data, a3);
      v7->_size = dispatch_data_get_size(v5);
      objc_storeStrong((id *)&v7->_fragmentedData, a3);
      v7->_fragmentsCount = v7->_size != 0;
      v7->_maxFragmentsCount = 1000;
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)append:(id)a3
{
  size = a3;
  v5 = size;
  if (size)
  {
    data2 = size;
    size = dispatch_data_get_size(size);
    v5 = data2;
    if (size)
    {
      v6 = size;
      concat = (OS_dispatch_data *)dispatch_data_create_concat((dispatch_data_t)self->_fragmentedData, data2);
      fragmentedData = self->_fragmentedData;
      self->_fragmentedData = concat;

      unint64_t maxFragmentsCount = self->_maxFragmentsCount;
      self->_size += (unint64_t)v6;
      unint64_t v10 = self->_fragmentsCount + 1;
      self->_fragmentsCount = v10;
      if (v10 >= maxFragmentsCount)
      {
        map = dispatch_data_create_map((dispatch_data_t)self->_fragmentedData, 0, 0);
        objc_storeStrong((id *)&self->_fragmentedData, MEMORY[0x263EF8388]);
        self->_fragmentsCount = 0;
        defragmentedData = self->_defragmentedData;
        if (defragmentedData) {
          v13 = (OS_dispatch_data *)dispatch_data_create_concat(defragmentedData, map);
        }
        else {
          v13 = map;
        }
        v14 = self->_defragmentedData;
        self->_defragmentedData = v13;

        objc_storeStrong((id *)&self->_data, self->_defragmentedData);
      }
      else
      {
        map = self->_data;
        self->_data = 0;
      }

      v5 = data2;
    }
  }
  MEMORY[0x270F9A758](size, v5);
}

- (OS_dispatch_data)data
{
  if (!self->_data)
  {
    fragmentedData = self->_fragmentedData;
    defragmentedData = self->_defragmentedData;
    if (defragmentedData) {
      concat = (OS_dispatch_data *)dispatch_data_create_concat(defragmentedData, fragmentedData);
    }
    else {
      concat = fragmentedData;
    }
    data = self->_data;
    self->_data = concat;
  }
  v7 = self->_data;
  return v7;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)maxFragmentsCount
{
  return self->_maxFragmentsCount;
}

- (void)setMaxFragmentsCount:(unint64_t)a3
{
  self->_unint64_t maxFragmentsCount = a3;
}

- (OS_dispatch_data)fragmentedData
{
  return self->_fragmentedData;
}

- (OS_dispatch_data)defragmentedData
{
  return self->_defragmentedData;
}

- (unint64_t)fragmentsCount
{
  return self->_fragmentsCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defragmentedData, 0);
  objc_storeStrong((id *)&self->_fragmentedData, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end