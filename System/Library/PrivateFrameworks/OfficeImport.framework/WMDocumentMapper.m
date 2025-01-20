@interface WMDocumentMapper
- (BOOL)hasSessionBreakAtIndex:(unint64_t)a3;
- (CGSize)contentSizeForDevice;
- (CGSize)pageSizeForDevice;
- (double)bottomMargin;
- (double)headerMargin;
- (double)leftMargin;
- (double)rightMargin;
- (double)topMargin;
- (id)archiver;
- (id)blipAtIndex:(unsigned int)a3;
- (id)documentTitle;
- (id)fileName;
- (id)styleMatrix;
- (int)defaultTabWidth;
- (void)mapDefaultCssStylesAt:(id)a3;
- (void)mapWithState:(id)a3;
- (void)setFileName:(id)a3;
@end

@implementation WMDocumentMapper

- (void)setFileName:(id)a3
{
}

- (void)mapWithState:(id)a3
{
  id v62 = a3;
  v4 = [(CMMapper *)self document];
  if ([v4 sectionCount])
  {
    uint64_t v5 = MEMORY[0x23EC9A170]();
    id v6 = +[CMXmlUtils copyXhtmlDocument];
    v59 = v6;
    v60 = [v6 rootElement];
    [(WMDocumentMapper *)self pageSizeForDevice];
    double v8 = v7;
    uint64_t v10 = (int)v9;
    [(CMArchiveManager *)self->super.super.mArchiver setHTMLWidth:v10];
    [(CMArchiveManager *)self->super.super.mArchiver setHTMLHeight:(int)v8];
    [(WMDocumentMapper *)self contentSizeForDevice];
    double v12 = v11;
    [(WMDocumentMapper *)self leftMargin];
    double v14 = v13;
    [(WMDocumentMapper *)self rightMargin];
    double v16 = v15;
    [(WMDocumentMapper *)self topMargin];
    double v18 = v17;
    [(WMDocumentMapper *)self headerMargin];
    double v20 = v19;
    [(WMDocumentMapper *)self bottomMargin];
    double v22 = v21;
    v23 = [(WMDocumentMapper *)self documentTitle];
    id v24 = +[CMXmlUtils copyHeadElementWithTitle:v23 deviceWidth:v10];

    v58 = v24;
    [v60 addChild:v24];
    v61 = +[OIXMLElement elementWithType:1];
    v25 = objc_alloc_init(CMStyle);
    [(CMStyle *)v25 appendPropertyForName:0x26EC07B58 intValue:0];
    [(CMStyle *)v25 appendPropertyForName:0x26EC07B78 intValue:0];
    [(CMMapper *)self addStyleUsingGlobalCacheTo:v61 style:v25];
    v26 = +[OIXMLElement elementWithType:3];
    v27 = objc_alloc_init(CMStyle);

    [(CMStyle *)v27 appendPropertyForName:0x26EC060D8 stringWithColons:@":hidden;"];
    [(CMStyle *)v27 appendPropertyForName:0x26EC07038 stringWithColons:@":relative;"];
    [(CMStyle *)v27 appendPropertyForName:0x26EC19658 stringValue:@"break-word"];
    [(CMStyle *)v27 appendPropertyForName:0x26EBFB8D8 intValue:(int)v12];
    [(CMStyle *)v27 appendPropertyForName:0x26EC19558 intValue:(int)v14];
    [(CMStyle *)v27 appendPropertyForName:0x26EC19578 intValue:(int)v16];
    [(CMStyle *)v27 appendPropertyForName:0x26EC194B8 intValue:844];
    if (v20 <= 0.0) {
      double v28 = v18;
    }
    else {
      double v28 = v20;
    }
    [(CMStyle *)v27 appendPropertyForName:0x26EC19598 intValue:(int)v28];
    [(CMStyle *)v27 appendPropertyForName:0x26EC19538 intValue:(int)v22];
    [(CMMapper *)self addStyleUsingGlobalCacheTo:v26 style:v27];
    [v61 addChild:v26];
    v57 = [v4 theme];
    v56 = [v57 baseStyles];
    v29 = [v56 colorScheme];
    [v62 setColorScheme:v29];

    [(WMDocumentMapper *)self mapDefaultCssStylesAt:v24];
    mArchiver = self->super.super.mArchiver;
    v31 = [v6 openingTagString];
    [(CMArchiveManager *)mArchiver pushText:v31 toPath:0];

    v32 = self->super.super.mArchiver;
    v33 = [v60 openingTagString];
    [(CMArchiveManager *)v32 pushText:v33 toPath:0];

    v34 = self->super.super.mArchiver;
    v35 = [v24 XMLString];
    [(CMArchiveManager *)v34 pushText:v35 toPath:0];

    [(CMArchiveManager *)self->super.super.mArchiver pushCssToPath:0];
    v36 = self->super.super.mArchiver;
    v37 = [v61 openingTagString];
    [(CMArchiveManager *)v36 pushText:v37 toPath:0];

    v38 = self->super.super.mArchiver;
    v39 = [v26 openingTagString];
    context = (void *)v5;
    [(CMArchiveManager *)v38 pushText:v39 toPath:0];

    v40 = v4;
    uint64_t v41 = [v4 sectionCount];
    uint64_t v42 = v41;
    if (v41)
    {
      uint64_t v43 = 0;
      uint64_t v44 = v41 - 1;
      do
      {
        v45 = [v40 sectionAt:v43];
        BOOL v46 = [(WMDocumentMapper *)self hasSessionBreakAtIndex:v43];
        BOOL v47 = v44 == v43 || [(WMDocumentMapper *)self hasSessionBreakAtIndex:v43 + 1];
        v48 = [[WMSectionMapper alloc] initWithWDSection:v45 breakAtStart:v46 breakAtEnd:v47 parent:self];
        [(WMSectionMapper *)v48 mapAt:v26 withState:v62];

        ++v43;
      }
      while (v42 != v43);
    }
    [v60 addChild:v61];
    [(CMArchiveManager *)self->super.super.mArchiver pushCssToPath:0];
    v49 = self->super.super.mArchiver;
    v50 = [v26 closingTagString];
    [(CMArchiveManager *)v49 pushText:v50 toPath:0];

    v51 = self->super.super.mArchiver;
    v52 = [v61 closingTagString];
    [(CMArchiveManager *)v51 pushText:v52 toPath:0];

    v53 = self->super.super.mArchiver;
    v54 = [v60 closingTagString];
    [(CMArchiveManager *)v53 pushText:v54 toPath:0];

    [(CMArchiveManager *)self->super.super.mArchiver commitDataAtPath:0];
    [(CMArchiveManager *)self->super.super.mArchiver closeResourceAtPath:0];

    v4 = v40;
  }
}

- (CGSize)pageSizeForDevice
{
  v2 = [(CMMapper *)self document];
  v3 = [v2 sections];
  v4 = [v3 objectAtIndex:0];

  double v5 = 980.0;
  if (v4)
  {
    if ([v4 isPageWidthOverridden]) {
      double v6 = (double)(int)((double)[v4 pageWidth] / 20.0);
    }
    else {
      double v6 = 600.0;
    }
    if ([v4 isPageHeightOverridden]) {
      double v5 = (double)(int)((double)[v4 pageHeight] / 20.0);
    }
  }
  else
  {
    double v6 = 600.0;
  }

  double v7 = v6;
  double v8 = v5;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)contentSizeForDevice
{
  v3 = [(CMMapper *)self document];
  v4 = [v3 sections];
  double v5 = [v4 objectAtIndex:0];

  if ([v5 isPageWidthOverridden])
  {
    uint64_t v6 = [v5 pageWidth];
    uint64_t v7 = [v5 leftMargin];
    double v8 = (double)(int)((double)(v6 - (v7 + [v5 rightMargin])) / 20.0);
  }
  else
  {
    [(WMDocumentMapper *)self leftMargin];
    double v10 = v9;
    [(WMDocumentMapper *)self rightMargin];
    double v8 = 600.0 - (v10 + v11);
  }
  if ([v5 isPageHeightOverridden])
  {
    uint64_t v12 = [v5 pageHeight];
    uint64_t v13 = [v5 topMargin];
    double v14 = (double)(int)((double)(v12 - (v13 + [v5 bottomMargin])) / 20.0);
  }
  else
  {
    [(WMDocumentMapper *)self topMargin];
    double v16 = v15;
    [(WMDocumentMapper *)self bottomMargin];
    double v14 = 980.0 - (v16 + v17);
  }

  double v18 = v8;
  double v19 = v14;
  result.height = v19;
  result.width = v18;
  return result;
}

- (double)leftMargin
{
  v2 = [(CMMapper *)self document];
  v3 = [v2 sections];
  v4 = [v3 objectAtIndex:0];

  if (!v4
    || ![v4 isLeftMarginOverridden]
    || (double v5 = (double)[v4 leftMargin] / 20.0, v5 > 300.0))
  {
    double v5 = 80.0;
  }

  return v5;
}

- (double)rightMargin
{
  v2 = [(CMMapper *)self document];
  v3 = [v2 sections];
  v4 = [v3 objectAtIndex:0];

  if (!v4
    || ![v4 isRightMarginOverridden]
    || (double v5 = (double)[v4 rightMargin] / 20.0, v5 > 300.0))
  {
    double v5 = 80.0;
  }

  return v5;
}

- (double)topMargin
{
  v2 = [(CMMapper *)self document];
  v3 = [v2 sections];
  v4 = [v3 objectAtIndex:0];

  if (!v4
    || ![v4 isTopMarginOverridden]
    || (double v5 = (double)[v4 topMargin] / 20.0, v5 > 500.0))
  {
    double v5 = 50.0;
  }

  return v5;
}

- (double)headerMargin
{
  v2 = [(CMMapper *)self document];
  v3 = [v2 sections];
  v4 = [v3 objectAtIndex:0];

  double v5 = 0.0;
  if (v4)
  {
    uint64_t v6 = [v4 firstPageHeader];
    if ([v6 blockCount])
    {
    }
    else
    {
      uint64_t v7 = [v4 oddPageHeader];
      uint64_t v8 = [v7 blockCount];

      if (!v8) {
        goto LABEL_8;
      }
    }
    if (![v4 isTopMarginOverridden]
      || (double v5 = (double)[v4 headerMargin] / 20.0, v5 > 500.0))
    {
      double v5 = 34.0;
    }
  }
LABEL_8:

  return v5;
}

- (double)bottomMargin
{
  v2 = [(CMMapper *)self document];
  v3 = [v2 sections];
  v4 = [v3 objectAtIndex:0];

  if (!v4
    || ![v4 isBottomMarginOverridden]
    || (double v5 = (double)[v4 bottomMargin] / 20.0, v5 > 500.0))
  {
    double v5 = 50.0;
  }

  return v5;
}

- (id)documentTitle
{
  v3 = [(CMMapper *)self document];
  v4 = [v3 summary];

  if (v4)
  {
    double v5 = [v3 summary];
    uint64_t v6 = [v5 title];

    if (v6 && [v6 length]) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [v3 oleFilename];

  if (v7 && [v7 length])
  {
    id v8 = v7;
LABEL_12:
    double v9 = v8;
    uint64_t v6 = v8;
    goto LABEL_13;
  }
  uint64_t v6 = [(WMDocumentMapper *)self fileName];

  if (v6 && [v6 length])
  {
LABEL_11:
    id v8 = v6;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v11 = [(CMArchiveManager *)self->super.super.mArchiver name];
    double v9 = [v11 lastPathComponent];
  }
  else
  {
    double v9 = 0;
  }
LABEL_13:

  return v9;
}

- (id)archiver
{
  return self->super.super.mArchiver;
}

- (void)mapDefaultCssStylesAt:(id)a3
{
  id v8 = a3;
  v3 = +[OIXMLElement elementWithType:17 stringValue:@"body\n{\n-webkit-text-size-adjust: none;\nfont-size:18;\n}\ndiv\n{\nmargin-top: 0;\nmargin-bottom: 0;\n}\n p\n{\nmargin-top: 0;\nmargin-bottom: 0;\nline-height: 120%\n}\n span\n{\nline-height: 120%\n}\ntable\n{\nborder-collapse: collapse;\nborder-color: black;\nfont-size:12;\n}\ntd\n{\nword-wrap:break-word\n}\n"];
  v4 = +[OIXMLAttribute attributeWithName:0x26EC11B98 stringValue:0x26EC18D18];
  [v3 addAttribute:v4];

  [v8 addChild:v3];
  double v5 = +[OIXMLElement elementWithType:17 stringValue:@".bumpedFont15\n{\nfont-size:1.5em;\n}\n.bumpedFont17\n{\nfont-size:1.7em;\n}\n.bumpedFont20\n{\nfont-size:2.0em;\n}\n"];

  uint64_t v6 = +[OIXMLAttribute attributeWithName:0x26EC11B98 stringValue:0x26EC18D18];
  [v5 addAttribute:v6];

  uint64_t v7 = +[OIXMLAttribute attributeWithName:0x26EC17718 stringValue:0x26EC19178];
  [v5 addAttribute:v7];

  [v8 addChild:v5];
}

- (BOOL)hasSessionBreakAtIndex:(unint64_t)a3
{
  v4 = [(CMMapper *)self document];
  double v5 = v4;
  if (a3)
  {
    uint64_t v6 = [v4 sectionAt:a3];
    if ([v6 isBreakTypeOverridden]) {
      unsigned int v7 = [v6 breakType];
    }
    else {
      unsigned int v7 = 2;
    }
    BOOL v8 = v7 > 1;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (int)defaultTabWidth
{
  v2 = [(CMMapper *)self document];
  v3 = v2;
  if (v2 && [v2 defaultTabWidth]) {
    int v4 = [v3 defaultTabWidth];
  }
  else {
    int v4 = 720;
  }

  return v4;
}

- (id)blipAtIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v4 = [(CMMapper *)self document];
  double v5 = [v4 blips];
  uint64_t v6 = [v5 blipAtIndex:v3];

  return v6;
}

- (id)fileName
{
  return objc_getProperty(self, a2, 48, 1);
}

- (id)styleMatrix
{
  v2 = [(CMMapper *)self document];
  uint64_t v3 = [v2 theme];
  int v4 = v3;
  if (v3)
  {
    double v5 = [v3 baseStyles];
    uint64_t v6 = v5;
    if (v5)
    {
      unsigned int v7 = [v5 styleMatrix];
    }
    else
    {
      unsigned int v7 = 0;
    }
  }
  else
  {
    unsigned int v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end