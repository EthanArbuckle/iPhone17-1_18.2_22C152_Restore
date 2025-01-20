@interface PLPTPAsset
- (BOOL)isBurstFavorite;
- (BOOL)isBurstFirstPicked;
- (BOOL)isBurstPicked;
- (BOOL)isDeleted;
- (BOOL)isExifAvailable;
- (BOOL)isHDR;
- (BOOL)isHighFrameRateVideo;
- (BOOL)isTimeLapseVideo;
- (CGSize)imagePixSize;
- (CGSize)thumbPixSize;
- (NSData)event;
- (NSNumber)objectCompressedSize;
- (NSNumber)thumbCompressedSize;
- (NSNumber)thumbOffset;
- (NSString)burstUUID;
- (NSString)cacheKey;
- (NSString)captureDateString;
- (NSString)createdFilename;
- (NSString)durationString;
- (NSString)filename;
- (NSString)fingerprint;
- (NSString)fullDirectoryPath;
- (NSString)groupUUID;
- (NSString)locationString;
- (NSString)modificationDateString;
- (NSString)originalFilename;
- (NSString)originatingAssetID;
- (NSString)relatedUUID;
- (NSString)spatialOverCaptureGroupIdentifier;
- (PLPTPAsset)initWithPTPAsset:(id)a3;
- (PLPTPAssetHandle)assetHandle;
- (UTType)contentType;
- (id)_pl_prettyDescriptionWithIndent:(int64_t)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)conversionGroup;
- (int64_t)desiredOrientation;
- (unsigned)videoCodec;
@end

@implementation PLPTPAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_spatialOverCaptureGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_relatedUUID, 0);
  objc_storeStrong((id *)&self->_burstUUID, 0);
  objc_storeStrong((id *)&self->_groupUUID, 0);
  objc_storeStrong((id *)&self->_locationString, 0);
  objc_storeStrong((id *)&self->_durationString, 0);
  objc_storeStrong((id *)&self->_captureDateString, 0);
  objc_storeStrong((id *)&self->_modificationDateString, 0);
  objc_storeStrong((id *)&self->_thumbCompressedSize, 0);
  objc_storeStrong((id *)&self->_thumbOffset, 0);
  objc_storeStrong((id *)&self->_originatingAssetID, 0);
  objc_storeStrong((id *)&self->_fingerprint, 0);
  objc_storeStrong((id *)&self->_objectCompressedSize, 0);
  objc_storeStrong((id *)&self->_fullDirectoryPath, 0);
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_createdFilename, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_assetHandle, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

- (NSData)event
{
  return self->_event;
}

- (BOOL)isHDR
{
  return self->_isHDR;
}

- (UTType)contentType
{
  return self->_contentType;
}

- (unsigned)videoCodec
{
  return self->_videoCodec;
}

- (int64_t)conversionGroup
{
  return self->_conversionGroup;
}

- (NSString)relatedUUID
{
  return self->_relatedUUID;
}

- (BOOL)isTimeLapseVideo
{
  return self->_timeLapseVideo;
}

- (BOOL)isHighFrameRateVideo
{
  return self->_highFrameRateVideo;
}

- (BOOL)isBurstFirstPicked
{
  return self->_burstFirstPicked;
}

- (BOOL)isBurstFavorite
{
  return self->_burstFavorite;
}

- (BOOL)isBurstPicked
{
  return self->_burstPicked;
}

- (NSString)burstUUID
{
  return self->_burstUUID;
}

- (NSString)spatialOverCaptureGroupIdentifier
{
  return self->_spatialOverCaptureGroupIdentifier;
}

- (NSString)groupUUID
{
  return self->_groupUUID;
}

- (NSString)locationString
{
  return self->_locationString;
}

- (NSString)durationString
{
  return self->_durationString;
}

- (NSString)captureDateString
{
  return self->_captureDateString;
}

- (NSString)modificationDateString
{
  return self->_modificationDateString;
}

- (int64_t)desiredOrientation
{
  return self->_desiredOrientation;
}

- (CGSize)thumbPixSize
{
  double width = self->_thumbPixSize.width;
  double height = self->_thumbPixSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)imagePixSize
{
  double width = self->_imagePixSize.width;
  double height = self->_imagePixSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSNumber)thumbCompressedSize
{
  return self->_thumbCompressedSize;
}

- (NSNumber)thumbOffset
{
  return self->_thumbOffset;
}

- (NSString)originatingAssetID
{
  return self->_originatingAssetID;
}

- (NSString)fingerprint
{
  return self->_fingerprint;
}

- (NSNumber)objectCompressedSize
{
  return self->_objectCompressedSize;
}

- (BOOL)isExifAvailable
{
  return self->_exifAvailable;
}

- (NSString)fullDirectoryPath
{
  return self->_fullDirectoryPath;
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (NSString)createdFilename
{
  return self->_createdFilename;
}

- (NSString)filename
{
  return self->_filename;
}

- (PLPTPAssetHandle)assetHandle
{
  return self->_assetHandle;
}

- (id)_pl_prettyDescriptionWithIndent:(int64_t)a3
{
  v4 = +[PLDescriptionBuilder prettyMultiLineDescriptionBuilderWithObject:self indent:a3];
  [v4 appendName:@"event" typeCode:"@" value:&self->_event];
  [v4 appendName:@"assetHandle" typeCode:"@" value:&self->_assetHandle];
  [v4 appendName:@"filename" typeCode:"@" value:&self->_filename];
  [v4 appendName:@"createdFilename" typeCode:"@" value:&self->_createdFilename];
  [v4 appendName:@"deleted" typeCode:"B" value:&self->_deleted];
  [v4 appendName:@"originalFilename" typeCode:"@" value:&self->_originalFilename];
  [v4 appendName:@"fullDirectoryPath" typeCode:"@" value:&self->_fullDirectoryPath];
  [v4 appendName:@"exifAvailable" typeCode:"B" value:&self->_exifAvailable];
  [v4 appendName:@"objectCompressedSize" typeCode:"@" value:&self->_objectCompressedSize];
  [v4 appendName:@"fingerprint" typeCode:"@" value:&self->_fingerprint];
  [v4 appendName:@"originatingAssetID" typeCode:"@" value:&self->_originatingAssetID];
  [v4 appendName:@"thumbOffset" typeCode:"@" value:&self->_thumbOffset];
  [v4 appendName:@"thumbCompressedSize" typeCode:"@" value:&self->_thumbCompressedSize];
  [v4 appendName:@"imagePixSize" typeCode:"{CGSize=dd}" value:&self->_imagePixSize];
  [v4 appendName:@"thumbPixSize" typeCode:"{CGSize=dd}" value:&self->_thumbPixSize];
  [v4 appendName:@"desiredOrientation" typeCode:"q" value:&self->_desiredOrientation];
  [v4 appendName:@"modificationDateString" typeCode:"@" value:&self->_modificationDateString];
  [v4 appendName:@"captureDateString" typeCode:"@" value:&self->_captureDateString];
  [v4 appendName:@"durationString" typeCode:"@" value:&self->_durationString];
  [v4 appendName:@"locationString" typeCode:"@" value:&self->_locationString];
  [v4 appendName:@"groupUUID" typeCode:"@" value:&self->_groupUUID];
  [v4 appendName:@"burstUUID" typeCode:"@" value:&self->_burstUUID];
  [v4 appendName:@"burstPicked" typeCode:"B" value:&self->_burstPicked];
  [v4 appendName:@"burstFavorite" typeCode:"B" value:&self->_burstFavorite];
  [v4 appendName:@"burstFirstPicked" typeCode:"B" value:&self->_burstFirstPicked];
  [v4 appendName:@"highFrameRateVideo" typeCode:"B" value:&self->_highFrameRateVideo];
  [v4 appendName:@"timeLapseVideo" typeCode:"B" value:&self->_timeLapseVideo];
  [v4 appendName:@"relatedUUID" typeCode:"@" value:&self->_relatedUUID];
  [v4 appendName:@"conversionGroup" typeCode:"q" value:&self->_conversionGroup];
  [v4 appendName:@"videoCodec" typeCode:"I" value:&self->_videoCodec];
  [v4 appendName:@"contentType" typeCode:"@" value:&self->_contentType];
  [v4 appendName:@"isHDR" typeCode:"B" value:&self->_isHDR];
  [v4 appendName:@"spatialOverCaptureGroupIdentifier" typeCode:"@" value:&self->_spatialOverCaptureGroupIdentifier];
  v5 = [v4 build];

  return v5;
}

- (NSString)cacheKey
{
  v3 = NSString;
  relatedUUID = self->_relatedUUID;
  int64_t v5 = [(PLPTPAssetHandle *)self->_assetHandle type];
  modificationDateString = (__CFString *)self->_modificationDateString;
  if (!modificationDateString) {
    modificationDateString = @"unknown";
  }
  return (NSString *)[v3 stringWithFormat:@"%@-%ld-%@", relatedUUID, v5, modificationDateString];
}

- (id)description
{
  return [(PLPTPAsset *)self _pl_prettyDescriptionWithIndent:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [PLMutablePTPAsset alloc];
  return [(PLPTPAsset *)v4 initWithPTPAsset:self];
}

- (PLPTPAsset)initWithPTPAsset:(id)a3
{
  int64_t v5 = (id *)a3;
  if (!v5)
  {
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"PLPTPAsset.m", 86, @"Invalid parameter not satisfying: %@", @"asset != nil" object file lineNumber description];
  }
  v46.receiver = self;
  v46.super_class = (Class)PLPTPAsset;
  v6 = [(PLPTPAsset *)&v46 init];
  if (v6)
  {
    uint64_t v7 = [v5[1] copy];
    event = v6->_event;
    v6->_event = (NSData *)v7;

    objc_storeStrong((id *)&v6->_assetHandle, v5[2]);
    uint64_t v9 = [v5[3] copy];
    filename = v6->_filename;
    v6->_filename = (NSString *)v9;

    uint64_t v11 = [v5[4] copy];
    createdFilename = v6->_createdFilename;
    v6->_createdFilename = (NSString *)v11;

    v6->_deleted = *((unsigned char *)v5 + 40);
    uint64_t v13 = [v5[6] copy];
    originalFilename = v6->_originalFilename;
    v6->_originalFilename = (NSString *)v13;

    uint64_t v15 = [v5[7] copy];
    fullDirectoryPath = v6->_fullDirectoryPath;
    v6->_fullDirectoryPath = (NSString *)v15;

    v6->_exifAvailable = *((unsigned char *)v5 + 64);
    uint64_t v17 = [v5[9] copy];
    objectCompressedSize = v6->_objectCompressedSize;
    v6->_objectCompressedSize = (NSNumber *)v17;

    uint64_t v19 = [v5[10] copy];
    fingerprint = v6->_fingerprint;
    v6->_fingerprint = (NSString *)v19;

    uint64_t v21 = [v5[11] copy];
    originatingAssetID = v6->_originatingAssetID;
    v6->_originatingAssetID = (NSString *)v21;

    uint64_t v23 = [v5[12] copy];
    thumbOffset = v6->_thumbOffset;
    v6->_thumbOffset = (NSNumber *)v23;

    uint64_t v25 = [v5[13] copy];
    thumbCompressedSize = v6->_thumbCompressedSize;
    v6->_thumbCompressedSize = (NSNumber *)v25;

    v6->_imagePixSize = (CGSize)*((_OWORD *)v5 + 7);
    v6->_thumbPixSize = (CGSize)*((_OWORD *)v5 + 8);
    v6->_desiredOrientation = (int64_t)v5[18];
    uint64_t v27 = [v5[19] copy];
    modificationDateString = v6->_modificationDateString;
    v6->_modificationDateString = (NSString *)v27;

    uint64_t v29 = [v5[20] copy];
    captureDateString = v6->_captureDateString;
    v6->_captureDateString = (NSString *)v29;

    uint64_t v31 = [v5[21] copy];
    durationString = v6->_durationString;
    v6->_durationString = (NSString *)v31;

    uint64_t v33 = [v5[22] copy];
    locationString = v6->_locationString;
    v6->_locationString = (NSString *)v33;

    uint64_t v35 = [v5[23] copy];
    groupUUID = v6->_groupUUID;
    v6->_groupUUID = (NSString *)v35;

    uint64_t v37 = [v5[24] copy];
    burstUUID = v6->_burstUUID;
    v6->_burstUUID = (NSString *)v37;

    v6->_burstPicked = *((unsigned char *)v5 + 200);
    v6->_burstFavorite = *((unsigned char *)v5 + 201);
    v6->_burstFirstPicked = *((unsigned char *)v5 + 202);
    v6->_highFrameRateVideo = *((unsigned char *)v5 + 203);
    v6->_timeLapseVideo = *((unsigned char *)v5 + 204);
    uint64_t v39 = [v5[26] copy];
    relatedUUID = v6->_relatedUUID;
    v6->_relatedUUID = (NSString *)v39;

    uint64_t v41 = [v5[27] copy];
    spatialOverCaptureGroupIdentifier = v6->_spatialOverCaptureGroupIdentifier;
    v6->_spatialOverCaptureGroupIdentifier = (NSString *)v41;

    v6->_conversionGroup = (int64_t)v5[28];
    v6->_videoCodec = *((_DWORD *)v5 + 58);
    objc_storeStrong((id *)&v6->_contentType, v5[30]);
    v6->_isHDR = *((unsigned char *)v5 + 248);
    v43 = v6;
  }

  return v6;
}

@end