@interface WMParagraphMapper
+ (void)mapPlaceholderAt:(id)a3 rect:(CGRect)a4 withState:(id)a5;
- (BOOL)containsOfficeArt;
- (BOOL)isCollapsable:(id)a3;
- (BOOL)isTextFrame;
- (WMParagraphMapper)initWithBlock:(id)a3 parent:(id)a4;
- (id)activeNode;
- (id)runAtIndex:(unint64_t)a3;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapParagraphBodyWithState:(id)a3;
- (void)mapRunAt:(id)a3 run:(id)a4 withState:(id)a5;
@end

@implementation WMParagraphMapper

- (WMParagraphMapper)initWithBlock:(id)a3 parent:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WMParagraphMapper;
  v8 = [(CMMapper *)&v11 initWithParent:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->wdParagraph, a3);
  }

  return v9;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x23EC9A170]();
  if ([v6 containsParagraph:self->wdParagraph])
  {
    NSLog((NSString *)@"Bailing out: mapping a paragraph recursively");
  }
  else
  {
    [v6 pushParagraph:self->wdParagraph];
    BOOL v8 = [(WMParagraphMapper *)self isTextFrame];
    v9 = [[WMParagraphStyleMapper alloc] initWithWDParagraph:self->wdParagraph parent:self isInTextFrame:v8];
    BOOL v10 = [(WMParagraphMapper *)self containsOfficeArt];
    if ([(WMParagraphStyleMapper *)v9 isListItem] | v10 | v8) {
      +[OIXMLElement elementWithType:3];
    }
    else {
    objc_super v11 = +[OIXMLElement elementWithType:14];
    }
    p_mActiveNode = &self->mActiveNode;
    objc_storeStrong((id *)&self->mActiveNode, v11);

    v13 = [(CMMapper *)self archiver];
    int v14 = [v13 progressiveMappingIsPausedOnPath:0];

    if (v14) {
      [v20 addChild:*p_mActiveNode];
    }
    v15 = [(CMMapper *)self archiver];
    [v15 pauseProgressiveMappingOnPath:0];

    if (v10) {
      [(CMMapper *)self addAttribute:0x26EBFB938 toNode:*p_mActiveNode value:@"border:1px solid transparent;"];
    }
    [(WMParagraphStyleMapper *)v9 mapListStyleFromParagraphStyleWithState:v6];
    [(WMParagraphStyleMapper *)v9 mapParagraphStyle];
    [(WMParagraphStyleMapper *)v9 mapListStyleAt:*p_mActiveNode state:v6];
    [(WMParagraphStyleMapper *)v9 mapParagraphProperties];
    [(WMParagraphMapper *)self mapParagraphBodyWithState:v6];
    if (!self->mIsDeleted)
    {
      if ([(WMParagraphMapper *)self isCollapsable:*p_mActiveNode])
      {
        [(WMParagraphStyleMapper *)v9 destyleEmptyParagraph];
        +[WMCharacterRunMapper addNonCollapsableSpanAt:*p_mActiveNode withState:v6];
      }
      [(WMParagraphStyleMapper *)v9 mapAt:*p_mActiveNode withState:v6];
    }
    if ((v14 & 1) == 0)
    {
      v16 = [(CMMapper *)self archiver];
      [v16 restartProgressiveMappingOnPath:0];

      v17 = [(CMMapper *)self archiver];
      [v17 pushCssToPath:0];

      v18 = [(CMMapper *)self archiver];
      v19 = [(OIXMLNode *)*p_mActiveNode XMLString];
      [v18 pushText:v19 toPath:0];
    }
    [v6 popParagraph];
  }
}

- (BOOL)isTextFrame
{
  v2 = [(WDParagraph *)self->wdParagraph properties];
  if ([v2 isHorizontalAnchorOverridden]
    && [v2 horizontalAnchor]
    || [v2 isVerticalAnchorOverridden]
    && [v2 verticalAnchor] != 2
    || [v2 isHorizontalPositionOverridden] && objc_msgSend(v2, "horizontalPosition"))
  {
    BOOL v3 = 1;
  }
  else if ([v2 isVerticalPositionOverridden])
  {
    BOOL v3 = [v2 verticalPosition] != 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)containsOfficeArt
{
  unint64_t v3 = [(WDParagraph *)self->wdParagraph runCount];
  if (v3)
  {
    unint64_t v4 = v3;
    uint64_t v5 = 0;
    BOOL v6 = 1;
    do
    {
      id v7 = [(WDParagraph *)self->wdParagraph runAt:v5];
      int v8 = [v7 runType];

      if (v8 == 3) {
        break;
      }
      BOOL v6 = ++v5 < v4;
    }
    while (v4 != v5);
  }
  else
  {
    return 0;
  }
  return v6;
}

- (void)mapParagraphBodyWithState:(id)a3
{
  id v14 = a3;
  unint64_t v4 = [(WDParagraph *)self->wdParagraph runCount];
  self->mIsDeleted = v4 != 0;
  if (v4)
  {
    uint64_t v5 = 0;
    BOOL v6 = 0;
    while (1)
    {
      id v7 = [(WDParagraph *)self->wdParagraph runAt:v5];
      [v14 setRunIndex:v5];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v7 fieldMarkerType] == 19)
        {
          int v8 = [WMFieldMapper alloc];
          if (v6) {
            v9 = v6;
          }
          else {
            v9 = self;
          }
          uint64_t v10 = [(WMFieldMapper *)v8 initWithWDFieldMarker:v7 parent:v9];

          BOOL v6 = (WMParagraphMapper *)v10;
        }
        [(WMParagraphMapper *)v6 mapFieldMarkerAt:self->mActiveNode marker:v7 withState:v14];
        if ([v7 fieldMarkerType] != 21) {
          goto LABEL_17;
        }
        objc_super v11 = [(CMMapper *)v6 parent];

        if (v11 == self)
        {
          v12 = v6;
          BOOL v6 = 0;
        }
        else
        {
          [(CMMapper *)v6 parent];
          v12 = v6;
          BOOL v6 = (WMParagraphMapper *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        if (v6) {
          v13 = v6;
        }
        else {
          v13 = self;
        }
        v12 = v13;
        [(WMParagraphMapper *)v12 mapRunAt:self->mActiveNode run:v7 withState:v14];
      }

LABEL_17:
      if (v4 == ++v5)
      {

        break;
      }
    }
  }
}

- (void)mapRunAt:(id)a3 run:(id)a4 withState:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ([v9 isHidden] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[WMCharacterRunMapper alloc] initWithWDCharacterRun:v9 parent:self];
      [(WMCharacterRunMapper *)v8 mapAt:self->mActiveNode withState:v7];
      if (self->mIsDeleted) {
        self->mIsDeleted = [(WMCharacterRunMapper *)v8 isDeleted];
      }
      goto LABEL_10;
    }
    if ([v9 runType] == 4 || objc_msgSend(v9, "runType") == 5)
    {
      int v8 = [[WMPictureMapper alloc] initWithWDPicture:v9 parent:self];
      [(WMCharacterRunMapper *)v8 mapAt:self->mActiveNode withState:v7];
LABEL_9:
      self->mIsDeleted = 0;
LABEL_10:

      goto LABEL_11;
    }
    if ([v9 runType] == 3)
    {
      int v8 = [[WMOfficeArtMapper alloc] initWithWdOfficeArt:v9 parent:self];
      [(WMCharacterRunMapper *)v8 mapAt:self->mActiveNode withState:v7];
      goto LABEL_9;
    }
    if ([v9 runType] == 10)
    {
      int v8 = [[WMSymbolMapper alloc] initWithWDSymbol:v9 parent:self];
      [(WMCharacterRunMapper *)v8 mapAt:self->mActiveNode withState:v7];
      goto LABEL_9;
    }
    if ([v9 runType] == 12)
    {
      int v8 = [[WMBookmarkMapper alloc] initWithWDBookmark:v9 parent:self];
      [(WMCharacterRunMapper *)v8 mapAt:self->mActiveNode withState:v7];
      goto LABEL_9;
    }
  }
LABEL_11:
}

- (BOOL)isCollapsable:(id)a3
{
  if (![a3 childrenCount]) {
    return 1;
  }
  unint64_t v4 = [(WDParagraph *)self->wdParagraph runCount];
  if (!v4) {
    return 0;
  }
  unint64_t v5 = v4;
  BOOL v6 = 0;
  uint64_t v7 = 0;
  while (1)
  {
    int v8 = [(WDParagraph *)self->wdParagraph runAt:v7];
    if ([v8 runType] == 3)
    {
      BOOL v6 = 1;
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    if ([v8 runType] == 10)
    {
      BOOL v6 = 0;
      goto LABEL_19;
    }
LABEL_8:

    if (v5 == ++v7) {
      return v6;
    }
  }
  id v9 = [v8 string];
  BOOL v6 = ![v9 length]
    || [v9 length] == 1 && objc_msgSend(v9, "characterAtIndex:", 0) == 32;

LABEL_19:
  return v6;
}

- (id)activeNode
{
  return self->mActiveNode;
}

- (id)runAtIndex:(unint64_t)a3
{
  if ([(WDParagraph *)self->wdParagraph runCount] <= a3)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = [(WDParagraph *)self->wdParagraph runAt:a3];
  }
  return v5;
}

+ (void)mapPlaceholderAt:(id)a3 rect:(CGRect)a4 withState:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v14 = a3;
  id v10 = a5;
  objc_super v11 = +[OIXMLElement elementWithType:14];
  [v14 addChild:v11];
  v12 = objc_alloc_init(CMStyle);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  [(CMStyle *)v12 appendPropertyForName:0x26EC07B78 length:4 unit:CGRectGetHeight(v16)];
  v13 = [[CMMapper alloc] initWithParent:0];
  [(CMMapper *)v13 addStyleUsingGlobalCacheTo:v11 style:v12];
  +[WMCharacterRunMapper addNonCollapsableSpanAt:v11 withState:v10];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mActiveNode, 0);
  objc_storeStrong((id *)&self->wdParagraph, 0);
}

@end