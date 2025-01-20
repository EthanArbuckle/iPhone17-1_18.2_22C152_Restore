@interface TLTimelineSegment
+ (BOOL)supportsSecureCoding;
- (BOOL)containsNode:(id)a3;
- (BOOL)contractFromLeft;
- (BOOL)contractFromRight;
- (BOOL)expandToLeft;
- (BOOL)expandToRight;
- (BOOL)isEqual:(id)a3;
- (BOOL)shiftLeft;
- (BOOL)shiftRight;
- (TLTimelineEntryNode)leftmostNode;
- (TLTimelineEntryNode)rightmostNode;
- (TLTimelineSegment)initWithCoder:(id)a3;
- (TLTimelineSegment)initWithLeftmostNode:(id)a3 rightmostNode:(id)a4 count:(unint64_t)a5;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TLTimelineSegment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TLTimelineSegment)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"leftmostNode"];
  unint64_t v6 = [v4 decodeIntegerForKey:@"count"];
  id v7 = v5;
  v8 = v7;
  v9 = v7;
  if (v6 >= 2)
  {
    unint64_t v10 = v6 - 1;
    v11 = v7;
    do
    {
      v9 = [v8 rightEntryNode];

      v11 = v9;
      --v10;
    }
    while (v10);
  }
  v12 = [(TLTimelineSegment *)self initWithLeftmostNode:v8 rightmostNode:v9 count:v6];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [v5 encodeObject:v4->_leftmostNode forKey:@"leftmostNode"];
  [v5 encodeInteger:v4->_count forKey:@"count"];
  objc_sync_exit(v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(TLTimelineEntryNode *)v4->_leftmostNode copyWithZone:a3];
  unint64_t count = v4->_count;
  id v7 = v5;
  v8 = v7;
  v9 = v7;
  if (count >= 2)
  {
    unint64_t v10 = count - 1;
    v11 = v7;
    do
    {
      v9 = [v8 rightEntryNode];

      v11 = v9;
      --v10;
    }
    while (v10);
  }
  objc_sync_exit(v4);

  v12 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithLeftmostNode:rightmostNode:count:", v8, v9, count);
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = [(TLTimelineSegment *)v5 count];
    if (v6 == [v4 count])
    {
      id v7 = [(TLTimelineSegment *)v5 leftmostNode];
      v8 = [v4 leftmostNode];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
    objc_sync_exit(v5);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t count = v2->_count;
  uint64_t v4 = [(TLTimelineEntryNode *)v2->_leftmostNode hash] ^ count;
  objc_sync_exit(v2);

  return v4 ^ +[TLTimelineSegment hash];
}

- (TLTimelineSegment)initWithLeftmostNode:(id)a3 rightmostNode:(id)a4 count:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TLTimelineSegment;
  v11 = [(TLTimelineSegment *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_leftmostNode, a3);
    objc_storeStrong((id *)&v12->_rightmostNode, a4);
    v12->_unint64_t count = a5;
  }

  return v12;
}

- (BOOL)containsNode:(id)a3
{
  uint64_t v4 = (TLTimelineEntryNode *)a3;
  id v5 = self;
  objc_sync_enter(v5);
  leftmostNode = v5->_leftmostNode;
  if (leftmostNode == v4 || v5->_rightmostNode == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    id v7 = [(TLTimelineEntryNode *)leftmostNode date];
    v8 = [(TLTimelineEntryNode *)v4 date];
    if (+[TLTimelineUtilities date:v7 isOrderedAscendingToDate:v8])
    {
      id v9 = [(TLTimelineEntryNode *)v4 date];
      id v10 = [(TLTimelineEntryNode *)v5->_rightmostNode date];
      BOOL v11 = +[TLTimelineUtilities date:v9 isOrderedAscendingToDate:v10];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  objc_sync_exit(v5);

  return v11;
}

- (BOOL)expandToRight
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(TLTimelineEntryNode *)v2->_rightmostNode rightEntryNode];
  if (v3)
  {
    objc_storeStrong((id *)&v2->_rightmostNode, v3);
    ++v2->_count;
  }

  objc_sync_exit(v2);
  return v3 != 0;
}

- (BOOL)expandToLeft
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(TLTimelineEntryNode *)v2->_leftmostNode leftEntryNode];
  if (v3)
  {
    objc_storeStrong((id *)&v2->_leftmostNode, v3);
    ++v2->_count;
  }

  objc_sync_exit(v2);
  return v3 != 0;
}

- (BOOL)contractFromRight
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t count = v2->_count;
  if (count >= 2)
  {
    uint64_t v4 = [(TLTimelineEntryNode *)v2->_rightmostNode leftEntryNode];
    rightmostNode = v2->_rightmostNode;
    v2->_rightmostNode = (TLTimelineEntryNode *)v4;

    --v2->_count;
  }
  objc_sync_exit(v2);

  return count > 1;
}

- (BOOL)contractFromLeft
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t count = v2->_count;
  if (count >= 2)
  {
    uint64_t v4 = [(TLTimelineEntryNode *)v2->_leftmostNode rightEntryNode];
    leftmostNode = v2->_leftmostNode;
    v2->_leftmostNode = (TLTimelineEntryNode *)v4;

    --v2->_count;
  }
  objc_sync_exit(v2);

  return count > 1;
}

- (BOOL)shiftRight
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(TLTimelineSegment *)v2 expandToRight]) {
    BOOL v3 = [(TLTimelineSegment *)v2 contractFromLeft];
  }
  else {
    BOOL v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)shiftLeft
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(TLTimelineSegment *)v2 expandToLeft]) {
    BOOL v3 = [(TLTimelineSegment *)v2 contractFromRight];
  }
  else {
    BOOL v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (double)duration
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(TLTimelineEntryNode *)v2->_leftmostNode date];

  if (v3)
  {
    uint64_t v4 = [(TLTimelineEntryNode *)v2->_rightmostNode date];
    id v5 = [(TLTimelineEntryNode *)v2->_leftmostNode date];
    [v4 timeIntervalSinceDate:v5];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
  }
  objc_sync_exit(v2);

  return v7;
}

- (TLTimelineEntryNode)leftmostNode
{
  return self->_leftmostNode;
}

- (TLTimelineEntryNode)rightmostNode
{
  return self->_rightmostNode;
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightmostNode, 0);
  objc_storeStrong((id *)&self->_leftmostNode, 0);
}

@end