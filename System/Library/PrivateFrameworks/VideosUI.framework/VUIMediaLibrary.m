@interface VUIMediaLibrary
- (BOOL)isConnectable;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsDRMContent;
- (NSString)title;
- (VUIMediaLibrary)init;
- (VUIMediaLibrary)initWithIdentifier:(id)a3 type:(unint64_t)a4 manager:(id)a5;
- (VUIMediaLibraryIdentifier)identifier;
- (VUIMediaLibraryManager)manager;
- (id)_imageLoadOperationWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5;
- (id)_imageLoadParamsForImageLoaderObject:(id)a3;
- (id)_imageLoaderIdentifier;
- (id)description;
- (id)enqueueFetchRequests:(id)a3 completionHandler:(id)a4;
- (id)enqueueMediaItemEntityTypesFetchWithCompletionHandler:(id)a3;
- (id)saveMediaEntity:(id)a3 completionHandler:(id)a4;
- (unint64_t)_incrementRevision;
- (unint64_t)connectionState;
- (unint64_t)hash;
- (unint64_t)revision;
- (unint64_t)type;
- (void)_postContentsDidChangeNotification;
- (void)_updateWithTitle:(id)a3 connectionState:(unint64_t)a4;
- (void)connectWithCompletionHandler:(id)a3 progressHandler:(id)a4;
- (void)setIdentifier:(id)a3;
- (void)setRevision:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation VUIMediaLibrary

void __53__VUIMediaLibrary__postContentsDidChangeNotification__block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (+[VUIUtilities isSUIEnabled]
      || _os_feature_enabled_impl())
    {
      v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [(VUIMediaLibraryContentsChange *)v3 postNotificationName:@"VUISideBandContentsDidChangeNotification" object:0];
    }
    else
    {
      v3 = [[VUIMediaLibraryContentsChange alloc] initWithRevision:*(void *)(a1 + 40)];
      v6 = @"VUIMediaLibraryContentsDidChangeUserInfoKeyContentsChange";
      v7[0] = v3;
      v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
      v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 postNotificationName:@"VUIMediaLibraryContentsDidChangeNotification" object:WeakRetained userInfo:v4];
    }
  }
}

- (void)_postContentsDidChangeNotification
{
  v3 = [(VUIMediaLibrary *)self _incrementRevision];
  objc_initWeak(&location, self);
  v4 = [(VUIMediaLibrary *)self manager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__VUIMediaLibrary__postContentsDidChangeNotification__block_invoke;
  v5[3] = &unk_1E6DF6668;
  objc_copyWeak(v6, &location);
  v6[1] = v3;
  [v4 _enqueueCompletionQueueBlock:v5];

  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (VUIMediaLibraryManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (VUIMediaLibraryManager *)WeakRetained;
}

- (unint64_t)_incrementRevision
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_revision + 1;
  v2->_revision = v3;
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)type
{
  return self->_type;
}

- (VUIMediaLibraryIdentifier)identifier
{
  return self->_identifier;
}

- (VUIMediaLibrary)initWithIdentifier:(id)a3 type:(unint64_t)a4 manager:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)VUIMediaLibrary;
  v10 = [(VUIMediaLibraryImageLoader *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = (VUIMediaLibraryIdentifier *)v11;

    v10->_type = a4;
    objc_storeWeak((id *)&v10->_manager, v9);
    v10->_revision = 1;
  }

  return v10;
}

- (VUIMediaLibrary)init
{
  unint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (NSString)title
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"The %@ method needs to be override by a subclass.", v4 format];

  return (NSString *)&stru_1F3E921E0;
}

- (unint64_t)connectionState
{
  return 2;
}

- (BOOL)supportsDRMContent
{
  return 1;
}

- (BOOL)isConnectable
{
  return 1;
}

- (unint64_t)revision
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t revision = v2->_revision;
  objc_sync_exit(v2);

  return revision;
}

- (void)connectWithCompletionHandler:(id)a3 progressHandler:(id)a4
{
  id v5 = a3;
  if (v5)
  {
    v6 = [(VUIMediaLibrary *)self manager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __64__VUIMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke;
    v7[3] = &unk_1E6DF3DD0;
    id v8 = v5;
    [v6 _enqueueCompletionQueueBlock:v7];
  }
}

uint64_t __64__VUIMediaLibrary_connectWithCompletionHandler_progressHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)enqueueMediaItemEntityTypesFetchWithCompletionHandler:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ method needs to be override by a subclass.", v5 format];

  return 0;
}

- (id)enqueueFetchRequests:(id)a3 completionHandler:(id)a4
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The %@ method needs to be override by a subclass.", v6 format];

  return 0;
}

- (id)saveMediaEntity:(id)a3 completionHandler:(id)a4
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The %@ method needs to be override by a subclass.", v6 format];

  return 0;
}

- (id)_imageLoaderIdentifier
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"The %@ method needs to be override by a subclass.", v4 format];

  return 0;
}

- (id)_imageLoadParamsForImageLoaderObject:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ method needs to be override by a subclass.", v5 format];

  return 0;
}

- (id)_imageLoadOperationWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The %@ method needs to be override by a subclass.", v7 format];

  return 0;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VUIMediaLibrary *)self type];
  unint64_t v4 = v3 ^ (2 * [(VUIMediaLibrary *)self revision]);
  uint64_t v5 = [(VUIMediaLibrary *)self identifier];
  unint64_t v6 = v4 ^ [v5 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (VUIMediaLibrary *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v14 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v6 = v5;
    unint64_t v7 = [(VUIMediaLibrary *)self type];
    if (v7 == [(VUIMediaLibrary *)v6 type]
      && (unint64_t v8 = [(VUIMediaLibrary *)self revision], v8 == [(VUIMediaLibrary *)v6 revision]))
    {
      id v9 = [(VUIMediaLibrary *)self identifier];
      v10 = [(VUIMediaLibrary *)v6 identifier];
      id v11 = v9;
      id v12 = v10;
      v13 = v12;
      if (v11 == v12)
      {
        char v14 = 1;
      }
      else
      {
        char v14 = 0;
        if (v11 && v12) {
          char v14 = [v11 isEqual:v12];
        }
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v28.receiver = self;
  v28.super_class = (Class)VUIMediaLibrary;
  unint64_t v4 = [(VUIMediaLibrary *)&v28 description];
  [v3 addObject:v4];

  uint64_t v5 = NSString;
  unint64_t v6 = [(VUIMediaLibrary *)self identifier];
  unint64_t v7 = [v5 stringWithFormat:@"%@=%@", @"identifier", v6];
  [v3 addObject:v7];

  unint64_t v8 = NSString;
  id v9 = VUIMediaLibraryTypeLogString([(VUIMediaLibrary *)self type]);
  v10 = [v8 stringWithFormat:@"%@=%@", @"type", v9];
  [v3 addObject:v10];

  id v11 = [NSString stringWithFormat:@"%@=%lu", @"revision", -[VUIMediaLibrary revision](self, "revision")];
  [v3 addObject:v11];

  id v12 = NSString;
  v13 = [(VUIMediaLibrary *)self title];
  char v14 = [v12 stringWithFormat:@"%@=%@", @"title", v13];
  [v3 addObject:v14];

  v15 = NSString;
  [(VUIMediaLibrary *)self isConnectable];
  v16 = VUIBoolLogString();
  v17 = [v15 stringWithFormat:@"%@=%@", @"connectable", v16];
  [v3 addObject:v17];

  v18 = NSString;
  [(VUIMediaLibrary *)self supportsDRMContent];
  v19 = VUIBoolLogString();
  v20 = [v18 stringWithFormat:@"%@=%@", @"supportsDRMContent", v19];
  [v3 addObject:v20];

  v21 = NSString;
  v22 = VUIMediaLibraryConnectionStateLogString([(VUIMediaLibrary *)self connectionState]);
  v23 = [v21 stringWithFormat:@"%@=%@", @"connectionState", v22];
  [v3 addObject:v23];

  v24 = NSString;
  v25 = [v3 componentsJoinedByString:@", "];
  v26 = [v24 stringWithFormat:@"<%@>", v25];

  return v26;
}

- (void)_updateWithTitle:(id)a3 connectionState:(unint64_t)a4
{
  unint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  NSStringFromSelector(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 raise:v5, @"The %@ method needs to be override by a subclass.", v6 format];
}

- (void)setIdentifier:(id)a3
{
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setRevision:(unint64_t)a3
{
  self->_unint64_t revision = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_manager);
}

@end