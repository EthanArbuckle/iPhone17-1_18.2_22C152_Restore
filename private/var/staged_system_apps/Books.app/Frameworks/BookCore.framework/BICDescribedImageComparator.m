@interface BICDescribedImageComparator
- (BOOL)isCandidate:(id)a3 smallerThan:(id)a4;
- (BOOL)isMatching:(id)a3 withCandidateImage:(id)a4 includeQuality:(BOOL)a5;
- (BOOL)isMatching:(id)a3 withGenericImage:(id)a4;
- (BOOL)isTransformableMatch:(id)a3 withCandidateImage:(id)a4;
- (CGSize)_aspectMatchingSizeFrom:(id)a3 withCandidate:(id)a4;
- (id)sortedBestMatchOf:(id)a3 toCandidateImages:(id)a4;
- (unint64_t)differenceFromRequest:(id)a3 toCandidateImage:(id)a4;
- (unint64_t)fullDifferenceFromRequest:(id)a3 toCandidateImage:(id)a4;
@end

@implementation BICDescribedImageComparator

- (CGSize)_aspectMatchingSizeFrom:(id)a3 withCandidate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 imageSize];
  double v8 = v7;
  double v10 = v9;
  [v5 imageSize];
  double v12 = v11;
  double v14 = v13;
  unsigned int v15 = [v6 unknownAspectRatio];

  if (v15 && ([v5 unknownAspectRatio] & 1) == 0)
  {
    double height = CGSizeZero.height;
    if ((v8 != CGSizeZero.width || v10 != height) && (v12 != CGSizeZero.width || v14 != height))
    {
      double v19 = v12 / v14;
      if (v8 / v10 >= v12 / v14)
      {
        if (v8 / v10 > v12 / v14) {
          double v8 = round(v10 * v19);
        }
      }
      else
      {
        double v10 = round(v8 / v19);
      }
    }
  }

  double v20 = v8;
  double v21 = v10;
  result.double height = v21;
  result.width = v20;
  return result;
}

- (BOOL)isMatching:(id)a3 withGenericImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 quality] == 1) {
    goto LABEL_10;
  }
  double v8 = [v6 identifier];
  double v9 = [v7 identifier];
  unsigned int v10 = [v8 isEqualToString:v9];

  if (!v10
    || (unsigned int v11 = [v6 processingOptions],
        (([v7 processingOptions] ^ v11) & 0xFFFFFDFF) != 0)
    || ![v7 isGeneric])
  {
LABEL_10:
    char v18 = 0;
  }
  else
  {
    [(BICDescribedImageComparator *)self _aspectMatchingSizeFrom:v6 withCandidate:v7];
    double v13 = v12;
    double v15 = v14;
    [v7 imageSize];
    char v18 = v15 == v17 && v13 == v16;
    if (([v6 requestOptions] & 0x30) != 0) {
      char v18 = 1;
    }
  }

  return v18;
}

- (BOOL)isTransformableMatch:(id)a3 withCandidateImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 quality] == 1
    || ([v5 identifier],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v6 identifier],
        double v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v7 isEqualToString:v8],
        v8,
        v7,
        !v9))
  {
    BOOL v19 = 0;
  }
  else
  {
    [v5 imageSize];
    double v11 = v10;
    double v13 = v12;
    [v6 imageSize];
    double v15 = v14;
    double v17 = v16;
    if ([v6 processingOptions]) {
      BOOL v18 = 0;
    }
    else {
      BOOL v18 = [v6 quality] - 200 < 0xFFFFFF9C;
    }
    unsigned int v20 = [v6 processingOptions];
    BOOL v22 = v11 == v15 && v20 == 512;
    if (v13 != v17) {
      BOOL v22 = 0;
    }
    BOOL v19 = v18 || v22;
  }

  return v19;
}

- (BOOL)isMatching:(id)a3 withCandidateImage:(id)a4 includeQuality:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([v9 quality] == 1) {
    goto LABEL_9;
  }
  double v10 = [v8 identifier];
  double v11 = [v9 identifier];
  unsigned int v12 = [v10 isEqualToString:v11];

  if (!v12) {
    goto LABEL_9;
  }
  unsigned int v13 = [v8 processingOptions];
  if (v13 == [v9 processingOptions]
    && (!v5 || (unsigned int v14 = [v8 quality], v14 == objc_msgSend(v9, "quality"))))
  {
    [(BICDescribedImageComparator *)self _aspectMatchingSizeFrom:v8 withCandidate:v9];
    double v16 = v15;
    double v18 = v17;
    [v9 imageSize];
    BOOL v21 = v18 == v20 && v16 == v19;
  }
  else
  {
LABEL_9:
    BOOL v21 = 0;
  }

  return v21;
}

- (unint64_t)differenceFromRequest:(id)a3 toCandidateImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v7 quality];
  id v9 = [v6 identifier];
  double v10 = [v7 identifier];
  unsigned int v11 = [v9 isEqualToString:v10];

  unint64_t v12 = -1;
  if (!v11 || v8 == 1) {
    goto LABEL_25;
  }
  [(BICDescribedImageComparator *)self _aspectMatchingSizeFrom:v6 withCandidate:v7];
  double v14 = v13;
  double v16 = v15;
  [v7 imageSize];
  double v18 = v17;
  double v20 = v19;
  unsigned int v21 = [v7 processingOptions];
  unsigned int v22 = [v6 processingOptions];
  unsigned __int8 v23 = [v6 requestOptions];
  unsigned int v24 = [v7 quality];
  BOOL v25 = v14 == v18;
  if (v16 != v20) {
    BOOL v25 = 0;
  }
  int v26 = (v23 & 0x30) != 0 || v25;
  if (v26 == 1 && v22 == v21)
  {
    unint64_t v12 = 0;
    goto LABEL_11;
  }
  if ((v21 & 0x200) != 0)
  {
    if (!v26 || (unint64_t v12 = 0x2000000, (v21 & 0xFFFFFDFF) != 0) && (v21 & 0xFFFFFDFF) != v22)
    {
      unint64_t v12 = -1;
      goto LABEL_25;
    }
    goto LABEL_11;
  }
  unint64_t v12 = -1;
  if (((v21 >> 5) & 1) == (v22 & 0x20) >> 5 && !v21 && v24 - 100 >= 0x64 && (v22 & 0x20) == 0)
  {
    if (v25)
    {
      uint64_t v27 = 0;
    }
    else
    {
      uint64_t v29 = (uint64_t)(v18 * v20);
      if (v29)
      {
        uint64_t v30 = (uint64_t)(v14 * v16);
        BOOL v31 = v29 < v30;
        uint64_t v27 = v29 - v30;
        if (v31) {
          uint64_t v27 = 0x1000000 - v27;
        }
      }
      else
      {
        uint64_t v27 = 33554433;
      }
    }
    unint64_t v12 = v22 ? v27 + 0x1000000 : v27;
    if (v12 != -1)
    {
LABEL_11:
      if ([v7 isExpired]) {
        unint64_t v12 = -1;
      }
    }
  }
LABEL_25:

  return v12;
}

- (unint64_t)fullDifferenceFromRequest:(id)a3 toCandidateImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v6 identifier];
  id v9 = [v7 identifier];
  unsigned int v10 = [v8 isEqualToString:v9];

  if (!v10 || ([v7 isExpired] & 1) != 0) {
    goto LABEL_3;
  }
  [(BICDescribedImageComparator *)self _aspectMatchingSizeFrom:v6 withCandidate:v7];
  double v14 = v13;
  double v16 = v15;
  [v7 imageSize];
  double v18 = v17;
  double v20 = v19;
  BOOL v21 = v16 == v19 && v14 == v17;
  unsigned int v22 = [v7 processingOptions];
  unsigned int v23 = [v6 processingOptions];
  unsigned int v24 = v23;
  BOOL v25 = v23 != v22 && (v23 & 0x20) == 0;
  if (v23) {
    BOOL v26 = 0;
  }
  else {
    BOOL v26 = v22 == 0;
  }
  if (v23) {
    BOOL v27 = v23 == v22;
  }
  else {
    BOOL v27 = 0;
  }
  int v28 = v22 & 0xFDFF;
  int v29 = (v22 & 0xFDFF) == 0 && v21;
  if (!v22) {
    int v29 = 1;
  }
  int v30 = v25 & v29;
  unsigned int v31 = [v6 quality];
  unsigned int v32 = [v7 quality];
  if (v31) {
    BOOL v33 = v31 == v32;
  }
  else {
    BOOL v33 = 1;
  }
  int v34 = v33;
  if (v21)
  {
    unint64_t v35 = 0;
  }
  else
  {
    uint64_t v36 = (uint64_t)(v18 * v20);
    uint64_t v37 = (uint64_t)(v14 * v16);
    if (v36)
    {
      uint64_t v38 = v36 - v37;
      if (v36 < v37) {
        uint64_t v38 = 0x1000000 - (v36 - v37);
      }
      if (v36 == v37) {
        unint64_t v35 = 0;
      }
      else {
        unint64_t v35 = v38;
      }
    }
    else
    {
      unint64_t v35 = (unint64_t)(float)((float)((float)v37 * 0.9) + 16777000.0);
    }
  }
  unsigned int v39 = v32 - 100;
  if ((v26 | v30) == 1)
  {
    BOOL v40 = v32 > 1;
    if (v32 == 1) {
      char v41 = 1;
    }
    else {
      char v41 = v30;
    }
    if (v21)
    {
      BOOL v40 = v39 > 0x64;
      if (v39 >= 0x64 && (v41 & 1) == 0)
      {
        if (v34) {
          unint64_t v11 = 0;
        }
        else {
          unint64_t v11 = 208 - v32;
        }
        goto LABEL_4;
      }
    }
    if ((v24 & 0x20) == 0)
    {
      if (!v40)
      {
        switch(v32)
        {
          case 'd':
            goto LABEL_67;
          case 'e':
            uint64_t v42 = 503316480;
            goto LABEL_68;
          case 'f':
            uint64_t v42 = 469762048;
            goto LABEL_68;
          case 'g':
            uint64_t v42 = 402653184;
            goto LABEL_68;
          case 'h':
            uint64_t v42 = 335544320;
            goto LABEL_68;
          case 'i':
            uint64_t v42 = 0x8000000;
            goto LABEL_68;
          case 'j':
            uint64_t v42 = 0x10000000;
            goto LABEL_68;
          case 'k':
            uint64_t v42 = 201326592;
            goto LABEL_68;
          case 'l':
            uint64_t v42 = 0x4000000;
            goto LABEL_68;
          default:
            JUMPOUT(0);
        }
      }
      switch(v32)
      {
        case 0xC8u:
        case 0xD0u:
LABEL_67:
          uint64_t v42 = 637534208;
          break;
        case 0xC9u:
          uint64_t v42 = 436207616;
          break;
        case 0xCAu:
          uint64_t v42 = 369098752;
          break;
        case 0xCBu:
          uint64_t v42 = 301989888;
          break;
        case 0xCCu:
          uint64_t v42 = 234881024;
          break;
        case 0xCDu:
          uint64_t v42 = 167772160;
          break;
        case 0xCEu:
          uint64_t v42 = 100663296;
          break;
        case 0xCFu:
          uint64_t v42 = 0x2000000;
          break;
        default:
          switch(v32)
          {
            case 0u:
              uint64_t v42 = 0x20000000;
              break;
            case 1u:
              goto LABEL_67;
            case 2u:
              uint64_t v42 = 603979776;
              break;
            case 3u:
              uint64_t v42 = 570425344;
              break;
            default:
              uint64_t v42 = 0;
              break;
          }
          break;
      }
LABEL_68:
      unint64_t v43 = v42 + v35;
      if (v32 == 1) {
        unint64_t v11 = -1;
      }
      else {
        unint64_t v11 = v43;
      }
      goto LABEL_4;
    }
LABEL_3:
    unint64_t v11 = -1;
    goto LABEL_4;
  }
  if (!v27)
  {
    if (v28 == v24 && v21) {
      unint64_t v11 = -2;
    }
    else {
      unint64_t v11 = -1;
    }
    goto LABEL_4;
  }
  if (!v21) {
    goto LABEL_3;
  }
  unint64_t v11 = 0;
  if ((int)v32 > 99)
  {
    switch(v32)
    {
      case 0xC8u:
      case 0xD0u:
        goto LABEL_3;
      case 0xC9u:
        unint64_t v11 = 7;
        break;
      case 0xCAu:
        unint64_t v11 = 6;
        break;
      case 0xCBu:
        unint64_t v11 = 5;
        break;
      case 0xCCu:
        unint64_t v11 = 4;
        break;
      case 0xCDu:
        unint64_t v11 = 3;
        break;
      case 0xCEu:
        unint64_t v11 = 2;
        break;
      case 0xCFu:
        unint64_t v11 = 1;
        break;
      default:
        break;
    }
  }
  else
  {
    if (v32 < 2) {
      goto LABEL_3;
    }
    if (v32 == 2)
    {
      unint64_t v11 = 10;
    }
    else if (v32 == 3)
    {
      unint64_t v11 = 9;
    }
  }
LABEL_4:

  return v11;
}

- (id)sortedBestMatchOf:(id)a3 toCandidateImages:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v28 = [v6 requestOptions];
  unsigned __int8 v27 = [v6 requestOptions];
  if ((v27 & 0x10) != 0) {
    unsigned int v8 = 1;
  }
  else {
    unsigned int v8 = ([v6 requestOptions] >> 6) & 1;
  }
  unsigned int v26 = v8;
  unsigned __int8 v25 = [v6 requestOptions];
  unsigned int v23 = +[NSMutableArray array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        unint64_t v14 = [(BICDescribedImageComparator *)self fullDifferenceFromRequest:v6 toCandidateImage:v13];
        if (v14 != -1)
        {
          unint64_t v15 = v14;
          if ((v25 & 0x80) != 0) {
            unsigned int v16 = [v13 quality] == 101
          }
               || [v13 quality] == 2
               || [(BICDescribedImageComparator *)self isCandidate:v13 smallerThan:v6];
          else {
            unsigned int v16 = 0;
          }
          BOOL v17 = !(v27 & 0x10 | v28 & 0x20) && [v13 quality] == 3;
          unsigned int v18 = v26 ? [v13 requiresNetwork] : 0;
          BOOL v19 = (v27 & 0x10) != 0 && [v13 location] > 2;
          if ((v28 & 0x20) != 0 || ((v17 | v16 | v18 | v19) & 1) == 0)
          {
            double v20 = objc_alloc_init(BICDescribedImageWithScore);
            [(BICDescribedImageWithScore *)v20 setScore:v15];
            [(BICDescribedImageWithScore *)v20 setImage:v13];
            [v13 setMatchScore:[v20 score]];
            [v23 addObject:v20];
          }
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v10);
  }

  [v23 sortUsingSelector:"compare:"];
  BOOL v21 = [v23 valueForKey:@"image"];

  return v21;
}

- (BOOL)isCandidate:(id)a3 smallerThan:(id)a4
{
  id v5 = a4;
  [a3 imageSize];
  double v7 = v6;
  double v9 = v8;
  [v5 imageSize];
  double v11 = v10;
  double v13 = v12;

  if (CGSizeZero.width == v7 && CGSizeZero.height == v9) {
    return 0;
  }
  if (v9 < v13) {
    return 1;
  }
  return v7 < v11;
}

@end