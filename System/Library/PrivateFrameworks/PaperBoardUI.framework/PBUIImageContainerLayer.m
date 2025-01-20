@interface PBUIImageContainerLayer
+ (id)layer;
- (CALayer)imageLayer;
- (PBUIImageContainerLayer)init;
- (PBUIImageContainerLayer)initWithCoder:(id)a3;
- (PBUIImageContainerLayer)initWithLayer:(id)a3;
- (id)animationForKey:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSublayers;
- (void)setImageLayer:(id)a3;
@end

@implementation PBUIImageContainerLayer

+ (id)layer
{
  v2 = objc_alloc_init(PBUIImageContainerLayer);
  return v2;
}

- (PBUIImageContainerLayer)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBUIImageContainerLayer;
  v5 = [(PBUIImageContainerLayer *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageLayer"];
    imageLayer = v5->_imageLayer;
    v5->_imageLayer = (CALayer *)v6;

    [(PBUIImageContainerLayer *)v5 addSublayer:v5->_imageLayer];
  }

  return v5;
}

- (id)animationForKey:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PBUIImageContainerLayer;
  id v4 = a3;
  [(PBUIImageContainerLayer *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageLayer, @"imageLayer", v5.receiver, v5.super_class);
}

- (PBUIImageContainerLayer)initWithLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PBUIImageContainerLayer;
  return [(PBUIImageContainerLayer *)&v4 initWithLayer:a3];
}

- (PBUIImageContainerLayer)init
{
  v6.receiver = self;
  v6.super_class = (Class)PBUIImageContainerLayer;
  v2 = [(PBUIImageContainerLayer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F39BE8] layer];
    imageLayer = v2->_imageLayer;
    v2->_imageLayer = (CALayer *)v3;

    [(CALayer *)v2->_imageLayer setName:@"Image Layer"];
    [(CALayer *)v2->_imageLayer setContentsGravity:*MEMORY[0x1E4F3A3D0]];
    [(PBUIImageContainerLayer *)v2 addSublayer:v2->_imageLayer];
  }
  return v2;
}

- (void)layoutSublayers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)PBUIImageContainerLayer;
  [(PBUIImageContainerLayer *)&v14 layoutSublayers];
  imageLayer = self->_imageLayer;
  [(PBUIImageContainerLayer *)self bounds];
  -[CALayer setFrame:](imageLayer, "setFrame:");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v4 = [(PBUIImageContainerLayer *)self sublayers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(CALayer **)(*((void *)&v10 + 1) + 8 * v8);
        if (self->_imageLayer != v9) {
          [(CALayer *)v9 layoutSublayers];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (void)setImageLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end