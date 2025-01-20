@interface VUIAppDocumentModifiedUpNextEvent
- (BOOL)isEqual:(id)a3;
- (NSSet)addedCanonicalIDs;
- (NSSet)removedCanonicalIDs;
- (VUIAppDocumentModifiedUpNextEvent)initWithAction:(unint64_t)a3 canonicalID:(id)a4;
- (VUIAppDocumentModifiedUpNextEvent)initWithAddedCanonicalIDs:(id)a3 removedCanonicalIDs:(id)a4;
- (VUIAppDocumentModifiedUpNextEvent)initWithDescriptor:(id)a3;
- (id)coalescedEvent:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setAddedCanonicalIDs:(id)a3;
- (void)setRemovedCanonicalIDs:(id)a3;
@end

@implementation VUIAppDocumentModifiedUpNextEvent

- (VUIAppDocumentModifiedUpNextEvent)initWithDescriptor:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The %@ initializer is not available.", v6 format];

  return 0;
}

- (VUIAppDocumentModifiedUpNextEvent)initWithAddedCanonicalIDs:(id)a3 removedCanonicalIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] || objc_msgSend(v7, "count"))
  {
    v8 = +[VUIAppDocumentUpdateEventDescriptor upNext];
    v16.receiver = self;
    v16.super_class = (Class)VUIAppDocumentModifiedUpNextEvent;
    v9 = [(VUIAppDocumentUpdateEvent *)&v16 initWithDescriptor:v8];

    if (v9)
    {
      uint64_t v10 = [v6 copy];
      addedCanonicalIDs = v9->_addedCanonicalIDs;
      v9->_addedCanonicalIDs = (NSSet *)v10;

      uint64_t v12 = [v7 copy];
      removedCanonicalIDs = v9->_removedCanonicalIDs;
      v9->_removedCanonicalIDs = (NSSet *)v12;
    }
    self = v9;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (VUIAppDocumentModifiedUpNextEvent)initWithAction:(unint64_t)a3 canonicalID:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v6, 0);
    id v7 = [MEMORY[0x1E4F1CAD0] set];
  }
  else if (a3)
  {
    id v7 = 0;
    v8 = 0;
  }
  else
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v6, 0);
    v8 = [MEMORY[0x1E4F1CAD0] set];
  }
  v9 = [(VUIAppDocumentModifiedUpNextEvent *)self initWithAddedCanonicalIDs:v7 removedCanonicalIDs:v8];

  return v9;
}

- (id)dictionaryRepresentation
{
  v11.receiver = self;
  v11.super_class = (Class)VUIAppDocumentModifiedUpNextEvent;
  v3 = [(VUIAppDocumentUpdateEvent *)&v11 dictionaryRepresentation];
  v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(VUIAppDocumentModifiedUpNextEvent *)self addedCanonicalIDs];
  if ([v5 count])
  {
    id v6 = [v5 allObjects];
    [v4 setObject:v6 forKey:@"added"];
  }
  id v7 = [(VUIAppDocumentModifiedUpNextEvent *)self removedCanonicalIDs];
  if ([v7 count])
  {
    v8 = [v7 allObjects];
    [v4 setObject:v8 forKey:@"removed"];
  }
  v9 = (void *)[v4 copy];

  return v9;
}

- (id)coalescedEvent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(VUIAppDocumentModifiedUpNextEvent *)self addedCanonicalIDs];
    id v7 = (void *)[v6 mutableCopy];

    v8 = [v5 addedCanonicalIDs];
    [v7 unionSet:v8];

    v9 = [(VUIAppDocumentModifiedUpNextEvent *)self removedCanonicalIDs];
    uint64_t v10 = (void *)[v9 mutableCopy];

    objc_super v11 = [v5 removedCanonicalIDs];

    [v10 unionSet:v11];
    uint64_t v12 = (void *)[v7 mutableCopy];
    [v12 minusSet:v10];
    v13 = (void *)[v10 mutableCopy];
    [v13 minusSet:v7];
    v14 = [[VUIAppDocumentModifiedUpNextEvent alloc] initWithAddedCanonicalIDs:v12 removedCanonicalIDs:v13];
  }
  else
  {
    v15 = VUIDefaultLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      [(VUIAppDocumentModifiedFavoritesEvent *)self coalescedEvent:v15];
    }

    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)VUIAppDocumentModifiedUpNextEvent;
  unint64_t v3 = [(VUIAppDocumentUpdateEvent *)&v9 hash];
  id v4 = [(VUIAppDocumentModifiedUpNextEvent *)self addedCanonicalIDs];
  uint64_t v5 = [v4 hash];

  id v6 = [(VUIAppDocumentModifiedUpNextEvent *)self removedCanonicalIDs];
  unint64_t v7 = v5 ^ [v6 hash] ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VUIAppDocumentModifiedUpNextEvent *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        v18.receiver = self;
        v18.super_class = (Class)VUIAppDocumentModifiedUpNextEvent;
        if (![(VUIAppDocumentUpdateEvent *)&v18 isEqual:v6])
        {
LABEL_9:
          char v12 = 0;
LABEL_19:

          goto LABEL_20;
        }
        unint64_t v7 = [(VUIAppDocumentModifiedUpNextEvent *)self addedCanonicalIDs];
        v8 = [(VUIAppDocumentModifiedUpNextEvent *)v6 addedCanonicalIDs];
        id v9 = v7;
        id v10 = v8;
        if (v9 == v10)
        {
        }
        else
        {
          objc_super v11 = v10;
          char v12 = 0;
          if (!v9 || !v10)
          {
LABEL_18:

            goto LABEL_19;
          }
          char v13 = [v9 isEqual:v10];

          if ((v13 & 1) == 0) {
            goto LABEL_9;
          }
        }
        v14 = [(VUIAppDocumentModifiedUpNextEvent *)self removedCanonicalIDs];
        v15 = [(VUIAppDocumentModifiedUpNextEvent *)v6 removedCanonicalIDs];
        id v9 = v14;
        id v16 = v15;
        objc_super v11 = v16;
        if (v9 == v16)
        {
          char v12 = 1;
        }
        else
        {
          char v12 = 0;
          if (v9 && v16) {
            char v12 = [v9 isEqual:v16];
          }
        }
        goto LABEL_18;
      }
    }
    char v12 = 0;
  }
LABEL_20:

  return v12;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15.receiver = self;
  v15.super_class = (Class)VUIAppDocumentModifiedUpNextEvent;
  id v4 = [(VUIAppDocumentUpdateEvent *)&v15 description];
  [v3 addObject:v4];

  uint64_t v5 = NSString;
  id v6 = [(VUIAppDocumentModifiedUpNextEvent *)self addedCanonicalIDs];
  unint64_t v7 = [v5 stringWithFormat:@"%@=%@", @"addedCanonicalIDs", v6];
  [v3 addObject:v7];

  v8 = NSString;
  id v9 = [(VUIAppDocumentModifiedUpNextEvent *)self removedCanonicalIDs];
  id v10 = [v8 stringWithFormat:@"%@=%@", @"removedCanonicalIDs", v9];
  [v3 addObject:v10];

  objc_super v11 = NSString;
  char v12 = [v3 componentsJoinedByString:@", "];
  char v13 = [v11 stringWithFormat:@"<%@>", v12];

  return v13;
}

- (NSSet)addedCanonicalIDs
{
  return self->_addedCanonicalIDs;
}

- (void)setAddedCanonicalIDs:(id)a3
{
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
  objc_storeStrong((id *)&self->_removedCanonicalIDs, 0);
  objc_storeStrong((id *)&self->_addedCanonicalIDs, 0);
}

@end