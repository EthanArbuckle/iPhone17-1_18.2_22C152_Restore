@interface RCPScreenSnapshot
- (RCPScreenSnapshot)init;
- (UIImage)snapshotImage;
- (id)description;
- (int64_t)index;
- (unint64_t)timestamp;
- (void)setIndex:(int64_t)a3;
- (void)setSnapshotImage:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation RCPScreenSnapshot

- (RCPScreenSnapshot)init
{
  v5.receiver = self;
  v5.super_class = (Class)RCPScreenSnapshot;
  v2 = [(RCPScreenSnapshot *)&v5 init];
  v2->_timestamp = mach_absolute_time();
  uint64_t v3 = init_i++;
  v2->_index = v3;
  return v2;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p timestamp=%llu>", v5, self, -[RCPScreenSnapshot timestamp](self, "timestamp")];

  return v6;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (UIImage)snapshotImage
{
  return self->_snapshotImage;
}

- (void)setSnapshotImage:(id)a3
{
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
}

@end