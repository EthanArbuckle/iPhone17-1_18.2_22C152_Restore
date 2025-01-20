@interface THMacTOCNode
+ (id)nodeForPageIndex:(int64_t)a3 inNode:(id)a4 excludeHeadings:(BOOL)a5;
+ (id)nodeTreeWithDocumentRoot:(id)a3 navigator:(id)a4 hasPaginatedData:(BOOL)a5;
+ (id)pageNodeForPageIndex:(int64_t)a3 inNode:(id)a4;
- (CGImage)image;
- (NSMutableArray)children;
- (NSMutableArray)pages;
- (NSObject)observer;
- (NSString)displayPageNumber;
- (NSString)nodeNumberString;
- (NSString)title;
- (THDocumentNavigator)navigator;
- (THMacTOCNode)init;
- (THModelLink)link;
- (THModelPageInfo)chapterTOCPageInfo;
- (TSPData)imageData;
- (id)nodeSubTitle;
- (id)rootNodeFilteringOutFirstLevelNodesOfType:(int)a3;
- (int)displayPageNumberFormat;
- (int)nodeType;
- (int64_t)absolutePageIndex;
- (unint64_t)displayPageNumberValue;
- (unint64_t)nodeLevel;
- (void)addChild:(id)a3;
- (void)addPage:(id)a3;
- (void)dealloc;
- (void)invalidatePaginationData;
- (void)p_invaliatePaginationData;
- (void)setAbsolutePageIndex:(int64_t)a3;
- (void)setChapterTOCPageInfo:(id)a3;
- (void)setChildren:(id)a3;
- (void)setDisplayPageNumber:(id)a3;
- (void)setDisplayPageNumberFormat:(int)a3;
- (void)setDisplayPageNumberValue:(unint64_t)a3;
- (void)setImageData:(id)a3;
- (void)setLink:(id)a3;
- (void)setNavigator:(id)a3;
- (void)setNodeNumberString:(id)a3;
- (void)setNodeType:(int)a3;
- (void)setObserver:(id)a3;
- (void)setPages:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation THMacTOCNode

+ (id)nodeTreeWithDocumentRoot:(id)a3 navigator:(id)a4 hasPaginatedData:(BOOL)a5
{
  BOOL v5 = a5;
  v7 = objc_alloc_init(THMacTOCNode);
  [(THMacTOCNode *)v7 setNodeType:1];
  if (v5)
  {
    v8 = objc_alloc_init(THMacTOCNode);
    [(THMacTOCNode *)v8 setNodeType:8];
    -[THMacTOCNode setTitle:](v8, "setTitle:", [(id)THBundle() localizedStringForKey:@"Thumbnails" value:&stru_46D7E8 table:0]);
    [(THMacTOCNode *)v8 setAbsolutePageIndex:0x7FFFFFFFFFFFFFFFLL];
    [(THMacTOCNode *)v8 setDisplayPageNumber:&stru_46D7E8];
    [(THMacTOCNode *)v7 addChild:v8];
  }
  id v9 = [a3 properties];
  if ([v9 introMediaUrl])
  {
    v10 = objc_alloc_init(THMacTOCNode);
    [(THMacTOCNode *)v10 setNodeType:2];
    -[THMacTOCNode setTitle:](v10, "setTitle:", [(id)THBundle() localizedStringForKey:@"Intro Image" value:&stru_46D7E8 table:0]);
    [(THMacTOCNode *)v10 setAbsolutePageIndex:0x7FFFFFFFFFFFFFFFLL];
    [(THMacTOCNode *)v10 setDisplayPageNumber:&stru_46D7E8];
    if ([v9 introMediaIsVideo])
    {
      -[THMacTOCNode setTitle:](v10, "setTitle:", [(id)THBundle() localizedStringForKey:@"Intro Movie" value:&stru_46D7E8 table:0]);
      v11 = +[AVAsset assetWithURL:](AVAsset, "assetWithURL:", [v9 introMediaUrl]);
      if (v11)
      {
        [(AVAsset *)v11 duration];
        Float64 Seconds = CMTimeGetSeconds(&time);
        double v13 = floor(Seconds / 60.0);
        double v14 = Seconds - v13 * 60.0;
        double v15 = floor(v13 / 60.0);
        double v16 = v13 - v15 * 60.0;
        v17 = (void *)THBundle();
        if (v15 <= 0.0) {
          v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", [v17 localizedStringForKey:@"%1$2d:%2$02d" value:&stru_46D7E8 table:0], (int)v16, (int)v14, v47);
        }
        else {
          v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", [v17 localizedStringForKey:@"%1$2d:%2$02d:%3$02d" value:&stru_46D7E8 table:0], (int)v15, (int)v16, (int)v14);
        }
        [(THMacTOCNode *)v10 setDisplayPageNumber:v18];
      }
    }
    [(THMacTOCNode *)v7 addChild:v10];
  }
  id v19 = [a3 tocModel];
  if (objc_msgSend(objc_msgSend(v19, "tiles"), "count"))
  {
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    v54 = v7;
    BOOL v49 = v5;
    id v52 = a4;
    v48 = v19;
    do
    {
      uint64_t v51 = v20;
      id v22 = [v19 tiles][v20];
      id v23 = [v22 browserPageNode];
      v24 = objc_alloc_init(THMacTOCNode);
      [(THMacTOCNode *)v24 setNodeType:16];
      -[THMacTOCNode setChapterTOCPageInfo:](v24, "setChapterTOCPageInfo:", objc_msgSend(v23, "pageAtRelativeIndex:forPresentationType:", 0, objc_msgSend(objc_msgSend(a3, "properties"), "chapterBrowserPagePresentationType")));
      -[THMacTOCNode setTitle:](v24, "setTitle:", objc_msgSend(objc_msgSend(v22, "frontTitleText"), "im_stringByCollapsingRunsOfWhitespaceAndNewlines"));
      [(THMacTOCNode *)v24 setNavigator:a4];
      -[THMacTOCNode setLink:](v24, "setLink:", [v22 firstModelLink]);
      if (v5) {
        uint64_t v25 = v21;
      }
      else {
        uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
      }
      [(THMacTOCNode *)v24 setAbsolutePageIndex:v25];
      if (v5) {
        -[THMacTOCNode setImageData:](v24, "setImageData:", objc_msgSend(objc_msgSend(v22, "largerThumbs"), "objectAtIndex:", 0));
      }
      if (objc_msgSend(objc_msgSend(v22, "portraitEntries"), "count"))
      {
        unint64_t v26 = 0;
        v27 = 0;
        do
        {
          id v28 = objc_msgSend(objc_msgSend(v22, "portraitEntries"), "objectAtIndex:", v26);
          if (![v28 indentLevel])
          {
            if (v5)
            {
              -[THMacTOCNode setNodeNumberString:](v24, "setNodeNumberString:", [v28 sectionIdentifier]);
              -[THMacTOCNode setDisplayPageNumber:](v24, "setDisplayPageNumber:", [v28 displayPageNumber]);
              -[THMacTOCNode setDisplayPageNumberValue:](v24, "setDisplayPageNumberValue:", [v28 displayPageNumberValue]);
            }
            -[THMacTOCNode setDisplayPageNumberFormat:](v24, "setDisplayPageNumberFormat:", [v28 displayPageNumberFormat]);
            -[THMacTOCNode setLink:](v24, "setLink:", [v28 modelLink]);
          }
          if ([v28 indentLevel] == (char *)&dword_0 + 1
            && [v28 includeInTOC])
          {
            v27 = objc_alloc_init(THMacTOCNode);
            if ([v28 pageIndex] == (id)0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v29 = 128;
            }
            else {
              uint64_t v29 = 32;
            }
            [(THMacTOCNode *)v27 setNodeType:v29];
            [(THMacTOCNode *)v27 setNavigator:a4];
            -[THMacTOCNode setTitle:](v27, "setTitle:", objc_msgSend(objc_msgSend(v28, "title"), "im_stringByCollapsingRunsOfWhitespaceAndNewlines"));
            if (v5)
            {
              -[THMacTOCNode setNodeNumberString:](v27, "setNodeNumberString:", [v28 sectionIdentifier]);
              -[THMacTOCNode setDisplayPageNumber:](v27, "setDisplayPageNumber:", [v28 displayPageNumber]);
              -[THMacTOCNode setDisplayPageNumberValue:](v27, "setDisplayPageNumberValue:", [v28 displayPageNumberValue]);
              -[THMacTOCNode setDisplayPageNumberFormat:](v27, "setDisplayPageNumberFormat:", [v28 displayPageNumberFormat]);
              uint64_t v30 = (uint64_t)[v28 pageIndex];
            }
            else
            {
              -[THMacTOCNode setDisplayPageNumberFormat:](v27, "setDisplayPageNumberFormat:", [v28 displayPageNumberFormat]);
              uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
            }
            [(THMacTOCNode *)v27 setAbsolutePageIndex:v30];
            -[THMacTOCNode setLink:](v27, "setLink:", [v28 modelLink]);
            if ([v28 pageIndex] != (id)0x7FFFFFFFFFFFFFFFLL && v5)
            {
              id v31 = [v22 largerThumbs];
              v32 = [v28 pageIndex];
              int64_t v33 = v32 - (unsigned char *)[(THMacTOCNode *)v24 absolutePageIndex];
              a4 = v52;
              -[THMacTOCNode setImageData:](v27, "setImageData:", [v31 objectAtIndex:v33]);
            }
            [(THMacTOCNode *)v24 addChild:v27];
          }
          if ([v28 indentLevel] == (char *)&dword_0 + 2
            && [v28 includeInTOC])
          {
            v34 = objc_alloc_init(THMacTOCNode);
            [(THMacTOCNode *)v34 setNodeType:128];
            [(THMacTOCNode *)v34 setNavigator:a4];
            -[THMacTOCNode setTitle:](v34, "setTitle:", objc_msgSend(objc_msgSend(v28, "title"), "im_stringByCollapsingRunsOfWhitespaceAndNewlines"));
            if (v5)
            {
              -[THMacTOCNode setNodeNumberString:](v34, "setNodeNumberString:", [v28 sectionIdentifier]);
              -[THMacTOCNode setDisplayPageNumber:](v34, "setDisplayPageNumber:", [v28 displayPageNumber]);
              -[THMacTOCNode setDisplayPageNumberValue:](v34, "setDisplayPageNumberValue:", [v28 displayPageNumberValue]);
            }
            -[THMacTOCNode setDisplayPageNumberFormat:](v34, "setDisplayPageNumberFormat:", [v28 displayPageNumberFormat]);
            [(THMacTOCNode *)v34 setAbsolutePageIndex:0x7FFFFFFFFFFFFFFFLL];
            -[THMacTOCNode setLink:](v34, "setLink:", [v28 modelLink]);
            [(THMacTOCNode *)v27 addChild:v34];
          }
          ++v26;
        }
        while (v26 < (unint64_t)objc_msgSend(objc_msgSend(v22, "portraitEntries"), "count"));
      }
      [(THMacTOCNode *)v7 addChild:v24];
      if (v5)
      {
        ++v21;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v35 = [v22 largerThumbs];
        id v36 = [v35 countByEnumeratingWithState:&v55 objects:v60 count:16];
        if (v36)
        {
          id v37 = v36;
          uint64_t v38 = *(void *)v56;
          char v39 = 1;
          do
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(void *)v56 != v38) {
                objc_enumerationMutation(v35);
              }
              if ((v39 & 1) == 0)
              {
                uint64_t v41 = *(void *)(*((void *)&v55 + 1) + 8 * i);
                id v42 = [a1 nodeForPageIndex:v21 inNode:v54 excludeHeadings:1];
                v43 = objc_alloc_init(THMacTOCNode);
                [(THMacTOCNode *)v43 setNodeType:64];
                [v43 setDisplayPageNumberValue:([v42 displayPageNumberValue]+ v21- [v42 absolutePageIndex])];
                -[THMacTOCNode setDisplayPageNumberFormat:](v43, "setDisplayPageNumberFormat:", [v42 displayPageNumberFormat]);
                [(THMacTOCNode *)v43 setDisplayPageNumber:+[NSString stringForValue:[(THMacTOCNode *)v43 displayPageNumberValue] withListNumberFormat:[(THMacTOCNode *)v43 displayPageNumberFormat] includeFormatting:0]];
                [(THMacTOCNode *)v43 setAbsolutePageIndex:v21];
                [(THMacTOCNode *)v43 setImageData:v41];
                [(THMacTOCNode *)v24 addPage:v43];

                ++v21;
              }
              char v39 = 0;
            }
            id v37 = [v35 countByEnumeratingWithState:&v55 objects:v60 count:16];
            char v39 = 0;
          }
          while (v37);
        }
      }

      uint64_t v20 = v51 + 1;
      id v19 = v48;
      v7 = v54;
      BOOL v5 = v49;
      a4 = v52;
    }
    while (v51 + 1 < (unint64_t)objc_msgSend(objc_msgSend(v48, "tiles"), "count"));
  }
  else
  {
    uint64_t v21 = 0;
  }
  if (v5) {
    uint64_t v44 = v21;
  }
  else {
    uint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [(THMacTOCNode *)v7 setAbsolutePageIndex:v44];
  if (objc_msgSend(objc_msgSend(a3, "glossary"), "entryCount"))
  {
    v45 = objc_alloc_init(THMacTOCNode);
    [(THMacTOCNode *)v45 setNodeType:4];
    -[THMacTOCNode setTitle:](v45, "setTitle:", [(id)THBundle() localizedStringForKey:@"Glossary" value:&stru_46D7E8 table:0]);
    [(THMacTOCNode *)v45 setAbsolutePageIndex:0x7FFFFFFFFFFFFFFFLL];
    [(THMacTOCNode *)v45 setDisplayPageNumber:&stru_46D7E8];
    [(THMacTOCNode *)v7 addChild:v45];
  }
  return v7;
}

+ (id)nodeForPageIndex:(int64_t)a3 inNode:(id)a4 excludeHeadings:(BOOL)a5
{
  BOOL v5 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = [a4 children];
  id result = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (result)
  {
    id v10 = result;
    v11 = 0;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      double v13 = 0;
      do
      {
        double v14 = v11;
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v13);
        if (v5 && [*(id *)(*((void *)&v17 + 1) + 8 * (void)v13) nodeType] == 128
          || (id v15 = [v11 absolutePageIndex], v15 == (id)0x7FFFFFFFFFFFFFFFLL))
        {
          v11 = v14;
        }
        else if ((uint64_t)v15 >= a3)
        {
          if (v15 == (id)a3) {
            id result = v11;
          }
          else {
            id result = 0;
          }
          goto LABEL_17;
        }
        double v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      id result = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      id v10 = result;
      if (result) {
        continue;
      }
      break;
    }
    double v14 = v11;
LABEL_17:
    if (result) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = v14 == 0;
    }
    if (!v16)
    {
      if ([v14 absolutePageIndex] == (id)0x7FFFFFFFFFFFFFFFLL) {
        id result = 0;
      }
      else {
        id result = [a1 nodeForPageIndex:a3 inNode:v14 excludeHeadings:v5];
      }
      if (!result) {
        return v14;
      }
    }
  }
  return result;
}

+ (id)pageNodeForPageIndex:(int64_t)a3 inNode:(id)a4
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [a4 children];
  id result = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!result) {
    return result;
  }
  id v7 = result;
  id v8 = 0;
  uint64_t v9 = *(void *)v15;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    v11 = v8;
    if (*(void *)v15 != v9) {
      objc_enumerationMutation(v5);
    }
    id v8 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
    if ([v8 nodeType] != 128 && objc_msgSend(v8, "nodeType") != 32)
    {
      id v12 = [v8 absolutePageIndex];
      if (v12 != (id)0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
    }
    id v8 = v11;
LABEL_10:
    if (v7 == (id)++v10)
    {
      id result = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      id v7 = result;
      if (result) {
        goto LABEL_3;
      }
      v11 = v8;
      goto LABEL_20;
    }
  }
  if ((uint64_t)v12 < a3) {
    goto LABEL_10;
  }
  if (v12 == (id)a3) {
    id result = v8;
  }
  else {
    id result = 0;
  }
  if (!result)
  {
LABEL_20:
    if (v11)
    {
      unint64_t v13 = ~(unint64_t)[v11 absolutePageIndex] + a3;
      if (v13 >= (unint64_t)objc_msgSend(objc_msgSend(v11, "pages"), "count")) {
        return 0;
      }
      else {
        return [v11.pages objectAtIndex:v13];
      }
    }
  }
  return result;
}

- (void)invalidatePaginationData
{
  [(THMacTOCNode *)self p_invaliatePaginationData];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = [(THMacTOCNode *)self children];
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) invalidatePaginationData];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)p_invaliatePaginationData
{
  if ([(THMacTOCNode *)self nodeType] == 16
    || [(THMacTOCNode *)self nodeType] == 128
    || [(THMacTOCNode *)self nodeType] == 32)
  {
    self->_absolutePageIndex = 0x7FFFFFFFFFFFFFFFLL;
    self->_displayPageNumberValue = 0x7FFFFFFFFFFFFFFFLL;

    self->_displayPageNumber = 0;
  }
}

- (THMacTOCNode)init
{
  v3.receiver = self;
  v3.super_class = (Class)THMacTOCNode;
  id result = [(THMacTOCNode *)&v3 init];
  if (result) {
    result->_displayPageNumberValue = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)dealloc
{
  CGImageRelease(self->_image);
  v3.receiver = self;
  v3.super_class = (Class)THMacTOCNode;
  [(THMacTOCNode *)&v3 dealloc];
}

- (id)rootNodeFilteringOutFirstLevelNodesOfType:(int)a3
{
  id v5 = objc_alloc_init(THMacTOCNode);
  [(THMacTOCNode *)v5 setNodeType:[(THMacTOCNode *)self nodeType]];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(THMacTOCNode *)self children];
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    int v10 = ~a3;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (([v12 nodeType] & v10) != 0) {
          [(THMacTOCNode *)v5 addChild:v12];
        }
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  return v5;
}

- (void)addChild:(id)a3
{
  if (![(THMacTOCNode *)self children]) {
    [(THMacTOCNode *)self setChildren:+[NSMutableArray array]];
  }
  id v5 = [(THMacTOCNode *)self children];

  [(NSMutableArray *)v5 addObject:a3];
}

- (void)addPage:(id)a3
{
  if (![(THMacTOCNode *)self pages]) {
    [(THMacTOCNode *)self setPages:+[NSMutableArray array]];
  }
  id v5 = [(THMacTOCNode *)self pages];

  [(NSMutableArray *)v5 addObject:a3];
}

- (CGImage)image
{
  if (!self->_image && [(THMacTOCNode *)self imageData])
  {
    objc_super v3 = (CGImage *)+[TSDBitmapImageProvider CGImageForImageData:[(THMacTOCNode *)self imageData]];
    self->_image = v3;
    CGImageRetain(v3);
    [(THMacTOCNode *)self setImageData:0];
  }
  return self->_image;
}

- (unint64_t)nodeLevel
{
  unsigned int v2 = [(THMacTOCNode *)self nodeType];
  if (v2 == 32) {
    return 1;
  }
  else {
    return 2 * (v2 == 128);
  }
}

- (id)nodeSubTitle
{
  return [(THMacTOCNode *)self nodeNumberString];
}

- (int64_t)absolutePageIndex
{
  if (self->_absolutePageIndex == 0x7FFFFFFFFFFFFFFFLL
    && [(THMacTOCNode *)self navigator]
    && [(THMacTOCNode *)self link])
  {
    self->_absolutePageIndex = [(THDocumentNavigator *)[(THMacTOCNode *)self navigator] absolutePageIndexForLink:[(THMacTOCNode *)self link]];
  }
  return self->_absolutePageIndex;
}

- (NSString)displayPageNumber
{
  id result = self->_displayPageNumber;
  if (!result)
  {
    if (self->_displayPageNumberValue == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([(THMacTOCNode *)self navigator] && [(THMacTOCNode *)self link])
      {
        if (![(THDocumentRoot *)[(THDocumentNavigator *)[(THMacTOCNode *)self navigator] documentRoot] reflowablePaginationController]|| [(THReflowablePaginationController *)[(THDocumentRoot *)[(THDocumentNavigator *)[(THMacTOCNode *)self navigator] documentRoot] reflowablePaginationController] paginationComplete])
        {
          id v4 = [(THDocumentNavigator *)[(THMacTOCNode *)self navigator] pageNumberStringForLink:[(THMacTOCNode *)self link]];
LABEL_12:
          id result = v4;
          goto LABEL_13;
        }
      }
      else if ([(THMacTOCNode *)self absolutePageIndex] != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v4 = +[NSString stringWithFormat:@"%ld", (char *)[(THMacTOCNode *)self absolutePageIndex] + 1];
        goto LABEL_12;
      }
      id result = (NSString *)[(id)THBundle() localizedStringForKey:@"-" value:&stru_46D7E8 table:0];
LABEL_13:
      self->_displayPageNumber = result;
      return result;
    }
    id v4 = (NSString *)+[NSString stringForValue:[(THMacTOCNode *)self displayPageNumberValue] withListNumberFormat:[(THMacTOCNode *)self displayPageNumberFormat] includeFormatting:0];
    goto LABEL_12;
  }
  return result;
}

- (NSObject)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
  self->_observer = a3;
}

- (int)nodeType
{
  return self->_nodeType;
}

- (void)setNodeType:(int)a3
{
  self->_nodeType = a3;
}

- (THModelPageInfo)chapterTOCPageInfo
{
  return self->_chapterTOCPageInfo;
}

- (void)setChapterTOCPageInfo:(id)a3
{
}

- (NSString)nodeNumberString
{
  return self->_nodeNumberString;
}

- (void)setNodeNumberString:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (int)displayPageNumberFormat
{
  return self->_displayPageNumberFormat;
}

- (void)setDisplayPageNumberFormat:(int)a3
{
  self->_displayPageNumberFormat = a3;
}

- (unint64_t)displayPageNumberValue
{
  return self->_displayPageNumberValue;
}

- (void)setDisplayPageNumberValue:(unint64_t)a3
{
  self->_displayPageNumberValue = a3;
}

- (void)setDisplayPageNumber:(id)a3
{
}

- (void)setAbsolutePageIndex:(int64_t)a3
{
  self->_absolutePageIndex = a3;
}

- (THModelLink)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (NSMutableArray)pages
{
  return self->_pages;
}

- (void)setPages:(id)a3
{
}

- (THDocumentNavigator)navigator
{
  return self->_navigator;
}

- (void)setNavigator:(id)a3
{
}

- (TSPData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

@end