@interface NTKComplicationStyle
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NTKComplicationStyle)init;
- (NTKComplicationStyle)initWithCoder:(id)a3;
- (UIColor)circularPlatterColor;
- (id)_initWithStyle:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)fontStyle;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKComplicationStyle

- (NTKComplicationStyle)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKComplicationStyle;
  v2 = [(NTKComplicationStyle *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4FB1618] clearColor];
    circularPlatterColor = v2->_circularPlatterColor;
    v2->_circularPlatterColor = (UIColor *)v3;

    v2->_fontStyle = 0;
  }
  return v2;
}

- (id)_initWithStyle:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKComplicationStyle;
  v5 = [(NTKComplicationStyle *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [*((id *)v4 + 1) copy];
    circularPlatterColor = v5->_circularPlatterColor;
    v5->_circularPlatterColor = (UIColor *)v6;

    v5->_fontStyle = *((void *)v4 + 2);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NTKComplicationStyle allocWithZone:a3];
  return [(NTKComplicationStyle *)v4 _initWithStyle:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[NTKMutableComplicationStyle allocWithZone:a3];
  return [(NTKComplicationStyle *)v4 _initWithStyle:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  circularPlatterColor = self->_circularPlatterColor;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __32__NTKComplicationStyle_isEqual___block_invoke;
  v18[3] = &unk_1E62C2478;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendObject:circularPlatterColor counterpart:v18];
  int64_t fontStyle = self->_fontStyle;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __32__NTKComplicationStyle_isEqual___block_invoke_2;
  v16 = &unk_1E62C24A0;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendInteger:fontStyle counterpart:&v13];
  LOBYTE(fontStyle) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return fontStyle;
}

id __32__NTKComplicationStyle_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

uint64_t __32__NTKComplicationStyle_isEqual___block_invoke_2(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 16);
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_circularPlatterColor];
  id v5 = (id)[v3 appendInteger:self->_fontStyle];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_circularPlatterColor withName:@"circularPlatterColor"];
  id v5 = (id)[v3 appendInteger:self->_fontStyle withName:@"fontStyle"];
  unint64_t v6 = [v3 build];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKComplicationStyle)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKComplicationStyle;
  id v5 = [(NTKComplicationStyle *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"circularPlatterColor"];
    circularPlatterColor = v5->_circularPlatterColor;
    v5->_circularPlatterColor = (UIColor *)v6;

    v5->_int64_t fontStyle = [v4 decodeIntegerForKey:@"fontStyle"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  circularPlatterColor = self->_circularPlatterColor;
  id v5 = a3;
  [v5 encodeObject:circularPlatterColor forKey:@"circularPlatterColor"];
  [v5 encodeInteger:self->_fontStyle forKey:@"fontStyle"];
}

- (UIColor)circularPlatterColor
{
  return self->_circularPlatterColor;
}

- (int64_t)fontStyle
{
  return self->_fontStyle;
}

- (void).cxx_destruct
{
}

@end