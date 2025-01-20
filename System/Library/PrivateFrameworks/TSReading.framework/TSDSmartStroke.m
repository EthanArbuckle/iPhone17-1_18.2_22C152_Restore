@interface TSDSmartStroke
+ (Class)classForName:(id)a3;
+ (id)strokeWithName:(id)a3 color:(id)a4 width:(double)a5;
- (BOOL)canApplyDirectlyToRepRenderable;
- (BOOL)canDrawWithOtherStroke:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAntialiasDefeat;
- (NSString)strokeName;
- (TSDSmartStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 cap:(int)a6 join:(int)a7 pattern:(id)a8;
- (TSDSmartStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 cap:(int)a6 join:(int)a7 pattern:(id)a8 miterLimit:(double)a9;
- (double)deprecatedPatternOffsetDistance;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)mixingTypeWithObject:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation TSDSmartStroke

- (NSString)strokeName
{
  return self->mStrokeName;
}

+ (Class)classForName:(id)a3
{
  v7[6] = *MEMORY[0x263EF8340];
  v7[0] = @"Chalk2";
  v7[1] = @"Dry Brush";
  v7[2] = @"Feathered Brush";
  v7[3] = @"Pen";
  v7[4] = @"Pencil";
  v7[5] = @"Crayon";
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v7, 6), "containsObject:", a3) & 1) == 0)
  {
    v6 = @"Calligraphy";
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v6, 1), "containsObject:", a3) & 1) == 0)
    {
      v5 = @"Doodles";
      objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v5, 1), "containsObject:", a3);
    }
  }
  return (Class)objc_opt_class();
}

+ (id)strokeWithName:(id)a3 color:(id)a4 width:(double)a5
{
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:color:width:cap:join:pattern:miterLimit:", a3, a4, 0, 0, +[TSDStrokePattern solidPattern](TSDStrokePattern, "solidPattern"), a5, 4.0);

  return v5;
}

- (TSDSmartStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 cap:(int)a6 join:(int)a7 pattern:(id)a8 miterLimit:(double)a9
{
  v12.receiver = self;
  v12.super_class = (Class)TSDSmartStroke;
  v10 = [(TSDStroke *)&v12 initWithColor:a4 width:*(void *)&a6 cap:*(void *)&a7 join:a8 pattern:a5 miterLimit:a9];
  if (v10) {
    v10->mStrokeName = (NSString *)[a3 copy];
  }
  return v10;
}

- (TSDSmartStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 cap:(int)a6 join:(int)a7 pattern:(id)a8
{
  return [(TSDSmartStroke *)self initWithName:a3 color:a4 width:*(void *)&a6 cap:*(void *)&a7 join:a8 pattern:a5 miterLimit:4.0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDSmartStroke;
  [(TSDSmartStroke *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSDSmartStroke copyWithZone:]"];
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSmartStroke.mm"];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v4 handleFailureInFunction:v5, v6, 101, @"%@ is an abstract superclass. Subclasses must inherit %@", v8, NSStringFromSelector(a2) file lineNumber description];
  return 0;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSDSmartStroke mutableCopyWithZone:]"];
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSmartStroke.mm"];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v4 handleFailureInFunction:v5, v6, 106, @"%@ is an abstract superclass. Subclasses must inherit %@", v8, NSStringFromSelector(a2) file lineNumber description];
  return 0;
}

- (BOOL)canApplyDirectlyToRepRenderable
{
  return ![(TSDStroke *)self shouldRender];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    uint64_t v5 = v4;
    LODWORD(v4) = objc_msgSend((id)objc_msgSend(v4, "strokeName"), "isEqualToString:", -[TSDSmartStroke strokeName](self, "strokeName"));
    if (v4)
    {
      v7.receiver = self;
      v7.super_class = (Class)TSDSmartStroke;
      LOBYTE(v4) = [(TSDStroke *)&v7 isEqual:v5];
    }
  }
  return (char)v4;
}

- (BOOL)canDrawWithOtherStroke:(id)a3
{
  objc_opt_class();
  uint64_t v4 = TSUDynamicCast();
  if (v4)
  {
    LOBYTE(v4) = [(TSDSmartStroke *)self isEqual:v4];
  }
  return v4;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)TSDSmartStroke;
  unint64_t v3 = [(TSDStroke *)&v5 hash];
  return [(NSString *)self->mStrokeName hash] ^ v3;
}

- (BOOL)shouldAntialiasDefeat
{
  return 0;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TSDSmartStroke;
  id v4 = -[TSDStroke mixingTypeWithObject:](&v9, sel_mixingTypeWithObject_);
  objc_opt_class();
  uint64_t v5 = TSUDynamicCast();
  if (!v5) {
    return 2;
  }
  uint64_t v6 = (void *)v5;
  objc_super v7 = [(TSDSmartStroke *)self strokeName];
  if (v7 != (NSString *)[v6 strokeName]
    && !-[NSString isEqualToString:](-[TSDSmartStroke strokeName](self, "strokeName"), "isEqualToString:", [v6 strokeName]))
  {
    return TSDMixingTypeBestFromMixingTypes((uint64_t)v4, 2);
  }
  return (int64_t)v4;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  objc_opt_class();
  uint64_t v6 = (TSDSmartStroke *)TSUDynamicCast();
  if (!v6)
  {
    objc_super v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDSmartStroke mixedObjectWithFraction:ofObject:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSmartStroke.mm"), 168, @"nil object after cast");
  }
  id v9 = objc_alloc((Class)objc_opt_class());
  v10 = [(TSDSmartStroke *)self strokeName];
  uint64_t v11 = [(TSUColor *)[(TSDStroke *)self color] blendedColorWithFraction:[(TSDStroke *)v6 color] ofColor:a3];
  [(TSDStroke *)self width];
  [(TSDStroke *)v6 width];
  TSUMix();
  double v13 = v12;
  if (a3 >= 0.5) {
    v14 = v6;
  }
  else {
    v14 = self;
  }
  uint64_t v15 = [(TSDStroke *)v14 cap];
  uint64_t v16 = [(TSDStroke *)v14 join];
  uint64_t v17 = TSDMixingMixedObjectWithFractionEx([(TSDStroke *)self pattern], (unint64_t)[(TSDStroke *)v6 pattern], a3);
  [(TSDStroke *)self miterLimit];
  [(TSDStroke *)v6 miterLimit];
  TSUMix();
  v19 = (void *)[v9 initWithName:v10 color:v11 width:v15 cap:v16 join:v17 pattern:v13 miterLimit:v18];

  return v19;
}

- (double)deprecatedPatternOffsetDistance
{
  return self->mDeprecatedPatternOffsetDistance;
}

@end