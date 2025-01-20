@interface PFXSvg
- (BOOL)mapStartElementWithState:(id)a3;
- (NSURL)URL;
- (void)_addAlternateDescription:(id)a3 toChildInfo:(id)a4;
- (void)_addURLToChildInfo:(id)a3;
- (void)dealloc;
- (void)mapEndElementWithState:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation PFXSvg

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXSvg;
  [(PFXDrawable *)&v3 dealloc];
}

- (void)_addAlternateDescription:(id)a3 toChildInfo:(id)a4
{
  objc_opt_class();
  uint64_t v5 = TSUDynamicCast();
  if (v5)
  {
    v6 = (void *)v5;
    if ([a3 length])
    {
      id v7 = [v6 accessibilityDescriptions];
      if (!v7)
      {
        id v7 = (id)objc_opt_new();
        [v6 setAccessibilityDescriptions:v7];
      }
      [v7 setObject:a3 forKey:@"siblingTitle"];
    }
  }
}

- (void)_addURLToChildInfo:(id)a3
{
  if ([(PFXSvg *)self URL])
  {
    objc_opt_class();
    v4 = (void *)TSUDynamicCast();
    uint64_t v5 = [(PFXSvg *)self URL];
    [v4 setHyperlinkURL:v5];
  }
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "valueForAttribute:", "href");
  if (v5)
  {
    id v6 = v5;
    if ([v5 length]) {
      [(PFXSvg *)self setURL:+[NSURL URLWithString:v6]];
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)PFXSvg;
  return [(PFXDrawable *)&v8 mapStartElementWithState:a3];
}

- (void)mapEndElementWithState:(id)a3
{
  id v5 = [a3 currentHtmlStackEntry];
  id v6 = [v5 currentEntryMediaState];
  id v7 = (char *)[v6 childResultCount];
  if (v7 == (unsigned char *)&dword_0 + 1)
  {
    id v8 = [v6 childResultAtIndex:0];
    if ([v8 conformsToProtocol:&OBJC_PROTOCOL___TSDInfo])
    {
      [v6 setResult:v8];
      -[PFXSvg _addAlternateDescription:toChildInfo:](self, "_addAlternateDescription:toChildInfo:", [v6 altDesc], v8);
      [(PFXSvg *)self _addURLToChildInfo:v8];
      if ([a3 isInsideWidget]) {
        [v5 addChildAttributesToParentForResult:v8];
      }
    }
  }
  else
  {
    v9 = v7;
    id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v7];
    if (v9)
    {
      for (i = 0; i != v9; ++i)
      {
        id v12 = [v6 childResultAtIndex:i];
        if ([v12 conformsToProtocol:&OBJC_PROTOCOL___TSDInfo])
        {
          [v10 addObject:v12];
          -[PFXSvg _addAlternateDescription:toChildInfo:](self, "_addAlternateDescription:toChildInfo:", [v6 altDesc], v12);
          [(PFXSvg *)self _addURLToChildInfo:v12];
        }
      }
    }
    [v6 setResult:v10];
  }
  v13.receiver = self;
  v13.super_class = (Class)PFXSvg;
  [(PFXDrawable *)&v13 mapEndElementWithState:a3];
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

@end