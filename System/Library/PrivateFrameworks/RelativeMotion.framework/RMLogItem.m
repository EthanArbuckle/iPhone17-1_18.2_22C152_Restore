@interface RMLogItem
+ (BOOL)supportsSecureCoding;
- (RMLogItem)initWithCoder:(id)a3;
- (double)timestamp;
- (id)_initWithTimestamp:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RMLogItem

- (id)_initWithTimestamp:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RMLogItem;
  v4 = [(RMLogItem *)&v8 init];
  if (v4)
  {
    v5 = [[RMLogItemInternal alloc] initWithTimestamp:a3];
    id internalLogItem = v4->_internalLogItem;
    v4->_id internalLogItem = v5;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMLogItem)initWithCoder:(id)a3
{
  [a3 decodeDoubleForKey:@"kRMLogItemCodingKeyTimestamp"];
  return (RMLogItem *)-[RMLogItem _initWithTimestamp:](self, "_initWithTimestamp:");
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(RMLogItem *)self timestamp];
  return (id)objc_msgSend(v4, "initWithTimestamp:");
}

- (double)timestamp
{
  return *((double *)self->_internalLogItem + 1);
}

- (void).cxx_destruct
{
}

@end