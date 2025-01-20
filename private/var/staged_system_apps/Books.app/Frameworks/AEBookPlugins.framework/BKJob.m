@interface BKJob
- (BKJob)init;
- (BOOL)isSentinel;
- (NSString)name;
- (void)setName:(id)a3;
- (void)setSentinel:(BOOL)a3;
@end

@implementation BKJob

- (BKJob)init
{
  v5.receiver = self;
  v5.super_class = (Class)BKJob;
  v2 = [(BKJob *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BKJob *)v2 setSentinel:0];
  }
  return v3;
}

- (BOOL)isSentinel
{
  return self->_sentinel;
}

- (void)setSentinel:(BOOL)a3
{
  self->_sentinel = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end