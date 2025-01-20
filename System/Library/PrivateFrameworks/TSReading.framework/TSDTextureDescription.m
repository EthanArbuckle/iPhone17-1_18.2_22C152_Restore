@interface TSDTextureDescription
+ (TSDTextureDescription)descriptionWithSession:(id)a3;
+ (TSDTextureDescription)descriptionWithTextureDescription:(id)a3;
- (BOOL)includesActionBuilds;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMagicMove;
- (BOOL)shouldAddFinal;
- (BOOL)shouldAddMagicMoveObjectOnly;
- (BOOL)shouldAddMasks;
- (BOOL)shouldAddParameterizedStroke;
- (BOOL)shouldDistortToFit;
- (BOOL)shouldForceTextureGeneration;
- (BOOL)shouldIgnoreScaleInSourceImage;
- (BOOL)shouldNotAddContainedReps;
- (BOOL)shouldNotAddShapeAttributes;
- (BOOL)shouldNotAddText;
- (BOOL)shouldReverseStrokeDrawing;
- (BOOL)shouldSeparateGroupedTextures;
- (BOOL)shouldSeparateReflection;
- (BOOL)shouldSeparateShadow;
- (BOOL)shouldSeparateStroke;
- (BOOL)shouldSeparateText;
- (TSDAnimationSession)session;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)byGlyphStyle;
- (unint64_t)deliveryStyle;
- (unint64_t)hash;
- (unint64_t)stage;
- (void)reset;
- (void)setByGlyphStyle:(int)a3;
- (void)setDeliveryStyle:(unint64_t)a3;
- (void)setIncludesActionBuilds:(BOOL)a3;
- (void)setIsMagicMove:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)setShouldAddFinal:(BOOL)a3;
- (void)setShouldAddMagicMoveObjectOnly:(BOOL)a3;
- (void)setShouldAddMasks:(BOOL)a3;
- (void)setShouldAddParameterizedStroke:(BOOL)a3;
- (void)setShouldDistortToFit:(BOOL)a3;
- (void)setShouldForceTextureGeneration:(BOOL)a3;
- (void)setShouldIgnoreScaleInSourceImage:(BOOL)a3;
- (void)setShouldNotAddContainedReps:(BOOL)a3;
- (void)setShouldNotAddShapeAttributes:(BOOL)a3;
- (void)setShouldNotAddText:(BOOL)a3;
- (void)setShouldReverseStrokeDrawing:(BOOL)a3;
- (void)setShouldSeparateGroupedTextures:(BOOL)a3;
- (void)setShouldSeparateReflection:(BOOL)a3;
- (void)setShouldSeparateShadow:(BOOL)a3;
- (void)setShouldSeparateStroke:(BOOL)a3;
- (void)setShouldSeparateText:(BOOL)a3;
- (void)setStage:(unint64_t)a3;
@end

@implementation TSDTextureDescription

+ (TSDTextureDescription)descriptionWithSession:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(TSDTextureDescription);
  [(TSDTextureDescription *)v4 setSession:v3];
  [(TSDTextureDescription *)v4 setStage:0];
  [(TSDTextureDescription *)v4 setDeliveryStyle:0];
  [(TSDTextureDescription *)v4 setByGlyphStyle:0];
  uint64_t v5 = [v3 shouldForceTextureGeneration];

  [(TSDTextureDescription *)v4 setShouldForceTextureGeneration:v5];

  return v4;
}

+ (TSDTextureDescription)descriptionWithTextureDescription:(id)a3
{
  id v3 = (void *)[a3 copy];

  return (TSDTextureDescription *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[TSDTextureDescription allocWithZone:a3] init];
  uint64_t v5 = [(TSDTextureDescription *)self session];
  [(TSDTextureDescription *)v4 setSession:v5];

  [(TSDTextureDescription *)v4 setIsMagicMove:[(TSDTextureDescription *)self isMagicMove]];
  [(TSDTextureDescription *)v4 setIncludesActionBuilds:[(TSDTextureDescription *)self includesActionBuilds]];
  [(TSDTextureDescription *)v4 setShouldAddFinal:[(TSDTextureDescription *)self shouldAddFinal]];
  [(TSDTextureDescription *)v4 setShouldAddMagicMoveObjectOnly:[(TSDTextureDescription *)self shouldAddMagicMoveObjectOnly]];
  [(TSDTextureDescription *)v4 setShouldAddMasks:[(TSDTextureDescription *)self shouldAddMasks]];
  [(TSDTextureDescription *)v4 setShouldDistortToFit:[(TSDTextureDescription *)self shouldDistortToFit]];
  [(TSDTextureDescription *)v4 setShouldNotAddContainedReps:[(TSDTextureDescription *)self shouldNotAddContainedReps]];
  [(TSDTextureDescription *)v4 setShouldNotAddShapeAttributes:[(TSDTextureDescription *)self shouldNotAddShapeAttributes]];
  [(TSDTextureDescription *)v4 setShouldNotAddText:[(TSDTextureDescription *)self shouldNotAddText]];
  [(TSDTextureDescription *)v4 setShouldSeparateReflection:[(TSDTextureDescription *)self shouldSeparateReflection]];
  [(TSDTextureDescription *)v4 setShouldSeparateShadow:[(TSDTextureDescription *)self shouldSeparateShadow]];
  [(TSDTextureDescription *)v4 setShouldSeparateStroke:[(TSDTextureDescription *)self shouldSeparateStroke]];
  [(TSDTextureDescription *)v4 setShouldAddParameterizedStroke:[(TSDTextureDescription *)self shouldAddParameterizedStroke]];
  [(TSDTextureDescription *)v4 setShouldSeparateGroupedTextures:[(TSDTextureDescription *)self shouldSeparateGroupedTextures]];
  [(TSDTextureDescription *)v4 setShouldReverseStrokeDrawing:[(TSDTextureDescription *)self shouldReverseStrokeDrawing]];
  [(TSDTextureDescription *)v4 setShouldSeparateText:[(TSDTextureDescription *)self shouldSeparateText]];
  [(TSDTextureDescription *)v4 setShouldForceTextureGeneration:[(TSDTextureDescription *)self shouldForceTextureGeneration]];
  [(TSDTextureDescription *)v4 setShouldIgnoreScaleInSourceImage:[(TSDTextureDescription *)self shouldIgnoreScaleInSourceImage]];
  [(TSDTextureDescription *)v4 setStage:[(TSDTextureDescription *)self stage]];
  [(TSDTextureDescription *)v4 setDeliveryStyle:[(TSDTextureDescription *)self deliveryStyle]];
  [(TSDTextureDescription *)v4 setByGlyphStyle:[(TSDTextureDescription *)self byGlyphStyle]];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v6 = [(TSDTextureDescription *)self session];
    v7 = [v5 session];
    if (v6 != v7) {
      goto LABEL_26;
    }
    int v8 = [(TSDTextureDescription *)self isMagicMove];
    if (v8 != [v5 isMagicMove]) {
      goto LABEL_26;
    }
    int v9 = [(TSDTextureDescription *)self includesActionBuilds];
    if (v9 != [v5 includesActionBuilds]) {
      goto LABEL_26;
    }
    int v10 = [(TSDTextureDescription *)self shouldAddFinal];
    if (v10 != [v5 shouldAddFinal]) {
      goto LABEL_26;
    }
    int v11 = [(TSDTextureDescription *)self shouldAddMagicMoveObjectOnly];
    if (v11 != [v5 shouldAddMagicMoveObjectOnly]) {
      goto LABEL_26;
    }
    int v12 = [(TSDTextureDescription *)self shouldAddMasks];
    if (v12 != [v5 shouldAddMasks]) {
      goto LABEL_26;
    }
    int v13 = [(TSDTextureDescription *)self shouldDistortToFit];
    if (v13 != [v5 shouldDistortToFit]) {
      goto LABEL_26;
    }
    int v14 = [(TSDTextureDescription *)self shouldNotAddContainedReps];
    if (v14 != [v5 shouldNotAddContainedReps]) {
      goto LABEL_26;
    }
    int v15 = [(TSDTextureDescription *)self shouldNotAddShapeAttributes];
    if (v15 != [v5 shouldNotAddShapeAttributes]) {
      goto LABEL_26;
    }
    int v16 = [(TSDTextureDescription *)self shouldNotAddText];
    if (v16 != [v5 shouldNotAddText]) {
      goto LABEL_26;
    }
    int v17 = [(TSDTextureDescription *)self shouldSeparateReflection];
    if (v17 != [v5 shouldSeparateReflection]) {
      goto LABEL_26;
    }
    int v18 = [(TSDTextureDescription *)self shouldSeparateShadow];
    if (v18 != [v5 shouldSeparateShadow]) {
      goto LABEL_26;
    }
    int v19 = [(TSDTextureDescription *)self shouldSeparateStroke];
    if (v19 != [v5 shouldSeparateStroke]) {
      goto LABEL_26;
    }
    int v20 = [(TSDTextureDescription *)self shouldAddParameterizedStroke];
    if (v20 != [v5 shouldAddParameterizedStroke]) {
      goto LABEL_26;
    }
    int v21 = [(TSDTextureDescription *)self shouldSeparateGroupedTextures];
    if (v21 == [v5 shouldSeparateGroupedTextures]
      && (int v22 = [(TSDTextureDescription *)self shouldReverseStrokeDrawing],
          v22 == [v5 shouldReverseStrokeDrawing])
      && (int v23 = [(TSDTextureDescription *)self shouldSeparateText],
          v23 == [v5 shouldSeparateText])
      && (int v24 = [(TSDTextureDescription *)self shouldForceTextureGeneration],
          v24 == [v5 shouldForceTextureGeneration])
      && (int v25 = [(TSDTextureDescription *)self shouldIgnoreScaleInSourceImage],
          v25 == [v5 shouldIgnoreScaleInSourceImage])
      && (unint64_t v26 = -[TSDTextureDescription stage](self, "stage"), v26 == [v5 stage])
      && (unint64_t v27 = -[TSDTextureDescription deliveryStyle](self, "deliveryStyle"), v27 == [v5 deliveryStyle]))
    {
      int v28 = [(TSDTextureDescription *)self byGlyphStyle];
      BOOL v29 = v28 == [v5 byGlyphStyle];
    }
    else
    {
LABEL_26:
      BOOL v29 = 0;
    }
  }
  else
  {
    BOOL v29 = 0;
  }

  return v29;
}

- (id)description
{
  id v3 = objc_opt_new();
  if ([(TSDTextureDescription *)self isMagicMove]) {
    [v3 addObject:@"isMagicMove"];
  }
  if ([(TSDTextureDescription *)self includesActionBuilds]) {
    [v3 addObject:@"_includesActionBuilds"];
  }
  if ([(TSDTextureDescription *)self shouldAddFinal]) {
    [v3 addObject:@"shouldAddFinal"];
  }
  if ([(TSDTextureDescription *)self shouldAddMagicMoveObjectOnly]) {
    [v3 addObject:@"shouldAddMagicMoveObjectOnly"];
  }
  if ([(TSDTextureDescription *)self shouldAddMasks]) {
    [v3 addObject:@"shouldAddMasks"];
  }
  if ([(TSDTextureDescription *)self shouldDistortToFit]) {
    [v3 addObject:@"shouldDistortToFit"];
  }
  if ([(TSDTextureDescription *)self shouldForceTextureGeneration]) {
    [v3 addObject:@"shouldForceTextureGeneration"];
  }
  if ([(TSDTextureDescription *)self shouldNotAddContainedReps]) {
    [v3 addObject:@"shouldNotAddContainedReps"];
  }
  if ([(TSDTextureDescription *)self shouldNotAddShapeAttributes]) {
    [v3 addObject:@"shouldNotAddShapeAttributes"];
  }
  if ([(TSDTextureDescription *)self shouldNotAddText]) {
    [v3 addObject:@"shouldNotAddText"];
  }
  if ([(TSDTextureDescription *)self shouldSeparateReflection]) {
    [v3 addObject:@"shouldSeparateReflection"];
  }
  if ([(TSDTextureDescription *)self shouldSeparateShadow]) {
    [v3 addObject:@"shouldSeparateShadow"];
  }
  if ([(TSDTextureDescription *)self shouldSeparateStroke]) {
    [v3 addObject:@"shouldSeparateStroke"];
  }
  if ([(TSDTextureDescription *)self shouldAddParameterizedStroke]) {
    [v3 addObject:@"shouldAddParameterizedStroke"];
  }
  if ([(TSDTextureDescription *)self shouldSeparateGroupedTextures]) {
    [v3 addObject:@"shouldSeparateGroupedTextures"];
  }
  if ([(TSDTextureDescription *)self shouldReverseStrokeDrawing]) {
    [v3 addObject:@"shouldReverseStrokeDrawing"];
  }
  if ([(TSDTextureDescription *)self shouldSeparateText]) {
    [v3 addObject:@"shouldSeparateText"];
  }
  if ([(TSDTextureDescription *)self shouldIgnoreScaleInSourceImage]) {
    [v3 addObject:@"shouldIgnoreScaleInSourceImage"];
  }
  if ([(TSDTextureDescription *)self deliveryStyle])
  {
    id v4 = objc_msgSend(NSString, "stringWithFormat:", @"tds: %ld", -[TSDTextureDescription deliveryStyle](self, "deliveryStyle"));
    [v3 addObject:v4];
  }
  if ([(TSDTextureDescription *)self byGlyphStyle])
  {
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"glyph: %ld", -[TSDTextureDescription byGlyphStyle](self, "byGlyphStyle"));
    [v3 addObject:v5];
  }
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"stage: %ld", -[TSDTextureDescription stage](self, "stage"));
  [v3 addObject:v6];

  v7 = [(TSDTextureDescription *)self session];

  if (v7)
  {
    int v8 = NSString;
    int v9 = [(TSDTextureDescription *)self session];
    int v10 = objc_msgSend(v8, "stringWithFormat:", @"session: %p", v9);
    [v3 addObject:v10];
  }
  int v11 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)TSDTextureDescription;
  int v12 = [(TSDTextureDescription *)&v16 description];
  int v13 = [v3 componentsJoinedByString:@","];
  int v14 = [v11 stringWithFormat:@"%@: {%@}", v12, v13];

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TSDTextureDescription *)self session];
  uint64_t v4 = [(TSDTextureDescription *)self isMagicMove];
  BOOL v5 = [(TSDTextureDescription *)self shouldAddMagicMoveObjectOnly];
  uint64_t v6 = 2;
  if (!v5) {
    uint64_t v6 = 0;
  }
  uint64_t v7 = v6 | v4;
  if ([(TSDTextureDescription *)self shouldDistortToFit]) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = 0;
  }
  BOOL v9 = [(TSDTextureDescription *)self shouldForceTextureGeneration];
  uint64_t v10 = 8;
  if (!v9) {
    uint64_t v10 = 0;
  }
  uint64_t v11 = v7 | v8 | v10;
  if ([(TSDTextureDescription *)self shouldNotAddContainedReps]) {
    uint64_t v12 = 16;
  }
  else {
    uint64_t v12 = 0;
  }
  BOOL v13 = [(TSDTextureDescription *)self shouldNotAddShapeAttributes];
  uint64_t v14 = 32;
  if (!v13) {
    uint64_t v14 = 0;
  }
  uint64_t v15 = v12 | v14;
  BOOL v16 = [(TSDTextureDescription *)self shouldNotAddText];
  uint64_t v17 = 64;
  if (!v16) {
    uint64_t v17 = 0;
  }
  uint64_t v18 = v11 | v15 | v17;
  if ([(TSDTextureDescription *)self shouldSeparateReflection]) {
    uint64_t v19 = 128;
  }
  else {
    uint64_t v19 = 0;
  }
  BOOL v20 = [(TSDTextureDescription *)self shouldSeparateShadow];
  uint64_t v21 = 256;
  if (!v20) {
    uint64_t v21 = 0;
  }
  uint64_t v22 = v19 | v21;
  BOOL v23 = [(TSDTextureDescription *)self shouldSeparateStroke];
  uint64_t v24 = 512;
  if (!v23) {
    uint64_t v24 = 0;
  }
  uint64_t v25 = v22 | v24;
  BOOL v26 = [(TSDTextureDescription *)self shouldAddParameterizedStroke];
  uint64_t v27 = 1024;
  if (!v26) {
    uint64_t v27 = 0;
  }
  uint64_t v28 = v18 | v25 | v27;
  if ([(TSDTextureDescription *)self shouldReverseStrokeDrawing]) {
    uint64_t v29 = 2048;
  }
  else {
    uint64_t v29 = 0;
  }
  BOOL v30 = [(TSDTextureDescription *)self shouldSeparateText];
  uint64_t v31 = 4096;
  if (!v30) {
    uint64_t v31 = 0;
  }
  uint64_t v32 = v29 | v31;
  BOOL v33 = [(TSDTextureDescription *)self shouldIgnoreScaleInSourceImage];
  uint64_t v34 = 0x2000;
  if (!v33) {
    uint64_t v34 = 0;
  }
  uint64_t v35 = v32 | v34;
  BOOL v36 = [(TSDTextureDescription *)self shouldAddMasks];
  uint64_t v37 = 0x4000;
  if (!v36) {
    uint64_t v37 = 0;
  }
  uint64_t v38 = v35 | v37;
  BOOL v39 = [(TSDTextureDescription *)self shouldAddFinal];
  uint64_t v40 = 0x8000;
  if (!v39) {
    uint64_t v40 = 0;
  }
  uint64_t v41 = v28 | v38 | v40;
  BOOL v42 = [(TSDTextureDescription *)self includesActionBuilds];
  uint64_t v43 = 0x10000;
  if (!v42) {
    uint64_t v43 = 0;
  }
  unint64_t v44 = v41 | v43 | ([(TSDTextureDescription *)self deliveryStyle] << 17);
  unint64_t v45 = v44 | ((unint64_t)[(TSDTextureDescription *)self byGlyphStyle] << 19);
  BOOL v46 = [(TSDTextureDescription *)self shouldSeparateGroupedTextures];
  uint64_t v47 = 0x200000;
  if (!v46) {
    uint64_t v47 = 0;
  }
  unint64_t v48 = (v45 | v47 | ([(TSDTextureDescription *)self stage] << 22)) ^ v3;

  return v48;
}

- (void)reset
{
  self->_byGlyphStyle = 0;
  *(void *)&self->_isMagicMove = 0;
  *(void *)&self->_shouldSeparateReflection = 0;
  *(_WORD *)&self->_shouldDistortToFit = 0;
  self->_stage = 0;
  self->_deliveryStyle = 0;
}

- (TSDAnimationSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  return (TSDAnimationSession *)WeakRetained;
}

- (void)setSession:(id)a3
{
}

- (BOOL)isMagicMove
{
  return self->_isMagicMove;
}

- (void)setIsMagicMove:(BOOL)a3
{
  self->_isMagicMove = a3;
}

- (BOOL)includesActionBuilds
{
  return self->_includesActionBuilds;
}

- (void)setIncludesActionBuilds:(BOOL)a3
{
  self->_includesActionBuilds = a3;
}

- (BOOL)shouldAddFinal
{
  return self->_shouldAddFinal;
}

- (void)setShouldAddFinal:(BOOL)a3
{
  self->_shouldAddFinal = a3;
}

- (BOOL)shouldAddMagicMoveObjectOnly
{
  return self->_shouldAddMagicMoveObjectOnly;
}

- (void)setShouldAddMagicMoveObjectOnly:(BOOL)a3
{
  self->_shouldAddMagicMoveObjectOnly = a3;
}

- (BOOL)shouldAddMasks
{
  return self->_shouldAddMasks;
}

- (void)setShouldAddMasks:(BOOL)a3
{
  self->_shouldAddMasks = a3;
}

- (BOOL)shouldDistortToFit
{
  return self->_shouldDistortToFit;
}

- (void)setShouldDistortToFit:(BOOL)a3
{
  self->_shouldDistortToFit = a3;
}

- (BOOL)shouldNotAddContainedReps
{
  return self->_shouldNotAddContainedReps;
}

- (void)setShouldNotAddContainedReps:(BOOL)a3
{
  self->_shouldNotAddContainedReps = a3;
}

- (BOOL)shouldNotAddShapeAttributes
{
  return self->_shouldAddNoShapeAttributes;
}

- (void)setShouldNotAddShapeAttributes:(BOOL)a3
{
  self->_shouldAddNoShapeAttributes = a3;
}

- (BOOL)shouldNotAddText
{
  return self->_shouldNotAddText;
}

- (void)setShouldNotAddText:(BOOL)a3
{
  self->_shouldNotAddText = a3;
}

- (BOOL)shouldSeparateReflection
{
  return self->_shouldSeparateReflection;
}

- (void)setShouldSeparateReflection:(BOOL)a3
{
  self->_shouldSeparateReflection = a3;
}

- (BOOL)shouldSeparateShadow
{
  return self->_shouldSeparateShadow;
}

- (void)setShouldSeparateShadow:(BOOL)a3
{
  self->_shouldSeparateShadow = a3;
}

- (BOOL)shouldSeparateStroke
{
  return self->_shouldSeparateStroke;
}

- (void)setShouldSeparateStroke:(BOOL)a3
{
  self->_shouldSeparateStroke = a3;
}

- (BOOL)shouldAddParameterizedStroke
{
  return self->_shouldAddParameterizedStroke;
}

- (void)setShouldAddParameterizedStroke:(BOOL)a3
{
  self->_shouldAddParameterizedStroke = a3;
}

- (BOOL)shouldReverseStrokeDrawing
{
  return self->_shouldReverseStrokeDrawing;
}

- (void)setShouldReverseStrokeDrawing:(BOOL)a3
{
  self->_shouldReverseStrokeDrawing = a3;
}

- (BOOL)shouldSeparateGroupedTextures
{
  return self->_shouldSeparateGroupedTextures;
}

- (void)setShouldSeparateGroupedTextures:(BOOL)a3
{
  self->_shouldSeparateGroupedTextures = a3;
}

- (BOOL)shouldSeparateText
{
  return self->_shouldSeparateText;
}

- (void)setShouldSeparateText:(BOOL)a3
{
  self->_shouldSeparateText = a3;
}

- (BOOL)shouldForceTextureGeneration
{
  return self->_shouldForceTextureGeneration;
}

- (void)setShouldForceTextureGeneration:(BOOL)a3
{
  self->_shouldForceTextureGeneration = a3;
}

- (BOOL)shouldIgnoreScaleInSourceImage
{
  return self->_shouldIgnoreScaleInSourceImage;
}

- (void)setShouldIgnoreScaleInSourceImage:(BOOL)a3
{
  self->_shouldIgnoreScaleInSourceImage = a3;
}

- (unint64_t)stage
{
  return self->_stage;
}

- (void)setStage:(unint64_t)a3
{
  self->_stage = a3;
}

- (unint64_t)deliveryStyle
{
  return self->_deliveryStyle;
}

- (void)setDeliveryStyle:(unint64_t)a3
{
  self->_deliveryStyle = a3;
}

- (int)byGlyphStyle
{
  return self->_byGlyphStyle;
}

- (void)setByGlyphStyle:(int)a3
{
  self->_byGlyphStyle = a3;
}

- (void).cxx_destruct
{
}

@end