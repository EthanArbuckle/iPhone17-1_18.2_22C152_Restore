@interface TSDTextureContext
+ (TSDTextureContext)contextWithSession:(id)a3;
+ (TSDTextureContext)contextWithTextureContext:(id)a3;
+ (id)context;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMagicMove;
- (BOOL)shouldAddFinal;
- (BOOL)shouldAddMagicMoveObjectOnly;
- (BOOL)shouldAddReversedFinal;
- (BOOL)shouldDistortToFit;
- (BOOL)shouldForceTextureGeneration;
- (BOOL)shouldNotAddContainedReps;
- (BOOL)shouldNotAddShapeAttributes;
- (BOOL)shouldNotAddText;
- (BOOL)shouldNotCacheTexture;
- (BOOL)shouldSeparateReflection;
- (BOOL)shouldSeparateShadow;
- (BOOL)shouldSeparateStroke;
- (BOOL)shouldSeparateText;
- (TSDAnimationSession)session;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)reset;
- (void)setIsMagicMove:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)setShouldAddFinal:(BOOL)a3;
- (void)setShouldAddMagicMoveObjectOnly:(BOOL)a3;
- (void)setShouldAddReversedFinal:(BOOL)a3;
- (void)setShouldDistortToFit:(BOOL)a3;
- (void)setShouldForceTextureGeneration:(BOOL)a3;
- (void)setShouldNotAddContainedReps:(BOOL)a3;
- (void)setShouldNotAddShapeAttributes:(BOOL)a3;
- (void)setShouldNotAddText:(BOOL)a3;
- (void)setShouldNotCacheTexture:(BOOL)a3;
- (void)setShouldSeparateReflection:(BOOL)a3;
- (void)setShouldSeparateShadow:(BOOL)a3;
- (void)setShouldSeparateStroke:(BOOL)a3;
- (void)setShouldSeparateText:(BOOL)a3;
@end

@implementation TSDTextureContext

+ (id)context
{
  v2 = objc_alloc_init(TSDTextureContext);

  return v2;
}

+ (TSDTextureContext)contextWithSession:(id)a3
{
  v4 = objc_alloc_init(TSDTextureContext);
  [(TSDTextureContext *)v4 setSession:a3];

  return v4;
}

+ (TSDTextureContext)contextWithTextureContext:(id)a3
{
  v3 = (void *)[a3 copy];

  return (TSDTextureContext *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[TSDTextureContext allocWithZone:a3] init];
  [(TSDTextureContext *)v4 setSession:[(TSDTextureContext *)self session]];
  [(TSDTextureContext *)v4 setIsMagicMove:[(TSDTextureContext *)self isMagicMove]];
  [(TSDTextureContext *)v4 setShouldAddFinal:[(TSDTextureContext *)self shouldAddFinal]];
  [(TSDTextureContext *)v4 setShouldAddMagicMoveObjectOnly:[(TSDTextureContext *)self shouldAddMagicMoveObjectOnly]];
  [(TSDTextureContext *)v4 setShouldAddReversedFinal:[(TSDTextureContext *)self shouldAddReversedFinal]];
  [(TSDTextureContext *)v4 setShouldDistortToFit:[(TSDTextureContext *)self shouldDistortToFit]];
  [(TSDTextureContext *)v4 setShouldNotAddContainedReps:[(TSDTextureContext *)self shouldNotAddContainedReps]];
  [(TSDTextureContext *)v4 setShouldNotAddShapeAttributes:[(TSDTextureContext *)self shouldNotAddShapeAttributes]];
  [(TSDTextureContext *)v4 setShouldNotAddText:[(TSDTextureContext *)self shouldNotAddText]];
  [(TSDTextureContext *)v4 setShouldNotCacheTexture:[(TSDTextureContext *)self shouldNotCacheTexture]];
  [(TSDTextureContext *)v4 setShouldSeparateReflection:[(TSDTextureContext *)self shouldSeparateReflection]];
  [(TSDTextureContext *)v4 setShouldSeparateShadow:[(TSDTextureContext *)self shouldSeparateShadow]];
  [(TSDTextureContext *)v4 setShouldSeparateStroke:[(TSDTextureContext *)self shouldSeparateStroke]];
  [(TSDTextureContext *)v4 setShouldSeparateText:[(TSDTextureContext *)self shouldSeparateText]];
  [(TSDTextureContext *)v4 setShouldForceTextureGeneration:[(TSDTextureContext *)self shouldForceTextureGeneration]];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = [(TSDTextureContext *)self session];
  if (v5 != (TSDAnimationSession *)[a3 session]) {
    return 0;
  }
  int v6 = [(TSDTextureContext *)self isMagicMove];
  if (v6 != [a3 isMagicMove]) {
    return 0;
  }
  int v7 = [(TSDTextureContext *)self shouldAddFinal];
  if (v7 != [a3 shouldAddFinal]) {
    return 0;
  }
  int v8 = [(TSDTextureContext *)self shouldAddMagicMoveObjectOnly];
  if (v8 != [a3 shouldAddMagicMoveObjectOnly]) {
    return 0;
  }
  int v9 = [(TSDTextureContext *)self shouldAddReversedFinal];
  if (v9 != [a3 shouldAddReversedFinal]) {
    return 0;
  }
  int v10 = [(TSDTextureContext *)self shouldDistortToFit];
  if (v10 != [a3 shouldDistortToFit]) {
    return 0;
  }
  int v11 = [(TSDTextureContext *)self shouldNotAddContainedReps];
  if (v11 != [a3 shouldNotAddContainedReps]) {
    return 0;
  }
  int v12 = [(TSDTextureContext *)self shouldNotAddShapeAttributes];
  if (v12 != [a3 shouldNotAddShapeAttributes]) {
    return 0;
  }
  int v13 = [(TSDTextureContext *)self shouldNotAddText];
  if (v13 != [a3 shouldNotAddText]) {
    return 0;
  }
  int v14 = [(TSDTextureContext *)self shouldNotCacheTexture];
  if (v14 != [a3 shouldNotCacheTexture]) {
    return 0;
  }
  int v15 = [(TSDTextureContext *)self shouldSeparateReflection];
  if (v15 != [a3 shouldSeparateReflection]) {
    return 0;
  }
  int v16 = [(TSDTextureContext *)self shouldSeparateShadow];
  if (v16 != [a3 shouldSeparateShadow]) {
    return 0;
  }
  int v17 = [(TSDTextureContext *)self shouldSeparateStroke];
  if (v17 != [a3 shouldSeparateStroke]) {
    return 0;
  }
  int v18 = [(TSDTextureContext *)self shouldSeparateText];
  if (v18 != [a3 shouldSeparateText]) {
    return 0;
  }
  BOOL v20 = [(TSDTextureContext *)self shouldForceTextureGeneration];
  return v20 ^ [a3 shouldForceTextureGeneration] ^ 1;
}

- (id)description
{
  v3 = objc_opt_new();
  if ([(TSDTextureContext *)self isMagicMove]) {
    [v3 addObject:@"isMagicMove"];
  }
  if ([(TSDTextureContext *)self shouldAddFinal]) {
    [v3 addObject:@"shouldAddFinal"];
  }
  if ([(TSDTextureContext *)self shouldAddMagicMoveObjectOnly]) {
    [v3 addObject:@"shouldAddMagicMoveObjectOnly"];
  }
  if ([(TSDTextureContext *)self shouldAddReversedFinal]) {
    [v3 addObject:@"shouldAddReversedFinal"];
  }
  if ([(TSDTextureContext *)self shouldDistortToFit]) {
    [v3 addObject:@"shouldDistortToFit"];
  }
  if ([(TSDTextureContext *)self shouldForceTextureGeneration]) {
    [v3 addObject:@"shouldForceTextureGeneration"];
  }
  if ([(TSDTextureContext *)self shouldNotAddContainedReps]) {
    [v3 addObject:@"shouldNotAddContainedReps"];
  }
  if ([(TSDTextureContext *)self shouldNotAddShapeAttributes]) {
    [v3 addObject:@"shouldNotAddShapeAttributes"];
  }
  if ([(TSDTextureContext *)self shouldNotAddText]) {
    [v3 addObject:@"shouldNotAddText"];
  }
  if ([(TSDTextureContext *)self shouldNotCacheTexture]) {
    [v3 addObject:@"shouldNotCacheTexture"];
  }
  if ([(TSDTextureContext *)self shouldSeparateReflection]) {
    [v3 addObject:@"shouldSeparateReflection"];
  }
  if ([(TSDTextureContext *)self shouldSeparateShadow]) {
    [v3 addObject:@"shouldSeparateShadow"];
  }
  if ([(TSDTextureContext *)self shouldSeparateStroke]) {
    [v3 addObject:@"shouldSeparateStroke"];
  }
  if ([(TSDTextureContext *)self shouldSeparateText]) {
    [v3 addObject:@"shouldSeparateText"];
  }
  v6.receiver = self;
  v6.super_class = (Class)TSDTextureContext;
  v4 = (void *)[NSString stringWithFormat:@"%@: {%@}", -[TSDTextureContext description](&v6, sel_description), objc_msgSend(v3, "componentsJoinedByString:", @","];

  return v4;
}

- (unint64_t)hash
{
  unint64_t v3 = [(TSDTextureContext *)self session];
  uint64_t v4 = [(TSDTextureContext *)self isMagicMove];
  BOOL v5 = [(TSDTextureContext *)self shouldAddFinal];
  uint64_t v6 = 2;
  if (!v5) {
    uint64_t v6 = 0;
  }
  uint64_t v7 = v6 | v4;
  if ([(TSDTextureContext *)self shouldAddMagicMoveObjectOnly]) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = 0;
  }
  BOOL v9 = [(TSDTextureContext *)self shouldAddReversedFinal];
  uint64_t v10 = 8;
  if (!v9) {
    uint64_t v10 = 0;
  }
  uint64_t v11 = v7 | v8 | v10;
  if ([(TSDTextureContext *)self shouldDistortToFit]) {
    uint64_t v12 = 16;
  }
  else {
    uint64_t v12 = 0;
  }
  BOOL v13 = [(TSDTextureContext *)self shouldForceTextureGeneration];
  uint64_t v14 = 32;
  if (!v13) {
    uint64_t v14 = 0;
  }
  uint64_t v15 = v12 | v14;
  BOOL v16 = [(TSDTextureContext *)self shouldNotAddContainedReps];
  uint64_t v17 = 64;
  if (!v16) {
    uint64_t v17 = 0;
  }
  uint64_t v18 = v11 | v15 | v17;
  if ([(TSDTextureContext *)self shouldNotAddShapeAttributes]) {
    uint64_t v19 = 128;
  }
  else {
    uint64_t v19 = 0;
  }
  BOOL v20 = [(TSDTextureContext *)self shouldNotAddText];
  uint64_t v21 = 256;
  if (!v20) {
    uint64_t v21 = 0;
  }
  uint64_t v22 = v19 | v21;
  BOOL v23 = [(TSDTextureContext *)self shouldNotCacheTexture];
  uint64_t v24 = 512;
  if (!v23) {
    uint64_t v24 = 0;
  }
  uint64_t v25 = v22 | v24;
  BOOL v26 = [(TSDTextureContext *)self shouldSeparateReflection];
  uint64_t v27 = 1024;
  if (!v26) {
    uint64_t v27 = 0;
  }
  uint64_t v28 = v18 | v25 | v27;
  if ([(TSDTextureContext *)self shouldSeparateShadow]) {
    uint64_t v29 = 2048;
  }
  else {
    uint64_t v29 = 0;
  }
  BOOL v30 = [(TSDTextureContext *)self shouldSeparateStroke];
  uint64_t v31 = 4096;
  if (!v30) {
    uint64_t v31 = 0;
  }
  uint64_t v32 = v29 | v31;
  BOOL v33 = [(TSDTextureContext *)self shouldSeparateText];
  uint64_t v34 = 0x2000;
  if (!v33) {
    uint64_t v34 = 0;
  }
  return (v28 | v32 | v34) ^ v3;
}

- (void)reset
{
  self->_session = 0;
  *(void *)&self->_isMagicMove = 0;
  *(void *)&self->_shouldNotAddText = 0;
}

- (TSDAnimationSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  self->_session = (TSDAnimationSession *)a3;
}

- (BOOL)isMagicMove
{
  return self->_isMagicMove;
}

- (void)setIsMagicMove:(BOOL)a3
{
  self->_isMagicMove = a3;
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

- (BOOL)shouldAddReversedFinal
{
  return self->_shouldAddReversedFinal;
}

- (void)setShouldAddReversedFinal:(BOOL)a3
{
  self->_shouldAddReversedFinal = a3;
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

- (BOOL)shouldNotCacheTexture
{
  return self->_shouldNotCacheTexture;
}

- (void)setShouldNotCacheTexture:(BOOL)a3
{
  self->_shouldNotCacheTexture = a3;
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

@end