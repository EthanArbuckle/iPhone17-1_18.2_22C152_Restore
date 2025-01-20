@interface SXComponentScrollPosition
+ (BOOL)jsonDictionaryRepresentationIsValid:(id)a3 exactly:(BOOL)a4;
+ (BOOL)supportsSecureCoding;
- (NSString)componentIdentifier;
- (SXComponentScrollPosition)initWithCoder:(id)a3;
- (SXComponentScrollPosition)initWithComponentIdentifier:(id)a3 canvasWidth:(double)a4 relativePageOffset:(double)a5;
- (SXComponentScrollPosition)initWithDictionaryRepresentation:(id)a3 exactly:(BOOL)a4;
- (double)canvasWidth;
- (double)relativePageOffset;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SXComponentScrollPosition

- (SXComponentScrollPosition)initWithComponentIdentifier:(id)a3 canvasWidth:(double)a4 relativePageOffset:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SXComponentScrollPosition;
  v10 = [(SXComponentScrollPosition *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_componentIdentifier, a3);
    v11->_canvasWidth = a4;
    v11->_relativePageOffset = a5;
  }

  return v11;
}

- (SXComponentScrollPosition)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SXComponentScrollPosition;
  v5 = [(SXScrollPosition *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"componentIdentifier"];
    componentIdentifier = v5->_componentIdentifier;
    v5->_componentIdentifier = (NSString *)v6;

    [v4 decodeFloatForKey:@"canvasWidth"];
    v5->_canvasWidth = v8;
    [v4 decodeFloatForKey:@"relativePageOffset"];
    v5->_relativePageOffset = v9;
  }

  return v5;
}

+ (BOOL)jsonDictionaryRepresentationIsValid:(id)a3 exactly:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a4)
  {
    v7 = [v5 allKeys];
    BOOL v8 = [v7 count] == 3;
  }
  else
  {
    v7 = [v5 objectForKeyedSubscript:@"componentIdentifier"];
    if (v7)
    {
      float v9 = [v6 objectForKeyedSubscript:@"canvasWidth"];
      if (v9)
      {
        v10 = [v6 objectForKeyedSubscript:@"relativePageOffset"];
        BOOL v8 = v10 != 0;
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (SXComponentScrollPosition)initWithDictionaryRepresentation:(id)a3 exactly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(id)objc_opt_class() jsonDictionaryRepresentationIsValid:v6 exactly:v4])
  {
    v7 = [v6 objectForKeyedSubscript:@"componentIdentifier"];
    BOOL v8 = [v6 objectForKeyedSubscript:@"canvasWidth"];
    [v8 floatValue];
    double v10 = v9;
    objc_super v11 = [v6 objectForKeyedSubscript:@"relativePageOffset"];
    [v11 floatValue];
    objc_super v13 = [(SXComponentScrollPosition *)self initWithComponentIdentifier:v7 canvasWidth:v10 relativePageOffset:v12];

    self = v13;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)dictionaryRepresentation
{
  v12[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(SXComponentScrollPosition *)self componentIdentifier];
  BOOL v4 = (void *)v3;
  if (v3)
  {
    v12[0] = v3;
    v11[0] = @"componentIdentifier";
    v11[1] = @"canvasWidth";
    id v5 = NSNumber;
    [(SXComponentScrollPosition *)self canvasWidth];
    id v6 = objc_msgSend(v5, "numberWithDouble:");
    v12[1] = v6;
    v11[2] = @"relativePageOffset";
    v7 = NSNumber;
    [(SXComponentScrollPosition *)self relativePageOffset];
    BOOL v8 = objc_msgSend(v7, "numberWithDouble:");
    v12[2] = v8;
    float v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  }
  else
  {
    float v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(SXComponentScrollPosition *)self componentIdentifier];
  [v7 encodeObject:v4 forKey:@"componentIdentifier"];

  [(SXComponentScrollPosition *)self canvasWidth];
  *(float *)&double v5 = v5;
  [v7 encodeFloat:@"canvasWidth" forKey:v5];
  [(SXComponentScrollPosition *)self relativePageOffset];
  *(float *)&double v6 = v6;
  [v7 encodeFloat:@"relativePageOffset" forKey:v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)componentIdentifier
{
  return self->_componentIdentifier;
}

- (double)relativePageOffset
{
  return self->_relativePageOffset;
}

- (double)canvasWidth
{
  return self->_canvasWidth;
}

- (void).cxx_destruct
{
}

@end