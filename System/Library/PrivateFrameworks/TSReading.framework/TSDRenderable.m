@interface TSDRenderable
+ (id)renderable;
+ (id)renderableFromLayer:(id)a3;
+ (id)renderablesFromLayers:(id)a3;
- (BOOL)allowsGroupOpacity;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHidden;
- (BOOL)masksToBounds;
- (BOOL)shouldRasterize;
- (BOOL)tsd_tilingSafeHasContents;
- (CALayer)layer;
- (CALayer)mask;
- (CALayer)superlayer;
- (CALayerDelegate)delegate;
- (CGAffineTransform)affineTransform;
- (CGColor)backgroundColor;
- (CGColor)borderColor;
- (CGColor)shadowColor;
- (CGPath)shadowPath;
- (CGPoint)anchorPoint;
- (CGPoint)convertPoint:(CGPoint)a3 fromLayer:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toLayer:(id)a4;
- (CGPoint)position;
- (CGRect)bounds;
- (CGRect)contentsRect;
- (CGRect)frame;
- (CGSize)preferredFrameSize;
- (CGSize)shadowOffset;
- (NSArray)sublayers;
- (NSArray)subrenderables;
- (NSString)contentsGravity;
- (NSString)magnificationFilter;
- (NSString)name;
- (TSDRenderable)initWithCALayer:(id)a3;
- (TSDRenderable)presentationRenderable;
- (double)borderWidth;
- (double)contentsScale;
- (double)cornerRadius;
- (double)rasterizationScale;
- (double)shadowRadius;
- (double)zPosition;
- (float)opacity;
- (float)shadowOpacity;
- (id)animationForKey:(id)a3;
- (id)contents;
- (id)description;
- (unint64_t)hash;
- (unsigned)edgeAntialiasingMask;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)addSublayer:(id)a3;
- (void)addSubrenderable:(id)a3;
- (void)removeAnimationForKey:(id)a3;
- (void)removeFromSuperlayer;
- (void)setAffineTransform:(CGAffineTransform *)a3;
- (void)setAllowsGroupOpacity:(BOOL)a3;
- (void)setAnchorPoint:(CGPoint)a3;
- (void)setBackgroundColor:(CGColor *)a3;
- (void)setBorderColor:(CGColor *)a3;
- (void)setBorderWidth:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContents:(id)a3;
- (void)setContentsGravity:(id)a3;
- (void)setContentsRect:(CGRect)a3;
- (void)setContentsScale:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setEdgeAntialiasingMask:(unsigned int)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIfDifferentFrame:(CGRect)a3 orTransform:(CGAffineTransform *)a4;
- (void)setMagnificationFilter:(id)a3;
- (void)setMask:(id)a3;
- (void)setMaskRenderable:(id)a3;
- (void)setMasksToBounds:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNeedsDisplay;
- (void)setOpacity:(float)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setRasterizationScale:(double)a3;
- (void)setShadowColor:(CGColor *)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setShadowOpacity:(float)a3;
- (void)setShadowPath:(CGPath *)a3;
- (void)setShadowRadius:(double)a3;
- (void)setShouldRasterize:(BOOL)a3;
- (void)setSublayers:(id)a3;
- (void)setSubrenderables:(id)a3;
- (void)setZPosition:(double)a3;
@end

@implementation TSDRenderable

- (TSDRenderable)initWithCALayer:(id)a3
{
  id v5 = a3;
  if ((-[TSDRenderable isMemberOfClass:](self, "isMemberOfClass:", objc_msgSend((id)objc_opt_class(), "tsd_renderableClass")) & 1) == 0)
  {
    v6 = [MEMORY[0x263F7C7F0] currentHandler];
    v7 = [NSString stringWithUTF8String:"-[TSDRenderable initWithCALayer:]"];
    v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRenderable.m"];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v6 handleFailureInFunction:v7, v8, 30, @"Wrong renderable class (%@) for layer class (%@)!", v10, v12 file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)TSDRenderable;
  v13 = [(TSDRenderable *)&v16 init];
  v14 = v13;
  if (v13) {
    objc_storeStrong((id *)&v13->_layer, a3);
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TSDRenderable *)a3;
  if (v4 == self)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [(CALayer *)self->_layer isEqual:v4->_layer];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(CALayer *)self->_layer hash];
}

+ (id)renderableFromLayer:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "tsd_renderableClass")), "initWithCALayer:", v3);

  return v4;
}

+ (id)renderable
{
  id v2 = objc_alloc((Class)a1);
  id v3 = [MEMORY[0x263F157E8] layer];
  v4 = (void *)[v2 initWithCALayer:v3];

  return v4;
}

+ (id)renderablesFromLayers:(id)a3
{
  return (id)objc_msgSend(a3, "tsu_arrayByMappingObjectsUsingBlock:", &__block_literal_global_49);
}

id __39__TSDRenderable_renderablesFromLayers___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[TSDRenderable renderableFromLayer:a2];
}

- (id)description
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  v6 = [(TSDRenderable *)self layer];
  v7 = [v3 stringWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

- (void)addSubrenderable:(id)a3
{
  id v4 = a3;
  id v6 = [(TSDRenderable *)self layer];
  char v5 = [v4 layer];

  [v6 addSublayer:v5];
}

- (void)setSubrenderables:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    char v5 = [MEMORY[0x263EFF980] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "layer", (void)v14);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    v12 = [(TSDRenderable *)self layer];
    [v12 setSublayers:v5];
  }
  else
  {
    v13 = [(TSDRenderable *)self layer];
    [v13 setSublayers:0];
  }
}

- (NSArray)subrenderables
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(TSDRenderable *)self layer];
  char v5 = [v4 sublayers];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = +[TSDRenderable renderableFromLayer:*(void *)(*((void *)&v14 + 1) + 8 * v9)];
        [v3 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  if ([v3 count]) {
    v11 = v3;
  }
  else {
    v11 = 0;
  }
  v12 = v11;

  return v12;
}

- (void)setMaskRenderable:(id)a3
{
  id v5 = [a3 layer];
  id v4 = [(TSDRenderable *)self layer];
  [v4 setMask:v5];
}

- (TSDRenderable)presentationRenderable
{
  id v3 = [(TSDRenderable *)self layer];
  id v4 = [v3 presentationLayer];

  if (v4)
  {
    id v5 = [(TSDRenderable *)self layer];
    uint64_t v6 = [v5 presentationLayer];
    uint64_t v7 = +[TSDRenderable renderableFromLayer:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (TSDRenderable *)v7;
}

- (CALayerDelegate)delegate
{
  id v2 = [(TSDRenderable *)self layer];
  id v3 = [v2 delegate];

  return (CALayerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(TSDRenderable *)self layer];
  [v5 setDelegate:v4];
}

- (id)contents
{
  id v2 = [(TSDRenderable *)self layer];
  id v3 = [v2 contents];

  return v3;
}

- (void)setContents:(id)a3
{
  id v4 = a3;
  id v5 = [(TSDRenderable *)self layer];
  [v5 setContents:v4];
}

- (CALayer)superlayer
{
  id v2 = [(TSDRenderable *)self layer];
  id v3 = [v2 superlayer];

  return (CALayer *)v3;
}

- (NSArray)sublayers
{
  id v2 = [(TSDRenderable *)self layer];
  id v3 = [v2 sublayers];

  return (NSArray *)v3;
}

- (void)setSublayers:(id)a3
{
  id v4 = a3;
  id v5 = [(TSDRenderable *)self layer];
  [v5 setSublayers:v4];
}

- (CGPoint)anchorPoint
{
  id v2 = [(TSDRenderable *)self layer];
  [v2 anchorPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(TSDRenderable *)self layer];
  objc_msgSend(v5, "setAnchorPoint:", x, y);
}

- (CALayer)mask
{
  id v2 = [(TSDRenderable *)self layer];
  double v3 = [v2 mask];

  return (CALayer *)v3;
}

- (void)setMask:(id)a3
{
  id v4 = a3;
  id v5 = [(TSDRenderable *)self layer];
  [v5 setMask:v4];
}

- (BOOL)isHidden
{
  id v2 = [(TSDRenderable *)self layer];
  char v3 = [v2 isHidden];

  return v3;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TSDRenderable *)self layer];
  [v4 setHidden:v3];
}

- (float)opacity
{
  id v2 = [(TSDRenderable *)self layer];
  [v2 opacity];
  float v4 = v3;

  return v4;
}

- (void)setOpacity:(float)a3
{
  id v5 = [(TSDRenderable *)self layer];
  *(float *)&double v4 = a3;
  [v5 setOpacity:v4];
}

- (CGRect)bounds
{
  id v2 = [(TSDRenderable *)self layer];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(TSDRenderable *)self layer];
  objc_msgSend(v7, "setBounds:", x, y, width, height);
}

- (CGRect)frame
{
  id v2 = [(TSDRenderable *)self layer];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(TSDRenderable *)self layer];
  objc_msgSend(v7, "setFrame:", x, y, width, height);
}

- (CGPoint)position
{
  id v2 = [(TSDRenderable *)self layer];
  [v2 position];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(TSDRenderable *)self layer];
  objc_msgSend(v5, "setPosition:", x, y);
}

- (CGAffineTransform)affineTransform
{
  double v4 = [(TSDRenderable *)self layer];
  if (v4)
  {
    double v6 = v4;
    [v4 affineTransform];
    double v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (void)setAffineTransform:(CGAffineTransform *)a3
{
  double v3 = [(TSDRenderable *)self layer];
  [v3 setAffineTransform:&v4];
}

- (double)contentsScale
{
  id v2 = [(TSDRenderable *)self layer];
  [v2 contentsScale];
  double v4 = v3;

  return v4;
}

- (void)setContentsScale:(double)a3
{
  id v4 = [(TSDRenderable *)self layer];
  [v4 setContentsScale:a3];
}

- (CGColor)backgroundColor
{
  id v2 = [(TSDRenderable *)self layer];
  double v3 = (CGColor *)[v2 backgroundColor];

  return v3;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  id v4 = [(TSDRenderable *)self layer];
  [v4 setBackgroundColor:a3];
}

- (double)cornerRadius
{
  id v2 = [(TSDRenderable *)self layer];
  [v2 cornerRadius];
  double v4 = v3;

  return v4;
}

- (void)setCornerRadius:(double)a3
{
  id v4 = [(TSDRenderable *)self layer];
  [v4 setCornerRadius:a3];
}

- (unsigned)edgeAntialiasingMask
{
  id v2 = [(TSDRenderable *)self layer];
  unsigned int v3 = [v2 edgeAntialiasingMask];

  return v3;
}

- (void)setEdgeAntialiasingMask:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(TSDRenderable *)self layer];
  [v4 setEdgeAntialiasingMask:v3];
}

- (double)borderWidth
{
  id v2 = [(TSDRenderable *)self layer];
  [v2 borderWidth];
  double v4 = v3;

  return v4;
}

- (void)setBorderWidth:(double)a3
{
  id v4 = [(TSDRenderable *)self layer];
  [v4 setBorderWidth:a3];
}

- (CGColor)borderColor
{
  id v2 = [(TSDRenderable *)self layer];
  double v3 = (CGColor *)[v2 borderColor];

  return v3;
}

- (void)setBorderColor:(CGColor *)a3
{
  id v4 = [(TSDRenderable *)self layer];
  [v4 setBorderColor:a3];
}

- (NSString)name
{
  id v2 = [(TSDRenderable *)self layer];
  double v3 = [v2 name];

  return (NSString *)v3;
}

- (void)setName:(id)a3
{
  id v4 = a3;
  id v5 = [(TSDRenderable *)self layer];
  [v5 setName:v4];
}

- (CGRect)contentsRect
{
  id v2 = [(TSDRenderable *)self layer];
  [v2 contentsRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)setContentsRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(TSDRenderable *)self layer];
  objc_msgSend(v7, "setContentsRect:", x, y, width, height);
}

- (BOOL)allowsGroupOpacity
{
  id v2 = [(TSDRenderable *)self layer];
  char v3 = [v2 allowsGroupOpacity];

  return v3;
}

- (void)setAllowsGroupOpacity:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TSDRenderable *)self layer];
  [v4 setAllowsGroupOpacity:v3];
}

- (BOOL)masksToBounds
{
  id v2 = [(TSDRenderable *)self layer];
  char v3 = [v2 masksToBounds];

  return v3;
}

- (void)setMasksToBounds:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TSDRenderable *)self layer];
  [v4 setMasksToBounds:v3];
}

- (NSString)magnificationFilter
{
  id v2 = [(TSDRenderable *)self layer];
  BOOL v3 = [v2 magnificationFilter];

  return (NSString *)v3;
}

- (void)setMagnificationFilter:(id)a3
{
  id v4 = a3;
  id v5 = [(TSDRenderable *)self layer];
  [v5 setMagnificationFilter:v4];
}

- (double)zPosition
{
  id v2 = [(TSDRenderable *)self layer];
  [v2 zPosition];
  double v4 = v3;

  return v4;
}

- (void)setZPosition:(double)a3
{
  id v4 = [(TSDRenderable *)self layer];
  [v4 setZPosition:a3];
}

- (NSString)contentsGravity
{
  id v2 = [(TSDRenderable *)self layer];
  double v3 = [v2 contentsGravity];

  return (NSString *)v3;
}

- (void)setContentsGravity:(id)a3
{
  id v4 = a3;
  id v5 = [(TSDRenderable *)self layer];
  [v5 setContentsGravity:v4];
}

- (CGColor)shadowColor
{
  id v2 = [(TSDRenderable *)self layer];
  double v3 = (CGColor *)[v2 shadowColor];

  return v3;
}

- (void)setShadowColor:(CGColor *)a3
{
  id v4 = [(TSDRenderable *)self layer];
  [v4 setShadowColor:a3];
}

- (float)shadowOpacity
{
  id v2 = [(TSDRenderable *)self layer];
  [v2 shadowOpacity];
  float v4 = v3;

  return v4;
}

- (void)setShadowOpacity:(float)a3
{
  id v5 = [(TSDRenderable *)self layer];
  *(float *)&double v4 = a3;
  [v5 setShadowOpacity:v4];
}

- (CGSize)shadowOffset
{
  id v2 = [(TSDRenderable *)self layer];
  [v2 shadowOffset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)setShadowOffset:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(TSDRenderable *)self layer];
  objc_msgSend(v5, "setShadowOffset:", width, height);
}

- (double)shadowRadius
{
  id v2 = [(TSDRenderable *)self layer];
  [v2 shadowRadius];
  double v4 = v3;

  return v4;
}

- (void)setShadowRadius:(double)a3
{
  id v4 = [(TSDRenderable *)self layer];
  [v4 setShadowRadius:a3];
}

- (CGPath)shadowPath
{
  id v2 = [(TSDRenderable *)self layer];
  double v3 = (CGPath *)[v2 shadowPath];

  return v3;
}

- (void)setShadowPath:(CGPath *)a3
{
  id v4 = [(TSDRenderable *)self layer];
  [v4 setShadowPath:a3];
}

- (BOOL)shouldRasterize
{
  id v2 = [(TSDRenderable *)self layer];
  char v3 = [v2 shouldRasterize];

  return v3;
}

- (void)setShouldRasterize:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TSDRenderable *)self layer];
  [v4 setShouldRasterize:v3];
}

- (double)rasterizationScale
{
  id v2 = [(TSDRenderable *)self layer];
  [v2 rasterizationScale];
  double v4 = v3;

  return v4;
}

- (void)setRasterizationScale:(double)a3
{
  id v4 = [(TSDRenderable *)self layer];
  [v4 setRasterizationScale:a3];
}

- (CGSize)preferredFrameSize
{
  id v2 = [(TSDRenderable *)self layer];
  [v2 preferredFrameSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (BOOL)tsd_tilingSafeHasContents
{
  id v2 = [(TSDRenderable *)self layer];
  char v3 = [v2 tilingSafeHasContents];

  return v3;
}

- (void)removeFromSuperlayer
{
  id v2 = [(TSDRenderable *)self layer];
  [v2 removeFromSuperlayer];
}

- (void)setNeedsDisplay
{
  id v2 = [(TSDRenderable *)self layer];
  [v2 setNeedsDisplay];
}

- (void)addSublayer:(id)a3
{
  id v4 = a3;
  id v5 = [(TSDRenderable *)self layer];
  [v5 addSublayer:v4];
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TSDRenderable *)self layer];
  [v8 addAnimation:v7 forKey:v6];
}

- (id)animationForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(TSDRenderable *)self layer];
  id v6 = [v5 animationForKey:v4];

  return v6;
}

- (void)removeAnimationForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(TSDRenderable *)self layer];
  [v5 removeAnimationForKey:v4];
}

- (BOOL)containsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(TSDRenderable *)self layer];
  char v6 = objc_msgSend(v5, "containsPoint:", x, y);

  return v6;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromLayer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(TSDRenderable *)self layer];
  objc_msgSend(v8, "convertPoint:fromLayer:", v7, x, y);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toLayer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(TSDRenderable *)self layer];
  objc_msgSend(v8, "convertPoint:toLayer:", v7, x, y);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (void)setIfDifferentFrame:(CGRect)a3 orTransform:(CGAffineTransform *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v9 = [(TSDRenderable *)self layer];
  long long v10 = *(_OWORD *)&a4->c;
  v11[0] = *(_OWORD *)&a4->a;
  v11[1] = v10;
  v11[2] = *(_OWORD *)&a4->tx;
  objc_msgSend(v9, "setIfDifferentFrame:orTransform:", v11, x, y, width, height);
}

- (CALayer)layer
{
  return self->_layer;
}

- (void).cxx_destruct
{
}

@end