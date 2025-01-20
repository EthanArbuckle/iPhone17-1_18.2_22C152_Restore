@interface _UIKeyboardHIDEventOrderedDescriptorSet
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)events;
- (void)_eventsByDescriptor;
- (void)_orderedDescriptors;
- (void)addEvent:(void *)a1;
- (void)removeAllEvents;
- (void)removeEvent:(void *)a1;
@end

@implementation _UIKeyboardHIDEventOrderedDescriptorSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsByDescriptor, 0);
  objc_storeStrong((id *)&self->_orderedDescriptors, 0);
}

- (void)removeAllEvents
{
  if (a1)
  {
    v2 = -[_UIKeyboardHIDEventOrderedDescriptorSet _orderedDescriptors](a1);
    [v2 removeAllObjects];

    -[_UIKeyboardHIDEventOrderedDescriptorSet _eventsByDescriptor](a1);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v3 removeAllObjects];
  }
}

- (id)events
{
  v1 = a1;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ([a1[2] count])
    {
      v2 = objc_opt_new();
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v3 = -[_UIKeyboardHIDEventOrderedDescriptorSet _orderedDescriptors](v1);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v13 != v6) {
              objc_enumerationMutation(v3);
            }
            uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
            v9 = -[_UIKeyboardHIDEventOrderedDescriptorSet _eventsByDescriptor](v1);
            uint64_t v10 = objc_msgSend(v9, "objectForKey:", v8, (void)v12);

            if (v10) {
              [v2 addObject:v10];
            }
          }
          uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v5);
      }

      v1 = (id *)[v2 copy];
    }
    else
    {
      v1 = (id *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[_UIKeyboardHIDEventOrderedDescriptorSet allocWithZone:a3] init];
  if (v4)
  {
    uint64_t v5 = [(NSMutableOrderedSet *)self->_orderedDescriptors mutableCopy];
    orderedDescriptors = v4->_orderedDescriptors;
    v4->_orderedDescriptors = (NSMutableOrderedSet *)v5;

    uint64_t v7 = [(NSMutableDictionary *)self->_eventsByDescriptor mutableCopy];
    eventsByDescriptor = v4->_eventsByDescriptor;
    v4->_eventsByDescriptor = (NSMutableDictionary *)v7;
  }
  return v4;
}

- (void)_orderedDescriptors
{
  if (a1)
  {
    v2 = a1;
    id v3 = (void *)a1[1];
    if (!v3)
    {
      uint64_t v4 = objc_opt_new();
      uint64_t v5 = (void *)v2[1];
      v2[1] = v4;

      id v3 = (void *)v2[1];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_eventsByDescriptor
{
  if (a1)
  {
    v2 = a1;
    id v3 = (void *)a1[2];
    if (!v3)
    {
      uint64_t v4 = objc_opt_new();
      uint64_t v5 = (void *)v2[2];
      v2[2] = v4;

      id v3 = (void *)v2[2];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addEvent:(void *)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (IOHIDEventGetType() == 3)
    {
      uint64_t v4 = +[_UIKeyboardHIDEventDescriptor descriptorWithEvent:a2];
      if (v4)
      {
        id v9 = v4;
        uint64_t v5 = -[_UIKeyboardHIDEventOrderedDescriptorSet _orderedDescriptors](a1);
        [v5 addObject:v9];

        uint64_t v6 = -[_UIKeyboardHIDEventOrderedDescriptorSet _eventsByDescriptor](a1);
        [v6 setObject:a2 forKey:v9];

        uint64_t v4 = v9;
      }
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        uint64_t v8 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v11 = objc_opt_class();
          __int16 v12 = 2112;
          uint64_t v13 = a2;
          _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Invalid HID event type added to %@: %@", buf, 0x16u);
        }
      }
      else
      {
        uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &addEvent____s_category) + 8);
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          return;
        }
        uint64_t v8 = v7;
        *(_DWORD *)buf = 138412546;
        uint64_t v11 = objc_opt_class();
        __int16 v12 = 2112;
        uint64_t v13 = a2;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Invalid HID event type added to %@: %@", buf, 0x16u);
      }
    }
  }
}

- (void)removeEvent:(void *)a1
{
  if (a1)
  {
    id v3 = +[_UIKeyboardHIDEventDescriptor descriptorWithEvent:a2];
    if (v3)
    {
      uint64_t v6 = v3;
      uint64_t v4 = -[_UIKeyboardHIDEventOrderedDescriptorSet _orderedDescriptors](a1);
      [v4 removeObject:v6];

      uint64_t v5 = -[_UIKeyboardHIDEventOrderedDescriptorSet _eventsByDescriptor](a1);
      [v5 removeObjectForKey:v6];

      id v3 = v6;
    }
  }
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; orderedDescriptors.count: %lu; eventsByDescriptor.count: %lu>",
               objc_opt_class(),
               self,
               [(NSMutableOrderedSet *)self->_orderedDescriptors count],
               [(NSMutableDictionary *)self->_eventsByDescriptor count]);
}

@end