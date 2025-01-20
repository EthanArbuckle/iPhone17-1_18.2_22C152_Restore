@interface VLLocalizationDebugInfo
+ (BOOL)supportsSecureCoding;
- ($91CD28BF998EF1D34D1F6E7D57520290)_location;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_heading;
- (BOOL)isEqual:(id)a3;
- (NSData)pngData;
- (VLLocalizationCrowdsourcingDetails)crowdsourcingDetails;
- (VLLocalizationDebugInfo)initWithCoder:(id)a3;
- (VLLocalizationDebugInfo)initWithPixelBuffer:(double)a3 monotonicTimestamp:(double)a4 timestamp:(double)a5 duration:(double)a6 location:(uint64_t)a7 clLocation:(__CVBuffer *)a8 heading:(long long *)a9 gravity:(void *)a10 transform:(long long *)a11 cameraIntrinsics:(uint64_t)a12 radialDistortion:(unint64_t)a13 exposureTargetOffset:(double)a14 statistics:(double)a15 resultStatus:(double)a16 resultPose:(__int128)a17 preserveImageData:(__int128)a18;
- (__n128)_cameraIntrinsics;
- (__n128)_gravity;
- (__n128)_transform;
- (double)_exposureTargetOffset;
- (double)_radialDistortion;
- (double)_timestamp;
- (double)points3D;
- (float)_fusedConfidences;
- (float)_solverConfidences;
- (float)points2D;
- (id)analyticsInformationWithSessionStartMonotonicTime:(double)a3;
- (id)inputParameters;
- (id)results;
- (int)_inlierIndices;
- (unint64_t)_resultStatus;
- (unint64_t)_solutionsCount;
- (unint64_t)hash;
- (unint64_t)inliersCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VLLocalizationDebugInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VLLocalizationDebugInfo)initWithPixelBuffer:(double)a3 monotonicTimestamp:(double)a4 timestamp:(double)a5 duration:(double)a6 location:(uint64_t)a7 clLocation:(__CVBuffer *)a8 heading:(long long *)a9 gravity:(void *)a10 transform:(long long *)a11 cameraIntrinsics:(uint64_t)a12 radialDistortion:(unint64_t)a13 exposureTargetOffset:(double)a14 statistics:(double)a15 resultStatus:(double)a16 resultPose:(__int128)a17 preserveImageData:(__int128)a18
{
  v108[1] = *MEMORY[0x263EF8340];
  long long v89 = a11[1];
  long long v90 = *a11;
  id v33 = a10;
  v100.receiver = a1;
  v100.super_class = (Class)VLLocalizationDebugInfo;
  v34 = [(VLLocalizationDebugInfo *)&v100 init];
  if (!v34) {
    goto LABEL_32;
  }
  uint64_t v35 = [MEMORY[0x263F08C38] UUID];
  identifier = v34->_identifier;
  v34->_identifier = (NSUUID *)v35;

  if (a27)
  {
    signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a8);
    if (PixelFormatType > 1714696751)
    {
      if (PixelFormatType != 2033463856 && PixelFormatType != 1714696752) {
        goto LABEL_15;
      }
    }
    else if (PixelFormatType != 875704422 && PixelFormatType != 875704438)
    {
      goto LABEL_15;
    }
    CVPixelBufferLockBaseAddress(a8, 1uLL);
    size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a8, 0);
    size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a8, 0);
    if (CVPixelBufferGetBytesPerRowOfPlane(a8, 0) == WidthOfPlane)
    {
      BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a8, 0);
      space = CGColorSpaceCreateDeviceGray();
      context = CGBitmapContextCreate(BaseAddressOfPlane, WidthOfPlane, HeightOfPlane, 8uLL, WidthOfPlane, space, 0);
      Image = CGBitmapContextCreateImage(context);
      v42 = [MEMORY[0x263EFF990] data];
      uint64_t v107 = *MEMORY[0x263F0F4E0];
      uint64_t v105 = *MEMORY[0x263F0F4D8];
      v106 = &unk_26CBBA608;
      v43 = [NSDictionary dictionaryWithObjects:&v106 forKeys:&v105 count:1];
      v108[0] = v43;
      CFDictionaryRef v44 = [NSDictionary dictionaryWithObjects:v108 forKeys:&v107 count:1];

      v45 = [(id)*MEMORY[0x263F1DC08] identifier];
      v46 = CGImageDestinationCreateWithData(v42, v45, 1uLL, 0);

      CGImageDestinationAddImage(v46, Image, v44);
      if (CGImageDestinationFinalize(v46)) {
        v47 = v42;
      }
      else {
        v47 = 0;
      }
      CFRelease(v46);
      CGImageRelease(Image);
      CGContextRelease(context);
      CGColorSpaceRelease(space);

      CVPixelBufferUnlockBaseAddress(a8, 1uLL);
      if (v47)
      {
LABEL_23:
        imageData = v34->_imageData;
        v34->_imageData = (NSData *)v47;

        goto LABEL_24;
      }
    }
    else
    {
      CVPixelBufferUnlockBaseAddress(a8, 1uLL);
    }
LABEL_15:
    uint64_t v101 = 0;
    v102 = &v101;
    uint64_t v103 = 0x2050000000;
    v48 = (void *)_MergedGlobals_0;
    uint64_t v104 = _MergedGlobals_0;
    if (!_MergedGlobals_0)
    {
      *(void *)&long long v92 = MEMORY[0x263EF8330];
      *((void *)&v92 + 1) = 3221225472;
      *(void *)&long long v93 = __getCIImageClass_block_invoke;
      *((void *)&v93 + 1) = &unk_2643B9F00;
      *(void *)&long long v94 = &v101;
      __getCIImageClass_block_invoke((uint64_t)&v92);
      v48 = (void *)v102[3];
    }
    v49 = v48;
    _Block_object_dispose(&v101, 8);
    v50 = (void *)[[v49 alloc] initWithCVPixelBuffer:a8];
    uint64_t v101 = 0;
    v102 = &v101;
    uint64_t v103 = 0x2050000000;
    v51 = (void *)qword_26AC37558;
    uint64_t v104 = qword_26AC37558;
    if (!qword_26AC37558)
    {
      *(void *)&long long v92 = MEMORY[0x263EF8330];
      *((void *)&v92 + 1) = 3221225472;
      *(void *)&long long v93 = __getCIContextClass_block_invoke;
      *((void *)&v93 + 1) = &unk_2643B9F00;
      *(void *)&long long v94 = &v101;
      __getCIContextClass_block_invoke((uint64_t)&v92);
      v51 = (void *)v102[3];
    }
    id v52 = v51;
    _Block_object_dispose(&v101, 8);
    v53 = [v52 context];
    [v50 extent];
    v54 = (CGImage *)objc_msgSend(v53, "createCGImage:fromRect:", v50);

    v55 = [MEMORY[0x263EFF990] data];
    v56 = [(id)*MEMORY[0x263F1DC08] identifier];
    v57 = CGImageDestinationCreateWithData(v55, v56, 1uLL, 0);

    CGImageDestinationAddImage(v57, v54, 0);
    if (CGImageDestinationFinalize(v57)) {
      v47 = v55;
    }
    else {
      v47 = 0;
    }
    CFRelease(v57);
    CGImageRelease(v54);

    goto LABEL_23;
  }
LABEL_24:
  *((void *)&v59 + 1) = *((void *)&a19 + 1);
  *((void *)&v60 + 1) = *((void *)&a20 + 1);
  *((void *)&v61 + 1) = *((void *)&a21 + 1);
  v34->_monotonicTimestamp = a2;
  v34->_timestamp = a3;
  v34->_duration = a4;
  long long v62 = *a9;
  long long v63 = a9[1];
  *(void *)&v34->_location.type = *((void *)a9 + 4);
  *(_OWORD *)v34->_location.pos_geoc = v62;
  *(_OWORD *)&v34->_location.pos_geoc[2] = v63;
  v34->_heading.trueHeading = a5;
  v34->_heading.accuracy = a6;
  *(_OWORD *)v34->_gravity = v90;
  *(_OWORD *)&v34->_gravity[16] = v89;
  *(_OWORD *)v34->_anon_90 = a17;
  *(_OWORD *)&v34->_anon_90[16] = a18;
  *(_OWORD *)&v34->_anon_90[32] = a19;
  *(_OWORD *)&v34->_anon_90[48] = a20;
  *(_OWORD *)v34->_anon_d0 = a21;
  *(_OWORD *)&v34->_anon_d0[16] = a22;
  *(_OWORD *)&v34->_anon_d0[32] = a23;
  *(void *)v34->_radialDistortion = a24;
  v34->_exposureTargetOffset = a25;
  v34->_resultStatus = a13;
  if (a12)
  {
    v64 = [[_VLStatistics alloc] initWithStats:a12];
    statistics = v34->_statistics;
    v34->_statistics = v64;
  }
  v34->_hasResultPose = a26 != 0;
  if (a26)
  {
    *(void *)&long long v66 = *(void *)a26;
    *(void *)&long long v67 = *(void *)(a26 + 8);
    *(void *)&long long v68 = *(void *)(a26 + 16);
    long long v69 = *(_OWORD *)(a26 + 72);
    *((void *)&v66 + 1) = *(void *)(a26 + 24);
    *((void *)&v67 + 1) = *(void *)(a26 + 32);
    *(void *)&long long v59 = *(void *)(a26 + 48);
    *(void *)&long long v60 = *(void *)(a26 + 56);
    *((void *)&v68 + 1) = *(void *)(a26 + 40);
    *(void *)&long long v61 = *(void *)(a26 + 64);
    __asm { FMOV            V7.2D, #1.0 }
    *(void *)&_Q7 = *(void *)(a26 + 88);
    *(_OWORD *)v34->_anon_130 = v66;
    *(_OWORD *)&v34->_anon_130[16] = v59;
    *(_OWORD *)&v34->_anon_130[32] = v67;
    *(_OWORD *)&v34->_anon_130[48] = v60;
    *(_OWORD *)&v34->_anon_130[64] = v68;
    *(_OWORD *)&v34->_anon_130[80] = v61;
    *(_OWORD *)&v34->_anon_130[96] = v69;
    *(_OWORD *)&v34->_anon_130[112] = _Q7;
    *(void *)&long long v67 = *(void *)(a26 + 88);
    *(_OWORD *)v34->_anon_1b0 = *(_OWORD *)(a26 + 72);
    *(_OWORD *)&v34->_anon_1b0[16] = v67;
    *(void *)&v34->_anon_1b0[32] = 0xBFF0000000000000;
    v34->_resultConfidence = *(float *)(a26 + 96);
    v34->_resultCovariance.v[0][0] = *(float *)(a26 + 100);
    v34->_resultCovariance.v[0][1] = *(float *)(a26 + 104);
    v34->_resultCovariance.v[0][2] = *(float *)(a26 + 108);
    v34->_resultCovariance.v[0][3] = *(float *)(a26 + 112);
    v34->_resultCovariance.v[0][4] = *(float *)(a26 + 116);
    v34->_resultCovariance.v[0][5] = *(float *)(a26 + 120);
    v34->_resultCovariance.v[1][0] = *(float *)(a26 + 124);
    v34->_resultCovariance.v[1][1] = *(float *)(a26 + 128);
    v34->_resultCovariance.v[1][2] = *(float *)(a26 + 132);
    v34->_resultCovariance.v[1][3] = *(float *)(a26 + 136);
    v34->_resultCovariance.v[1][4] = *(float *)(a26 + 140);
    v34->_resultCovariance.v[1][5] = *(float *)(a26 + 144);
    v34->_resultCovariance.v[2][0] = *(float *)(a26 + 148);
    v34->_resultCovariance.v[2][1] = *(float *)(a26 + 152);
    v34->_resultCovariance.v[2][2] = *(float *)(a26 + 156);
    v34->_resultCovariance.v[2][3] = *(float *)(a26 + 160);
    v34->_resultCovariance.v[2][4] = *(float *)(a26 + 164);
    v34->_resultCovariance.v[2][5] = *(float *)(a26 + 168);
    v34->_resultCovariance.v[3][0] = *(float *)(a26 + 172);
    v34->_resultCovariance.v[3][1] = *(float *)(a26 + 176);
    v34->_resultCovariance.v[3][2] = *(float *)(a26 + 180);
    v34->_resultCovariance.v[3][3] = *(float *)(a26 + 184);
    v34->_resultCovariance.v[3][4] = *(float *)(a26 + 188);
    v34->_resultCovariance.v[3][5] = *(float *)(a26 + 192);
    v34->_resultCovariance.v[4][0] = *(float *)(a26 + 196);
    v34->_resultCovariance.v[4][1] = *(float *)(a26 + 200);
    v34->_resultCovariance.v[4][2] = *(float *)(a26 + 204);
    v34->_resultCovariance.v[4][3] = *(float *)(a26 + 208);
    v34->_resultCovariance.v[4][4] = *(float *)(a26 + 212);
    v34->_resultCovariance.v[4][5] = *(float *)(a26 + 216);
    v34->_resultCovariance.v[5][0] = *(float *)(a26 + 220);
    v34->_resultCovariance.v[5][1] = *(float *)(a26 + 224);
    v34->_resultCovariance.v[5][2] = *(float *)(a26 + 228);
    v34->_resultCovariance.v[5][3] = *(float *)(a26 + 232);
    v34->_resultCovariance.v[5][4] = *(float *)(a26 + 236);
    v34->_resultCovariance.v[5][5] = *(float *)(a26 + 240);
  }
  uint64_t v75 = [objc_alloc(MEMORY[0x263F41CB8]) initWithCLLocation:v33 location:a9 heading:a5];
  analyticsLocation = v34->_analyticsLocation;
  v34->_analyticsLocation = (GEOVLFLocation *)v75;

  if (v34->_statistics && v34->_hasResultPose)
  {
    v77 = [VLLocalizationCrowdsourcingDetails alloc];
    v78 = v34->_statistics;
    long long v79 = *(_OWORD *)&v34->_anon_130[80];
    long long v96 = *(_OWORD *)&v34->_anon_130[64];
    long long v97 = v79;
    long long v80 = *(_OWORD *)&v34->_anon_130[112];
    long long v98 = *(_OWORD *)&v34->_anon_130[96];
    long long v99 = v80;
    long long v81 = *(_OWORD *)&v34->_anon_130[16];
    long long v92 = *(_OWORD *)v34->_anon_130;
    long long v93 = v81;
    long long v82 = *(_OWORD *)&v34->_anon_130[48];
    long long v94 = *(_OWORD *)&v34->_anon_130[32];
    long long v95 = v82;
    uint64_t v83 = [(VLLocalizationCrowdsourcingDetails *)v77 initWithStats:v78 resultTransform:&v92];
    crowdsourcingDetails = v34->_crowdsourcingDetails;
    v34->_crowdsourcingDetails = (VLLocalizationCrowdsourcingDetails *)v83;
  }
  v85 = v34;
LABEL_32:

  return v34;
}

- (VLLocalizationDebugInfo)initWithCoder:(id)a3
{
  v78[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v72.receiver = self;
  v72.super_class = (Class)VLLocalizationDebugInfo;
  v5 = [(VLLocalizationDebugInfo *)&v72 init];
  if (!v5) {
    goto LABEL_19;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  identifier = v5->_identifier;
  v5->_identifier = (NSUUID *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
  imageData = v5->_imageData;
  v5->_imageData = (NSData *)v8;

  [v4 decodeDoubleForKey:@"monotonicTimestamp"];
  v5->_monotonicTimestamp = v10;
  [v4 decodeDoubleForKey:@"timestamp"];
  v5->_timestamp = v11;
  [v4 decodeDoubleForKey:@"duration"];
  v5->_duration = v12;
  [v4 decodeDoubleForKey:@"location_x"];
  v5->_location.pos_geoc[0] = v13;
  [v4 decodeDoubleForKey:@"location_y"];
  v5->_location.pos_geoc[1] = v14;
  [v4 decodeDoubleForKey:@"location_z"];
  v5->_location.pos_geoc[2] = v15;
  [v4 decodeFloatForKey:@"location_accuracy"];
  v5->_location.horz_accuracy = v16;
  v5->_location.is_vl_fused = [v4 decodeIntForKey:@"location_fused"];
  v5->_location.type = [v4 decodeIntForKey:@"location_type"];
  uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"full_location"];
  analyticsLocation = v5->_analyticsLocation;
  v5->_analyticsLocation = (GEOVLFLocation *)v17;

  [v4 decodeDoubleForKey:@"heading"];
  v5->_heading.trueHeading = v19;
  [v4 decodeDoubleForKey:@"heading_accuracy"];
  v5->_heading.accuracy = v20;
  [v4 decodeDoubleForKey:@"gravity_x"];
  uint64_t v66 = v21;
  [v4 decodeDoubleForKey:@"gravity_y"];
  uint64_t v64 = v22;
  [v4 decodeDoubleForKey:@"gravity_z"];
  *(void *)&long long v23 = v66;
  *((void *)&v23 + 1) = v64;
  *(_OWORD *)v5->_gravity = v23;
  *(_OWORD *)&v5->_gravity[16] = v24;
  uint64_t v71 = 0;
  id v25 = v4;
  v26 = (_OWORD *)[v25 decodeBytesForKey:@"transform" returnedLength:&v71];
  if (!v26 || v71 != 64)
  {
    v56 = (void *)MEMORY[0x263F087E8];
    uint64_t v57 = *MEMORY[0x263F07F70];
    uint64_t v77 = *MEMORY[0x263EFFC40];
    v78[0] = @"transform bytes were not the expected length";
    v58 = NSDictionary;
    long long v59 = (__CFString **)v78;
    long long v60 = &v77;
LABEL_18:
    long long v61 = [v58 dictionaryWithObjects:v59 forKeys:v60 count:1];
    long long v62 = [v56 errorWithDomain:v57 code:4864 userInfo:v61];
    [v25 failWithError:v62];

LABEL_19:
    v55 = 0;
    goto LABEL_20;
  }
  long long v27 = v26[1];
  long long v28 = v26[2];
  long long v29 = v26[3];
  *(_OWORD *)v5->_anon_90 = *v26;
  *(_OWORD *)&v5->_anon_90[16] = v27;
  *(_OWORD *)&v5->_anon_90[32] = v28;
  *(_OWORD *)&v5->_anon_90[48] = v29;
  uint64_t v70 = 0;
  id v25 = v25;
  uint64_t v30 = [v25 decodeBytesForKey:@"camera_intrinsics" returnedLength:&v70];
  if (!v30 || v70 != 36)
  {
    v56 = (void *)MEMORY[0x263F087E8];
    uint64_t v57 = *MEMORY[0x263F07F70];
    uint64_t v75 = *MEMORY[0x263EFFC40];
    v76 = @"cameraIntrinsics bytes were not the expected length";
    v58 = NSDictionary;
    long long v59 = &v76;
    long long v60 = &v75;
    goto LABEL_18;
  }
  uint64_t v31 = *(void *)v30;
  uint64_t v32 = *(void *)(v30 + 12);
  int v33 = *(_DWORD *)(v30 + 20);
  uint64_t v34 = *(void *)(v30 + 24);
  int v35 = *(_DWORD *)(v30 + 32);
  *(_DWORD *)&v5->_anon_d0[8] = *(_DWORD *)(v30 + 8);
  *(void *)v5->_anon_d0 = v31;
  *(_DWORD *)&v5->_anon_d0[24] = v33;
  *(void *)&v5->_anon_d0[16] = v32;
  *(_DWORD *)&v5->_anon_d0[40] = v35;
  *(void *)&v5->_anon_d0[32] = v34;
  uint64_t v69 = 0;
  id v25 = v25;
  v36 = (void *)[v25 decodeBytesForKey:@"radial_distortion" returnedLength:&v69];
  if (!v36 || v69 != 8)
  {
    v56 = (void *)MEMORY[0x263F087E8];
    uint64_t v57 = *MEMORY[0x263F07F70];
    uint64_t v73 = *MEMORY[0x263EFFC40];
    v74 = @"radialDistortion bytes were not the expected length";
    v58 = NSDictionary;
    long long v59 = &v74;
    long long v60 = &v73;
    goto LABEL_18;
  }
  *(void *)v5->_radialDistortion = *v36;
  [v25 decodeDoubleForKey:@"exposure_target_offset"];
  v5->_exposureTargetOffset = v37;
  v5->_resultStatus = [v25 decodeIntegerForKey:@"status"];
  uint64_t v38 = [v25 decodeObjectOfClass:objc_opt_class() forKey:@"statistics"];
  statistics = v5->_statistics;
  v5->_statistics = (_VLStatistics *)v38;

  int v40 = [v25 containsValueForKey:@"result_transform"];
  v5->_hasResultPose = v40;
  if (v40)
  {
    [v25 decodeDoubleForKey:@"result_location_x"];
    uint64_t v67 = v41;
    [v25 decodeDoubleForKey:@"result_location_y"];
    uint64_t v65 = v42;
    [v25 decodeDoubleForKey:@"result_location_z"];
    *(void *)&long long v43 = v67;
    *((void *)&v43 + 1) = v65;
    *(_OWORD *)v5->_anon_1b0 = v43;
    *(_OWORD *)&v5->_anon_1b0[16] = v44;
    [v25 decodeDoubleForKey:@"result_location_accuracy"];
    *(void *)&v5->_anon_1b0[32] = v45;
    if (!objc_msgSend(v25, "_vl_decodeSimdDouble4x4:forKey:", v5->_anon_130, @"result_transform")) {
      goto LABEL_19;
    }
    [v25 decodeFloatForKey:@"result_confidence"];
    v5->_resultConfidence = v46;
    if (!objc_msgSend(v25, "_vl_decodeFloat6x6:forKey:", &v5->_resultCovariance, @"result_covariance"))goto LABEL_19; {
  }
    }
  if (v5->_statistics && v5->_hasResultPose)
  {
    v47 = [VLLocalizationCrowdsourcingDetails alloc];
    v48 = v5->_statistics;
    long long v49 = *(_OWORD *)&v5->_anon_130[80];
    v68[4] = *(_OWORD *)&v5->_anon_130[64];
    v68[5] = v49;
    long long v50 = *(_OWORD *)&v5->_anon_130[112];
    v68[6] = *(_OWORD *)&v5->_anon_130[96];
    v68[7] = v50;
    long long v51 = *(_OWORD *)&v5->_anon_130[16];
    v68[0] = *(_OWORD *)v5->_anon_130;
    v68[1] = v51;
    long long v52 = *(_OWORD *)&v5->_anon_130[48];
    v68[2] = *(_OWORD *)&v5->_anon_130[32];
    v68[3] = v52;
    uint64_t v53 = [(VLLocalizationCrowdsourcingDetails *)v47 initWithStats:v48 resultTransform:v68];
    crowdsourcingDetails = v5->_crowdsourcingDetails;
    v5->_crowdsourcingDetails = (VLLocalizationCrowdsourcingDetails *)v53;
  }
  v55 = v5;
LABEL_20:

  return v55;
}

- (unint64_t)inliersCount
{
  unint64_t result = (unint64_t)self->_statistics;
  if (result)
  {
    uint64_t v3 = [(id)result stats];
    return *(_DWORD *)(v3 + 88) & ~(*(int *)(v3 + 88) >> 31);
  }
  return result;
}

- (int)_inlierIndices
{
  unint64_t result = (int *)self->_statistics;
  if (result) {
    return *(int **)([result stats] + 16);
  }
  return result;
}

- (float)points2D
{
  unint64_t result = (float *)self->_statistics;
  if (result) {
    return *(float **)([result stats] + 8);
  }
  return result;
}

- (double)points3D
{
  unint64_t result = (double *)self->_statistics;
  if (result) {
    return *(double **)[result stats];
  }
  return result;
}

- (unint64_t)_solutionsCount
{
  unint64_t result = (unint64_t)self->_statistics;
  if (result)
  {
    uint64_t v3 = [(id)result stats];
    return *(_DWORD *)(v3 + 80) & ~(*(int *)(v3 + 80) >> 31);
  }
  return result;
}

- (float)_solverConfidences
{
  unint64_t result = (float *)self->_statistics;
  if (result) {
    return *(float **)([result stats] + 64);
  }
  return result;
}

- (float)_fusedConfidences
{
  unint64_t result = (float *)self->_statistics;
  if (result) {
    return *(float **)([result stats] + 72);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 encodeObject:self->_identifier forKey:@"uuid"];
  imageData = self->_imageData;
  if (imageData) {
    [v4 encodeObject:imageData forKey:@"image"];
  }
  [v4 encodeDouble:@"monotonicTimestamp" forKey:self->_monotonicTimestamp];
  [v4 encodeDouble:@"timestamp" forKey:self->_timestamp];
  [v4 encodeDouble:@"duration" forKey:self->_duration];
  [v4 encodeDouble:@"location_x" forKey:self->_location.pos_geoc[0]];
  [v4 encodeDouble:@"location_y" forKey:self->_location.pos_geoc[1]];
  [v4 encodeDouble:@"location_z" forKey:self->_location.pos_geoc[2]];
  *(float *)&double v6 = self->_location.horz_accuracy;
  [v4 encodeFloat:@"location_accuracy" forKey:v6];
  [v4 encodeInt:self->_location.is_vl_fused forKey:@"location_fused"];
  [v4 encodeInt:self->_location.type forKey:@"location_type"];
  [v4 encodeObject:self->_analyticsLocation forKey:@"full_location"];
  [v4 encodeDouble:@"heading" forKey:self->_heading.trueHeading];
  [v4 encodeDouble:@"heading_accuracy" forKey:self->_heading.accuracy];
  [v4 encodeDouble:@"gravity_x" forKey:*(double *)self->_gravity];
  [v4 encodeDouble:@"gravity_y" forKey:*(double *)&self->_gravity[8]];
  [v4 encodeDouble:@"gravity_z" forKey:*(double *)&self->_gravity[16]];
  long long v7 = *(_OWORD *)&self->_anon_90[16];
  v34[0] = *(_OWORD *)self->_anon_90;
  v34[1] = v7;
  long long v8 = *(_OWORD *)&self->_anon_90[48];
  v34[2] = *(_OWORD *)&self->_anon_90[32];
  v34[3] = v8;
  [v4 encodeBytes:v34 length:64 forKey:@"transform"];
  long long v9 = *(_OWORD *)self->_anon_d0;
  HIDWORD(v9) = *(_OWORD *)&self->_anon_d0[16];
  int8x16_t v10 = *(int8x16_t *)&self->_anon_d0[32];
  int8x16_t v11 = vextq_s8(vextq_s8(*(int8x16_t *)&self->_anon_d0[16], *(int8x16_t *)&self->_anon_d0[16], 0xCuLL), v10, 8uLL);
  v32[0] = v9;
  v32[1] = v11;
  __int32 v33 = v10.i32[2];
  [v4 encodeBytes:v32 length:36 forKey:@"camera_intrinsics"];
  uint64_t v31 = *(void *)self->_radialDistortion;
  [v4 encodeBytes:&v31 length:8 forKey:@"radial_distortion"];
  [v4 encodeDouble:@"exposure_target_offset" forKey:self->_exposureTargetOffset];
  statistics = self->_statistics;
  if (statistics) {
    [v4 encodeObject:statistics forKey:@"statistics"];
  }
  if (self->_hasResultPose)
  {
    [v4 encodeDouble:@"result_location_x" forKey:*(double *)self->_anon_1b0];
    [v4 encodeDouble:@"result_location_y" forKey:*(double *)&self->_anon_1b0[8]];
    [v4 encodeDouble:@"result_location_z" forKey:*(double *)&self->_anon_1b0[16]];
    [v4 encodeDouble:@"result_location_accuracy" forKey:*(double *)&self->_anon_1b0[32]];
    long long v13 = *(_OWORD *)&self->_anon_130[80];
    long long v26 = *(_OWORD *)&self->_anon_130[64];
    long long v27 = v13;
    long long v14 = *(_OWORD *)&self->_anon_130[112];
    long long v28 = *(_OWORD *)&self->_anon_130[96];
    long long v29 = v14;
    long long v15 = *(_OWORD *)&self->_anon_130[16];
    long long v22 = *(_OWORD *)self->_anon_130;
    long long v23 = v15;
    long long v16 = *(_OWORD *)&self->_anon_130[48];
    long long v24 = *(_OWORD *)&self->_anon_130[32];
    long long v25 = v16;
    objc_msgSend(v4, "_vl_encodeSimdDouble4x4:forKey:", &v22, @"result_transform");
    *(float *)&double v17 = self->_resultConfidence;
    [v4 encodeFloat:@"result_confidence" forKey:v17];
    long long v18 = *(_OWORD *)&self->_resultCovariance.v[4][4];
    long long v28 = *(_OWORD *)&self->_resultCovariance.v[4][0];
    long long v29 = v18;
    long long v30 = *(_OWORD *)&self->_resultCovariance.v[5][2];
    long long v19 = *(_OWORD *)&self->_resultCovariance.v[2][0];
    long long v24 = *(_OWORD *)&self->_resultCovariance.v[1][2];
    long long v25 = v19;
    long long v20 = *(_OWORD *)&self->_resultCovariance.v[3][2];
    long long v26 = *(_OWORD *)&self->_resultCovariance.v[2][4];
    long long v27 = v20;
    long long v21 = *(_OWORD *)&self->_resultCovariance.v[0][4];
    long long v22 = *(_OWORD *)&self->_resultCovariance.v[0][0];
    long long v23 = v21;
    objc_msgSend(v4, "_vl_encodeFloat6x6:forKey:", &v22, @"result_covariance");
  }
  [v4 encodeInteger:self->_resultStatus forKey:@"status"];
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VLLocalizationDebugInfo *)a3;
  v5 = v4;
  if (v4 == self)
  {

    return 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v6 = [(NSUUID *)self->_identifier isEqual:v5->_identifier];

      return v6;
    }
    else
    {

      return 0;
    }
  }
}

- (id)inputParameters
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [NSNumber numberWithDouble:self->_timestamp];
  [v3 setObject:v4 forKeyedSubscript:@"timestamp"];

  v5 = (void *)MGCopyAnswer();
  [v3 setObject:v5 forKeyedSubscript:@"device_name"];

  v89[0] = @"K";
  LODWORD(v6) = *(_DWORD *)self->_anon_d0;
  __ya = [NSNumber numberWithFloat:v6];
  v88[0] = __ya;
  LODWORD(v7) = *(_DWORD *)&self->_anon_d0[16];
  objc_super v72 = [NSNumber numberWithFloat:v7];
  v88[1] = v72;
  LODWORD(v8) = *(_DWORD *)&self->_anon_d0[32];
  uint64_t v69 = [NSNumber numberWithFloat:v8];
  v88[2] = v69;
  LODWORD(v9) = *(_DWORD *)&self->_anon_d0[4];
  uint64_t v67 = [NSNumber numberWithFloat:v9];
  v88[3] = v67;
  LODWORD(v10) = *(_DWORD *)&self->_anon_d0[20];
  uint64_t v66 = [NSNumber numberWithFloat:v10];
  v88[4] = v66;
  LODWORD(v11) = *(_DWORD *)&self->_anon_d0[36];
  uint64_t v65 = [NSNumber numberWithFloat:v11];
  v88[5] = v65;
  LODWORD(v12) = *(_DWORD *)&self->_anon_d0[8];
  uint64_t v64 = [NSNumber numberWithFloat:v12];
  v88[6] = v64;
  LODWORD(v13) = *(_DWORD *)&self->_anon_d0[24];
  long long v14 = [NSNumber numberWithFloat:v13];
  v88[7] = v14;
  LODWORD(v15) = *(_DWORD *)&self->_anon_d0[40];
  long long v16 = [NSNumber numberWithFloat:v15];
  v88[8] = v16;
  double v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v88 count:9];
  v89[1] = @"radial";
  v90[0] = v17;
  long long v18 = [NSNumber numberWithFloat:*(double *)self->_radialDistortion];
  v87[0] = v18;
  LODWORD(v19) = *(_DWORD *)&self->_radialDistortion[4];
  long long v20 = [NSNumber numberWithFloat:v19];
  v87[1] = v20;
  long long v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:2];
  v90[1] = v21;
  long long v22 = [NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:2];
  [v3 setObject:v22 forKeyedSubscript:@"lens"];

  long long v23 = [NSNumber numberWithDouble:self->_exposureTargetOffset];
  [v3 setObject:v23 forKeyedSubscript:@"exposure_target_offset"];

  double v25 = self->_location.pos_geoc[0];
  double v24 = self->_location.pos_geoc[1];
  double v26 = sqrt(v24 * v24 + v25 * v25);
  double v27 = v26 * 0.99330562;
  double v28 = 0.0;
  double v29 = 1.57079633;
  uint64_t v71 = v3;
  if (v26 * 0.99330562 != 0.0)
  {
    double v68 = self->_location.pos_geoc[1];
    unsigned int v30 = 0;
    long double __y = self->_location.pos_geoc[2];
    double v29 = 0.0;
    double v31 = 0.0;
    do
    {
      double v33 = v29;
      double v29 = atan2(__y, v27);
      __double2 v34 = __sincos_stret(v29);
      double v35 = 6378137.0 / sqrt(v34.__sinval * -0.00669437999 * v34.__sinval + 1.0);
      double v28 = v26 / v34.__cosval - v35;
      if (vabdd_f64(v33, v29) < 0.000001)
      {
        if (vabdd_f64(v31, v28) < 0.001 || v30 >= 9) {
          goto LABEL_12;
        }
      }
      else if (v30 > 8)
      {
        goto LABEL_12;
      }
      ++v30;
      double v27 = v26 * (v35 / (v35 + v28) * -0.00669437999 + 1.0);
      double v31 = v26 / v34.__cosval - v35;
    }
    while (v27 != 0.0);
    double v29 = 1.57079633;
LABEL_12:
    double v24 = v68;
  }
  long double v36 = atan2(v24, v25) / 0.0174532925;
  v85[0] = @"pos_geoc";
  v83[0] = @"x";
  __yb = [NSNumber numberWithDouble:v25];
  v84[0] = __yb;
  v83[1] = @"y";
  uint64_t v73 = [NSNumber numberWithDouble:self->_location.pos_geoc[1]];
  v84[1] = v73;
  v83[2] = @"z";
  uint64_t v70 = [NSNumber numberWithDouble:self->_location.pos_geoc[2]];
  v84[2] = v70;
  double v37 = [NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:3];
  v86[0] = v37;
  v85[1] = @"lat";
  uint64_t v38 = [NSNumber numberWithDouble:v29 / 0.0174532925];
  v86[1] = v38;
  v85[2] = @"lon";
  v39 = [NSNumber numberWithDouble:(double)v36];
  v86[2] = v39;
  v85[3] = @"alt";
  int v40 = [NSNumber numberWithDouble:v28];
  v86[3] = v40;
  v85[4] = @"horz_accuracy";
  *(float *)&double v41 = self->_location.horz_accuracy;
  uint64_t v42 = [NSNumber numberWithFloat:v41];
  v86[4] = v42;
  v85[5] = @"is_vl_fused";
  long long v43 = [NSNumber numberWithInt:self->_location.is_vl_fused];
  v86[5] = v43;
  v85[6] = @"type";
  long long v44 = [NSNumber numberWithUnsignedInt:self->_location.type];
  v86[6] = v44;
  uint64_t v45 = [NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:7];
  [v71 setObject:v45 forKeyedSubscript:@"gps"];

  v81[0] = @"grav";
  float v46 = [NSNumber numberWithDouble:*(double *)self->_gravity];
  v80[0] = v46;
  v47 = [NSNumber numberWithDouble:*(double *)&self->_gravity[8]];
  v80[1] = v47;
  v48 = [NSNumber numberWithDouble:*(double *)&self->_gravity[16]];
  v80[2] = v48;
  long long v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:3];
  v82[0] = v49;
  v81[1] = @"true_heading";
  long long v50 = objc_msgSend(NSNumber, "numberWithDouble:", self->_heading.trueHeading, -1.0);
  v82[1] = v50;
  v81[2] = @"heading_accuracy";
  long long v51 = [NSNumber numberWithDouble:self->_heading.accuracy];
  v82[2] = v51;
  long long v52 = [NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:3];
  [v71 setObject:v52 forKeyedSubscript:@"ori"];

  v78 = @"pose";
  int8x16_t v53 = *(int8x16_t *)self->_anon_90;
  int8x16_t v54 = *(int8x16_t *)&self->_anon_90[16];
  long long v55 = *(_OWORD *)&self->_anon_90[32];
  long long __yc = *(_OWORD *)&self->_anon_90[48];
  v95[0] = *(float *)v53.i32;
  v95[1] = *(float *)v54.i32;
  float32x2_t v56 = (float32x2_t)vzip2_s32(*(int32x2_t *)v54.i8, *(int32x2_t *)&v55);
  DWORD1(v55) = v53.i32[1];
  float64x2_t v96 = vcvtq_f64_f32(*(float32x2_t *)&v55);
  float64x2_t v97 = vcvtq_f64_f32(v56);
  float64x2_t v98 = vcvtq_f64_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(v53, v53, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(v54, v54, 8uLL)));
  double v99 = *((float *)&v55 + 2);
  uint64_t v57 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v95 length:72 freeWhenDone:0];
  v58 = [v57 base64EncodedStringWithOptions:0];

  float64x2_t v93 = vcvtq_f64_f32(*(float32x2_t *)&__yc);
  double v94 = *((float *)&__yc + 2);
  long long v59 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:&v93 length:24 freeWhenDone:0];
  long long v60 = [v59 base64EncodedStringWithOptions:0];

  v91[0] = @"R";
  v91[1] = @"t";
  v92[0] = v58;
  v92[1] = v60;
  long long v61 = [NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:2];

  long long v79 = v61;
  long long v62 = [NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
  [v71 setObject:v62 forKeyedSubscript:@"vio"];

  return v71;
}

- (id)results
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_resultStatus];
  [v3 setObject:v4 forKeyedSubscript:@"status"];

  v5 = [NSNumber numberWithDouble:self->_duration];
  [v3 setObject:v5 forKeyedSubscript:@"duration"];

  if (self->_statistics)
  {
    double v6 = [MEMORY[0x263EFF9A0] dictionary];
    double v7 = objc_msgSend(NSNumber, "numberWithInt:", -[_VLStatistics stats](self->_statistics, "stats")[88]);
    [v6 setObject:v7 forKeyedSubscript:@"num_inliers"];

    if ((int)[(_VLStatistics *)self->_statistics stats][88] >= 1)
    {
      double v8 = (void *)MEMORY[0x263EFF8F8];
      uint64_t v9 = (uint64_t)[(_VLStatistics *)self->_statistics stats][8];
      double v10 = [(_VLStatistics *)self->_statistics stats];
      double v11 = [v8 dataWithBytesNoCopy:v9 length:8 * (v10->var12 & ~(v10->var12 >> 31)) freeWhenDone:0];
      double v12 = [v11 base64EncodedStringWithOptions:0];

      [v6 setObject:v12 forKeyedSubscript:@"points2D"];
      double v13 = (void *)MEMORY[0x263EFF8F8];
      uint64_t v14 = *(void *)[(_VLStatistics *)self->_statistics stats];
      double v15 = [(_VLStatistics *)self->_statistics stats];
      long long v16 = [v13 dataWithBytesNoCopy:v14 length:24 * (v15->var12 & ~(v15->var12 >> 31)) freeWhenDone:0];
      double v17 = [v16 base64EncodedStringWithOptions:0];

      [v6 setObject:v17 forKeyedSubscript:@"points3D"];
    }
    long long v18 = objc_msgSend(NSNumber, "numberWithInt:", -[_VLStatistics stats](self->_statistics, "stats")[92]);
    [v6 setObject:v18 forKeyedSubscript:@"num_keypoints"];

    double v19 = objc_msgSend(NSNumber, "numberWithInt:", -[_VLStatistics stats](self->_statistics, "stats")[96]);
    [v6 setObject:v19 forKeyedSubscript:@"num_tracks"];

    long long v20 = objc_msgSend(NSNumber, "numberWithInt:", -[_VLStatistics stats](self->_statistics, "stats")[100]);
    [v6 setObject:v20 forKeyedSubscript:@"num_matches"];

    long long v21 = objc_msgSend(NSNumber, "numberWithInt:", -[_VLStatistics stats](self->_statistics, "stats")[56]);
    [v6 setObject:v21 forKeyedSubscript:@"status_ps"];

    if ((int)[(_VLStatistics *)self->_statistics stats][136] >= 1)
    {
      uint64_t v22 = (uint64_t)[(_VLStatistics *)self->_statistics stats][104];
      uint64_t v23 = v22 + 16 * (int)[(_VLStatistics *)self->_statistics stats][136];
      uint64_t v24 = *(unsigned int *)(v23 - 16);
      uint64_t v25 = *(unsigned int *)(v23 - 12);
      uint64_t v27 = *(unsigned int *)(v23 - 8);
      uint64_t v26 = *(unsigned int *)(v23 - 4);
      double v28 = [MEMORY[0x263EFF9A0] dictionary];
      double v29 = [NSNumber numberWithInt:v25];
      [v28 setObject:v29 forKeyedSubscript:@"x"];

      unsigned int v30 = [NSNumber numberWithInt:v27];
      [v28 setObject:v30 forKeyedSubscript:@"y"];

      double v31 = [NSNumber numberWithInt:v24];
      [v28 setObject:v31 forKeyedSubscript:@"level"];

      uint64_t v32 = [NSNumber numberWithInt:v26];
      [v28 setObject:v32 forKeyedSubscript:@"uncertainty"];

      [v6 setObject:v28 forKeyedSubscript:@"tile"];
    }
    double v33 = objc_msgSend(NSNumber, "numberWithLongLong:", (void)-[_VLStatistics stats](self->_statistics, "stats")[488]);
    [v6 setObject:v33 forKeyedSubscript:@"tracks_file_size"];

    [v3 setObject:v6 forKeyedSubscript:@"statistics"];
  }
  if (self->_hasResultPose)
  {
    int64x2_t v34 = *(int64x2_t *)&self->_anon_130[16];
    int64x2_t v36 = *(int64x2_t *)&self->_anon_130[32];
    int64x2_t v35 = *(int64x2_t *)&self->_anon_130[48];
    int64x2_t v37 = *(int64x2_t *)&self->_anon_130[64];
    uint64_t v38 = *(void *)&self->_anon_130[80];
    uint64_t v39 = *(void *)&self->_anon_130[112];
    int64x2_t v40 = vzip1q_s64(*(int64x2_t *)self->_anon_130, v36);
    int64x2_t v41 = vzip2q_s64(v36, v37);
    v37.i64[1] = *(void *)&self->_anon_130[8];
    long long __ya = *(_OWORD *)&self->_anon_130[96];
    int64x2_t v88 = v40;
    int64x2_t v89 = v37;
    int64x2_t v90 = v41;
    int64x2_t v91 = vzip1q_s64(v34, v35);
    *(void *)&long long v92 = v38;
    uint64_t v42 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:&v88 length:72 freeWhenDone:0];
    long long v43 = [v42 base64EncodedStringWithOptions:0];

    long long v104 = __ya;
    uint64_t v105 = v39;
    long long v44 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:&v104 length:24 freeWhenDone:0];
    uint64_t v45 = [v44 base64EncodedStringWithOptions:0];

    v102[0] = @"R";
    v102[1] = @"t";
    v103[0] = v43;
    v103[1] = v45;
    float v46 = [NSDictionary dictionaryWithObjects:v103 forKeys:v102 count:2];

    [v3 setObject:v46 forKeyedSubscript:@"pose"];
    *(float *)&double v47 = self->_resultConfidence;
    v48 = [NSNumber numberWithFloat:v47];
    [v3 setObject:v48 forKeyedSubscript:@"confidence"];

    float64x2_t v49 = *(float64x2_t *)self->_anon_1b0;
    long double v50 = *(double *)&self->_anon_1b0[8];
    double v51 = sqrt(vmlad_n_f64(vmuld_lane_f64(v50, v49, 1), v49.f64[0], v49.f64[0]));
    double v52 = v51 * 0.99330562;
    double v53 = 0.0;
    double v54 = 1.57079633;
    double v83 = v49.f64[0];
    if (v51 * 0.99330562 != 0.0)
    {
      double v82 = *(double *)&self->_anon_1b0[8];
      unsigned int v55 = 0;
      long double __y = *(double *)&self->_anon_1b0[16];
      double v54 = 0.0;
      double v56 = 0.0;
      do
      {
        double v58 = v54;
        double v54 = atan2(__y, v52);
        __double2 v59 = __sincos_stret(v54);
        double v60 = 6378137.0 / sqrt(v59.__sinval * -0.00669437999 * v59.__sinval + 1.0);
        double v53 = v51 / v59.__cosval - v60;
        if (vabdd_f64(v58, v54) < 0.000001)
        {
          if (vabdd_f64(v56, v53) < 0.001 || v55 >= 9)
          {
LABEL_17:
            v49.f64[0] = v83;
            goto LABEL_19;
          }
        }
        else if (v55 > 8)
        {
          goto LABEL_17;
        }
        ++v55;
        double v52 = v51 * (v60 / (v60 + v53) * -0.00669437999 + 1.0);
        double v56 = v51 / v59.__cosval - v60;
      }
      while (v52 != 0.0);
      v49.f64[0] = v83;
      double v54 = 1.57079633;
LABEL_19:
      long double v50 = v82;
    }
    long double v61 = atan2(v50, v49.f64[0]) / 0.0174532925;
    v100[0] = @"pos_geoc";
    v98[0] = @"x";
    __yb = [NSNumber numberWithDouble:v83];
    v99[0] = __yb;
    v98[1] = @"y";
    v84 = [NSNumber numberWithDouble:*(double *)&self->_anon_1b0[8]];
    v99[1] = v84;
    v98[2] = @"z";
    long long v62 = [NSNumber numberWithDouble:*(double *)&self->_anon_1b0[16]];
    v99[2] = v62;
    long long v63 = [NSDictionary dictionaryWithObjects:v99 forKeys:v98 count:3];
    v101[0] = v63;
    v100[1] = @"lat";
    uint64_t v64 = [NSNumber numberWithDouble:v54 / 0.0174532925];
    v101[1] = v64;
    v100[2] = @"lon";
    uint64_t v65 = [NSNumber numberWithDouble:(double)v61];
    v101[2] = v65;
    v100[3] = @"alt";
    uint64_t v66 = [NSNumber numberWithDouble:v53];
    v101[3] = v66;
    uint64_t v67 = [NSDictionary dictionaryWithObjects:v101 forKeys:v100 count:4];
    [v3 setObject:v67 forKeyedSubscript:@"location"];

    float64x2_t v96 = @"heading";
    long long v68 = *(_OWORD *)&self->_anon_130[80];
    long long v92 = *(_OWORD *)&self->_anon_130[64];
    long long v93 = v68;
    long long v69 = *(_OWORD *)&self->_anon_130[112];
    long long v94 = *(_OWORD *)&self->_anon_130[96];
    long long v95 = v69;
    int64x2_t v70 = *(int64x2_t *)&self->_anon_130[16];
    int64x2_t v88 = *(int64x2_t *)self->_anon_130;
    int64x2_t v89 = v70;
    int64x2_t v71 = *(int64x2_t *)&self->_anon_130[48];
    int64x2_t v90 = *(int64x2_t *)&self->_anon_130[32];
    int64x2_t v91 = v71;
    uint64_t v77 = objc_msgSend(NSNumber, "numberWithDouble:", (double)VLHeadingForTransform((uint64_t)&v88, *(double *)v90.i64, *(double *)v71.i64, v72, v73, v74, v75, v76));
    float64x2_t v97 = v77;
    v78 = [NSDictionary dictionaryWithObjects:&v97 forKeys:&v96 count:1];
    [v3 setObject:v78 forKeyedSubscript:@"ori"];

    long long v79 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:&self->_resultCovariance length:144 freeWhenDone:0];
    long long v80 = [v79 base64EncodedStringWithOptions:0];

    [v3 setObject:v80 forKeyedSubscript:@"covariance"];
  }
  return v3;
}

- (id)analyticsInformationWithSessionStartMonotonicTime:(double)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F41CB0]);
  [v5 setRelativeTimestampMs:((self->_monotonicTimestamp - a3) * 1000.0)];
  [v5 setRunTimeMs:(self->_duration * 1000.0)];
  id v6 = objc_alloc_init(MEMORY[0x263F41C98]);
  [v6 setX:*(double *)self->_gravity];
  [v6 setY:*(double *)&self->_gravity[8]];
  [v6 setZ:*(double *)&self->_gravity[16]];
  [v5 setGravityVector:v6];
  [v5 setExposureTargetOffset:self->_exposureTargetOffset];
  [v5 setLocation:self->_analyticsLocation];
  statistics = self->_statistics;
  if (statistics)
  {
    unint64_t resultStatus = self->_resultStatus;
    if (resultStatus > 0x10 || ((1 << resultStatus) & 0x10110) == 0)
    {
      int v32 = (int)[(_VLStatistics *)statistics stats][136];
      statistics = self->_statistics;
      if (v32 >= 1)
      {
        uint64_t v33 = (uint64_t)[(_VLStatistics *)statistics stats][104];
        uint64_t v34 = v33 + 16 * (int)[(_VLStatistics *)self->_statistics stats][136];
        int v35 = *(_DWORD *)(v34 - 12);
        int v36 = *(_DWORD *)(v34 - 8);
        int v37 = *(_DWORD *)(v34 - 4);
        id v38 = objc_alloc_init(MEMORY[0x263F41CD8]);
        id v39 = objc_alloc_init(MEMORY[0x263F41CE0]);
        [v38 setTileId:v39];

        int64x2_t v40 = [v38 tileId];
        [v40 setXCoordinate:(double)v35];

        int64x2_t v41 = [v38 tileId];
        [v41 setYCoordinate:(double)v36];

        uint64_t v42 = [v38 tileId];
        [v42 setUncertainty:(double)v37];

        objc_msgSend(v38, "setTileSizeBytes:", -[_VLStatistics stats](self->_statistics, "stats")[488]);
        [v5 setTileDetails:v38];

        statistics = self->_statistics;
      }
    }
    if ((int)[(_VLStatistics *)statistics stats][136] < 1)
    {
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v9 = (uint64_t)[(_VLStatistics *)self->_statistics stats][24];
      uint64_t v10 = *(__int16 *)(v9 + 2 * (int)[(_VLStatistics *)self->_statistics stats][136] - 2);
    }
    id v11 = objc_alloc_init(MEMORY[0x263F41CA8]);
    [v11 setNumberOfInliers:v10];
    double v12 = [(_VLStatistics *)self->_statistics stats];
    [v11 setNumberOfKeypoints:v12->var13 & ~(v12->var13 >> 31)];
    double v13 = [(_VLStatistics *)self->_statistics stats];
    [v11 setNumberOfMatches:v13->var15 & ~(v13->var15 >> 31)];
    if ((int)[(_VLStatistics *)self->_statistics stats][80] >= 1
      && [(_VLStatistics *)self->_statistics stats][80])
    {
      unint64_t v14 = 0;
      do
      {
        objc_msgSend(v11, "addSolverConfidence:", *(float *)((void)-[_VLStatistics stats](self->_statistics, "stats")[64] + 4 * v14));
        objc_msgSend(v11, "addFusedConfidence:", *(float *)((void)-[_VLStatistics stats](self->_statistics, "stats")[72] + 4 * v14++));
      }
      while (v14 < (int)[(_VLStatistics *)self->_statistics stats][80]);
    }
    objc_msgSend(v11, "setTKptsMs:", ((double)-[_VLStatistics stats](self->_statistics, "stats")[304] * 1000.0));
    objc_msgSend(v11, "setTMatchMs:", ((double)-[_VLStatistics stats](self->_statistics, "stats")[368] * 1000.0));
    objc_msgSend(v11, "setTPoseMs:", ((double)-[_VLStatistics stats](self->_statistics, "stats")[400] * 1000.0));
    [v5 setAlgorithmDetails:v11];
  }
  if (self->_resultStatus != 1)
  {
    id v29 = objc_alloc_init(MEMORY[0x263F41C88]);
    id v15 = v29;
    int v30 = self->_resultStatus;
    if (v30 <= 1023)
    {
      if (v30 <= 63)
      {
        uint64_t v31 = 1;
        switch(v30)
        {
          case 2:
            goto LABEL_74;
          case 4:
          case 8:
            uint64_t v31 = 2;
            break;
          case 16:
            uint64_t v31 = 3;
            break;
          case 32:
            uint64_t v31 = 4;
            break;
          default:
            goto LABEL_62;
        }
        goto LABEL_74;
      }
      if (v30 > 255)
      {
        if (v30 == 256)
        {
          uint64_t v31 = 7;
          goto LABEL_74;
        }
        if (v30 == 512)
        {
          uint64_t v31 = 8;
          goto LABEL_74;
        }
      }
      else
      {
        if (v30 == 64)
        {
          uint64_t v31 = 5;
          goto LABEL_74;
        }
        if (v30 == 128)
        {
          uint64_t v31 = 6;
          goto LABEL_74;
        }
      }
    }
    else
    {
      if (v30 >= 0x2000)
      {
        switch(v30)
        {
          case 16384:
            uint64_t v31 = 13;
            break;
          case 16385:
            uint64_t v31 = 14;
            break;
          case 16386:
            uint64_t v31 = 15;
            break;
          case 16387:
            uint64_t v31 = 16;
            break;
          case 16388:
            uint64_t v31 = 17;
            break;
          default:
            if (v30 != 0x2000) {
              goto LABEL_62;
            }
            uint64_t v31 = 12;
            break;
        }
        goto LABEL_74;
      }
      switch(v30)
      {
        case 1024:
          uint64_t v31 = 9;
          goto LABEL_74;
        case 2048:
          uint64_t v31 = 10;
          goto LABEL_74;
        case 4096:
          uint64_t v31 = 11;
LABEL_74:
          [v29 setFailureReason:v31];
          [v5 setFailureDetails:v15];
          goto LABEL_75;
      }
    }
LABEL_62:
    uint64_t v31 = 0;
    goto LABEL_74;
  }
  id v15 = objc_alloc_init(MEMORY[0x263F41CD0]);
  double v17 = self->_location.pos_geoc[0];
  double v16 = self->_location.pos_geoc[1];
  double v18 = sqrt(v16 * v16 + v17 * v17);
  double v19 = v18 * 0.99330562;
  double v20 = 0.0;
  double v21 = 0.0;
  if (v18 * 0.99330562 == 0.0) {
    goto LABEL_41;
  }
  double v72 = self->_location.pos_geoc[1];
  double __x = self->_location.pos_geoc[0];
  unsigned int v22 = 0;
  long double __y = self->_location.pos_geoc[2];
  double v23 = 0.0;
  double v24 = 0.0;
  while (1)
  {
    double v26 = v23;
    double v23 = atan2(__y, v19);
    __double2 v27 = __sincos_stret(v23);
    double v28 = 6378137.0 / sqrt(v27.__sinval * -0.00669437999 * v27.__sinval + 1.0);
    double v21 = v18 / v27.__cosval - v28;
    if (vabdd_f64(v26, v23) < 0.000001) {
      break;
    }
    if (v22 > 8) {
      goto LABEL_40;
    }
LABEL_19:
    ++v22;
    double v19 = v18 * (v28 / (v28 + v21) * -0.00669437999 + 1.0);
    double v24 = v18 / v27.__cosval - v28;
    if (v19 == 0.0) {
      goto LABEL_40;
    }
  }
  if (vabdd_f64(v24, v21) >= 0.001 && v22 < 9) {
    goto LABEL_19;
  }
LABEL_40:
  double v16 = v72;
  double v17 = __x;
LABEL_41:
  double v43 = atan2(v16, v17) / 0.0174532925;
  long double v73 = *(double *)&self->_anon_1b0[8];
  float64x2_t __xa = *(float64x2_t *)self->_anon_1b0;
  double v44 = sqrt(vmlad_n_f64(vmuld_lane_f64(v73, __xa, 1), *(double *)self->_anon_1b0, *(double *)self->_anon_1b0));
  double v45 = v44 * 0.99330562;
  if (v44 * 0.99330562 != 0.0)
  {
    uint64_t v70 = 0x3F91DF46A2529D39;
    double v71 = v43;
    unsigned int v46 = 0;
    long double __ya = *(double *)&self->_anon_1b0[16];
    double v47 = 0.0;
    double v48 = 0.0;
    do
    {
      double v49 = v47;
      double v47 = atan2(__ya, v45);
      __double2 v50 = __sincos_stret(v47);
      double v51 = 6378137.0 / sqrt(v50.__sinval * -0.00669437999 * v50.__sinval + 1.0);
      double v20 = v44 / v50.__cosval - v51;
      if (vabdd_f64(v49, v47) >= 0.000001)
      {
        if (v46 > 8) {
          break;
        }
      }
      else if (vabdd_f64(v48, v20) < 0.001 || v46 >= 9)
      {
        break;
      }
      ++v46;
      double v45 = v44 * (v51 / (v51 + v20) * -0.00669437999 + 1.0);
      double v48 = v44 / v50.__cosval - v51;
    }
    while (v45 != 0.0);
  }
  atan2(v73, __xa.f64[0]);
  id v53 = objc_alloc_init(MEMORY[0x263F41C80]);
  GEOCalculateDistance();
  [v53 setLocationCorrectionMagnitude:v54];
  double v55 = v20 - v21;
  if (v20 - v21 < 0.0) {
    double v55 = -(v20 - v21);
  }
  objc_msgSend(v53, "setAltitudeCorrectionMagnitude:", v55, v70, *(void *)&v71);
  long long v56 = *(_OWORD *)&self->_anon_130[80];
  long long v81 = *(_OWORD *)&self->_anon_130[64];
  long long v82 = v56;
  long long v57 = *(_OWORD *)&self->_anon_130[112];
  long long v83 = *(_OWORD *)&self->_anon_130[96];
  long long v84 = v57;
  long long v58 = *(_OWORD *)&self->_anon_130[16];
  v78[0] = *(_OWORD *)self->_anon_130;
  v78[1] = v58;
  long long v59 = *(_OWORD *)&self->_anon_130[48];
  long long v79 = *(_OWORD *)&self->_anon_130[32];
  long long v80 = v59;
  VLHeadingForTransform((uint64_t)v78, *(double *)&v79, *(double *)&v59, v60, v61, v62, v63, v64);
  GEOAngleDifferenceDegrees();
  [v53 setHeadingCorrectionMagnitude:v65];
  [v15 setCorrection:v53];
  [v15 setPoseConfidence:self->_resultConfidence];
  uint64_t v66 = self->_statistics;
  if (v66 && (int)[(_VLStatistics *)v66 stats][88] >= 1)
  {
    unint64_t v67 = 0;
    do
    {
      objc_msgSend(v15, "addInlierSuccessIndices:", *(unsigned int *)((void)-[_VLStatistics stats](self->_statistics, "stats")[16] + 4 * v67++));
      long long v68 = [(_VLStatistics *)self->_statistics stats];
    }
    while (v67 < (v68->var12 & ~(v68->var12 >> 31)));
  }
  [v5 setSuccessDetails:v15];

LABEL_75:
  return v5;
}

- (NSData)pngData
{
  return self->_imageData;
}

- (double)_timestamp
{
  return self->_timestamp;
}

- ($91CD28BF998EF1D34D1F6E7D57520290)_location
{
  long long v3 = *(_OWORD *)&self[1].var1;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[1];
  *(_OWORD *)&retstr->var0[2] = v3;
  *(double *)&retstr->var3 = self[2].var0[0];
  return self;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_heading
{
  double trueHeading = self->_heading.trueHeading;
  double accuracy = self->_heading.accuracy;
  result.var1 = accuracy;
  result.var0 = trueHeading;
  return result;
}

- (__n128)_gravity
{
  __n128 result = *(__n128 *)(a1 + 112);
  long long v3 = *(_OWORD *)(a1 + 128);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (__n128)_transform
{
  return a1[9];
}

- (__n128)_cameraIntrinsics
{
  return a1[13];
}

- (double)_radialDistortion
{
  return *(double *)(a1 + 256);
}

- (double)_exposureTargetOffset
{
  return self->_exposureTargetOffset;
}

- (unint64_t)_resultStatus
{
  return self->_resultStatus;
}

- (VLLocalizationCrowdsourcingDetails)crowdsourcingDetails
{
  return self->_crowdsourcingDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crowdsourcingDetails, 0);
  objc_storeStrong((id *)&self->_analyticsLocation, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end