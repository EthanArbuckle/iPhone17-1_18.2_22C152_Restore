@interface PVComputeGuidedFilter
- (BOOL)applyFilterToInput:(id)a3 output:(id)a4;
- (BOOL)runCPUPathOnInput:(void *)a3 guide:(void *)a4 output:(void *)a5 radius:(int)a6 epsilon:(float)a7;
- (PVComputeGuidedFilter)initWithGuide:(id)a3 radius:(int)a4 epsilon:(float)a5;
- (float)epsilon;
- (int)radius;
- (void)processStage1Float32Input:(float *)a3 inputRowBytes:(unint64_t)a4 guide:(float *)a5 guideRowBytes:(unint64_t)a6 output:(float *)a7 outputRowBytes:(unint64_t)a8 width:(int)a9 height:(int)a10 radius:(int)a11;
- (void)processStage1UInt8Input:(char *)a3 inputRowBytes:(unint64_t)a4 guide:(char *)a5 guideRowBytes:(unint64_t)a6 output:(float *)a7 outputRowBytes:(unint64_t)a8 width:(int)a9 height:(int)a10 radius:(int)a11;
- (void)processStage5Float32Guide:(float *)a3 guideRowBytes:(unint64_t)a4 stats:(float *)a5 statsRowBytes:(unint64_t)a6 output:(float *)a7 outputRowBytes:(unint64_t)a8 width:(int)a9 height:(int)a10 radius:(int)a11;
- (void)processStage5UInt6Guide:(char *)a3 guideRowBytes:(unint64_t)a4 stats:(float *)a5 statsRowBytes:(unint64_t)a6 output:(char *)a7 outputRowBytes:(unint64_t)a8 width:(int)a9 height:(int)a10 radius:(int)a11;
@end

@implementation PVComputeGuidedFilter

- (PVComputeGuidedFilter)initWithGuide:(id)a3 radius:(int)a4 epsilon:(float)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PVComputeGuidedFilter;
  v10 = [(PVComputeGuidedFilter *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_guide, a3);
    v11->_radius = a4;
    v11->_epsilon = a5;
  }

  return v11;
}

- (BOOL)applyFilterToInput:(id)a3 output:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (__CVBuffer *)[v6 cvPixelBuffer];
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v8);
  if (PixelFormatType == 1278226488)
  {
    int v10 = 1;
  }
  else
  {
    int v10 = 7;
    if (PixelFormatType != 1278226534 && PixelFormatType != 1717855600)
    {
      NSLog(&cfstr_ErrorInputPixe.isa);
      int v10 = 0;
    }
  }
  HGCVBitmap::create((HGCVPixelBuffer *)v8, v10, 0, &v23);
  v11 = [(PVImageBuffer *)self->_guide cvPixelBuffer];
  OSType v12 = CVPixelBufferGetPixelFormatType(v11);
  if (v12 == 1278226488)
  {
    int v13 = 1;
  }
  else
  {
    int v13 = 7;
    if (v12 != 1278226534 && v12 != 1717855600)
    {
      NSLog(&cfstr_ErrorGuidePixe.isa);
      int v13 = 0;
    }
  }
  if (v13 != v10) {
    NSLog(&cfstr_ErrorGuidePixe_0.isa);
  }
  HGCVBitmap::create((HGCVPixelBuffer *)v11, v13, 0, &v22);
  v14 = (__CVBuffer *)[v7 cvPixelBuffer];
  OSType v15 = CVPixelBufferGetPixelFormatType(v14);
  if (v15 == 1278226488)
  {
    int v16 = 1;
  }
  else
  {
    int v16 = 7;
    if (v15 != 1278226534 && v15 != 1717855600)
    {
      NSLog(&cfstr_ErrorGuidePixe.isa);
      int v16 = 0;
    }
  }
  if (v16 != v10) {
    NSLog(&cfstr_ErrorOutputPix.isa);
  }
  HGCVBitmap::create((HGCVPixelBuffer *)v14, v16, 0, &v21);
  int radius = self->_radius;
  if (radius >= -1) {
    int v18 = (radius + 1) & 1;
  }
  else {
    int v18 = -((radius + 1) & 1);
  }
  HGCVBitmap::lock(v23, 1uLL);
  HGCVBitmap::lock(v22, 1uLL);
  HGCVBitmap::lock(v21, 0);
  *(float *)&double v19 = self->_epsilon;
  [(PVComputeGuidedFilter *)self runCPUPathOnInput:v23 guide:v22 output:v21 radius:(v18 + radius) epsilon:v19];
  HGCVBitmap::unlock(v23, 1uLL);
  HGCVBitmap::unlock(v22, 1uLL);
  HGCVBitmap::unlock(v21, 0);
  if (v21) {
    (*(void (**)(HGCVBitmap *))(*(void *)v21 + 24))(v21);
  }
  if (v22) {
    (*(void (**)(HGCVBitmap *))(*(void *)v22 + 24))(v22);
  }
  if (v23) {
    (*(void (**)(HGCVBitmap *))(*(void *)v23 + 24))(v23);
  }

  return 1;
}

- (BOOL)runCPUPathOnInput:(void *)a3 guide:(void *)a4 output:(void *)a5 radius:(int)a6 epsilon:(float)a7
{
  uint64_t v7 = *(void *)&a6;
  uint64_t v160 = *((int *)a3 + 7);
  uint64_t v159 = *((int *)a3 + 5);
  uint64_t v10 = v160 - v159;
  uint64_t v11 = *((int *)a3 + 8) - (uint64_t)*((int *)a3 + 6);
  uint64_t v162 = *((void *)a3 + 10);
  uint64_t v12 = *((void *)a4 + 10);
  uint64_t v151 = *((void *)a5 + 10);
  uint64_t v13 = *((void *)a3 + 8);
  uint64_t v14 = *((void *)a4 + 8);
  uint64_t v150 = *((void *)a5 + 8);
  size_t v15 = 16 * (v160 - v159);
  int v16 = (float *)HGMemory::allocate((HGMemory *)(v15 * v11), 0, (unint64_t *)a3);
  uint64_t v18 = HGMemory::allocate((HGMemory *)(v15 * v11), 0, v17);
  int v19 = *((_DWORD *)a3 + 4);
  v157 = (HGMemory *)v18;
  if (v19 == 1)
  {
    LODWORD(v145) = v7;
    -[PVComputeGuidedFilter processStage1UInt8Input:inputRowBytes:guide:guideRowBytes:output:outputRowBytes:width:height:radius:](self, "processStage1UInt8Input:inputRowBytes:guide:guideRowBytes:output:outputRowBytes:width:height:radius:", v162, v13, v12, v14, v18, v15, __PAIR64__(v11, v10), v145);
    uint64_t v21 = v11;
    v20 = (char *)v157;
  }
  else
  {
    v20 = (char *)v18;
    uint64_t v21 = v11;
    if (v19 == 7)
    {
      LODWORD(v145) = v7;
      -[PVComputeGuidedFilter processStage1Float32Input:inputRowBytes:guide:guideRowBytes:output:outputRowBytes:width:height:radius:](self, "processStage1Float32Input:inputRowBytes:guide:guideRowBytes:output:outputRowBytes:width:height:radius:", v162, v13, v12, v14, v18, v15, __PAIR64__(v11, v10), v145);
    }
  }
  int v22 = (2 * v7) | 1;
  memcpy(v16, v20, v15);
  uint64_t v24 = (v7 + 1);
  if ((int)v7 > 0)
  {
    uint64_t v25 = (uint64_t)&v20[16 * v160 + 8 + -16 * v159];
    uint64_t v26 = 1;
    do
    {
      v27 = v16 + 2;
      v28 = (float *)v25;
      uint64_t v29 = v10;
      if ((int)v10 >= 1)
      {
        do
        {
          float v30 = *(v27 - 1);
          *(v27 - 2) = *(v27 - 2) + (float)(*(v28 - 2) + *(v28 - 2));
          *(v27 - 1) = v30 + (float)(*(v28 - 1) + *(v28 - 1));
          float v31 = v27[1];
          float *v27 = *v27 + (float)(*v28 + *v28);
          v27[1] = v31 + (float)(v28[1] + v28[1]);
          v28 += 4;
          v27 += 4;
          --v29;
        }
        while (v29);
      }
      ++v26;
      v25 += v15;
    }
    while (v26 != v24);
    uint64_t v32 = 0;
    uint64_t v33 = (uint64_t)&v20[v15 * v7 + 8];
    uint64_t v34 = (uint64_t)&v20[v15 * (int)v24 + 8];
    v35 = v16 + 2;
    do
    {
      v36 = v35;
      v37 = (float *)v34;
      v38 = (float *)v33;
      uint64_t v39 = v10;
      if ((int)v10 >= 1)
      {
        do
        {
          float v40 = *(v36 - 1);
          unint64_t v23 = (unint64_t)&v36[v15 / 4];
          *(float *)(v23 - 8) = (float)(*(v36 - 2) + *(v37 - 2)) - *(v38 - 2);
          *(float *)(v23 - 4) = (float)(v40 + *(v37 - 1)) - *(v38 - 1);
          float v41 = *v36;
          float v42 = v36[1];
          v36 += 4;
          *(float *)unint64_t v23 = (float)(v41 + *v37) - *v38;
          *(float *)(v23 + 4) = (float)(v42 + v37[1]) - v38[1];
          v38 += 4;
          v37 += 4;
          --v39;
        }
        while (v39);
      }
      ++v32;
      v33 += 16 * v159 - 16 * v160;
      v34 += v15;
      v35 = (float *)((char *)v35 + v15);
    }
    while (v32 != v7);
  }
  if (v22 < (int)v21)
  {
    uint64_t v43 = v22;
    v44 = &v20[v15 * v22];
    uint64_t v45 = (uint64_t)v16 + v15 * (int)v7 + 8;
    uint64_t v46 = (uint64_t)v16 + v15 * (int)v24 + 8;
    v47 = v20;
    do
    {
      if ((int)v10 >= 1)
      {
        uint64_t v48 = 0;
        do
        {
          unint64_t v23 = v46 + v48;
          *(float *)(v23 - 8) = (float)(*(float *)(v45 + v48 - 8) + *(float *)&v44[v48]) - *(float *)&v47[v48];
          *(float *)(v23 - 4) = (float)(*(float *)(v45 + v48 - 4) + *(float *)&v44[v48 + 4]) - *(float *)&v47[v48 + 4];
          *(float *)unint64_t v23 = (float)(*(float *)(v45 + v48) + *(float *)&v44[v48 + 8]) - *(float *)&v47[v48 + 8];
          *(float *)(v23 + 4) = (float)(*(float *)(v45 + v48 + 4) + *(float *)&v44[v48 + 12]) - *(float *)&v47[v48 + 12];
          v48 += 16;
        }
        while (16 * v10 != v48);
      }
      ++v43;
      v44 += v15;
      v45 += v15;
      v46 += v15;
      v47 += v15;
    }
    while (v43 < v21);
  }
  int v49 = v21 - v7;
  if ((int)v7 >= 1)
  {
    uint64_t v50 = v49;
    uint64_t v51 = (uint64_t)&v20[v15 * ((int)v21 + ~(2 * (int)v7)) + 8];
    uint64_t v52 = (uint64_t)&v20[v15 * ((int)v21 - 2) + 8];
    uint64_t v53 = (uint64_t)v16 + v15 * ((int)v21 - (int)v7 - 1) + 8;
    uint64_t v54 = (uint64_t)v16 + v15 * v49 + 8;
    do
    {
      v55 = (float *)v54;
      v56 = (float *)v53;
      v57 = (float *)v52;
      v58 = (float *)v51;
      unint64_t v23 = v10;
      if ((int)v10 >= 1)
      {
        do
        {
          *(v55 - 2) = (float)(*(v56 - 2) + *(v57 - 2)) - *(v58 - 2);
          *(v55 - 1) = (float)(*(v56 - 1) + *(v57 - 1)) - *(v58 - 1);
          float *v55 = (float)(*v56 + *v57) - *v58;
          float v59 = v58[1];
          v58 += 4;
          v55[1] = (float)(v56[1] + v57[1]) - v59;
          v57 += 4;
          v56 += 4;
          v55 += 4;
          --v23;
        }
        while (v23);
      }
      ++v50;
      v51 += v15;
      v52 += 16 * v159 - 16 * v160;
      v53 += v15;
      v54 += v15;
    }
    while (v50 < v21);
  }
  int v146 = v21 + ~(2 * v7);
  int v147 = v21 - 2;
  int v148 = v49 - 1;
  int v149 = v21 - v7;
  unsigned int v154 = v7 + 1;
  int v155 = (2 * v7) | 1;
  uint64_t v153 = v12;
  uint64_t v156 = v21;
  if ((int)v21 >= 1)
  {
    uint64_t v60 = 0;
    float v61 = 1.0 / (float)(v155 * v155);
    do
    {
      if ((int)v10 >= 1)
      {
        v62 = (float32x2_t *)((char *)v16 + v15 * v60);
        int v63 = v160 - v159;
        do
        {
          float32x2_t v64 = vmul_n_f32(*v62, v61);
          v62[1] = vsub_f32(vmul_n_f32(v62[1], v61), vmul_n_f32(v64, v64.f32[0]));
          v62 += 2;
          --v63;
        }
        while (v63);
      }
      ++v60;
    }
    while (v60 != v21);
    uint64_t v65 = 0;
    do
    {
      if ((int)v10 >= 1)
      {
        v66 = (float *)((char *)v16 + v15 * v65);
        int v67 = v160 - v159;
        do
        {
          float v68 = v66[3] / (float)(v66[2] + a7);
          float v69 = (float)(v61 * v66[1]) - (float)((float)(v61 * *v66) * v68);
          float *v66 = v68;
          v66[1] = v69;
          v66 += 4;
          --v67;
        }
        while (v67);
      }
      ++v65;
    }
    while (v65 != v21);
    uint64_t v70 = 0;
    int v163 = v154 + v7;
    uint64_t v71 = (int)v10 - (int)v7;
    v72 = v16 + 5;
    int v161 = 4 * v7;
    v73 = v16 + 7;
    int v74 = (8 * v7) | 5;
    v75 = v16 + 1;
    int v76 = 4 * v160;
    unint64_t v23 = -(4 * v159 + 4 * v7);
    int v77 = 4 * v159 + 8 * v7;
    unsigned int v78 = v77 ^ 0xFFFFFFFD;
    unsigned int v79 = v77 ^ 0xFFFFFFFC;
    do
    {
      v80 = (float *)((char *)v16 + v15 * v70);
      float v82 = *v80;
      float v81 = v80[1];
      if ((int)v7 < 1)
      {
        v80[2] = v82;
        v80[3] = v81;
      }
      else
      {
        uint64_t v83 = v154 - 1;
        v84 = v72;
        do
        {
          float v82 = v82 + (float)(*(v84 - 1) + *(v84 - 1));
          float v85 = *v84;
          v84 += 4;
          float v81 = v81 + (float)(v85 + v85);
          --v83;
        }
        while (v83);
        int v86 = 4 * v154;
        int v87 = v161;
        v80[2] = v82;
        v80[3] = v81;
        uint64_t v88 = v154 - 1;
        v89 = v73;
        do
        {
          float v82 = (float)(v82 + v80[v86]) - v80[v87];
          float v81 = (float)(v81 + v80[v86 + 1]) - v80[v87 + 1];
          *(v89 - 1) = v82;
          float *v89 = v81;
          v87 -= 4;
          v89 += 4;
          v86 += 4;
          --v88;
        }
        while (v88);
      }
      v90 = v16;
      v91 = v75;
      int v92 = v74;
      int v93 = (4 * v154) | 3;
      uint64_t v94 = v155;
      if (v163 < (int)v10)
      {
        do
        {
          float v82 = (float)(v82 + v80[v92 - 1]) - *(v91 - 1);
          float v95 = *v91;
          v91 += 4;
          float v81 = (float)(v81 + v80[v92]) - v95;
          v80[v93 - 1] = v82;
          v80[v93] = v81;
          ++v94;
          v93 += 4;
          v92 += 4;
        }
        while (v94 < v10);
      }
      unsigned int v96 = v79;
      unsigned int v97 = v78;
      int v98 = -8 - 4 * v159;
      int v99 = -7 - 4 * v159;
      int v100 = v23;
      uint64_t v101 = v71;
      uint64_t v102 = v7;
      if ((int)v7 >= 1)
      {
        do
        {
          float v103 = v80[v76 + v99];
          float v82 = (float)(v82 + v80[v76 + v98]) - v80[v76 + v96];
          float v104 = v80[v76 + v97];
          int v105 = v76 + v100;
          v80[v105 + 2] = v82;
          float v81 = (float)(v81 + v103) - v104;
          v80[v105 + 3] = v81;
          ++v101;
          v100 += 4;
          v99 -= 4;
          v98 -= 4;
          v97 += 4;
          v96 += 4;
        }
        while (v101 < v10);
      }
      ++v70;
      v72 = (float *)((char *)v72 + v15);
      v73 = (float *)((char *)v73 + v15);
      v75 = (float *)((char *)v75 + v15);
      uint64_t v7 = v102;
      int v16 = v90;
    }
    while (v70 != v156);
  }
  if ((int)v10 >= 1)
  {
    uint64_t v106 = v10;
    v107 = v16 + 2;
    do
    {
      *(v107 - 1) = *v107;
      v107 += 2;
      --v106;
    }
    while (v106);
  }
  if ((int)v7 >= 1)
  {
    uint64_t v108 = 1;
    uint64_t v109 = 16 * (v160 - v159);
    do
    {
      v110 = v16 + 2;
      uint64_t v111 = v10;
      if ((int)v10 >= 1)
      {
        do
        {
          float v112 = *(v110 - 1);
          *(v110 - 2) = *(v110 - 2) + (float)(*(float *)((char *)v110 + v109) + *(float *)((char *)v110 + v109));
          *(v110 - 1) = v112 + (float)(*(float *)((char *)v110 + v109 + 4) + *(float *)((char *)v110 + v109 + 4));
          v110 += 4;
          --v111;
        }
        while (v111);
      }
      ++v108;
      v109 += v15;
    }
    while (v108 != v154);
    uint64_t v113 = 0;
    uint64_t v114 = v15 * (int)v154 + 8;
    uint64_t v115 = (uint64_t)v16 + v15 * v7 + 12;
    v116 = v16;
    do
    {
      v117 = (float *)v115;
      v118 = v116;
      uint64_t v119 = v10;
      if ((int)v10 >= 1)
      {
        do
        {
          float v120 = v118[1];
          unint64_t v23 = (unint64_t)&v118[v15 / 4];
          *(float *)unint64_t v23 = (float)(*v118 + *(float *)((char *)v118 + v114)) - *(v117 - 1);
          float v121 = *v117;
          v117 += 4;
          *(float *)(v23 + 4) = (float)(v120 + *(float *)((char *)v118 + v114 + 4)) - v121;
          v118 += 4;
          --v119;
        }
        while (v119);
      }
      ++v113;
      v116 = (float *)((char *)v116 + v15);
      v115 += 16 * v159 - 16 * v160;
    }
    while (v113 != v7);
  }
  if (v155 < (int)v156)
  {
    uint64_t v122 = v155;
    v123 = (char *)v16 + v15 * v155;
    v124 = (char *)v16 + v15 * (int)v154;
    uint64_t v125 = (uint64_t)v16 + v15 * (int)v7 + 4;
    v126 = v16;
    do
    {
      if ((int)v10 >= 1)
      {
        unint64_t v127 = 0;
        do
        {
          unint64_t v23 = (unint64_t)&v124[v127];
          *(float *)unint64_t v23 = (float)(*(float *)(v125 + v127 - 4) + *(float *)&v123[v127 + 8]) - v126[v127 / 4 + 2];
          *(float *)(v23 + 4) = (float)(*(float *)(v125 + v127) + *(float *)&v123[v127 + 12]) - v126[v127 / 4 + 3];
          v127 += 16;
        }
        while (16 * v10 != v127);
      }
      ++v122;
      v123 += v15;
      v124 += v15;
      v125 += v15;
      v126 = (float *)((char *)v126 + v15);
    }
    while (v122 < v156);
  }
  if ((int)v7 >= 1)
  {
    uint64_t v128 = v149;
    uint64_t v129 = (uint64_t)v16 + v15 * v147 + 12;
    uint64_t v130 = (uint64_t)v16 + v15 * v149 + 4;
    uint64_t v131 = (uint64_t)v16 + v15 * v148 + 4;
    uint64_t v132 = (uint64_t)v16 + v15 * v146 + 12;
    do
    {
      v133 = (float *)v132;
      v134 = (float *)v131;
      v135 = (float *)v130;
      v136 = (float *)v129;
      unint64_t v23 = v10;
      if ((int)v10 >= 1)
      {
        do
        {
          *(v135 - 1) = (float)(*(v134 - 1) + *(v136 - 1)) - *(v133 - 1);
          float v137 = *v134;
          v134 += 4;
          float v138 = v137;
          float v139 = *v136;
          v136 += 4;
          float v140 = v138 + v139;
          float v141 = *v133;
          v133 += 4;
          float *v135 = v140 - v141;
          v135 += 4;
          --v23;
        }
        while (v23);
      }
      ++v128;
      v129 += 16 * v159 - 16 * v160;
      v130 += v15;
      v131 += v15;
      v132 += v15;
    }
    while (v128 < v156);
  }
  int v142 = *((_DWORD *)a5 + 4);
  if (v142 == 1)
  {
    LODWORD(v145) = v7;
    -[PVComputeGuidedFilter processStage5UInt6Guide:guideRowBytes:stats:statsRowBytes:output:outputRowBytes:width:height:radius:](self, "processStage5UInt6Guide:guideRowBytes:stats:statsRowBytes:output:outputRowBytes:width:height:radius:", v153, v14, v16, v15, v151, v150, __PAIR64__(v156, v10), v145);
  }
  else if (v142 == 7)
  {
    LODWORD(v145) = v7;
    -[PVComputeGuidedFilter processStage5Float32Guide:guideRowBytes:stats:statsRowBytes:output:outputRowBytes:width:height:radius:](self, "processStage5Float32Guide:guideRowBytes:stats:statsRowBytes:output:outputRowBytes:width:height:radius:", v153, v14, v16, v15, v151, v150, __PAIR64__(v156, v10), v145);
  }
  HGMemory::release((HGMemory *)v16, (void *)v23);
  HGMemory::release(v157, v143);
  return 1;
}

- (void)processStage1Float32Input:(float *)a3 inputRowBytes:(unint64_t)a4 guide:(float *)a5 guideRowBytes:(unint64_t)a6 output:(float *)a7 outputRowBytes:(unint64_t)a8 width:(int)a9 height:(int)a10 radius:(int)a11
{
  unsigned int v78 = a5;
  if (a10 >= 1)
  {
    uint64_t v12 = 0;
    uint64_t v13 = (a11 + 1);
    int v77 = v13 + a11;
    uint64_t v14 = &a3[a11];
    size_t v15 = a3 + 1;
    int v16 = &a5[a11];
    v17 = a5 + 1;
    uint64_t v76 = v13 - 1;
    uint64_t v18 = &a3[(int)v13];
    int v19 = a7 + 7;
    v20 = &a5[(int)v13];
    uint64_t v21 = 1 - v13;
    int v22 = 4 * a11;
    unint64_t v23 = (8 * ((unint64_t)(2 * a11) >> 1)) | 4;
    uint64_t v24 = (char *)a5 + v23;
    uint64_t v25 = (char *)a3 + v23;
    int v75 = ~(2 * a11) + a9;
    uint64_t v26 = &a5[v75];
    v27 = a3;
    v28 = &a3[v75];
    do
    {
      float v29 = *(float *)((char *)v78 + v12 * a6);
      float v30 = (float *)((char *)a7 + v12 * a8);
      float v31 = *(float *)((char *)a3 + v12 * a4);
      float v32 = v29 * v29;
      float v33 = v29 * v31;
      if (a11 < 1)
      {
        *float v30 = v29;
        v30[1] = v31;
        v30[2] = v32;
        v30[3] = v33;
      }
      else
      {
        uint64_t v34 = v76;
        v35 = v17;
        v36 = v15;
        do
        {
          float v37 = *v35++;
          float v38 = v37;
          float v39 = *v36++;
          float v29 = v29 + (float)(v38 + v38);
          float v31 = v31 + (float)(v39 + v39);
          float v32 = v32 + (float)((float)(v38 * v38) + (float)(v38 * v38));
          float v33 = v33 + (float)((float)(v38 * v39) + (float)(v38 * v39));
          --v34;
        }
        while (v34);
        *float v30 = v29;
        v30[1] = v31;
        v30[2] = v32;
        v30[3] = v33;
        uint64_t v40 = 0;
        float v41 = v20;
        float v42 = v19;
        uint64_t v43 = v18;
        do
        {
          float v44 = *v41++;
          float v45 = v44;
          float v46 = *v43++;
          float v47 = v29 + v45;
          float v48 = v32 + (float)(v45 * v45);
          float v49 = v33 + (float)(v45 * v46);
          float v50 = v16[v40];
          float v51 = v14[v40];
          float v29 = v47 - v50;
          float v31 = (float)(v31 + v46) - v51;
          float v32 = v48 - (float)(v50 * v50);
          float v33 = v49 - (float)(v50 * v51);
          *(v42 - 3) = v29;
          *(v42 - 2) = v31;
          *(v42 - 1) = v32;
          *float v42 = v33;
          --v40;
          v42 += 4;
        }
        while (v21 != v40);
      }
      if (v77 < a9)
      {
        unint64_t v52 = 0;
        uint64_t v53 = (~(2 * a11) + a9);
        do
        {
          float v54 = *(float *)&v24[v52];
          float v55 = *(float *)&v25[v52];
          float v56 = v29 + v54;
          float v57 = v31 + v55;
          float v58 = v32 + (float)(v54 * v54);
          float v59 = v54 * v55;
          float v60 = a5[v52 / 4];
          float v61 = v33 + v59;
          float v62 = v27[v52 / 4];
          float v29 = v56 - v60;
          float v31 = v57 - v62;
          float v32 = v58 - (float)(v60 * v60);
          v30[v22 + 4 + (int)v52] = v29;
          v30[v22 + 5 + (int)v52] = v31;
          v30[v22 + 6 + (int)v52] = v32;
          float v33 = v61 - (float)(v60 * v62);
          v30[v22 + 7 + (int)v52] = v33;
          v52 += 4;
          --v53;
        }
        while (v53);
      }
      if (a11 >= 1)
      {
        uint64_t v63 = 0;
        uint64_t v64 = a9 - 2;
        uint64_t v65 = a9 - a11;
        do
        {
          float v66 = a5[v64];
          float v67 = v27[v64];
          float v68 = v29 + v66;
          float v69 = v31 + v67;
          float v70 = v32 + (float)(v66 * v66);
          float v71 = v33 + (float)(v66 * v67);
          float v72 = v26[v63];
          float v73 = v28[v63];
          float v29 = v68 - v72;
          float v31 = v69 - v73;
          float v32 = v70 - (float)(v72 * v72);
          int v74 = 4 * a9 - 4 * a11 + v63 * 4;
          v30[v74] = v29;
          v30[v74 + 1] = v31;
          float v33 = v71 - (float)(v72 * v73);
          v30[v74 + 2] = v32;
          v30[v74 + 3] = v33;
          ++v65;
          ++v63;
          --v64;
        }
        while (v65 < a9);
      }
      ++v12;
      size_t v15 = (float *)((char *)v15 + a4);
      v17 = (float *)((char *)v17 + a6);
      uint64_t v14 = (float *)((char *)v14 + a4);
      int v16 = (float *)((char *)v16 + a6);
      uint64_t v18 = (float *)((char *)v18 + a4);
      int v19 = (float *)((char *)v19 + a8);
      v20 = (float *)((char *)v20 + a6);
      v24 += a6;
      v25 += a4;
      v27 = (float *)((char *)v27 + a4);
      a5 = (float *)((char *)a5 + a6);
      uint64_t v26 = (float *)((char *)v26 + a6);
      v28 = (float *)((char *)v28 + a4);
    }
    while (v12 != a10);
  }
}

- (void)processStage5Float32Guide:(float *)a3 guideRowBytes:(unint64_t)a4 stats:(float *)a5 statsRowBytes:(unint64_t)a6 output:(float *)a7 outputRowBytes:(unint64_t)a8 width:(int)a9 height:(int)a10 radius:(int)a11
{
  if (a10 >= 1)
  {
    for (uint64_t i = 0; i != a10; ++i)
    {
      if (a9 >= 1)
      {
        uint64_t v13 = (float *)((char *)a5 + i * a6);
        uint64_t v14 = a9;
        size_t v15 = a3;
        int v16 = a7;
        do
        {
          float v17 = *v13;
          float v18 = v13[1];
          v13 += 4;
          float v19 = *v15++;
          float v12 = 1.0 / (float)(((2 * a11) | 1) * ((2 * a11) | 1));
          *v16++ = (float)(v12 * v18) + (float)((float)(v12 * v17) * v19);
          --v14;
        }
        while (v14);
      }
      a7 = (float *)((char *)a7 + a8);
      a3 = (float *)((char *)a3 + a4);
    }
  }
}

- (void)processStage1UInt8Input:(char *)a3 inputRowBytes:(unint64_t)a4 guide:(char *)a5 guideRowBytes:(unint64_t)a6 output:(float *)a7 outputRowBytes:(unint64_t)a8 width:(int)a9 height:(int)a10 radius:(int)a11
{
  if (a10 >= 1)
  {
    uint64_t v16 = 0;
    uint64_t v17 = (a11 + 1);
    int v18 = (2 * a11) | 1;
    uint64_t v19 = (~(2 * a11) + a9);
    v20 = a3 + 1;
    uint64_t v21 = a5 + 1;
    int v22 = a3;
    unint64_t v23 = a5;
    uint64_t v24 = &a5[v18];
    uint64_t v25 = &a3[v18];
    do
    {
      uint64_t v26 = (float *)((char *)a7 + v16 * a8);
      LOBYTE(v11) = a5[v16 * a6];
      LOBYTE(v12) = a3[v16 * a4];
      float v11 = (float)LODWORD(v11) / 255.0;
      float v27 = (float)LODWORD(v12) / 255.0;
      float v28 = v11 * v11;
      float v12 = v11 * v27;
      if (a11 < 1)
      {
        *uint64_t v26 = v11;
        v26[1] = v27;
        v26[2] = v28;
        v26[3] = v12;
      }
      else
      {
        uint64_t v29 = v17 - 1;
        float v30 = v21;
        float v31 = v20;
        do
        {
          unsigned int v32 = *v30++;
          float v33 = (float)v32;
          unsigned int v34 = *v31++;
          float v35 = v33 / 255.0;
          float v36 = (float)v34 / 255.0;
          float v11 = v11 + (float)(v35 + v35);
          float v27 = v27 + (float)(v36 + v36);
          float v14 = (float)(v35 * v35) + (float)(v35 * v35);
          float v28 = v28 + v14;
          float v13 = (float)(v35 * v36) + (float)(v35 * v36);
          float v12 = v12 + v13;
          --v29;
        }
        while (v29);
        *uint64_t v26 = v11;
        v26[1] = v27;
        v26[2] = v28;
        v26[3] = v12;
        uint64_t v37 = 0;
        uint64_t v39 = (int)v17;
        uint64_t v38 = a11;
        do
        {
          LOBYTE(v13) = v23[v39];
          float v40 = (float)LODWORD(v13) / 255.0;
          LOBYTE(v14) = v22[v39];
          float v41 = (float)LODWORD(v14) / 255.0;
          float v42 = v11 + v40;
          float v43 = v27 + v41;
          *(float *)&unsigned int v44 = v40 * v40;
          LOBYTE(v15) = v23[v38];
          float v45 = v28 + (float)(v40 * v40);
          float v46 = v40 * v41;
          float v47 = (float)v15 / 255.0;
          LOBYTE(v44) = v22[v38];
          float v48 = v12 + v46;
          float v13 = (float)v44 / 255.0;
          float v11 = v42 - v47;
          float v49 = v47 * v47;
          float v14 = v47 * v13;
          float v27 = v43 - v13;
          v26[(v37 + 5)] = v27;
          float v28 = v45 - v49;
          float v12 = v48 - v14;
          v26[(v37 + 4)] = v11;
          v26[(v37 + 6)] = v28;
          v26[(v37 + 7)] = v12;
          ++v39;
          --v38;
          v37 += 4;
        }
        while (4 * (a11 + 1) - 4 != v37);
      }
      if ((int)v17 + a11 < a9)
      {
        uint64_t v50 = 0;
        int v51 = 4 * a11 + 7;
        do
        {
          LOBYTE(v13) = v24[v50];
          LOBYTE(v14) = v25[v50];
          float v52 = (float)LODWORD(v13) / 255.0;
          *(float *)&unsigned int v53 = (float)LODWORD(v14) / 255.0;
          float v54 = v11 + v52;
          float v55 = v27 + *(float *)&v53;
          float v56 = v28 + (float)(v52 * v52);
          *(float *)&unsigned int v57 = v52 * *(float *)&v53;
          LOBYTE(v53) = v23[v50];
          float v14 = (float)v53 / 255.0;
          float v58 = v12 + *(float *)&v57;
          LOBYTE(v57) = v22[v50];
          float v59 = (float)v57 / 255.0;
          float v11 = v54 - v14;
          float v27 = v55 - v59;
          float v28 = v56 - (float)(v14 * v14);
          float v13 = v14 * v59;
          v26[v51 - 3] = v11;
          v26[v51 - 2] = v27;
          v26[v51 - 1] = v28;
          float v12 = v58 - v13;
          v26[v51] = v12;
          ++v50;
          v51 += 4;
        }
        while (v19 != v50);
      }
      int v60 = (4 * a9 - 4 * a11) | 3;
      uint64_t v61 = a9 - a11;
      uint64_t v62 = a9 - 2;
      uint64_t v63 = (int)v19;
      if (a11 >= 1)
      {
        do
        {
          LOBYTE(v13) = v23[v62];
          float v64 = (float)LODWORD(v13) / 255.0;
          LOBYTE(v14) = v22[v62];
          *(float *)&unsigned int v65 = (float)LODWORD(v14) / 255.0;
          float v66 = v11 + v64;
          float v67 = v27 + *(float *)&v65;
          *(float *)&unsigned int v68 = v64 * v64;
          float v69 = v64 * *(float *)&v65;
          LOBYTE(v65) = v23[v63];
          float v70 = v28 + *(float *)&v68;
          float v14 = (float)v65 / 255.0;
          LOBYTE(v68) = v22[v63];
          float v71 = (float)v68;
          float v72 = v12 + v69;
          float v11 = v66 - v14;
          float v27 = v67 - (float)(v71 / 255.0);
          float v13 = v14 * (float)(v71 / 255.0);
          float v28 = v70 - (float)(v14 * v14);
          v26[v60 - 3] = v11;
          v26[v60 - 2] = v27;
          float v12 = v72 - v13;
          v26[v60 - 1] = v28;
          v26[v60] = v12;
          ++v61;
          --v62;
          ++v63;
          v60 += 4;
        }
        while (v61 < a9);
      }
      ++v16;
      v20 += a4;
      v21 += a6;
      v23 += a6;
      v22 += a4;
      v24 += a6;
      v25 += a4;
    }
    while (v16 != a10);
  }
}

- (void)processStage5UInt6Guide:(char *)a3 guideRowBytes:(unint64_t)a4 stats:(float *)a5 statsRowBytes:(unint64_t)a6 output:(char *)a7 outputRowBytes:(unint64_t)a8 width:(int)a9 height:(int)a10 radius:(int)a11
{
  if (a10 >= 1)
  {
    for (uint64_t i = 0; i != a10; ++i)
    {
      if (a9 >= 1)
      {
        float v13 = (float *)((char *)a5 + i * a6);
        uint64_t v14 = a9;
        unsigned int v15 = a3;
        uint64_t v16 = a7;
        do
        {
          unsigned int v17 = *v15++;
          float v18 = *v13;
          float v19 = v13[1];
          v13 += 4;
          float v12 = 1.0 / (float)(((2 * a11) | 1) * ((2 * a11) | 1));
          *v16++ = (int)fmin(fmax((float)((float)((float)(v12 * v19)+ (float)((float)(v12 * v18) * (float)((float)v17 / 255.0)))* 255.0), 0.0), 255.0);
          --v14;
        }
        while (v14);
      }
      a7 += a8;
      a3 += a4;
    }
  }
}

- (int)radius
{
  return self->_radius;
}

- (float)epsilon
{
  return self->_epsilon;
}

- (void).cxx_destruct
{
}

@end