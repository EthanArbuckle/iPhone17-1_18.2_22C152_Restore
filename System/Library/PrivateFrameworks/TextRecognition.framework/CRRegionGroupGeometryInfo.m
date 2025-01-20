@interface CRRegionGroupGeometryInfo
- (BOOL)isCenterJustified;
- (BOOL)isLeftJustified;
- (BOOL)isRightJustified;
- (CRRegionGeometryInfo)firstSubregion;
- (CRRegionGeometryInfo)lastSubregion;
- (id)_geometryInfoForRegion:(void *)a1;
- (id)initFromRegionGroup:(id)a3;
@end

@implementation CRRegionGroupGeometryInfo

- (id)initFromRegionGroup:(id)a3
{
  id v4 = a3;
  v5 = [v4 subregions];
  if ([v5 count])
  {
    v6 = [v4 subregions];
    v7 = [v6 firstObject];
    uint64_t v8 = [v7 layoutDirection];
  }
  else
  {
    uint64_t v8 = 0;
  }

  v103.receiver = self;
  v103.super_class = (Class)CRRegionGroupGeometryInfo;
  v9 = [(CRRegionGeometryInfo *)&v103 initFromRegion:v4 layoutDirection:v8];
  if (!v9) {
    goto LABEL_83;
  }
  v10 = [v4 subregions];
  if (![v10 count])
  {
    v12 = 0;
    goto LABEL_9;
  }
  v11 = [v10 firstObject];
  v12 = -[CRRegionGroupGeometryInfo _geometryInfoForRegion:](v11);

  if (!v12)
  {
LABEL_9:
    unsigned __int8 isKindOfClass = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
LABEL_10:
  v13 = v9 + 16;
  objc_storeStrong(v9 + 16, v12);
  uint64_t v14 = [v10 count];
  if (v14 == 1)
  {
    v15 = *v13;
  }
  else
  {
    v13 = [v10 lastObject];
    v15 = -[CRRegionGroupGeometryInfo _geometryInfoForRegion:](v13);
  }
  objc_storeStrong(v9 + 17, v15);
  if (v14 != 1)
  {
  }
  *((unsigned char *)v9 + 121) = 0;
  *((unsigned char *)v9 + 120) = 0;
  *((unsigned char *)v9 + 122) = 0;
  if ((unint64_t)[v10 count] >= 2)
  {
    v84 = v12;
    id v86 = v4;
    if ((unint64_t)[v10 count] >= 2)
    {
      uint64_t v16 = 0;
      char v90 = 0;
      double v88 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      double v89 = *MEMORY[0x1E4F1DB30];
      BOOL v17 = *MEMORY[0x1E4F1DB30] > 0.0;
      if (v88 <= 0.0) {
        BOOL v17 = 0;
      }
      BOOL v91 = v17;
      double v18 = 0.0;
      while (1)
      {
        v19 = objc_msgSend(v10, "objectAtIndexedSubscript:", v16, v84, v86);
        v20 = [v19 boundingQuad];
        v21 = [v20 denormalizedQuad];

        v22 = [v10 objectAtIndexedSubscript:v16 + 1];
        v23 = [v22 boundingQuad];
        v24 = [v23 denormalizedQuad];

        v25 = [v10 objectAtIndexedSubscript:v16];
        v26 = -[CRRegionGroupGeometryInfo _geometryInfoForRegion:](v25);

        v27 = [v10 objectAtIndexedSubscript:v16 + 1];
        v28 = -[CRRegionGroupGeometryInfo _geometryInfoForRegion:](v27);

        if ((isKindOfClass & (v26 != 0)) != 0)
        {
          v29 = [v26 firstSubregion];
          [v29 size];
          double v31 = v30;
        }
        else
        {
          [v21 size];
          double v31 = v32;
        }
        double v92 = v18;
        if ((isKindOfClass & (v28 != 0)) != 0)
        {
          v33 = [v28 firstSubregion];
          [v33 size];
          double v101 = v34;
        }
        else
        {
          [v24 size];
          double v101 = v35;
        }
        [v24 topLeft];
        double v100 = v36;
        [v21 topLeft];
        double v99 = v37;
        [v24 topLeft];
        double v98 = v38;
        [v21 topLeft];
        double v97 = v39;
        [v24 topRight];
        double v96 = v40;
        [v21 topRight];
        double v95 = v41;
        [v24 topRight];
        double v94 = v42;
        [v21 topRight];
        double v44 = v43;
        [v21 bottomRight];
        double v46 = v45;
        [v21 bottomLeft];
        double v48 = v47;
        [v21 bottomRight];
        double v50 = v49;
        [v21 bottomLeft];
        double v52 = v51;
        [v21 midPoint];
        double v54 = v53;
        double v56 = v55;
        [v24 midPoint];
        if (v91)
        {
          double v54 = v89 * v54;
          double v56 = v88 * v56;
          double v57 = v89 * v57;
          double v58 = v88 * v58;
        }
        double v93 = v31;
        double v59 = (v31 + v101) * 0.5;
        double v60 = v94 - v44;
        double v61 = sqrt((v50 - v52) * (v50 - v52) + (v46 - v48) * (v46 - v48));
        double v62 = ((v98 - v97) * (v50 - v52) + (v100 - v99) * (v46 - v48)) / v61;
        double v63 = -(v60 * (v50 - v52) + (v96 - v95) * (v46 - v48)) / v61;
        double v64 = sqrt((v56 - v58) * (v56 - v58) + (v54 - v57) * (v54 - v57));
        [v21 size];
        double v66 = v65;
        [v24 size];
        double v68 = vabdd_f64(v66, v67);
        double v69 = v68 / v59;
        double v70 = fmin((v64 + v64) / v59, 1.4);
        if (v64 < v59 * 1.4) {
          break;
        }
        double v71 = 0.5;
        if ((vabdd_f64(v62, v63) - v68 * 0.5) * 0.5 < v59 * 0.5 && v69 > v70) {
          goto LABEL_39;
        }
        if (*((unsigned char *)v9 + 120) && v69 > v70)
        {
          char v73 = 0;
          char v90 = 1;
          double v75 = v92;
          double v74 = v93;
          goto LABEL_75;
        }
LABEL_43:
        double v74 = v93;
        double v76 = fabs(v62) / v93;
        double v77 = fabs(v63) / v93;
        if (v76 < v71 && v77 >= v71)
        {
          if (*((unsigned char *)v9 + 121) && *((unsigned char *)v9 + 122))
          {
            *((unsigned char *)v9 + 122) = 0;
          }
          else if (*((unsigned char *)v9 + 120) && v69 <= v70 || *((unsigned char *)v9 + 122))
          {
            char v73 = 0;
            char v90 = 1;
            double v75 = v92;
            goto LABEL_75;
          }
          if (!v16) {
            *((unsigned char *)v9 + 121) = 1;
          }
        }
        BOOL v79 = v76 >= v71 && v77 < v71;
        double v75 = v92;
        if (!v79) {
          goto LABEL_60;
        }
        if (*((unsigned char *)v9 + 121))
        {
          if (!*((unsigned char *)v9 + 122)) {
            goto LABEL_72;
          }
          *((unsigned char *)v9 + 121) = 0;
        }
        else if (*((unsigned char *)v9 + 120) && v69 <= v70)
        {
LABEL_72:
          char v73 = 0;
          char v90 = 1;
          goto LABEL_75;
        }
        if (!v16)
        {
          *((unsigned char *)v9 + 122) = 1;
LABEL_60:
          char v73 = 1;
          if (!v16 && v76 < v71 && v77 < v71)
          {
            *((unsigned char *)v9 + 121) = 1;
            *((unsigned char *)v9 + 122) = 1;
          }
          goto LABEL_75;
        }
        char v73 = 1;
LABEL_75:
        double v18 = v75 + v74;

        if (v73)
        {
          unint64_t v81 = [v10 count];
          unint64_t v82 = v16 + 2;
          ++v16;
          if (v82 < v81) {
            continue;
          }
        }
        goto LABEL_80;
      }
      double v71 = 0.5;
      if (v69 <= v70) {
        goto LABEL_43;
      }
LABEL_39:
      if (!v16 || *((unsigned char *)v9 + 121) && *((unsigned char *)v9 + 122))
      {
        *((unsigned char *)v9 + 120) = 1;
        *((unsigned char *)v9 + 121) = 0;
        *((unsigned char *)v9 + 122) = 0;
      }
      goto LABEL_43;
    }
    char v90 = 0;
    double v18 = 0.0;
LABEL_80:
    objc_msgSend(v9, "setEstimatedLineHeight:", v18 / (double)(unint64_t)(objc_msgSend(v10, "count", v84, v86) - 1));
    v12 = v85;
    id v4 = v87;
    if (v90)
    {
      *((unsigned char *)v9 + 121) = 0;
      *((unsigned char *)v9 + 120) = 0;
      *((unsigned char *)v9 + 122) = 0;
    }
  }

LABEL_83:
  return v9;
}

- (id)_geometryInfoForRegion:(void *)a1
{
  id v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    id v2 = [v1 geometryInfo];
  }
  else
  {
    id v2 = -[CRRegionGeometryInfo initFromRegion:layoutDirection:]([CRRegionGeometryInfo alloc], "initFromRegion:layoutDirection:", v1, [v1 layoutDirection]);
  }
  v3 = v2;

  return v3;
}

- (CRRegionGeometryInfo)firstSubregion
{
  return (CRRegionGeometryInfo *)objc_getProperty(self, a2, 128, 1);
}

- (CRRegionGeometryInfo)lastSubregion
{
  return (CRRegionGeometryInfo *)objc_getProperty(self, a2, 136, 1);
}

- (BOOL)isCenterJustified
{
  return self->_isCenterJustified;
}

- (BOOL)isLeftJustified
{
  return self->_isLeftJustified;
}

- (BOOL)isRightJustified
{
  return self->_isRightJustified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSubregion, 0);
  objc_storeStrong((id *)&self->_firstSubregion, 0);
}

@end