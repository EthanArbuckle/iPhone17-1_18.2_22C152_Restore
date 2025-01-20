@interface VUIMediaItemEntityTypesFetchResponse
- (BOOL)_updateWithResponse:(id)a3 changes:(id)a4 replaceContentsOnNilChanges:(BOOL)a5;
- (BOOL)areLocalMediaItemsAvailable;
- (NSOrderedSet)mediaItemEntityTypes;
- (VUIMediaItemEntityTypesFetchResponse)init;
- (id)description;
- (void)setLocalMediaItemsAvailable:(BOOL)a3;
- (void)setMediaItemEntityTypes:(id)a3;
@end

@implementation VUIMediaItemEntityTypesFetchResponse

- (VUIMediaItemEntityTypesFetchResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)VUIMediaItemEntityTypesFetchResponse;
  v2 = [(VUIMediaItemEntityTypesFetchResponse *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CAA0] orderedSet];
    mediaItemEntityTypes = v2->_mediaItemEntityTypes;
    v2->_mediaItemEntityTypes = (NSOrderedSet *)v3;
  }
  return v2;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15.receiver = self;
  v15.super_class = (Class)VUIMediaItemEntityTypesFetchResponse;
  v4 = [(VUIMediaItemEntityTypesFetchResponse *)&v15 description];
  [v3 addObject:v4];

  v5 = NSString;
  objc_super v6 = [(VUIMediaItemEntityTypesFetchResponse *)self mediaItemEntityTypes];
  v7 = [v5 stringWithFormat:@"%@=%@", @"mediaItemEntityTypes", v6];
  [v3 addObject:v7];

  v8 = NSString;
  [(VUIMediaItemEntityTypesFetchResponse *)self areLocalMediaItemsAvailable];
  v9 = VUIBoolLogString();
  v10 = [v8 stringWithFormat:@"%@=%@", @"areLocalMediaItemsAvailable", v9];
  [v3 addObject:v10];

  v11 = NSString;
  v12 = [v3 componentsJoinedByString:@", "];
  v13 = [v11 stringWithFormat:@"<%@>", v12];

  return v13;
}

- (BOOL)_updateWithResponse:(id)a3 changes:(id)a4 replaceContentsOnNilChanges:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [(VUIMediaItemEntityTypesFetchResponse *)self mediaItemEntityTypes];
  v11 = [v10 array];
  v12 = (void *)[v11 mutableCopy];

  v13 = [v8 mediaItemEntityTypes];
  v14 = [v13 array];

  objc_super v15 = [v9 mediaItemEntityTypesChangeSet];
  int v16 = objc_msgSend(v12, "vui_applyChangeSetIfAvailable:destinationObjects:replaceContentsOnNilChanges:", v15, v14, v5);

  if (v16)
  {
    v17 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v12];
    [(VUIMediaItemEntityTypesFetchResponse *)self setMediaItemEntityTypes:v17];
  }
  if ([v9 localMediaItemsAvailableDidChange])
  {
    -[VUIMediaItemEntityTypesFetchResponse setLocalMediaItemsAvailable:](self, "setLocalMediaItemsAvailable:", [v8 areLocalMediaItemsAvailable]);
    LOBYTE(v16) = 1;
  }

  return v16;
}

- (NSOrderedSet)mediaItemEntityTypes
{
  return self->_mediaItemEntityTypes;
}

- (void)setMediaItemEntityTypes:(id)a3
{
}

- (BOOL)areLocalMediaItemsAvailable
{
  return self->_localMediaItemsAvailable;
}

- (void)setLocalMediaItemsAvailable:(BOOL)a3
{
  self->_localMediaItemsAvailable = a3;
}

- (void).cxx_destruct
{
}

@end