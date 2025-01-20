@interface TCCDAccessIndirectObject
+ (id)unusedIndirectObject;
- (TCCDAccessIndirectObject)initWithType:(int64_t)a3;
- (id)description;
- (int64_t)type;
- (void)setType:(int64_t)a3;
@end

@implementation TCCDAccessIndirectObject

+ (id)unusedIndirectObject
{
  if (qword_1000AC550 != -1) {
    dispatch_once(&qword_1000AC550, &stru_100095AF8);
  }
  v2 = (void *)qword_1000AC558;
  return v2;
}

- (TCCDAccessIndirectObject)initWithType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TCCDAccessIndirectObject;
  v4 = [(TCCDAccessIndirectObject *)&v7 init];
  v5 = v4;
  if (v4) {
    [(TCCDAccessIndirectObject *)v4 setType:a3];
  }
  return v5;
}

- (id)description
{
  if ([(TCCDAccessIndirectObject *)self type]) {
    return @"<Unknown>";
  }
  else {
    return @"Unused";
  }
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end