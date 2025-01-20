@interface REDiffOperation
+ (id)deleteWithItem:(id)a3 atIndex:(int64_t)a4;
+ (id)insertWithItem:(id)a3 atIndex:(int64_t)a4;
+ (id)moveWithItem:(id)a3 fromIndex:(int64_t)a4 toIndex:(int64_t)a5;
+ (id)reloadWithItem:(id)a3 atIndex:(int64_t)a4;
- (REDiffOperation)initWithType:(unint64_t)a3 item:(id)a4 toIndex:(int64_t)a5 fromIndex:(int64_t)a6;
- (id)description;
- (id)item;
- (int64_t)fromIndex;
- (int64_t)toIndex;
- (unint64_t)type;
@end

@implementation REDiffOperation

- (REDiffOperation)initWithType:(unint64_t)a3 item:(id)a4 toIndex:(int64_t)a5 fromIndex:(int64_t)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)REDiffOperation;
  v12 = [(REDiffOperation *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_type = a3;
    objc_storeStrong(&v12->_item, a4);
    v13->_toIndex = a5;
    v13->_fromIndex = a6;
  }

  return v13;
}

+ (id)reloadWithItem:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithType:0 item:v6 toIndex:a4 fromIndex:0x7FFFFFFFFFFFFFFFLL];

  return v7;
}

+ (id)insertWithItem:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithType:1 item:v6 toIndex:a4 fromIndex:0x7FFFFFFFFFFFFFFFLL];

  return v7;
}

+ (id)deleteWithItem:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithType:2 item:v6 toIndex:0x7FFFFFFFFFFFFFFFLL fromIndex:a4];

  return v7;
}

+ (id)moveWithItem:(id)a3 fromIndex:(int64_t)a4 toIndex:(int64_t)a5
{
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)a1) initWithType:3 item:v8 toIndex:a5 fromIndex:a4];

  return v9;
}

- (id)description
{
  switch(self->_type)
  {
    case 0uLL:
      v3 = NSString;
      v4 = [(REDiffOperation *)self item];
      [v3 stringWithFormat:@" Reload %@ (%ld)", v4, -[REDiffOperation toIndex](self, "toIndex"), v12];
      goto LABEL_7;
    case 1uLL:
      id v6 = NSString;
      v4 = [(REDiffOperation *)self item];
      [v6 stringWithFormat:@" Insert %@ (%ld)", v4, -[REDiffOperation toIndex](self, "toIndex"), v12];
      goto LABEL_7;
    case 2uLL:
      v7 = NSString;
      v4 = [(REDiffOperation *)self item];
      [v7 stringWithFormat:@" Delete %@ (%ld)", v4, -[REDiffOperation fromIndex](self, "fromIndex"), v12];
      goto LABEL_7;
    case 3uLL:
      id v8 = NSString;
      v4 = [(REDiffOperation *)self item];
      [v8 stringWithFormat:@" Move %@ (%ld → %ld)", v4, -[REDiffOperation toIndex](self, "toIndex"), -[REDiffOperation fromIndex](self, "fromIndex")];
LABEL_7:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v5 = &stru_26CFA57D0;
      break;
  }
  v13.receiver = self;
  v13.super_class = (Class)REDiffOperation;
  v9 = [(REDiffOperation *)&v13 description];
  v10 = [v9 stringByAppendingString:v5];

  return v10;
}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)toIndex
{
  return self->_toIndex;
}

- (int64_t)fromIndex
{
  return self->_fromIndex;
}

- (id)item
{
  return self->_item;
}

- (void).cxx_destruct
{
}

@end