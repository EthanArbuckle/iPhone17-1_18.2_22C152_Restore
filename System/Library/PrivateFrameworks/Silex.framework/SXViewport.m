@interface SXViewport
- (BOOL)groupChanges;
- (BOOL)isPopulated;
- (CGPoint)convertPoint:(CGPoint)a3 fromView:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toView:(id)a4;
- (CGPoint)convertPointToViewportCoordinateSpace:(CGPoint)a3 fromView:(id)a4;
- (CGRect)bounds;
- (CGRect)contentFrame;
- (CGRect)convertRect:(CGRect)a3 fromView:(id)a4;
- (CGRect)convertRect:(CGRect)a3 toView:(id)a4;
- (CGRect)convertRectToViewportCoordinateSpace:(CGRect)a3 fromView:(id)a4;
- (CGRect)dynamicBounds;
- (CGSize)documentSize;
- (NSHashTable)appearStateListeners;
- (NSHashTable)boundsListeners;
- (NSHashTable)contentFrameListeners;
- (NSHashTable)documentSizeListeners;
- (NSHashTable)dynamicBoundsListeners;
- (NSHashTable)interfaceOrientationListeners;
- (SXViewport)initWithView:(id)a3;
- (SXViewport)viewportBeforeUpdates;
- (UIScrollView)view;
- (id)debugDescriptionForViewport:(id)a3;
- (id)description;
- (id)stringForAppearState:(unint64_t)a3;
- (id)stringFroInterfaceOrientation:(int64_t)a3;
- (int64_t)interfaceOrientation;
- (unint64_t)appearState;
- (void)addViewportChangeListener:(id)a3 forOptions:(unint64_t)a4;
- (void)appearStateChangedFromState:(unint64_t)a3;
- (void)beginUpdates;
- (void)boundsDidChangeFromBounds:(CGRect)a3;
- (void)contentFrameDidChangeFromFrame:(CGRect)a3;
- (void)documentSizeDidChangeFromSize:(CGSize)a3;
- (void)dynamicBoundsDidChangeFromBounds:(CGRect)a3;
- (void)endUpdates;
- (void)interfaceOrientationChangedFromOrientation:(int64_t)a3;
- (void)removeViewportChangeListener:(id)a3 forOptions:(unint64_t)a4;
- (void)reset;
- (void)setAppearState:(unint64_t)a3;
- (void)setAppearStateListeners:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setBoundsListeners:(id)a3;
- (void)setContentFrame:(CGRect)a3;
- (void)setContentFrameListeners:(id)a3;
- (void)setDocumentSize:(CGSize)a3;
- (void)setDocumentSizeListeners:(id)a3;
- (void)setDynamicBounds:(CGRect)a3;
- (void)setDynamicBoundsListeners:(id)a3;
- (void)setGroupChanges:(BOOL)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setInterfaceOrientationListeners:(id)a3;
- (void)setViewportBeforeUpdates:(id)a3;
@end

@implementation SXViewport

- (SXViewport)initWithView:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SXViewport;
  v5 = [(SXViewport *)&v20 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_view, v4);
    uint64_t v7 = [MEMORY[0x263F088B0] hashTableWithOptions:5];
    dynamicBoundsListeners = v6->_dynamicBoundsListeners;
    v6->_dynamicBoundsListeners = (NSHashTable *)v7;

    uint64_t v9 = [MEMORY[0x263F088B0] hashTableWithOptions:5];
    boundsListeners = v6->_boundsListeners;
    v6->_boundsListeners = (NSHashTable *)v9;

    uint64_t v11 = [MEMORY[0x263F088B0] hashTableWithOptions:5];
    appearStateListeners = v6->_appearStateListeners;
    v6->_appearStateListeners = (NSHashTable *)v11;

    uint64_t v13 = [MEMORY[0x263F088B0] hashTableWithOptions:5];
    documentSizeListeners = v6->_documentSizeListeners;
    v6->_documentSizeListeners = (NSHashTable *)v13;

    uint64_t v15 = [MEMORY[0x263F088B0] hashTableWithOptions:5];
    contentFrameListeners = v6->_contentFrameListeners;
    v6->_contentFrameListeners = (NSHashTable *)v15;

    uint64_t v17 = [MEMORY[0x263F088B0] hashTableWithOptions:5];
    interfaceOrientationListeners = v6->_interfaceOrientationListeners;
    v6->_interfaceOrientationListeners = (NSHashTable *)v17;
  }
  return v6;
}

- (void)addViewportChangeListener:(id)a3 forOptions:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  if (!v6) {
    goto LABEL_10;
  }
  id v13 = v6;
  if ((v4 & 2) != 0)
  {
    uint64_t v9 = [(SXViewport *)self dynamicBoundsListeners];
    [v9 addObject:v13];

    if ((v4 & 4) == 0)
    {
LABEL_4:
      if ((v4 & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_15;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_4;
  }
  v10 = [(SXViewport *)self boundsListeners];
  [v10 addObject:v13];

  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v11 = [(SXViewport *)self appearStateListeners];
  [v11 addObject:v13];

  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_16:
  v12 = [(SXViewport *)self documentSizeListeners];
  [v12 addObject:v13];

  if ((v4 & 0x20) != 0)
  {
LABEL_7:
    uint64_t v7 = [(SXViewport *)self contentFrameListeners];
    [v7 addObject:v13];
  }
LABEL_8:
  id v6 = v13;
  if ((v4 & 0x40) != 0)
  {
    v8 = [(SXViewport *)self interfaceOrientationListeners];
    [v8 addObject:v13];

    id v6 = v13;
  }
LABEL_10:
}

- (void)removeViewportChangeListener:(id)a3 forOptions:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  if (!v6) {
    goto LABEL_10;
  }
  id v13 = v6;
  if ((v4 & 2) != 0)
  {
    uint64_t v9 = [(SXViewport *)self dynamicBoundsListeners];
    [v9 removeObject:v13];

    if ((v4 & 4) == 0)
    {
LABEL_4:
      if ((v4 & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_15;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_4;
  }
  v10 = [(SXViewport *)self boundsListeners];
  [v10 removeObject:v13];

  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v11 = [(SXViewport *)self appearStateListeners];
  [v11 removeObject:v13];

  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_16:
  v12 = [(SXViewport *)self documentSizeListeners];
  [v12 removeObject:v13];

  if ((v4 & 0x20) != 0)
  {
LABEL_7:
    uint64_t v7 = [(SXViewport *)self contentFrameListeners];
    [v7 removeObject:v13];
  }
LABEL_8:
  id v6 = v13;
  if ((v4 & 0x40) != 0)
  {
    v8 = [(SXViewport *)self interfaceOrientationListeners];
    [v8 removeObject:v13];

    id v6 = v13;
  }
LABEL_10:
}

- (void)beginUpdates
{
  v3 = [(SXViewport *)self viewportBeforeUpdates];

  if (!v3)
  {
    char v4 = [SXViewport alloc];
    v5 = [(SXViewport *)self view];
    id v6 = [(SXViewport *)v4 initWithView:v5];
    [(SXViewport *)self setViewportBeforeUpdates:v6];
  }
  uint64_t v7 = [(SXViewport *)self viewportBeforeUpdates];
  [(SXViewport *)self dynamicBounds];
  objc_msgSend(v7, "setDynamicBounds:");

  v8 = [(SXViewport *)self viewportBeforeUpdates];
  [(SXViewport *)self bounds];
  objc_msgSend(v8, "setBounds:");

  uint64_t v9 = [(SXViewport *)self viewportBeforeUpdates];
  [(SXViewport *)self documentSize];
  objc_msgSend(v9, "setDocumentSize:");

  v10 = [(SXViewport *)self viewportBeforeUpdates];
  objc_msgSend(v10, "setAppearState:", -[SXViewport appearState](self, "appearState"));

  uint64_t v11 = [(SXViewport *)self viewportBeforeUpdates];
  objc_msgSend(v11, "setInterfaceOrientation:", -[SXViewport interfaceOrientation](self, "interfaceOrientation"));

  [(SXViewport *)self setGroupChanges:1];
}

- (void)endUpdates
{
  v3 = [(SXViewport *)self viewportBeforeUpdates];
  [v3 dynamicBounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(SXViewport *)self dynamicBounds];
  v54.origin.x = v12;
  v54.origin.y = v13;
  v54.size.width = v14;
  v54.size.height = v15;
  v52.origin.x = v5;
  v52.origin.y = v7;
  v52.size.width = v9;
  v52.size.height = v11;
  BOOL v16 = CGRectEqualToRect(v52, v54);

  if (!v16)
  {
    uint64_t v17 = [(SXViewport *)self viewportBeforeUpdates];
    [v17 dynamicBounds];
    -[SXViewport dynamicBoundsDidChangeFromBounds:](self, "dynamicBoundsDidChangeFromBounds:");
  }
  v18 = [(SXViewport *)self viewportBeforeUpdates];
  [v18 bounds];
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  [(SXViewport *)self bounds];
  v55.origin.x = v27;
  v55.origin.y = v28;
  v55.size.width = v29;
  v55.size.height = v30;
  v53.origin.x = v20;
  v53.origin.y = v22;
  v53.size.width = v24;
  v53.size.height = v26;
  BOOL v31 = CGRectEqualToRect(v53, v55);

  if (!v31)
  {
    v32 = [(SXViewport *)self viewportBeforeUpdates];
    [v32 bounds];
    -[SXViewport boundsDidChangeFromBounds:](self, "boundsDidChangeFromBounds:");
  }
  v33 = [(SXViewport *)self viewportBeforeUpdates];
  uint64_t v34 = [v33 appearState];
  unint64_t v35 = [(SXViewport *)self appearState];

  if (v34 != v35)
  {
    v36 = [(SXViewport *)self viewportBeforeUpdates];
    -[SXViewport appearStateChangedFromState:](self, "appearStateChangedFromState:", [v36 appearState]);
  }
  v37 = [(SXViewport *)self viewportBeforeUpdates];
  [v37 documentSize];
  double v39 = v38;
  double v41 = v40;
  [(SXViewport *)self documentSize];
  double v43 = v42;
  double v45 = v44;

  if (v39 != v43 || v41 != v45)
  {
    v46 = [(SXViewport *)self viewportBeforeUpdates];
    [v46 documentSize];
    -[SXViewport documentSizeDidChangeFromSize:](self, "documentSizeDidChangeFromSize:");
  }
  v47 = [(SXViewport *)self viewportBeforeUpdates];
  uint64_t v48 = [v47 interfaceOrientation];
  int64_t v49 = [(SXViewport *)self interfaceOrientation];

  if (v48 != v49)
  {
    v50 = [(SXViewport *)self viewportBeforeUpdates];
    -[SXViewport interfaceOrientationChangedFromOrientation:](self, "interfaceOrientationChangedFromOrientation:", [v50 interfaceOrientation]);
  }
  [(SXViewport *)self setGroupChanges:0];
}

- (void)dynamicBoundsDidChangeFromBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v8 = [(SXViewport *)self dynamicBoundsListeners];
  CGFloat v9 = (void *)[v8 copy];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "viewport:dynamicBoundsDidChangeFromBounds:", self, x, y, width, height);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)boundsDidChangeFromBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v8 = [(SXViewport *)self boundsListeners];
  CGFloat v9 = (void *)[v8 copy];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "viewport:boundsDidChangeFromBounds:", self, x, y, width, height);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)appearStateChangedFromState:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  CGFloat v5 = [(SXViewport *)self appearStateListeners];
  double v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) viewport:self appearStateChangedFromState:a3];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)documentSizeDidChangeFromSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v6 = [(SXViewport *)self documentSizeListeners];
  uint64_t v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "viewport:documentSizeDidChangeFromSize:", self, width, height);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)contentFrameDidChangeFromFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [(SXViewport *)self contentFrameListeners];
  uint64_t v9 = (void *)[v8 copy];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "viewport:contentFrameDidChangeFromFrame:", self, x, y, width, height);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)interfaceOrientationChangedFromOrientation:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  CGFloat v5 = [(SXViewport *)self interfaceOrientationListeners];
  double v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) viewport:self interfaceOrientationChangedFromOrientation:a3];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)setDynamicBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(SXViewport *)self dynamicBounds];
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    double v8 = self->_dynamicBounds.origin.x;
    double v9 = self->_dynamicBounds.origin.y;
    double v10 = self->_dynamicBounds.size.width;
    double v11 = self->_dynamicBounds.size.height;
    self->_dynamicBounds.origin.CGFloat x = x;
    self->_dynamicBounds.origin.CGFloat y = y;
    self->_dynamicBounds.size.CGFloat width = width;
    self->_dynamicBounds.size.CGFloat height = height;
    if (![(SXViewport *)self groupChanges])
    {
      -[SXViewport dynamicBoundsDidChangeFromBounds:](self, "dynamicBoundsDidChangeFromBounds:", v8, v9, v10, v11);
    }
  }
}

- (void)setBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(SXViewport *)self bounds];
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    double v8 = self->_bounds.origin.x;
    double v9 = self->_bounds.origin.y;
    double v10 = self->_bounds.size.width;
    double v11 = self->_bounds.size.height;
    self->_bounds.origin.CGFloat x = x;
    self->_bounds.origin.CGFloat y = y;
    self->_bounds.size.CGFloat width = width;
    self->_bounds.size.CGFloat height = height;
    if (![(SXViewport *)self groupChanges])
    {
      -[SXViewport boundsDidChangeFromBounds:](self, "boundsDidChangeFromBounds:", v8, v9, v10, v11);
    }
  }
}

- (void)setAppearState:(unint64_t)a3
{
  if ([(SXViewport *)self appearState] != a3)
  {
    unint64_t appearState = self->_appearState;
    self->_unint64_t appearState = a3;
    if (![(SXViewport *)self groupChanges])
    {
      [(SXViewport *)self appearStateChangedFromState:appearState];
    }
  }
}

- (void)setDocumentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SXViewport *)self documentSize];
  if (v7 != width || v6 != height)
  {
    double v9 = self->_documentSize.width;
    double v10 = self->_documentSize.height;
    self->_documentSize.double width = width;
    self->_documentSize.double height = height;
    if (![(SXViewport *)self groupChanges])
    {
      -[SXViewport documentSizeDidChangeFromSize:](self, "documentSizeDidChangeFromSize:", v9, v10);
    }
  }
}

- (void)setContentFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(SXViewport *)self contentFrame];
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    double v8 = self->_contentFrame.origin.x;
    double v9 = self->_contentFrame.origin.y;
    double v10 = self->_contentFrame.size.width;
    double v11 = self->_contentFrame.size.height;
    self->_contentFrame.origin.CGFloat x = x;
    self->_contentFrame.origin.CGFloat y = y;
    self->_contentFrame.size.CGFloat width = width;
    self->_contentFrame.size.CGFloat height = height;
    if (![(SXViewport *)self groupChanges])
    {
      -[SXViewport contentFrameDidChangeFromFrame:](self, "contentFrameDidChangeFromFrame:", v8, v9, v10, v11);
    }
  }
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  int64_t interfaceOrientation = self->_interfaceOrientation;
  if (interfaceOrientation != a3)
  {
    self->_int64_t interfaceOrientation = a3;
    if (![(SXViewport *)self groupChanges])
    {
      [(SXViewport *)self interfaceOrientationChangedFromOrientation:interfaceOrientation];
    }
  }
}

- (BOOL)isPopulated
{
  [(SXViewport *)self dynamicBounds];
  if (CGRectIsEmpty(v6)) {
    return 0;
  }
  [(SXViewport *)self bounds];
  if (CGRectIsEmpty(v7)) {
    return 0;
  }
  [(SXViewport *)self contentFrame];
  if (CGRectIsEmpty(v8)) {
    return 0;
  }
  [(SXViewport *)self documentSize];
  if (v3 <= 0.0) {
    return 0;
  }
  [(SXViewport *)self documentSize];
  return v4 > 0.0;
}

- (void)reset
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  -[SXViewport setDynamicBounds:](self, "setDynamicBounds:", *MEMORY[0x263F001A8], v4, v5, v6);
  -[SXViewport setBounds:](self, "setBounds:", v3, v4, v5, v6);
  double v7 = *MEMORY[0x263F001B0];
  double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  -[SXViewport setDocumentSize:](self, "setDocumentSize:", v7, v8);
}

- (CGPoint)convertPoint:(CGPoint)a3 toView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(SXViewport *)self view];
  objc_msgSend(v8, "convertPoint:toView:", v7, x, y);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(SXViewport *)self view];
  objc_msgSend(v8, "convertPoint:fromView:", v7, x, y);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  double v10 = [(SXViewport *)self view];
  objc_msgSend(v10, "convertRect:toView:", v9, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  double v10 = [(SXViewport *)self view];
  objc_msgSend(v10, "convertRect:fromView:", v9, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (CGRect)convertRectToViewportCoordinateSpace:(CGRect)a3 fromView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  double v10 = [(SXViewport *)self view];
  double v11 = [v10 superview];
  objc_msgSend(v11, "convertRect:fromView:", v9, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (CGPoint)convertPointToViewportCoordinateSpace:(CGPoint)a3 fromView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(SXViewport *)self view];
  id v9 = [v8 superview];
  objc_msgSend(v9, "convertPoint:fromView:", v7, x, y);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (id)stringFroInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return off_264651E68[a3];
  }
}

- (id)stringForAppearState:(unint64_t)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_264651E90[a3];
  }
}

- (id)debugDescriptionForViewport:(id)a3
{
  id v4 = a3;
  [v4 dynamicBounds];
  double v5 = NSStringFromCGRect(v16);
  [v4 bounds];
  double v6 = NSStringFromCGRect(v17);
  id v7 = -[SXViewport stringForAppearState:](self, "stringForAppearState:", [v4 appearState]);
  [v4 documentSize];
  double v8 = NSStringFromCGSize(v15);
  [v4 contentFrame];
  id v9 = NSStringFromCGRect(v18);
  uint64_t v10 = [v4 interfaceOrientation];

  double v11 = [(SXViewport *)self stringFroInterfaceOrientation:v10];
  objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; dynamicBounds: %@; bounds: %@; appearState: %@; documentSize: %@; contentFrame: %@; interfaceOrientation: %@",
    objc_opt_class(),
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
  double v12 = v11);

  return v12;
}

- (id)description
{
  return [(SXViewport *)self debugDescriptionForViewport:self];
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)dynamicBounds
{
  double x = self->_dynamicBounds.origin.x;
  double y = self->_dynamicBounds.origin.y;
  double width = self->_dynamicBounds.size.width;
  double height = self->_dynamicBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)documentSize
{
  double width = self->_documentSize.width;
  double height = self->_documentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)contentFrame
{
  double x = self->_contentFrame.origin.x;
  double y = self->_contentFrame.origin.y;
  double width = self->_contentFrame.size.width;
  double height = self->_contentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)appearState
{
  return self->_appearState;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (NSHashTable)dynamicBoundsListeners
{
  return self->_dynamicBoundsListeners;
}

- (void)setDynamicBoundsListeners:(id)a3
{
}

- (NSHashTable)boundsListeners
{
  return self->_boundsListeners;
}

- (void)setBoundsListeners:(id)a3
{
}

- (NSHashTable)appearStateListeners
{
  return self->_appearStateListeners;
}

- (void)setAppearStateListeners:(id)a3
{
}

- (NSHashTable)documentSizeListeners
{
  return self->_documentSizeListeners;
}

- (void)setDocumentSizeListeners:(id)a3
{
}

- (NSHashTable)contentFrameListeners
{
  return self->_contentFrameListeners;
}

- (void)setContentFrameListeners:(id)a3
{
}

- (NSHashTable)interfaceOrientationListeners
{
  return self->_interfaceOrientationListeners;
}

- (void)setInterfaceOrientationListeners:(id)a3
{
}

- (SXViewport)viewportBeforeUpdates
{
  return self->_viewportBeforeUpdates;
}

- (void)setViewportBeforeUpdates:(id)a3
{
}

- (BOOL)groupChanges
{
  return self->_groupChanges;
}

- (void)setGroupChanges:(BOOL)a3
{
  self->_groupChanges = a3;
}

- (UIScrollView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIScrollView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_viewportBeforeUpdates, 0);
  objc_storeStrong((id *)&self->_interfaceOrientationListeners, 0);
  objc_storeStrong((id *)&self->_contentFrameListeners, 0);
  objc_storeStrong((id *)&self->_documentSizeListeners, 0);
  objc_storeStrong((id *)&self->_appearStateListeners, 0);
  objc_storeStrong((id *)&self->_boundsListeners, 0);
  objc_storeStrong((id *)&self->_dynamicBoundsListeners, 0);
}

@end