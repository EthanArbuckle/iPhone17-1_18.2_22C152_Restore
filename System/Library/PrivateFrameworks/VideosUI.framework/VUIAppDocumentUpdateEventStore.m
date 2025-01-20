@interface VUIAppDocumentUpdateEventStore
- (NSArray)events;
- (NSMutableDictionary)eventByEventDescriptor;
- (VUIAppDocumentUpdateEventStore)init;
- (id)description;
- (void)addEvent:(id)a3;
- (void)addEvents:(id)a3;
- (void)removeAllEvents;
- (void)removeEvent:(id)a3;
- (void)setEventByEventDescriptor:(id)a3;
@end

@implementation VUIAppDocumentUpdateEventStore

- (NSArray)events
{
  v2 = [(VUIAppDocumentUpdateEventStore *)self eventByEventDescriptor];
  v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (NSMutableDictionary)eventByEventDescriptor
{
  return self->_eventByEventDescriptor;
}

- (VUIAppDocumentUpdateEventStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)VUIAppDocumentUpdateEventStore;
  v2 = [(VUIAppDocumentUpdateEventStore *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    eventByEventDescriptor = v2->_eventByEventDescriptor;
    v2->_eventByEventDescriptor = v3;
  }
  return v2;
}

- (void)addEvent:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  objc_super v6 = [v4 arrayWithObjects:&v7 count:1];

  -[VUIAppDocumentUpdateEventStore addEvents:](self, "addEvents:", v6, v7, v8);
}

- (void)addEvents:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(VUIAppDocumentUpdateEventStore *)self eventByEventDescriptor];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "descriptor", (void)v17);
        v13 = [v5 objectForKey:v12];
        v14 = v13;
        if (v13)
        {
          id v15 = [v13 coalescedEvent:v11];
        }
        else
        {
          id v15 = v11;
        }
        v16 = v15;
        objc_msgSend(v5, "vui_setOrRemoveObject:forKey:", v15, v12);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

- (void)removeEvent:(id)a3
{
  id v4 = a3;
  id v6 = [(VUIAppDocumentUpdateEventStore *)self eventByEventDescriptor];
  id v5 = [v4 descriptor];

  [v6 removeObjectForKey:v5];
}

- (void)removeAllEvents
{
  id v2 = [(VUIAppDocumentUpdateEventStore *)self eventByEventDescriptor];
  [v2 removeAllObjects];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12.receiver = self;
  v12.super_class = (Class)VUIAppDocumentUpdateEventStore;
  id v4 = [(VUIAppDocumentUpdateEventStore *)&v12 description];
  [v3 addObject:v4];

  id v5 = NSString;
  id v6 = [(VUIAppDocumentUpdateEventStore *)self eventByEventDescriptor];
  uint64_t v7 = [v5 stringWithFormat:@"%@=%@", @"eventByEventDescriptor", v6];
  [v3 addObject:v7];

  uint64_t v8 = NSString;
  uint64_t v9 = [v3 componentsJoinedByString:@", "];
  v10 = [v8 stringWithFormat:@"<%@>", v9];

  return v10;
}

- (void)setEventByEventDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end