@interface _VLStatistics
+ (BOOL)supportsSecureCoding;
- ($EA16241FF5FAACBBBC823CFA4C5CA9E3)stats;
- (_VLStatistics)initWithCoder:(id)a3;
- (_VLStatistics)initWithStats:(id *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _VLStatistics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_VLStatistics)initWithStats:(id *)a3
{
  if (a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)_VLStatistics;
    v4 = [(_VLStatistics *)&v8 init];
    v5 = v4;
    if (v4)
    {
      memcpy(&v4->_stats, a3, sizeof(v4->_stats));
      v6 = v5;
    }

    return v5;
  }
  else
  {
    result = (_VLStatistics *)os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (result)
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_21BAD2000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Assertion failed: stats != ((void *)0)", buf, 2u);
    }
    __break(1u);
  }
  return result;
}

- (_VLStatistics)initWithCoder:(id)a3
{
  v139[1] = *MEMORY[0x263EF8340];
  uint64_t v95 = 0;
  id v4 = a3;
  v5 = (const void *)[v4 decodeBytesForKey:@"statistics" returnedLength:&v95];
  if (v95 != 504)
  {
    v32 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F07F70];
    uint64_t v138 = *MEMORY[0x263EFFC40];
    v139[0] = @"statistics bytes were not the expected length";
    v34 = [NSDictionary dictionaryWithObjects:v139 forKeys:&v138 count:1];
    v35 = [v32 errorWithDomain:v33 code:4864 userInfo:v34];
    [v4 failWithError:v35];

LABEL_26:
    self = 0;
    goto LABEL_27;
  }
  memcpy(__dst, v5, 0x1F8uLL);
  memset(__dst, 0, 40);
  __dst[4] = 0uLL;
  *(_OWORD *)((char *)&__dst[6] + 8) = 0u;
  *(_OWORD *)((char *)&__dst[7] + 8) = 0u;
  __dst[12] = 0uLL;
  *(_OWORD *)((char *)&__dst[16] + 8) = 0u;
  *(_OWORD *)((char *)&__dst[13] + 8) = 0u;
  *(_OWORD *)((char *)&__dst[14] + 8) = 0u;
  *(_OWORD *)((char *)&__dst[15] + 8) = 0u;
  *((void *)&__dst[17] + 1) = 0;
  memcpy(&self->_stats, __dst, sizeof(self->_stats));
  v93.receiver = self;
  v93.super_class = (Class)_VLStatistics;
  self = [(_VLStatistics *)&v93 init];
  if (self)
  {
    *(void *)&__dst[0] = 0;
    id v6 = v4;
    v7 = (const void *)[v6 decodeBytesForKey:@"points3D" returnedLength:__dst];
    if (*(void *)&__dst[0] == 8
                               * ((3 * self->_stats.num_inliers) & ~((3 * self->_stats.num_inliers) >> 31)))
    {
      objc_super v8 = (double *)malloc_type_malloc(*(size_t *)&__dst[0], 0xAF6A11AuLL);
      self->_stats.points3d = v8;
      memcpy(v8, v7, *(size_t *)&__dst[0]);
      *(void *)&__dst[0] = 0;
      id v6 = v6;
      v9 = (const void *)[v6 decodeBytesForKey:@"points2D" returnedLength:__dst];
      if (*(void *)&__dst[0] == 4
                                 * ((2 * self->_stats.num_inliers) & ~((2 * self->_stats.num_inliers) >> 31)))
      {
        v10 = (float *)malloc_type_malloc(*(size_t *)&__dst[0], 0xE4E916F3uLL);
        self->_stats.points2d = v10;
        memcpy(v10, v9, *(size_t *)&__dst[0]);
        *(void *)&__dst[0] = 0;
        id v6 = v6;
        v11 = (const void *)[v6 decodeBytesForKey:@"inlierIndices" returnedLength:__dst];
        if (*(void *)&__dst[0] == 4 * (self->_stats.num_inliers & ~(self->_stats.num_inliers >> 31)))
        {
          v12 = (int *)malloc_type_malloc(*(size_t *)&__dst[0], 0xE00A62B0uLL);
          self->_stats.inlier_indices = v12;
          memcpy(v12, v11, *(size_t *)&__dst[0]);
          *(void *)&__dst[0] = 0;
          id v6 = v6;
          v13 = (const void *)[v6 decodeBytesForKey:@"slam_pt3s_inlier_idx" returnedLength:__dst];
          if (*(void *)&__dst[0] == 2 * (self->_stats.num_inliers & ~(self->_stats.num_inliers >> 31)))
          {
            v14 = (signed __int16 *)malloc_type_malloc(*(size_t *)&__dst[0], 0x514B0DD1uLL);
            self->_stats.slam_pt3s_inlier_idx = v14;
            memcpy(v14, v13, *(size_t *)&__dst[0]);
            *(void *)&__dst[0] = 0;
            id v6 = v6;
            v15 = (const void *)[v6 decodeBytesForKey:@"solverConf" returnedLength:__dst];
            if (*(void *)&__dst[0] == 4 * (self->_stats.num_confs & ~(self->_stats.num_confs >> 31)))
            {
              v16 = (float *)malloc_type_malloc(*(size_t *)&__dst[0], 0x863F626EuLL);
              self->_stats.solver_conf = v16;
              memcpy(v16, v15, *(size_t *)&__dst[0]);
              *(void *)&__dst[0] = 0;
              id v6 = v6;
              v17 = (const void *)[v6 decodeBytesForKey:@"fusedConf" returnedLength:__dst];
              if (*(void *)&__dst[0] == 4
                                         * (self->_stats.num_confs & ~(self->_stats.num_confs >> 31)))
              {
                v18 = (float *)malloc_type_malloc(*(size_t *)&__dst[0], 0x26269347uLL);
                self->_stats.fused_conf = v18;
                memcpy(v18, v17, *(size_t *)&__dst[0]);
                *(void *)&__dst[0] = 0;
                id v6 = v6;
                v19 = (const void *)[v6 decodeBytesForKey:@"tiles" returnedLength:__dst];
                if (*(void *)&__dst[0] == 16
                                           * (self->_stats.num_frames & ~(self->_stats.num_frames >> 31)))
                {
                  v20 = (vl_tile_t *)malloc_type_malloc(*(size_t *)&__dst[0], 0xDD73D504uLL);
                  self->_stats.tile = v20;
                  memcpy(v20, v19, *(size_t *)&__dst[0]);
                  if (self->_stats.num_slam_pt3s < 1)
                  {
LABEL_40:
                    if (self->_stats.num_frames < 1) {
                      goto LABEL_27;
                    }
                    *(void *)&__dst[0] = 0;
                    id v6 = v6;
                    v73 = (const void *)[v6 decodeBytesForKey:@"inlierNumber" returnedLength:__dst];
                    if (*(void *)&__dst[0] == 2 * (self->_stats.num_frames & ~(self->_stats.num_frames >> 31)))
                    {
                      v74 = (signed __int16 *)malloc_type_malloc(*(size_t *)&__dst[0], 0x5A8B64E2uLL);
                      self->_stats.inlier_number = v74;
                      memcpy(v74, v73, *(size_t *)&__dst[0]);
                      *(void *)&__dst[0] = 0;
                      id v6 = v6;
                      v75 = (const void *)[v6 decodeBytesForKey:@"VIOStatus" returnedLength:__dst];
                      if (*(void *)&__dst[0] == 4
                                                 * (self->_stats.num_frames & ~(self->_stats.num_frames >> 31)))
                      {
                        v76 = (int *)malloc_type_malloc(*(size_t *)&__dst[0], 0xC1D8F923uLL);
                        self->_stats.vio_status = v76;
                        memcpy(v76, v75, *(size_t *)&__dst[0]);
                        *(void *)&__dst[0] = 0;
                        id v6 = v6;
                        v77 = (const void *)[v6 decodeBytesForKey:@"VIOPoses" returnedLength:__dst];
                        if (*(void *)&__dst[0] == 4
                                                   * ((12 * self->_stats.num_frames) & ~((12 * self->_stats.num_frames) >> 31)))
                        {
                          v78 = (float *)malloc_type_malloc(*(size_t *)&__dst[0], 0xA7652DD4uLL);
                          self->_stats.vio_poses = v78;
                          memcpy(v78, v77, *(size_t *)&__dst[0]);
                          *(void *)&__dst[0] = 0;
                          id v6 = v6;
                          v79 = (const void *)[v6 decodeBytesForKey:@"CalibrationMatrices" returnedLength:__dst];
                          if (*(void *)&__dst[0] == 4
                                                     * ((9 * self->_stats.num_frames) & ~((9 * self->_stats.num_frames) >> 31)))
                          {
                            v80 = (float *)malloc_type_malloc(*(size_t *)&__dst[0], 0x1A1216FDuLL);
                            self->_stats.K = v80;
                            memcpy(v80, v79, *(size_t *)&__dst[0]);
                            *(void *)&__dst[0] = 0;
                            id v6 = v6;
                            v81 = (const void *)[v6 decodeBytesForKey:@"Distortion" returnedLength:__dst];
                            if (*(void *)&__dst[0] == 4
                                                       * ((2 * self->_stats.num_frames) & ~((2 * self->_stats.num_frames) >> 31)))
                            {
                              v82 = (float *)malloc_type_malloc(*(size_t *)&__dst[0], 0x4912C0CEuLL);
                              self->_stats.distortion = v82;
                              memcpy(v82, v81, *(size_t *)&__dst[0]);
                              *(void *)&__dst[0] = 0;
                              id v6 = v6;
                              v83 = (const void *)[v6 decodeBytesForKey:@"slam_timestamps" returnedLength:__dst];
                              if (*(void *)&__dst[0] == 8
                                                         * (self->_stats.num_frames & ~(self->_stats.num_frames >> 31)))
                              {
                                v84 = (double *)malloc_type_malloc(*(size_t *)&__dst[0], 0x273ACD8FuLL);
                                self->_stats.slam_time_stamps = v84;
                                memcpy(v84, v83, *(size_t *)&__dst[0]);
                                *(void *)&__dst[0] = 0;
                                id v6 = v6;
                                v85 = (const void *)[v6 decodeBytesForKey:@"slam_poses" returnedLength:__dst];
                                if (*(void *)&__dst[0] == 4
                                                           * ((12 * self->_stats.num_frames) & ~((12 * self->_stats.num_frames) >> 31)))
                                {
                                  v86 = (float *)malloc_type_malloc(*(size_t *)&__dst[0], 0xAF6D2A91uLL);
                                  self->_stats.slam_poses = v86;
                                  memcpy(v86, v85, *(size_t *)&__dst[0]);
                                  *(void *)&__dst[0] = 0;
                                  id v6 = v6;
                                  v87 = (const void *)[v6 decodeBytesForKey:@"result_poses" returnedLength:__dst];
                                  if (*(void *)&__dst[0] == 248
                                                             * (self->_stats.num_frames & ~(self->_stats.num_frames >> 31)))
                                  {
                                    v88 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(*(size_t *)&__dst[0], 0x3BB57C68uLL);
                                    self->_stats.result_poses = v88;
                                    memcpy(v88, v87, *(size_t *)&__dst[0]);
                                    *(void *)&__dst[0] = 0;
                                    id v6 = v6;
                                    v89 = (const void *)[v6 decodeBytesForKey:@"result_status" returnedLength:__dst];
                                    if (*(void *)&__dst[0] == 4
                                                               * (self->_stats.num_frames & ~(self->_stats.num_frames >> 31)))
                                    {
                                      v90 = (int *)malloc_type_malloc(*(size_t *)&__dst[0], 0x5A8F4C87uLL);
                                      self->_stats.result_status = v90;
                                      memcpy(v90, v89, *(size_t *)&__dst[0]);
                                      goto LABEL_27;
                                    }
                                    v36 = (void *)MEMORY[0x263F087E8];
                                    uint64_t v37 = *MEMORY[0x263F07F70];
                                    uint64_t v96 = *MEMORY[0x263EFFC40];
                                    v38 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"result_status"];
                                    v97 = v38;
                                    v39 = NSDictionary;
                                    v40 = &v97;
                                    v41 = &v96;
                                  }
                                  else
                                  {
                                    v36 = (void *)MEMORY[0x263F087E8];
                                    uint64_t v37 = *MEMORY[0x263F07F70];
                                    uint64_t v98 = *MEMORY[0x263EFFC40];
                                    v38 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"result_poses"];
                                    v99 = v38;
                                    v39 = NSDictionary;
                                    v40 = &v99;
                                    v41 = &v98;
                                  }
                                }
                                else
                                {
                                  v36 = (void *)MEMORY[0x263F087E8];
                                  uint64_t v37 = *MEMORY[0x263F07F70];
                                  uint64_t v100 = *MEMORY[0x263EFFC40];
                                  v38 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"slam_poses"];
                                  v101 = v38;
                                  v39 = NSDictionary;
                                  v40 = &v101;
                                  v41 = &v100;
                                }
                              }
                              else
                              {
                                v36 = (void *)MEMORY[0x263F087E8];
                                uint64_t v37 = *MEMORY[0x263F07F70];
                                uint64_t v102 = *MEMORY[0x263EFFC40];
                                v38 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"slam_timestamps"];
                                v103 = v38;
                                v39 = NSDictionary;
                                v40 = &v103;
                                v41 = &v102;
                              }
                            }
                            else
                            {
                              v36 = (void *)MEMORY[0x263F087E8];
                              uint64_t v37 = *MEMORY[0x263F07F70];
                              uint64_t v104 = *MEMORY[0x263EFFC40];
                              v38 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"Distortion"];
                              v105 = v38;
                              v39 = NSDictionary;
                              v40 = &v105;
                              v41 = &v104;
                            }
                          }
                          else
                          {
                            v36 = (void *)MEMORY[0x263F087E8];
                            uint64_t v37 = *MEMORY[0x263F07F70];
                            uint64_t v106 = *MEMORY[0x263EFFC40];
                            v38 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"CalibrationMatrices"];
                            v107 = v38;
                            v39 = NSDictionary;
                            v40 = &v107;
                            v41 = &v106;
                          }
                        }
                        else
                        {
                          v36 = (void *)MEMORY[0x263F087E8];
                          uint64_t v37 = *MEMORY[0x263F07F70];
                          uint64_t v108 = *MEMORY[0x263EFFC40];
                          v38 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"VIOPoses"];
                          v109 = v38;
                          v39 = NSDictionary;
                          v40 = &v109;
                          v41 = &v108;
                        }
                      }
                      else
                      {
                        v36 = (void *)MEMORY[0x263F087E8];
                        uint64_t v37 = *MEMORY[0x263F07F70];
                        uint64_t v110 = *MEMORY[0x263EFFC40];
                        v38 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"VIOStatus"];
                        v111 = v38;
                        v39 = NSDictionary;
                        v40 = &v111;
                        v41 = &v110;
                      }
                    }
                    else
                    {
                      v36 = (void *)MEMORY[0x263F087E8];
                      uint64_t v37 = *MEMORY[0x263F07F70];
                      uint64_t v112 = *MEMORY[0x263EFFC40];
                      v38 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"inlierNumber"];
                      v113 = v38;
                      v39 = NSDictionary;
                      v40 = &v113;
                      v41 = &v112;
                    }
                    goto LABEL_25;
                  }
                  *(void *)&__dst[0] = 0;
                  id v21 = v6;
                  v22 = (const void *)[v21 decodeBytesForKey:@"SLAMTracks" returnedLength:__dst];
                  if (*(void *)&__dst[0] != 4
                                             * ((3 * self->_stats.num_slam_pt3s) & ~((3
                                                                                                  * self->_stats.num_slam_pt3s) >> 31)))
                  {
                    v45 = (void *)MEMORY[0x263F087E8];
                    uint64_t v46 = *MEMORY[0x263F07F70];
                    uint64_t v122 = *MEMORY[0x263EFFC40];
                    v47 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"SLAMTracks"];
                    v123 = v47;
                    v48 = NSDictionary;
                    v49 = &v123;
                    v50 = &v122;
                    goto LABEL_56;
                  }
                  v23 = (float *)malloc_type_malloc(*(size_t *)&__dst[0], 0x1E27FBB2uLL);
                  self->_stats.slam_pt3s = v23;
                  memcpy(v23, v22, *(size_t *)&__dst[0]);
                  *(void *)&__dst[0] = 0;
                  id v21 = v21;
                  v24 = (const void *)[v21 decodeBytesForKey:@"SLAMTrackDescriptors" returnedLength:__dst];
                  if (*(void *)&__dst[0] != ((self->_stats.desc_dim * self->_stats.num_slam_pt3s) & ~((self->_stats.desc_dim * self->_stats.num_slam_pt3s) >> 31)))
                  {
                    v45 = (void *)MEMORY[0x263F087E8];
                    uint64_t v46 = *MEMORY[0x263F07F70];
                    uint64_t v120 = *MEMORY[0x263EFFC40];
                    v47 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"SLAMTrackDescriptors"];
                    v121 = v47;
                    v48 = NSDictionary;
                    v49 = &v121;
                    v50 = &v120;
                    goto LABEL_56;
                  }
                  v25 = (char *)malloc_type_malloc(*(size_t *)&__dst[0], 0xB3F8F20DuLL);
                  self->_stats.slam_pt3_desc = v25;
                  memcpy(v25, v24, *(size_t *)&__dst[0]);
                  *(void *)&__dst[0] = 0;
                  id v21 = v21;
                  v26 = (const void *)[v21 decodeBytesForKey:@"SLAMTrackObservations" returnedLength:__dst];
                  if (*(void *)&__dst[0] != 2 * (self->_stats.num_slam_pt3s & ~(self->_stats.num_slam_pt3s >> 31)))
                  {
                    v45 = (void *)MEMORY[0x263F087E8];
                    uint64_t v46 = *MEMORY[0x263F07F70];
                    uint64_t v118 = *MEMORY[0x263EFFC40];
                    v47 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"SLAMTrackObservations"];
                    v119 = v47;
                    v48 = NSDictionary;
                    v49 = &v119;
                    v50 = &v118;
                    goto LABEL_56;
                  }
                  v27 = (signed __int16 *)malloc_type_malloc(*(size_t *)&__dst[0], 0x1B2462E4uLL);
                  self->_stats.slam_tracks_len = v27;
                  memcpy(v27, v26, *(size_t *)&__dst[0]);
                  uint64_t num_slam_pt3s = self->_stats.num_slam_pt3s;
                  if ((int)num_slam_pt3s < 1)
                  {
                    uint64_t v30 = 0;
                    goto LABEL_37;
                  }
                  slam_tracks_len = self->_stats.slam_tracks_len;
                  if (num_slam_pt3s >= 0x10)
                  {
                    int64x2_t v51 = 0uLL;
                    uint64_t v31 = num_slam_pt3s & 0xFFFFFFF0;
                    int64x2_t v52 = 0uLL;
                    v53 = (int16x4_t *)(slam_tracks_len + 8);
                    uint64_t v54 = v31;
                    int64x2_t v55 = 0uLL;
                    int64x2_t v56 = 0uLL;
                    int64x2_t v57 = 0uLL;
                    int64x2_t v58 = 0uLL;
                    int64x2_t v59 = 0uLL;
                    int64x2_t v60 = 0uLL;
                    do
                    {
                      int16x8_t v61 = *(int16x8_t *)v53[-2].i8;
                      int32x4_t v62 = vmovl_s16(*(int16x4_t *)v61.i8);
                      int32x4_t v63 = vmovl_high_s16(v61);
                      int32x4_t v64 = vmovl_s16(*v53);
                      int32x4_t v65 = vmovl_high_s16(*(int16x8_t *)v53->i8);
                      int64x2_t v56 = vaddw_high_s32(v56, v63);
                      int64x2_t v55 = vaddw_s32(v55, *(int32x2_t *)v63.i8);
                      int64x2_t v52 = vaddw_high_s32(v52, v62);
                      int64x2_t v51 = vaddw_s32(v51, *(int32x2_t *)v62.i8);
                      int64x2_t v60 = vaddw_high_s32(v60, v65);
                      int64x2_t v59 = vaddw_s32(v59, *(int32x2_t *)v65.i8);
                      int64x2_t v58 = vaddw_high_s32(v58, v64);
                      int64x2_t v57 = vaddw_s32(v57, *(int32x2_t *)v64.i8);
                      v53 += 4;
                      v54 -= 16;
                    }
                    while (v54);
                    uint64_t v30 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v57, v51), vaddq_s64(v59, v55)), vaddq_s64(vaddq_s64(v58, v52), vaddq_s64(v60, v56))));
                    if (v31 == num_slam_pt3s)
                    {
LABEL_37:
                      *(void *)&__dst[0] = 0;
                      id v21 = v21;
                      v69 = (const void *)[v21 decodeBytesForKey:@"SLAMTrackPositions" returnedLength:__dst];
                      if (*(void *)&__dst[0] == 8 * v30)
                      {
                        v70 = (float *)malloc_type_malloc(*(size_t *)&__dst[0], 0xE8D1F80AuLL);
                        self->_stats.slam_tracks = v70;
                        memcpy(v70, v69, *(size_t *)&__dst[0]);
                        *(void *)&__dst[0] = 0;
                        id v21 = v21;
                        v71 = (const void *)[v21 decodeBytesForKey:@"SLAMTrackImageIndices" returnedLength:__dst];
                        if (*(void *)&__dst[0] == 2 * v30)
                        {
                          v72 = (signed __int16 *)malloc_type_malloc(*(size_t *)&__dst[0], 0x3B301656uLL);
                          self->_stats.slam_tracks_img_idx = v72;
                          memcpy(v72, v71, *(size_t *)&__dst[0]);
                          goto LABEL_40;
                        }
                        v45 = (void *)MEMORY[0x263F087E8];
                        uint64_t v46 = *MEMORY[0x263F07F70];
                        uint64_t v114 = *MEMORY[0x263EFFC40];
                        v47 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"SLAMTrackImageIndices"];
                        v115 = v47;
                        v48 = NSDictionary;
                        v49 = &v115;
                        v50 = &v114;
                      }
                      else
                      {
                        v45 = (void *)MEMORY[0x263F087E8];
                        uint64_t v46 = *MEMORY[0x263F07F70];
                        uint64_t v116 = *MEMORY[0x263EFFC40];
                        v47 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"SLAMTrackPositions"];
                        v117 = v47;
                        v48 = NSDictionary;
                        v49 = &v117;
                        v50 = &v116;
                      }
LABEL_56:
                      v91 = [v48 dictionaryWithObjects:v49 forKeys:v50 count:1];
                      v92 = [v45 errorWithDomain:v46 code:4864 userInfo:v91];
                      [v21 failWithError:v92];

                      goto LABEL_26;
                    }
                  }
                  else
                  {
                    uint64_t v30 = 0;
                    uint64_t v31 = 0;
                  }
                  uint64_t v66 = num_slam_pt3s - v31;
                  v67 = &slam_tracks_len[v31];
                  do
                  {
                    uint64_t v68 = *v67++;
                    v30 += v68;
                    --v66;
                  }
                  while (v66);
                  goto LABEL_37;
                }
                v36 = (void *)MEMORY[0x263F087E8];
                uint64_t v37 = *MEMORY[0x263F07F70];
                uint64_t v124 = *MEMORY[0x263EFFC40];
                v38 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"tiles"];
                v125 = v38;
                v39 = NSDictionary;
                v40 = &v125;
                v41 = &v124;
              }
              else
              {
                v36 = (void *)MEMORY[0x263F087E8];
                uint64_t v37 = *MEMORY[0x263F07F70];
                uint64_t v126 = *MEMORY[0x263EFFC40];
                v38 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"fusedConf"];
                v127 = v38;
                v39 = NSDictionary;
                v40 = &v127;
                v41 = &v126;
              }
            }
            else
            {
              v36 = (void *)MEMORY[0x263F087E8];
              uint64_t v37 = *MEMORY[0x263F07F70];
              uint64_t v128 = *MEMORY[0x263EFFC40];
              v38 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"solverConf"];
              v129 = v38;
              v39 = NSDictionary;
              v40 = &v129;
              v41 = &v128;
            }
          }
          else
          {
            v36 = (void *)MEMORY[0x263F087E8];
            uint64_t v37 = *MEMORY[0x263F07F70];
            uint64_t v130 = *MEMORY[0x263EFFC40];
            v38 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"slam_pt3s_inlier_idx"];
            v131 = v38;
            v39 = NSDictionary;
            v40 = &v131;
            v41 = &v130;
          }
        }
        else
        {
          v36 = (void *)MEMORY[0x263F087E8];
          uint64_t v37 = *MEMORY[0x263F07F70];
          uint64_t v132 = *MEMORY[0x263EFFC40];
          v38 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"inlierIndices"];
          v133 = v38;
          v39 = NSDictionary;
          v40 = &v133;
          v41 = &v132;
        }
      }
      else
      {
        v36 = (void *)MEMORY[0x263F087E8];
        uint64_t v37 = *MEMORY[0x263F07F70];
        uint64_t v134 = *MEMORY[0x263EFFC40];
        v38 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"points2D"];
        v135 = v38;
        v39 = NSDictionary;
        v40 = &v135;
        v41 = &v134;
      }
    }
    else
    {
      v36 = (void *)MEMORY[0x263F087E8];
      uint64_t v37 = *MEMORY[0x263F07F70];
      uint64_t v136 = *MEMORY[0x263EFFC40];
      v38 = [NSString stringWithFormat:@"%@ bytes were not the expected length", @"points3D"];
      v137 = v38;
      v39 = NSDictionary;
      v40 = &v137;
      v41 = &v136;
    }
LABEL_25:
    v42 = [v39 dictionaryWithObjects:v40 forKeys:v41 count:1];
    v43 = [v36 errorWithDomain:v37 code:4864 userInfo:v42];
    [v6 failWithError:v43];

    goto LABEL_26;
  }
LABEL_27:

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = v4;
  int num_inliers = self->_stats.num_inliers;
  if (num_inliers >= 1)
  {
    [v4 encodeBytes:self->_stats.points3d length:8 * ((3 * num_inliers) & ~((3 * num_inliers) >> 31)) forKey:@"points3D"];
    [v5 encodeBytes:self->_stats.points2d length:4 * ((2 * self->_stats.num_inliers) & ~((2 * self->_stats.num_inliers) >> 31)) forKey:@"points2D"];
    [v5 encodeBytes:self->_stats.inlier_indices length:4 * (self->_stats.num_inliers & ~(self->_stats.num_inliers >> 31)) forKey:@"inlierIndices"];
    [v5 encodeBytes:self->_stats.slam_pt3s_inlier_idx length:2 * (self->_stats.num_inliers & ~(self->_stats.num_inliers >> 31)) forKey:@"slam_pt3s_inlier_idx"];
  }
  uint64_t num_confs = self->_stats.num_confs;
  if ((int)num_confs >= 1)
  {
    [v5 encodeBytes:self->_stats.solver_conf length:4 * num_confs forKey:@"solverConf"];
    [v5 encodeBytes:self->_stats.fused_conf length:4 * (self->_stats.num_confs & ~(self->_stats.num_confs >> 31)) forKey:@"fusedConf"];
  }
  uint64_t num_frames = self->_stats.num_frames;
  if ((int)num_frames >= 1)
  {
    [v5 encodeBytes:self->_stats.tile length:16 * num_frames forKey:@"tiles"];
    [v5 encodeBytes:self->_stats.inlier_number length:2 * (self->_stats.num_frames & ~(self->_stats.num_frames >> 31)) forKey:@"inlierNumber"];
    [v5 encodeBytes:self->_stats.slam_time_stamps length:8 * (self->_stats.num_frames & ~(self->_stats.num_frames >> 31)) forKey:@"slam_timestamps"];
  }
  int num_slam_pt3s = self->_stats.num_slam_pt3s;
  if (num_slam_pt3s >= 1)
  {
    [v5 encodeBytes:self->_stats.slam_pt3s length:4 * ((3 * num_slam_pt3s) & ~((3 * num_slam_pt3s) >> 31)) forKey:@"SLAMTracks"];
    int v10 = self->_stats.desc_dim * self->_stats.num_slam_pt3s;
    [v5 encodeBytes:self->_stats.slam_pt3_desc length:v10 & ~(v10 >> 31) forKey:@"SLAMTrackDescriptors"];
    [v5 encodeBytes:self->_stats.slam_tracks_len length:2 * (self->_stats.num_slam_pt3s & ~(self->_stats.num_slam_pt3s >> 31)) forKey:@"SLAMTrackObservations"];
    uint64_t v11 = self->_stats.num_slam_pt3s;
    if ((int)v11 < 1)
    {
      uint64_t v13 = 0;
    }
    else
    {
      slam_tracks_len = self->_stats.slam_tracks_len;
      if (v11 >= 0x10)
      {
        int64x2_t v15 = 0uLL;
        uint64_t v14 = v11 & 0xFFFFFFF0;
        int64x2_t v16 = 0uLL;
        v17 = (int16x4_t *)(slam_tracks_len + 8);
        uint64_t v18 = v14;
        int64x2_t v19 = 0uLL;
        int64x2_t v20 = 0uLL;
        int64x2_t v21 = 0uLL;
        int64x2_t v22 = 0uLL;
        int64x2_t v23 = 0uLL;
        int64x2_t v24 = 0uLL;
        do
        {
          int16x8_t v25 = *(int16x8_t *)v17[-2].i8;
          int32x4_t v26 = vmovl_s16(*(int16x4_t *)v25.i8);
          int32x4_t v27 = vmovl_high_s16(v25);
          int32x4_t v28 = vmovl_s16(*v17);
          int32x4_t v29 = vmovl_high_s16(*(int16x8_t *)v17->i8);
          int64x2_t v20 = vaddw_high_s32(v20, v27);
          int64x2_t v19 = vaddw_s32(v19, *(int32x2_t *)v27.i8);
          int64x2_t v16 = vaddw_high_s32(v16, v26);
          int64x2_t v15 = vaddw_s32(v15, *(int32x2_t *)v26.i8);
          int64x2_t v24 = vaddw_high_s32(v24, v29);
          int64x2_t v23 = vaddw_s32(v23, *(int32x2_t *)v29.i8);
          int64x2_t v22 = vaddw_high_s32(v22, v28);
          int64x2_t v21 = vaddw_s32(v21, *(int32x2_t *)v28.i8);
          v17 += 4;
          v18 -= 16;
        }
        while (v18);
        uint64_t v13 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v21, v15), vaddq_s64(v23, v19)), vaddq_s64(vaddq_s64(v22, v16), vaddq_s64(v24, v20))));
        if (v14 == v11) {
          goto LABEL_17;
        }
      }
      else
      {
        uint64_t v13 = 0;
        uint64_t v14 = 0;
      }
      uint64_t v30 = v11 - v14;
      uint64_t v31 = &slam_tracks_len[v14];
      do
      {
        uint64_t v32 = *v31++;
        v13 += v32;
        --v30;
      }
      while (v30);
    }
LABEL_17:
    [v5 encodeBytes:self->_stats.slam_tracks length:8 * v13 forKey:@"SLAMTrackPositions"];
    [v5 encodeBytes:self->_stats.slam_tracks_img_idx length:2 * v13 forKey:@"SLAMTrackImageIndices"];
  }
  uint64_t v33 = self->_stats.num_frames;
  if ((int)v33 >= 1)
  {
    [v5 encodeBytes:self->_stats.vio_status length:4 * v33 forKey:@"VIOStatus"];
    [v5 encodeBytes:self->_stats.vio_poses length:4 * ((12 * self->_stats.num_frames) & ~((12 * self->_stats.num_frames) >> 31)) forKey:@"VIOPoses"];
    [v5 encodeBytes:self->_stats.K length:4 * ((9 * self->_stats.num_frames) & ~((9 * self->_stats.num_frames) >> 31)) forKey:@"CalibrationMatrices"];
    [v5 encodeBytes:self->_stats.distortion length:4 * ((2 * self->_stats.num_frames) & ~((2 * self->_stats.num_frames) >> 31)) forKey:@"Distortion"];
    [v5 encodeBytes:self->_stats.slam_poses length:4 * ((12 * self->_stats.num_frames) & ~((12 * self->_stats.num_frames) >> 31)) forKey:@"slam_poses"];
    [v5 encodeBytes:self->_stats.result_poses length:248 * (self->_stats.num_frames & ~(self->_stats.num_frames >> 31)) forKey:@"result_poses"];
    [v5 encodeBytes:self->_stats.result_status length:4 * (self->_stats.num_frames & ~(self->_stats.num_frames >> 31)) forKey:@"result_status"];
  }
  memcpy(v34, &self->_stats, 0x1F8uLL);
  memset(v34, 0, 40);
  v34[4] = 0uLL;
  *(_OWORD *)((char *)&v34[6] + 8) = 0u;
  *(_OWORD *)((char *)&v34[7] + 8) = 0u;
  v34[12] = 0uLL;
  *(_OWORD *)((char *)&v34[16] + 8) = 0u;
  *(_OWORD *)((char *)&v34[13] + 8) = 0u;
  *(_OWORD *)((char *)&v34[14] + 8) = 0u;
  *(_OWORD *)((char *)&v34[15] + 8) = 0u;
  *((void *)&v34[17] + 1) = 0;
  [v5 encodeBytes:v34 length:504 forKey:@"statistics"];
}

- (void)dealloc
{
  vl_stats_free((uint64_t)&self->_stats);
  v3.receiver = self;
  v3.super_class = (Class)_VLStatistics;
  [(_VLStatistics *)&v3 dealloc];
}

- ($EA16241FF5FAACBBBC823CFA4C5CA9E3)stats
{
  return ($EA16241FF5FAACBBBC823CFA4C5CA9E3 *)&self->_stats;
}

@end