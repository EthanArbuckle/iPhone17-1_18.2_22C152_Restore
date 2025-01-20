@interface TLTimelineWindow
+ (BOOL)supportsSecureCoding;
- (BOOL)containsNode:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)leftmostContiguousEntryDate;
- (NSDate)rightmostContiguousEntryDate;
- (TLTimelineEntryNode)focalNode;
- (TLTimelineSegment)leftSegment;
- (TLTimelineSegment)rightSegment;
- (TLTimelineWindow)initWithCoder:(id)a3;
- (TLTimelineWindow)initWithFocalNode:(id)a3 leftSegment:(id)a4 rightSegment:(id)a5 maxNodes:(unint64_t)a6;
- (TLTimelineWindow)initWithFocalNode:(id)a3 maxNodes:(unint64_t)a4;
- (TLTimelineWindow)initWithFocalNode:(id)a3 maxNodes:(unint64_t)a4 leftSegmentCount:(unint64_t)a5 rightSegmentCount:(unint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)leftmostNode;
- (id)rightmostNode;
- (unint64_t)hash;
- (unint64_t)leftEntryCount;
- (unint64_t)maxNodes;
- (unint64_t)rightEntryCount;
- (void)encodeWithCoder:(id)a3;
- (void)rebalance;
- (void)updateFocalNodeWithDate:(id)a3;
@end

@implementation TLTimelineWindow

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TLTimelineWindow)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"focalNode"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"maxNodes"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"leftCount"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"rightCount"];

  v9 = [(TLTimelineWindow *)self initWithFocalNode:v5 maxNodes:v6 leftSegmentCount:v7 rightSegmentCount:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [v5 encodeObject:v4->_focalNode forKey:@"focalNode"];
  objc_msgSend(v5, "encodeInteger:forKey:", -[TLTimelineSegment count](v4->_leftSegment, "count"), @"leftCount");
  objc_msgSend(v5, "encodeInteger:forKey:", -[TLTimelineSegment count](v4->_rightSegment, "count"), @"rightCount");
  objc_sync_exit(v4);

  [v5 encodeInteger:v4->_maxNodes forKey:@"maxNodes"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(TLTimelineEntryNode *)v4->_focalNode copyWithZone:a3];
  uint64_t v6 = [(TLTimelineSegment *)v4->_leftSegment count];
  uint64_t v7 = [(TLTimelineSegment *)v4->_rightSegment count];
  objc_sync_exit(v4);

  uint64_t v8 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFocalNode:maxNodes:leftSegmentCount:rightSegmentCount:", v5, v4->_maxNodes, v6, v7);
  return v8;
}

- (unint64_t)hash
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(TLTimelineEntryNode *)v2->_focalNode hash];
  unint64_t maxNodes = v2->_maxNodes;
  uint64_t v5 = [(TLTimelineSegment *)v2->_leftSegment hash];
  unint64_t v6 = maxNodes ^ v3 ^ v5 ^ [(TLTimelineSegment *)v2->_rightSegment hash];
  objc_sync_exit(v2);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TLTimelineWindow *)a3;
  if (v4 == self)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = self;
      objc_sync_enter(v5);
      unint64_t maxNodes = v5->_maxNodes;
      if (maxNodes != [(TLTimelineWindow *)v4 maxNodes]) {
        goto LABEL_9;
      }
      leftSegment = v5->_leftSegment;
      uint64_t v8 = [(TLTimelineWindow *)v4 leftSegment];
      BOOL v9 = +[TLTimelineUtilities object:leftSegment isEqualToObject:v8];

      if (!v9) {
        goto LABEL_9;
      }
      rightSegment = v5->_rightSegment;
      v11 = [(TLTimelineWindow *)v4 rightSegment];
      BOOL v12 = +[TLTimelineUtilities object:rightSegment isEqualToObject:v11];

      if (v12)
      {
        focalNode = v5->_focalNode;
        v14 = [(TLTimelineWindow *)v4 focalNode];
        BOOL v15 = +[TLTimelineUtilities object:focalNode isEqualToObject:v14];
      }
      else
      {
LABEL_9:
        BOOL v15 = 0;
      }
      objc_sync_exit(v5);
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (TLTimelineWindow)initWithFocalNode:(id)a3 maxNodes:(unint64_t)a4 leftSegmentCount:(unint64_t)a5 rightSegmentCount:(unint64_t)a6
{
  id v10 = a3;
  v11 = v10;
  BOOL v12 = v10;
  if (a5 >= 2)
  {
    unint64_t v13 = a5;
    v14 = v10;
    do
    {
      BOOL v12 = [v14 leftEntryNode];

      --v13;
      v14 = v12;
    }
    while (v13 > 1);
  }
  BOOL v15 = [[TLTimelineSegment alloc] initWithLeftmostNode:v12 rightmostNode:v11 count:a5];
  id v16 = v11;
  v17 = v16;
  v18 = v16;
  if (a6 >= 2)
  {
    unint64_t v19 = a6 - 1;
    v20 = v16;
    do
    {
      v18 = [v20 rightEntryNode];

      v20 = v18;
      --v19;
    }
    while (v19);
  }
  v21 = [[TLTimelineSegment alloc] initWithLeftmostNode:v17 rightmostNode:v18 count:a6];
  v22 = [(TLTimelineWindow *)self initWithFocalNode:v17 leftSegment:v15 rightSegment:v21 maxNodes:a4];

  return v22;
}

- (TLTimelineWindow)initWithFocalNode:(id)a3 maxNodes:(unint64_t)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TLTimelineWindow;
  uint64_t v8 = [(TLTimelineWindow *)&v15 init];
  if (v8)
  {
    BOOL v9 = [[TLTimelineSegment alloc] initWithLeftmostNode:v7 rightmostNode:v7 count:1];
    id v10 = [[TLTimelineSegment alloc] initWithLeftmostNode:v7 rightmostNode:v7 count:1];
    objc_storeStrong((id *)&v8->_focalNode, a3);
    v8->_unint64_t maxNodes = a4;
    leftSegment = v8->_leftSegment;
    v8->_leftSegment = v9;
    BOOL v12 = v9;

    rightSegment = v8->_rightSegment;
    v8->_rightSegment = v10;
  }
  return v8;
}

- (TLTimelineWindow)initWithFocalNode:(id)a3 leftSegment:(id)a4 rightSegment:(id)a5 maxNodes:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TLTimelineWindow;
  v14 = [(TLTimelineWindow *)&v17 init];
  objc_super v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_focalNode, a3);
    v15->_unint64_t maxNodes = a6;
    objc_storeStrong((id *)&v15->_leftSegment, a4);
    objc_storeStrong((id *)&v15->_rightSegment, a5);
  }

  return v15;
}

- (void)updateFocalNodeWithDate:(id)a3
{
  id v17 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  while (1)
  {
    uint64_t v5 = [(TLTimelineEntryNode *)v4->_focalNode rightEntryNode];
    if (!v5) {
      break;
    }
    unint64_t v6 = [(TLTimelineEntryNode *)v4->_focalNode rightEntryNode];
    id v7 = [v6 date];
    id v8 = v17;
    if (+[TLTimelineUtilities date:v7 isOrderedAscendingToDate:v8])
    {
    }
    else
    {
      BOOL v9 = +[TLTimelineUtilities object:v7 isEqualToObject:v8];

      if (!v9) {
        break;
      }
    }
    uint64_t v10 = [(TLTimelineEntryNode *)v4->_focalNode rightEntryNode];
    focalNode = v4->_focalNode;
    v4->_focalNode = (TLTimelineEntryNode *)v10;

    [(TLTimelineSegment *)v4->_leftSegment shiftRight];
    [(TLTimelineSegment *)v4->_rightSegment shiftRight];
  }
  while (1)
  {
    id v16 = [(TLTimelineEntryNode *)v4->_focalNode leftEntryNode];
    if (!v16) {
      break;
    }
    id v12 = [(TLTimelineEntryNode *)v4->_focalNode date];
    BOOL v13 = +[TLTimelineUtilities date:v17 isOrderedAscendingToDate:v12];

    if (!v13) {
      break;
    }
    uint64_t v14 = [(TLTimelineEntryNode *)v4->_focalNode leftEntryNode];
    objc_super v15 = v4->_focalNode;
    v4->_focalNode = (TLTimelineEntryNode *)v14;

    [(TLTimelineSegment *)v4->_leftSegment shiftLeft];
    [(TLTimelineSegment *)v4->_rightSegment shiftLeft];
  }
  objc_sync_exit(v4);
}

- (void)rebalance
{
  obj = self;
  objc_sync_enter(obj);
  unint64_t maxNodes = obj->_maxNodes;
  int v3 = 1;
  int v4 = 1;
  while (1)
  {
    uint64_t v5 = [(TLTimelineSegment *)obj->_leftSegment count];
    unint64_t v6 = [(TLTimelineSegment *)obj->_rightSegment count] + v5;
    id v7 = obj;
    BOOL v8 = maxNodes && v6 > obj->_maxNodes;
    if (v8 || ((v4 | v3) & 1) == 0) {
      break;
    }
    if (v4)
    {
      if (v3)
      {
        [(TLTimelineSegment *)obj->_rightSegment duration];
        double v10 = v9;
        [(TLTimelineSegment *)obj->_leftSegment duration];
        if (v10 >= v11)
        {
          int v3 = 1;
          int v4 = [(TLTimelineSegment *)obj->_leftSegment expandToLeft];
        }
        else
        {
          int v4 = 1;
          int v3 = [(TLTimelineSegment *)obj->_rightSegment expandToRight];
        }
      }
      else
      {
        int v4 = [(TLTimelineSegment *)obj->_leftSegment expandToLeft];
        int v3 = 0;
      }
    }
    else
    {
      int v3 = [(TLTimelineSegment *)obj->_rightSegment expandToRight];
      int v4 = 0;
    }
  }
  if (v4)
  {
    while (1)
    {
      [(TLTimelineSegment *)obj->_leftSegment duration];
      double v13 = v12;
      [(TLTimelineSegment *)obj->_rightSegment duration];
      id v7 = obj;
      if (v13 >= v14) {
        break;
      }
      BOOL v15 = [(TLTimelineSegment *)obj->_leftSegment expandToLeft];
      id v7 = obj;
      if (!v15) {
        break;
      }
      [(TLTimelineSegment *)obj->_rightSegment contractFromRight];
    }
  }
  if (v3)
  {
    while (1)
    {
      [(TLTimelineSegment *)obj->_rightSegment duration];
      double v17 = v16;
      [(TLTimelineSegment *)obj->_leftSegment duration];
      id v7 = obj;
      if (v17 >= v18) {
        break;
      }
      BOOL v19 = [(TLTimelineSegment *)obj->_rightSegment expandToRight];
      id v7 = obj;
      if (!v19) {
        break;
      }
      [(TLTimelineSegment *)obj->_leftSegment contractFromLeft];
    }
  }
  objc_sync_exit(v7);
}

- (BOOL)containsNode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if ([(TLTimelineSegment *)v5->_leftSegment containsNode:v4]) {
    char v6 = 1;
  }
  else {
    char v6 = [(TLTimelineSegment *)v5->_rightSegment containsNode:v4];
  }
  objc_sync_exit(v5);

  return v6;
}

- (id)leftmostNode
{
  v2 = self;
  objc_sync_enter(v2);
  int v3 = [(TLTimelineSegment *)v2->_leftSegment leftmostNode];
  objc_sync_exit(v2);

  return v3;
}

- (id)rightmostNode
{
  v2 = self;
  objc_sync_enter(v2);
  int v3 = [(TLTimelineSegment *)v2->_rightSegment rightmostNode];
  objc_sync_exit(v2);

  return v3;
}

- (NSDate)leftmostContiguousEntryDate
{
  v2 = [(TLTimelineWindow *)self leftmostNode];
  int v3 = [v2 date];

  return (NSDate *)v3;
}

- (NSDate)rightmostContiguousEntryDate
{
  v2 = [(TLTimelineWindow *)self rightmostNode];
  int v3 = [v2 date];

  return (NSDate *)v3;
}

- (unint64_t)leftEntryCount
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = [(TLTimelineSegment *)v2->_leftSegment count] - 1;
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)rightEntryCount
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = [(TLTimelineSegment *)v2->_rightSegment count] - 1;
  objc_sync_exit(v2);

  return v3;
}

- (TLTimelineEntryNode)focalNode
{
  return self->_focalNode;
}

- (TLTimelineSegment)leftSegment
{
  return self->_leftSegment;
}

- (TLTimelineSegment)rightSegment
{
  return self->_rightSegment;
}

- (unint64_t)maxNodes
{
  return self->_maxNodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightSegment, 0);
  objc_storeStrong((id *)&self->_leftSegment, 0);
  objc_storeStrong((id *)&self->_focalNode, 0);
}

@end