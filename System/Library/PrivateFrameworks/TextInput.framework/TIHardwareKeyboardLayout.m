@interface TIHardwareKeyboardLayout
+ (BOOL)supportsSecureCoding;
+ (void)flushLayoutCaches;
- (BOOL)isEqual:(id)a3;
- (CGRect)_frameForKeyCode:(unint64_t)a3;
- (TIHardwareKeyboardLayout)initWithCoder:(id)a3;
- (TIHardwareKeyboardLayout)initWithKeyboardType:(int64_t)a3;
- (id)_ANSIFrames;
- (int64_t)keyboardType;
- (void)addExactString:(id)a3 forKeyCode:(unint64_t)a4;
- (void)addString:(id)a3 forKeyCode:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TIHardwareKeyboardLayout

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (id)_ANSIFrames
{
  v2 = (void *)__ansiFrames;
  if (!__ansiFrames)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:60];
    uint64_t v4 = 0;
    double v5 = 0.0;
    do
    {
      uint64_t v6 = qword_18D2C3E10[v4];
      v7 = _TIValueForCGRect(v5, 0.0, 94.0, 88.0);
      v8 = [NSNumber numberWithUnsignedInteger:v6];
      [v3 setObject:v7 forKey:v8];

      double v5 = v5 + 94.0;
      ++v4;
    }
    while (v4 != 13);
    double v9 = 144.0;
    v10 = _TIValueForCGRect(v5, 0.0, 144.0, 88.0);
    [v3 setObject:v10 forKey:&unk_1EDC383D8];

    v11 = _TIValueForCGRect(0.0, 88.0, 144.0, 88.0);
    [v3 setObject:v11 forKey:&unk_1EDC383F0];

    for (uint64_t i = 0; i != 13; ++i)
    {
      uint64_t v13 = qword_18D2C3E78[i];
      v14 = _TIValueForCGRect(v9, 88.0, 94.0, 88.0);
      v15 = [NSNumber numberWithUnsignedInteger:v13];
      [v3 setObject:v14 forKey:v15];

      double v9 = v9 + 94.0;
    }
    uint64_t v16 = 0;
    double v17 = 166.0;
    do
    {
      uint64_t v18 = qword_18D2C3EE0[v16];
      v19 = _TIValueForCGRect(v17, 176.0, 94.0, 88.0);
      v20 = [NSNumber numberWithUnsignedInteger:v18];
      [v3 setObject:v19 forKey:v20];

      double v17 = v17 + 94.0;
      ++v16;
    }
    while (v16 != 11);
    v21 = _TIValueForCGRect(v17, 176.0, 166.0, 88.0);
    [v3 setObject:v21 forKey:&unk_1EDC38408];

    uint64_t v22 = 0;
    double v23 = 213.0;
    do
    {
      uint64_t v24 = qword_18D2C3F38[v22];
      v25 = _TIValueForCGRect(v23, 264.0, 94.0, 88.0);
      v26 = [NSNumber numberWithUnsignedInteger:v24];
      [v3 setObject:v25 forKey:v26];

      double v23 = v23 + 94.0;
      ++v22;
    }
    while (v22 != 10);
    v27 = _TIValueForCGRect(401.0, 352.0, 564.0, 88.0);
    [v3 setObject:v27 forKey:&unk_1EDC38420];

    v28 = (void *)__ansiFrames;
    __ansiFrames = (uint64_t)v3;

    v2 = (void *)__ansiFrames;
  }

  return v2;
}

- (CGRect)_frameForKeyCode:(unint64_t)a3
{
  int64_t keyboardType = self->_keyboardType;
  if (keyboardType == 2)
  {
    uint64_t v5 = [(TIHardwareKeyboardLayout *)self _JISFrames];
  }
  else
  {
    if (keyboardType == 1) {
      [(TIHardwareKeyboardLayout *)self _ISOFrames];
    }
    else {
    uint64_t v5 = [(TIHardwareKeyboardLayout *)self _ANSIFrames];
    }
  }
  uint64_t v6 = (void *)v5;
  v7 = [NSNumber numberWithUnsignedInteger:a3];
  v8 = [v6 objectForKey:v7];

  if (v8)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    [v8 getValue:&v17];
    double v10 = *((double *)&v17 + 1);
    double v9 = *(double *)&v17;
    double v12 = *((double *)&v18 + 1);
    double v11 = *(double *)&v18;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB20];
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)addExactString:(id)a3 forKeyCode:(unint64_t)a4
{
  id v10 = a3;
  [(TIHardwareKeyboardLayout *)self _frameForKeyCode:a4];
  double x = v12.origin.x;
  double y = v12.origin.y;
  double width = v12.size.width;
  double height = v12.size.height;
  if (!CGRectIsNull(v12)) {
    -[TIKeyboardLayout addKeyWithExactString:frame:](self, "addKeyWithExactString:frame:", v10, x, y, width, height);
  }
}

- (void)addString:(id)a3 forKeyCode:(unint64_t)a4
{
  id v10 = a3;
  [(TIHardwareKeyboardLayout *)self _frameForKeyCode:a4];
  double x = v12.origin.x;
  double y = v12.origin.y;
  double width = v12.size.width;
  double height = v12.size.height;
  if (!CGRectIsNull(v12)) {
    -[TIKeyboardLayout addKeyWithString:frame:](self, "addKeyWithString:frame:", v10, x, y, width, height);
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TIHardwareKeyboardLayout *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v4->_keyboardType == self->_keyboardType)
    {
      v7.receiver = self;
      v7.super_class = (Class)TIHardwareKeyboardLayout;
      BOOL v5 = [(TIKeyboardLayout *)&v7 isEqual:v4];
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TIHardwareKeyboardLayout;
  id v4 = a3;
  [(TIKeyboardLayout *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_keyboardType, @"keyboardType", v5.receiver, v5.super_class);
}

- (TIHardwareKeyboardLayout)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TIHardwareKeyboardLayout;
  objc_super v5 = [(TIKeyboardLayout *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_int64_t keyboardType = [v4 decodeIntegerForKey:@"keyboardType"];
  }

  return v5;
}

- (TIHardwareKeyboardLayout)initWithKeyboardType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TIHardwareKeyboardLayout;
  CGRect result = [(TIKeyboardLayout *)&v5 initWithCapacity:60];
  if (result) {
    result->_int64_t keyboardType = a3;
  }
  return result;
}

+ (void)flushLayoutCaches
{
  v2 = (void *)__ansiFrames;
  __ansiFrames = 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end