@interface TIKeyboardLayout
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isShifted;
- (BOOL)usesTwoHands;
- (CGRect)_decodeCGRectForKey:(id)a3 withDecoder:(id)a4;
- (CGRect)frame;
- (TIKeyboardLayout)initWithCapacity:(unint64_t)a3;
- (TIKeyboardLayout)initWithCoder:(id)a3;
- (const)firstKeyString;
- (id)description;
- (int64_t)keyContainingPoint:(CGPoint)a3;
- (unint64_t)hash;
- (void)_encodeCGRect:(CGRect)a3 forKey:(id)a4 withCoder:(id)a5;
- (void)addKeyWithExactString:(id)a3 frame:(CGRect)a4;
- (void)addKeyWithString:(id)a3 frame:(CGRect)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)ensureFrameCapacity:(unint64_t)a3;
- (void)ensureStringCapacity:(unint64_t)a3;
- (void)enumerateKeysUsingBlock:(id)a3;
- (void)setShifted:(BOOL)a3;
- (void)setUsesTwoHands:(BOOL)a3;
@end

@implementation TIKeyboardLayout

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setShifted:(BOOL)a3
{
  self->_shifted = a3;
}

- (BOOL)isShifted
{
  return self->_shifted;
}

- (void)setUsesTwoHands:(BOOL)a3
{
  self->_usesTwoHands = a3;
}

- (BOOL)usesTwoHands
{
  return self->_usesTwoHands;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:self->_count];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __31__TIKeyboardLayout_description__block_invoke;
  v14 = &unk_1E5559118;
  id v15 = v3;
  id v4 = v3;
  [(TIKeyboardLayout *)self enumerateKeysUsingBlock:&v11];
  v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v4 componentsJoinedByString:@", "];
  v9 = [v5 stringWithFormat:@"<%@: %p keys = [%@]>", v7, self, v8, v11, v12, v13, v14];;

  return v9;
}

void __31__TIKeyboardLayout_description__block_invoke(uint64_t a1, const char *a2, double a3, double a4, double a5, double a6)
{
  if (*a2 == 10) {
    uint64_t v11 = "\\n";
  }
  else {
    uint64_t v11 = a2;
  }
  uint64_t v12 = NSString;
  v13 = [NSString stringWithUTF8String:v11];
  [v12 stringWithFormat:@"\"%@\"(x=%.0f,y=%.0f,w=%.0f,h=%.0f)", v13, *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6];
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) addObject:v14];
}

- (int64_t)keyContainingPoint:(CGPoint)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = -1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__TIKeyboardLayout_keyContainingPoint___block_invoke;
  v5[3] = &unk_1E55590F0;
  CGPoint v6 = a3;
  v5[4] = &v7;
  [(TIKeyboardLayout *)self enumerateKeysUsingBlock:v5];
  int64_t v3 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v3;
}

BOOL __39__TIKeyboardLayout_keyContainingPoint___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7, unsigned char *a8)
{
  BOOL result = CGRectContainsPoint(*(CGRect *)&a2, *(CGPoint *)(a1 + 40));
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a7;
    *a8 = 1;
  }
  return result;
}

- (const)firstKeyString
{
  return self->_strings;
}

- (void)enumerateKeysUsingBlock:(id)a3
{
  id v4 = (void (**)(id, char *, unint64_t, unsigned char *, double, double, double, double))a3;
  char v9 = 0;
  if (self->_count)
  {
    unint64_t v5 = 0;
    strings = self->_strings;
    do
    {
      if (strings - self->_strings >= self->_stringsSize) {
        break;
      }
      uint64_t v7 = (uint64_t)self->_frames[v5];
      v4[2](v4, strings, v5++, &v9, (double)(__int16)v7, (double)((int)v7 >> 16), (double)((int)((unint64_t)v7 >> 16) >> 16), (double)(v7 >> 48));
      size_t v8 = strlen(strings);
      if (v5 >= self->_count) {
        break;
      }
      strings += v8 + 1;
    }
    while (!v9);
  }
}

- (void)addKeyWithExactString:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  unint64_t v9 = self->_count + 1;
  id v10 = a3;
  [(TIKeyboardLayout *)self ensureFrameCapacity:v9];
  unint64_t count = self->_count;
  frames = self->_frames;
  self->_unint64_t count = count + 1;
  frames[count] = (_ShortRect)(((unint64_t)(unsigned __int16)(int)width << 32) | ((unint64_t)(int)height << 48) | ((unint64_t)(unsigned __int16)(int)y << 16) | (unsigned __int16)(int)x);
  id v13 = v10;
  id v14 = (const char *)[v13 UTF8String];

  size_t v15 = strlen(v14) + 1;
  [(TIKeyboardLayout *)self ensureStringCapacity:self->_stringsSize + v15];
  strlcpy(&self->_strings[self->_stringsSize], v14, v15);
  self->_stringsSize += v15;
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  self->_frame = CGRectUnion(self->_frame, v16);
}

- (void)addKeyWithString:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  uint64_t v12 = [v9 lowercaseString];
  int v10 = [v9 isEqualToString:@"İ"];

  if (v10)
  {

    uint64_t v11 = @"i";
  }
  else
  {
    uint64_t v11 = v12;
  }
  id v13 = v11;
  -[TIKeyboardLayout addKeyWithExactString:frame:](self, "addKeyWithExactString:frame:", v11, x, y, width, height);
}

- (void)ensureStringCapacity:(unint64_t)a3
{
  stringsCapacitdouble y = self->_stringsCapacity;
  if (stringsCapacity < a3)
  {
    unint64_t v5 = 2 * stringsCapacity;
    if (v5 <= a3) {
      size_t v6 = a3;
    }
    else {
      size_t v6 = v5;
    }
    uint64_t v7 = (char *)malloc_type_calloc(v6, 8uLL, 0x100004000313F17uLL);
    size_t v8 = v7;
    strings = self->_strings;
    if (strings)
    {
      memcpy(v7, strings, self->_stringsSize);
      free(self->_strings);
    }
    self->_strings = v8;
    self->_stringsCapacitdouble y = v6;
  }
}

- (void)ensureFrameCapacity:(unint64_t)a3
{
  framesCapacitdouble y = self->_framesCapacity;
  if (framesCapacity < a3)
  {
    unint64_t v5 = 2 * framesCapacity;
    if (v5 <= a3) {
      size_t v6 = a3;
    }
    else {
      size_t v6 = v5;
    }
    uint64_t v7 = (_ShortRect *)malloc_type_calloc(v6, 8uLL, 0x100004000313F17uLL);
    size_t v8 = v7;
    frames = self->_frames;
    if (frames)
    {
      memcpy(v7, frames, 8 * self->_count);
      free(self->_frames);
    }
    self->_frames = v8;
    self->_framesCapacitdouble y = v6;
  }
}

- (CGRect)_decodeCGRectForKey:(id)a3 withDecoder:(id)a4
{
  unint64_t v5 = NSString;
  id v6 = a4;
  id v7 = a3;
  size_t v8 = [v5 stringWithFormat:@"%@.origin.x", v7];
  [v6 decodeFloatForKey:v8];
  float v10 = v9;

  uint64_t v11 = [NSString stringWithFormat:@"%@.origin.y", v7];
  [v6 decodeFloatForKey:v11];
  float v13 = v12;

  id v14 = [NSString stringWithFormat:@"%@.size.width", v7];
  [v6 decodeFloatForKey:v14];
  float v16 = v15;

  v17 = [NSString stringWithFormat:@"%@.size.height", v7];

  [v6 decodeFloatForKey:v17];
  float v19 = v18;

  double v20 = v10;
  double v21 = v13;
  double v22 = v16;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (void)_encodeCGRect:(CGRect)a3 forKey:(id)a4 withCoder:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  float x = a3.origin.x;
  float v10 = NSString;
  id v11 = a5;
  id v12 = a4;
  float v13 = [v10 stringWithFormat:@"%@.origin.x", v12];
  *(float *)&double v14 = x;
  [v11 encodeFloat:v13 forKey:v14];

  float v15 = [NSString stringWithFormat:@"%@.origin.y", v12];
  *(float *)&CGFloat y = y;
  LODWORD(v16) = LODWORD(y);
  [v11 encodeFloat:v15 forKey:v16];

  v17 = [NSString stringWithFormat:@"%@.size.width", v12];
  *(float *)&CGFloat width = width;
  LODWORD(v18) = LODWORD(width);
  [v11 encodeFloat:v17 forKey:v18];

  id v20 = [NSString stringWithFormat:@"%@.size.height", v12];

  *(float *)&CGFloat height = height;
  LODWORD(v19) = LODWORD(height);
  [v11 encodeFloat:v20 forKey:v19];
}

- (unint64_t)hash
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__TIKeyboardLayout_hash__block_invoke;
  v5[3] = &unk_1E55590C8;
  v5[4] = &v6;
  [(TIKeyboardLayout *)self enumerateKeysUsingBlock:v5];
  unint64_t v3 = (unint64_t)((double)(257
                                 * (unint64_t)((double)(257
                                                             * (unint64_t)((double)(257
                                                                                         * (unint64_t)((double)(unint64_t)(257 * v7[3]) + self->_frame.origin.x * 100.0))
                                                                                + self->_frame.origin.y * 100.0))
                                                    + self->_frame.size.width * 100.0))
                        + self->_frame.size.height * 100.0);
  v7[3] = v3;
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __24__TIKeyboardLayout_hash__block_invoke(uint64_t result, unsigned char *a2)
{
  char v2 = *a2;
  if (*a2)
  {
    unint64_t v3 = a2 + 1;
    do
    {
      *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 257
                                                                      * *(void *)(*(void *)(*(void *)(result + 32)
                                                                                              + 8)
                                                                                  + 24)
                                                                      + v2;
      int v4 = *v3++;
      char v2 = v4;
    }
    while (v4);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (TIKeyboardLayout *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      uint64_t v6 = v5;
      BOOL v9 = v5->_usesTwoHands == self->_usesTwoHands
        && (unint64_t count = v5->_count, count == self->_count)
        && (size_t stringsSize = v5->_stringsSize, stringsSize == self->_stringsSize)
        && !memcmp(v5->_strings, self->_strings, stringsSize)
        && !memcmp(v6->_frames, self->_frames, 8 * count)
        && CGRectEqualToRect(v6->_frame, self->_frame)
        && v6->_shifted == self->_shifted;
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL usesTwoHands = self->_usesTwoHands;
  id v5 = a3;
  [v5 encodeBool:usesTwoHands forKey:@"usesTwoHands"];
  [v5 encodeBytes:self->_frames length:8 * self->_count forKey:@"frames"];
  [v5 encodeBytes:self->_strings length:self->_stringsSize forKey:@"strings"];
  [(TIKeyboardLayout *)self _encodeCGRect:@"frame", v5, self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height forKey withCoder];
  [v5 encodeBool:self->_shifted forKey:@"shifted"];
}

- (TIKeyboardLayout)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TIKeyboardLayout;
  id v5 = [(TIKeyboardLayout *)&v17 init];
  if (v5)
  {
    v5->_BOOL usesTwoHands = [v4 decodeBoolForKey:@"usesTwoHands"];
    unint64_t v16 = 0;
    id v6 = v4;
    id v7 = (const void *)[v6 decodeBytesForKey:@"frames" returnedLength:&v16];
    v5->_unint64_t count = v16 >> 3;
    -[TIKeyboardLayout ensureFrameCapacity:](v5, "ensureFrameCapacity:");
    memcpy(v5->_frames, v7, 8 * v5->_count);
    id v8 = v6;
    BOOL v9 = (const void *)[v8 decodeBytesForKey:@"strings" returnedLength:&v5->_stringsSize];
    [(TIKeyboardLayout *)v5 ensureStringCapacity:v5->_stringsSize];
    memcpy(v5->_strings, v9, v5->_stringsSize);
    unint64_t stringsSize = v5->_stringsSize;
    if (stringsSize) {
      v5->_strings[stringsSize - 1] = 0;
    }
    [(TIKeyboardLayout *)v5 _decodeCGRectForKey:@"frame" withDecoder:v8];
    v5->_frame.origin.float x = v11;
    v5->_frame.origin.CGFloat y = v12;
    v5->_frame.size.CGFloat width = v13;
    v5->_frame.size.CGFloat height = v14;
    v5->_shifted = [v8 decodeBoolForKey:@"shifted"];
  }

  return v5;
}

- (TIKeyboardLayout)initWithCapacity:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardLayout;
  id v4 = [(TIKeyboardLayout *)&v8 init];
  id v5 = v4;
  if (v4)
  {
    [(TIKeyboardLayout *)v4 ensureFrameCapacity:a3];
    [(TIKeyboardLayout *)v5 ensureStringCapacity:5 * a3];
    CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v5->_frame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v5->_frame.size = v6;
  }
  return v5;
}

- (void)dealloc
{
  frames = self->_frames;
  if (frames) {
    free(frames);
  }
  strings = self->_strings;
  if (strings) {
    free(strings);
  }
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardLayout;
  [(TIKeyboardLayout *)&v5 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end