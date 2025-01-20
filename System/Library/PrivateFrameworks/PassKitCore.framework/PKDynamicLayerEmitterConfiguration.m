@interface PKDynamicLayerEmitterConfiguration
+ (BOOL)supportsSecureCoding;
- (PKDynamicLayerEmitterConfiguration)initWithCoder:(id)a3;
- (PKDynamicLayerEmitterConfiguration)initWithDictionary:(id)a3;
- (float)_emitterBirthrate;
- (float)_emitterScaleWithPixelSize:(CGSize)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)density;
- (unint64_t)physicsEffect;
- (unint64_t)style;
- (void)configureEmitterLayer:(id)a3 withBounds:(CGRect)a4;
- (void)configureEmitterLayer:(id)a3 withImage:(CGImage *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDensity:(unint64_t)a3;
- (void)setPhysicsEffect:(unint64_t)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation PKDynamicLayerEmitterConfiguration

- (PKDynamicLayerEmitterConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v42.receiver = self;
    v42.super_class = (Class)PKDynamicLayerEmitterConfiguration;
    v5 = [(PKDynamicLayerEmitterConfiguration *)&v42 init];
    if (!v5)
    {
LABEL_35:
      self = v5;
      v10 = self;
      goto LABEL_36;
    }
    v6 = [v4 PKStringForKey:@"style"];
    v7 = v6;
    if (v6 == @"twinkling") {
      goto LABEL_6;
    }
    if (!v6) {
      goto LABEL_20;
    }
    char v8 = [(__CFString *)v6 isEqualToString:@"twinkling"];

    if (v8)
    {
LABEL_6:
      uint64_t v9 = 0;
      goto LABEL_21;
    }
    v11 = v7;
    if (v11 == @"falling"
      || (v12 = v11,
          char v13 = [(__CFString *)v11 isEqualToString:@"falling"],
          v12,
          (v13 & 1) != 0))
    {
      uint64_t v9 = 1;
      goto LABEL_21;
    }
    v14 = v12;
    if (v14 == @"blooming"
      || (v15 = v14,
          char v16 = [(__CFString *)v14 isEqualToString:@"blooming"],
          v15,
          (v16 & 1) != 0))
    {
      uint64_t v9 = 2;
      goto LABEL_21;
    }
    v17 = v15;
    if (v17 == @"rising"
      || (v18 = v17,
          char v19 = [(__CFString *)v17 isEqualToString:@"rising"],
          v18,
          (v19 & 1) != 0))
    {
      uint64_t v9 = 3;
      goto LABEL_21;
    }
    v20 = v18;
    if (v20 == @"shooting"
      || (v21 = v20,
          int v22 = [(__CFString *)v20 isEqualToString:@"shooting"],
          v21,
          v22))
    {
      uint64_t v9 = 4;
    }
    else
    {
LABEL_20:
      uint64_t v9 = 5;
    }
LABEL_21:

    v5->_style = v9;
    v23 = [v4 PKStringForKey:@"density"];
    v24 = v23;
    if (v23 == @"low" || v23 == 0) {
      goto LABEL_26;
    }
    char v26 = [(__CFString *)v23 isEqualToString:@"low"];

    if (v26) {
      goto LABEL_26;
    }
    v36 = v24;
    if (v36 == @"medium"
      || (v37 = v36,
          char v38 = [(__CFString *)v36 isEqualToString:@"medium"],
          v37,
          (v38 & 1) != 0))
    {
      uint64_t v27 = 1;
    }
    else
    {
      v39 = v37;
      if (v39 != @"high")
      {
        v40 = v39;
        int v41 = [(__CFString *)v39 isEqualToString:@"high"];

        if (!v41)
        {
LABEL_26:
          uint64_t v27 = 0;
          goto LABEL_27;
        }
      }
      uint64_t v27 = 2;
    }
LABEL_27:

    v5->_density = v27;
    v28 = [v4 PKStringForKey:@"physicsEffect"];
    v29 = v28;
    BOOL v30 = 0;
    if (v28 != @"off" && v28)
    {
      char v31 = [(__CFString *)v28 isEqualToString:@"off"];

      BOOL v30 = 0;
      if ((v31 & 1) == 0)
      {
        v32 = v29;
        if (v32 == @"turbulence"
          || (v33 = v32,
              int v34 = [(__CFString *)v32 isEqualToString:@"turbulence"],
              v33,
              v34))
        {
          BOOL v30 = 1;
        }
      }
    }

    v5->_physicsEffect = v30;
    goto LABEL_35;
  }
  v10 = 0;
LABEL_36:

  return v10;
}

- (void)configureEmitterLayer:(id)a3 withImage:(CGImage *)a4
{
  v45[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4)
  {
    v7 = [MEMORY[0x1E4F39BA8] emitterCell];
    [v7 setContents:a4];
    [(PKDynamicLayerEmitterConfiguration *)self _emitterBirthrate];
    objc_msgSend(v7, "setBirthRate:");
    double Width = (double)CGImageGetWidth(a4);
    -[PKDynamicLayerEmitterConfiguration _emitterScaleWithPixelSize:](self, "_emitterScaleWithPixelSize:", Width, (double)CGImageGetHeight(a4));
    [v7 setScale:v9];
    [v6 setEmitterMode:*MEMORY[0x1E4F39F90]];
    [v6 setEmitterShape:*MEMORY[0x1E4F39F78]];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    switch(self->_style)
    {
      case 0uLL:
        LODWORD(v11) = 3.0;
        [v7 setLifetime:v11];
        LODWORD(v12) = 3.0;
        [v7 setLifetimeRange:v12];
        char v13 = PKCreateDynamicLayerOpacityBehavior(&unk_1EE22B2E8);
        [v10 addObject:v13];

        v45[0] = &unk_1EE22E7E0;
        v14 = NSNumber;
        [v7 scale];
        v15 = objc_msgSend(v14, "numberWithDouble:");
        v45[1] = v15;
        v45[2] = &unk_1EE22E7E0;
        char v16 = (void *)MEMORY[0x1E4F1C978];
        v17 = v45;
        uint64_t v18 = 3;
        goto LABEL_8;
      case 1uLL:
        [v7 setParticleType:*MEMORY[0x1E4F39F38]];
        LODWORD(v19) = 10.0;
        [v7 setLifetime:v19];
        LODWORD(v20) = 2.0;
        [v7 setLifetimeRange:v20];
        [v7 setYAcceleration:5.0];
        [v7 setOrientationRange:180.0];
        [v7 setSpin:4.0];
        [v7 setSpinRange:2.0];
        v15 = PKCreateDynamicLayerOpacityBehavior(&unk_1EE22B300);
        [v10 addObject:v15];
        goto LABEL_11;
      case 2uLL:
        LODWORD(v11) = 4.0;
        [v7 setLifetime:v11];
        LODWORD(v21) = 1.0;
        [v7 setLifetimeRange:v21];
        int v22 = PKCreateDynamicLayerOpacityBehavior(&unk_1EE22B318);
        [v10 addObject:v22];

        v44[0] = &unk_1EE22E7E0;
        v23 = NSNumber;
        [v7 scale];
        v15 = objc_msgSend(v23, "numberWithDouble:");
        v44[1] = v15;
        char v16 = (void *)MEMORY[0x1E4F1C978];
        v17 = v44;
        goto LABEL_7;
      case 3uLL:
        LODWORD(v11) = 4.0;
        [v7 setLifetime:v11];
        LODWORD(v24) = 4.0;
        [v7 setLifetimeRange:v24];
        [v7 setYAcceleration:-10.0];
        v25 = PKCreateDynamicLayerOpacityBehavior(&unk_1EE22B330);
        [v10 addObject:v25];

        v43[0] = &unk_1EE22E7E0;
        char v26 = NSNumber;
        [v7 scale];
        v15 = objc_msgSend(v26, "numberWithDouble:");
        v43[1] = v15;
        char v16 = (void *)MEMORY[0x1E4F1C978];
        v17 = v43;
LABEL_7:
        uint64_t v18 = 2;
LABEL_8:
        uint64_t v27 = [v16 arrayWithObjects:v17 count:v18];
        v28 = PKCreateDynamicLayerScaleBehavior(v27);
        [v10 addObject:v28];
        goto LABEL_10;
      case 4uLL:
        LODWORD(v11) = 5.0;
        [v7 setLifetime:v11];
        LODWORD(v29) = 5.0;
        [v7 setLifetimeRange:v29];
        [v7 setEmissionRange:3.14159265];
        [v7 setVelocity:100.0];
        [v7 setSpinRange:4.0];
        BOOL v30 = PKCreateDynamicLayerOpacityBehavior(&unk_1EE22B348);
        [v10 addObject:v30];

        char v31 = NSNumber;
        [v7 scale];
        v15 = [v31 numberWithDouble:v32 * 0.5];
        v42[0] = v15;
        v33 = NSNumber;
        [v7 scale];
        uint64_t v27 = objc_msgSend(v33, "numberWithDouble:");
        v42[1] = v27;
        v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
        int v34 = PKCreateDynamicLayerScaleBehavior(v28);
        [v10 addObject:v34];

LABEL_10:
LABEL_11:

        break;
      default:
        break;
    }
    if (self->_physicsEffect == 1)
    {
      v35 = [MEMORY[0x1E4F39BA0] behaviorWithType:*MEMORY[0x1E4F39F30]];
      v36 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCAPoint3D:", 10.0, 10.0, 10.0);
      [v35 setValue:v36 forKey:@"force"];

      LODWORD(v37) = 0.25;
      char v38 = [NSNumber numberWithFloat:v37];
      [v35 setValue:v38 forKey:@"frequency"];

      [v10 addObject:v35];
    }
    int v41 = v7;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
    [v6 setEmitterCells:v39];

    v40 = (void *)[v10 copy];
    [v6 setEmitterBehaviors:v40];
  }
}

- (void)configureEmitterLayer:(id)a3 withBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  unint64_t style = self->_style;
  if (style - 2 < 3 || style == 0)
  {
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.double width = width;
    v15.size.double height = height;
    id v13 = v9;
    double MidX = CGRectGetMidX(v15);
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.double width = width;
    v16.size.double height = height;
    objc_msgSend(v13, "setEmitterPosition:", MidX, CGRectGetMidY(v16));
  }
  else
  {
    if (style != 1) {
      goto LABEL_10;
    }
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.double width = width;
    v17.size.double height = height;
    id v13 = v9;
    objc_msgSend(v9, "setEmitterPosition:", CGRectGetMidX(v17), height * -0.2);
    double height = height * 0.4;
  }
  objc_msgSend(v13, "setEmitterSize:", width, height);
  id v9 = v13;
LABEL_10:
}

- (float)_emitterBirthrate
{
  densitCGFloat y = self->_density;
  float result = 0.0;
  if (density <= 2) {
    return flt_191675798[density];
  }
  return result;
}

- (float)_emitterScaleWithPixelSize:(CGSize)a3
{
  densitCGFloat y = self->_density;
  double v4 = 0.0;
  if (density <= 2) {
    double v4 = dbl_1916757A8[density];
  }
  return v4 / fmax(a3.width, a3.height);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDynamicLayerEmitterConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKDynamicLayerEmitterConfiguration;
  v5 = [(PKDynamicLayerEmitterConfiguration *)&v7 init];
  if (v5)
  {
    -[PKDynamicLayerEmitterConfiguration setStyle:](v5, "setStyle:", [v4 decodeIntegerForKey:@"emitterStyle"]);
    -[PKDynamicLayerEmitterConfiguration setDensity:](v5, "setDensity:", [v4 decodeIntegerForKey:@"emitterDensity"]);
    -[PKDynamicLayerEmitterConfiguration setPhysicsEffect:](v5, "setPhysicsEffect:", [v4 decodeIntegerForKey:@"emitterPhysicsEffect"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t style = self->_style;
  id v5 = a3;
  [v5 encodeInteger:style forKey:@"emitterStyle"];
  [v5 encodeInteger:self->_density forKey:@"emitterDensity"];
  [v5 encodeInteger:self->_physicsEffect forKey:@"emitterPhysicsEffect"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[PKDynamicLayerEmitterConfiguration allocWithZone:a3] init];
  *((void *)result + 2) = self->_style;
  *((void *)result + 3) = self->_density;
  *((void *)result + 4) = self->_physicsEffect;
  return result;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_unint64_t style = a3;
}

- (unint64_t)density
{
  return self->_density;
}

- (void)setDensity:(unint64_t)a3
{
  self->_densitCGFloat y = a3;
}

- (unint64_t)physicsEffect
{
  return self->_physicsEffect;
}

- (void)setPhysicsEffect:(unint64_t)a3
{
  self->_physicsEffect = a3;
}

- (void).cxx_destruct
{
}

@end