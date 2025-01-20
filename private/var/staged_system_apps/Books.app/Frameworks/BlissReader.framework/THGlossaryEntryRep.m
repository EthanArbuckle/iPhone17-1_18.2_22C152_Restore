@interface THGlossaryEntryRep
- (BOOL)directlyManagesLayerContent;
- (double)fontSizeForLabelControl:(id)a3;
- (id)childRepsForHitTesting;
- (id)fontNameForLabelControl:(id)a3;
- (id)p_newTitleLayer;
- (id)shadowForLabelControl:(id)a3;
- (id)stringForLabelControl:(id)a3;
- (id)textColorForLabelControl:(id)a3;
- (int)horizontaAlignmentForLabelControl:(id)a3;
- (int)verticalAlignmentForLabelControl:(id)a3;
- (void)addAdditionalChildLayersToArray:(id)a3;
- (void)dealloc;
- (void)didUpdateLayer:(id)a3;
- (void)drawInLayerContext:(CGContext *)a3;
@end

@implementation THGlossaryEntryRep

- (void)dealloc
{
  self->mTitleLayer = 0;
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryEntryRep;
  [(THGlossaryEntryRep *)&v3 dealloc];
}

- (void)drawInLayerContext:(CGContext *)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryEntryRep drawInLayerContext:]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryEntryRep.m"];

  [v3 handleFailureInFunction:v4, v5, 39, @"this method should never be called, and entry reps should never get a bitmap allocated" file lineNumber description];
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (id)p_newTitleLayer
{
  id v3 = objc_alloc_init((Class)CATextLayer);
  [v3 setContentsGravity:kCAGravityTopLeft];
  objc_msgSend(v3, "setString:", objc_msgSend(objc_msgSend(-[THGlossaryEntryRep info](self, "info"), "entry"), "term"));
  [v3 setFont:@"Baskerville"];
  [v3 setFontSize:38.0];
  id v4 = objc_msgSend(objc_msgSend(-[THGlossaryEntryRep layout](self, "layout"), "layoutStyleProvider"), "glossaryEntryLayoutForegroundColor");
  if (!v4) {
    id v4 = +[TSUColor blackColor];
  }
  [v3 setForegroundColor:[v4 CGColor]];
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(objc_msgSend(objc_msgSend(-[THGlossaryEntryRep layout](self, "layout"), "layoutStyleProvider"), "glossaryEntryLayoutBackgroundColor"), "CGColor"));
  return v3;
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  if ((objc_msgSend(-[THGlossaryEntryRep info](self, "info"), "hasTitle") & 1) == 0)
  {
    if (!self->mTitleLayer) {
      self->mTitleLayer = (CATextLayer *)[(THGlossaryEntryRep *)self p_newTitleLayer];
    }
    [self layout].columnFrame
    -[CATextLayer setFrame:](self->mTitleLayer, "setFrame:");
    mTitleLayer = self->mTitleLayer;
    [a3 addObject:mTitleLayer];
  }
}

- (void)didUpdateLayer:(id)a3
{
  id v4 = [[[THGlossaryEntryRep layout] layoutStyleProvider] glossaryEntryLayoutBackgroundColor];

  [a3 setBackgroundColor:v4];
}

- (id)childRepsForHitTesting
{
  id v3 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(THGlossaryEntryRep *)self childReps];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v9];
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)stringForLabelControl:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "layout"), "tag"))
  {
    if (objc_msgSend(objc_msgSend(a3, "layout"), "tag") != (char *)&dword_0 + 1) {
      return 0;
    }
    CFStringRef v4 = @"Index";
  }
  else
  {
    CFStringRef v4 = @"Related Glossary Terms";
  }
  id v5 = (void *)THBundle();

  return [v5 localizedStringForKey:v4 value:&stru_46D7E8 table:0];
}

- (id)fontNameForLabelControl:(id)a3
{
  id v3 = +[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", a3, 15.0);

  return [v3 fontName];
}

- (double)fontSizeForLabelControl:(id)a3
{
  return 15.0;
}

- (id)textColorForLabelControl:(id)a3
{
  id v3 = [self layout:a3 layoutStyleProvider];

  return [v3 glossaryEntryLayoutForegroundColor];
}

- (int)horizontaAlignmentForLabelControl:(id)a3
{
  return 0;
}

- (int)verticalAlignmentForLabelControl:(id)a3
{
  return 0;
}

- (id)shadowForLabelControl:(id)a3
{
  return 0;
}

@end