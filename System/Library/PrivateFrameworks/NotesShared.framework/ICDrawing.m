@interface ICDrawing
+ (CGAffineTransform)defaultSizeOrientationTransform:(SEL)a3;
+ (CGAffineTransform)orientationTransform:(SEL)a3 size:(int64_t)a4;
+ (CGSize)defaultPixelSize;
+ (CGSize)defaultSize;
+ (CGSize)fullSize:(CGSize)result forOrientation:(int64_t)a4;
+ (void)sortCommands:(id)a3;
- (BOOL)canChangeTransientOrientation;
- (BOOL)setTransientOrientation:(int64_t)a3;
- (CGAffineTransform)orientationTransform;
- (CGRect)bounds;
- (CGRect)calculateCommandBounds;
- (CGRect)commandBounds;
- (CGRect)fullBounds;
- (CGRect)unrotatedBoundsInCommandSpace;
- (CGSize)fullSize;
- (CGSize)unrotatedSize;
- (ICDrawing)init;
- (ICDrawing)initWithArchive:(const void *)a3 version:(unsigned int)a4 replicaID:(id)a5;
- (ICDrawing)initWithCommands:(id)a3 fromDrawing:(id)a4;
- (ICDrawing)initWithData:(id)a3 replicaID:(id)a4;
- (ICDrawing)initWithData:(id)a3 version:(unsigned int)a4 replicaID:(id)a5;
- (ICDrawing)initWithDrawing:(id)a3;
- (ICDrawing)initWithReplicaID:(id)a3;
- (ICDrawingCommandID)commandIDForNewCommand;
- (ICTTVectorMultiTimestamp)timestamp;
- (NSDate)orientationTimestamp;
- (NSOrderedSet)commands;
- (NSOrderedSet)visibleCommands;
- (NSUUID)replicaUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)insertNewTestCommand;
- (id)mutableCommands;
- (id)serializeWithPathData:(BOOL)a3;
- (id)serializeWithPathData:(BOOL)a3 toVersion:(unsigned int *)a4;
- (id)setCommand:(id)a3 hidden:(BOOL)a4;
- (id)visibleCommandForInsertingCommand:(id)a3;
- (int64_t)imageOrientation;
- (int64_t)orientation;
- (unint64_t)mergeWithDrawing:(id)a3;
- (unsigned)saveToArchive:(void *)a3 withPathData:(BOOL)a4;
- (void)addNewCommand:(id)a3;
- (void)invalidateBounds;
- (void)setCommandIDForInsertion:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientationTimestamp:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setUnrotatedBoundsInCommandSpace:(CGRect)a3;
- (void)setUnrotatedSize:(CGSize)a3;
- (void)sortCommands;
- (void)takeOrientationFrom:(id)a3;
@end

@implementation ICDrawing

- (ICDrawing)init
{
  return 0;
}

- (ICDrawing)initWithReplicaID:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICDrawing;
  v6 = [(ICDrawing *)&v18 init];
  if (v6)
  {
    v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    commands = v6->_commands;
    v6->_commands = v7;

    objc_storeStrong((id *)&v6->_replicaUUID, a3);
    v9 = [[ICTTVectorMultiTimestamp alloc] initWithCapacity:2];
    timestamp = v6->_timestamp;
    v6->_timestamp = v9;

    v6->_orientation = 0;
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] distantPast];
    orientationTimestamp = v6->_orientationTimestamp;
    v6->_orientationTimestamp = (NSDate *)v11;

    CGPoint v13 = (CGPoint)*MEMORY[0x1E4F1DB20];
    CGSize v14 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v6->_unrotatedBoundsInCommandSpace.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v6->_unrotatedBoundsInCommandSpace.size = v14;
    v6->_commandBounds.origin = v13;
    v6->_commandBounds.size = v14;
    +[ICDrawing defaultSize];
    v6->_unrotatedSize.width = v15;
    v6->_unrotatedSize.height = v16;
  }

  return v6;
}

- (ICDrawing)initWithDrawing:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ICDrawing;
  id v5 = [(ICDrawing *)&v27 init];
  if (v5)
  {
    v6 = [v4 commands];
    uint64_t v7 = [v6 mutableCopy];
    commands = v5->_commands;
    v5->_commands = (NSMutableOrderedSet *)v7;

    uint64_t v9 = [v4 replicaUUID];
    replicaUUID = v5->_replicaUUID;
    v5->_replicaUUID = (NSUUID *)v9;

    uint64_t v11 = [v4 timestamp];
    uint64_t v12 = [v11 copy];
    timestamp = v5->_timestamp;
    v5->_timestamp = (ICTTVectorMultiTimestamp *)v12;

    v5->_orientation = [v4 orientation];
    uint64_t v14 = [v4 orientationTimestamp];
    orientationTimestamp = v5->_orientationTimestamp;
    v5->_orientationTimestamp = (NSDate *)v14;

    [v4 unrotatedBoundsInCommandSpace];
    v5->_unrotatedBoundsInCommandSpace.origin.x = v16;
    v5->_unrotatedBoundsInCommandSpace.origin.y = v17;
    v5->_unrotatedBoundsInCommandSpace.size.width = v18;
    v5->_unrotatedBoundsInCommandSpace.size.height = v19;
    [v4 commandBounds];
    v5->_commandBounds.origin.x = v20;
    v5->_commandBounds.origin.y = v21;
    v5->_commandBounds.size.width = v22;
    v5->_commandBounds.size.height = v23;
    [v4 unrotatedSize];
    v5->_unrotatedSize.width = v24;
    v5->_unrotatedSize.height = v25;
  }

  return v5;
}

- (ICDrawing)initWithCommands:(id)a3 fromDrawing:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 replicaUUID];
  uint64_t v9 = [(ICDrawing *)self initWithReplicaID:v8];

  if (v9)
  {
    uint64_t v10 = [v6 copy];
    commands = v9->_commands;
    v9->_commands = (NSMutableOrderedSet *)v10;

    uint64_t v12 = [v7 timestamp];
    uint64_t v13 = [v12 copy];
    timestamp = v9->_timestamp;
    v9->_timestamp = (ICTTVectorMultiTimestamp *)v13;

    v9->_orientation = [v7 orientation];
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ICDrawing allocWithZone:a3];
  return [(ICDrawing *)v4 initWithDrawing:self];
}

- (id)mutableCommands
{
  return self->_commands;
}

- (NSOrderedSet)visibleCommands
{
  visibleCommands = self->_visibleCommands;
  if (!visibleCommands)
  {
    id v4 = [(NSMutableOrderedSet *)self->_commands indexesOfObjectsPassingTest:&__block_literal_global_28];
    if ([v4 count])
    {
      id v5 = [(ICDrawing *)self commands];
      id v6 = (NSMutableOrderedSet *)[v5 mutableCopy];
      id v7 = self->_visibleCommands;
      self->_visibleCommands = v6;

      [(NSMutableOrderedSet *)self->_visibleCommands removeObjectsAtIndexes:v4];
    }
    else
    {
      v8 = [(ICDrawing *)self commands];
      uint64_t v9 = (NSMutableOrderedSet *)[v8 mutableCopy];
      uint64_t v10 = self->_visibleCommands;
      self->_visibleCommands = v9;
    }
    visibleCommands = self->_visibleCommands;
  }
  return (NSOrderedSet *)visibleCommands;
}

uint64_t __28__ICDrawing_visibleCommands__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hidden];
}

- (CGRect)calculateCommandBounds
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = [(ICDrawing *)self visibleCommands];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = [*(id *)(*((void *)&v25 + 1) + 8 * v10) data];
        [v11 bounds];
        v36.origin.CGFloat x = v12;
        v36.origin.CGFloat y = v13;
        v36.size.CGFloat width = v14;
        v36.size.CGFloat height = v15;
        v31.origin.CGFloat x = x;
        v31.origin.CGFloat y = y;
        v31.size.CGFloat width = width;
        v31.size.CGFloat height = height;
        CGRect v32 = CGRectUnion(v31, v36);
        CGFloat x = v32.origin.x;
        CGFloat y = v32.origin.y;
        CGFloat width = v32.size.width;
        CGFloat height = v32.size.height;

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  BOOL IsNull = CGRectIsNull(v33);
  [(ICDrawing *)self unrotatedSize];
  double v19 = v18;
  if (IsNull)
  {
    [(ICDrawing *)self unrotatedSize];
    double v20 = v19 * 0.5;
    double v22 = v21 * 0.5;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
  }
  else
  {
    v37.size.CGFloat height = v17;
    v37.origin.CGFloat x = 0.0;
    v37.origin.CGFloat y = 0.0;
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat width = width;
    v34.size.CGFloat height = height;
    v37.size.CGFloat width = v19;
    *(CGRect *)&double v20 = CGRectIntersection(v34, v37);
  }
  return CGRectIntegral(*(CGRect *)&v20);
}

- (CGRect)commandBounds
{
  if (CGRectIsNull(self->_commandBounds))
  {
    [(ICDrawing *)self calculateCommandBounds];
    self->_commandBounds.origin.double x = x;
    self->_commandBounds.origin.double y = y;
    self->_commandBounds.size.double width = width;
    self->_commandBounds.size.double height = height;
  }
  else
  {
    double x = self->_commandBounds.origin.x;
    double y = self->_commandBounds.origin.y;
    double width = self->_commandBounds.size.width;
    double height = self->_commandBounds.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)bounds
{
  [(ICDrawing *)self unrotatedBoundsInCommandSpace];
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  if (CGRectIsNull(v12))
  {
    [(ICDrawing *)self commandBounds];
    CGFloat x = v7;
    CGFloat y = v8;
    CGFloat width = v9;
    CGFloat height = v10;
  }
  [(ICDrawing *)self orientationTransform];
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v13, &v11);
}

- (void)invalidateBounds
{
  CGSize v2 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_commandBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_commandBounds.size = v2;
}

- (void)takeOrientationFrom:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    self->_orientation = [v4 orientation];
    id v5 = [v7 orientationTimestamp];
    orientationTimestamp = self->_orientationTimestamp;
    self->_orientationTimestamp = v5;

    id v4 = v7;
  }
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    -[ICDrawing setOrientationTimestamp:](self, "setOrientationTimestamp:");
  }
}

- (BOOL)canChangeTransientOrientation
{
  v3 = [(ICDrawing *)self commands];
  if ([v3 count])
  {
    char v4 = 0;
  }
  else
  {
    id v5 = [(ICDrawing *)self orientationTimestamp];
    id v6 = [MEMORY[0x1E4F1C9C8] distantPast];
    char v4 = [v5 isEqualToDate:v6];
  }
  return v4;
}

- (BOOL)setTransientOrientation:(int64_t)a3
{
  BOOL v5 = [(ICDrawing *)self canChangeTransientOrientation];
  if (v5) {
    self->_orientation = a3;
  }
  return v5;
}

+ (void)sortCommands:(id)a3
{
}

uint64_t __26__ICDrawing_sortCommands___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 data];
  id v7 = v6;
  if (v6)
  {
    [v6 commandID];
  }
  else
  {
    unsigned int v25 = 0;
    long long v26 = 0;
    unsigned int v27 = 0;
  }
  double v8 = [v5 data];
  double v9 = v8;
  if (v8)
  {
    [v8 commandID];
    int v10 = v21;
    unsigned int v11 = v25;
    if (v25 < v21) {
      goto LABEL_16;
    }
  }
  else
  {
    int v10 = 0;
    uint64_t v21 = 0;
    uint64_t v23 = 0;
    unsigned int v24 = 0;
    unsigned int v11 = v25;
  }
  if (v11 != v10) {
    goto LABEL_13;
  }
  uint64_t v12 = [v26 TTCompare:v23];
  if (v12 == -1)
  {
LABEL_16:

    goto LABEL_17;
  }
  if (v12)
  {
LABEL_13:
  }
  else
  {

    if (v27 < v24)
    {
LABEL_17:
      uint64_t v15 = -1;
      goto LABEL_27;
    }
  }
  CGRect v13 = objc_msgSend(v4, "data", v21);
  CGFloat v14 = v13;
  if (v13)
  {
    [v13 commandID];
  }
  else
  {
    unsigned int v25 = 0;
    long long v26 = 0;
    unsigned int v27 = 0;
  }
  CGFloat v16 = [v5 data];
  CGFloat v17 = v16;
  if (v16)
  {
    [v16 commandID];
    int v18 = v22;
  }
  else
  {
    int v18 = 0;
    uint64_t v23 = 0;
    unsigned int v24 = 0;
  }
  if (v25 == v18 && v27 == v24) {
    int v19 = [v26 isEqual:v23];
  }
  else {
    int v19 = 0;
  }

  uint64_t v15 = v19 ^ 1u;
LABEL_27:

  return v15;
}

- (void)sortCommands
{
}

- (ICDrawingCommandID)commandIDForNewCommand
{
  id v5 = [(ICDrawing *)self timestamp];
  id v6 = [(ICDrawing *)self replicaUUID];
  id v7 = [v5 clockElementForUUID:v6 atIndex:0];

  retstr->clock = [v7 clock];
  retstr->replicaUUID = [(ICDrawing *)self replicaUUID];
  retstr->subclock = [v7 subclock] + 1;
  double v8 = [(ICDrawing *)self commands];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    int v10 = [(ICDrawing *)self commands];
    unsigned int v11 = [v10 lastObject];

    uint64_t v12 = [v11 data];
    CGRect v13 = v12;
    if (v12)
    {
      [v12 commandID];
    }
    else
    {
      uint64_t v21 = 0;
      id v22 = 0;
      uint64_t v23 = 0;
    }

    if (ICDrawingCommandID::operator<=((uint64_t)retstr, (uint64_t)&v21))
    {
      unsigned int v14 = v21;
      uint64_t v15 = [(ICDrawing *)self replicaUUID];
      retstr->clock = v14;
      replicaUUID = retstr->replicaUUID;
      retstr->replicaUUID = v15;

      retstr->subclock = 0;
      if (ICDrawingCommandID::operator<=((uint64_t)retstr, (uint64_t)&v21))
      {
        int v17 = v21;
        int v18 = [(ICDrawing *)self replicaUUID];
        retstr->clock = v17 + 1;
        int v19 = retstr->replicaUUID;
        retstr->replicaUUID = v18;

        retstr->subclock = 0;
      }
    }
  }
  return result;
}

- (id)insertNewTestCommand
{
  v3 = objc_alloc_init(ICDrawingCommandData);
  [(ICDrawingCommandData *)v3 setType:0];
  [(ICDrawing *)self setCommandIDForInsertion:v3];
  id v4 = [(ICDrawing *)self visibleCommandForInsertingCommand:v3];
  [(ICDrawing *)self addNewCommand:v4];

  return v4;
}

- (void)setCommandIDForInsertion:(id)a3
{
  id v4 = a3;
  [(ICDrawing *)self commandIDForNewCommand];
  int v6 = v9;
  id v5 = v10;
  id v7 = v5;
  int v8 = v11;
  if (v4) {
    [v4 setCommandID:&v6];
  }
  else {
}
  }

- (id)visibleCommandForInsertingCommand:(id)a3
{
  id v4 = a3;
  id v5 = [ICDrawingCommand alloc];
  int v6 = [(ICDrawing *)self replicaUUID];
  if (v5) {
    id v5 = -[ICDrawingCommand initWithCommand:hidden:timestamp:](v5, "initWithCommand:hidden:timestamp:", v4, 0, v6, 0);
  }
  else {

  }
  return v5;
}

- (void)addNewCommand:(id)a3
{
  id v4 = a3;
  id v5 = [(ICDrawing *)self orientationTimestamp];
  int v6 = [MEMORY[0x1E4F1C9C8] distantPast];
  int v7 = [v5 isEqualToDate:v6];

  if (v7)
  {
    int v8 = [MEMORY[0x1E4F1C9C8] date];
    [(ICDrawing *)self setOrientationTimestamp:v8];
  }
  [(NSMutableOrderedSet *)self->_commands addObject:v4];
  if (self->_visibleCommands && ([v4 hidden] & 1) == 0) {
    [(NSMutableOrderedSet *)self->_visibleCommands addObject:v4];
  }
  int v9 = [(ICDrawing *)self timestamp];
  id v10 = [v4 data];
  int v11 = v10;
  if (v10)
  {
    [v10 commandID];
    uint64_t v12 = v20;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v21 = 0;
  }
  CGRect v13 = [v4 data];
  unsigned int v14 = v13;
  if (v13)
  {
    [v13 commandID];
    uint64_t v15 = v19;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v17 = 0;
    int v18 = 0;
  }
  CGFloat v16 = [(ICDrawing *)self replicaUUID];
  [v9 setClock:v12 subclock:v15 forUUID:v16 atIndex:0];

  [(ICDrawing *)self invalidateBounds];
}

- (id)setCommand:(id)a3 hidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = [(ICDrawing *)self commands];
  uint64_t v8 = [v7 indexOfObject:v6];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v9 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICDrawing setCommand:hidden:](v9);
    }

    id v10 = (ICDrawingCommand *)v6;
  }
  else
  {
    int v11 = [(ICDrawing *)self commands];
    uint64_t v12 = [v11 objectAtIndexedSubscript:v8];

    if ([v12 hidden] != v4)
    {
      CGRect v13 = [(ICDrawing *)self timestamp];
      unsigned int v14 = [(ICDrawing *)self replicaUUID];
      uint64_t v15 = [v13 clockElementForUUID:v14 atIndex:1];

      CGFloat v16 = (void *)[v12 timestamp];
      unsigned int v18 = v17;
      unsigned int v19 = [(ICDrawing *)self replicaUUID];

      unsigned int v20 = [v15 clock];
      uint64_t v21 = [(ICDrawing *)self timestamp];
      id v22 = [(ICDrawing *)self replicaUUID];
      if (v18 <= v20) {
        unsigned int v23 = v20;
      }
      else {
        unsigned int v23 = v18;
      }
      uint64_t v24 = v23 + 1;
      [v21 setClock:v24 forUUID:v22 atIndex:1];

      visibleCommands = self->_visibleCommands;
      self->_visibleCommands = 0;

      long long v26 = [ICDrawingCommand alloc];
      unsigned int v27 = [v12 data];
      id v28 = v19;
      v29 = v28;
      if (v26)
      {
        uint64_t v30 = -[ICDrawingCommand initWithCommand:hidden:timestamp:](v26, "initWithCommand:hidden:timestamp:", v27, v4, v28, v24);
      }
      else
      {

        uint64_t v30 = 0;
      }

      [(NSMutableOrderedSet *)self->_commands replaceObjectAtIndex:v8 withObject:v30];
      goto LABEL_15;
    }
    id v10 = v12;
  }
  uint64_t v12 = v10;
  uint64_t v30 = v10;
LABEL_15:

  return v30;
}

- (unint64_t)mergeWithDrawing:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  BOOL v4 = [v51 orientationTimestamp];
  id v5 = [(ICDrawing *)self orientationTimestamp];
  uint64_t v6 = [v4 compare:v5];

  if (v6 == -1
    || ([v51 orientationTimestamp],
        int v7 = (NSDate *)objc_claimAutoreleasedReturnValue(),
        orientationTimestamp = self->_orientationTimestamp,
        self->_orientationTimestamp = v7,
        orientationTimestamp,
        int64_t orientation = self->_orientation,
        orientation == [v51 orientation]))
  {
    unint64_t v10 = 1;
  }
  else
  {
    self->_int64_t orientation = [v51 orientation];
    unint64_t v10 = 2;
  }
  int v11 = [(ICDrawing *)self timestamp];
  uint64_t v12 = [v51 timestamp];
  uint64_t v13 = [v11 compareTo:v12];

  if (v13)
  {
    [v51 unrotatedBoundsInCommandSpace];
    if (!CGRectIsNull(v59))
    {
      [(ICDrawing *)self unrotatedBoundsInCommandSpace];
      BOOL IsNull = CGRectIsNull(v60);
      int v15 = v13 == 1 || IsNull;
      if (v15 == 1)
      {
        [v51 unrotatedBoundsInCommandSpace];
      }
      else
      {
        [(ICDrawing *)self unrotatedBoundsInCommandSpace];
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        CGFloat v27 = v26;
        [v51 unrotatedBoundsInCommandSpace];
        v62.origin.CGFloat x = v28;
        v62.origin.CGFloat y = v29;
        v62.size.CGFloat width = v30;
        v62.size.CGFloat height = v31;
        v61.origin.CGFloat x = v21;
        v61.origin.CGFloat y = v23;
        v61.size.CGFloat width = v25;
        v61.size.CGFloat height = v27;
        *(CGRect *)&double v16 = CGRectUnion(v61, v62);
      }
      -[ICDrawing setUnrotatedBoundsInCommandSpace:](self, "setUnrotatedBoundsInCommandSpace:", v16, v17, v18, v19);
    }
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = [v51 commands];
    uint64_t v32 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v54 != v33) {
            objc_enumerationMutation(obj);
          }
          v35 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          uint64_t v36 = [(NSMutableOrderedSet *)self->_commands indexOfObject:v35];
          commands = self->_commands;
          if (v36 == 0x7FFFFFFFFFFFFFFFLL)
          {
            [(NSMutableOrderedSet *)commands addObject:v35];
            continue;
          }
          v38 = [(NSMutableOrderedSet *)commands objectAtIndex:v36];
          v39 = v38;
          if (v38)
          {
            v40 = (void *)[v38 timestamp];
            unsigned int v42 = v41;
            v43 = (void *)[v35 timestamp];
            v45 = v43;
            if (v42 >= v44)
            {
              if (v42 != v44)
              {

                goto LABEL_28;
              }
              BOOL v46 = [v40 TTCompare:v43] == -1;

              if (!v46) {
                goto LABEL_28;
              }
            }
            else
            {
            }
            [(NSMutableOrderedSet *)self->_commands replaceObjectAtIndex:v36 withObject:v35];
          }
LABEL_28:
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
      }
      while (v32);
    }

    [(ICDrawing *)self sortCommands];
    v47 = [(ICDrawing *)self timestamp];
    v48 = [v51 timestamp];
    [v47 mergeWithTimestamp:v48];

    [(ICDrawing *)self invalidateBounds];
    visibleCommands = self->_visibleCommands;
    self->_visibleCommands = 0;

    unint64_t v10 = 2;
  }

  return v10;
}

- (CGSize)fullSize
{
  [(ICDrawing *)self unrotatedSize];
  int64_t orientation = self->_orientation;
  +[ICDrawing fullSize:forOrientation:](ICDrawing, "fullSize:forOrientation:", orientation);
  result.CGFloat height = v5;
  result.CGFloat width = v4;
  return result;
}

+ (CGSize)fullSize:(CGSize)result forOrientation:(int64_t)a4
{
  if ((unint64_t)a4 >= 2) {
    double height = result.height;
  }
  else {
    double height = result.width;
  }
  if ((unint64_t)a4 >= 2) {
    result.double height = result.width;
  }
  double v5 = height;
  result.CGFloat width = v5;
  return result;
}

- (CGRect)fullBounds
{
  [(ICDrawing *)self unrotatedSize];
  CGFloat v4 = v3;
  [(ICDrawing *)self unrotatedSize];
  CGFloat v6 = v5;
  [(ICDrawing *)self orientationTransform];
  v8.origin.CGFloat x = 0.0;
  v8.origin.CGFloat y = 0.0;
  v8.size.CGFloat width = v4;
  v8.size.double height = v6;
  return CGRectApplyAffineTransform(v8, &v7);
}

+ (CGAffineTransform)defaultSizeOrientationTransform:(SEL)a3
{
  +[ICDrawing defaultSize];
  +[ICDrawing fullSize:forOrientation:](ICDrawing, "fullSize:forOrientation:", a4);
  return +[ICDrawing orientationTransform:size:](ICDrawing, "orientationTransform:size:", a4);
}

- (CGAffineTransform)orientationTransform
{
  int64_t orientation = self->_orientation;
  [(ICDrawing *)self fullSize];
  return +[ICDrawing orientationTransform:size:](ICDrawing, "orientationTransform:size:", orientation);
}

+ (CGAffineTransform)orientationTransform:(SEL)a3 size:(int64_t)a4
{
  uint64_t v5 = MEMORY[0x1E4F1DAB8];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)(v5 + 32);
  switch(a4)
  {
    case 3:
      *(_OWORD *)&retstr->a = xmmword_1C3DD3060;
      *(_OWORD *)&retstr->c = xmmword_1C3DD3050;
      retstr->tCGFloat x = a5.width;
      retstr->tCGFloat y = 0.0;
      break;
    case 2:
      *(_OWORD *)&retstr->a = xmmword_1C3DD3040;
      retstr->d = 0.0;
      retstr->tCGFloat x = 0.0;
      retstr->c = 1.0;
      retstr->tCGFloat y = a5.height;
      break;
    case 1:
      retstr->a = -1.0;
      retstr->b = 0.0;
      retstr->c = 0.0;
      retstr->d = -1.0;
      *(CGSize *)&retstr->tCGFloat x = a5;
      break;
  }
  return result;
}

- (int64_t)imageOrientation
{
  int64_t result = [(ICDrawing *)self orientation];
  if ((unint64_t)(result - 1) >= 3) {
    return 0;
  }
  return result;
}

+ (CGSize)defaultPixelSize
{
  [MEMORY[0x1E4F83738] notesDeviceDrawingSize];
  result.double height = v3;
  result.CGFloat width = v2;
  return result;
}

+ (CGSize)defaultSize
{
  double v2 = 1024.0;
  double v3 = 768.0;
  result.double height = v3;
  result.CGFloat width = v2;
  return result;
}

- (NSUUID)replicaUUID
{
  return self->_replicaUUID;
}

- (ICTTVectorMultiTimestamp)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSOrderedSet)commands
{
  return &self->_commands->super;
}

- (CGSize)unrotatedSize
{
  double width = self->_unrotatedSize.width;
  double height = self->_unrotatedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setUnrotatedSize:(CGSize)a3
{
  self->_unrotatedSize = a3;
}

- (NSDate)orientationTimestamp
{
  return self->_orientationTimestamp;
}

- (void)setOrientationTimestamp:(id)a3
{
}

- (CGRect)unrotatedBoundsInCommandSpace
{
  double x = self->_unrotatedBoundsInCommandSpace.origin.x;
  double y = self->_unrotatedBoundsInCommandSpace.origin.y;
  double width = self->_unrotatedBoundsInCommandSpace.size.width;
  double height = self->_unrotatedBoundsInCommandSpace.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setUnrotatedBoundsInCommandSpace:(CGRect)a3
{
  self->_unrotatedBoundsInCommandSpace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orientationTimestamp, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_replicaUUID, 0);
  objc_storeStrong((id *)&self->_visibleCommands, 0);
  objc_storeStrong((id *)&self->_commands, 0);
}

- (ICDrawing)initWithData:(id)a3 replicaID:(id)a4
{
  return [(ICDrawing *)self initWithData:a3 version:1 replicaID:a4];
}

- (ICDrawing)initWithData:(id)a3 version:(unsigned int)a4 replicaID:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if (!v8)
  {
    uint64_t v13 = [(ICDrawing *)self initWithReplicaID:v9];
    goto LABEL_5;
  }
  drawing::Drawing::Drawing((drawing::Drawing *)v17);
  id v10 = v8;
  int v11 = (char *)[v10 bytes];
  int v12 = ICTTBoundedCheckedCastNSUIntegerToUInt32([v10 length]);
  if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v17, v11, v12))
  {
    uint64_t v13 = [(ICDrawing *)self initWithArchive:v17 version:v6 replicaID:v9];
    drawing::Drawing::~Drawing((drawing::Drawing *)v17);
LABEL_5:
    self = v13;
    unsigned int v14 = self;
    goto LABEL_9;
  }
  int v15 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[ICDrawing(ICDrawingPersistenceAdditions) initWithData:version:replicaID:](v15);
  }

  drawing::Drawing::~Drawing((drawing::Drawing *)v17);
  unsigned int v14 = 0;
LABEL_9:

  return v14;
}

- (ICDrawing)initWithArchive:(const void *)a3 version:(unsigned int)a4 replicaID:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = (int *)((char *)a3 + 48);
  if ((*((unsigned char *)a3 + 32) & 1) != 0 && *((_DWORD *)a3 + 12) == 6)
  {
    id v10 = [(ICDrawing *)self initWithReplicaID:v8];
    if (v10)
    {
      int v11 = [ICTTVectorMultiTimestamp alloc];
      int v12 = v11;
      uint64_t v13 = *((void *)a3 + 5);
      if (!v13) {
        uint64_t v13 = *(void *)(drawing::Drawing::default_instance((drawing::Drawing *)v11) + 40);
      }
      unsigned int v14 = [(ICTTVectorMultiTimestamp *)v12 initWithArchive:v13 andCapacity:2];
      [(ICDrawing *)v10 setTimestamp:v14];

      int v15 = [(ICDrawing *)v10 timestamp];
      double v16 = [v15 sortedUUIDs];

      int v18 = *((_DWORD *)a3 + 16);
      if (v18)
      {
        for (int i = 0; i != v18; ++i)
        {
          double v20 = [[ICDrawingCommand alloc] initWithArchive:google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<drawing::Command>::TypeHandler>((uint64_t)a3 + 56, i) version:v5 sortedUUIDs:v16];
          if (v20)
          {
            CGFloat v21 = [(ICDrawing *)v10 mutableCommands];
            [v21 addObject:v20];
          }
        }
      }
      int v22 = *((_DWORD *)a3 + 8);
      if ((~v22 & 0x18) == 0)
      {
        [(ICDrawing *)v10 setOrientation:*((unsigned int *)a3 + 13)];
        CGFloat v23 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*((double *)a3 + 10)];
        [(ICDrawing *)v10 setOrientationTimestamp:v23];

        int v22 = *((_DWORD *)a3 + 8);
      }
      if ((v22 & 0x20) != 0)
      {
        double v24 = (const drawing::Rectangle *)*((void *)a3 + 11);
        if (!v24) {
          double v24 = *(const drawing::Rectangle **)(drawing::Drawing::default_instance(v17) + 88);
        }
        drawing::Rectangle::Rectangle((drawing::Rectangle *)v28, v24);
        -[ICDrawing setUnrotatedBoundsInCommandSpace:](v10, "setUnrotatedBoundsInCommandSpace:", v29, v30, v31, v32);
        drawing::Rectangle::~Rectangle((drawing::Rectangle *)v28);
      }
    }
  }
  else
  {
    CGFloat v25 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[ICDrawing(ICDrawingPersistenceAdditions) initWithArchive:version:replicaID:](v9, v25);
    }

    id v10 = [(ICDrawing *)self initWithReplicaID:v8];
  }
  double v26 = v10;

  return v26;
}

- (unsigned)saveToArchive:(void *)a3 withPathData:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  CGAffineTransform v7 = (char *)a3 + 32;
  *((_DWORD *)a3 + 8) |= 1u;
  *((_DWORD *)a3 + 12) = 6;
  id v8 = [(ICDrawing *)self timestamp];
  *v7 |= 2u;
  uint64_t v9 = *((void *)a3 + 5);
  if (!v9) {
    operator new();
  }
  [v8 saveToArchive:v9];

  id v10 = [(ICDrawing *)self timestamp];
  int v11 = [v10 sortedUUIDs];

  int v12 = [(ICDrawing *)self commands];
  google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)a3 + 56, [v12 count]);

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v13 = [(ICDrawing *)self commands];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
  v39 = self;
  if (v14)
  {
    uint64_t v15 = *(void *)v41;
    unsigned int v16 = 1;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v13);
        }
        int v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        int v19 = *((_DWORD *)a3 + 17);
        uint64_t v20 = *((int *)a3 + 16);
        if ((int)v20 >= v19)
        {
          if (v19 == *((_DWORD *)a3 + 18)) {
            google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)a3 + 56, v19 + 1);
          }
          google::protobuf::internal::GenericTypeHandler<drawing::Command>::New();
        }
        uint64_t v21 = *((void *)a3 + 7);
        *((_DWORD *)a3 + 16) = v20 + 1;
        unsigned int v22 = [v18 saveToArchive:*(void *)(v21 + 8 * v20) sortedUUIDs:v11 withPathData:v4];
        if (v16 <= v22) {
          unsigned int v16 = v22;
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v14);
  }
  else
  {
    unsigned int v16 = 1;
  }

  CGFloat v23 = [(ICDrawing *)v39 orientationTimestamp];
  BOOL v24 = v23 == 0;

  if (!v24)
  {
    int v25 = [(ICDrawing *)v39 orientation];
    *((_DWORD *)a3 + 8) |= 8u;
    *((_DWORD *)a3 + 13) = v25;
    double v26 = [(ICDrawing *)v39 orientationTimestamp];
    [v26 timeIntervalSinceReferenceDate];
    *((_DWORD *)a3 + 8) |= 0x10u;
    *((void *)a3 + 10) = v27;
  }
  [(ICDrawing *)v39 unrotatedBoundsInCommandSpace];
  double x = v46.origin.x;
  double y = v46.origin.y;
  double width = v46.size.width;
  double height = v46.size.height;
  if (!CGRectIsNull(v46))
  {
    *((_DWORD *)a3 + 8) |= 0x20u;
    uint64_t v32 = *((void *)a3 + 11);
    if (!v32) {
      operator new();
    }
    float v33 = x;
    int v34 = *(_DWORD *)(v32 + 32);
    float v35 = y;
    *(float *)(v32 + 40) = v33;
    *(float *)(v32 + 44) = v35;
    float v36 = width;
    float v37 = height;
    *(_DWORD *)(v32 + 32) = v34 | 0xF;
    *(float *)(v32 + 48) = v36;
    *(float *)(v32 + 52) = v37;
  }

  return v16;
}

- (id)serializeWithPathData:(BOOL)a3
{
  int v5 = 0;
  double v3 = [(ICDrawing *)self serializeWithPathData:a3 toVersion:&v5];
  return v3;
}

- (id)serializeWithPathData:(BOOL)a3 toVersion:(unsigned int *)a4
{
  *a4 = -[ICDrawing saveToArchive:withPathData:](self, "saveToArchive:withPathData:", v8, a3, drawing::Drawing::Drawing((drawing::Drawing *)v8));
  id v4 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(int)drawing::Drawing::ByteSize((drawing::Drawing *)v8)];
  int v5 = (void *)[v4 mutableBytes];
  int v6 = ICTTBoundedCheckedCastNSUIntegerToUInt32([v4 length]);
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v8, v5, v6);
  drawing::Drawing::~Drawing((drawing::Drawing *)v8);
  return v4;
}

- (void)setCommand:(os_log_t)log hidden:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Attempting to toggle visibility of a command not in drawing.", v1, 2u);
}

@end