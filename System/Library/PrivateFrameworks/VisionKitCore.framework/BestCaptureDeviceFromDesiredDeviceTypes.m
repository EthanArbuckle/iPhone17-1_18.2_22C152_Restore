@interface BestCaptureDeviceFromDesiredDeviceTypes
@end

@implementation BestCaptureDeviceFromDesiredDeviceTypes

void ___BestCaptureDeviceFromDesiredDeviceTypes_block_invoke(uint64_t a1, void *a2)
{
  id v41 = a2;
  v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v4) {
    goto LABEL_19;
  }
  int v5 = *(unsigned __int8 *)(a1 + 56);
  double v6 = *(double *)(a1 + 40);
  double v7 = *(double *)(a1 + 48);
  id v8 = v4;
  id v9 = v41;
  if (v6 >= v7) {
    double v10 = v6;
  }
  else {
    double v10 = v7;
  }
  if (v6 >= v7) {
    double v6 = v7;
  }
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v8 formatDescription]);
  int32_t v12 = Dimensions;
  unint64_t v13 = HIDWORD(Dimensions);
  CMVideoDimensions v14 = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v9 formatDescription]);
  double v15 = (double)v12 - v10;
  if (v15 < 0.0) {
    double v15 = -v15;
  }
  int v16 = (int)v15;
  double v17 = (double)v14.width - v10;
  if (v17 < 0.0) {
    double v17 = -v17;
  }
  int v18 = (int)v17;
  double v19 = (double)(int)v13 - v6;
  double height = (double)v14.height;
  if (v19 < 0.0) {
    double v19 = -v19;
  }
  double v21 = height - v6;
  double v22 = -(height - v6);
  if (v21 < 0.0) {
    double v21 = v22;
  }
  if (v16 < v18) {
    goto LABEL_16;
  }
  if (v16 > v18) {
    goto LABEL_18;
  }
  if ((int)v19 < (int)v21) {
    goto LABEL_16;
  }
  if ((int)v19 > (int)v21) {
    goto LABEL_18;
  }
  id v23 = v9;
  FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)[v8 formatDescription]);
  v25 = (const opaqueCMFormatDescription *)[v23 formatDescription];

  FourCharCode v26 = CMFormatDescriptionGetMediaSubType(v25);
  if (MediaSubType == 875704422 && v26 != 875704422) {
    goto LABEL_16;
  }
  if (v26 != 875704422 && MediaSubType != 875704422)
  {
    if (MediaSubType != 1111970369 || v26 == 1111970369)
    {
      if (v26 != 1111970369 || MediaSubType == 1111970369) {
        goto LABEL_39;
      }
LABEL_18:

LABEL_19:
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      goto LABEL_20;
    }
LABEL_16:

    goto LABEL_20;
  }
  if (v26 == 875704422 && MediaSubType != 875704422) {
    goto LABEL_18;
  }
LABEL_39:
  id v28 = v8;
  id v29 = v23;
  int v30 = [v28 isVideoBinned];
  if (v5)
  {
    if (!v30 || [v29 isVideoBinned])
    {
      if ([v29 isVideoBinned])
      {
        uint64_t v31 = [v28 isVideoBinned] - 1;
        goto LABEL_48;
      }
      goto LABEL_50;
    }
    uint64_t v31 = 1;
  }
  else
  {
    if (!v30 || [v29 isVideoBinned])
    {
      if ([v29 isVideoBinned])
      {
        uint64_t v31 = [v28 isVideoBinned] ^ 1;
LABEL_48:

        if (v31) {
          goto LABEL_58;
        }
        goto LABEL_51;
      }
LABEL_50:

LABEL_51:
      id v32 = v29;
      v33 = _SlowestMaxFrameRateRange(v28);
      v34 = _SlowestMaxFrameRateRange(v32);

      [v33 maxFrameRate];
      double v36 = v35;
      [v34 maxFrameRate];
      if (v36 <= v37)
      {
        [v33 maxFrameRate];
        double v39 = v38;
        [v34 maxFrameRate];
        uint64_t v31 = v39 < v40;
      }
      else
      {
        uint64_t v31 = -1;
      }
      goto LABEL_57;
    }
    uint64_t v31 = -1;
  }
  v34 = v29;
  v33 = v28;
LABEL_57:

LABEL_58:
  if (v31 == -1) {
    goto LABEL_19;
  }
LABEL_20:
}

@end