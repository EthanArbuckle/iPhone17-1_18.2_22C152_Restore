@interface UIKBGeometry
+ (id)codeStringForValue:(id)a3;
+ (id)geometry;
+ (id)geometryWithOriginValue:(id)a3 sizeValue:(id)a4;
+ (id)geometryWithRect:(CGRect)a3;
+ (void)performOperations:(id)a3 withScale:(double)a4;
- ($000CCD7ED2ADA2E18343834BA3C2DAF0)h;
- ($000CCD7ED2ADA2E18343834BA3C2DAF0)paddingBottom;
- ($000CCD7ED2ADA2E18343834BA3C2DAF0)paddingLeft;
- ($000CCD7ED2ADA2E18343834BA3C2DAF0)paddingRight;
- ($000CCD7ED2ADA2E18343834BA3C2DAF0)paddingTop;
- ($000CCD7ED2ADA2E18343834BA3C2DAF0)w;
- ($000CCD7ED2ADA2E18343834BA3C2DAF0)x;
- ($000CCD7ED2ADA2E18343834BA3C2DAF0)y;
- (BOOL)explicitlySpecified;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemplate;
- (BOOL)usesAutomaticMetrics;
- (BOOL)usesPercentages;
- (CGRect)frame;
- (CGRect)frameWithContainingFrame:(CGRect)a3;
- (CGRect)paddedFrameWithContainingFrame:(CGRect)a3;
- (CGRect)paddedFrameWithResolvedFrame:(CGRect)a3;
- (NSString)name;
- (UIKBGeometry)init;
- (UIKBGeometry)initWithCoder:(id)a3;
- (UIKBGeometry)initWithName:(id)a3 rect:(id *)a4 padding:(id *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initTemplateWithName:(id)a3 rect:(id *)a4 padding:(id *)a5;
- (id)overrideGeometry:(id)a3;
- (id)shortDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setExplicitlySpecified:(BOOL)a3;
- (void)setH:(id)a3;
- (void)setIsTemplate:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPaddingBottom:(id)a3;
- (void)setPaddingLeft:(id)a3;
- (void)setPaddingRight:(id)a3;
- (void)setPaddingTop:(id)a3;
- (void)setW:(id)a3;
- (void)setX:(id)a3;
- (void)setY:(id)a3;
@end

@implementation UIKBGeometry

+ (id)geometry
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

+ (id)geometryWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = objc_alloc_init(UIKBGeometry);
  -[UIKBGeometry setX:](v7, "setX:", *(void *)&x, 3);
  -[UIKBGeometry setY:](v7, "setY:", *(void *)&y, 3);
  -[UIKBGeometry setW:](v7, "setW:", *(void *)&width, 3);
  -[UIKBGeometry setH:](v7, "setH:", *(void *)&height, 3);
  return v7;
}

+ (id)geometryWithOriginValue:(id)a3 sizeValue:(id)a4
{
  uint64_t v4 = *(void *)&a4.var1;
  double var0 = a4.var0;
  uint64_t v6 = *(void *)&a3.var1;
  double v7 = a3.var0;
  v8 = objc_alloc_init(UIKBGeometry);
  -[UIKBGeometry setX:](v8, "setX:", *(void *)&v7, v6);
  -[UIKBGeometry setY:](v8, "setY:", *(void *)&v7, v6);
  -[UIKBGeometry setW:](v8, "setW:", *(void *)&var0, v4);
  -[UIKBGeometry setH:](v8, "setH:", *(void *)&var0, v4);
  return v8;
}

- (UIKBGeometry)initWithName:(id)a3 rect:(id *)a4 padding:(id *)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIKBGeometry;
  v10 = [(UIKBGeometry *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->m_name, a3);
    v11->m_CGFloat x = ($54480812DE8C7014D3D64BD9CBBA15F5)a4->var0[0];
    v11->m_CGFloat y = ($54480812DE8C7014D3D64BD9CBBA15F5)a4->var0[1];
    v11->m_w = ($54480812DE8C7014D3D64BD9CBBA15F5)a4->var0[2];
    v11->m_h = ($54480812DE8C7014D3D64BD9CBBA15F5)a4->var0[3];
    v11->m_paddingTop = ($54480812DE8C7014D3D64BD9CBBA15F5)a5->var0[0];
    v11->m_paddingLeft = ($54480812DE8C7014D3D64BD9CBBA15F5)a5->var0[1];
    v11->m_paddingBottom = ($54480812DE8C7014D3D64BD9CBBA15F5)a5->var0[2];
    v11->m_paddingRight = ($54480812DE8C7014D3D64BD9CBBA15F5)a5->var0[3];
    v11->m_explicitlySpecified = 1;
    v12 = v11;
  }

  return v11;
}

- (id)initTemplateWithName:(id)a3 rect:(id *)a4 padding:(id *)a5
{
  $000CCD7ED2ADA2E18343834BA3C2DAF0 v5 = a4->var0[1];
  v11[0] = a4->var0[0];
  v11[1] = v5;
  $000CCD7ED2ADA2E18343834BA3C2DAF0 v6 = a4->var0[3];
  v11[2] = a4->var0[2];
  v11[3] = v6;
  $000CCD7ED2ADA2E18343834BA3C2DAF0 v7 = a5->var0[1];
  v10[0] = a5->var0[0];
  v10[1] = v7;
  $000CCD7ED2ADA2E18343834BA3C2DAF0 v8 = a5->var0[3];
  v10[2] = a5->var0[2];
  v10[3] = v8;
  id result = [(UIKBGeometry *)self initWithName:a3 rect:v11 padding:v10];
  *((unsigned char *)result + 145) = 1;
  return result;
}

- (UIKBGeometry)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIKBGeometry;
  id v2 = [(UIKBGeometry *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->m_explicitlySpecified = 0;
    uint64_t v4 = v2;
  }

  return v3;
}

- (UIKBGeometry)initWithCoder:(id)a3
{
  id v4 = a3;
  $000CCD7ED2ADA2E18343834BA3C2DAF0 v5 = [v4 decodeObjectForKey:@"name"];
  m_name = self->m_name;
  self->m_name = v5;

  [v4 decodeFloatForKey:@"x-amount"];
  double v8 = v7;
  unsigned int v9 = [v4 decodeIntForKey:@"x-unit"];
  self->m_x.amount = v8;
  *(void *)&self->m_x.unit = v9;
  [v4 decodeFloatForKey:@"y-amount"];
  double v11 = v10;
  unsigned int v12 = [v4 decodeIntForKey:@"y-unit"];
  self->m_y.amount = v11;
  *(void *)&self->m_y.unit = v12;
  [v4 decodeFloatForKey:@"w-amount"];
  double v14 = v13;
  unsigned int v15 = [v4 decodeIntForKey:@"w-unit"];
  self->m_w.amount = v14;
  *(void *)&self->m_w.unit = v15;
  [v4 decodeFloatForKey:@"h-amount"];
  double v17 = v16;
  unsigned int v18 = [v4 decodeIntForKey:@"h-unit"];
  self->m_h.amount = v17;
  *(void *)&self->m_h.unit = v18;
  [v4 decodeFloatForKey:@"paddingTop-amount"];
  double v20 = v19;
  unsigned int v21 = [v4 decodeIntForKey:@"paddingTop-unit"];
  self->m_paddingTop.amount = v20;
  *(void *)&self->m_paddingTop.unit = v21;
  [v4 decodeFloatForKey:@"paddingLeft-amount"];
  double v23 = v22;
  unsigned int v24 = [v4 decodeIntForKey:@"paddingLeft-unit"];
  self->m_paddingLeft.amount = v23;
  *(void *)&self->m_paddingLeft.unit = v24;
  [v4 decodeFloatForKey:@"paddingBottom-amount"];
  double v26 = v25;
  unsigned int v27 = [v4 decodeIntForKey:@"paddingBottom-unit"];
  self->m_paddingBottom.amount = v26;
  *(void *)&self->m_paddingBottom.unit = v27;
  [v4 decodeFloatForKey:@"paddingRight-amount"];
  double v29 = v28;
  unsigned int v30 = [v4 decodeIntForKey:@"paddingRight-unit"];
  self->m_paddingRight.amount = v29;
  *(void *)&self->m_paddingRight.unit = v30;
  self->m_explicitlySpecified = [v4 decodeBoolForKey:@"explicit"];
  char v31 = [v4 decodeBoolForKey:@"isTemplate"];

  self->m_isTemplate = v31;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  m_name = self->m_name;
  id v13 = a3;
  [v13 encodeObject:m_name forKey:@"name"];
  double amount = self->m_x.amount;
  *(float *)&double amount = amount;
  [v13 encodeFloat:@"x-amount" forKey:amount];
  [v13 encodeInt:self->m_x.unit forKey:@"x-unit"];
  double v6 = self->m_y.amount;
  *(float *)&double v6 = v6;
  [v13 encodeFloat:@"y-amount" forKey:v6];
  [v13 encodeInt:self->m_y.unit forKey:@"y-unit"];
  double v7 = self->m_w.amount;
  *(float *)&double v7 = v7;
  [v13 encodeFloat:@"w-amount" forKey:v7];
  [v13 encodeInt:self->m_w.unit forKey:@"w-unit"];
  double v8 = self->m_h.amount;
  *(float *)&double v8 = v8;
  [v13 encodeFloat:@"h-amount" forKey:v8];
  [v13 encodeInt:self->m_h.unit forKey:@"h-unit"];
  double v9 = self->m_paddingTop.amount;
  *(float *)&double v9 = v9;
  [v13 encodeFloat:@"paddingTop-amount" forKey:v9];
  [v13 encodeInt:self->m_paddingTop.unit forKey:@"paddingTop-unit"];
  double v10 = self->m_paddingLeft.amount;
  *(float *)&double v10 = v10;
  [v13 encodeFloat:@"paddingLeft-amount" forKey:v10];
  [v13 encodeInt:self->m_paddingLeft.unit forKey:@"paddingLeft-unit"];
  double v11 = self->m_paddingBottom.amount;
  *(float *)&double v11 = v11;
  [v13 encodeFloat:@"paddingBottom-amount" forKey:v11];
  [v13 encodeInt:self->m_paddingBottom.unit forKey:@"paddingBottom-unit"];
  double v12 = self->m_paddingRight.amount;
  *(float *)&double v12 = v12;
  [v13 encodeFloat:@"paddingRight-amount" forKey:v12];
  [v13 encodeInt:self->m_paddingRight.unit forKey:@"paddingRight-unit"];
  [v13 encodeBool:self->m_explicitlySpecified forKey:@"explicit"];
  [v13 encodeBool:self->m_isTemplate forKey:@"isTemplate"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(UIKBGeometry);
  $000CCD7ED2ADA2E18343834BA3C2DAF0 v5 = [(UIKBGeometry *)self name];
  [(UIKBGeometry *)v4 setName:v5];

  uint64_t v6 = [(UIKBGeometry *)self x];
  -[UIKBGeometry setX:](v4, "setX:", v6, v7);
  uint64_t v8 = [(UIKBGeometry *)self y];
  -[UIKBGeometry setY:](v4, "setY:", v8, v9);
  uint64_t v10 = [(UIKBGeometry *)self w];
  -[UIKBGeometry setW:](v4, "setW:", v10, v11);
  uint64_t v12 = [(UIKBGeometry *)self h];
  -[UIKBGeometry setH:](v4, "setH:", v12, v13);
  uint64_t v14 = [(UIKBGeometry *)self paddingTop];
  -[UIKBGeometry setPaddingTop:](v4, "setPaddingTop:", v14, v15);
  uint64_t v16 = [(UIKBGeometry *)self paddingLeft];
  -[UIKBGeometry setPaddingLeft:](v4, "setPaddingLeft:", v16, v17);
  uint64_t v18 = [(UIKBGeometry *)self paddingBottom];
  -[UIKBGeometry setPaddingBottom:](v4, "setPaddingBottom:", v18, v19);
  uint64_t v20 = [(UIKBGeometry *)self paddingRight];
  -[UIKBGeometry setPaddingRight:](v4, "setPaddingRight:", v20, v21);
  [(UIKBGeometry *)v4 setExplicitlySpecified:[(UIKBGeometry *)self explicitlySpecified]];
  [(UIKBGeometry *)v4 setIsTemplate:[(UIKBGeometry *)self isTemplate]];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v56 = v4;
    id v5 = v4;
    uint64_t v6 = [(UIKBGeometry *)self x];
    int v55 = v7;
    uint64_t v8 = [v5 x];
    int v54 = v9;
    double v10 = *(double *)&v6;
    double v11 = *(double *)&v8;
    double v12 = COERCE_DOUBLE([(UIKBGeometry *)self y]);
    int v53 = v13;
    double v14 = COERCE_DOUBLE([v5 y]);
    int v16 = v15;
    double v17 = COERCE_DOUBLE([(UIKBGeometry *)self w]);
    int v52 = v18;
    double v19 = COERCE_DOUBLE([v5 w]);
    int v21 = v20;
    double v22 = COERCE_DOUBLE([(UIKBGeometry *)self h]);
    int v51 = v23;
    double v24 = COERCE_DOUBLE([v5 h]);
    LOBYTE(v26) = 0;
    if (v10 == v11 && v55 == v54 && v12 == v14 && v53 == v16 && v17 == v19 && v52 == v21 && v22 == v24 && v51 == v25)
    {
      double v27 = COERCE_DOUBLE([(UIKBGeometry *)self paddingTop]);
      int v29 = v28;
      BOOL v32 = v27 == COERCE_DOUBLE([v5 paddingTop]) && v29 == v30;
      double v33 = COERCE_DOUBLE([(UIKBGeometry *)self paddingLeft]);
      int v35 = v34;
      if (v33 != COERCE_DOUBLE([v5 paddingLeft]) || v35 != v36) {
        BOOL v32 = 0;
      }
      double v38 = COERCE_DOUBLE([(UIKBGeometry *)self paddingBottom]);
      int v40 = v39;
      if (v38 != COERCE_DOUBLE([v5 paddingBottom]) || v40 != v41) {
        BOOL v32 = 0;
      }
      double v43 = COERCE_DOUBLE([(UIKBGeometry *)self paddingRight]);
      int v45 = v44;
      BOOL v48 = v43 == COERCE_DOUBLE([v5 paddingRight]) && v45 == v46 && v32;
      BOOL v49 = [(UIKBGeometry *)self isTemplate];
      BOOL v26 = v48 & (v49 ^ [v5 isTemplate] ^ 1);
    }

    id v4 = v56;
  }
  else
  {
    LOBYTE(v26) = 0;
  }

  return v26;
}

- (void)setName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  m_name = self->m_name;
  self->m_name = v4;
}

- (void)setX:(id)a3
{
  self->m_CGFloat x = ($54480812DE8C7014D3D64BD9CBBA15F5)a3;
  self->m_explicitlySpecified = 1;
}

- (void)setY:(id)a3
{
  self->m_CGFloat y = ($54480812DE8C7014D3D64BD9CBBA15F5)a3;
  self->m_explicitlySpecified = 1;
}

- (void)setW:(id)a3
{
  self->m_w = ($54480812DE8C7014D3D64BD9CBBA15F5)a3;
  self->m_explicitlySpecified = 1;
}

- (void)setH:(id)a3
{
  self->m_h = ($54480812DE8C7014D3D64BD9CBBA15F5)a3;
  self->m_explicitlySpecified = 1;
}

- (void)setPaddingTop:(id)a3
{
  self->m_paddingTop = ($54480812DE8C7014D3D64BD9CBBA15F5)a3;
  self->m_explicitlySpecified = 1;
}

- (void)setPaddingLeft:(id)a3
{
  self->m_paddingLeft = ($54480812DE8C7014D3D64BD9CBBA15F5)a3;
  self->m_explicitlySpecified = 1;
}

- (void)setPaddingBottom:(id)a3
{
  self->m_paddingBottom = ($54480812DE8C7014D3D64BD9CBBA15F5)a3;
  self->m_explicitlySpecified = 1;
}

- (void)setPaddingRight:(id)a3
{
  self->m_paddingRight = ($54480812DE8C7014D3D64BD9CBBA15F5)a3;
  self->m_explicitlySpecified = 1;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(UIKBGeometry *)self name];
  if (v5)
  {
    uint64_t v6 = [(UIKBGeometry *)self name];
  }
  else
  {
    uint64_t v6 = @"no name";
  }
  int unit = self->m_x.unit;
  switch(unit)
  {
    case 2:
      uint64_t v8 = @"%";
      break;
    case 100:
      uint64_t v8 = @"*";
      break;
    case 3:
      uint64_t v8 = @"pt";
      break;
    default:
      uint64_t v8 = &stru_1ED0E84C0;
      break;
  }
  int v9 = self->m_y.unit;
  switch(v9)
  {
    case 2:
      double v10 = @"%";
      break;
    case 100:
      double v10 = @"*";
      break;
    case 3:
      double v10 = @"pt";
      break;
    default:
      double v10 = &stru_1ED0E84C0;
      break;
  }
  int v11 = self->m_w.unit;
  switch(v11)
  {
    case 2:
      double v12 = @"%";
      break;
    case 100:
      double v12 = @"*";
      break;
    case 3:
      double v12 = @"pt";
      break;
    default:
      double v12 = &stru_1ED0E84C0;
      break;
  }
  int v13 = self->m_h.unit;
  switch(v13)
  {
    case 2:
      double v14 = @"%";
      break;
    case 100:
      double v14 = @"*";
      break;
    case 3:
      double v14 = @"pt";
      break;
    default:
      double v14 = &stru_1ED0E84C0;
      break;
  }
  int v15 = self->m_paddingTop.unit;
  switch(v15)
  {
    case 2:
      int v16 = @"%";
      break;
    case 100:
      int v16 = @"*";
      break;
    case 3:
      int v16 = @"pt";
      break;
    default:
      int v16 = &stru_1ED0E84C0;
      break;
  }
  int v17 = self->m_paddingLeft.unit;
  switch(v17)
  {
    case 2:
      int v18 = @"%";
      break;
    case 100:
      int v18 = @"*";
      break;
    case 3:
      int v18 = @"pt";
      break;
    default:
      int v18 = &stru_1ED0E84C0;
      break;
  }
  int v19 = self->m_paddingBottom.unit;
  switch(v19)
  {
    case 2:
      int v20 = @"%";
      break;
    case 100:
      int v20 = @"*";
      break;
    case 3:
      int v20 = @"pt";
      break;
    default:
      int v20 = &stru_1ED0E84C0;
      break;
  }
  int v21 = self->m_paddingRight.unit;
  switch(v21)
  {
    case 2:
      double v22 = @"%";
      break;
    case 100:
      double v22 = @"*";
      break;
    case 3:
      double v22 = @"pt";
      break;
    default:
      double v22 = &stru_1ED0E84C0;
      break;
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@ : %@> dims(%.2f%@, %.2f%@, %.2f%@, %.2f%@) padding(%.2f%@, %.2f%@, %.2f%@, %.2f%@)", v4, v6, *(void *)&self->m_x.amount, v8, *(void *)&self->m_y.amount, v10, *(void *)&self->m_w.amount, v12, *(void *)&self->m_h.amount, v14, *(void *)&self->m_paddingTop.amount, v16, *(void *)&self->m_paddingLeft.amount, v18, *(void *)&self->m_paddingBottom.amount, v20,
    *(void *)&self->m_paddingRight.amount,
  int v23 = v22);
  if (v5) {

  }
  return v23;
}

- (id)shortDescription
{
  id v2 = NSString;
  double amount = self->m_x.amount;
  int unit = self->m_x.unit;
  id v5 = &stru_1ED0E84C0;
  if (unit == 2) {
    uint64_t v6 = @"%";
  }
  else {
    uint64_t v6 = &stru_1ED0E84C0;
  }
  if (unit == 100) {
    int v7 = @"*";
  }
  else {
    int v7 = v6;
  }
  double v8 = self->m_y.amount;
  int v9 = self->m_y.unit;
  if (v9 == 2) {
    double v10 = @"%";
  }
  else {
    double v10 = &stru_1ED0E84C0;
  }
  if (v9 == 100) {
    int v11 = @"*";
  }
  else {
    int v11 = v10;
  }
  double v12 = self->m_w.amount;
  int v13 = self->m_w.unit;
  if (v13 == 2) {
    double v14 = @"%";
  }
  else {
    double v14 = &stru_1ED0E84C0;
  }
  if (v13 == 100) {
    int v15 = @"*";
  }
  else {
    int v15 = v14;
  }
  double v16 = self->m_h.amount;
  int v17 = self->m_h.unit;
  if (v17 == 2) {
    int v18 = @"%";
  }
  else {
    int v18 = &stru_1ED0E84C0;
  }
  if (v17 == 100) {
    int v19 = @"*";
  }
  else {
    int v19 = v18;
  }
  double v20 = self->m_paddingTop.amount;
  int v21 = self->m_paddingTop.unit;
  if (v21 == 2) {
    double v22 = @"%";
  }
  else {
    double v22 = &stru_1ED0E84C0;
  }
  if (v21 == 100) {
    int v23 = @"*";
  }
  else {
    int v23 = v22;
  }
  double v24 = self->m_paddingLeft.amount;
  int v25 = self->m_paddingLeft.unit;
  if (v25 == 2) {
    BOOL v26 = @"%";
  }
  else {
    BOOL v26 = &stru_1ED0E84C0;
  }
  if (v25 == 100) {
    double v27 = @"*";
  }
  else {
    double v27 = v26;
  }
  double v28 = self->m_paddingBottom.amount;
  int v29 = self->m_paddingBottom.unit;
  if (v29 == 2) {
    int v30 = @"%";
  }
  else {
    int v30 = &stru_1ED0E84C0;
  }
  if (v29 == 100) {
    char v31 = @"*";
  }
  else {
    char v31 = v30;
  }
  double v32 = self->m_paddingRight.amount;
  int v33 = self->m_paddingRight.unit;
  if (v33 == 2) {
    id v5 = @"%";
  }
  if (v33 == 100) {
    int v34 = @"*";
  }
  else {
    int v34 = v5;
  }
  int v35 = v31;
  int v36 = v27;
  v37 = v23;
  double v38 = v19;
  int v39 = v15;
  int v40 = v11;
  int v41 = v7;
  v42 = [v2 stringWithFormat:@"d(%g%@,%g%@,%g%@,%g%@) p(%g%@,%g%@,%g%@,%g%@)", *(void *)&amount, v41, *(void *)&v8, v40, *(void *)&v12, v39, *(void *)&v16, v38, *(void *)&v20, v37, *(void *)&v24, v36, *(void *)&v28, v35, *(void *)&v32, v34];

  return v42;
}

- (unint64_t)hash
{
  uint64_t v3 = [(UIKBGeometry *)self name];

  if (v3)
  {
    uint64_t v4 = [(UIKBGeometry *)self name];
    uint64_t v5 = [v4 hash];

    uint64_t v3 = 257 * v5;
  }
  unint64_t v6 = 257 * (v3 + (unint64_t)(COERCE_DOUBLE([(UIKBGeometry *)self x]) * 100.0));
  [(UIKBGeometry *)self x];
  unint64_t v8 = 257 * (257 * (v6 + v7) + (unint64_t)(COERCE_DOUBLE([(UIKBGeometry *)self y]) * 100.0));
  [(UIKBGeometry *)self y];
  unint64_t v10 = 257 * (257 * (v8 + v9) + (unint64_t)(COERCE_DOUBLE([(UIKBGeometry *)self w]) * 100.0));
  [(UIKBGeometry *)self w];
  unint64_t v12 = 257 * (257 * (v10 + v11) + (unint64_t)(COERCE_DOUBLE([(UIKBGeometry *)self h]) * 100.0));
  [(UIKBGeometry *)self h];
  unint64_t v14 = 257
      * (257 * (v12 + v13) + (unint64_t)(COERCE_DOUBLE([(UIKBGeometry *)self paddingTop]) * 100.0));
  [(UIKBGeometry *)self paddingTop];
  unint64_t v16 = 257
      * (257 * (v14 + v15) + (unint64_t)(COERCE_DOUBLE([(UIKBGeometry *)self paddingLeft]) * 100.0));
  [(UIKBGeometry *)self paddingLeft];
  unint64_t v18 = 257
      * (257 * (v16 + v17)
       + (unint64_t)(COERCE_DOUBLE([(UIKBGeometry *)self paddingBottom]) * 100.0));
  [(UIKBGeometry *)self paddingBottom];
  unint64_t v20 = 257
      * (257 * (v18 + v19)
       + (unint64_t)(COERCE_DOUBLE([(UIKBGeometry *)self paddingRight]) * 100.0));
  [(UIKBGeometry *)self paddingRight];
  unint64_t v22 = 257 * (257 * (v20 + v21) + [(UIKBGeometry *)self explicitlySpecified]);
  return v22 + [(UIKBGeometry *)self isTemplate];
}

+ (id)codeStringForValue:(id)a3
{
  uint64_t v3 = @"UIKBUnitAutomatic";
  uint64_t v4 = @"UIKBUnitPoints";
  uint64_t v5 = @"UIKBUnitNone";
  if (a3.var1 == 2) {
    uint64_t v5 = @"UIKBUnitPercent";
  }
  if (a3.var1 != 3) {
    uint64_t v4 = v5;
  }
  if (a3.var1 != 100) {
    uint64_t v3 = v4;
  }
  return (id)[NSString stringWithFormat:@"UIKBValueMake(%g, %@)", *(void *)&a3.var0, v3];
}

+ (void)performOperations:(id)a3 withScale:(double)a4
{
  __UIKBGeometryScale = *(void *)&a4;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  __UIKBGeometryScale = 0x3FF0000000000000;
}

- (CGRect)frame
{
  -[UIKBGeometry frameWithContainingFrame:](self, "frameWithContainingFrame:", 0.0, 0.0, 0.0, 0.0);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (CGRect)frameWithContainingFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(UIKBGeometry *)self explicitlySpecified])
  {
    double amount = self->m_x.amount;
    if (self->m_x.unit == 2)
    {
      double amount = x + width * (amount / 100.0);
      if (*(double *)&__UIKBGeometryScale == 1.0) {
        double v9 = floor(amount);
      }
      else {
        double v9 = floor(amount * *(double *)&__UIKBGeometryScale) / *(double *)&__UIKBGeometryScale;
      }
    }
    else
    {
      double v9 = self->m_x.amount;
    }
    double v10 = self->m_y.amount;
    if (self->m_y.unit == 2)
    {
      double v13 = y + height * (v10 / 100.0);
      if (*(double *)&__UIKBGeometryScale == 1.0) {
        double v10 = round(v13);
      }
      else {
        double v10 = round(v13 * *(double *)&__UIKBGeometryScale) / *(double *)&__UIKBGeometryScale;
      }
    }
    double v11 = self->m_w.amount;
    if (self->m_w.unit == 2)
    {
      double v14 = amount - v9 + width * (v11 / 100.0);
      if (*(double *)&__UIKBGeometryScale == 1.0) {
        double v11 = ceil(v14);
      }
      else {
        double v11 = ceil(v14 * *(double *)&__UIKBGeometryScale) / *(double *)&__UIKBGeometryScale;
      }
    }
    double v12 = self->m_h.amount;
    if (self->m_h.unit == 2)
    {
      double v15 = height * (v12 / 100.0);
      if (*(double *)&__UIKBGeometryScale == 1.0) {
        double v12 = round(v15);
      }
      else {
        double v12 = round(v15 * *(double *)&__UIKBGeometryScale) / *(double *)&__UIKBGeometryScale;
      }
    }
    if (width > 0.0)
    {
      v20.origin.double x = x;
      v20.origin.double y = y;
      v20.size.double width = width;
      v20.size.double height = height;
      if (v9 + v11 > CGRectGetMaxX(v20))
      {
        v21.origin.double x = x;
        v21.origin.double y = y;
        v21.size.double width = width;
        v21.size.double height = height;
        double v11 = CGRectGetMaxX(v21) - v9;
      }
    }
  }
  else
  {
    double v9 = x;
    double v10 = y;
    double v11 = width;
    double v12 = height;
  }
  double v16 = v9;
  double v17 = v10;
  double v18 = v11;
  double v19 = v12;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGRect)paddedFrameWithContainingFrame:(CGRect)a3
{
  -[UIKBGeometry frameWithContainingFrame:](self, "frameWithContainingFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIKBGeometry paddedFrameWithResolvedFrame:](self, "paddedFrameWithResolvedFrame:");
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)paddedFrameWithResolvedFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(UIKBGeometry *)self explicitlySpecified])
  {
    double amount = self->m_paddingLeft.amount;
    if (self->m_paddingLeft.unit == 2) {
      double amount = width * (amount / 100.0);
    }
    if (amount <= width) {
      double v9 = amount;
    }
    else {
      double v9 = width;
    }
    double v10 = self->m_paddingTop.amount;
    if (self->m_paddingTop.unit == 2) {
      double v10 = height * (v10 / 100.0);
    }
    if (v10 > height) {
      double v10 = height;
    }
    if (self->m_paddingRight.unit == 2) {
      double v11 = width - v9 + width * (self->m_paddingRight.amount / -100.0);
    }
    else {
      double v11 = width - v9 - self->m_paddingRight.amount;
    }
    if (v11 >= 0.0) {
      double width = v11;
    }
    else {
      double width = 0.0;
    }
    if (self->m_paddingBottom.unit == 2) {
      double v12 = height - v10 + height * (self->m_paddingBottom.amount / -100.0);
    }
    else {
      double v12 = height - v10 - self->m_paddingBottom.amount;
    }
    double y = y + v10;
    if (v12 >= 0.0) {
      double height = v12;
    }
    else {
      double height = 0.0;
    }
    if (self->m_y.unit == 2 || self->m_h.unit == 2)
    {
      if (*(double *)&__UIKBGeometryScale == 1.0)
      {
        v21.origin.double x = 0.0;
        v21.size.double width = 0.0;
        v21.origin.double y = y;
        v21.size.double height = height;
        CGRect v22 = CGRectIntegral(v21);
      }
      else
      {
        UIRectIntegralWithScale(0.0, y, 0.0, height, *(double *)&__UIKBGeometryScale);
      }
      double y = v22.origin.y;
      double height = v22.size.height;
    }
    double x = x + v9;
    if (self->m_x.unit == 2 || self->m_w.unit == 2)
    {
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      if (*(double *)&__UIKBGeometryScale == 1.0)
      {
        double v15 = x;
        double v16 = width;
        CGRect v23 = CGRectIntegral(*(CGRect *)(&v13 - 1));
      }
      else
      {
        v23.origin.double x = UIRectIntegralWithScale(x, 0.0, width, 0.0, *(double *)&__UIKBGeometryScale);
      }
      double x = v23.origin.x;
      double width = v23.size.width;
    }
  }
  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (id)overrideGeometry:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = (UIKBGeometry *)[(UIKBGeometry *)self copy];
    [v4 x];
    if (v6)
    {
      uint64_t v7 = [v4 x];
      -[UIKBGeometry setX:](v5, "setX:", v7, v8);
    }
    [v4 y];
    if (v9)
    {
      uint64_t v10 = [v4 y];
      -[UIKBGeometry setY:](v5, "setY:", v10, v11);
    }
    [v4 w];
    if (v12)
    {
      uint64_t v13 = [v4 w];
      -[UIKBGeometry setW:](v5, "setW:", v13, v14);
    }
    [v4 h];
    if (v15)
    {
      uint64_t v16 = [v4 h];
      -[UIKBGeometry setH:](v5, "setH:", v16, v17);
    }
    [v4 paddingTop];
    if (v18)
    {
      uint64_t v19 = [v4 paddingTop];
      -[UIKBGeometry setPaddingTop:](v5, "setPaddingTop:", v19, v20);
    }
    [v4 paddingLeft];
    if (v21)
    {
      uint64_t v22 = [v4 paddingLeft];
      -[UIKBGeometry setPaddingLeft:](v5, "setPaddingLeft:", v22, v23);
    }
    [v4 paddingBottom];
    if (v24)
    {
      uint64_t v25 = [v4 paddingBottom];
      -[UIKBGeometry setPaddingBottom:](v5, "setPaddingBottom:", v25, v26);
    }
    [v4 paddingRight];
    if (v27)
    {
      uint64_t v28 = [v4 paddingRight];
      -[UIKBGeometry setPaddingRight:](v5, "setPaddingRight:", v28, v29);
    }
  }
  else
  {
    double v5 = self;
  }

  return v5;
}

- (BOOL)usesPercentages
{
  [(UIKBGeometry *)self x];
  if (v3 == 2) {
    return 1;
  }
  [(UIKBGeometry *)self y];
  if (v4 == 2) {
    return 1;
  }
  [(UIKBGeometry *)self w];
  if (v5 == 2) {
    return 1;
  }
  [(UIKBGeometry *)self h];
  if (v6 == 2) {
    return 1;
  }
  [(UIKBGeometry *)self paddingTop];
  if (v7 == 2) {
    return 1;
  }
  [(UIKBGeometry *)self paddingLeft];
  if (v8 == 2) {
    return 1;
  }
  [(UIKBGeometry *)self paddingBottom];
  if (v9 == 2) {
    return 1;
  }
  [(UIKBGeometry *)self paddingRight];
  return v11 == 2;
}

- (BOOL)usesAutomaticMetrics
{
  [(UIKBGeometry *)self x];
  if (v3 == 100) {
    return 1;
  }
  [(UIKBGeometry *)self y];
  if (v4 == 100) {
    return 1;
  }
  [(UIKBGeometry *)self w];
  if (v5 == 100) {
    return 1;
  }
  [(UIKBGeometry *)self h];
  if (v6 == 100) {
    return 1;
  }
  [(UIKBGeometry *)self paddingTop];
  if (v7 == 100) {
    return 1;
  }
  [(UIKBGeometry *)self paddingLeft];
  if (v8 == 100) {
    return 1;
  }
  [(UIKBGeometry *)self paddingBottom];
  if (v9 == 100) {
    return 1;
  }
  [(UIKBGeometry *)self paddingRight];
  return v11 == 100;
}

- (NSString)name
{
  return self->m_name;
}

- ($000CCD7ED2ADA2E18343834BA3C2DAF0)x
{
  uint64_t v2 = *(void *)&self->m_x.unit;
  double amount = self->m_x.amount;
  result.var1 = v2;
  result.double var0 = amount;
  return result;
}

- ($000CCD7ED2ADA2E18343834BA3C2DAF0)y
{
  uint64_t v2 = *(void *)&self->m_y.unit;
  double amount = self->m_y.amount;
  result.var1 = v2;
  result.double var0 = amount;
  return result;
}

- ($000CCD7ED2ADA2E18343834BA3C2DAF0)w
{
  uint64_t v2 = *(void *)&self->m_w.unit;
  double amount = self->m_w.amount;
  result.var1 = v2;
  result.double var0 = amount;
  return result;
}

- ($000CCD7ED2ADA2E18343834BA3C2DAF0)h
{
  uint64_t v2 = *(void *)&self->m_h.unit;
  double amount = self->m_h.amount;
  result.var1 = v2;
  result.double var0 = amount;
  return result;
}

- ($000CCD7ED2ADA2E18343834BA3C2DAF0)paddingTop
{
  uint64_t v2 = *(void *)&self->m_paddingTop.unit;
  double amount = self->m_paddingTop.amount;
  result.var1 = v2;
  result.double var0 = amount;
  return result;
}

- ($000CCD7ED2ADA2E18343834BA3C2DAF0)paddingLeft
{
  uint64_t v2 = *(void *)&self->m_paddingLeft.unit;
  double amount = self->m_paddingLeft.amount;
  result.var1 = v2;
  result.double var0 = amount;
  return result;
}

- ($000CCD7ED2ADA2E18343834BA3C2DAF0)paddingBottom
{
  uint64_t v2 = *(void *)&self->m_paddingBottom.unit;
  double amount = self->m_paddingBottom.amount;
  result.var1 = v2;
  result.double var0 = amount;
  return result;
}

- ($000CCD7ED2ADA2E18343834BA3C2DAF0)paddingRight
{
  uint64_t v2 = *(void *)&self->m_paddingRight.unit;
  double amount = self->m_paddingRight.amount;
  result.var1 = v2;
  result.double var0 = amount;
  return result;
}

- (BOOL)explicitlySpecified
{
  return self->m_explicitlySpecified;
}

- (void)setExplicitlySpecified:(BOOL)a3
{
  self->m_explicitlySpecified = a3;
}

- (BOOL)isTemplate
{
  return self->m_isTemplate;
}

- (void)setIsTemplate:(BOOL)a3
{
  self->m_isTemplate = a3;
}

- (void).cxx_destruct
{
}

@end