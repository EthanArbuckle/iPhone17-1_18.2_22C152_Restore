@interface SRMemoryMapping
+ (void)initialize;
- (void)dealloc;
@end

@implementation SRMemoryMapping

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EC80 = (uint64_t)os_log_create("com.apple.SensorKit", "SRMemoryMapping");
  }
}

- (void)dealloc
{
  if (self)
  {
    mappedAddress = self->_mappedAddress;
    if ((unint64_t)mappedAddress + 1 >= 2)
    {
      v4 = qword_10006EC80;
      if (os_log_type_enabled((os_log_t)qword_10006EC80, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v11 = mappedAddress;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Unmapping %{public}p", buf, 0xCu);
      }
      size_t pageAlignedSize = self->_pageAlignedSize;
      if (munmap(mappedAddress, pageAlignedSize))
      {
        v6 = qword_10006EC80;
        if (os_log_type_enabled((os_log_t)qword_10006EC80, OS_LOG_TYPE_INFO))
        {
          int v7 = *__error();
          *(_DWORD *)buf = 134349568;
          v11 = mappedAddress;
          __int16 v12 = 2048;
          size_t v13 = pageAlignedSize;
          __int16 v14 = 1026;
          int v15 = v7;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Unable to unmap %{public}p size %zu because %{public, darwin.errno}d", buf, 0x1Cu);
          v6 = qword_10006EC80;
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          int v8 = *__error();
          *(_DWORD *)buf = 134349568;
          v11 = mappedAddress;
          __int16 v12 = 2048;
          size_t v13 = pageAlignedSize;
          __int16 v14 = 1026;
          int v15 = v8;
          _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Unable to unmap %{public}p size %zu because %{public, darwin.errno}d", buf, 0x1Cu);
        }
        abort();
      }
      self->_mappedAddress = 0;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)SRMemoryMapping;
  [(SRMemoryMapping *)&v9 dealloc];
}

@end