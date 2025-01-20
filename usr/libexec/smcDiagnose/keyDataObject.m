@interface keyDataObject
- (double)valueDouble:(int64_t)a3;
- (id)keyString;
- (id)valueStr:(int64_t)a3;
- (int64_t)numValues;
- (keyDataObject)initWith:(id)a3;
- (keyDataObject)initWithT:(id)a3;
- (void)addToTimeArray:(double)a3 idx:(int64_t)a4;
- (void)addToValueArray:(id)a3 idx:(int64_t)a4;
@end

@implementation keyDataObject

- (keyDataObject)initWith:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)keyDataObject;
  v5 = [(keyDataObject *)&v11 init];
  if (v5)
  {
    uint64_t v6 = +[NSString stringWithString:v4];
    keyString = v5->keyString;
    v5->keyString = (NSString *)v6;

    uint64_t v8 = objc_opt_new();
    valueArray = v5->valueArray;
    v5->valueArray = (NSMutableArray *)v8;

    v5->type = 1;
  }

  return v5;
}

- (keyDataObject)initWithT:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)keyDataObject;
  v5 = [(keyDataObject *)&v11 init];
  if (v5)
  {
    uint64_t v6 = +[NSString stringWithString:v4];
    keyString = v5->keyString;
    v5->keyString = (NSString *)v6;

    uint64_t v8 = objc_opt_new();
    valueArray = v5->valueArray;
    v5->valueArray = (NSMutableArray *)v8;

    v5->type = 2;
  }

  return v5;
}

- (id)keyString
{
  return self->keyString;
}

- (id)valueStr:(int64_t)a3
{
  if (self->type == 1 && (unint64_t)[(NSMutableArray *)self->valueArray count] > a3)
  {
    v5 = [(NSMutableArray *)self->valueArray objectAtIndex:a3];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)valueDouble:(int64_t)a3
{
  if (self->type != 2 || (unint64_t)[(NSMutableArray *)self->valueArray count] <= a3) {
    return -1.0;
  }
  v5 = [(NSMutableArray *)self->valueArray objectAtIndex:a3];
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (int64_t)numValues
{
  return (int64_t)[(NSMutableArray *)self->valueArray count];
}

- (void)addToValueArray:(id)a3 idx:(int64_t)a4
{
  +[NSString stringWithString:](NSString, "stringWithString:", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)self->valueArray addObject:v5];
}

- (void)addToTimeArray:(double)a3 idx:(int64_t)a4
{
  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)self->valueArray addObject:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->valueArray, 0);

  objc_storeStrong((id *)&self->keyString, 0);
}

@end