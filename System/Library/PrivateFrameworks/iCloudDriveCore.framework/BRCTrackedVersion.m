@interface BRCTrackedVersion
+ (id)trackedVersionFor:(id)a3 withEtagIfLoser:(id)a4 kind:(int)a5;
- (BOOL)isEqual:(id)a3;
- (BRFileObjectID)fileObjectID;
- (NSString)etagIfLoser;
- (int)kind;
- (unint64_t)hash;
@end

@implementation BRCTrackedVersion

+ (id)trackedVersionFor:(id)a3 withEtagIfLoser:(id)a4 kind:(int)a5
{
  v7 = (BRFileObjectID *)a3;
  v8 = (NSString *)a4;
  v9 = objc_alloc_init(BRCTrackedVersion);
  fileObjectID = v9->_fileObjectID;
  v9->_fileObjectID = v7;
  v11 = v7;

  etagIfLoser = v9->_etagIfLoser;
  v9->_etagIfLoser = v8;

  v9->_kind = a5;
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BRCTrackedVersion *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      fileObjectID = self->_fileObjectID;
      BOOL v8 = (!((unint64_t)fileObjectID | (unint64_t)v5->_fileObjectID)
         || -[BRFileObjectID isEqual:](fileObjectID, "isEqual:"))
        && ((etagIfLoser = self->_etagIfLoser, !((unint64_t)etagIfLoser | (unint64_t)v5->_etagIfLoser))
         || -[NSString isEqual:](etagIfLoser, "isEqual:"))
        && self->_kind == v5->_kind;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(BRFileObjectID *)self->_fileObjectID hash];
  NSUInteger v4 = [(NSString *)self->_etagIfLoser hash] ^ v3;
  v5 = [NSNumber numberWithInt:self->_kind];
  unint64_t v6 = v4 ^ [v5 hash];

  return v6;
}

- (BRFileObjectID)fileObjectID
{
  return self->_fileObjectID;
}

- (NSString)etagIfLoser
{
  return self->_etagIfLoser;
}

- (int)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etagIfLoser, 0);
  objc_storeStrong((id *)&self->_fileObjectID, 0);
}

@end