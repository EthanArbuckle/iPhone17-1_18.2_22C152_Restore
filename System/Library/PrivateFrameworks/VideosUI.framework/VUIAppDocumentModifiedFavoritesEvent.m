@interface VUIAppDocumentModifiedFavoritesEvent
- (BOOL)isBackground;
- (BOOL)isEqual:(id)a3;
- (NSSet)addedEntityIDs;
- (NSSet)removedEntityIDs;
- (VUIAppDocumentModifiedFavoritesEvent)initWithAction:(unint64_t)a3 entityID:(id)a4 isBackground:(BOOL)a5;
- (VUIAppDocumentModifiedFavoritesEvent)initWithAddedEntityIDs:(id)a3 removedEntityIDs:(id)a4 isBackground:(BOOL)a5;
- (VUIAppDocumentModifiedFavoritesEvent)initWithDescriptor:(id)a3;
- (id)coalescedEvent:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setAddedEntityIDs:(id)a3;
- (void)setIsBackground:(BOOL)a3;
- (void)setRemovedEntityIDs:(id)a3;
@end

@implementation VUIAppDocumentModifiedFavoritesEvent

- (VUIAppDocumentModifiedFavoritesEvent)initWithDescriptor:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The %@ initializer is not available.", v6 format];

  return 0;
}

- (VUIAppDocumentModifiedFavoritesEvent)initWithAddedEntityIDs:(id)a3 removedEntityIDs:(id)a4 isBackground:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v5) {
    +[VUIAppDocumentUpdateEventDescriptor favoritesInBackground];
  }
  else {
  v10 = +[VUIAppDocumentUpdateEventDescriptor favorites];
  }
  v17.receiver = self;
  v17.super_class = (Class)VUIAppDocumentModifiedFavoritesEvent;
  v11 = [(VUIAppDocumentUpdateEvent *)&v17 initWithDescriptor:v10];

  if (v11)
  {
    uint64_t v12 = [v8 copy];
    addedEntityIDs = v11->_addedEntityIDs;
    v11->_addedEntityIDs = (NSSet *)v12;

    uint64_t v14 = [v9 copy];
    removedEntityIDs = v11->_removedEntityIDs;
    v11->_removedEntityIDs = (NSSet *)v14;

    v11->_isBackground = v5;
  }

  return v11;
}

- (VUIAppDocumentModifiedFavoritesEvent)initWithAction:(unint64_t)a3 entityID:(id)a4 isBackground:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  if (a3 == 2)
  {
    id v9 = [MEMORY[0x1E4F1CAD0] set];
    v10 = (void *)MEMORY[0x1E4F1CAD0];
  }
  else
  {
    if (a3 == 1)
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v8, 0);
      id v9 = [MEMORY[0x1E4F1CAD0] set];
      goto LABEL_9;
    }
    if (a3)
    {
      id v9 = 0;
      v11 = 0;
      goto LABEL_9;
    }
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v8, 0);
    v10 = (void *)MEMORY[0x1E4F1CAD0];
  }
  v11 = [v10 set];
LABEL_9:
  uint64_t v12 = [(VUIAppDocumentModifiedFavoritesEvent *)self initWithAddedEntityIDs:v9 removedEntityIDs:v11 isBackground:v5];

  return v12;
}

- (id)dictionaryRepresentation
{
  v11.receiver = self;
  v11.super_class = (Class)VUIAppDocumentModifiedFavoritesEvent;
  v3 = [(VUIAppDocumentUpdateEvent *)&v11 dictionaryRepresentation];
  v4 = (void *)[v3 mutableCopy];

  BOOL v5 = [(VUIAppDocumentModifiedFavoritesEvent *)self addedEntityIDs];
  if ([v5 count])
  {
    v6 = [v5 allObjects];
    [v4 setObject:v6 forKey:@"added"];
  }
  v7 = [(VUIAppDocumentModifiedFavoritesEvent *)self removedEntityIDs];
  if ([v7 count])
  {
    id v8 = [v7 allObjects];
    [v4 setObject:v8 forKey:@"removed"];
  }
  id v9 = (void *)[v4 copy];

  return v9;
}

- (id)coalescedEvent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  BOOL v5 = [(VUIAppDocumentUpdateEvent *)self descriptor];
  uint64_t v6 = [v5 type];
  v7 = [v4 descriptor];
  uint64_t v8 = [v7 type];

  if (v6 == v8)
  {
    id v9 = v4;
    v10 = [(VUIAppDocumentModifiedFavoritesEvent *)self addedEntityIDs];
    objc_super v11 = (void *)[v10 mutableCopy];

    uint64_t v12 = [v9 addedEntityIDs];
    [v11 unionSet:v12];

    v13 = [(VUIAppDocumentModifiedFavoritesEvent *)self removedEntityIDs];
    uint64_t v14 = (void *)[v13 mutableCopy];

    v15 = [v9 removedEntityIDs];

    [v14 unionSet:v15];
    v16 = (void *)[v11 mutableCopy];
    [v16 minusSet:v14];
    objc_super v17 = (void *)[v14 mutableCopy];
    [v17 minusSet:v11];
    v18 = [[VUIAppDocumentModifiedFavoritesEvent alloc] initWithAddedEntityIDs:v16 removedEntityIDs:v17 isBackground:self->_isBackground];
  }
  else
  {
LABEL_4:
    v19 = VUIDefaultLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      [(VUIAppDocumentModifiedFavoritesEvent *)self coalescedEvent:v19];
    }

    v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)VUIAppDocumentModifiedFavoritesEvent;
  unint64_t v3 = [(VUIAppDocumentUpdateEvent *)&v9 hash];
  id v4 = [(VUIAppDocumentModifiedFavoritesEvent *)self addedEntityIDs];
  uint64_t v5 = [v4 hash];

  uint64_t v6 = [(VUIAppDocumentModifiedFavoritesEvent *)self removedEntityIDs];
  unint64_t v7 = v5 ^ [v6 hash] ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VUIAppDocumentModifiedFavoritesEvent *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        v19.receiver = self;
        v19.super_class = (Class)VUIAppDocumentModifiedFavoritesEvent;
        if (![(VUIAppDocumentUpdateEvent *)&v19 isEqual:v6]) {
          goto LABEL_10;
        }
        BOOL isBackground = self->_isBackground;
        if (isBackground != [(VUIAppDocumentModifiedFavoritesEvent *)v6 isBackground]) {
          goto LABEL_10;
        }
        uint64_t v8 = [(VUIAppDocumentModifiedFavoritesEvent *)self addedEntityIDs];
        objc_super v9 = [(VUIAppDocumentModifiedFavoritesEvent *)v6 addedEntityIDs];
        id v10 = v8;
        id v11 = v9;
        if (v10 == v11)
        {
        }
        else
        {
          uint64_t v12 = v11;
          char v13 = 0;
          if (!v10 || !v11)
          {
LABEL_19:

            goto LABEL_20;
          }
          char v14 = [v10 isEqual:v11];

          if ((v14 & 1) == 0)
          {
LABEL_10:
            char v13 = 0;
LABEL_20:

            goto LABEL_21;
          }
        }
        v15 = [(VUIAppDocumentModifiedFavoritesEvent *)self removedEntityIDs];
        v16 = [(VUIAppDocumentModifiedFavoritesEvent *)v6 removedEntityIDs];
        id v10 = v15;
        id v17 = v16;
        uint64_t v12 = v17;
        if (v10 == v17)
        {
          char v13 = 1;
        }
        else
        {
          char v13 = 0;
          if (v10 && v17) {
            char v13 = [v10 isEqual:v17];
          }
        }
        goto LABEL_19;
      }
    }
    char v13 = 0;
  }
LABEL_21:

  return v13;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15.receiver = self;
  v15.super_class = (Class)VUIAppDocumentModifiedFavoritesEvent;
  id v4 = [(VUIAppDocumentUpdateEvent *)&v15 description];
  [v3 addObject:v4];

  uint64_t v5 = NSString;
  uint64_t v6 = [(VUIAppDocumentModifiedFavoritesEvent *)self addedEntityIDs];
  unint64_t v7 = [v5 stringWithFormat:@"%@=%@", @"addedEntityIDs", v6];
  [v3 addObject:v7];

  uint64_t v8 = NSString;
  objc_super v9 = [(VUIAppDocumentModifiedFavoritesEvent *)self removedEntityIDs];
  id v10 = [v8 stringWithFormat:@"%@=%@", @"removedEntityIDs", v9];
  [v3 addObject:v10];

  id v11 = NSString;
  uint64_t v12 = [v3 componentsJoinedByString:@", "];
  char v13 = [v11 stringWithFormat:@"<%@>", v12];

  return v13;
}

- (NSSet)addedEntityIDs
{
  return self->_addedEntityIDs;
}

- (void)setAddedEntityIDs:(id)a3
{
}

- (NSSet)removedEntityIDs
{
  return self->_removedEntityIDs;
}

- (void)setRemovedEntityIDs:(id)a3
{
}

- (BOOL)isBackground
{
  return self->_isBackground;
}

- (void)setIsBackground:(BOOL)a3
{
  self->_BOOL isBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedEntityIDs, 0);
  objc_storeStrong((id *)&self->_addedEntityIDs, 0);
}

- (void)coalescedEvent:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 descriptor];
  uint64_t v6 = [a2 descriptor];
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  id v10 = v6;
  _os_log_error_impl(&dword_1E2BD7000, a3, OS_LOG_TYPE_ERROR, "VUIAppDocumentUpdateEvent: Can't coalesce events as the descriptors don't match. Events: %@, %@", (uint8_t *)&v7, 0x16u);
}

@end