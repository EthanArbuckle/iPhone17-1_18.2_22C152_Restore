@interface MTLDebugIntersectionFunctionTable
- (BOOL)purgeableStateValidForRendering;
- (MTLDebugIntersectionFunctionTable)initWithBaseObject:(id)a3 parent:(id)a4;
- (MTLDebugIntersectionFunctionTable)initWithIntersectionFunctionTable:(id)a3 parent:(id)a4 descriptor:(id)a5 pipelineState:(id)a6 stage:(unint64_t)a7;
- (MTLDebugIntersectionFunctionTable)initWithIntersectionFunctionTable:(id)a3 parent:(id)a4 descriptor:(id)a5 stage:(unint64_t)a6;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)functionCount;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (unint64_t)stage;
- (void)dealloc;
- (void)lockPurgeableState;
- (void)setFunction:(id)a3 atIndex:(unint64_t)a4;
- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4;
- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4;
- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4;
- (void)unlockPurgeableState;
@end

@implementation MTLDebugIntersectionFunctionTable

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugIntersectionFunctionTable;
  [(MTLToolsIntersectionFunctionTable *)&v3 dealloc];
}

- (MTLDebugIntersectionFunctionTable)initWithIntersectionFunctionTable:(id)a3 parent:(id)a4 descriptor:(id)a5 stage:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)MTLDebugIntersectionFunctionTable;
  v8 = [(MTLToolsResource *)&v11 initWithBaseObject:a3 parent:a4];
  v9 = v8;
  if (v8)
  {
    atomic_store(0, (unsigned int *)&v8->_purgeableStateToken);
    v8->_purgeableStateHasBeenSet = 0;
    v8->_functionCount = [a5 functionCount];
    v9->_stage = a6;
  }
  return v9;
}

- (MTLDebugIntersectionFunctionTable)initWithIntersectionFunctionTable:(id)a3 parent:(id)a4 descriptor:(id)a5 pipelineState:(id)a6 stage:(unint64_t)a7
{
  v13.receiver = self;
  v13.super_class = (Class)MTLDebugIntersectionFunctionTable;
  v10 = [(MTLToolsResource *)&v13 initWithBaseObject:a3 parent:a4];
  objc_super v11 = v10;
  if (v10)
  {
    atomic_store(0, (unsigned int *)&v10->_purgeableStateToken);
    v10->_purgeableStateHasBeenSet = 0;
    v10->_functionCount = [a5 functionCount];
    v11->_pipelineState = (MTLToolsObject *)a6;
    v11->_stage = a7;
  }
  return v11;
}

- (MTLDebugIntersectionFunctionTable)initWithBaseObject:(id)a3 parent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugIntersectionFunctionTable;
  result = [(MTLToolsResource *)&v5 initWithBaseObject:a3 parent:a4];
  if (result)
  {
    atomic_store(0, (unsigned int *)&result->_purgeableStateToken);
    result->_purgeableStateHasBeenSet = 0;
  }
  return result;
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "heap")) {
    MTLReportFailure();
  }
  if (a3 != 1)
  {
    if (a3 != 2)
    {
      if (atomic_load((unsigned int *)&self->_purgeableStateToken)) {
        MTLReportFailure();
      }
    }
    self->_purgeableStateHasBeenSet = 1;
  }
  id v6 = [(MTLToolsObject *)self baseObject];

  return [v6 setPurgeableState:a3];
}

- (void)lockPurgeableState
{
}

- (void)unlockPurgeableState
{
}

- (BOOL)purgeableStateValidForRendering
{
  return !self->_purgeableStateHasBeenSet
      || [(MTLDebugIntersectionFunctionTable *)self setPurgeableState:1] == 2;
}

- (void)setFunction:(id)a3 atIndex:(unint64_t)a4
{
  if (self->_functionCount <= a4)
  {
    unint64_t v12 = a4;
    unint64_t functionCount = self->_functionCount;
    MTLReportFailure();
    if (!a3) {
      goto LABEL_14;
    }
  }
  else if (!a3)
  {
    goto LABEL_14;
  }
  if (!self->_pipelineState) {
    goto LABEL_14;
  }
  unint64_t stage = self->_stage;
  if (stage && stage != [a3 stage])
  {
    unint64_t v12 = (unint64_t)MTLDebugStageToString([a3 stage]);
    unint64_t functionCount = (unint64_t)MTLDebugStageToString(self->_stage);
    MTLReportFailure();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure();
    }
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  pipelineState = self->_pipelineState;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_14;
    }
    pipelineState = self->_pipelineState;
  }
  -[MTLToolsObject validateHandleForSetFunction:](pipelineState, "validateHandleForSetFunction:", a3, v12, functionCount);
LABEL_14:
  id v10 = [(MTLToolsObject *)self baseObject];
  uint64_t v11 = [a3 baseObject];

  [v10 setFunction:v11 atIndex:a4];
}

- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a4.location + a4.length > self->_functionCount)
  {
    NSUInteger v9 = a4.location + a4.length;
    unint64_t functionCount = self->_functionCount;
    MTLReportFailure();
    if (!length) {
      return;
    }
  }
  else if (!a4.length)
  {
    return;
  }
  do
  {
    uint64_t v8 = (uint64_t)*a3++;
    -[MTLDebugIntersectionFunctionTable setFunction:atIndex:](self, "setFunction:atIndex:", v8, location++, v9, functionCount);
    --length;
  }
  while (length);
}

- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if (self->_functionCount <= a4)
  {
    unint64_t v8 = a4;
    unint64_t functionCount = self->_functionCount;
    MTLReportFailure();
  }
  id v7 = [(MTLToolsObject *)self baseObject];

  [v7 setOpaqueTriangleIntersectionFunctionWithSignature:a3 atIndex:a4];
}

- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a4.location + a4.length > self->_functionCount)
  {
    NSUInteger v9 = a4.location + a4.length;
    unint64_t functionCount = self->_functionCount;
    MTLReportFailure();
  }
  id v8 = [(MTLToolsObject *)self baseObject];

  objc_msgSend(v8, "setOpaqueTriangleIntersectionFunctionWithSignature:withRange:", a3, location, length);
}

- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if (self->_functionCount <= a4)
  {
    unint64_t v8 = a4;
    unint64_t functionCount = self->_functionCount;
    MTLReportFailure();
  }
  id v7 = [(MTLToolsObject *)self baseObject];

  [v7 setOpaqueCurveIntersectionFunctionWithSignature:a3 atIndex:a4];
}

- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a4.location + a4.length > self->_functionCount)
  {
    NSUInteger v9 = a4.location + a4.length;
    unint64_t functionCount = self->_functionCount;
    MTLReportFailure();
  }
  id v8 = [(MTLToolsObject *)self baseObject];

  objc_msgSend(v8, "setOpaqueCurveIntersectionFunctionWithSignature:withRange:", a3, location, length);
}

- (id)formattedDescription:(unint64_t)a3
{
  v9[3] = *MEMORY[0x263EF8340];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  objc_super v5 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTLDebugIntersectionFunctionTable;
  id v6 = [(MTLToolsObject *)&v8 description];
  v9[0] = v4;
  v9[1] = @"functionCount =";
  v9[2] = [NSNumber numberWithUnsignedInteger:self->_functionCount];
  return (id)[v5 stringWithFormat:@"%@%@", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v9, 3), "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLDebugIntersectionFunctionTable *)self formattedDescription:0];
}

- (unint64_t)functionCount
{
  return self->_functionCount;
}

- (unint64_t)stage
{
  return self->_stage;
}

@end