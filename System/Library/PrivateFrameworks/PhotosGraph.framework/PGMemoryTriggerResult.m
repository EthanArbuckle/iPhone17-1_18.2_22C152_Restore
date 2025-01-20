@interface PGMemoryTriggerResult
- (NSDateInterval)validityInterval;
- (PGMemoryNodeProtocol)memoryNode;
- (PGMemoryTriggerResult)initWithMemoryNode:(id)a3 validityInterval:(id)a4;
- (id)description;
@end

@implementation PGMemoryTriggerResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validityInterval, 0);
  objc_storeStrong((id *)&self->_memoryNode, 0);
}

- (NSDateInterval)validityInterval
{
  return self->_validityInterval;
}

- (PGMemoryNodeProtocol)memoryNode
{
  return self->_memoryNode;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGMemoryTriggerResult;
  v4 = [(PGMemoryTriggerResult *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@: %@ - Validity: %@", v4, self->_memoryNode, self->_validityInterval];

  return v5;
}

- (PGMemoryTriggerResult)initWithMemoryNode:(id)a3 validityInterval:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGMemoryTriggerResult;
  v9 = [(PGMemoryTriggerResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memoryNode, a3);
    objc_storeStrong((id *)&v10->_validityInterval, a4);
  }

  return v10;
}

@end