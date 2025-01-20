@interface SidecarMutableItem
- (BOOL)appendData:(id)a3;
- (BOOL)isComplete;
- (SidecarMutableItem)initWithType:(id)a3 capacity:(unint64_t)a4;
- (id)data;
@end

@implementation SidecarMutableItem

- (void).cxx_destruct
{
}

- (BOOL)isComplete
{
  return *((unsigned char *)self + 40) & 1;
}

- (BOOL)appendData:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [v4 length];
  unint64_t capacity = self->_capacity;
  unint64_t v7 = capacity - [(NSMutableData *)self->_mutableData length];
  if (v5 > v7)
  {
    v13 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    v10 = v13;
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = [(SidecarItem *)self type];
      unint64_t v16 = v7;
      uint64_t v17 = [v4 length];
      NSUInteger v18 = [(NSMutableData *)self->_mutableData length];
      unint64_t v19 = self->_capacity;
      int v20 = 138544130;
      v21 = v15;
      __int16 v22 = 2048;
      unint64_t v23 = v17;
      unint64_t v7 = v16;
      __int16 v24 = 2048;
      NSUInteger v25 = v18;
      __int16 v26 = 2048;
      unint64_t v27 = v19;
      _os_log_impl(&dword_22D954000, v10, OS_LOG_TYPE_ERROR, "item exceeded capacity: %{public}@ (%lu + %lu > %lu)", (uint8_t *)&v20, 0x2Au);
    }
  }
  else
  {
    [(NSMutableData *)self->_mutableData appendData:v4];
    BOOL v8 = [(NSMutableData *)self->_mutableData length] == self->_capacity;
    *((unsigned char *)self + 40) = *((unsigned char *)self + 40) & 0xFE | v8;
    if (!v8) {
      goto LABEL_9;
    }
    v9 = SidecarCoreLogSubsystem(OS_LOG_TYPE_INFO);
    v10 = v9;
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = [(SidecarItem *)self type];
      unint64_t v12 = self->_capacity;
      int v20 = 138543618;
      v21 = v11;
      __int16 v22 = 2048;
      unint64_t v23 = v12;
      _os_log_impl(&dword_22D954000, v10, OS_LOG_TYPE_INFO, "item complete: %{public}@ (%lu bytes)", (uint8_t *)&v20, 0x16u);
    }
  }

LABEL_9:
  return v5 <= v7;
}

- (id)data
{
  if ([(NSMutableData *)self->_mutableData length] == self->_capacity) {
    mutableData = self->_mutableData;
  }
  else {
    mutableData = 0;
  }

  return mutableData;
}

- (SidecarMutableItem)initWithType:(id)a3 capacity:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SidecarMutableItem;
  unint64_t v5 = [(SidecarItem *)&v10 initWithData:0 type:a3];
  v6 = v5;
  if (v5)
  {
    v5->_unint64_t capacity = a4;
    uint64_t v7 = [objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:a4];
    mutableData = v6->_mutableData;
    v6->_mutableData = (NSMutableData *)v7;
  }
  return v6;
}

@end