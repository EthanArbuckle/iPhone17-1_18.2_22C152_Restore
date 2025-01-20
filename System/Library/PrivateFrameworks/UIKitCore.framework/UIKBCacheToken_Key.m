@interface UIKBCacheToken_Key
+ (id)tokenForKey:(id)a3 style:(id)a4;
+ (id)tokenForKey:(id)a3 style:(id)a4 displayInsets:(UIEdgeInsets)a5;
- ($5C396DA91E87D63640AC871340DC94CC)styling;
- (BOOL)hasKey;
- (CGSize)size;
- (id)_initWithKey:(id)a3 style:(id)a4 displayInsets:(UIEdgeInsets)a5;
- (id)_stringWithAdditionalValues:(id)a3;
- (id)string;
- (id)stringForRenderFlags:(int64_t)a3 lightKeyboard:(BOOL)a4;
- (int)displayHint;
- (int)rowHint;
- (void)annotateWithBool:(BOOL)a3;
- (void)annotateWithInt:(int)a3;
- (void)annotateWithString:(id)a3;
- (void)resetAnnotations;
- (void)setDisplayHint:(int)a3;
- (void)setRowHint:(int)a3;
- (void)setSize:(CGSize)a3;
- (void)setStyling:(id)a3;
@end

@implementation UIKBCacheToken_Key

- (id)_initWithKey:(id)a3 style:(id)a4 displayInsets:(UIEdgeInsets)a5
{
  CGFloat right = a5.right;
  CGFloat bottom = a5.bottom;
  CGFloat left = a5.left;
  CGFloat top = a5.top;
  uint64_t v9 = *(void *)&a4;
  id v11 = a3;
  v12 = [v11 name];
  v21.receiver = self;
  v21.super_class = (Class)UIKBCacheToken_Key;
  v13 = [(UIKBCacheToken *)&v21 initWithName:v12];

  if (v13)
  {
    *(void *)&v13->_style.styling = v9;
    v13->_style.intValue = v9 & 0xFFFFFFBF;
    uint64_t v14 = [v11 cacheDisplayString];
    cacheDisplayString = v13->_cacheDisplayString;
    v13->_cacheDisplayString = (NSString *)v14;

    uint64_t v16 = [v11 cacheSecondaryDisplayString];
    cacheSecondaryDisplayString = v13->_cacheSecondaryDisplayString;
    v13->_cacheSecondaryDisplayString = (NSString *)v16;

    v13->_displayTypeHint = [v11 displayTypeHint];
    v13->_displayRowHint = [v11 displayRowHint];
    [v11 paddedFrame];
    v13->_size.width = v18;
    v13->_size.height = v19;
    v13->_state = [v11 state];
    v13->_clipCorners = [v11 clipCorners];
    v13->_groupNeighbors = [v11 groupNeighbor];
    v13->_displayInsets.CGFloat top = top;
    v13->_displayInsets.CGFloat left = left;
    v13->_displayInsets.CGFloat bottom = bottom;
    v13->_displayInsets.CGFloat right = right;
  }

  return v13;
}

+ (id)tokenForKey:(id)a3 style:(id)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithKey:style:displayInsets:", v5, v4, 0.0, 0.0, 0.0, 0.0);

  return v6;
}

+ (id)tokenForKey:(id)a3 style:(id)a4 displayInsets:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  uint64_t v9 = *(void *)&a4;
  id v10 = a3;
  id v11 = (unsigned char *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithKey:style:displayInsets:", v10, v9, top, left, bottom, right);

  v11[136] = 1;
  return v11;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (int)rowHint
{
  return self->_displayRowHint;
}

- (void)setRowHint:(int)a3
{
  self->_displayRowHint = a3;
}

- (int)displayHint
{
  return self->_displayTypeHint;
}

- (void)setDisplayHint:(int)a3
{
  self->_displayTypeHint = a3;
}

- ($5C396DA91E87D63640AC871340DC94CC)styling
{
  return ($5C396DA91E87D63640AC871340DC94CC)*(void *)&self->_style.styling;
}

- (void)setStyling:(id)a3
{
  *(void *)&self->_style.styling = *(void *)&a3;
}

- (BOOL)hasKey
{
  return [(UIKBCacheToken *)self emptyFields] < 2;
}

- (void)annotateWithString:(id)a3
{
  id v4 = a3;
  annotationString = self->_annotationString;
  id v8 = v4;
  if (annotationString)
  {
    v6 = [(NSString *)annotationString stringByAppendingString:v4];
  }
  else
  {
    v6 = (NSString *)v4;
  }
  v7 = self->_annotationString;
  self->_annotationString = v6;
}

- (void)resetAnnotations
{
  annotationString = self->_annotationString;
  self->_annotationString = 0;
}

- (void)annotateWithBool:(BOOL)a3
{
  if (a3) {
    v3 = @"1";
  }
  else {
    v3 = @"0";
  }
  [(UIKBCacheToken_Key *)self annotateWithString:v3];
}

- (void)annotateWithInt:(int)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"%d", *(void *)&a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(UIKBCacheToken_Key *)self annotateWithString:v4];
}

- (id)_stringWithAdditionalValues:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__UIKBCacheToken_Key__stringWithAdditionalValues___block_invoke;
  v8[3] = &unk_1E52F3D88;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  v6 = [(UIKBCacheToken *)self stringForConstruction:v8];

  return v6;
}

- (id)string
{
  return [(UIKBCacheToken_Key *)self _stringWithAdditionalValues:0];
}

- (id)stringForRenderFlags:(int64_t)a3 lightKeyboard:(BOOL)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__UIKBCacheToken_Key_stringForRenderFlags_lightKeyboard___block_invoke;
  v6[3] = &unk_1E52F3D60;
  BOOL v7 = a4;
  v6[4] = self;
  v6[5] = a3;
  id v4 = [(UIKBCacheToken_Key *)self _stringWithAdditionalValues:v6];
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationString, 0);
  objc_storeStrong((id *)&self->_cacheSecondaryDisplayString, 0);
  objc_storeStrong((id *)&self->_cacheDisplayString, 0);
}

@end