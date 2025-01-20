@interface IPAEditOperation
+ (id)_identifierForUUIDMap;
+ (id)_mapDispatchQueue;
+ (id)_uuidForIdentifierMap;
+ (id)operationIdentifierForUUID:(id)a3;
+ (id)operationUUIDForIdentifier:(id)a3;
+ (id)presetifyAdjustment:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOperation:(id)a3;
- (IPAEditOperation)init;
- (IPAEditOperation)initWithSettingsDictionary:(id)a3;
- (NSString)debugDescription;
- (id)UUID;
- (id)archivalRepresentation;
- (id)autoIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifier;
- (id)settingsDictionary;
@end

@implementation IPAEditOperation

- (NSString)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v4 = objc_opt_class();
  v5 = [(IPAEditOperation *)self identifier];
  v6 = (void *)[v3 initWithFormat:@"<%@:%p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (id)settingsDictionary
{
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue();
  id v3 = (IPAEditOperation *)_PFAssertFailHandler();
  return [(IPAEditOperation *)v3 UUID];
}

- (id)UUID
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  id v3 = +[IPAEditOperation _mapDispatchQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__IPAEditOperation_UUID__block_invoke;
  v6[3] = &unk_1E6CC1F88;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __24__IPAEditOperation_UUID__block_invoke(uint64_t a1)
{
  v2 = +[IPAEditOperation _uuidForIdentifierMap];
  id v3 = [*(id *)(a1 + 32) identifier];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v11 = +[IPAEditOperation _uuidForIdentifierMap];
    id v12 = [*(id *)(a1 + 32) identifier];
    [v11 setObject:v10 forKeyedSubscript:v12];

    id v14 = [*(id *)(a1 + 32) identifier];
    v13 = +[IPAEditOperation _identifierForUUIDMap];
    [v13 setObject:v14 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
}

- (id)autoIdentifier
{
  return 0;
}

- (id)identifier
{
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue();
  id v3 = (IPAEditOperation *)_PFAssertFailHandler();
  return (id)[(IPAEditOperation *)v3 isEqualToOperation:v5];
}

- (BOOL)isEqualToOperation:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  id v5 = [(IPAEditOperation *)self identifier];
  v6 = [v4 identifier];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(IPAEditOperation *)self isEqualToOperation:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithOperation:self];
}

- (IPAEditOperation)initWithSettingsDictionary:(id)a3
{
  id v3 = a3;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  BOOL v5 = (IPAEditOperation *)_PFAssertFailHandler();
  return [(IPAEditOperation *)v5 initWithOperation:v7];
}

- (IPAEditOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)IPAEditOperation;
  return [(IPAEditOperation *)&v3 init];
}

+ (id)_mapDispatchQueue
{
  if (_mapDispatchQueue_onceToken != -1) {
    dispatch_once(&_mapDispatchQueue_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)_mapDispatchQueue_queue;
  return v2;
}

uint64_t __37__IPAEditOperation__mapDispatchQueue__block_invoke()
{
  _mapDispatchQueue_queue = (uint64_t)dispatch_queue_create("com.apple.photos.IPAEditOperation.mapDispatchQueue", 0);
  return MEMORY[0x1F41817F8]();
}

+ (id)_uuidForIdentifierMap
{
  if (_uuidForIdentifierMap_onceToken != -1) {
    dispatch_once(&_uuidForIdentifierMap_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)_uuidForIdentifierMap_map;
  return v2;
}

uint64_t __41__IPAEditOperation__uuidForIdentifierMap__block_invoke()
{
  _uuidForIdentifierMap_map = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (id)_identifierForUUIDMap
{
  if (_identifierForUUIDMap_onceToken != -1) {
    dispatch_once(&_identifierForUUIDMap_onceToken, &__block_literal_global_1270);
  }
  v2 = (void *)_identifierForUUIDMap_map;
  return v2;
}

uint64_t __41__IPAEditOperation__identifierForUUIDMap__block_invoke()
{
  _identifierForUUIDMap_map = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (id)operationUUIDForIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x3032000000;
    v13 = __Block_byref_object_copy_;
    id v14 = __Block_byref_object_dispose_;
    id v15 = 0;
    id v4 = +[IPAEditOperation _mapDispatchQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__IPAEditOperation_operationUUIDForIdentifier___block_invoke;
    v7[3] = &unk_1E6CC1F88;
    uint64_t v9 = &v10;
    id v8 = v3;
    dispatch_sync(v4, v7);

    id v5 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __47__IPAEditOperation_operationUUIDForIdentifier___block_invoke(uint64_t a1)
{
  v2 = +[IPAEditOperation _uuidForIdentifierMap];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = +[IPAEditOperation _uuidForIdentifierMap];
    [v10 setObject:v9 forKeyedSubscript:*(void *)(a1 + 32)];

    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = +[IPAEditOperation _identifierForUUIDMap];
    [v12 setObject:v11 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
}

+ (id)operationIdentifierForUUID:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  uint64_t v4 = +[IPAEditOperation _mapDispatchQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__IPAEditOperation_operationIdentifierForUUID___block_invoke;
  v8[3] = &unk_1E6CC1F88;
  id v9 = v3;
  uint64_t v10 = &v11;
  id v5 = v3;
  dispatch_sync(v4, v8);

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __47__IPAEditOperation_operationIdentifierForUUID___block_invoke(uint64_t a1)
{
  id v5 = +[IPAEditOperation _identifierForUUIDMap];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)archivalRepresentation
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = (void *)_PFAssertFailHandler();
  return +[IPAEditOperation presetifyAdjustment:v5];
}

+ (id)presetifyAdjustment:(id)a3
{
  id v3 = a3;
  SEL v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  id v5 = (IPARegion *)_PFAssertFailHandler();
  [(IPARegion *)v5 area];
  return result;
}

@end