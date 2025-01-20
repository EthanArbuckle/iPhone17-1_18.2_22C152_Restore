@interface _TUIWPText
- (BOOL)computingIntrinsic;
- (BOOL)shouldHyphenate;
- (BOOL)shrinkTextToFit;
- (BOOL)useShrinkToFit;
- (TUIWPLayout)layout;
- (double)textScaleFactor;
- (id)currentInlineDrawableLayouts;
- (id)layoutForInlineDrawable:(id)a3;
- (void)positionAttachmentLayoutsWithOffset:(CGPoint)a3 truncatedCharIndex:(unint64_t)a4;
- (void)scaleTextPercentDidChange:(unint64_t)a3;
- (void)setComputingIntrinsic:(BOOL)a3;
- (void)setLayout:(id)a3;
- (void)setTextScaleFactor:(double)a3;
- (void)setUseShrinkToFit:(BOOL)a3;
- (void)updateWithAttachmentLayouts:(id)a3;
@end

@implementation _TUIWPText

- (BOOL)shrinkTextToFit
{
  return self->_useShrinkToFit;
}

- (BOOL)shouldHyphenate
{
  return 1;
}

- (void)scaleTextPercentDidChange:(unint64_t)a3
{
  if (self->_useShrinkToFit)
  {
    [(NSMapTable *)self->_attachmentLayouts removeAllObjects];
    [(NSMutableArray *)self->_inlineLayouts removeAllObjects];
    if (a3 <= 1) {
      unint64_t v5 = 1;
    }
    else {
      unint64_t v5 = a3;
    }
    if (v5 >= 0x64) {
      unint64_t v5 = 100;
    }
    layout = self->_layout;
    [(TUIWPLayout *)layout _wpText:self scaleFactorDidChange:(double)v5 / 100.0];
  }
}

- (void)positionAttachmentLayoutsWithOffset:(CGPoint)a3 truncatedCharIndex:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v7 = [(NSMapTable *)self->_attachmentLayouts objectEnumerator];
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v13 = [v12 layout];
        v14 = [v12 geometry];
        [v14 frame];
        double v16 = v15;
        double v18 = v17;

        [v13 setComputedOrigin:x + v16, y + v18];
        objc_msgSend(v13, "setHidden:", (unint64_t)objc_msgSend(v12, "charIndex") >= a4);
      }
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
}

- (void)updateWithAttachmentLayouts:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    unint64_t v5 = +[NSMapTable mapTableWithKeyOptions:512 valueOptions:0];
    layouts = self->_layouts;
    self->_layouts = v5;

    v7 = +[NSMapTable mapTableWithKeyOptions:512 valueOptions:0];
    attachmentLayouts = self->_attachmentLayouts;
    self->_attachmentLayouts = v7;

    id v9 = (NSMutableArray *)objc_opt_new();
    inlineLayouts = self->_inlineLayouts;
    self->_inlineLayouts = v9;

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v4;
    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          double v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          double v17 = self->_layouts;
          double v18 = [v16 box:v22];
          [(NSMapTable *)v17 setObject:v16 forKey:v18];
        }
        id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }
  }
  else
  {
    long long v19 = self->_layouts;
    self->_layouts = 0;

    long long v20 = self->_attachmentLayouts;
    self->_attachmentLayouts = 0;

    long long v21 = self->_inlineLayouts;
    self->_inlineLayouts = 0;
  }
}

- (id)currentInlineDrawableLayouts
{
  return self->_inlineLayouts;
}

- (id)layoutForInlineDrawable:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 box];
  v6 = [(NSMapTable *)self->_attachmentLayouts objectForKey:v5];
  if (!v6)
  {
    v7 = [v4 owningAttachment];
    id v8 = [v7 findCharIndex];

    id v9 = [(NSMapTable *)self->_layouts objectForKey:v5];
    uint64_t v10 = [_TUIWPAttachmentLayout alloc];
    [v4 baselineOffset];
    v6 = -[_TUIWPAttachmentLayout initWithLayout:baselineOffset:intrinsic:charIndex:](v10, "initWithLayout:baselineOffset:intrinsic:charIndex:", v9, self->_computingIntrinsic, v8);
    attachmentLayouts = self->_attachmentLayouts;
    id v12 = [v9 box];
    [(NSMapTable *)attachmentLayouts setObject:v6 forKey:v12];

    [(NSMutableArray *)self->_inlineLayouts addObject:v6];
  }

  return v6;
}

- (double)textScaleFactor
{
  return self->_textScaleFactor;
}

- (void)setTextScaleFactor:(double)a3
{
  self->_textScaleFactor = a3;
}

- (BOOL)useShrinkToFit
{
  return self->_useShrinkToFit;
}

- (void)setUseShrinkToFit:(BOOL)a3
{
  self->_useShrinkToFit = a3;
}

- (BOOL)computingIntrinsic
{
  return self->_computingIntrinsic;
}

- (void)setComputingIntrinsic:(BOOL)a3
{
  self->_computingIntrinsic = a3;
}

- (TUIWPLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  self->_layout = (TUIWPLayout *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineLayouts, 0);
  objc_storeStrong((id *)&self->_attachmentLayouts, 0);

  objc_storeStrong((id *)&self->_layouts, 0);
}

@end