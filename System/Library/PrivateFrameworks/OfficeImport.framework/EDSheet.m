@interface EDSheet
+ (EDSheet)sheetWithWorkbook:(id)a3;
- (BOOL)isDialogSheet;
- (BOOL)isDisplayFormulas;
- (BOOL)isDisplayGridlines;
- (BOOL)isHidden;
- (EDSheet)initWithWorkbook:(id)a3;
- (EDWorkbook)workbook;
- (id)defaultGridlineColor;
- (id)defaultGridlineColorReference;
- (id)description;
- (id)drawableAtIndex:(unint64_t)a3;
- (id)drawableEnumerator;
- (id)drawables;
- (id)edCommentForShape:(id)a3;
- (id)edTextBoxForShape:(id)a3;
- (id)escherDrawing;
- (id)headerFooter;
- (id)name;
- (id)pageSetup;
- (id)processors;
- (id)warnings;
- (unint64_t)commentCount;
- (unint64_t)drawableCount;
- (void)addDrawable:(id)a3;
- (void)applyProcessors;
- (void)dealloc;
- (void)doneWithNonRowContent;
- (void)removeDrawableAtIndex:(unint64_t)a3;
- (void)setDefaultGridlineColor:(id)a3;
- (void)setDefaultGridlineColorReference:(id)a3;
- (void)setDisplayFormulas:(BOOL)a3;
- (void)setDisplayGridlines:(BOOL)a3;
- (void)setEDComment:(id)a3 forShape:(id)a4;
- (void)setEDTextBox:(id)a3 forShape:(id)a4;
- (void)setEscherDrawing:(id)a3;
- (void)setHeaderFooter:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIsDialogSheet:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPageSetup:(id)a3;
- (void)setup;
- (void)teardown;
@end

@implementation EDSheet

- (EDSheet)initWithWorkbook:(id)a3
{
  id v4 = a3;
  v5 = [(EDSheet *)self init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mWorkbook, v4);
    [(EDSheet *)v6 setup];
  }

  return v6;
}

- (void)setup
{
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  mDrawables = self->mDrawables;
  self->mDrawables = v3;

  v5 = [EDProcessors alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mWorkbook);
  v7 = [(EDProcessors *)v5 initWithWorkbook:WeakRetained];
  mProcessors = self->mProcessors;
  self->mProcessors = v7;

  v9 = objc_alloc_init(EDWarnings);
  mWarnings = self->mWarnings;
  self->mWarnings = v9;

  v11 = [[OITSUPointerKeyDictionary alloc] initWithCapacity:128];
  mTextBoxMap = self->mTextBoxMap;
  self->mTextBoxMap = v11;

  v13 = [[OITSUPointerKeyDictionary alloc] initWithCapacity:128];
  mCommentMap = self->mCommentMap;
  self->mCommentMap = v13;

  id v15 = objc_loadWeakRetained((id *)&self->mWorkbook);
  v16 = [v15 resources];
  v17 = +[EDColorReference colorReferenceWithSystemColorID:13 resources:v16];
  [(EDSheet *)self setDefaultGridlineColorReference:v17];

  self->mHidden = 0;
  self->mDisplayFormulas = 0;
  self->mDisplayGridlines = 1;
}

- (void)setDefaultGridlineColorReference:(id)a3
{
  v5 = (EDColorReference *)a3;
  if (self->mDefaultGridlineColorReference != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mDefaultGridlineColorReference, a3);
    v5 = v6;
  }
}

- (void)setName:(id)a3
{
  v5 = (EDString *)a3;
  if (self->mName != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mName, a3);
    v5 = v6;
  }
}

- (void)setHidden:(BOOL)a3
{
  self->mHidden = a3;
}

- (BOOL)isHidden
{
  return self->mHidden;
}

- (id)processors
{
  return self->mProcessors;
}

- (void)setIsDialogSheet:(BOOL)a3
{
  self->mIsDialogSheet = a3;
}

- (void)setHeaderFooter:(id)a3
{
  v5 = (EDHeaderFooter *)a3;
  if (self->mHeaderFooter != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mHeaderFooter, a3);
    v5 = v6;
  }
}

- (void)setPageSetup:(id)a3
{
  v5 = (EDPageSetup *)a3;
  if (self->mPageSetup != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mPageSetup, a3);
    v5 = v6;
  }
}

- (void)setDisplayFormulas:(BOOL)a3
{
  self->mDisplayFormulas = a3;
}

- (void)setDisplayGridlines:(BOOL)a3
{
  self->mDisplayGridlines = a3;
}

- (void)applyProcessors
{
  [(EDProcessors *)self->mProcessors applyProcessorsWithSheet:self];
  mProcessors = self->mProcessors;
  [(EDProcessors *)mProcessors removeAllObjects];
}

- (id)name
{
  return self->mName;
}

- (BOOL)isDisplayFormulas
{
  return self->mDisplayFormulas;
}

- (unint64_t)drawableCount
{
  return [(NSMutableArray *)self->mDrawables count];
}

- (BOOL)isDisplayGridlines
{
  return self->mDisplayGridlines;
}

- (void)teardown
{
  objc_storeWeak((id *)&self->mWorkbook, 0);
  uint64_t v3 = [(NSMutableArray *)self->mDrawables count];
  if (v3)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      v6 = [(NSMutableArray *)self->mDrawables objectAtIndex:i];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v6 setSheet:0];
      }
    }
  }
  mDrawables = self->mDrawables;
  self->mDrawables = 0;

  [(EDProcessors *)self->mProcessors removeAllObjects];
  mProcessors = self->mProcessors;
  self->mProcessors = 0;

  mWarnings = self->mWarnings;
  self->mWarnings = 0;

  mHeaderFooter = self->mHeaderFooter;
  self->mHeaderFooter = 0;

  mPageSetup = self->mPageSetup;
  self->mPageSetup = 0;

  mDefaultGridlineColorReference = self->mDefaultGridlineColorReference;
  self->mDefaultGridlineColorReference = 0;

  mEscherDrawing = self->mEscherDrawing;
  self->mEscherDrawing = 0;

  mTextBoxMap = self->mTextBoxMap;
  self->mTextBoxMap = 0;

  mCommentMap = self->mCommentMap;
  self->mCommentMap = 0;
}

- (void)dealloc
{
  [(EDSheet *)self teardown];
  v3.receiver = self;
  v3.super_class = (Class)EDSheet;
  [(EDSheet *)&v3 dealloc];
}

- (void)addDrawable:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v4 = [(EDSheet *)self workbook];
    v5 = [v4 defaultTextStyle];
    [v6 setParentTextListStyle:v5];

    [(NSMutableArray *)self->mDrawables addObject:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 setSheet:self];
    }
  }
}

- (EDWorkbook)workbook
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mWorkbook);
  return (EDWorkbook *)WeakRetained;
}

- (id)drawableAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mDrawables objectAtIndex:a3];
}

- (id)pageSetup
{
  return self->mPageSetup;
}

- (id)warnings
{
  return self->mWarnings;
}

+ (EDSheet)sheetWithWorkbook:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithWorkbook:v3];

  return (EDSheet *)v4;
}

- (void)doneWithNonRowContent
{
  [(NSMutableArray *)self->mDrawables removeAllObjects];
  mEscherDrawing = self->mEscherDrawing;
  self->mEscherDrawing = 0;

  mTextBoxMap = self->mTextBoxMap;
  self->mTextBoxMap = 0;

  mCommentMap = self->mCommentMap;
  self->mCommentMap = 0;
}

- (id)defaultGridlineColor
{
  return [(EDColorReference *)self->mDefaultGridlineColorReference color];
}

- (void)setDefaultGridlineColor:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [EDColorReference alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mWorkbook);
  id v6 = [WeakRetained resources];
  v7 = [(EDColorReference *)v4 initWithColor:v9 resources:v6];
  mDefaultGridlineColorReference = self->mDefaultGridlineColorReference;
  self->mDefaultGridlineColorReference = v7;
}

- (id)headerFooter
{
  return self->mHeaderFooter;
}

- (void)removeDrawableAtIndex:(unint64_t)a3
{
}

- (id)drawables
{
  return self->mDrawables;
}

- (id)edTextBoxForShape:(id)a3
{
  id v3 = [(OITSUNoCopyDictionary *)self->mTextBoxMap objectForKey:a3];
  return v3;
}

- (void)setEDTextBox:(id)a3 forShape:(id)a4
{
}

- (unint64_t)commentCount
{
  return [(OITSUNoCopyDictionary *)self->mCommentMap count];
}

- (id)edCommentForShape:(id)a3
{
  id v3 = [(OITSUNoCopyDictionary *)self->mCommentMap objectForKey:a3];
  return v3;
}

- (void)setEDComment:(id)a3 forShape:(id)a4
{
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDSheet;
  v2 = [(EDSheet *)&v4 description];
  return v2;
}

- (BOOL)isDialogSheet
{
  return self->mIsDialogSheet;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mWorkbook);
  objc_storeStrong((id *)&self->mEscherDrawing, 0);
  objc_storeStrong((id *)&self->mWarnings, 0);
  objc_storeStrong((id *)&self->mProcessors, 0);
  objc_storeStrong((id *)&self->mCommentMap, 0);
  objc_storeStrong((id *)&self->mTextBoxMap, 0);
  objc_storeStrong((id *)&self->mDrawables, 0);
  objc_storeStrong((id *)&self->mPageSetup, 0);
  objc_storeStrong((id *)&self->mHeaderFooter, 0);
  objc_storeStrong((id *)&self->mDefaultGridlineColorReference, 0);
  objc_storeStrong((id *)&self->mName, 0);
}

- (id)escherDrawing
{
  return self->mEscherDrawing;
}

- (void)setEscherDrawing:(id)a3
{
}

- (id)defaultGridlineColorReference
{
  return self->mDefaultGridlineColorReference;
}

- (id)drawableEnumerator
{
  return (id)[(NSMutableArray *)self->mDrawables objectEnumerator];
}

@end