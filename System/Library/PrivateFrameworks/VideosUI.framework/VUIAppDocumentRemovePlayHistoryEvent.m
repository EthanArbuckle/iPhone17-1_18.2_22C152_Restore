@interface VUIAppDocumentRemovePlayHistoryEvent
- (BOOL)isEqual:(id)a3;
- (NSSet)removedCanonicalIDs;
- (VUIAppDocumentRemovePlayHistoryEvent)initWithDescriptor:(id)a3;
- (VUIAppDocumentRemovePlayHistoryEvent)initWithRemovedCanonicalIDs:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setRemovedCanonicalIDs:(id)a3;
@end

@implementation VUIAppDocumentRemovePlayHistoryEvent

- (VUIAppDocumentRemovePlayHistoryEvent)initWithDescriptor:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The %@ initializer is not available.", v6 format];

  return 0;
}

- (VUIAppDocumentRemovePlayHistoryEvent)initWithRemovedCanonicalIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = +[VUIAppDocumentUpdateEventDescriptor removeFromPlayHistory];
    v11.receiver = self;
    v11.super_class = (Class)VUIAppDocumentRemovePlayHistoryEvent;
    v6 = [(VUIAppDocumentUpdateEvent *)&v11 initWithDescriptor:v5];

    if (v6)
    {
      uint64_t v7 = [v4 copy];
      removedCanonicalIDs = v6->_removedCanonicalIDs;
      v6->_removedCanonicalIDs = (NSSet *)v7;
    }
    self = v6;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  v9.receiver = self;
  v9.super_class = (Class)VUIAppDocumentRemovePlayHistoryEvent;
  v3 = [(VUIAppDocumentUpdateEvent *)&v9 dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(VUIAppDocumentRemovePlayHistoryEvent *)self removedCanonicalIDs];
  if ([v5 count])
  {
    v6 = [v5 allObjects];
    [v4 setObject:v6 forKey:@"removed"];
  }
  uint64_t v7 = (void *)[v4 copy];

  return v7;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)VUIAppDocumentRemovePlayHistoryEvent;
  unint64_t v3 = [(VUIAppDocumentUpdateEvent *)&v7 hash];
  id v4 = [(VUIAppDocumentRemovePlayHistoryEvent *)self removedCanonicalIDs];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VUIAppDocumentRemovePlayHistoryEvent *)a3;
  unint64_t v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v14.receiver = self;
    v14.super_class = (Class)VUIAppDocumentRemovePlayHistoryEvent;
    if ([(VUIAppDocumentUpdateEvent *)&v14 isEqual:v6])
    {
      objc_super v7 = [(VUIAppDocumentRemovePlayHistoryEvent *)self removedCanonicalIDs];
      v8 = [(VUIAppDocumentRemovePlayHistoryEvent *)v6 removedCanonicalIDs];
      id v9 = v7;
      id v10 = v8;
      objc_super v11 = v10;
      if (v9 == v10)
      {
        char v12 = 1;
      }
      else
      {
        char v12 = 0;
        if (v9 && v10) {
          char v12 = [v9 isEqual:v10];
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12.receiver = self;
  v12.super_class = (Class)VUIAppDocumentRemovePlayHistoryEvent;
  id v4 = [(VUIAppDocumentUpdateEvent *)&v12 description];
  [v3 addObject:v4];

  unint64_t v5 = NSString;
  v6 = [(VUIAppDocumentRemovePlayHistoryEvent *)self removedCanonicalIDs];
  objc_super v7 = [v5 stringWithFormat:@"%@=%@", @"removedCanonicalIDs", v6];
  [v3 addObject:v7];

  v8 = NSString;
  id v9 = [v3 componentsJoinedByString:@", "];
  id v10 = [v8 stringWithFormat:@"<%@>", v9];

  return v10;
}

- (NSSet)removedCanonicalIDs
{
  return self->_removedCanonicalIDs;
}

- (void)setRemovedCanonicalIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end