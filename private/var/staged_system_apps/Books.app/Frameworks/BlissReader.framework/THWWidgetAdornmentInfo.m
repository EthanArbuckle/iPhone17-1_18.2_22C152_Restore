@interface THWWidgetAdornmentInfo
- (BOOL)hasCaption;
- (BOOL)hasTitle;
- (BOOL)panelContentProviderHasContentForPanel:(int)a3;
- (NSDictionary)insertionOrder;
- (THWWidgetBackgroundInfo)background;
- (TSDExteriorTextWrap)exteriorTextWrap;
- (TSWPShapeInfo)caption;
- (TSWPShapeInfo)title;
- (TSWPStorage)captionStorage;
- (TSWPStorage)titleStorage;
- (double)contentPadding;
- (id)bottomPanelInfos;
- (id)childCommandForReplaceAllCommand:(id)a3;
- (id)childEnumerator;
- (id)interleavedInfosWithInfos:(id)a3;
- (id)p_colorForStorage:(id)a3;
- (id)panelContentProviderChildInfosForPanel:(int)a3;
- (id)titleColor;
- (id)topPanelInfos;
- (int)layoutMode;
- (void)dealloc;
- (void)setBackground:(id)a3;
- (void)setCaption:(id)a3;
- (void)setContentPadding:(double)a3;
- (void)setExteriorTextWrap:(id)a3;
- (void)setInsertionOrder:(id)a3;
- (void)setLayoutMode:(int)a3;
- (void)setTitle:(id)a3;
- (void)updateParentInfo:(id)a3;
@end

@implementation THWWidgetAdornmentInfo

- (void)dealloc
{
  [(THWWidgetAdornmentInfo *)self setExteriorTextWrap:0];
  [(THWWidgetAdornmentInfo *)self setInsertionOrder:0];
  [(THWWidgetAdornmentInfo *)self setBackground:0];
  [(THWWidgetAdornmentInfo *)self setTitle:0];
  [(THWWidgetAdornmentInfo *)self setCaption:0];
  v3.receiver = self;
  v3.super_class = (Class)THWWidgetAdornmentInfo;
  [(THWWidgetAdornmentInfo *)&v3 dealloc];
}

- (TSWPStorage)titleStorage
{
  return (TSWPStorage *)[(TSWPShapeInfo *)self->_title containedStorage];
}

- (TSWPStorage)captionStorage
{
  return (TSWPStorage *)[(TSWPShapeInfo *)self->_caption containedStorage];
}

- (BOOL)hasTitle
{
  return [(THWWidgetAdornmentInfo *)self titleStorage] != 0;
}

- (BOOL)hasCaption
{
  return [(THWWidgetAdornmentInfo *)self captionStorage] != 0;
}

- (id)interleavedInfosWithInfos:(id)a3
{
  if (![(THWWidgetAdornmentInfo *)self insertionOrder])
  {
    id v5 = +[NSMutableDictionary dictionary];
    if ([(THWWidgetAdornmentInfo *)self background])
    {
      [v5 setObject:[self background] forKey:[NSNumber numberWithInteger:0]];
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v6 = 0;
    }
    if ([(THWWidgetAdornmentInfo *)self title]) {
      [v5 setObject:[self title] forKey:[NSNumber numberWithInteger:v6++]];
    }
    if ([(THWWidgetAdornmentInfo *)self caption]) {
      [v5 setObject:[self caption] forKey:[NSNumber numberWithInteger:v6]];
    }
    [(THWWidgetAdornmentInfo *)self setInsertionOrder:v5];
  }
  v7 = [(NSArray *)[(NSDictionary *)[(THWWidgetAdornmentInfo *)self insertionOrder] allKeys] sortedArrayUsingComparator:&stru_459E88];
  if (a3) {
    id v8 = [a3 mutableCopy];
  }
  else {
    id v8 = +[NSMutableArray array];
  }
  v9 = v8;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v7);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v15 = [v14 integerValue];
        if (v15 <= [v9 count]) {
          [v9 insertObject:[-[NSDictionary objectForKey:](-[THWWidgetAdornmentInfo insertionOrder](self, "insertionOrder"), "objectForKey:", v14) integerValue] atIndex:[-[NSDictionary objectForKey:](-[THWWidgetAdornmentInfo insertionOrder](self, "insertionOrder"), "objectForKey:", v14) integerValue]];
        }
      }
      id v11 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
  return v9;
}

- (void)updateParentInfo:(id)a3
{
  -[TSWPShapeInfo setParentInfo:](self->_title, "setParentInfo:");
  [(TSWPShapeInfo *)self->_caption setParentInfo:a3];
  background = self->_background;

  [(THWWidgetBackgroundInfo *)background setParentInfo:a3];
}

- (id)p_colorForStorage:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = objc_msgSend(objc_msgSend(a3, "characterStyleAtCharIndex:effectiveRange:", 0, 0), "valueForProperty:", 18);
  if (!v4) {
    id v4 = objc_msgSend(objc_msgSend(a3, "paragraphStyleAtCharIndex:effectiveRange:", 0, 0), "valueForProperty:", 18);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THWWidgetAdornmentInfo p_colorForStorage:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWWidgetAdornmentInfo.m"] lineNumber:113 description:@"style returned non-TSUColor"];
  }
  return v4;
}

- (id)titleColor
{
  id v3 = [(TSWPShapeInfo *)self->_title containedStorage];

  return [(THWWidgetAdornmentInfo *)self p_colorForStorage:v3];
}

- (BOOL)panelContentProviderHasContentForPanel:(int)a3
{
  if (a3 == 1)
  {
    id v3 = [(THWWidgetAdornmentInfo *)self captionStorage];
    return v3 != 0;
  }
  if (!a3)
  {
    id v3 = [(THWWidgetAdornmentInfo *)self titleStorage];
    return v3 != 0;
  }
  return 0;
}

- (id)topPanelInfos
{
  id v3 = +[NSMutableArray array];
  if ((![(THWWidgetAdornmentInfo *)self layoutMode]
     || [(THWWidgetAdornmentInfo *)self layoutMode] == 1)
    && [(THWWidgetAdornmentInfo *)self titleStorage])
  {
    [v3 addObject:[self titleStorage]];
  }
  if ([(THWWidgetAdornmentInfo *)self layoutMode] == 1
    && [(THWWidgetAdornmentInfo *)self captionStorage])
  {
    [v3 addObject:[self captionStorage]];
  }
  return v3;
}

- (id)bottomPanelInfos
{
  id v3 = +[NSMutableArray array];
  if ([(THWWidgetAdornmentInfo *)self layoutMode] == 2
    && [(THWWidgetAdornmentInfo *)self titleStorage])
  {
    [v3 addObject:[self titleStorage]];
  }
  if (![(THWWidgetAdornmentInfo *)self layoutMode]
    || [(THWWidgetAdornmentInfo *)self layoutMode] == 2)
  {
    if ([(THWWidgetAdornmentInfo *)self captionStorage]) {
      [v3 addObject:[self captionStorage]];
    }
  }
  return v3;
}

- (id)panelContentProviderChildInfosForPanel:(int)a3
{
  if (a3 == 1)
  {
    id result = [(THWWidgetAdornmentInfo *)self captionStorage];
    if (!result) {
      return result;
    }
    goto LABEL_6;
  }
  if (a3) {
    return 0;
  }
  id result = [(THWWidgetAdornmentInfo *)self titleStorage];
  if (result)
  {
LABEL_6:
    id v4 = result;
    return +[NSArray arrayWithObjects:&v4 count:1];
  }
  return result;
}

- (id)childCommandForReplaceAllCommand:(id)a3
{
  return 0;
}

- (id)childEnumerator
{
  id v3 = +[NSMutableArray array];
  if ([(THWWidgetAdornmentInfo *)self background]) {
    [v3 addObject:[self background]];
  }
  if ([(THWWidgetAdornmentInfo *)self title]) {
    [v3 addObject:[self title]];
  }
  if ([(THWWidgetAdornmentInfo *)self caption]) {
    [v3 addObject:[self caption]];
  }

  return [v3 objectEnumerator];
}

- (THWWidgetBackgroundInfo)background
{
  return self->_background;
}

- (void)setBackground:(id)a3
{
}

- (TSWPShapeInfo)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (TSWPShapeInfo)caption
{
  return self->_caption;
}

- (void)setCaption:(id)a3
{
}

- (double)contentPadding
{
  return self->_contentPadding;
}

- (void)setContentPadding:(double)a3
{
  self->_contentPadding = a3;
}

- (int)layoutMode
{
  return self->_layoutMode;
}

- (void)setLayoutMode:(int)a3
{
  self->_layoutMode = a3;
}

- (TSDExteriorTextWrap)exteriorTextWrap
{
  return self->_exteriorTextWrap;
}

- (void)setExteriorTextWrap:(id)a3
{
}

- (NSDictionary)insertionOrder
{
  return self->_insertionOrder;
}

- (void)setInsertionOrder:(id)a3
{
}

@end