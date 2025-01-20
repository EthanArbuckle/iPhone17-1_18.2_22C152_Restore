@interface VLLocalizationCrowdsourcingDetails
+ (BOOL)supportsSecureCoding;
- (VLLocalizationCrowdsourcingDetails)initWithCoder:(id)a3;
- (VLLocalizationCrowdsourcingDetails)initWithStats:(void *)a3 resultTransform:(double *)a4;
- (_VLStatistics)statistics;
- (char)slamTrackDescriptors;
- (double)points3D;
- (double)resultPoseRotation;
- (double)resultPoseTranslation;
- (double)slamOrigin;
- (float)perFrameCalibrationMatrices;
- (float)perFrameDistortion;
- (float)perFrameVioPoses;
- (float)points2D;
- (float)slamTracks;
- (float)slamTracks2D;
- (int)inlierIndices;
- (int)perFrameVioStatusCodes;
- (signed)slamTrackImageIndices;
- (signed)slamTrackObservations;
- (unint64_t)descriptorDimension;
- (unint64_t)frameCount;
- (unint64_t)inliersCount;
- (unint64_t)slamTracksCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VLLocalizationCrowdsourcingDetails

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VLLocalizationCrowdsourcingDetails)initWithStats:(void *)a3 resultTransform:(double *)a4
{
  id v7 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)VLLocalizationCrowdsourcingDetails;
  v8 = [(VLLocalizationCrowdsourcingDetails *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_statistics, a3);
    v9->_resultPoseRotation[0][0] = *a4;
    v9->_resultPoseRotation[0][1] = a4[4];
    v9->_resultPoseRotation[0][2] = a4[8];
    v9->_resultPoseRotation[1][0] = a4[1];
    v9->_resultPoseRotation[1][1] = a4[5];
    v9->_resultPoseRotation[1][2] = a4[9];
    v9->_resultPoseRotation[2][0] = a4[2];
    v9->_resultPoseRotation[2][1] = a4[6];
    v9->_resultPoseRotation[2][2] = a4[10];
    v9->_resultPoseTranslation[0] = a4[12];
    v9->_resultPoseTranslation[1] = a4[13];
    v9->_resultPoseTranslation[2] = a4[14];
    v10 = v9;
  }

  return v9;
}

- (VLLocalizationCrowdsourcingDetails)initWithCoder:(id)a3
{
  v27[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statistics"];
  if (!v5) {
    goto LABEL_9;
  }
  v23.receiver = self;
  v23.super_class = (Class)VLLocalizationCrowdsourcingDetails;
  self = [(VLLocalizationCrowdsourcingDetails *)&v23 init];
  if (!self) {
    goto LABEL_9;
  }
  uint64_t v22 = 0;
  id v6 = v4;
  uint64_t v7 = [v6 decodeBytesForKey:@"resultPoseRotation" returnedLength:&v22];
  if (v22 != 72)
  {
    v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F07F70];
    uint64_t v26 = *MEMORY[0x263EFFC40];
    v15 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"resultPoseRotation"];
    v27[0] = v15;
    v16 = NSDictionary;
    v17 = (void **)v27;
    v18 = &v26;
LABEL_8:
    v19 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:1];
    v20 = [v13 errorWithDomain:v14 code:4864 userInfo:v19];
    [v6 failWithError:v20];

LABEL_9:
    objc_super v12 = 0;
    goto LABEL_10;
  }
  v8 = *(double **)v7;
  self->_resultPoseRotation[0][0] = **(double **)v7;
  self->_resultPoseRotation[0][1] = v8[1];
  self->_resultPoseRotation[0][2] = v8[2];
  v9 = *(double **)(v7 + 8);
  self->_resultPoseRotation[1][0] = *v9;
  self->_resultPoseRotation[1][1] = v9[1];
  self->_resultPoseRotation[1][2] = v9[2];
  v10 = *(double **)(v7 + 16);
  self->_resultPoseRotation[2][0] = *v10;
  self->_resultPoseRotation[2][1] = v10[1];
  self->_resultPoseRotation[2][2] = v10[2];
  uint64_t v22 = 0;
  id v6 = v6;
  v11 = (double *)[v6 decodeBytesForKey:@"resultPoseTranslation" returnedLength:&v22];
  if (v22 != 24)
  {
    v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F07F70];
    uint64_t v24 = *MEMORY[0x263EFFC40];
    v15 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"resultPoseTranslation"];
    v25 = v15;
    v16 = NSDictionary;
    v17 = &v25;
    v18 = &v24;
    goto LABEL_8;
  }
  self->_resultPoseTranslation[0] = *v11;
  self->_resultPoseTranslation[1] = v11[1];
  self->_resultPoseTranslation[2] = v11[2];
  objc_storeStrong((id *)&self->_statistics, v5);
  self = self;
  objc_super v12 = self;
LABEL_10:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  statistics = self->_statistics;
  id v5 = a3;
  [v5 encodeObject:statistics forKey:@"statistics"];
  [v5 encodeBytes:self->_resultPoseRotation length:72 forKey:@"resultPoseRotation"];
  [v5 encodeBytes:self->_resultPoseTranslation length:24 forKey:@"resultPoseTranslation"];
}

- (unint64_t)inliersCount
{
  v2 = [(_VLStatistics *)self->_statistics stats];
  return v2->var12 & ~(v2->var12 >> 31);
}

- (float)points2D
{
  return (float *)[(_VLStatistics *)self->_statistics stats][8];
}

- (double)points3D
{
  return *(double **)[(_VLStatistics *)self->_statistics stats];
}

- (int)inlierIndices
{
  return (int *)[(_VLStatistics *)self->_statistics stats][16];
}

- (unint64_t)frameCount
{
  v2 = [(_VLStatistics *)self->_statistics stats];
  return v2->var20 & ~(v2->var20 >> 31);
}

- (double)slamOrigin
{
  return (double *)([(_VLStatistics *)self->_statistics stats] + 144);
}

- (unint64_t)slamTracksCount
{
  v2 = [(_VLStatistics *)self->_statistics stats];
  return v2->var35 & ~(v2->var35 >> 31);
}

- (float)slamTracks
{
  return (float *)[(_VLStatistics *)self->_statistics stats][192];
}

- (unint64_t)descriptorDimension
{
  v2 = [(_VLStatistics *)self->_statistics stats];
  return v2->var24 & ~(v2->var24 >> 31);
}

- (char)slamTrackDescriptors
{
  return (char *)[(_VLStatistics *)self->_statistics stats][200];
}

- (signed)slamTrackObservations
{
  return (signed __int16 *)[(_VLStatistics *)self->_statistics stats][232];
}

- (float)slamTracks2D
{
  return (float *)[(_VLStatistics *)self->_statistics stats][216];
}

- (signed)slamTrackImageIndices
{
  return (signed __int16 *)[(_VLStatistics *)self->_statistics stats][224];
}

- (int)perFrameVioStatusCodes
{
  return (int *)[(_VLStatistics *)self->_statistics stats][256];
}

- (float)perFrameVioPoses
{
  return (float *)[(_VLStatistics *)self->_statistics stats][264];
}

- (float)perFrameCalibrationMatrices
{
  return (float *)[(_VLStatistics *)self->_statistics stats][272];
}

- (float)perFrameDistortion
{
  return (float *)[(_VLStatistics *)self->_statistics stats][280];
}

- (double)resultPoseRotation
{
  return self->_resultPoseRotation[0];
}

- (double)resultPoseTranslation
{
  return self->_resultPoseTranslation;
}

- (_VLStatistics)statistics
{
  return self->_statistics;
}

- (void).cxx_destruct
{
}

@end