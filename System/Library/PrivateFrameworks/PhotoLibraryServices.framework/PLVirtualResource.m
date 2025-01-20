@interface PLVirtualResource
- (BOOL)isDefaultOrientation;
- (BOOL)isDerivative;
- (BOOL)isInCloud;
- (BOOL)isOriginalResource;
- (BOOL)isPlayableVideo;
- (BOOL)isVirtual;
- (NSDate)trashedDate;
- (NSString)codecFourCharCodeName;
- (NSString)debugDescription;
- (NSURL)fileURL;
- (PLAssetID)assetID;
- (PLResourceDataStore)dataStore;
- (PLResourceDataStoreKey)dataStoreKey;
- (PLUniformTypeIdentifier)uniformTypeIdentifier;
- (PLVirtualResource)initWithAsset:(id)a3 resourceType:(unsigned int)a4 version:(unsigned int)a5 recipeID:(unsigned int)a6;
- (PLVirtualResource)initWithRecipe:(id)a3 forAsset:(id)a4;
- (float)scale;
- (id)photosCTLJSONDict;
- (id)singleLineDescription;
- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4;
- (int)qualitySortValue;
- (int64_t)dataLength;
- (int64_t)dataStoreSubtype;
- (int64_t)estimatedDataLength;
- (int64_t)orientedHeight;
- (int64_t)orientedWidth;
- (int64_t)unorientedHeight;
- (int64_t)unorientedWidth;
- (signed)localAvailability;
- (signed)localAvailabilityTarget;
- (signed)remoteAvailability;
- (signed)remoteAvailabilityTarget;
- (signed)trashedState;
- (signed)utiConformanceHint;
- (unint64_t)cplType;
- (unsigned)orientation;
- (unsigned)recipeID;
- (unsigned)resourceType;
- (unsigned)version;
- (void)setCodecFourCharCodeName:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setDataStoreKey:(id)a3;
- (void)setDataStoreSubtype:(int64_t)a3;
- (void)setRecipeID:(unsigned int)a3;
- (void)setRemoteAvailability:(signed __int16)a3;
- (void)setResourceType:(unsigned int)a3;
- (void)setScale:(float)a3;
- (void)setUniformTypeIdentifier:(id)a3;
- (void)setUnorientedHeight:(int64_t)a3;
- (void)setUnorientedWidth:(int64_t)a3;
- (void)setVersion:(unsigned int)a3;
@end

@implementation PLVirtualResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trashedDate, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_codecFourCharCodeName, 0);
  objc_storeStrong((id *)&self->_dataStoreKey, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

- (signed)trashedState
{
  return self->_trashedState;
}

- (NSDate)trashedDate
{
  return self->_trashedDate;
}

- (void)setScale:(float)a3
{
  self->_scale = a3;
}

- (float)scale
{
  return self->_scale;
}

- (void)setUniformTypeIdentifier:(id)a3
{
}

- (PLUniformTypeIdentifier)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (void)setCodecFourCharCodeName:(id)a3
{
}

- (NSString)codecFourCharCodeName
{
  return self->_codecFourCharCodeName;
}

- (void)setUnorientedHeight:(int64_t)a3
{
  self->_unorientedHeight = a3;
}

- (int64_t)unorientedHeight
{
  return self->_unorientedHeight;
}

- (void)setUnorientedWidth:(int64_t)a3
{
  self->_unorientedWidth = a3;
}

- (int64_t)unorientedWidth
{
  return self->_unorientedWidth;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (signed)remoteAvailabilityTarget
{
  return self->_remoteAvailabilityTarget;
}

- (void)setRemoteAvailability:(signed __int16)a3
{
  self->_remoteAvailability = a3;
}

- (signed)remoteAvailability
{
  return self->_remoteAvailability;
}

- (signed)localAvailabilityTarget
{
  return self->_localAvailabilityTarget;
}

- (void)setDataStoreKey:(id)a3
{
}

- (PLResourceDataStoreKey)dataStoreKey
{
  return self->_dataStoreKey;
}

- (void)setDataStoreSubtype:(int64_t)a3
{
  self->_dataStoreSubtype = a3;
}

- (int64_t)dataStoreSubtype
{
  return self->_dataStoreSubtype;
}

- (void)setDataStore:(id)a3
{
}

- (PLResourceDataStore)dataStore
{
  return self->_dataStore;
}

- (void)setRecipeID:(unsigned int)a3
{
  self->_recipeID = a3;
}

- (unsigned)recipeID
{
  return self->_recipeID;
}

- (void)setResourceType:(unsigned int)a3
{
  self->_resourceType = a3;
}

- (unsigned)resourceType
{
  return self->_resourceType;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (PLAssetID)assetID
{
  return self->_assetID;
}

- (NSString)debugDescription
{
  v3 = [[PLDescriptionBuilder alloc] initWithObject:self style:3 indent:0];
  unsigned int v4 = [(PLVirtualResource *)self resourceType];
  if (v4 > 0x1F) {
    v5 = @"invalid";
  }
  else {
    v5 = off_1E58641E0[v4];
  }
  v6 = v5;
  [(PLDescriptionBuilder *)v3 appendName:@"resourceType" object:v6];

  unsigned int v7 = [(PLVirtualResource *)self version];
  if (v7 > 2) {
    v8 = @"cur";
  }
  else {
    v8 = off_1E58642E0[v7];
  }
  v9 = v8;
  [(PLDescriptionBuilder *)v3 appendName:@"version" object:v9];

  v10 = [(PLVirtualResource *)self dataStore];
  unsigned int v11 = [(id)objc_opt_class() storeClassID];
  v12 = [v10 name];
  v13 = objc_msgSend(v12, "stringByAppendingFormat:", @" (%ld)", v11);

  [(PLDescriptionBuilder *)v3 appendName:@"dataStore" object:v13];
  int64_t v14 = [(PLVirtualResource *)self dataStoreSubtype];
  v15 = [(PLVirtualResource *)self dataStore];
  v16 = [v15 descriptionForSubtype:v14];
  v17 = objc_msgSend(v16, "stringByAppendingFormat:", @" (%ld)", v14);

  [(PLDescriptionBuilder *)v3 appendName:@"dataStoreSubtype" object:v17];
  if ([(PLVirtualResource *)self recipeID])
  {
    v18 = +[PLResourceRecipe recipeFromID:[(PLVirtualResource *)self recipeID]];
    v19 = [v18 description];
    [(PLDescriptionBuilder *)v3 appendName:@"recipeID" object:v19];
  }
  v20 = [(PLVirtualResource *)self dataStoreKey];

  if (v20)
  {
    v21 = [(PLVirtualResource *)self dataStoreKey];
    v22 = [v21 descriptionForAssetID:self->_assetID];
    [(PLDescriptionBuilder *)v3 appendName:@"dataStoreKey" object:v22];
  }
  v23 = PLResourceLocalAvailabilityName([(PLVirtualResource *)self localAvailability]);
  [(PLDescriptionBuilder *)v3 appendName:@"localAvailability" object:v23];

  v24 = PLResourceLocalAvailabilityTargetName([(PLVirtualResource *)self localAvailabilityTarget]);
  [(PLDescriptionBuilder *)v3 appendName:@"localAvailabilityTarget" object:v24];

  int v25 = [(PLVirtualResource *)self remoteAvailability];
  if (v25 == 1) {
    v26 = @"available";
  }
  else {
    v26 = @"missing";
  }
  if (!v25) {
    v26 = @"unavailable";
  }
  v27 = v26;
  [(PLDescriptionBuilder *)v3 appendName:@"remoteAvailability" object:v27];

  int v28 = [(PLVirtualResource *)self remoteAvailabilityTarget];
  if (v28 == 1) {
    v29 = @"available";
  }
  else {
    v29 = @"missing";
  }
  if (!v28) {
    v29 = @"unavailable";
  }
  v30 = v29;
  [(PLDescriptionBuilder *)v3 appendName:@"remoteAvailabilityTarget" object:v30];

  [(PLDescriptionBuilder *)v3 appendName:@"isDerivative" BOOLValue:[(PLVirtualResource *)self isDerivative]];
  [(PLDescriptionBuilder *)v3 appendName:@"unorientedWidth" integerValue:[(PLVirtualResource *)self unorientedWidth]];
  [(PLDescriptionBuilder *)v3 appendName:@"unorientedHeight" integerValue:[(PLVirtualResource *)self unorientedHeight]];
  [(PLDescriptionBuilder *)v3 appendName:@"orientation" integerValue:[(PLVirtualResource *)self orientation]];
  [(PLDescriptionBuilder *)v3 appendName:@"qualitySortValue" integerValue:[(PLVirtualResource *)self qualitySortValue]];
  v31 = [(PLVirtualResource *)self uniformTypeIdentifier];
  v32 = [v31 identifier];
  [(PLDescriptionBuilder *)v3 appendName:@"uniformTypeIdentifier" object:v32];

  v33 = [(PLVirtualResource *)self codecFourCharCodeName];
  [(PLDescriptionBuilder *)v3 appendName:@"codecFourCharCodeName" object:v33];

  v34 = [(PLDescriptionBuilder *)v3 build];

  return (NSString *)v34;
}

- (id)singleLineDescription
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  unsigned int v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p>", v5, self];

  unsigned int v7 = [(PLVirtualResource *)self resourceType];
  if (v7 > 0x1F) {
    v8 = @"invalid";
  }
  else {
    v8 = off_1E58641E0[v7];
  }
  v9 = v8;
  [v6 appendFormat:@" type: %@", v9];

  v10 = +[PLResourceRecipe recipeFromID:[(PLVirtualResource *)self recipeID]];
  unsigned int v11 = [v10 description];
  [v6 appendFormat:@" recipeID: %@", v11];

  unsigned int v12 = [(PLVirtualResource *)self version];
  if (v12 > 2) {
    v13 = @"cur";
  }
  else {
    v13 = off_1E58642E0[v12];
  }
  int64_t v14 = v13;
  [v6 appendFormat:@" ver: %@", v14];

  v15 = [(PLVirtualResource *)self dataStore];
  v16 = objc_msgSend(v15, "descriptionForSubtype:", -[PLVirtualResource dataStoreSubtype](self, "dataStoreSubtype"));
  [v6 appendFormat:@" subtype: %@", v16];

  [v6 appendFormat:@" size: (%ld, %ld)", -[PLVirtualResource unorientedWidth](self, "unorientedWidth"), -[PLVirtualResource unorientedHeight](self, "unorientedHeight")];
  v17 = [(PLVirtualResource *)self uniformTypeIdentifier];
  v18 = [v17 identifier];
  [v6 appendFormat:@" uti: %@", v18];

  if ([(PLVirtualResource *)self localAvailability] == 1) {
    v19 = @"Y";
  }
  else {
    v19 = @"N";
  }
  [v6 appendFormat:@" local: %@", v19];
  if ([(PLVirtualResource *)self remoteAvailability] == 1) {
    v20 = @"Y";
  }
  else {
    v20 = @"N";
  }
  [v6 appendFormat:@" remote: %@", v20];
  v21 = [(PLVirtualResource *)self dataStoreKey];
  v22 = [v21 fileURLForAssetID:self->_assetID];

  if (v22) {
    [v6 appendFormat:@" url: %@", v22];
  }

  return v6;
}

- (id)photosCTLJSONDict
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unsigned int v4 = [(PLVirtualResource *)self codecFourCharCodeName];

  if (v4)
  {
    v5 = [(PLVirtualResource *)self codecFourCharCodeName];
  }
  else
  {
    v5 = @"none";
  }
  v6 = [(PLVirtualResource *)self uniformTypeIdentifier];
  unsigned int v7 = v6;
  if (v6)
  {
    v8 = [v6 identifier];
  }
  else
  {
    v8 = @"none";
  }
  v9 = [(PLVirtualResource *)self dataStore];
  uint64_t v10 = [(id)objc_opt_class() storeClassID];

  [v3 setObject:v8 forKeyedSubscript:@"uti"];
  unsigned int v11 = [NSNumber numberWithUnsignedShort:v10];
  [v3 setObject:v11 forKeyedSubscript:@"store"];

  unsigned int v12 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PLVirtualResource dataStoreSubtype](self, "dataStoreSubtype"));
  [v3 setObject:v12 forKeyedSubscript:@"subtype"];

  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLVirtualResource version](self, "version"));
  [v3 setObject:v13 forKeyedSubscript:@"version"];

  int64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLVirtualResource recipeID](self, "recipeID"));
  [v3 setObject:v14 forKeyedSubscript:@"recipe"];

  [v3 setObject:v5 forKeyedSubscript:@"codec"];
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLVirtualResource orientation](self, "orientation"));
  [v3 setObject:v15 forKeyedSubscript:@"orientation"];

  v16 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PLVirtualResource unorientedWidth](self, "unorientedWidth"));
  [v3 setObject:v16 forKeyedSubscript:@"unorientedWidth"];

  v17 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PLVirtualResource unorientedHeight](self, "unorientedHeight"));
  [v3 setObject:v17 forKeyedSubscript:@"unorientedHeight"];

  v18 = objc_msgSend(NSNumber, "numberWithShort:", -[PLVirtualResource localAvailability](self, "localAvailability"));
  [v3 setObject:v18 forKeyedSubscript:@"localAvailability"];

  v19 = objc_msgSend(NSNumber, "numberWithShort:", -[PLVirtualResource remoteAvailability](self, "remoteAvailability"));
  [v3 setObject:v19 forKeyedSubscript:@"remoteAvailability"];

  v20 = [(PLVirtualResource *)self dataStoreKey];
  v21 = [v20 descriptionForAssetID:self->_assetID];
  [v3 setObject:v21 forKeyedSubscript:@"dataStoreKey"];

  return v3;
}

- (NSURL)fileURL
{
  id v3 = [(PLVirtualResource *)self dataStoreKey];
  unsigned int v4 = [(PLVirtualResource *)self assetID];
  v5 = [v3 fileURLForAssetID:v4];

  return (NSURL *)v5;
}

- (int)qualitySortValue
{
  int64_t assetWidth = self->_assetWidth;
  int64_t assetHeight = self->_assetHeight;
  int64_t v5 = [(PLVirtualResource *)self orientedWidth];
  int64_t v6 = [(PLVirtualResource *)self orientedHeight];
  int isLosslessEncoded = self->_isLosslessEncoded;
  if (self->_isMarkedFullSize) {
    isLosslessEncoded |= 2u;
  }
  double v8 = sqrt((double)(v6 * v5)) / sqrt((double)(assetHeight * assetWidth));
  if (v8 >= 1.0) {
    double v9 = 32767.0;
  }
  else {
    double v9 = v8 * 32767.0;
  }
  return isLosslessEncoded | ((int)v9 << 16);
}

- (signed)utiConformanceHint
{
  v2 = [(PLVirtualResource *)self uniformTypeIdentifier];
  signed __int16 v3 = [v2 conformanceHint];

  return v3;
}

- (BOOL)isInCloud
{
  return 0;
}

- (BOOL)isPlayableVideo
{
  return 0;
}

- (int64_t)orientedHeight
{
  int64_t v3 = [(PLVirtualResource *)self unorientedWidth];
  int64_t v4 = [(PLVirtualResource *)self unorientedHeight];
  if ((unint64_t)[(PLVirtualResource *)self orientation] - 5 >= 4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v3;
  }
  return (uint64_t)(double)v5;
}

- (int64_t)orientedWidth
{
  int64_t v3 = [(PLVirtualResource *)self unorientedWidth];
  int64_t v4 = [(PLVirtualResource *)self unorientedHeight];
  if ((unint64_t)[(PLVirtualResource *)self orientation] - 5 >= 4) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v4;
  }
  return (uint64_t)(double)v5;
}

- (signed)localAvailability
{
  v2 = [(PLVirtualResource *)self dataStoreKey];

  if (v2) {
    return 1;
  }
  else {
    return -1;
  }
}

- (int64_t)estimatedDataLength
{
  return 0;
}

- (int64_t)dataLength
{
  return 0;
}

- (unint64_t)cplType
{
  return 0;
}

- (BOOL)isDerivative
{
  return [(PLVirtualResource *)self recipeID] & 1;
}

- (BOOL)isDefaultOrientation
{
  return 1;
}

- (BOOL)isVirtual
{
  return 1;
}

- (BOOL)isOriginalResource
{
  v2 = self;
  if ([(PLVirtualResource *)v2 version]) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = ([(PLVirtualResource *)v2 recipeID] & 1) == 0;
  }

  return v3;
}

- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(PLVirtualResource *)self dataStoreKey];
  double v9 = [v8 validateForAssetID:v7 resourceIdentity:v6];

  uint64_t v10 = [MEMORY[0x1E4F1CBF0] arrayByAddingObjectsFromArray:v9];

  return v10;
}

- (PLVirtualResource)initWithRecipe:(id)a3 forAsset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    unsigned int v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PLVirtualResource.m", 99, @"Invalid parameter not satisfying: %@", @"recipe" object file lineNumber description];
  }
  double v9 = -[PLVirtualResource initWithAsset:resourceType:version:recipeID:](self, "initWithAsset:resourceType:version:recipeID:", v8, 0, 3, [v7 recipeID]);

  return v9;
}

- (PLVirtualResource)initWithAsset:(id)a3 resourceType:(unsigned int)a4 version:(unsigned int)a5 recipeID:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v11 = a3;
  if ([(PLVirtualResource *)self isMemberOfClass:objc_opt_class()])
  {
    [(PLVirtualResource *)self doesNotRecognizeSelector:a2];
    unsigned int v12 = 0;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)PLVirtualResource;
    v13 = [(PLVirtualResource *)&v19 init];
    if (v13)
    {
      if (!v11)
      {
        v18 = [MEMORY[0x1E4F28B00] currentHandler];
        [v18 handleFailureInMethod:a2, v13, @"PLVirtualResource.m", 84, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
      }
      uint64_t v14 = [v11 assetID];
      assetID = v13->_assetID;
      v13->_assetID = (PLAssetID *)v14;

      v13->_version = a5;
      v13->_resourceType = a4;
      v13->_recipeID = v6;
      v13->_int64_t assetWidth = [v11 width];
      v13->_int64_t assetHeight = [v11 height];
      v13->_isMarkedFullSize = PLIsResourceMarkedFullSizeFromRecipeID(v6);
      v16 = [(PLVirtualResource *)v13 uniformTypeIdentifier];
      v13->_int isLosslessEncoded = [v16 isLosslessEncoding];
    }
    self = v13;
    unsigned int v12 = self;
  }

  return v12;
}

@end