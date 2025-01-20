@interface PFPhotosFaceUtilities
+ (BOOL)getCropRectForPortraitImage:(CGRect *)a3 size:(double)a4 imgWidth:(double)a5 imgHeight:(double)a6 centerX:(double)a7 centerY:(double)a8;
+ (CGSize)faceTileSizeAdjustingForImageAspectRatio:(CGSize)result imgWidth:(double)a4 imgHeight:(double)a5;
+ (id)bestMergeCandidateFaceFor:(id)a3 from:(id)a4 ignoreSourceAssetDimensions:(BOOL)a5;
+ (id)selectRepresentativeFromFaces:(id)a3 qualityMeasureByLocalIdentifier:(id)a4 representativenessByCSN:(id)a5;
+ (id)selectRepresentativeFromFaces:(id)a3 qualityMeasureByLocalIdentifier:(id)a4 representativenessByCSN:(id)a5 candidateFaces:(id)a6;
+ (id)sortedViableMergeCandidateFacesFor:(id)a3 from:(id)a4 ignoreSourceAssetDimensions:(BOOL)a5 matchScores:(id *)a6;
+ (id)sortedViableMergeCandidateTorsosFor:(id)a3 from:(id)a4 ignoreSourceAssetDimensions:(BOOL)a5 matchScores:(id *)a6;
+ (int64_t)qualityMeasureForFace:(id)a3 countOfFacesOnAsset:(unint64_t)a4;
@end

@implementation PFPhotosFaceUtilities

+ (CGSize)faceTileSizeAdjustingForImageAspectRatio:(CGSize)result imgWidth:(double)a4 imgHeight:(double)a5
{
  if (a4 <= a5) {
    result.width = result.height * (a5 / a4);
  }
  else {
    result.height = result.width * (a4 / a5);
  }
  if (result.width > 1.0)
  {
    result.height = result.height * (1.0 / result.width);
    result.width = 1.0;
  }
  if (result.height > 1.0)
  {
    result.width = result.width * (1.0 / result.height);
    result.height = 1.0;
  }
  return result;
}

+ (BOOL)getCropRectForPortraitImage:(CGRect *)a3 size:(double)a4 imgWidth:(double)a5 imgHeight:(double)a6 centerX:(double)a7 centerY:(double)a8
{
  objc_msgSend(a1, "faceTileSizeAdjustingForImageAspectRatio:imgWidth:imgHeight:", a4 * 0.5, a4 * 0.5, a5, a6);
  double v13 = v12 * -1.63999999 + a7 - v12 * 0.5;
  double v14 = 1.0 - a8 - v11 * 0.5 - v11 * 1.91999996;
  double v15 = v12 - (v12 * -1.63999999 + v12 * -1.63999999);
  double v16 = v11 - (v11 * 1.91999996 * -1.10000002 - v11 * 1.91999996);
  if (v14 >= 0.0) {
    double v17 = v14;
  }
  else {
    double v17 = 0.0;
  }
  v25.origin.x = v13;
  v25.origin.y = v17;
  v25.size.width = v15;
  v25.size.height = v16;
  double MaxY = CGRectGetMaxY(v25);
  if (MaxY <= 1.0) {
    goto LABEL_7;
  }
  double v19 = MaxY + -1.0;
  if (v19 < v16 * 0.200000003 / 3.0 + v16 * 0.200000003 / 3.0)
  {
    double v17 = v19 * 0.5 + v17;
    double v16 = v16 + v19 * -1.5;
LABEL_7:
    BOOL v20 = 1;
    goto LABEL_9;
  }
  BOOL v20 = 0;
  double v16 = v16 - v19;
LABEL_9:
  if (v17 < 0.0)
  {
    double v16 = 1.0;
    double v17 = 0.0;
  }
  if (v13 < 0.0) {
    double v13 = 0.0;
  }
  v26.origin.x = v13;
  v26.origin.y = v17;
  v26.size.width = v15;
  v26.size.height = v16;
  double v21 = v13 - fmax(CGRectGetMaxX(v26) + -1.0, 0.0);
  BOOL v22 = v21 < 0.0;
  if (v21 < 0.0) {
    double v21 = 0.0;
  }
  a3->origin.x = v21;
  a3->origin.y = v17;
  if (v22) {
    double v23 = 1.0;
  }
  else {
    double v23 = v15;
  }
  a3->size.width = v23;
  a3->size.height = v16;
  return v20;
}

+ (id)selectRepresentativeFromFaces:(id)a3 qualityMeasureByLocalIdentifier:(id)a4 representativenessByCSN:(id)a5 candidateFaces:(id)a6
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (uint64_t)(float)((float)(unint64_t)[v9 count] * 0.7);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __126__PFPhotosFaceUtilities_selectRepresentativeFromFaces_qualityMeasureByLocalIdentifier_representativenessByCSN_candidateFaces___block_invoke;
  v47[3] = &unk_1E5B2DB20;
  id v14 = v11;
  id v48 = v14;
  double v15 = [v9 sortedArrayUsingComparator:v47];
  double v16 = objc_msgSend(v15, "subarrayWithRange:", v13, objc_msgSend(v9, "count") - v13);
  uint64_t v17 = [v16 count];
  if (!v17) {
    goto LABEL_16;
  }
  uint64_t v18 = v17;
  v42 = v15;
  id v43 = v14;
  id v44 = v9;
  double v19 = 0;
  uint64_t v20 = 0;
  double v21 = -1.79769313e308;
  do
  {
    BOOL v22 = objc_msgSend(v16, "objectAtIndex:", v20, v42, v43, v44);
    [v22 photosFaceRepresentationRoll];
    if (fabs(v23) <= 0.785398163)
    {
      if (v10)
      {
        v24 = [v22 photosFaceRepresentationLocalIdentifier];
        CGRect v25 = [v10 objectForKey:v24];
        uint64_t v26 = [v25 integerValue];
      }
      else
      {
        uint64_t v26 = [v22 photosFaceRepresentationClusterSequenceNumber];
      }
      memset(v46, 0, sizeof(v46));
      [v22 photosFaceRepresentationSize];
      double v28 = v27;
      double v29 = (double)[v22 photosFaceRepresentationSourceWidth];
      double v30 = (double)[v22 photosFaceRepresentationSourceHeight];
      [v22 photosFaceRepresentationCenterX];
      double v32 = v31;
      [v22 photosFaceRepresentationCenterY];
      if ([a1 getCropRectForPortraitImage:v46 size:v28 imgWidth:v29 imgHeight:v30 centerX:v32 centerY:v33])double v34 = 1.0; {
      else
      }
        double v34 = 0.8;
      double v35 = v34 * (double)v26;
      if (v35 >= v21)
      {
        id v36 = v22;

        double v19 = v36;
        double v21 = v35;
      }
      if (v12)
      {
        v49[0] = @"localIdentifier";
        v37 = [v22 photosFaceRepresentationLocalIdentifier];
        v49[1] = @"qualityMeasure";
        v50[0] = v37;
        v38 = [NSNumber numberWithDouble:v35];
        v50[1] = v38;
        v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];

        [v12 addObject:v39];
      }
    }

    ++v20;
  }
  while (v18 != v20);
  id v14 = v43;
  id v9 = v44;
  double v15 = v42;
  if (!v19)
  {
LABEL_16:
    double v19 = [v16 lastObject];
  }
  id v40 = v19;

  return v40;
}

uint64_t __126__PFPhotosFaceUtilities_selectRepresentativeFromFaces_qualityMeasureByLocalIdentifier_representativenessByCSN_candidateFaces___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  v6 = NSNumber;
  id v7 = a3;
  v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(a2, "photosFaceRepresentationClusterSequenceNumber"));
  uint64_t v9 = [v5 objectForKey:v8];
  id v10 = (void *)v9;
  if (v9) {
    id v11 = (void *)v9;
  }
  else {
    id v11 = &unk_1EF7CA868;
  }
  id v12 = v11;

  uint64_t v13 = *(void **)(a1 + 32);
  id v14 = NSNumber;
  uint64_t v15 = [v7 photosFaceRepresentationClusterSequenceNumber];

  double v16 = [v14 numberWithInteger:v15];
  uint64_t v17 = [v13 objectForKey:v16];
  uint64_t v18 = (void *)v17;
  if (v17) {
    double v19 = (void *)v17;
  }
  else {
    double v19 = &unk_1EF7CA868;
  }
  id v20 = v19;

  uint64_t v21 = [v12 compare:v20];
  return v21;
}

+ (id)selectRepresentativeFromFaces:(id)a3 qualityMeasureByLocalIdentifier:(id)a4 representativenessByCSN:(id)a5
{
  return (id)[a1 selectRepresentativeFromFaces:a3 qualityMeasureByLocalIdentifier:a4 representativenessByCSN:a5 candidateFaces:0];
}

+ (int64_t)qualityMeasureForFace:(id)a3 countOfFacesOnAsset:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 photosFaceRepresentationSourceWidth];
  uint64_t v7 = [v5 photosFaceRepresentationSourceHeight];
  [v5 photosFaceRepresentationSize];
  double v9 = v8;
  [v5 photosFaceRepresentationBlurScore];
  double v11 = v10;
  int v12 = [v5 photosFaceRepresentationHasSmile];
  char v13 = [v5 photosFaceRepresentationIsLeftEyeClosed];
  LODWORD(v14) = 0.5;
  if ((v13 & 1) == 0)
  {
    int v15 = objc_msgSend(v5, "photosFaceRepresentationIsRightEyeClosed", v14);
    LODWORD(v14) = 2.0;
    if (v15) {
      *(float *)&double v14 = 0.5;
    }
  }
  if (v6 <= v7) {
    unint64_t v16 = v7;
  }
  else {
    unint64_t v16 = v6;
  }
  float v17 = 0.25;
  if (v16 >= 0x400)
  {
    float v17 = 1.0;
    if (v16 <= 0xC00) {
      float v17 = (float)((float)v16 * 0.00036621) + -0.125;
    }
  }
  if (a4)
  {
    float v18 = v9;
    BOOL v19 = v18 > 0.5 || v18 < 0.1;
    float v20 = (float)(v18 * 0.5) + 0.75;
    float v21 = 0.8;
    if (v19) {
      float v20 = 0.8;
    }
    if (v12) {
      float v21 = 1.0;
    }
    float v22 = (1.0 - v11) * 5.0;
    float v23 = *(float *)&v14 * (float)(v21 * (float)((float)(v20 * v22) * v17));
    unint64_t v24 = 3;
    if (a4 < 3) {
      unint64_t v24 = a4;
    }
    float v25 = (float)(v23 * PFFaceCountPenalties[v24 - 1]) * 100.0;
  }
  else
  {
    float v25 = 0.0;
  }
  if (v25 < 1.0) {
    float v25 = 1.0;
  }
  int64_t v26 = (uint64_t)v25;

  return v26;
}

+ (id)bestMergeCandidateFaceFor:(id)a3 from:(id)a4 ignoreSourceAssetDimensions:(BOOL)a5
{
  id v5 = [a1 sortedViableMergeCandidateFacesFor:a3 from:a4 ignoreSourceAssetDimensions:a5 matchScores:0];
  uint64_t v6 = [v5 firstObject];

  return v6;
}

+ (id)sortedViableMergeCandidateTorsosFor:(id)a3 from:(id)a4 ignoreSourceAssetDimensions:(BOOL)a5 matchScores:(id *)a6
{
  BOOL point_12 = a5;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v55 = v8;
    if ([v7 conformsToProtocol:&unk_1EF7E7700])
    {
      id v56 = [MEMORY[0x1E4F1CA48] array];
      id v57 = [MEMORY[0x1E4F1CA48] array];
      context = (void *)MEMORY[0x1A6259880]();
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v9 = v55;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v66 objects:v70 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v67;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v67 != v11) {
              objc_enumerationMutation(v9);
            }
            id v13 = *(id *)(*((void *)&v66 + 1) + 8 * i);
            if (v13 != v7
              && (objc_msgSend(*(id *)(*((void *)&v66 + 1) + 8 * i), "conformsToProtocol:", &unk_1EF7E7700, context) & 1) != 0)
            {
              id v14 = v7;
              id v15 = v13;
              unint64_t v16 = v15;
              if (!v15) {
                goto LABEL_30;
              }
              if (point_12)
              {
                uint64_t v17 = [v15 photosFaceRepresentationSourceWidth];
                uint64_t v18 = [v16 photosFaceRepresentationSourceHeight];
              }
              else
              {
                uint64_t v17 = [v14 photosFaceRepresentationSourceWidth];
                uint64_t v18 = [v14 photosFaceRepresentationSourceHeight];
              }
              uint64_t v19 = v18;
              double v20 = (double)v17;
              if ((double)v17 != (double)[v16 photosFaceRepresentationSourceWidth]) {
                goto LABEL_30;
              }
              double v21 = (double)v19;
              if ((double)v19 != (double)[v16 photosFaceRepresentationSourceHeight]) {
                goto LABEL_30;
              }
              double v22 = v20 >= v21 ? (double)v17 : (double)v19;
              [v14 photosFaceRepresentationBodyCenterX];
              double pointa = v23;
              [v14 photosFaceRepresentationBodyCenterY];
              double v61 = v24;
              [v14 photosFaceRepresentationBodyWidth];
              double v26 = v25;
              [v14 photosFaceRepresentationBodyHeight];
              double v28 = v27;
              [v16 photosFaceRepresentationBodyCenterX];
              double v30 = v29;
              [v16 photosFaceRepresentationBodyCenterY];
              double v32 = v31;
              [v16 photosFaceRepresentationBodyWidth];
              double v34 = v33;
              [v16 photosFaceRepresentationBodyHeight];
              CGFloat v35 = v61 * v21;
              double v36 = v22 * v26;
              double v37 = v22 * v28;
              CGFloat v38 = v30 * v20;
              double v39 = v32 * v21;
              double v40 = v22 * v34;
              double v42 = v22 * v41;
              CGFloat v60 = v35;
              double v62 = pointa * v20;
              double v43 = pointa * v20 - v36 * 0.5;
              double v44 = v35 - v37 * 0.5;
              CGFloat point = v38;
              v79.origin.CGFloat x = v38 - v40 * 0.5;
              v79.origin.double y = v39 - v42 * 0.5;
              v75.origin.CGFloat x = v43;
              v75.origin.double y = v44;
              v75.size.width = v36;
              v75.size.height = v37;
              double y = v79.origin.y;
              CGFloat x = v79.origin.x;
              v79.size.width = v40;
              v79.size.height = v42;
              CGRect v76 = CGRectIntersection(v75, v79);
              double v45 = v76.size.height * v76.size.width;
              if (v76.size.height * v76.size.width > 0.0)
              {
                v77.origin.CGFloat x = v43;
                v77.origin.double y = v44;
                v77.size.width = v36;
                v77.size.height = v37;
                v73.CGFloat x = point;
                v73.double y = v39;
                double v46 = v45 / (v36 * v37);
                double v47 = v45 / (v40 * v42);
                if (CGRectContainsPoint(v77, v73)
                  && (v78.origin.double y = y,
                      v78.origin.CGFloat x = x,
                      v78.size.width = v40,
                      v78.size.height = v42,
                      v74.double y = v60,
                      v74.CGFloat x = v62,
                      CGRectContainsPoint(v78, v74)))
                {
                  if (v46 >= v47) {
                    double v48 = v45 / (v36 * v37);
                  }
                  else {
                    double v48 = v45 / (v40 * v42);
                  }
                }
                else if (v46 >= v47)
                {
                  double v48 = v45 / (v40 * v42);
                }
                else
                {
                  double v48 = v45 / (v36 * v37);
                }

                if (v48 >= 0.39)
                {
                  v49 = [NSNumber numberWithDouble:v48];
                  uint64_t v50 = objc_msgSend(v57, "indexOfObject:inSortedRange:options:usingComparator:", v49, 0, objc_msgSend(v57, "count"), 1024, &__block_literal_global_57_4165);

                  v51 = [NSNumber numberWithDouble:v48];
                  [v57 insertObject:v51 atIndex:v50];

                  [v56 insertObject:v16 atIndex:v50];
                }
              }
              else
              {
LABEL_30:
              }
            }
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v66 objects:v70 count:16];
        }
        while (v10);
      }

      if (a6) {
        *a6 = v57;
      }
    }
    else
    {
      id v56 = 0;
    }
    id v8 = v55;
  }
  else
  {
    id v56 = 0;
  }

  return v56;
}

uint64_t __106__PFPhotosFaceUtilities_sortedViableMergeCandidateTorsosFor_from_ignoreSourceAssetDimensions_matchScores___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

+ (id)sortedViableMergeCandidateFacesFor:(id)a3 from:(id)a4 ignoreSourceAssetDimensions:(BOOL)a5 matchScores:(id *)a6
{
  BOOL point_12 = a5;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v51 = v8;
    if ([v7 conformsToProtocol:&unk_1EF7E7700])
    {
      id v52 = [MEMORY[0x1E4F1CA48] array];
      id v53 = [MEMORY[0x1E4F1CA48] array];
      context = (void *)MEMORY[0x1A6259880]();
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v9 = v51;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v57 objects:v61 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v58 != v11) {
              objc_enumerationMutation(v9);
            }
            id v13 = *(id *)(*((void *)&v57 + 1) + 8 * i);
            if (v13 != v7
              && (objc_msgSend(*(id *)(*((void *)&v57 + 1) + 8 * i), "conformsToProtocol:", &unk_1EF7E7700, context) & 1) != 0)
            {
              id v14 = v7;
              id v15 = v13;
              unint64_t v16 = v15;
              if (!v15) {
                goto LABEL_29;
              }
              if (point_12)
              {
                uint64_t v17 = [v15 photosFaceRepresentationSourceWidth];
                uint64_t v18 = [v16 photosFaceRepresentationSourceHeight];
              }
              else
              {
                uint64_t v17 = [v14 photosFaceRepresentationSourceWidth];
                uint64_t v18 = [v14 photosFaceRepresentationSourceHeight];
              }
              uint64_t v19 = v18;
              double v20 = (double)v17;
              if ((double)v17 != (double)[v16 photosFaceRepresentationSourceWidth]) {
                goto LABEL_29;
              }
              double v21 = (double)v19;
              if ((double)v19 != (double)[v16 photosFaceRepresentationSourceHeight]) {
                goto LABEL_29;
              }
              double v22 = v20 >= v21 ? (double)v17 : (double)v19;
              [v14 photosFaceRepresentationCenterX];
              double v24 = v23;
              [v14 photosFaceRepresentationCenterY];
              double v26 = v25;
              [v14 photosFaceRepresentationSize];
              double v28 = v27;
              [v16 photosFaceRepresentationCenterX];
              double v30 = v29;
              [v16 photosFaceRepresentationCenterY];
              double v32 = v31;
              [v16 photosFaceRepresentationSize];
              CGFloat v33 = v24 * v20;
              CGFloat v34 = v26 * v21;
              double v35 = v22 * v28;
              double v36 = v30 * v20;
              double v37 = v32 * v21;
              double v39 = v22 * v38;
              CGFloat v54 = v34;
              CGFloat point = v33;
              double v40 = v33 - v35 * 0.5;
              double v41 = v34 - v35 * 0.5;
              v70.origin.CGFloat x = v36 - v39 * 0.5;
              v66.origin.CGFloat x = v40;
              v66.origin.double y = v41;
              v66.size.width = v35;
              v66.size.height = v35;
              v70.origin.double y = v37 - v39 * 0.5;
              v70.size.width = v39;
              v70.size.height = v39;
              CGRect v67 = CGRectIntersection(v66, v70);
              double v42 = v67.size.height * v67.size.width;
              if (v67.size.height * v67.size.width > 0.0)
              {
                v68.origin.CGFloat x = v40;
                v68.origin.double y = v41;
                v68.size.width = v35;
                v68.size.height = v35;
                v64.CGFloat x = v36;
                v64.double y = v37;
                double v43 = v42 / (v35 * v35);
                double v44 = v42 / (v39 * v39);
                if (CGRectContainsPoint(v68, v64)
                  && (v69.origin.CGFloat x = v36 - v39 * 0.5,
                      v65.double y = v54,
                      v69.origin.double y = v37 - v39 * 0.5,
                      v69.size.width = v39,
                      v69.size.height = v39,
                      v65.CGFloat x = point,
                      CGRectContainsPoint(v69, v65)))
                {
                  if (v43 < v44) {
                    double v43 = v42 / (v39 * v39);
                  }
                }
                else if (v43 >= v44)
                {
                  double v43 = v42 / (v39 * v39);
                }

                if (v43 >= 0.39)
                {
                  double v45 = [NSNumber numberWithDouble:v43];
                  uint64_t v46 = objc_msgSend(v53, "indexOfObject:inSortedRange:options:usingComparator:", v45, 0, objc_msgSend(v53, "count"), 1024, &__block_literal_global_4168);

                  double v47 = [NSNumber numberWithDouble:v43];
                  [v53 insertObject:v47 atIndex:v46];

                  [v52 insertObject:v16 atIndex:v46];
                }
              }
              else
              {
LABEL_29:
              }
            }
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v57 objects:v61 count:16];
        }
        while (v10);
      }

      if (a6) {
        *a6 = v53;
      }
    }
    else
    {
      id v52 = 0;
    }
    id v8 = v51;
  }
  else
  {
    id v52 = 0;
  }

  return v52;
}

uint64_t __105__PFPhotosFaceUtilities_sortedViableMergeCandidateFacesFor_from_ignoreSourceAssetDimensions_matchScores___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

@end