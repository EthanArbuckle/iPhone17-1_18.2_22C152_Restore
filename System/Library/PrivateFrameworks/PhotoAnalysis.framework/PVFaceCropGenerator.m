@interface PVFaceCropGenerator
+ (id)generateFaceCropsFromSourceDescriptors:(id)a3 withProgressBlock:(id)a4 failureBlock:(id)a5 canceler:(id)a6;
@end

@implementation PVFaceCropGenerator

+ (id)generateFaceCropsFromSourceDescriptors:(id)a3 withProgressBlock:(id)a4 failureBlock:(id)a5 canceler:(id)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = (void (**)(id, void *, uint64_t, void))a4;
  v11 = (void (**)(id, id, uint64_t, void, id))a5;
  id v63 = a6;
  uint64_t v12 = [v9 count];
  if (v12)
  {
    uint64_t v59 = v12;
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    id v58 = (id)objc_claimAutoreleasedReturnValue();
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v53 = v9;
    id obj = v9;
    uint64_t v61 = [obj countByEnumeratingWithState:&v65 objects:v73 count:16];
    if (v61)
    {
      v55 = v10;
      uint64_t v62 = -1;
      uint64_t v60 = *(void *)v66;
      v56 = v11;
      while (2)
      {
        for (uint64_t i = 0; i != v61; ++i)
        {
          if (*(void *)v66 != v60) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = v62 + i;
          v15 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x1D26057A0]();
          if (v10)
          {
            v17 = (void *)MEMORY[0x1D26057A0]();
            v10[2](v10, v15, v14 + 1, v59);
          }
          id v64 = 0;
          id v18 = v15;
          if ([v63 canceled])
          {
            [MEMORY[0x1E4F28C58] errorForPhotoVisionCancelledOperation];
            v19 = 0;
            id v64 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v20 = [v18 face];
            if (v20)
            {
              v21 = [v18 image];
              if (v21)
              {
                [v20 normalizedFaceRect];
                double v23 = v22;
                double v25 = v24;
                double v27 = v26;
                double v29 = v28;
                id v30 = v21;
                objc_msgSend(v30, "imageRectForNormalizedRect:", v23, v25, v27, v29);
                double x = v76.origin.x;
                double y = v76.origin.y;
                double width = v76.size.width;
                double height = v76.size.height;
                if (CGRectIsNull(v76))
                {
                  v35 = (void *)MEMORY[0x1E4F28C58];
                  v36 = [NSString stringWithFormat:@"{ { %f, %f }, { %f, %f} } is not a normalized rect", *(void *)&v23, *(void *)&v25, *(void *)&v27, *(void *)&v29];
                  [v35 errorForPhotoVisionInvalidParameterWithLocalizedDescription:v36];
                  id v37 = 0;
                  id v64 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v54 = v16;
                  v36 = [v30 groupingIdentifier];
                  v38 = [v30 imageURL];
                  if (v38)
                  {
                    id v37 = +[PVFaceCropUtils newFaceCropFromImageURL:withFaceRect:groupingIdentifier:error:](PVFaceCropUtils, "newFaceCropFromImageURL:withFaceRect:groupingIdentifier:error:", v38, v36, &v64, x, y, width, height);
                  }
                  else
                  {
                    v39 = [v30 imageData];
                    if (v39)
                    {
                      id v37 = +[PVFaceCropUtils newFaceCropFromImageData:withFaceRect:groupingIdentifier:error:](PVFaceCropUtils, "newFaceCropFromImageData:withFaceRect:groupingIdentifier:error:", v39, v36, &v64, x, y, width, height);
                    }
                    else
                    {
                      [MEMORY[0x1E4F28C58] errorForPhotoVisionInvalidParameterWithLocalizedDescription:@"The image cannot provide an URL or a data representation"];
                      id v37 = 0;
                      id v64 = (id)objc_claimAutoreleasedReturnValue();
                    }

                    v38 = 0;
                  }

                  v16 = v54;
                }

                if (v37)
                {
                  v40 = [[PVFaceCrop alloc] initWithFaceCropData:v37 originatingFace:v20];
                  v19 = v40;
                  if (v40)
                  {
                    v41 = v40;
                  }
                  else
                  {
                    id v64 = [MEMORY[0x1E4F28C58] errorForPhotoVisionUnexpectedCondition:@"failed to create PVFaceCrop"];
                  }
                }
                else
                {
                  v19 = 0;
                }
              }
              else
              {
                [MEMORY[0x1E4F28C58] errorForPhotoVisionInvalidNilParameterNamed:@"faceCropSourceDescriptor.image"];
                v19 = 0;
                id v64 = (id)objc_claimAutoreleasedReturnValue();
              }

              v10 = v55;
            }
            else
            {
              [MEMORY[0x1E4F28C58] errorForPhotoVisionInvalidNilParameterNamed:@"faceCropSourceDescriptor.face"];
              v19 = 0;
              id v64 = (id)objc_claimAutoreleasedReturnValue();
            }

            v11 = v56;
          }

          id v42 = v64;
          if (v19)
          {
            [v58 addObject:v19];
          }
          else
          {
            if (v11) {
              v11[2](v11, v18, v14 + 1, v59, v42);
            }
            if ([v63 canceled])
            {
              id v43 = obj;
              v44 = v11;
              if (v11)
              {
                uint64_t v45 = v14 + 2;
                unint64_t v46 = [v43 count];
                unint64_t v47 = v46 - (v14 + 2);
                if (v46 > v14 + 2)
                {
                  unint64_t v48 = v46;
                  v49 = [MEMORY[0x1E4F28C58] errorForPhotoVisionCancelledOperation];
                  v50 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v45, v47);
                  v69[0] = MEMORY[0x1E4F143A8];
                  v69[1] = 3221225472;
                  v69[2] = ___reportCancellationOfRemainingFaceCropSourceDescriptors_block_invoke;
                  v69[3] = &unk_1E6917BD0;
                  v71 = v44;
                  unint64_t v72 = v48;
                  id v70 = v49;
                  id v51 = v49;
                  [v43 enumerateObjectsAtIndexes:v50 options:0 usingBlock:v69];
                }
              }

              v10 = v55;
              v11 = v56;
              goto LABEL_45;
            }
          }
        }
        v62 += i;
        uint64_t v61 = [obj countByEnumeratingWithState:&v65 objects:v73 count:16];
        if (v61) {
          continue;
        }
        break;
      }
    }
LABEL_45:

    id v9 = v53;
  }
  else
  {
    id v58 = [MEMORY[0x1E4F1C978] array];
  }

  return v58;
}

@end