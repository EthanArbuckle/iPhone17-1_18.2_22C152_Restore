@interface PIParallaxStyleColorParameter
- (BOOL)isEqualToParallaxStyleParameter:(id)a3;
- (NSNumber)alphaValue;
- (NSNumber)blueValue;
- (NSNumber)greenValue;
- (NSNumber)redValue;
- (PIParallaxStyleColorParameter)init;
- (PIParallaxStyleColorParameter)initWithRed:(id)a3 green:(id)a4 blue:(id)a5 alpha:(id)a6;
- (id)description;
- (id)evaluateWithContext:(id)a3 error:(id *)a4;
- (id)type;
@end

@implementation PIParallaxStyleColorParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaValue, 0);
  objc_storeStrong((id *)&self->_blueValue, 0);
  objc_storeStrong((id *)&self->_greenValue, 0);
  objc_storeStrong((id *)&self->_redValue, 0);
}

- (NSNumber)alphaValue
{
  return self->_alphaValue;
}

- (NSNumber)blueValue
{
  return self->_blueValue;
}

- (NSNumber)greenValue
{
  return self->_greenValue;
}

- (NSNumber)redValue
{
  return self->_redValue;
}

- (id)description
{
  v3 = NSString;
  v4 = [(PIParallaxStyleColorParameter *)self redValue];
  v5 = [(PIParallaxStyleColorParameter *)self greenValue];
  v6 = [(PIParallaxStyleColorParameter *)self blueValue];
  v7 = [(PIParallaxStyleColorParameter *)self alphaValue];
  v8 = [v3 stringWithFormat:@"(R:%@, G:%@, B:%@, A:%@)", v4, v5, v6, v7];

  return v8;
}

- (id)evaluateWithContext:(id)a3 error:(id *)a4
{
  v5 = [(PIParallaxStyleColorParameter *)self redValue];
  [v5 doubleValue];
  double v7 = v6;

  v8 = [(PIParallaxStyleColorParameter *)self greenValue];
  [v8 doubleValue];
  double v10 = v9;

  v11 = [(PIParallaxStyleColorParameter *)self blueValue];
  [v11 doubleValue];
  double v13 = v12;

  v14 = [(PIParallaxStyleColorParameter *)self alphaValue];
  [v14 doubleValue];
  double v16 = v15;

  v17 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE8]);
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F1E008]) initWithRed:v17 green:v7 blue:v10 alpha:v13 colorSpace:v16];
  CGColorSpaceRelease(v17);
  return v18;
}

- (BOOL)isEqualToParallaxStyleParameter:(id)a3
{
  id v4 = a3;
  v5 = [v4 type];
  int v6 = [v5 isEqualToString:@"color"];

  if (v6)
  {
    id v7 = v4;
    v8 = [(PIParallaxStyleColorParameter *)self redValue];
    double v9 = [v7 redValue];
    int v10 = [v8 isEqualToNumber:v9];

    if (!v10) {
      goto LABEL_7;
    }
    v11 = [(PIParallaxStyleColorParameter *)self greenValue];
    double v12 = [v7 greenValue];
    int v13 = [v11 isEqualToNumber:v12];

    if (!v13) {
      goto LABEL_7;
    }
    v14 = [(PIParallaxStyleColorParameter *)self blueValue];
    double v15 = [v7 blueValue];
    int v16 = [v14 isEqualToNumber:v15];

    if (v16)
    {
      v17 = [(PIParallaxStyleColorParameter *)self alphaValue];
      v18 = [v7 alphaValue];
      char v19 = [v17 isEqualToNumber:v18];
    }
    else
    {
LABEL_7:
      char v19 = 0;
    }
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (id)type
{
  return @"color";
}

- (PIParallaxStyleColorParameter)initWithRed:(id)a3 green:(id)a4 blue:(id)a5 alpha:(id)a6
{
  int v10 = (NSNumber *)a3;
  v11 = (NSNumber *)a4;
  double v12 = (NSNumber *)a5;
  int v13 = (NSNumber *)a6;
  v23.receiver = self;
  v23.super_class = (Class)PIParallaxStyleColorParameter;
  v14 = [(PIParallaxStyleColorParameter *)&v23 init];
  redValue = v14->_redValue;
  v14->_redValue = v10;
  int v16 = v10;

  greenValue = v14->_greenValue;
  v14->_greenValue = v11;
  v18 = v11;

  blueValue = v14->_blueValue;
  v14->_blueValue = v12;
  v20 = v12;

  alphaValue = v14->_alphaValue;
  v14->_alphaValue = v13;

  return v14;
}

- (PIParallaxStyleColorParameter)init
{
  return [(PIParallaxStyleColorParameter *)self initWithRed:&unk_1F0009BD8 green:&unk_1F0009BD8 blue:&unk_1F0009BD8 alpha:&unk_1F0009BF0];
}

@end