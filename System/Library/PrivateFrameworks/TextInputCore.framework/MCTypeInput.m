@interface MCTypeInput
- (BOOL)canComposeNew:(id)a3;
- (CGPoint)point;
- (MCTypeInput)initWithCharacters:(id)a3 nearbyKeys:(id)a4;
- (MCTypeInput)initWithCharacters:(id)a3 point:(CGPoint)a4 nearbyKeys:(id)a5 sourceKeyboardState:(id)a6;
- (NSArray)nearbyKeys;
- (NSString)characters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)shortDescriptionWithLeadingString:(id)a3;
@end

@implementation MCTypeInput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyKeys, 0);

  objc_storeStrong((id *)&self->_characters, 0);
}

- (NSArray)nearbyKeys
{
  return self->_nearbyKeys;
}

- (CGPoint)point
{
  double x = self->_point.x;
  double y = self->_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSString)characters
{
  return self->_characters;
}

- (BOOL)canComposeNew:(id)a3
{
  return 0;
}

- (id)shortDescriptionWithLeadingString:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F28E78], "string", a3);
  v5 = [(MCTypeInput *)self characters];
  [(MCTypeInput *)self point];
  uint64_t v7 = v6;
  [(MCTypeInput *)self point];
  uint64_t v9 = v8;
  v10 = [(MCTypeInput *)self nearbyKeys];
  uint64_t v11 = [v10 count];
  v12 = [(MCKeyboardInput *)self sourceKeyboardState];
  [v4 appendFormat:@"%@, (%.2f, %.2f), %lu, %@", v5, v7, v9, v11, v12];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MCTypeInput;
  id v5 = -[MCKeyboardInput copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_characters copyWithZone:a3];
    uint64_t v7 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v6;

    *((_OWORD *)v5 + 3) = self->_point;
    objc_storeStrong((id *)v5 + 5, self->_nearbyKeys);
  }
  return v5;
}

- (MCTypeInput)initWithCharacters:(id)a3 point:(CGPoint)a4 nearbyKeys:(id)a5 sourceKeyboardState:(id)a6
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v11 = a3;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MCTypeInput;
  v13 = [(MCKeyboardInput *)&v17 initWithSourceKeyboardState:a6];
  if (v13)
  {
    if (v11) {
      v14 = (__CFString *)[v11 copy];
    }
    else {
      v14 = &stru_1F3F7A998;
    }
    objc_storeStrong((id *)&v13->_characters, v14);
    if (v11) {

    }
    v13->_point.CGFloat x = x;
    v13->_point.CGFloat y = y;
    if (v12) {
      v15 = (void *)[v12 copy];
    }
    else {
      v15 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v13->_nearbyKeys, v15);
    if (v12) {
  }
    }
  return v13;
}

- (MCTypeInput)initWithCharacters:(id)a3 nearbyKeys:(id)a4
{
  return -[MCTypeInput initWithCharacters:point:nearbyKeys:sourceKeyboardState:](self, "initWithCharacters:point:nearbyKeys:sourceKeyboardState:", a3, a4, 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

@end