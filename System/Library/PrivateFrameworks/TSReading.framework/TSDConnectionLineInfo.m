@interface TSDConnectionLineInfo
- (BOOL)canAnchor;
- (CGAffineTransform)computeLayoutFullTransform;
- (Class)layoutClass;
- (Class)repClass;
- (TSDDrawableInfo)connectedFrom;
- (TSDDrawableInfo)connectedTo;
- (id)computeLayoutInfoGeometry;
- (id)copyWithContext:(id)a3;
- (id)presetKind;
- (void)acceptVisitor:(id)a3;
- (void)computeLayoutInfoGeometry:(id *)a3 andPathSource:(id *)a4;
- (void)dealloc;
- (void)didCopy;
- (void)performBlockWithTemporaryLayout:(id)a3;
- (void)setConnectedFrom:(id)a3;
- (void)setConnectedTo:(id)a3;
- (void)willCopyWithOtherDrawables:(id)a3;
@end

@implementation TSDConnectionLineInfo

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDConnectionLineInfo;
  [(TSDShapeInfo *)&v3 dealloc];
}

- (id)copyWithContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSDConnectionLineInfo;
  id v3 = [(TSDShapeInfo *)&v6 copyWithContext:a3];
  v4 = v3;
  if (v3)
  {
    [v3 setConnectedFrom:0];
    [v4 setConnectedTo:0];
  }
  return v4;
}

- (Class)layoutClass
{
  objc_opt_class();
  [(TSDShapeInfo *)self pathSource];
  if ([(id)TSUDynamicCast() type] > 1)
  {
    id v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDConnectionLineInfo layoutClass]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDConnectionLineInfo.m"), 77, @"Wrong connection line path source type.");
  }

  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (id)presetKind
{
  return String;
}

- (void)setConnectedTo:(id)a3
{
  if (a3 == self)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDConnectionLineInfo setConnectedTo:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDConnectionLineInfo.m"), 103, @"attempting to connect a line to itself!");
  }
  if (self->mConnectedTo != a3)
  {
    [(TSPObject *)self willModify];
    [(TSDDrawableInfo *)self willChangeProperty:539];

    self->mConnectedTo = (TSDDrawableInfo *)a3;
  }
}

- (void)setConnectedFrom:(id)a3
{
  if (a3 == self)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDConnectionLineInfo setConnectedFrom:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDConnectionLineInfo.m"), 114, @"attempting to connect a line from itself!");
  }
  if (self->mConnectedFrom != a3)
  {
    [(TSPObject *)self willModify];
    [(TSDDrawableInfo *)self willChangeProperty:540];

    self->mConnectedFrom = (TSDDrawableInfo *)a3;
  }
}

- (id)computeLayoutInfoGeometry
{
  id v3 = 0;
  [(TSDConnectionLineInfo *)self computeLayoutInfoGeometry:&v3 andPathSource:0];
  return v3;
}

- (void)computeLayoutInfoGeometry:(id *)a3 andPathSource:(id *)a4
{
  v7 = (void *)[MEMORY[0x263EFF980] arrayWithObject:self];
  v8 = v7;
  if (self->mConnectedFrom) {
    objc_msgSend(v7, "addObject:");
  }
  if (self->mConnectedTo) {
    objc_msgSend(v8, "addObject:");
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__TSDConnectionLineInfo_computeLayoutInfoGeometry_andPathSource___block_invoke;
  v9[3] = &unk_2646B21B0;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  +[TSDLayoutController temporaryLayoutControllerForInfos:v8 useInBlock:v9];
}

uint64_t __65__TSDConnectionLineInfo_computeLayoutInfoGeometry_andPathSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 layoutForInfo:*(void *)(a1 + 32)];
  uint64_t result = [v3 invalidateConnections];
  if (*(void *)(a1 + 40))
  {
    uint64_t result = [v3 layoutInfoGeometry];
    **(void **)(a1 + 40) = result;
  }
  if (*(void *)(a1 + 48))
  {
    uint64_t result = [v3 pathSource];
    **(void **)(a1 + 48) = result;
  }
  return result;
}

- (CGAffineTransform)computeLayoutFullTransform
{
  uint64_t result = [(TSDConnectionLineInfo *)self computeLayoutInfoGeometry];
  if (result)
  {
    return (CGAffineTransform *)[(CGAffineTransform *)result fullTransform];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  return result;
}

- (BOOL)canAnchor
{
  return 0;
}

- (void)willCopyWithOtherDrawables:(id)a3
{
  id v6 = (id)[a3 mutableCopy];
  if ([v6 count])
  {
    unint64_t v4 = 0;
    do
    {
      v5 = (void *)[v6 objectAtIndex:v4];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(v5, "childInfos"));
      }
      ++v4;
    }
    while (v4 < [v6 count]);
  }
  if (([v6 containsObject:self->mConnectedFrom] & 1) == 0) {
    *(unsigned char *)&self->mInvalidFlags |= 1u;
  }
  if (([v6 containsObject:self->mConnectedTo] & 1) == 0) {
    *(unsigned char *)&self->mInvalidFlags |= 2u;
  }
}

- (void)didCopy
{
  *(unsigned char *)&self->mInvalidFlags &= 0xFCu;
}

- (void)performBlockWithTemporaryLayout:(id)a3
{
  v5 = (void *)[MEMORY[0x263EFF980] arrayWithObject:self];
  id v6 = v5;
  if (self->mConnectedFrom) {
    objc_msgSend(v5, "addObject:");
  }
  if (self->mConnectedTo) {
    objc_msgSend(v6, "addObject:");
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__TSDConnectionLineInfo_performBlockWithTemporaryLayout___block_invoke;
  v7[3] = &unk_2646B1540;
  v7[4] = self;
  v7[5] = a3;
  +[TSDLayoutController temporaryLayoutControllerForInfos:v6 useInBlock:v7];
}

uint64_t __57__TSDConnectionLineInfo_performBlockWithTemporaryLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [a2 layoutForInfo:*(void *)(a1 + 32)];
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v4(v2, v3);
}

- (void)acceptVisitor:(id)a3
{
}

- (TSDDrawableInfo)connectedFrom
{
  return self->mConnectedFrom;
}

- (TSDDrawableInfo)connectedTo
{
  return self->mConnectedTo;
}

@end