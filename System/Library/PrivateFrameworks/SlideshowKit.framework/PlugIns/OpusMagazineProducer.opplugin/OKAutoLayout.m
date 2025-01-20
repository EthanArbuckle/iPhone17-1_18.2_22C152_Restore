@interface OKAutoLayout
+ (BOOL)needsPanoramaEffectForRectASP:(float)a3 mediaASP:(float)a4;
+ (float)croppedPercentageforRectASP:(float)a3 photoASP:(float)a4;
+ (float)panningCropThreshold;
+ (float)photoScoreForMediaItem:(id)a3;
+ (float)scaleFactorForMediaItem:(id)a3 toFitInRect:(CGRect)a4;
- (BOOL)allowMovieWithPhotos;
- (BOOL)forceToIterateAllLayouts;
- (BOOL)startFeedWith:(id)a3 primaryResolutionKey:(id)a4;
- (OKAutoLayout)initWithPresentation:(id)a3;
- (double)_croppingScoreForMediaItems:(id)a3 layoutInfo:(id)a4;
- (double)_maxDurationOfMediaItems:(id)a3;
- (double)layoutAspectRatio;
- (double)targetAspectRatio;
- (id)_analyzeLayouts2:(id)a3;
- (id)_findBestMatchingLayoutFromLayouts:(id)a3 forMediaItems:(id)a4 currentIndx:(unint64_t)a5 checkFollowingMediaItems:(int64_t)a6 remainingItems:(unint64_t)a7 subtitleAttributesForMediaItems:(id)a8 isFirstPage:(BOOL)a9;
- (id)_loopAllLayouts:(id)a3 numOfAllMedias:(unint64_t)a4 layoutInfos:(id)a5 primaryResolution:(id)a6;
- (id)_matchMediaItems:(id)a3 toLayoutInfo:(id)a4 orderedKeys:(id)a5;
- (id)_metadataForMediaItem:(id)a3;
- (id)_parseLayouts:(id)a3;
- (id)_titleTextForPresentation:(id)a3;
- (id)generateNextPagesByMediaItems:(id)a3 maxPages:(int64_t)a4 isFirstPage:(BOOL)a5;
- (id)generatePagesByMediaItems:(id)a3 layoutsByResolution:(id)a4 primaryResolutionKey:(id)a5;
- (id)liveFeedPrimaryResolutionKey;
- (int64_t)liveFeedNumOfMediasUsed;
- (int64_t)liveFeedNumOfPagesGenerated;
- (unint64_t)_analyzeLayouts:(id)a3;
- (void)dealloc;
- (void)endFeed;
- (void)setAllowMovieWithPhotos:(BOOL)a3;
- (void)setForceToIterateAllLayouts:(BOOL)a3;
- (void)setLayoutAspectRatio:(double)a3;
- (void)setTargetAspectRatio:(double)a3;
@end

@implementation OKAutoLayout

- (OKAutoLayout)initWithPresentation:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OKAutoLayout;
  v4 = [(OKAutoLayout *)&v6 init];
  if (v4)
  {
    v4->_presentation = (OKPresentation *)a3;
    [(OKAutoLayout *)v4 setAllowMovieWithPhotos:0];
    [(OKAutoLayout *)v4 setForceToIterateAllLayouts:0];
    v4->_metadataCacheDict = (NSMutableDictionary *)objc_opt_new();
    v4->_liveFeedContext = 0;
    v4->_freqController = (OKAutoLayoutFreqController *)objc_opt_new();
  }
  return v4;
}

- (void)dealloc
{
  presentation = self->_presentation;
  if (presentation)
  {

    self->_presentation = 0;
  }
  metadataCacheDict = self->_metadataCacheDict;
  if (metadataCacheDict)
  {

    self->_metadataCacheDict = 0;
  }
  liveFeedContext = self->_liveFeedContext;
  if (liveFeedContext)
  {

    self->_liveFeedContext = 0;
  }
  freqController = self->_freqController;
  if (freqController)
  {

    self->_freqController = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)OKAutoLayout;
  [(OKAutoLayout *)&v7 dealloc];
}

+ (float)croppedPercentageforRectASP:(float)a3 photoASP:(float)a4
{
  if (a4 < a3)
  {
    a4 = 1.0 / a4;
    a3 = 1.0 / a3;
  }
  return (float)(a4 - a3) / a4;
}

+ (float)panningCropThreshold
{
  return 0.4;
}

+ (BOOL)needsPanoramaEffectForRectASP:(float)a3 mediaASP:(float)a4
{
  +[OKAutoLayout panningCropThreshold];
  float v7 = v6;
  *(float *)&double v8 = a3;
  *(float *)&double v9 = a4;
  +[OKAutoLayout croppedPercentageforRectASP:v8 photoASP:v9];
  return v10 > v7;
}

+ (float)scaleFactorForMediaItem:(id)a3 toFitInRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  objc_msgSend(a3, "resolution", a4.origin.x, a4.origin.y);
  double v8 = v7;
  double v10 = v9;
  float v11 = width / height;
  [a3 aspectRatio];
  *(float *)&double v12 = v12;
  if (*(float *)&v12 >= v11) {
    return height / v10;
  }
  else {
    return width / v8;
  }
}

+ (float)photoScoreForMediaItem:(id)a3
{
  return 0.5;
}

- (double)_croppingScoreForMediaItems:(id)a3 layoutInfo:(id)a4
{
  id v7 = [a4 aspectRatiosInAppearOrder];
  id v8 = [a4 areaPercentInAppearOrder];
  id v9 = [a4 rectNamesInAppearOrder];
  if ([v7 count])
  {
    uint64_t v10 = 0;
    float v11 = 0.0;
    double v31 = 0.6;
    while (1)
    {
      objc_msgSend(objc_msgSend(v7, "objectAtIndexedSubscript:", v10, *(void *)&v31), "floatValue");
      float v13 = v12;
      objc_msgSend(-[OKAutoLayout _metadataForMediaItem:](self, "_metadataForMediaItem:", objc_msgSend(a3, "objectAtIndexedSubscript:", v10)), "aspectRatio");
      float v15 = v14;
      *(float *)&double v14 = v13;
      *(float *)&double v16 = v15;
      +[OKAutoLayout croppedPercentageforRectASP:v14 photoASP:v16];
      float v18 = v17;
      objc_msgSend(objc_msgSend(v8, "objectAtIndexedSubscript:", v10), "floatValue");
      float v20 = v19;
      id v21 = -[OKAutoLayout _metadataForMediaItem:](self, "_metadataForMediaItem:", [a3 objectAtIndexedSubscript:v10]);
      objc_msgSend(a4, "rectForRectName:", objc_msgSend(v9, "objectAtIndexedSubscript:", v10));
      +[OKAutoLayout scaleFactorForMediaItem:toFitInRect:](OKAutoLayout, "scaleFactorForMediaItem:toFitInRect:", v21);
      float v23 = v22;
      +[OKAutoLayout photoScoreForMediaItem:](OKAutoLayout, "photoScoreForMediaItem:", -[OKAutoLayout _metadataForMediaItem:](self, "_metadataForMediaItem:", [a3 objectAtIndexedSubscript:v10]));
      double v25 = v20;
      float v26 = (v24 + 0.5) * v20;
      if (v23 <= 1.0)
      {
        double v28 = v18;
        if (v18 <= 0.2) {
          goto LABEL_37;
        }
        if (v15 < 0.5 || v15 > 2.0)
        {
          if ((v15 > 1.0 || v13 > 1.0) && (v15 < 1.0 || v13 < 1.0)) {
            goto LABEL_30;
          }
          if (v13 > 1.5 || (double v28 = v13, HIDWORD(v25) = 1072001187, v13 < 0.67))
          {
            *(float *)&double v28 = v13;
            *(float *)&double v25 = v15;
            if (+[OKAutoLayout needsPanoramaEffectForRectASP:v28 mediaASP:v25])
            {
              goto LABEL_38;
            }
            goto LABEL_37;
          }
        }
        else
        {
          double v29 = v13 + -1.0;
          if (v29 < 0.0) {
            double v29 = -v29;
          }
          if (v29 > 0.1 && (v15 > 1.0 || v13 > 1.0) && (v15 < 1.0 || v13 < 1.0))
          {
LABEL_30:
            float v27 = 100.0;
            goto LABEL_5;
          }
          if (v13 < 0.5 || v13 > 2.0)
          {
            float v27 = 90.0;
            goto LABEL_5;
          }
          if (v29 >= 0.1 || v28 <= 0.4)
          {
            if (v28 <= v31)
            {
              if (v28 <= 0.4)
              {
                if (v28 > 0.2) {
                  float v26 = v26 * 30.0;
                }
                goto LABEL_37;
              }
              float v27 = 35.0;
            }
            else
            {
              float v27 = 50.0;
            }
            goto LABEL_5;
          }
        }
        float v27 = 80.0;
      }
      else
      {
        float v27 = 150.0;
      }
LABEL_5:
      float v26 = v26 + v27;
LABEL_37:
      float v11 = v11 + (float)(v18 * v26);
LABEL_38:
      if (++v10 >= (unint64_t)[v7 count]) {
        return v11;
      }
    }
  }
  return 0.0;
}

- (id)_matchMediaItems:(id)a3 toLayoutInfo:(id)a4 orderedKeys:(id)a5
{
  id v7 = [a4 rectNamesInAppearOrder];
  id v8 = +[NSMutableDictionary dictionary];
  if ([a3 count])
  {
    unint64_t v9 = 0;
    do
    {
      objc_msgSend(v8, "setObject:forKey:", objc_msgSend(a3, "objectAtIndexedSubscript:", v9), objc_msgSend(v7, "objectAtIndexedSubscript:", v9));
      ++v9;
    }
    while (v9 < (unint64_t)[a3 count]);
  }
  if (a5)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        float v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(a5, "addObject:", objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(a3, "indexOfObject:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v13))));
          float v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
  return v8;
}

- (id)_findBestMatchingLayoutFromLayouts:(id)a3 forMediaItems:(id)a4 currentIndx:(unint64_t)a5 checkFollowingMediaItems:(int64_t)a6 remainingItems:(unint64_t)a7 subtitleAttributesForMediaItems:(id)a8 isFirstPage:(BOOL)a9
{
  int64_t v11 = a6;
  BOOL v16 = a9;
  v50 = +[NSString stringWithFormat:@"%ldUp", a6];
  if ([(OKAutoLayout *)self _titleTextForPresentation:self->_presentation]) {
    BOOL v17 = a9;
  }
  else {
    BOOL v17 = 0;
  }
  BOOL v49 = v17;
  if (v17) {
    id v52 = 0;
  }
  else {
    id v52 = objc_msgSend(a8, "objectForKeyedSubscript:", objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", a5), "uniqueURL"));
  }
  id v53 = objc_msgSend(a4, "subarrayWithRange:", a5, (char *)objc_msgSend(a4, "count") - a5);
  id v48 = +[NSMutableArray array];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v42 = a3;
  id obj = [a3 allValues];
  id v59 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
  if (v59)
  {
    id v55 = a8;
    v43 = 0;
    uint64_t v58 = *(void *)v65;
    double v18 = -10000.0;
    float v19 = v50;
    BOOL v20 = v49;
    v57 = self;
    int64_t v46 = v11;
    unint64_t v47 = a7;
    id v44 = a4;
    unint64_t v45 = a5;
    do
    {
      for (i = 0; i != v59; i = (char *)i + 1)
      {
        if (*(void *)v65 != v58) {
          objc_enumerationMutation(obj);
        }
        float v22 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        if ((v11 == -1
           || objc_msgSend(objc_msgSend(*(id *)(*((void *)&v64 + 1) + 8 * i), "name"), "hasPrefix:", v19))&& (unint64_t)objc_msgSend(v22, "numOfMedia") <= a7)
        {
          BOOL v23 = [v22 isSubtitle] && v52 == 0;
          if (!v23
            && (!v52
             || [v22 isSubtitle] && objc_msgSend(v22, "numOfMedia") == (char *)&dword_0 + 1)
            && (!v20 || [v22 isTitle])
            && (![v22 isTitle] || v16))
          {
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            id v24 = [v53 countByEnumeratingWithState:&v60 objects:v69 count:16];
            if (!v24) {
              goto LABEL_45;
            }
            id v25 = v24;
            int v26 = 0;
            uint64_t v27 = 0;
            uint64_t v28 = 0;
            uint64_t v51 = 0;
            uint64_t v56 = *(void *)v61;
LABEL_28:
            uint64_t v29 = 0;
            uint64_t v30 = v51 + 1;
            v51 += (uint64_t)v25;
            while (1)
            {
              if (*(void *)v61 != v56) {
                objc_enumerationMutation(v53);
              }
              double v31 = *(void **)(*((void *)&v60 + 1) + 8 * v29);
              if (objc_msgSend(-[OKAutoLayout _metadataForMediaItem:](v57, "_metadataForMediaItem:", v31), "type") == (char *)&dword_0 + 3) {
                int v26 = v27++ > 2;
              }
              else {
                v26 |= (v27 > 0) & ~[(OKAutoLayout *)v57 allowMovieWithPhotos];
              }
              id v33 = objc_msgSend(v55, "objectForKeyedSubscript:", objc_msgSend(v31, "uniqueURL"));
              if (v33) {
                int v26 = v28 > 0;
              }
              if (v30 + v29 >= (unint64_t)[v22 numOfMedia]) {
                break;
              }
              if (v33) {
                ++v28;
              }
              if (v25 == (id)++v29)
              {
                id v25 = [v53 countByEnumeratingWithState:&v60 objects:v69 count:16];
                if (v25) {
                  goto LABEL_28;
                }
                break;
              }
            }
            self = v57;
            int64_t v11 = v46;
            a7 = v47;
            a4 = v44;
            a5 = v45;
            BOOL v16 = a9;
            if (v26)
            {
              float v19 = v50;
              BOOL v20 = v49;
            }
            else
            {
LABEL_45:
              -[OKAutoLayout _croppingScoreForMediaItems:layoutInfo:](self, "_croppingScoreForMediaItems:layoutInfo:", objc_msgSend(a4, "subarrayWithRange:", a5, objc_msgSend(v22, "numOfMedia")), v22);
              double v35 = v34;
              v68[0] = [v22 name];
              [v22 currentScore];
              v68[1] = +[NSNumber numberWithDouble:v36 - v35];
              objc_msgSend(v48, "addObject:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v68, 2));
              [v22 currentScore];
              float v19 = v50;
              BOOL v20 = v49;
              if (v37 - v35 > v18)
              {
                [v22 currentScore];
                double v18 = v38 - v35;
                v43 = v22;
              }
            }
          }
        }
      }
      id v59 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
    }
    while (v59);
  }
  else
  {
    v43 = 0;
  }
  id v39 = [(OKAutoLayoutFreqController *)self->_freqController bestLayoutByFreqOfAnyUpsFromLayouts:v48];
  v40 = v43;
  if (v39) {
    return objc_msgSend(v42, "objectForKeyedSubscript:", objc_msgSend(v39, "objectAtIndexedSubscript:", 0));
  }
  return v40;
}

- (double)_maxDurationOfMediaItems:(id)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v5) {
    return 0.0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v15;
  double v8 = 0.0;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(a3);
      }
      uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
      if (objc_msgSend(-[OKAutoLayout _metadataForMediaItem:](self, "_metadataForMediaItem:", v10), "type") == (char *)&dword_0 + 3)
      {
        objc_msgSend(-[OKAutoLayout _metadataForMediaItem:](self, "_metadataForMediaItem:", v10), "duration");
        if (v11 > v8)
        {
          objc_msgSend(-[OKAutoLayout _metadataForMediaItem:](self, "_metadataForMediaItem:", v10), "duration");
          double v8 = v12;
        }
      }
    }
    id v6 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v6);
  return v8;
}

- (unint64_t)_analyzeLayouts:(id)a3
{
  return 0;
}

- (id)_analyzeLayouts2:(id)a3
{
  return +[NSMutableDictionary dictionary];
}

- (id)_loopAllLayouts:(id)a3 numOfAllMedias:(unint64_t)a4 layoutInfos:(id)a5 primaryResolution:(id)a6
{
  return +[NSMutableArray array];
}

- (id)_titleTextForPresentation:(id)a3
{
  id v4 = [a3 guidelineAuthoringAttributedTitle];
  id result = [a3 guidelineAuthoringTitle];
  if (v4) {
    return v4;
  }
  return result;
}

- (id)generatePagesByMediaItems:(id)a3 layoutsByResolution:(id)a4 primaryResolutionKey:(id)a5
{
  uint64_t v7 = self;
  id v58 = [(OKAutoLayout *)self _parseLayouts:a4];
  id v57 = +[NSMutableDictionary dictionary];
  id v8 = +[NSMutableIndexSet indexSet];
  if ([a3 count])
  {
    unint64_t v9 = 0;
    do
    {
      id v10 = [a3 objectAtIndexedSubscript:v9];
      id v11 = -[OKPresentation guidelineAuthoringMediaAttributesForKey:](v7->_presentation, "guidelineAuthoringMediaAttributesForKey:", objc_msgSend(objc_msgSend(v10, "uniqueURL"), "absoluteString"));
      if (v11)
      {
        double v12 = v11;
        if ([v11 text] || objc_msgSend(v12, "attributedText"))
        {
          objc_msgSend(v57, "setObject:forKeyedSubscript:", v12, objc_msgSend(v10, "uniqueURL"));
          [v8 addIndex:v9];
        }
      }
      ++v9;
    }
    while (v9 < (unint64_t)[a3 count]);
  }
  id v59 = +[NSMutableArray array];
  if ([a3 count])
  {
    unint64_t v13 = 0;
    id v54 = a3;
    id v49 = v8;
    do
    {
      long long v14 = (char *)[a3 count] - v13;
      long long v15 = (char *)[v8 indexGreaterThanOrEqualToIndex:v13];
      if (v15 == (char *)v13) {
        uint64_t v16 = 1;
      }
      else {
        uint64_t v16 = (uint64_t)v14;
      }
      if ((unint64_t)v15 <= v13 || v15 == (char *)0x7FFFFFFFFFFFFFFFLL) {
        double v18 = (char *)v16;
      }
      else {
        double v18 = &v15[-v13];
      }
      id v19 = [v59 count];
      LOBYTE(v48) = v19 == 0;
      id v55 = v18;
      id v20 = -[OKAutoLayout _findBestMatchingLayoutFromLayouts:forMediaItems:currentIndx:checkFollowingMediaItems:remainingItems:subtitleAttributesForMediaItems:isFirstPage:](v7, "_findBestMatchingLayoutFromLayouts:forMediaItems:currentIndx:checkFollowingMediaItems:remainingItems:subtitleAttributesForMediaItems:isFirstPage:", [v58 objectForKey:a5], a3, v13, -1, v18, v57, v48);
      id v21 = objc_alloc_init((Class)NSMutableArray);
      id v22 = objc_msgSend(v57, "objectForKeyedSubscript:", objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v13), "uniqueURL"));
      if (v19
        || (id v25 = [(OKAutoLayout *)v7 _titleTextForPresentation:v7->_presentation]) == 0
        || (id v24 = v25, ([v20 isTitle] & 1) == 0))
      {
        if (!v22)
        {
          BOOL v23 = (NSDictionary *)&__NSDictionary0__struct;
          goto LABEL_29;
        }
        BOOL v23 = (NSDictionary *)&__NSDictionary0__struct;
        if (![v20 isSubtitle]) {
          goto LABEL_29;
        }
        id v24 = [v22 attributedText];
        if (!v24)
        {
          id v24 = [v22 text];
          if (!v24) {
            goto LABEL_29;
          }
        }
      }
      id v67 = [v20 textWidgetName];
      id v68 = v24;
      BOOL v23 = +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      objc_msgSend(v21, "addObject:", objc_msgSend(v20, "textWidgetName"));
LABEL_29:
      id v26 = +[NSMutableDictionary dictionary];
      if (v20)
      {
        v50 = v23;
        id v51 = v21;
        uint64_t v27 = v7;
        id v53 = v26;
        objc_msgSend(v26, "setObject:forKey:", objc_msgSend(v20, "origLayout"), a5);
        id v52 = v20;
        unint64_t v56 = v13;
        id v28 = objc_msgSend(a3, "subarrayWithRange:", v13, objc_msgSend(v20, "numOfMedia"));
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v29 = [v58 allKeys];
        id v30 = [v29 countByEnumeratingWithState:&v60 objects:v66 count:16];
        if (v30)
        {
          id v31 = v30;
          uint64_t v32 = *(void *)v61;
          do
          {
            for (i = 0; i != v31; i = (char *)i + 1)
            {
              if (*(void *)v61 != v32) {
                objc_enumerationMutation(v29);
              }
              double v34 = *(void **)(*((void *)&v60 + 1) + 8 * i);
              if (([v34 isEqualToString:a5] & 1) == 0)
              {
                id v35 = a5;
                id v36 = [v58 objectForKey:v34];
                id v37 = [v28 count];
                LOBYTE(v48) = [v59 count] == 0;
                id v38 = [(OKAutoLayout *)v27 _findBestMatchingLayoutFromLayouts:v36 forMediaItems:v54 currentIndx:v56 checkFollowingMediaItems:v37 remainingItems:v55 subtitleAttributesForMediaItems:v57 isFirstPage:v48];
                if (v38) {
                  objc_msgSend(v53, "setObject:forKey:", objc_msgSend(v38, "origLayout"), v34);
                }
                else {
                  NSLog(@"can NOT find matched layout for resolution: %@", v34);
                }
                a5 = v35;
              }
            }
            id v31 = [v29 countByEnumeratingWithState:&v60 objects:v66 count:16];
          }
          while (v31);
        }
        uint64_t v7 = v27;
        [(OKAutoLayout *)v27 _maxDurationOfMediaItems:v28];
        double v40 = v39;
        v41 = v27;
        id v42 = v28;
        id v21 = v51;
        id v20 = v52;
        id v43 = [(OKAutoLayout *)v41 _matchMediaItems:v42 toLayoutInfo:v52 orderedKeys:v51];
        v64[0] = @"primary resolution";
        v64[1] = @"all layouts";
        v65[0] = a5;
        v65[1] = v53;
        v64[2] = @"mediaItemsDict";
        v64[3] = @"textItemsDict";
        v65[2] = v43;
        v65[3] = v50;
        v65[4] = v51;
        v64[4] = @"allItems";
        v64[5] = @"maxMediaDuration";
        if (v40 >= 0.0) {
          double v44 = v40;
        }
        else {
          double v44 = 0.0;
        }
        v65[5] = +[NSNumber numberWithDouble:v44];
        objc_msgSend(v59, "addObject:", -[NSDictionary mutableCopy](+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v65, v64, 6), "mutableCopy"));
        a3 = v54;
        id v8 = v49;
        unint64_t v13 = v56;
      }

      [v20 currentScore];
      *(float *)&double v46 = v45 + -5.0;
      [v20 setCurrentScore:v46];
      v13 += (unint64_t)[v20 numOfMedia];
    }
    while (v13 < (unint64_t)[a3 count]);
  }
  [(NSMutableDictionary *)v7->_metadataCacheDict removeAllObjects];
  return v59;
}

- (id)_metadataForMediaItem:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->_metadataCacheDict, "objectForKey:", [a3 uniqueURL]);
  if (!v5)
  {
    id v5 = [a3 metadata];
    if (v5) {
      -[NSMutableDictionary setObject:forKey:](self->_metadataCacheDict, "setObject:forKey:", v5, [a3 uniqueURL]);
    }
  }
  return v5;
}

- (id)_parseLayouts:(id)a3
{
  id v19 = +[NSMutableDictionary dictionary];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [a3 allKeys];
  id v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v20)
  {
    uint64_t v17 = *(void *)v27;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v5 = +[NSMutableDictionary dictionary];
        uint64_t v21 = v4;
        id v6 = [a3 objectForKey:v4];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v7 = [v6 allKeys];
        id v8 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v23;
          do
          {
            for (j = 0; j != v9; j = (char *)j + 1)
            {
              if (*(void *)v23 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * (void)j);
              unint64_t v13 = -[OKAutoLayoutLayoutInfo initWithLayout:]([OKAutoLayoutLayoutInfo alloc], "initWithLayout:", [v6 objectForKey:v12]);
              [(OKAutoLayoutLayoutInfo *)v13 baseScore];
              if (v14 > 0.0) {
                [v5 setObject:v13 forKey:v12];
              }
            }
            id v9 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v9);
        }
        [v19 setObject:v5 forKey:v21];
      }
      id v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v20);
  }
  return v19;
}

- (double)layoutAspectRatio
{
  return self->_layoutAspectRatio;
}

- (void)setLayoutAspectRatio:(double)a3
{
  self->_layoutAspectRatio = a3;
}

- (double)targetAspectRatio
{
  return self->_targetAspectRatio;
}

- (void)setTargetAspectRatio:(double)a3
{
  self->_targetAspectRatio = a3;
}

- (BOOL)allowMovieWithPhotos
{
  return self->_allowMovieWithPhotos;
}

- (void)setAllowMovieWithPhotos:(BOOL)a3
{
  self->_allowMovieWithPhotos = a3;
}

- (BOOL)forceToIterateAllLayouts
{
  return self->_forceToIterateAllLayouts;
}

- (void)setForceToIterateAllLayouts:(BOOL)a3
{
  self->_forceToIterateAllLayouts = a3;
}

- (BOOL)startFeedWith:(id)a3 primaryResolutionKey:(id)a4
{
  self->_liveFeedContext = (OKAutoLayoutLiveFeedContext *)objc_opt_new();
  [(OKAutoLayoutLiveFeedContext *)self->_liveFeedContext setLayoutInfos:[(OKAutoLayout *)self _parseLayouts:a3]];
  [(OKAutoLayoutLiveFeedContext *)self->_liveFeedContext setPrimaryResolutionKey:a4];
  [(OKAutoLayoutLiveFeedContext *)self->_liveFeedContext setPagesGenerated:0];
  return 1;
}

- (id)generateNextPagesByMediaItems:(id)a3 maxPages:(int64_t)a4 isFirstPage:(BOOL)a5
{
  double v44 = [(OKAutoLayoutLiveFeedContext *)self->_liveFeedContext layoutInfos];
  id v7 = [(OKAutoLayoutLiveFeedContext *)self->_liveFeedContext primaryResolutionKey];
  unint64_t v47 = self;
  int64_t v37 = [(OKAutoLayoutLiveFeedContext *)self->_liveFeedContext pagesGenerated];
  id v8 = +[NSMutableArray array];
  id v46 = a3;
  if ([a3 count])
  {
    unint64_t v9 = 0;
    id v36 = v8;
    do
    {
      if ((unint64_t)[v8 count] >= a4) {
        break;
      }
      uint64_t v10 = (char *)[v46 count] - v9;
      LOBYTE(v35) = a5;
      id v11 = (NSDictionary *)&__NSDictionary0__struct;
      id v12 = [(OKAutoLayout *)v47 _findBestMatchingLayoutFromLayouts:[(NSMutableDictionary *)v44 objectForKey:v7] forMediaItems:v46 currentIndx:v9 checkFollowingMediaItems:-1 remainingItems:v10 subtitleAttributesForMediaItems:&__NSDictionary0__struct isFirstPage:v35];
      id v13 = objc_msgSend(v46, "subarrayWithRange:", v9, objc_msgSend(v12, "numOfMedia"));
      id v14 = objc_alloc_init((Class)NSMutableArray);
      if (!(v37 | v9))
      {
        id v15 = [(OKAutoLayout *)v47 _titleTextForPresentation:v47->_presentation];
        if (v15)
        {
          id v16 = v15;
          id v55 = [v12 textWidgetName];
          id v56 = v16;
          id v11 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          objc_msgSend(v14, "addObject:", objc_msgSend(v12, "textWidgetName"));
        }
      }
      if (v12)
      {
        double v39 = v11;
        id v40 = v14;
        id v17 = +[NSMutableDictionary dictionary];
        id v43 = +[NSMutableDictionary dictionary];
        v41 = v12;
        id v42 = v17;
        objc_msgSend(v17, "setObject:forKey:", objc_msgSend(v12, "origLayout"), v7);
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v18 = [(NSMutableDictionary *)v44 allKeys];
        id v19 = [v18 countByEnumeratingWithState:&v48 objects:v54 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v49;
          do
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v49 != v21) {
                objc_enumerationMutation(v18);
              }
              long long v23 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              if (([v23 isEqualToString:v7] & 1) == 0)
              {
                LOBYTE(v35) = a5;
                id v24 = -[OKAutoLayout _findBestMatchingLayoutFromLayouts:forMediaItems:currentIndx:checkFollowingMediaItems:remainingItems:subtitleAttributesForMediaItems:isFirstPage:](v47, "_findBestMatchingLayoutFromLayouts:forMediaItems:currentIndx:checkFollowingMediaItems:remainingItems:subtitleAttributesForMediaItems:isFirstPage:", -[NSMutableDictionary objectForKey:](v44, "objectForKey:", v23), v46, v9, [v13 count], v10, &__NSDictionary0__struct, v35);
                if (v24)
                {
                  long long v25 = v24;
                  [v24 currentScore];
                  *(float *)&double v27 = v26 + -5.0;
                  [v25 setCurrentScore:v27];
                  objc_msgSend(v42, "setObject:forKey:", objc_msgSend(v25, "origLayout"), v23);
                  objc_msgSend(v43, "setObject:forKey:", objc_msgSend(v25, "name"), v23);
                }
                else
                {
                  NSLog(@"can NOT find matched layout for resolution: %@", v23);
                }
              }
            }
            id v20 = [v18 countByEnumeratingWithState:&v48 objects:v54 count:16];
          }
          while (v20);
        }
        [(OKAutoLayout *)v47 _maxDurationOfMediaItems:v13];
        double v29 = v28;
        id v30 = [(OKAutoLayout *)v47 _matchMediaItems:v13 toLayoutInfo:v41 orderedKeys:v40];
        v52[0] = @"primary resolution";
        v52[1] = @"all layouts";
        v53[0] = v7;
        v53[1] = v42;
        v52[2] = @"mediaItemsDict";
        v52[3] = @"textItemsDict";
        v53[2] = v30;
        v53[3] = v39;
        v53[4] = v40;
        v52[4] = @"allItems";
        v52[5] = @"maxMediaDuration";
        if (v29 >= 0.0) {
          double v31 = v29;
        }
        else {
          double v31 = 0.0;
        }
        v53[5] = +[NSNumber numberWithDouble:v31];
        id v8 = v36;
        objc_msgSend(v36, "addObject:", -[NSDictionary mutableCopy](+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v53, v52, 6), "mutableCopy"));
        -[OKAutoLayoutLiveFeedContext setMediasUsed:](v47->_liveFeedContext, "setMediasUsed:", (char *)[v41 numOfMedia]+ -[OKAutoLayoutLiveFeedContext mediasUsed](v47->_liveFeedContext, "mediasUsed"));
        v9 += (unint64_t)[v41 numOfMedia];
        [v41 currentScore];
        *(float *)&double v33 = v32 + -5.0;
        [v41 setCurrentScore:v33];
        id v14 = v40;
        [(OKAutoLayoutFreqController *)v47->_freqController addOnePageLayout:v43];
      }

      a5 = 0;
    }
    while (v9 < (unint64_t)[v46 count]);
  }
  [(NSMutableDictionary *)v47->_metadataCacheDict removeAllObjects];
  -[OKAutoLayoutLiveFeedContext setPagesGenerated:](v47->_liveFeedContext, "setPagesGenerated:", (char *)[v8 count]+ -[OKAutoLayoutLiveFeedContext pagesGenerated](v47->_liveFeedContext, "pagesGenerated"));
  return v8;
}

- (void)endFeed
{
  liveFeedContext = self->_liveFeedContext;
  if (liveFeedContext)
  {

    self->_liveFeedContext = 0;
  }
}

- (int64_t)liveFeedNumOfMediasUsed
{
  int64_t result = (int64_t)self->_liveFeedContext;
  if (result) {
    return (int64_t)[(id)result mediasUsed];
  }
  return result;
}

- (int64_t)liveFeedNumOfPagesGenerated
{
  int64_t result = (int64_t)self->_liveFeedContext;
  if (result) {
    return (int64_t)[(id)result pagesGenerated];
  }
  return result;
}

- (id)liveFeedPrimaryResolutionKey
{
  id result = self->_liveFeedContext;
  if (result) {
    return [result primaryResolutionKey];
  }
  return result;
}

@end