@interface TSUDispatchData
- (BOOL)alwaysDefragmentData;
- (OS_dispatch_data)data;
- (OS_dispatch_data)defragmentedData;
- (OS_dispatch_data)fragmentedData;
- (TSUDispatchData)init;
- (TSUDispatchData)initWithData:(id)a3;
- (unint64_t)fragmentsCount;
- (unint64_t)maxFragmentsCount;
- (unint64_t)size;
- (void)append:(id)a3;
- (void)defragmentData;
- (void)setAlwaysDefragmentData:(BOOL)a3;
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
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    data2 = v4;
    size_t size = dispatch_data_get_size(v4);
    v5 = data2;
    if (size)
    {
      size_t v7 = size;
      concat = (OS_dispatch_data *)dispatch_data_create_concat((dispatch_data_t)self->_fragmentedData, data2);
      fragmentedData = self->_fragmentedData;
      self->_fragmentedData = concat;

      unint64_t maxFragmentsCount = self->_maxFragmentsCount;
      self->_size += v7;
      unint64_t v11 = self->_fragmentsCount + 1;
      self->_fragmentsCount = v11;
      if (v11 >= maxFragmentsCount)
      {
        [(TSUDispatchData *)self defragmentData];
        v13 = self->_defragmentedData;
        data = self->_data;
        self->_data = v13;
      }
      else
      {
        data = self->_data;
        self->_data = 0;
      }

      v5 = data2;
    }
  }
}

- (void)defragmentData
{
  p_fragmentedData = &self->_fragmentedData;
  fragmentedData = self->_fragmentedData;
  if (p_fragmentedData[2])
  {
    data2 = dispatch_data_create_map(fragmentedData, 0, 0);
    objc_storeStrong((id *)p_fragmentedData, MEMORY[0x263EF8388]);
    self->_fragmentsCount = 0;
  }
  else
  {
    data2 = fragmentedData;
  }
  defragmentedData = self->_defragmentedData;
  if (defragmentedData) {
    concat = (OS_dispatch_data *)dispatch_data_create_concat(defragmentedData, data2);
  }
  else {
    concat = data2;
  }
  size_t v7 = self->_defragmentedData;
  self->_defragmentedData = concat;
}

- (OS_dispatch_data)data
{
  if (!self->_data)
  {
    if (self->_alwaysDefragmentData)
    {
      [(TSUDispatchData *)self defragmentData];
      concat = self->_defragmentedData;
    }
    else
    {
      fragmentedData = self->_fragmentedData;
      defragmentedData = self->_defragmentedData;
      if (defragmentedData) {
        concat = (OS_dispatch_data *)dispatch_data_create_concat(defragmentedData, fragmentedData);
      }
      else {
        concat = fragmentedData;
      }
    }
    data = self->_data;
    self->_data = concat;
  }
  size_t v7 = self->_data;
  return v7;
}

- (BOOL)alwaysDefragmentData
{
  return self->_alwaysDefragmentData;
}

- (void)setAlwaysDefragmentData:(BOOL)a3
{
  self->_alwaysDefragmentData = a3;
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