@interface MRTransitionAccordion
- (BOOL)controlsLayersTime;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (BOOL)supportsDirectionOverride;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
@end

@implementation MRTransitionAccordion

- (BOOL)controlsLayersTime
{
  return 1;
}

- (BOOL)supportsDirectionOverride
{
  return 1;
}

- (void)setAttributes:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRTransitionAccordion;
  [(MRTransition *)&v4 setAttributes:a3];
  self->super._direction = 0;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)MRTransitionAccordion;
  return [(MRTransition *)&v6 prerenderForTime:a4 inContext:a5 withArguments:a3];
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  [a4 localAspectRatio];
  float v10 = 1.0 / v9;
  if ((float)(1.0 / v9) > 0.0)
  {
    double v11 = a3 * a3 * (a3 * -2.0 + 3.0);
    uint64_t v12 = self->super._direction - 1;
    if v12 < 8 && ((0x8Bu >> v12)) {
      int v13 = dword_165C30[v12];
    }
    else {
      LOBYTE(v13) = objc_msgSend(-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"direction"), "unsignedIntegerValue");
    }
    LODWORD(v14) = objc_msgSend(-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"numberOfFoldingsIn"), "unsignedCharValue");
    unsigned int v15 = objc_msgSend(-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"numberOfFoldingsOut"), "unsignedCharValue");
    mSourceLayer = self->super.mSourceLayer;
    [(MRLayerClock *)[(MRLayer *)mSourceLayer clock] externalTime];
    id v17 = -[MRLayer patchworkAtTime:inContext:withArguments:](mSourceLayer, "patchworkAtTime:inContext:withArguments:", a4, a5);
    mTargetLayer = self->super.mTargetLayer;
    [(MRLayerClock *)[(MRLayer *)mTargetLayer clock] externalTime];
    id v19 = -[MRLayer patchworkAtTime:inContext:withArguments:](mTargetLayer, "patchworkAtTime:inContext:withArguments:", a4, a5);
    BOOL v20 = (v13 & 0xFA) == 0;
    if ((v13 & 0xFA) != 0) {
      char v21 = v13;
    }
    else {
      char v21 = v13 + 2;
    }
    if ((v13 & 0xFA) != 0) {
      unsigned int v22 = v15;
    }
    else {
      unsigned int v22 = v14;
    }
    if ((v13 & 0xFA) != 0) {
      uint64_t v14 = v14;
    }
    else {
      uint64_t v14 = v15;
    }
    double v23 = 1.0 - v11;
    if ((v13 & 0xFA) != 0) {
      double v23 = v11;
    }
    float v24 = v23;
    if ((v13 & 0xFA) != 0) {
      v25 = v17;
    }
    else {
      v25 = v19;
    }
    if (v20) {
      v26 = v17;
    }
    else {
      v26 = v19;
    }
    int v27 = v21 & 0xFC;
    int v28 = v21 & 1;
    if (v21) {
      uint64_t v29 = 1;
    }
    else {
      uint64_t v29 = 2;
    }
    [a4 cull:v29];
    float v30 = 1.0;
    float v31 = 1.0 - v24;
    if (v27)
    {
      int v112 = 0;
      long long v110 = 0u;
      long long v111 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      int v101 = 0;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      LODWORD(v32) = (2 * v22) | 1;
      if (v28) {
        float v33 = 1.0;
      }
      else {
        float v33 = v10;
      }
      if (v22) {
        uint64_t v32 = v32;
      }
      else {
        uint64_t v32 = 2;
      }
      LOWORD(v102) = 2 * v32;
      BYTE2(v102) = v28;
      float v34 = v33 + v33;
      float v35 = (float)(int)(4 * v22);
      if (!v22) {
        float v35 = 2.0;
      }
      float v36 = v34 / v35;
      float v37 = -v33;
      float v38 = 0.0;
      if (v22) {
        float v38 = sqrt((float)(1.0 - (float)(v31 * v31))) * v37 / (float)((float)v22 + (float)v22);
      }
      uint64_t v39 = 0;
      float v40 = (float)(v24 + -1.0) * v33;
      float v41 = v31 * v36;
      unsigned int v42 = 2 * v32 - 1;
      v43 = (float *)&v102 + 2;
      do
      {
        float v44 = v37 + (float)((float)v39 * v36);
        if (v39) {
          float v45 = 0.0;
        }
        else {
          float v45 = v40;
        }
        if (v39) {
          float v46 = v24;
        }
        else {
          float v46 = 1.0;
        }
        if (!v22) {
          float v44 = v45;
        }
        *(v43 - 1) = v44;
        v47 = (float *)(&v102 + v42);
        v47[1] = -v44;
        float v48 = v37 + (float)(v41 * (float)v39);
        if (!v22) {
          float v48 = v46 * v37;
        }
        float *v43 = v48;
        float v49 = -v48;
        if (v39) {
          float v50 = v38;
        }
        else {
          float v50 = 0.0;
        }
        v47[2] = v49;
        v47[3] = v50;
        v43[1] = v50;
        *((unsigned char *)v43 + 8) = v32 - 1 == v39;
        *((unsigned char *)v47 + 16) = 0;
        ++v39;
        --v42;
        v43 += 4;
      }
      while (v32 != v39);
      uint64_t v51 = 0;
      unsigned int v52 = 0;
      LOWORD(v91) = (2 * v14) | 1;
      unsigned int v53 = 2 * v14;
      float v54 = v34 / (float)(2 * v14);
      BYTE2(v91) = v28;
      float v55 = sqrt((float)(1.0 - (float)(v24 * v24))) * v37 / (double)v14;
      do
      {
        float v56 = v37 + (float)((float)v52 * v54);
        v57 = (float *)((char *)&v91 + v51);
        v57[1] = v56;
        v58 = (float *)(&v91 + v53);
        v58[1] = -v56;
        float v59 = (float)-(float)(v24 * v54) * (float)v14;
        v57[2] = v59;
        float v60 = -v59;
        if (v52) {
          float v61 = v55;
        }
        else {
          float v61 = 0.0;
        }
        v58[2] = v60;
        v58[3] = v61;
        v57[3] = v61;
        --v14;
        *((unsigned char *)v58 + 16) = 0;
        *((unsigned char *)v57 + 16) = 0;
        ++v52;
        --v53;
        v51 += 16;
      }
      while (v14 != -1);
      long long v88 = v110;
      long long v89 = v111;
      LODWORD(v90) = v112;
      long long v84 = v106;
      long long v85 = v107;
      long long v86 = v108;
      long long v87 = v109;
      long long v80 = v102;
      long long v81 = v103;
      long long v82 = v104;
      long long v83 = v105;
      RenderPatchworkWithMesh(v25, (unsigned __int16 *)&v80, a4);
      long long v88 = v99;
      long long v89 = v100;
      LODWORD(v90) = v101;
      long long v84 = v95;
      long long v85 = v96;
      long long v86 = v97;
      long long v87 = v98;
      long long v80 = v91;
      long long v81 = v92;
      long long v82 = v93;
      long long v83 = v94;
      v62 = v26;
    }
    else
    {
      int v112 = 0;
      long long v110 = 0u;
      long long v111 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      int v101 = 0;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      LODWORD(v63) = (2 * v22) | 1;
      if (v22) {
        uint64_t v63 = v63;
      }
      else {
        uint64_t v63 = 2;
      }
      LOWORD(v102) = v63;
      BYTE2(v102) = v28;
      if (!v28) {
        float v30 = v10;
      }
      float v64 = v30 + v30;
      float v65 = (float)(v30 + v30) / (float)(v63 - 1);
      float v66 = -v30;
      float v67 = 0.0;
      if (v22) {
        float v67 = sqrt((float)(1.0 - (float)(v31 * v31))) * v66 / (double)v22;
      }
      uint64_t v68 = 0;
      v69 = (float *)&v102 + 2;
      do
      {
        if (v22)
        {
          *(v69 - 1) = (float)((float)v68 * v65) - v30;
          float v70 = (float)((float)(v31 * v65) * (float)v68) - v30;
        }
        else if (v68)
        {
          *(v69 - 1) = v30;
          float v70 = (float)((float)(v24 * -2.0) + 1.0) * v30;
        }
        else
        {
          *((float *)&v102 + 1) = (float)((float)(v24 * 2.0) + -1.0) * v30;
          float v70 = -v30;
        }
        if (v68) {
          float v71 = v67;
        }
        else {
          float v71 = 0.0;
        }
        float *v69 = v70;
        v69[1] = v71;
        *((unsigned char *)v69 + 8) = 0;
        ++v68;
        v69 += 4;
      }
      while (v63 != v68);
      LODWORD(v72) = (2 * v14) | 1;
      if (v14) {
        uint64_t v72 = v72;
      }
      else {
        uint64_t v72 = 2;
      }
      LOWORD(v91) = v72;
      BYTE2(v91) = v28;
      float v73 = 0.0;
      if (v14) {
        float v73 = sqrt((float)(1.0 - (float)(v24 * v24))) * v66 / (double)v14;
      }
      uint64_t v74 = 0;
      float v75 = -v64;
      v76 = (float *)&v91 + 2;
      float v77 = v64 / (float)(v72 - 1);
      do
      {
        if (v14)
        {
          *(v76 - 1) = (float)((float)v74 * v77) - v30;
          float v78 = v30 + (float)(v24 * (float)(v75 + (float)(v77 * (float)v74)));
        }
        else if (v74)
        {
          *(v76 - 1) = (float)((float)(v24 * 2.0) + -1.0) * v30;
          float v78 = v30;
        }
        else
        {
          *((float *)&v91 + 1) = -v30;
          float v78 = (float)((float)(v24 * -2.0) + 1.0) * v30;
        }
        if (v74) {
          float v79 = v73;
        }
        else {
          float v79 = 0.0;
        }
        float *v76 = v78;
        v76[1] = v79;
        *((unsigned char *)v76 + 8) = 0;
        ++v74;
        v76 += 4;
      }
      while (v72 != v74);
      if (v24 >= 0.5)
      {
        long long v88 = v110;
        long long v89 = v111;
        LODWORD(v90) = v112;
        long long v84 = v106;
        long long v85 = v107;
        long long v86 = v108;
        long long v87 = v109;
        long long v80 = v102;
        long long v81 = v103;
        long long v82 = v104;
        long long v83 = v105;
        RenderPatchworkWithMesh(v25, (unsigned __int16 *)&v80, a4);
      }
      long long v88 = v99;
      long long v89 = v100;
      LODWORD(v90) = v101;
      long long v84 = v95;
      long long v85 = v96;
      long long v86 = v97;
      long long v87 = v98;
      long long v80 = v91;
      long long v81 = v92;
      long long v82 = v93;
      long long v83 = v94;
      if (v14 == 2) {
        RenderPatchworkWithMeshInverted(v26, (unsigned __int16 *)&v80, a4);
      }
      else {
        RenderPatchworkWithMesh(v26, (unsigned __int16 *)&v80, a4);
      }
      if (v24 >= 0.5) {
        goto LABEL_98;
      }
      long long v88 = v110;
      long long v89 = v111;
      LODWORD(v90) = v112;
      long long v84 = v106;
      long long v85 = v107;
      long long v86 = v108;
      long long v87 = v109;
      long long v80 = v102;
      long long v81 = v103;
      long long v82 = v104;
      long long v83 = v105;
      v62 = v25;
    }
    RenderPatchworkWithMesh(v62, (unsigned __int16 *)&v80, a4);
LABEL_98:
    objc_msgSend(a4, "cull:", 0, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90);
    [v25 removeImages];
    [v26 removeImages];
  }
}

@end