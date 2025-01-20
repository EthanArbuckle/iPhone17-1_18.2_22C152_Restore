@interface ICSharedListeningContainer
+ (id)albumContainerWithMediaIdentifier:(id)a3 featureName:(id)a4;
+ (id)autoPlayContainerWithMediaIdentifier:(id)a3 featureName:(id)a4;
+ (id)groupWithFeatureName:(id)a3;
+ (id)playlistContainerWithMediaIdentifier:(id)a3 featureName:(id)a4;
+ (id)radioContainerWithMediaIdentifier:(id)a3 featureName:(id)a4;
+ (id)radioContainerWithSeedItem:(id)a3 featureName:(id)a4;
- (BOOL)isEqual:(id)a3;
- (ICSharedListeningContainer)initWithProtobuf:(id)a3;
- (ICSharedListeningItem)seedItem;
- (NSString)featureName;
- (NSString)identifier;
- (NSString)mediaIdentifier;
- (NSString)shortDescription;
- (NSString)stationHash;
- (id)_initWithKind:(int64_t)a3 mediaIdentifier:(id)a4 featureName:(id)a5;
- (id)_initWithKind:(int64_t)a3 seedItem:(id)a4 featureName:(id)a5;
- (id)description;
- (int64_t)kind;
- (unint64_t)hash;
- (void)setIdentifier:(id)a3;
@end

@implementation ICSharedListeningContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationHash, 0);
  objc_storeStrong((id *)&self->_seedItem, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_mediaIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)stationHash
{
  return self->_stationHash;
}

- (ICSharedListeningItem)seedItem
{
  return self->_seedItem;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (NSString)mediaIdentifier
{
  return self->_mediaIdentifier;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    identifier = self->_identifier;
    v6 = [v4 identifier];
    BOOL v7 = [(NSString *)identifier isEqualToString:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  NSUInteger v9 = [(NSString *)self->_identifier hash];
  uint64_t v10 = v5 ^ 0x7465646279746573 ^ v9;
  uint64_t v11 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v12 = v8 + v10;
  uint64_t v13 = (v8 + v10) ^ __ROR8__(v10, 48);
  uint64_t v14 = v13 + __ROR8__(v6 + v7, 32);
  uint64_t v15 = v12 + v11;
  uint64_t v16 = __ROR8__(v11, 47);
  uint64_t v17 = v14 ^ __ROR8__(v13, 43) ^ 0x800000000000000;
  NSUInteger v18 = (v14 ^ v9) + (v15 ^ v16);
  NSUInteger v19 = v18 ^ __ROR8__(v15 ^ v16, 51);
  uint64_t v20 = __ROR8__(v15, 32) + v17;
  uint64_t v21 = v20 ^ __ROR8__(v17, 48);
  uint64_t v22 = v21 + __ROR8__(v18, 32);
  uint64_t v23 = v22 ^ __ROR8__(v21, 43);
  NSUInteger v24 = v20 + v19;
  uint64_t v25 = v24 ^ __ROR8__(v19, 47);
  uint64_t v26 = (v22 ^ 0x800000000000000) + v25;
  uint64_t v27 = __ROR8__(v26, 32);
  uint64_t v28 = v26 ^ __ROR8__(v25, 51);
  uint64_t v29 = (__ROR8__(v24, 32) ^ 0xFFLL) + v23;
  uint64_t v30 = v29 ^ __ROR8__(v23, 48);
  uint64_t v31 = v27 + v30;
  uint64_t v32 = (v27 + v30) ^ __ROR8__(v30, 43);
  uint64_t v33 = v28 + v29;
  uint64_t v34 = v33 ^ __ROR8__(v28, 47);
  uint64_t v35 = v34 + v31;
  uint64_t v36 = v35 ^ __ROR8__(v34, 51);
  uint64_t v37 = __ROR8__(v33, 32) + v32;
  uint64_t v38 = __ROR8__(v32, 48);
  uint64_t v39 = __ROR8__(v35, 32) + (v37 ^ v38);
  uint64_t v40 = v39 ^ __ROR8__(v37 ^ v38, 43);
  uint64_t v41 = v36 + v37;
  uint64_t v42 = v41 ^ __ROR8__(v36, 47);
  uint64_t v43 = v42 + v39;
  uint64_t v44 = v43 ^ __ROR8__(v42, 51);
  uint64_t v45 = __ROR8__(v41, 32) + v40;
  uint64_t v46 = __ROR8__(v40, 48);
  uint64_t v47 = __ROR8__(v43, 32) + (v45 ^ v46);
  return (v44 + v45) ^ __ROR8__(v44, 47) ^ v47 ^ __ROR8__(v44 + v45, 32) ^ v47 ^ __ROR8__(v45 ^ v46, 43);
}

- (NSString)shortDescription
{
  uint64_t v3 = NSString;
  identifier = self->_identifier;
  uint64_t v5 = _NSStringFromICSharedListeningContainerKind(self->_kind);
  uint64_t v6 = [v3 stringWithFormat:@"<CONTAINER id=%@ kind=%@ mediaID=%@ featureName=\"%@\">", identifier, v5, self->_mediaIdentifier, self->_featureName];

  return (NSString *)v6;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  identifier = self->_identifier;
  uint64_t v6 = _NSStringFromICSharedListeningContainerKind(self->_kind);
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p id=%@ kind=%@ mediaID=%@ featureName=\"%@\">", v4, self, identifier, v6, self->_mediaIdentifier, self->_featureName];

  return v7;
}

- (id)_initWithKind:(int64_t)a3 seedItem:(id)a4 featureName:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ICSharedListeningContainer;
  uint64_t v10 = [(ICSharedListeningContainer *)&v18 init];
  if (v10)
  {
    uint64_t v11 = MSVNanoIDCreateTaggedPointer();
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v10->_kind = a3;
    uint64_t v13 = [v8 copy];
    seedItem = v10->_seedItem;
    v10->_seedItem = (ICSharedListeningItem *)v13;

    uint64_t v15 = [v9 copy];
    featureName = v10->_featureName;
    v10->_featureName = (NSString *)v15;
  }
  return v10;
}

- (id)_initWithKind:(int64_t)a3 mediaIdentifier:(id)a4 featureName:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ICSharedListeningContainer;
  uint64_t v10 = [(ICSharedListeningContainer *)&v18 init];
  if (v10)
  {
    uint64_t v11 = MSVNanoIDCreateTaggedPointer();
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v10->_kind = a3;
    uint64_t v13 = [v8 copy];
    mediaIdentifier = v10->_mediaIdentifier;
    v10->_mediaIdentifier = (NSString *)v13;

    uint64_t v15 = [v9 copy];
    featureName = v10->_featureName;
    v10->_featureName = (NSString *)v15;
  }
  return v10;
}

- (ICSharedListeningContainer)initWithProtobuf:(id)a3
{
  uint64_t v4 = (id *)a3;
  if (v4)
  {
    v24.receiver = self;
    v24.super_class = (Class)ICSharedListeningContainer;
    uint64_t v5 = [(ICSharedListeningContainer *)&v24 init];
    if (v5)
    {
      id v6 = v4[1];
      uint64_t v7 = v6;
      if (v6)
      {
        id v8 = (NSString *)v6;
      }
      else
      {
        MSVNanoIDCreateTaggedPointer();
        id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      identifier = v5->_identifier;
      v5->_identifier = v8;

      if (*((unsigned char *)v4 + 44))
      {
        uint64_t v12 = (*((_DWORD *)v4 + 10) - 1);
        if (v12 <= 3) {
          int64_t v11 = v12 + 1;
        }
        else {
          int64_t v11 = 0;
        }
      }
      else
      {
        int64_t v11 = 0;
      }
      v5->_kind = v11;
      id v13 = v4[3];
      uint64_t v14 = [v13 copy];
      mediaIdentifier = v5->_mediaIdentifier;
      v5->_mediaIdentifier = (NSString *)v14;

      id v16 = v4[2];
      uint64_t v17 = [v16 copy];
      featureName = v5->_featureName;
      v5->_featureName = (NSString *)v17;

      if (v5->_kind == 2 && !v5->_mediaIdentifier) {
        objc_storeStrong((id *)&v5->_mediaIdentifier, v5->_identifier);
      }
      id v19 = v4[4];
      uint64_t v20 = [v19 copy];
      stationHash = v5->_stationHash;
      v5->_stationHash = (NSString *)v20;
    }
    id v9 = v5;
    self = v9;
  }
  else
  {
    id v9 = +[ICSharedListeningContainer groupWithFeatureName:0];
  }
  uint64_t v22 = v9;

  return v22;
}

+ (id)autoPlayContainerWithMediaIdentifier:(id)a3 featureName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithKind:5 mediaIdentifier:v6 featureName:v5];

  return v7;
}

+ (id)groupWithFeatureName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithKind:4 mediaIdentifier:0 featureName:v3];

  return v4;
}

+ (id)radioContainerWithSeedItem:(id)a3 featureName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithKind:2 seedItem:v6 featureName:v5];

  return v7;
}

+ (id)radioContainerWithMediaIdentifier:(id)a3 featureName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithKind:2 mediaIdentifier:v6 featureName:v5];

  return v7;
}

+ (id)playlistContainerWithMediaIdentifier:(id)a3 featureName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithKind:3 mediaIdentifier:v6 featureName:v5];

  return v7;
}

+ (id)albumContainerWithMediaIdentifier:(id)a3 featureName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithKind:1 mediaIdentifier:v6 featureName:v5];

  return v7;
}

@end