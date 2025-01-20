@interface PVComputeDenseCRF
- (PVComputeDenseCRF)initWithColor:(id)a3 proximity:(id)a4;
- (void)generateMatte:(id)a3;
@end

@implementation PVComputeDenseCRF

- (PVComputeDenseCRF)initWithColor:(id)a3 proximity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PVComputeDenseCRF;
  v9 = [(PVComputeDenseCRF *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_color, a3);
    objc_storeStrong((id *)&v10->_proxy, a4);
  }

  return v10;
}

- (void)generateMatte:(id)a3
{
  id v4 = a3;
  v5 = [(PVImageBuffer *)self->_color cvPixelBuffer];
  v6 = [(PVImageBuffer *)self->_proxy cvPixelBuffer];
  id v7 = (HGCVPixelBuffer *)[v4 cvPixelBuffer];
  HGCVBitmap::create((HGCVPixelBuffer *)v5, 21, 0, &v87);
  HGCVBitmap::create((HGCVPixelBuffer *)v6, 21, 0, &v86);
  HGCVBitmap::create(v7, 28, 0, &v85);
  uint64_t v8 = v86;
  int v9 = *((_DWORD *)v87 + 7);
  int v10 = *((_DWORD *)v87 + 5);
  unint64_t v11 = (v9 - v10);
  if (v11 == *(_DWORD *)(v86 + 28) - *(_DWORD *)(v86 + 20))
  {
    int v12 = *((_DWORD *)v87 + 8);
    int v13 = *((_DWORD *)v87 + 6);
    unint64_t v14 = (v12 - v13);
    if (v14 == *(_DWORD *)(v86 + 32) - *(_DWORD *)(v86 + 24)
      && v11 == *((_DWORD *)v85 + 7) - *((_DWORD *)v85 + 5)
      && v14 == *((_DWORD *)v85 + 8) - *((_DWORD *)v85 + 6))
    {
      v15 = HGObject::operator new(0x80uLL);
      HGBitmap::HGBitmap(v15, *(void *)(v8 + 20), *(void *)(v8 + 28), 7);
      if (v12 != v13)
      {
        uint64_t v16 = 0;
        v17 = *(float **)(v86 + 80);
        uint64_t v18 = *(void *)(v86 + 64);
        v19 = (float *)v15[10];
        uint64_t v20 = v15[8];
        if (v11 <= 1) {
          uint64_t v21 = 1;
        }
        else {
          uint64_t v21 = (v9 - v10);
        }
        if (v14 <= 1) {
          uint64_t v22 = 1;
        }
        else {
          uint64_t v22 = (v12 - v13);
        }
        do
        {
          v23 = v17;
          v24 = v19;
          uint64_t v25 = v21;
          if (v9 != v10)
          {
            do
            {
              float v26 = *v23;
              v23 += 3;
              float v27 = v26;
              if (v26 >= 0.25) {
                float v27 = 0.0;
              }
              *v24++ = v27;
              --v25;
            }
            while (v25);
          }
          ++v16;
          v19 = (float *)((char *)v19 + v20);
          v17 = (float *)((char *)v17 + v18);
        }
        while (v16 != v22);
      }
      unint64_t v77 = (v12 - v13);
      v28 = v87;
      v75 = v15;
      v29 = HGObject::operator new(0x80uLL);
      HGBitmap::HGBitmap(v29, *(void *)((char *)v28 + 20), *(void *)((char *)v28 + 28), 7);
      v30 = v87;
      if (v12 != v13)
      {
        uint64_t v31 = 0;
        uint64_t v32 = *((void *)v87 + 8);
        v33 = (float *)v29[10];
        uint64_t v34 = v29[8];
        if (v11 <= 1) {
          uint64_t v35 = 1;
        }
        else {
          uint64_t v35 = (v9 - v10);
        }
        uint64_t v36 = (v12 - v13);
        if (v77 <= 1) {
          uint64_t v36 = 1;
        }
        uint64_t v37 = *((void *)v87 + 10) + 8;
        do
        {
          v38 = (float *)v37;
          v39 = v33;
          uint64_t v40 = v35;
          if (v9 != v10)
          {
            do
            {
              float v41 = *(v38 - 2);
              float v42 = *(v38 - 1);
              float v43 = *v38;
              if (*v38 <= v41) {
                float v44 = *(v38 - 2);
              }
              else {
                float v44 = *v38;
              }
              if (*v38 >= v41) {
                float v45 = *(v38 - 2);
              }
              else {
                float v45 = *v38;
              }
              if (v42 <= v41) {
                float v46 = *(v38 - 2);
              }
              else {
                float v46 = *(v38 - 1);
              }
              if (v42 >= v41) {
                float v47 = *(v38 - 2);
              }
              else {
                float v47 = *(v38 - 1);
              }
              if (v43 <= v42) {
                float v44 = v46;
              }
              if (v43 >= v42) {
                float v45 = v47;
              }
              float v48 = v44 - v45;
              if (v48 == 0.0)
              {
                float v51 = 0.0;
              }
              else
              {
                float v49 = (float)((float)(v43 - v42) / v48) + 4.0;
                if (v42 == v44) {
                  float v49 = (float)((float)(v41 - v43) / v48) + 2.0;
                }
                float v50 = (float)(v42 - v41) / v48;
                if (v43 != v44) {
                  float v50 = v49;
                }
                float v51 = v50 / 6.0;
                if (v51 < 0.0) {
                  float v51 = v51 + 1.0;
                }
              }
              *v39++ = v51;
              v38 += 3;
              --v40;
            }
            while (v40);
          }
          ++v31;
          v33 = (float *)((char *)v33 + v34);
          v37 += v32;
        }
        while (v31 != v36);
      }
      v52 = HGObject::operator new(0x80uLL);
      HGBitmap::HGBitmap(v52, *(void *)((char *)v30 + 20), *(void *)((char *)v30 + 28), 7);
      v53 = v87;
      v74 = v52;
      int v82 = v10;
      v73 = HGObject::operator new(0x80uLL);
      HGBitmap::HGBitmap(v73, *(void *)((char *)v53 + 20), *(void *)((char *)v53 + 28), 13);
      uint64_t v54 = (v12 - v13);
      if (v12 != v13)
      {
        uint64_t v55 = 0;
        v56 = (float *)v75[10];
        v57 = (float *)v52[10];
        uint64_t v79 = v74[8];
        uint64_t v80 = v75[8];
        uint64_t v58 = v73[10];
        uint64_t v83 = v73[8];
        if (v11 <= 1) {
          uint64_t v59 = 1;
        }
        else {
          uint64_t v59 = v11;
        }
        if (v77 <= 1) {
          uint64_t v54 = 1;
        }
        uint64_t v78 = v54;
        uint64_t v60 = 2 * v59;
        uint64_t v76 = v73[10];
        int v81 = v9;
        do
        {
          if (v9 != v82)
          {
            uint64_t v61 = 0;
            uint64_t v62 = 0;
            v63 = v56;
            v64 = v57;
            do
            {
              float v65 = *v63;
              float v66 = 1.0 / (float)(expf((float)((float)(*v64 * 8.0) + -0.35) * -5.0) + 1.0);
              float v67 = 1.0 - v66;
              if (v65 <= 0.0)
              {
                uint64_t v70 = 2 * v62;
                *(float *)(v58 + 4 * v61) = v67 * 2.0794;
                float v71 = v66 * 2.0794;
              }
              else
              {
                float v68 = v67 * 1.0986;
                if (v66 <= 0.5) {
                  float v69 = v68;
                }
                else {
                  float v69 = 0.28768;
                }
                *(float *)(v58 + 4 * v61) = v69;
                uint64_t v70 = v61;
                float v71 = 2.0794;
              }
              *(float *)(v76 + v83 * v55 + ((4 * v70) | 4)) = v71;
              ++v62;
              v61 += 2;
              ++v64;
              ++v63;
            }
            while (v60 != v61);
          }
          ++v55;
          v58 += v83;
          v57 = (float *)((char *)v57 + v79);
          v56 = (float *)((char *)v56 + v80);
          int v9 = v81;
        }
        while (v55 != v78);
      }
      CFUUIDRef v72 = CFUUIDGetConstantUUIDWithBytes(0, 0xD0u, 0xEDu, 0xE3u, 0xC7u, 0xB1u, 0x48u, 0x47u, 0x4Eu, 0x88u, 0xB6u, 0xF1u, 0xD5u, 0x7Cu, 0xC9u, 0xDFu, 0x6Au);
      HFDenseCRFInterface::HFDenseCRFInterface((HFDenseCRFInterface *)v84, v72);
    }
  }
  NSLog(&cfstr_ErrorInputsToC.isa);
  if (v85) {
    (*(void (**)(HGBitmap *))(*(void *)v85 + 24))(v85);
  }
  if (v86) {
    (*(void (**)(uint64_t))(*(void *)v86 + 24))(v86);
  }
  if (v87) {
    (*(void (**)(HGBitmap *))(*(void *)v87 + 24))(v87);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

@end