@interface VUIMediaItemEntityTypesFetchResponseChanges
- (BOOL)localMediaItemsAvailableDidChange;
- (VUICollectionChangeSet)mediaItemEntityTypesChangeSet;
- (VUIMediaItemEntityTypesFetchResponseChanges)init;
- (VUIMediaItemEntityTypesFetchResponseChanges)initWithMediaItemEntityTypesChangeSet:(id)a3 localMediaItemsAvailableDidChange:(BOOL)a4;
- (id)description;
@end

@implementation VUIMediaItemEntityTypesFetchResponseChanges

- (VUIMediaItemEntityTypesFetchResponseChanges)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIMediaItemEntityTypesFetchResponseChanges)initWithMediaItemEntityTypesChangeSet:(id)a3 localMediaItemsAvailableDidChange:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUIMediaItemEntityTypesFetchResponseChanges;
  v8 = [(VUIMediaItemEntityTypesFetchResponseChanges *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mediaItemEntityTypesChangeSet, a3);
    v9->_localMediaItemsAvailableDidChange = a4;
  }

  return v9;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15.receiver = self;
  v15.super_class = (Class)VUIMediaItemEntityTypesFetchResponseChanges;
  uint64_t v4 = [(VUIMediaItemEntityTypesFetchResponseChanges *)&v15 description];
  [v3 addObject:v4];

  v5 = NSString;
  v6 = [(VUIMediaItemEntityTypesFetchResponseChanges *)self mediaItemEntityTypesChangeSet];
  id v7 = [v5 stringWithFormat:@"%@=%@", @"mediaItemEntityTypesChangeSet", v6];
  [v3 addObject:v7];

  v8 = NSString;
  [(VUIMediaItemEntityTypesFetchResponseChanges *)self localMediaItemsAvailableDidChange];
  v9 = VUIBoolLogString();
  v10 = [v8 stringWithFormat:@"%@=%@", @"localMediaItemsAvailableDidChange", v9];
  [v3 addObject:v10];

  objc_super v11 = NSString;
  v12 = [v3 componentsJoinedByString:@", "];
  v13 = [v11 stringWithFormat:@"<%@>", v12];

  return v13;
}

- (VUICollectionChangeSet)mediaItemEntityTypesChangeSet
{
  return self->_mediaItemEntityTypesChangeSet;
}

- (BOOL)localMediaItemsAvailableDidChange
{
  return self->_localMediaItemsAvailableDidChange;
}

- (void).cxx_destruct
{
}

@end