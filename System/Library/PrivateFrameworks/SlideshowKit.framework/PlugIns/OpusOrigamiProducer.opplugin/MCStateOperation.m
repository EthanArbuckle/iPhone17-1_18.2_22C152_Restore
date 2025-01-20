@interface MCStateOperation
+ (id)stateOperationForTargetPlugObjectID:(id)a3 withStateKey:(id)a4;
- (BOOL)alwaysNotifies;
- (BOOL)recordsTime;
- (MCStateOperation)initWithImprint:(id)a3;
- (NSString)stateKey;
- (id)description;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setAlwaysNotifies:(BOOL)a3;
- (void)setRecordsTime:(BOOL)a3;
- (void)setStateKey:(id)a3;
@end

@implementation MCStateOperation

+ (id)stateOperationForTargetPlugObjectID:(id)a3 withStateKey:(id)a4
{
  id v6 = objc_alloc_init((Class)a1);
  [v6 setTargetObjectID:a3];
  [v6 setStateKey:a4];
  return v6;
}

- (MCStateOperation)initWithImprint:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MCStateOperation;
  v4 = -[MCAction initWithImprint:](&v6, "initWithImprint:");
  if (v4) {
    v4->_stateKey = (NSString *)[a3 objectForKey:@"stateKey"];
  }
  return v4;
}

- (void)demolish
{
  self->_stateKey = 0;
  v3.receiver = self;
  v3.super_class = (Class)MCStateOperation;
  [(MCAction *)&v3 demolish];
}

- (id)imprint
{
  v7.receiver = self;
  v7.super_class = (Class)MCStateOperation;
  id v3 = [(MCAction *)&v7 imprint];
  v4 = v3;
  stateKey = self->_stateKey;
  if (stateKey) {
    [v3 setObject:stateKey forKey:@"stateKey"];
  }
  return v4;
}

- (BOOL)alwaysNotifies
{
  return (LOBYTE(self->super._flags) >> 1) & 1;
}

- (void)setAlwaysNotifies:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->super._flags = self->super._flags & 0xFFFFFFFD | v3;
}

- (BOOL)recordsTime
{
  return (LOBYTE(self->super._flags) >> 2) & 1;
}

- (void)setRecordsTime:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->super._flags = self->super._flags & 0xFFFFFFFB | v3;
}

- (void)_copySelfToSnapshot:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MCStateOperation;
  -[MCAction _copySelfToSnapshot:](&v6, "_copySelfToSnapshot:");
  stateKey = self->_stateKey;
  if (stateKey) {
    *((void *)a3 + 3) = [(NSString *)stateKey copy];
  }
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MCStateOperation;
  return objc_msgSend(-[MCAction description](&v3, "description"), "stringByAppendingFormat:", @", %@", self->_stateKey);
}

- (NSString)stateKey
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStateKey:(id)a3
{
}

@end