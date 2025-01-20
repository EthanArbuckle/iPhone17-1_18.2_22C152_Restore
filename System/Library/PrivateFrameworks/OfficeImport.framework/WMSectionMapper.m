@interface WMSectionMapper
+ (BOOL)isContentEmpty:(id)a3;
- (WMSectionMapper)initWithWDSection:(id)a3 breakAtStart:(BOOL)a4 breakAtEnd:(BOOL)a5 parent:(id)a6;
- (float)leftMargin;
- (float)topMargin;
- (void)MapSectionStyleAt:(id)a3;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapFooterAt:(id)a3 withState:(id)a4;
- (void)mapHeaderAt:(id)a3 withState:(id)a4;
- (void)setLeftMargin:(float)a3;
- (void)setTopMargin:(float)a3;
@end

@implementation WMSectionMapper

- (WMSectionMapper)initWithWDSection:(id)a3 breakAtStart:(BOOL)a4 breakAtEnd:(BOOL)a5 parent:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)WMSectionMapper;
  v13 = [(CMMapper *)&v18 initWithParent:v12];
  v14 = v13;
  if (v13)
  {
    p_wdSection = (id *)&v13->wdSection;
    objc_storeStrong((id *)&v13->wdSection, a3);
    v14->mTopMargin = (float)[*p_wdSection topMargin];
    v14->mLeftMargin = (float)[*p_wdSection leftMargin];
    v14->mBreakAtStart = a4;
    v14->mBreakAtEnd = a5;
    BOOL v16 = [*p_wdSection isTitlePageOverridden]
       && ([*p_wdSection titlePage] & 1) != 0;
    v14->mIsTitlePage = v16;
  }

  return v14;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  v7 = +[OIXMLElement elementWithType:3];
  [v14 addChild:v7];
  *(float *)&double v8 = self->mTopMargin;
  [v6 setTopMargin:v8];
  *(float *)&double v9 = self->mLeftMargin;
  [v6 setLeftMargin:v9];
  double v10 = (double)[(WDSection *)self->wdSection pageHeight] / 20.0;
  *(float *)&double v10 = v10;
  [v6 setPageHeight:v10];
  if (!self->mBreakAtStart)
  {
    int v11 = [v6 currentPage];
    if (v11) {
      [v6 setCurrentPage:(v11 - 1)];
    }
  }
  [(WMSectionMapper *)self MapSectionStyleAt:v7];
  id v12 = [(WDSection *)self->wdSection text];
  if ([v12 blockCount])
  {
    [(WMSectionMapper *)self mapHeaderAt:v7 withState:v6];
    v13 = [[WMSectionContentMapper alloc] initWithWDText:v12 parent:self];
    [(WMSectionContentMapper *)v13 mapAt:v7 withState:v6];
    [(WMSectionMapper *)self mapFooterAt:v7 withState:v6];
  }
}

- (void)MapSectionStyleAt:(id)a3
{
  id v5 = a3;
  v4 = objc_alloc_init(WMStyle);
  [(CMMapper *)self addStyleUsingGlobalCacheTo:v5 style:v4];
}

- (void)mapHeaderAt:(id)a3 withState:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  v7 = [(WDSection *)self->wdSection firstPageHeader];
  BOOL v8 = +[WMSectionMapper isContentEmpty:v7];

  if (!v8)
  {
    double v10 = [(WDSection *)self->wdSection firstPageHeader];
    goto LABEL_5;
  }
  double v9 = [(WDSection *)self->wdSection oddPageHeader];
  if (+[WMSectionMapper isContentEmpty:v9])
  {
  }
  else
  {
    BOOL mIsTitlePage = self->mIsTitlePage;

    if (!mIsTitlePage)
    {
      double v10 = [(WDSection *)self->wdSection oddPageHeader];
      [v6 setLastHeader:v10];
      goto LABEL_5;
    }
  }
  id v12 = [(WDSection *)self->wdSection evenPageHeader];
  if (+[WMSectionMapper isContentEmpty:v12])
  {

    goto LABEL_11;
  }
  BOOL v13 = self->mIsTitlePage;

  if (v13)
  {
LABEL_11:
    double v10 = [v6 lastHeader];
    if (!v10) {
      goto LABEL_18;
    }
    goto LABEL_12;
  }
  double v10 = [(WDSection *)self->wdSection evenPageHeader];
  [v6 setLastHeader:v10];
LABEL_5:
  if (!v10) {
    goto LABEL_11;
  }
LABEL_12:
  if (self->mBreakAtStart)
  {
    id v14 = +[OIXMLElement elementWithType:3];
    v15 = [(CMMapper *)self archiver];
    int v16 = [v15 progressiveMappingIsPausedOnPath:0];

    if (v16) {
      [v25 addChild:v14];
    }
    v17 = [(CMMapper *)self archiver];
    [v17 pauseProgressiveMappingOnPath:0];

    objc_super v18 = objc_alloc_init(CMStyle);
    [(CMMapper *)self addStyleUsingGlobalCacheTo:v14 style:v18];
    [v6 setIsHeaderOrFooter:1];
    v19 = [[WMSectionContentMapper alloc] initWithWDText:v10 parent:self];
    [(WMSectionContentMapper *)v19 mapAt:v14 withState:v6];
    [v6 setIsHeaderOrFooter:0];
    v20 = [(CMMapper *)self archiver];
    [v20 restartProgressiveMappingOnPath:0];

    if ((v16 & 1) == 0)
    {
      v21 = [(CMMapper *)self archiver];
      [v21 restartProgressiveMappingOnPath:0];

      v22 = [(CMMapper *)self archiver];
      [v22 pushCssToPath:0];

      v23 = [(CMMapper *)self archiver];
      v24 = [v14 XMLString];
      [v23 pushText:v24 toPath:0];
    }
    [v6 setIsHeaderOrFooter:0];
  }
LABEL_18:
}

+ (BOOL)isContentEmpty:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 blockCount];
    if (v5)
    {
      BOOL v6 = 0;
      uint64_t v7 = 0;
      do
      {
        BOOL v8 = [v4 blockAt:v7];
        if ([v8 blockType])
        {
          if ([v8 blockType] == 1) {
            goto LABEL_11;
          }
        }
        else if ([v8 runCount])
        {
LABEL_11:

          goto LABEL_10;
        }

        BOOL v6 = ++v7 >= v5;
      }
      while (v5 != v7);
    }
  }
  BOOL v6 = 1;
LABEL_10:

  return v6;
}

- (void)mapFooterAt:(id)a3 withState:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  uint64_t v7 = [(WDSection *)self->wdSection firstPageFooter];
  BOOL v8 = +[WMSectionMapper isContentEmpty:v7];

  if (v8)
  {
    double v9 = [(WDSection *)self->wdSection oddPageFooter];
    BOOL v10 = +[WMSectionMapper isContentEmpty:v9];

    if (v10)
    {
      int v11 = [(WDSection *)self->wdSection evenPageFooter];
      BOOL v12 = +[WMSectionMapper isContentEmpty:v11];

      if (v12)
      {
        BOOL v13 = 0;
        goto LABEL_11;
      }
      id v14 = [(WDSection *)self->wdSection evenPageFooter];
    }
    else
    {
      id v14 = [(WDSection *)self->wdSection oddPageFooter];
    }
  }
  else
  {
    id v14 = [(WDSection *)self->wdSection firstPageFooter];
  }
  BOOL v13 = v14;
  if (!v14 || ![v14 blockCount])
  {
LABEL_11:
    uint64_t v15 = [v6 lastFooter];

    BOOL v13 = (void *)v15;
    if (!v15) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  [v6 setLastFooter:v13];
LABEL_12:
  if (self->mBreakAtEnd)
  {
    [v6 setIsHeaderOrFooter:1];
    int v16 = [[WMSectionContentMapper alloc] initWithWDText:v13 parent:self];
    [(WMSectionContentMapper *)v16 mapAt:v17 withState:v6];
    [v6 setIsHeaderOrFooter:0];
  }
LABEL_14:
}

- (void)setTopMargin:(float)a3
{
  self->mTopMargin = a3;
}

- (float)topMargin
{
  return self->mTopMargin;
}

- (void)setLeftMargin:(float)a3
{
  self->mLeftMargin = a3;
}

- (float)leftMargin
{
  return self->mLeftMargin;
}

- (void).cxx_destruct
{
}

@end