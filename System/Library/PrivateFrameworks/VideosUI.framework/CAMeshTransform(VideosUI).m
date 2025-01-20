@interface CAMeshTransform(VideosUI)
+ (id)vuiMeshTransformWithEdges:()VideosUI mirrorPercentage:;
@end

@implementation CAMeshTransform(VideosUI)

+ (id)vuiMeshTransformWithEdges:()VideosUI mirrorPercentage:
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = 0;
  memset(v24, 0, sizeof(v24));
  double v26 = a1;
  uint64_t v27 = 0;
  double v28 = -a1;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  double v31 = 1.0 - a1;
  uint64_t v32 = 0;
  double v33 = a1 + 1.0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  long long v36 = xmmword_1E38FE240;
  uint64_t v37 = 0x3FF0000000000000;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  double v41 = a1;
  uint64_t v42 = 0;
  double v43 = -a1;
  uint64_t v44 = 0;
  double v45 = a1;
  double v46 = a1;
  double v47 = -a1;
  double v48 = -a1;
  uint64_t v49 = 0;
  double v50 = 1.0 - a1;
  double v51 = a1;
  double v52 = a1 + 1.0;
  double v53 = -a1;
  long long v54 = xmmword_1E38FE180;
  double v55 = a1;
  uint64_t v56 = 0x3FF0000000000000;
  double v57 = -a1;
  uint64_t v59 = 0;
  uint64_t v58 = 0;
  double v60 = 1.0 - a1;
  uint64_t v61 = 0;
  double v62 = a1 + 1.0;
  uint64_t v63 = 0;
  double v64 = a1;
  double v65 = 1.0 - a1;
  double v66 = -a1;
  double v67 = a1 + 1.0;
  uint64_t v68 = 0;
  double v69 = 1.0 - a1;
  double v70 = 1.0 - a1;
  double v71 = a1 + 1.0;
  double v72 = a1 + 1.0;
  long long v73 = xmmword_1E38FE180;
  double v74 = 1.0 - a1;
  uint64_t v75 = 0x3FF0000000000000;
  double v76 = a1 + 1.0;
  uint64_t v78 = 0;
  uint64_t v77 = 0;
  uint64_t v79 = 0x3FF0000000000000;
  long long v80 = xmmword_1E38FE180;
  uint64_t v81 = 0;
  double v82 = a1;
  uint64_t v83 = 0x3FF0000000000000;
  double v84 = -a1;
  long long v85 = xmmword_1E38FE240;
  double v86 = 1.0 - a1;
  uint64_t v87 = 0x3FF0000000000000;
  double v88 = a1 + 1.0;
  uint64_t v89 = 0x3FF0000000000000;
  __asm { FMOV            V0.2D, #1.0 }
  long long v90 = xmmword_1E38FE180;
  long long v91 = _Q0;
  long long v92 = xmmword_1E38FE240;
  if (a4 == 15)
  {
    memcpy(v23, &unk_1E38FE268, sizeof(v23));
    v9 = (void *)MEMORY[0x1E4F39C30];
    uint64_t v10 = *MEMORY[0x1E4F39ED8];
    uint64_t v11 = 9;
  }
  else
  {
    if ((~(_BYTE)a4 & 5) != 0)
    {
      if ((~a4 & 0xALL) != 0)
      {
        v16 = 0;
        switch(a4)
        {
          case 1:
            LODWORD(v23[0]) = 0;
            memset(&v23[1], 0, 48);
            *(void *)((char *)v23 + 4) = 0xF00000003;
            HIDWORD(v23[0]) = 12;
            *(void *)((char *)&v23[2] + 4) = 0x700000003;
            int v17 = 4;
            goto LABEL_11;
          case 2:
            LODWORD(v23[0]) = 0;
            memset(&v23[1], 0, 48);
            *(void *)((char *)v23 + 4) = 0xF00000003;
            int v17 = 12;
            HIDWORD(v23[0]) = 12;
            *(void *)((char *)&v23[2] + 4) = 0xD00000001;
LABEL_11:
            HIDWORD(v23[2]) = v17;
            goto LABEL_15;
          case 4:
            v18 = &xmmword_1E38FE488;
            goto LABEL_14;
          case 8:
            v18 = &xmmword_1E38FE448;
LABEL_14:
            long long v19 = v18[1];
            v23[0] = *v18;
            v23[1] = v19;
            long long v20 = v18[3];
            v23[2] = v18[2];
            v23[3] = v20;
LABEL_15:
            v9 = (void *)MEMORY[0x1E4F39C30];
            uint64_t v10 = *MEMORY[0x1E4F39ED8];
            uint64_t v11 = 2;
            goto LABEL_16;
          default:
            goto LABEL_17;
        }
      }
      v12 = &xmmword_1E38FE3E8;
    }
    else
    {
      v12 = &xmmword_1E38FE388;
    }
    long long v13 = v12[3];
    v23[2] = v12[2];
    v23[3] = v13;
    long long v14 = v12[5];
    v23[4] = v12[4];
    v23[5] = v14;
    long long v15 = v12[1];
    v23[0] = *v12;
    v23[1] = v15;
    v9 = (void *)MEMORY[0x1E4F39C30];
    uint64_t v10 = *MEMORY[0x1E4F39ED8];
    uint64_t v11 = 3;
  }
LABEL_16:
  v16 = objc_msgSend(v9, "meshTransformWithVertexCount:vertices:faceCount:faces:depthNormalization:", 16, v24, v11, v23, v10, v23[0], v23[1], v23[2], v23[3], v23[4], v23[5]);
LABEL_17:
  [v16 setSubdivisionSteps:0];
  [v16 setReplicatesEdges:1];
  v21 = (void *)[v16 copy];

  return v21;
}

@end