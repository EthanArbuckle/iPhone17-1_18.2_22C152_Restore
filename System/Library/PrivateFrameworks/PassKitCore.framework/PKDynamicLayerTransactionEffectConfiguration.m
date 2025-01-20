@interface PKDynamicLayerTransactionEffectConfiguration
+ (BOOL)supportsSecureCoding;
- (PKDynamicLayerTransactionEffectConfiguration)initWithCoder:(id)a3;
- (PKDynamicLayerTransactionEffectConfiguration)initWithDictionary:(id)a3;
- (id)configureTransactionEffectEmitterLayer:(id)a3 withImage:(CGImage *)a4 andEmitterShapeData:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)style;
- (void)configureTransactionEffectEmitterLayer:(id)a3 withBounds:(CGRect)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation PKDynamicLayerTransactionEffectConfiguration

- (PKDynamicLayerTransactionEffectConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_9;
  }
  v10.receiver = self;
  v10.super_class = (Class)PKDynamicLayerTransactionEffectConfiguration;
  self = [(PKDynamicLayerTransactionEffectConfiguration *)&v10 init];
  if (self)
  {
    v5 = [v4 PKStringForKey:@"style"];
    v6 = v5;
    if (v5 == @"zoomedShape"
      || v5
      && (char v7 = [(__CFString *)v5 isEqualToString:@"zoomedShape"],
          v6,
          (v7 & 1) != 0))
    {

      self->_style = 1;
      goto LABEL_7;
    }

LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
LABEL_7:
  self = self;
  v8 = self;
LABEL_10:

  return v8;
}

- (id)configureTransactionEffectEmitterLayer:(id)a3 withImage:(CGImage *)a4 andEmitterShapeData:(id)a5
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  objc_super v10 = v9;
  if (self->_style != 1) {
    goto LABEL_12;
  }
  v11 = 0;
  if (!a4 || !v9) {
    goto LABEL_17;
  }
  uint64_t v12 = CGSVGDocumentCreateFromData();
  if (!v12)
  {
LABEL_12:
    v11 = 0;
    goto LABEL_17;
  }
  v13 = (const void *)v12;
  [v8 setEmitterMode:*MEMORY[0x1E4F39F60]];
  [v8 setEmitterShape:*MEMORY[0x1E4F39F68]];
  [v8 setRenderMode:*MEMORY[0x1E4F39F50]];
  double Width = (double)CGImageGetWidth(a4);
  float v15 = 12.8 / fmax(Width, (double)CGImageGetHeight(a4));
  v16 = [MEMORY[0x1E4F39BA8] emitterCell];
  [v16 setContents:a4];
  [v16 setScale:v15];
  LODWORD(v17) = 2.0;
  [v16 setLifetime:v17];
  LODWORD(v18) = 0.5;
  [v16 setLifetimeRange:v18];
  [v16 setEmissionRange:3.14159265];
  [v16 setVelocity:20.0];
  [v16 setYAcceleration:0.0];
  LODWORD(v19) = 1137180672;
  [v16 setBirthRate:v19];
  CGSVGDocumentGetRootNode();
  CGSVGNodeGetChildAtIndex();
  CGSVGShapeNodeGetPath();
  CGSVGDocumentGetCanvasSize();
  double v21 = v20;
  double v23 = v22;
  CGPath = (const CGPath *)CGSVGPathCreateCGPath();
  memset(&transform, 0, sizeof(transform));
  CGAffineTransformMakeScale(&transform, 1.0 / v21, 1.0 / v23);
  CGMutablePathRef v25 = CGPathCreateMutableCopyByTransformingPath(CGPath, &transform);
  [v8 setEmitterPath:v25];
  if (v25) {
    CFRelease(v25);
  }
  CFRelease(v13);
  if (CGPath) {
    CFRelease(CGPath);
  }
  if ([v8 emitterPath])
  {
    v54[0] = v16;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
    [v8 setEmitterCells:v26];

    [v8 setSeed:arc4random_uniform(0x2710u)];
    CATransform3DMakeScale(&v50, 0.5, 0.5, 0.5);
    [v8 setTransform:&v50];
    [v8 setOpacity:0.0];
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v28 = PKCreateDynamicLayerOpacityBehavior(&unk_1EE22B468);
    [v27 addObject:v28];

    *(float *)&double v29 = v15;
    v30 = [NSNumber numberWithFloat:v29];
    v53[0] = v30;
    v31 = [NSNumber numberWithDouble:v15 / 5.0];
    v53[1] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
    v33 = PKCreateDynamicLayerScaleBehavior(v32);
    [v27 addObject:v33];

    v34 = (void *)[v27 copy];
    [v8 setEmitterBehaviors:v34];

    v35 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
    [v35 setDuration:2.7];
    [v35 setKeyTimes:&unk_1EE22B480];
    [v35 setValues:&unk_1EE22B498];
    v36 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
    [v36 setBeginTime:0.0];
    [v36 setDuration:3.2];
    v37 = (void *)MEMORY[0x1E4F29238];
    if (v8) {
      [v8 transform];
    }
    else {
      memset(v49, 0, sizeof(v49));
    }
    v38 = [v37 valueWithCATransform3D:v49];
    [v36 setFromValue:v38];

    v39 = (void *)MEMORY[0x1E4F29238];
    CATransform3DMakeScale(&v48, 5.0, 5.0, 5.0);
    v40 = [v39 valueWithCATransform3D:&v48];
    [v36 setToValue:v40];

    v41 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
    [v36 setTimingFunction:v41];

    v42 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"birthRate"];
    [v42 setBeginTime:1.0];
    v43 = NSNumber;
    [v8 birthRate];
    v44 = objc_msgSend(v43, "numberWithFloat:");
    [v42 setFromValue:v44];

    v45 = [NSNumber numberWithFloat:0.0];
    [v42 setToValue:v45];

    v11 = [MEMORY[0x1E4F39B38] animation];
    v52[0] = v35;
    v52[1] = v36;
    v52[2] = v42;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:3];
    [v11 setAnimations:v46];

    [v11 setDuration:3.2];
    [v11 setBeginTime:0.1];
    [v11 setBeginTimeMode:*MEMORY[0x1E4F39D98]];
    [v11 setFillMode:*MEMORY[0x1E4F39FA8]];
  }
  else
  {
    v11 = 0;
  }

LABEL_17:
  return v11;
}

- (void)configureTransactionEffectEmitterLayer:(id)a3 withBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.double width = width;
  v11.size.double height = height;
  double MidX = CGRectGetMidX(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.double width = width;
  v12.size.double height = height;
  objc_msgSend(v9, "setEmitterPosition:", MidX, CGRectGetMidY(v12));
  objc_msgSend(v9, "setEmitterSize:", width, height);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDynamicLayerTransactionEffectConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKDynamicLayerTransactionEffectConfiguration;
  v5 = [(PKDynamicLayerTransactionEffectConfiguration *)&v7 init];
  if (v5) {
    -[PKDynamicLayerTransactionEffectConfiguration setStyle:](v5, "setStyle:", [v4 decodeIntegerForKey:@"transactionEffectStyle"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[PKDynamicLayerTransactionEffectConfiguration allocWithZone:a3] init];
  *((void *)result + 1) = self->_style;
  return result;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

@end