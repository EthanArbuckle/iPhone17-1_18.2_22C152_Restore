@interface PLVideoInternalResource
+ (BOOL)deviceSupportsHDR;
- (BOOL)hasAssociatedMediaMetadata;
- (BOOL)isDownloadable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHDRDerivative;
- (BOOL)isHDROrSDRDependingOnMasterVideo;
- (BOOL)isLargeQuality;
- (BOOL)isLocallyAvailable;
- (BOOL)isLocallyGeneratable;
- (BOOL)isOriginalVideo;
- (BOOL)isOriginalVideoComplement;
- (BOOL)isPlayable;
- (BOOL)isSDRFallback;
- (BOOL)isStreamable;
- (BOOL)matchesOrExceedsQualityLevel:(unsigned int)a3;
- (NSString)debugDescription;
- (PLInternalResource)backingResource;
- (PLVideoInternalResource)initWithBackingResource:(id)a3;
- (id)additionalDescription;
- (id)cachedIsPlayable;
- (id)fileURLIfLocal;
- (id)uniformTypeIdentifier;
- (unsigned)storeClassID;
- (unsigned)version;
@end

@implementation PLVideoInternalResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingResource, 0);
  objc_storeStrong((id *)&self->_cachedIsPlayable, 0);
}

- (PLInternalResource)backingResource
{
  return self->_backingResource;
}

- (NSString)debugDescription
{
  v3 = [(PLInternalResource *)self->_backingResource dataStore];
  v16 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PLInternalResource *)self->_backingResource asset];
  v6 = [v5 uuid];
  v7 = objc_msgSend(v3, "descriptionForSubtype:", -[PLInternalResource dataStoreSubtype](self->_backingResource, "dataStoreSubtype"));
  uint64_t v8 = [(PLInternalResource *)self->_backingResource unorientedWidth];
  uint64_t v9 = [(PLInternalResource *)self->_backingResource unorientedHeight];
  v10 = PLResourceLocalAvailabilityName([(PLInternalResource *)self->_backingResource localAvailability]);
  int v11 = [(PLInternalResource *)self->_backingResource remoteAvailability];
  v12 = @"missing";
  if (v11 == 1) {
    v12 = @"available";
  }
  if (!v11) {
    v12 = @"unavailable";
  }
  v13 = v12;
  v14 = [v16 stringWithFormat:@"<%@: %p> asset=%@ dataStoreSubtype=%@ size=%lldx%lld availability remote/local=%@/%@", v4, self, v6, v7, v8, v9, v10, v13];

  return (NSString *)v14;
}

- (id)additionalDescription
{
  v3 = +[PLResourceRecipe recipeFromID:[(PLInternalResource *)self->_backingResource recipeID]];
  uint64_t v4 = NSString;
  unsigned int v5 = [(PLInternalResource *)self->_backingResource version];
  if (v5 > 2) {
    v6 = @"cur";
  }
  else {
    v6 = off_1E58642E0[v5];
  }
  v7 = v6;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F59940], "shortDescriptionForResourceType:", -[PLInternalResource cplType](self->_backingResource, "cplType"));
  uint64_t v9 = [v4 stringWithFormat:@"ver: %@, recipe: %@, cplType: %@", v7, v3, v8];

  return v9;
}

- (id)uniformTypeIdentifier
{
  v2 = [(PLInternalResource *)self->_backingResource uniformTypeIdentifier];
  v3 = [v2 identifier];

  return v3;
}

- (BOOL)isHDROrSDRDependingOnMasterVideo
{
  return [(PLInternalResource *)self->_backingResource recipeID] == 131077;
}

- (BOOL)isSDRFallback
{
  return [(PLInternalResource *)self->_backingResource recipeID] == 131079;
}

- (BOOL)isHDRDerivative
{
  return [(PLInternalResource *)self->_backingResource recipeID] == 131475;
}

- (BOOL)hasAssociatedMediaMetadata
{
  unint64_t v3 = [(PLInternalResource *)self->_backingResource cplType];
  if (v3 != 1) {
    LOBYTE(v3) = [(PLInternalResource *)self->_backingResource cplType] == 16
  }
              && [(PLInternalResource *)self->_backingResource version] == 2;
  return v3;
}

- (id)fileURLIfLocal
{
  unint64_t v3 = [(PLInternalResource *)self->_backingResource dataStoreKey];
  uint64_t v4 = [(PLInternalResource *)self->_backingResource assetID];
  unsigned int v5 = [v3 fileURLForAssetID:v4];

  return v5;
}

- (BOOL)matchesOrExceedsQualityLevel:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v5 = [(PLInternalResource *)self->_backingResource dataStore];
  LOBYTE(v3) = [v5 videoResource:self->_backingResource matchesOrExceedsQualityLevel:v3];

  return v3;
}

- (BOOL)isLargeQuality
{
  return [(PLInternalResource *)self->_backingResource recipeID] == 131077;
}

- (BOOL)isStreamable
{
  v2 = self;
  uint64_t v3 = [(PLInternalResource *)self->_backingResource dataStore];
  LOBYTE(v2) = [v3 canStreamResource:v2->_backingResource];

  return (char)v2;
}

- (BOOL)isDownloadable
{
  return [(PLInternalResource *)self->_backingResource isInCloud];
}

- (id)cachedIsPlayable
{
  return self->_cachedIsPlayable;
}

- (BOOL)isPlayable
{
  cachedIsPlayable = self->_cachedIsPlayable;
  if (!cachedIsPlayable)
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[PLInternalResource isPlayableVideo](self->_backingResource, "isPlayableVideo"));
    uint64_t v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    unsigned int v5 = self->_cachedIsPlayable;
    self->_cachedIsPlayable = v4;

    cachedIsPlayable = self->_cachedIsPlayable;
  }
  return [(NSNumber *)cachedIsPlayable BOOLValue];
}

- (BOOL)isLocallyGeneratable
{
  if ([(PLInternalResource *)self->_backingResource recipeID] != 0x20000
    && [(PLInternalResource *)self->_backingResource recipeID] != 131272
    && [(PLInternalResource *)self->_backingResource recipeID] != 131280)
  {
    return 0;
  }
  uint64_t v3 = [(PLInternalResource *)self->_backingResource asset];
  unsigned int v4 = [v3 deferredProcessingNeeded];

  if (v4 > 0xB) {
    return 0;
  }
  BOOL result = 1;
  if (((1 << v4) & 0x9F9) != 0)
  {
    v6 = [(PLInternalResource *)self->_backingResource asset];
    int v7 = [v6 videoDeferredProcessingNeeded];

    return v7 == 1;
  }
  return result;
}

- (BOOL)isLocallyAvailable
{
  v2 = [(PLInternalResource *)self->_backingResource dataStoreKey];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isOriginalVideoComplement
{
  return [(PLInternalResource *)self->_backingResource dataStoreSubtype] == 18;
}

- (BOOL)isOriginalVideo
{
  v2 = self->_backingResource;
  BOOL v3 = [(PLInternalResource *)v2 resourceType] == 1
    && ![(PLInternalResource *)v2 version]
    && ([(PLInternalResource *)v2 recipeID] & 1) == 0;

  return v3;
}

- (unsigned)version
{
  return [(PLInternalResource *)self->_backingResource version];
}

- (unsigned)storeClassID
{
  return [(PLInternalResource *)self->_backingResource dataStoreClassID];
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PLVideoInternalResource;
  if ([(PLVideoInternalResource *)&v7 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [(PLInternalResource *)self->_backingResource isEqual:v4[2]];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (PLVideoInternalResource)initWithBackingResource:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PLVideoInternalResourceContext.m" lineNumber:36 description:@"Backing resource required"];
  }
  v11.receiver = self;
  v11.super_class = (Class)PLVideoInternalResource;
  objc_super v7 = [(PLVideoInternalResource *)&v11 init];
  uint64_t v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_backingResource, a3);
  }

  return v8;
}

+ (BOOL)deviceSupportsHDR
{
  return [MEMORY[0x1E4F8CC30] currentDeviceIsEligibleForHDRPlayback];
}

@end