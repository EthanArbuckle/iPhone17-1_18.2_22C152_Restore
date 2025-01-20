@interface WDAContent
+ (Class)classForType:(unsigned __int16)a3;
- (BOOL)floating;
- (BOOL)hasBounds;
- (BOOL)hasText;
- (BOOL)isLine;
- (BOOL)isLinked;
- (BOOL)isShape;
- (BOOL)isTopLevelObject;
- (CGRect)bounds;
- (NSString)description;
- (OADDrawable)drawable;
- (WDAAnchor)anchor;
- (WDAContent)init;
- (id)createAnchor;
- (id)createTextBoxWithDocument:(id)a3 textType:(int)a4;
- (id)textBox;
- (int)textType;
- (unint64_t)linkedTextBoxSupport;
- (void)clearAnchor;
- (void)setBounds:(CGRect)a3;
- (void)setDrawable:(id)a3;
- (void)setTextBox:(id)a3 document:(id)a4;
- (void)setTextType:(int)a3;
@end

@implementation WDAContent

- (WDAContent)init
{
  v3.receiver = self;
  v3.super_class = (Class)WDAContent;
  result = [(WDAContent *)&v3 init];
  if (result) {
    result->mTextType = -1;
  }
  return result;
}

- (void)setDrawable:(id)a3
{
}

- (void)setTextType:(int)a3
{
  self->mTextType = a3;
}

- (BOOL)hasBounds
{
  return self->mAnchor != 0;
}

- (id)createAnchor
{
  objc_super v3 = objc_alloc_init(WDAAnchor);
  mAnchor = self->mAnchor;
  self->mAnchor = v3;

  v5 = self->mAnchor;
  return v5;
}

- (WDAAnchor)anchor
{
  return self->mAnchor;
}

- (void)setTextBox:(id)a3 document:(id)a4
{
  v6 = (WDATextBox *)a3;
  id v8 = a4;
  [v8 addObjPointer:v6];
  if (self->mTextBox) {
    objc_msgSend(v8, "removeObjPointer:");
  }
  else {
    [v8 addObjPointer:self];
  }
  mTextBox = self->mTextBox;
  self->mTextBox = v6;
}

- (OADDrawable)drawable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDrawable);
  return (OADDrawable *)WeakRetained;
}

- (int)textType
{
  return self->mTextType;
}

- (CGRect)bounds
{
  [(WDAAnchor *)self->mAnchor bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isShape
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDrawable);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)textBox
{
  return self->mTextBox;
}

- (BOOL)floating
{
  double v2 = [(WDAContent *)self anchor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)clearAnchor
{
  mAnchor = self->mAnchor;
  self->mAnchor = 0;
}

- (id)createTextBoxWithDocument:(id)a3 textType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = objc_alloc_init(WDATextBox);
  mTextBox = self->mTextBox;
  self->mTextBox = v7;

  [(WDATextBox *)self->mTextBox setDocument:v6];
  [(WDATextBox *)self->mTextBox setParent:self];
  v9 = [[WDText alloc] initWithDocument:v6 textType:v4];
  [(WDATextBox *)self->mTextBox setText:v9];
  [v6 addObjPointer:self->mTextBox];
  [v6 addObjPointer:self];
  v10 = self->mTextBox;

  return v10;
}

- (void)setBounds:(CGRect)a3
{
}

- (BOOL)isLine
{
  BOOL v3 = [(WDAContent *)self isShape];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDrawable);
    int v5 = [WeakRetained type];

    LOBYTE(v3) = v5 == 20;
  }
  return v3;
}

- (BOOL)isTopLevelObject
{
  double v2 = [(WDAContent *)self drawable];
  BOOL v3 = [v2 parent];
  BOOL v4 = v3 == 0;

  return v4;
}

- (unint64_t)linkedTextBoxSupport
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDrawable);
  BOOL v3 = [WeakRetained parent];

  if (v3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)isLinked
{
  BOOL v3 = [(WDATextBox *)self->mTextBox flowId];
  if (v3)
  {
    BOOL v4 = [(WDATextBox *)self->mTextBox flowSequence];
    BOOL v5 = (int)[v4 intValue] > 0 || -[WDATextBox nextTextBoxId](self->mTextBox, "nextTextBoxId") != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)hasText
{
  double v2 = [(WDATextBox *)self->mTextBox text];
  BOOL v3 = v2;
  if (v2) {
    int v4 = [v2 isEmpty] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDAContent;
  double v2 = [(WDAContent *)&v4 description];
  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mDrawable);
  objc_storeStrong((id *)&self->mTextBox, 0);
  objc_storeStrong((id *)&self->mAnchor, 0);
}

+ (Class)classForType:(unsigned __int16)a3
{
  return (Class)objc_opt_class();
}

@end