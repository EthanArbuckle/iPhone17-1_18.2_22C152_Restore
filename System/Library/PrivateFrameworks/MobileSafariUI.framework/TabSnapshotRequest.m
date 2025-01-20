@interface TabSnapshotRequest
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (NSObject)identifier;
- (TabSnapshotRequest)initWithSize:(CGSize)a3 topBackdropHeight:(double)a4 options:(unint64_t)a5;
- (TabSnapshotRequest)initWithSize:(CGSize)a3 topBackdropHeight:(double)a4 options:(unint64_t)a5 identifier:(id)a6;
- (double)topBackdropHeight;
- (unint64_t)hash;
- (unint64_t)options;
@end

@implementation TabSnapshotRequest

- (TabSnapshotRequest)initWithSize:(CGSize)a3 topBackdropHeight:(double)a4 options:(unint64_t)a5
{
  return -[TabSnapshotRequest initWithSize:topBackdropHeight:options:identifier:](self, "initWithSize:topBackdropHeight:options:identifier:", a5, 0, a3.width, a3.height, a4);
}

- (TabSnapshotRequest)initWithSize:(CGSize)a3 topBackdropHeight:(double)a4 options:(unint64_t)a5 identifier:(id)a6
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TabSnapshotRequest;
  v12 = [(TabSnapshotRequest *)&v18 init];
  v13 = v12;
  if (v12)
  {
    v12->_size.CGFloat width = width;
    v12->_size.CGFloat height = height;
    v12->_topBackdropHeight = a4;
    v12->_options = a5;
    uint64_t v14 = [v11 copyWithZone:0];
    identifier = v13->_identifier;
    v13->_identifier = v14;

    v16 = v13;
  }

  return v13;
}

- (unint64_t)hash
{
  return [self->_identifier hash] ^ (uint64_t)self->_size.width ^ (16 * (uint64_t)self->_size.height) ^ ((uint64_t)self->_topBackdropHeight << 8) ^ (self->_options << 12);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TabSnapshotRequest *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      identifier = self->_identifier;
      v7 = [(TabSnapshotRequest *)v5 identifier];
      if (![identifier isEqual:v7]) {
        goto LABEL_10;
      }
      [(TabSnapshotRequest *)v5 size];
      BOOL v9 = 0;
      if (self->_size.width != v10 || self->_size.height != v8) {
        goto LABEL_11;
      }
      unint64_t options = self->_options;
      if (options == [(TabSnapshotRequest *)v5 options])
      {
        double topBackdropHeight = self->_topBackdropHeight;
        [(TabSnapshotRequest *)v5 topBackdropHeight];
        BOOL v9 = topBackdropHeight == v13;
      }
      else
      {
LABEL_10:
        BOOL v9 = 0;
      }
LABEL_11:

      goto LABEL_12;
    }
    BOOL v9 = 0;
  }
LABEL_12:

  return v9;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)topBackdropHeight
{
  return self->_topBackdropHeight;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSObject)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end